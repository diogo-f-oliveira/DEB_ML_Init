import numpy as np
import torch
from sklearn.base import BaseEstimator, RegressorMixin, clone
from sklearn.compose import TransformedTargetRegressor
from sklearn.model_selection import GridSearchCV
from sklearn.pipeline import Pipeline
from tabulate import tabulate
import pandas as pd

from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor, GradientBoostingRegressor
from sklearn.linear_model import LinearRegression, Ridge, ElasticNet, Lasso
from sklearn.svm import SVR
from sklearn.metrics import d2_tweedie_score

from ..data.load_data import load_data, load_col_types
from ..data.prepare_data_sklearn import get_features_targets, LogScaleTransformer
from ..evaluate.prediction_error import multioutput_error


class RegressorOnTransformedTarget(BaseEstimator, RegressorMixin):
    def __init__(self, output_transformer=None, regressor=None):
        self.output_transformer = output_transformer
        self.regressor = regressor
        self.regressor_ = None
        if 'input_transformer' in self.regressor.named_steps:
            self.input_transformer = self.regressor.named_steps['input_transformer']

    def fit(self, X, y):
        # Scale the target
        y_scaled = self.output_transformer.fit_transform(y)

        # Clone the model to ensure a fresh instance is used in GridSearchCV
        self.regressor_ = clone(self.regressor)

        # Fit the model on the scaled target
        self.regressor_.fit(X, y_scaled)
        return self

    def predict(self, X):
        # Predict using the fitted model
        return self.regressor_.predict(X)

    def score(self, X, y):
        # Scale the target for scoring
        y_scaled = self.output_transformer.transform(y)

        # Score the model on the scaled target
        return self.regressor_.score(X, y_scaled)


def calibrate_sklearn_model(base_model, param_grid, data, col_types):
    # Define the pipeline for scaling the input features
    input_pipeline = Pipeline([
        ('input_transformer', LogScaleTransformer(
            all_col_names=col_types['input']['all'],
            log_col_names=col_types['input']['log'],
            scale_col_names=col_types['input']['scale'],
        )),  # Scale input features
        ('model', base_model)  # Ridge regression model
    ])

    # Define the TransformedTargetRegressor for scaling the target variable
    model = RegressorOnTransformedTarget(
        regressor=input_pipeline,  # Apply the input pipeline to the regressor
        output_transformer=LogScaleTransformer(
            all_col_names=col_types['output']['all'],
            log_col_names=col_types['output']['log'],
            scale_col_names=col_types['output']['scale'],
        )  # Scale the target variable
    )

    # Fix the param grid
    param_grid = {'regressor__model__' + param: options for param, options in param_grid.items()}

    # Set up the GridSearchCV
    grid_search = GridSearchCV(model, param_grid, cv=5, scoring=None, verbose=4)

    # Fit the model
    grid_search.fit(data['train']['input'], data['train']['output'])

    # Best parameters found
    print("Best parameters found: ", grid_search.best_params_)

    # Evaluate the model on the test set
    best_model = grid_search.best_estimator_
    y_pred_test = best_model.predict(data['test']['input'])
    y_pred_unscaled_test = best_model.output_transformer.inverse_transform(y_pred_test)
    y_true_test = best_model.output_transformer.transform(data['test']['output'])
    y_true_unscaled_test = data['test']['output']
    r2_test_score = grid_search.score(data['test']['input'], data['test']['output'])
    d2_test_scores = np.zeros(shape=(len(col_types['output']['all']),))
    for i in range(len(col_types['output']['all'])):
        d2_test_scores[i] = d2_tweedie_score(y_true=y_true_unscaled_test[:, i], y_pred=y_pred_unscaled_test[:, i],
                                             power=2)
    print("Test set")
    print(f"R^2 score: {r2_test_score:.4f}\nD^2 score:{np.mean(d2_test_scores):.4f}")

    # Evaluate errors on each parameter

    metrics_df, mean_metrics_df = multioutput_error(
        y_true=y_true_test,
        y_pred=y_pred_test,
        output_metrics=['r2_score', 'mean_squared_error'],
        parameter_metrics=['mean_absolute_percentage_error', 'mean_gamma_deviance'],
        output_transformer=best_model.output_transformer,
        output_col_names=col_types['output']['all'],
    )
    metrics_df['d2_score'] = d2_test_scores
    print(tabulate(metrics_df, headers='keys', tablefmt='simple'))
    print(tabulate(mean_metrics_df, headers='keys', tablefmt='simple'))


if __name__ == '__main__':
    dataset_name = 'no_pub_weight'
    dfs = load_data(dataset_name=dataset_name, data_split='train_test')
    col_types = load_col_types(dataset_name=dataset_name)
    data = get_features_targets(dfs, col_types)

    calibrate_sklearn_model(
        base_model=Ridge(),
        param_grid={
            'alpha': [0.001, 0.005, 0.01, 0.05, 0.1],
        },
        data=data,
        col_types=col_types
    )
    # base_model = ElasticNet()
    # param_grid = {
    #     'alpha': [0.0001, 0.001, 0.01],
    #     'l1_ratio': [0.1, 0.2, 0.5]
    # }
    base_model = RandomForestRegressor()
    param_grid = {
        'n_estimators': [250, 500, 1000],
        'min_samples_split': [2, 4, 6],
        'max_features': [2, 3, 4],
    }

    calibrate_sklearn_model(base_model=base_model, param_grid=param_grid, data=data, col_types=col_types)
