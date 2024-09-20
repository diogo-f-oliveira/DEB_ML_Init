import inspect
import os
import random
from copy import deepcopy
from functools import partial
from datetime import datetime as dt

import numpy as np
import ray
from ray.tune import CLIReporter
from ray.tune.schedulers import ASHAScheduler
from ray.tune.search.bayesopt import BayesOptSearch
from ray.tune.search.hyperopt import HyperOptSearch
from sklearn.model_selection import GridSearchCV, cross_val_score, KFold, StratifiedKFold
from tabulate import tabulate
import pandas as pd
import pickle

from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor, GradientBoostingRegressor, AdaBoostRegressor
from sklearn.linear_model import LinearRegression, Ridge, ElasticNet, Lasso
from sklearn.multioutput import MultiOutputRegressor
from sklearn.svm import SVR
import sklearn.metrics as metrics
import xgboost as xgb

from ..train.train_sklearn_model import train_sklearn_model
from ..utils.results import create_results_directories_for_dataset
from ..algorithms.build_sklearn_model import build_sklearn_model
from ..data.load_data import load_data, load_col_types
from ..data.prepare_data_sklearn import get_features_targets, get_single_output_col_types
from ..evaluate.prediction_error import compute_metrics
from ..evaluate.score import make_unscaled_scorer, mean_deb_loss

from ray import train, tune


def format_param_grid(param_grid, model):
    if model.regressor.named_steps['model'].__class__.__name__ == 'MultiOutputRegressor':
        param_base_str = 'regressor__model__estimator'
    else:
        param_base_str = 'regressor__model'
    # Format the param grid
    formatted_param_grid = {}
    for param_name, param_options in param_grid.items():
        if param_name == 'scaler_type':
            formatted_param_grid[f'regressor__input_transformer__{param_name}'] = param_options
            formatted_param_grid[f'output_transformer__{param_name}'] = param_options
        else:
            formatted_param_grid[f"{param_base_str}__{param_name}"] = param_options
    # param_grid = {'regressor__model__' + param: options for param, options in param_grid.items()}
    return formatted_param_grid


def save_model(model, folder, filename):
    with open(os.path.join(folder, filename), 'wb') as f:
        pickle.dump(model, f)


def evaluate_on_data(data, col_types, model, print_score=False, save_score=False, results_save_path=None):
    y_pred_test = model.predict(data['input']).reshape(-1, 1)
    y_pred_unscaled_test = model.output_transformer.inverse_transform(y_pred_test).reshape(-1, 1)
    y_true_test = model.output_transformer.transform(data['output']).reshape(-1, 1)
    y_true_unscaled_test = data['output'].reshape(-1, 1)

    r2_test_score = model.score(data['input'], data['output'])
    output_metrics_df = compute_metrics(
        y_true=y_true_test,
        y_pred=y_pred_test,
        metrics=['r2_score',
                 'mean_squared_error',
                 'max_error'],
        output_col_names=col_types['output']['all'],
    )
    unscaled_metrics_df = compute_metrics(
        y_true=y_true_unscaled_test,
        y_pred=y_pred_unscaled_test,
        metrics=['mean_absolute_percentage_error',
                 'mean_gamma_deviance',
                 ('d2_score', partial(metrics.d2_tweedie_score, power=2)),
                 mean_deb_loss],
        output_col_names=col_types['output']['all'],
    )

    metrics_df = pd.concat([output_metrics_df, unscaled_metrics_df], axis=1)

    if print_score:
        print("Test set")
        print(f"R^2 score: {r2_test_score:.4f}")
        print(tabulate(metrics_df, headers='keys', tablefmt='simple'))

    if save_score:
        # test_performance_save_folder = os.path.join(save_folder, 'test_performance')
        # metrics_df.to_csv(os.path.join(test_performance_save_folder, f"{best_model_name}.csv"))
        metrics_df.to_csv(results_save_path)


def grid_search_calibration(base_model, search_space, data, col_types, scorer=None,
                            save_best_model=True, save_folder='', print_best_model=True, evaluate_on_test=True,
                            verbose=0,
                            **model_kwargs):
    # Build model so that input and output are scaled
    model = build_sklearn_model(base_model=base_model, col_types=col_types, **model_kwargs)
    # Format the param grid
    formatted_param_grid = format_param_grid(search_space, model)

    # Set up the GridSearchCV
    grid_search = GridSearchCV(model, formatted_param_grid, cv=5, scoring=scorer, verbose=verbose, n_jobs=-1,
                               return_train_score=True)

    # Fit the model
    grid_search.fit(data['train']['input'], data['train']['output'])

    if print_best_model:
        # Best parameters found
        print("Best parameters found: ", grid_search.best_params_)
        print(f"Best score: {grid_search.best_score_:.4f}")

    formatted_score = format(grid_search.best_score_, '.4f').replace('.', '')
    best_model_name = f'R2_{formatted_score}_{base_model.__class__.__name__}'
    if save_best_model:
        save_model(grid_search.best_estimator_,
                   folder=os.path.join(save_folder, 'models'),
                   filename=f"{best_model_name}.pkl")

    if evaluate_on_test:
        test_performance_save_folder = os.path.join(save_folder, 'test_performance')
        test_performance_save_file = os.path.join(test_performance_save_folder, f"{best_model_name}.csv")
        evaluate_on_data(data=data['test'],
                         col_types=col_types,
                         model=grid_search.best_estimator_,
                         print_score=print_best_model,
                         save_score=save_best_model,
                         results_save_path=test_performance_save_file)

    return grid_search


def evaluate_config(config, base_model, col_types, X_train, y_train, random_state=42, n_splits=5, stratify=None):
    if random_state in inspect.signature(base_model.__init__).parameters:
        config['random_state'] = random_state
    # configured_base_model = base_model(**config)
    # model = build_sklearn_model(base_model=configured_base_model, col_types=col_types)
    if stratify is None:
        cv = KFold(n_splits=n_splits, random_state=random_state, shuffle=True)
        stratify_col = None
    elif isinstance(stratify, (list, int, tuple)):
        stratify_col = np.apply_along_axis(lambda row: '_'.join(row), 1, X_train[:, stratify].astype(str))
        cv = StratifiedKFold(n_splits=n_splits, random_state=random_state, shuffle=True)
    scores = []
    for i, (train_index, val_index) in enumerate(cv.split(X_train, stratify_col)):
        # Get fold training data
        fold_data = {
            'input': X_train[train_index],
            'output': y_train[train_index],
        }
        # Train model
        model = train_sklearn_model(
            base_model=base_model,
            config=config,
            col_types=col_types,
            data=fold_data,
            random_state=random_state
        )
        # Evaluate on fold validation data
        r2_score = model.score(X_train[val_index], y_train[val_index])
        scores.append(r2_score)
        # Report metrics
        train.report({f'r2': np.mean(scores)})

    # scores = cross_val_score(model, X_train, y_train, cv=cv, scoring=None, n_jobs=1,
    #                          )
    # Report the CV R2 score to Ray Tune
    train.report({f'r2': np.mean(scores)})


def hyperopt_calibration(base_model, search_space, data, col_types, current_best_params=None,
                         num_samples=100, metric='r2', mode='max',
                         run_name=None, evaluate_on_test=False, print_test_score=False, save_best_model=False,
                         save_folder='', random_state=42, **evaluate_config_options):
    if run_name is None:
        f"{'__'.join(col_types['output']['all'])}__{base_model.__name__}__{dt.now().strftime('%Y-%m-%d_%H-%M-%S')}"
    alg = HyperOptSearch(metric=metric, mode=mode,
                         points_to_evaluate=current_best_params, random_state_seed=random_state)

    tuner = tune.Tuner(
        partial(evaluate_config, base_model=base_model, col_types=col_types,
                X_train=data['train']['input'], y_train=data['train']['output'], **evaluate_config_options),
        tune_config=tune.TuneConfig(
            search_alg=alg,
            num_samples=num_samples,
            trial_dirname_creator=lambda t: t.trial_id,
            scheduler=ASHAScheduler(metric=metric, mode=mode, grace_period=2, max_t=6),
        ),
        run_config=train.RunConfig(
            name=run_name,
            verbose=1,
            progress_reporter=CLIReporter(
                metric=metric, mode=mode,
                metric_columns=[metric],
                parameter_columns=list(search_space.keys()),
                sort_by_metric=True,
                max_report_frequency=60,
            )
            # storage_path=f"{save_folder}/model_calibration",
        ),
        param_space=search_space
    )
    results = tuner.fit()

    best_result = results.get_best_result(metric=metric, mode=mode)

    best_model = train_sklearn_model(
        base_model=base_model,
        config=best_result.config,
        col_types=col_types,
        data=data['train'],
        random_state=random_state
    )
    formatted_score = format(best_result.metrics[metric], '.4f').replace('.', '')
    best_model_name = f'R2_{formatted_score}_{base_model.__name__}'

    print("Best parameters found: ", best_result.config)
    print(f"Best score: {best_result.metrics[metric]:.4f}")

    if save_best_model:
        save_model(best_model,
                   folder=os.path.join(save_folder, 'models'),
                   filename=f"{best_model_name}.pkl")

    if evaluate_on_test:
        test_performance_save_folder = os.path.join(save_folder, 'test_performance')
        test_performance_save_file = os.path.join(test_performance_save_folder, f"{best_model_name}.csv")
        evaluate_on_data(data=data['test'],
                         col_types=col_types,
                         model=best_model,
                         print_score=print_test_score,
                         save_score=save_best_model,
                         results_save_path=test_performance_save_file)

    return best_model


def calibrate_independent_output_models(base_model, search_space, dataset_name, calibration_function,
                                        dfs=None, col_types=None, save_folder=None,
                                        **calibration_function_kwargs):
    if dfs is None:
        dfs = load_data(dataset_name=dataset_name, data_split='train_test')
    if col_types is None:
        col_types = load_col_types(dataset_name=dataset_name)

    if save_folder is None:
        save_folder = f'results/{dataset_name}'
        create_results_directories_for_dataset(dataset_name, output_cols=col_types['output']['all'])

    for i, col in enumerate(col_types['output']['all']):
        if col in []:
            continue
        so_col_types = get_single_output_col_types(col_types=col_types, output_col=col)
        so_data = get_features_targets(data=dfs, col_types=so_col_types)
        so_save_folder = f'{save_folder}/{col}'
        param_search_space = search_space.copy()
        if len(so_col_types['output']['bounded01']) and 'output_scaler_type' in param_search_space:
            param_search_space.pop('output_scaler_type')
        print(f'\n\nCalibrating submodel for output {col}')

        calibration_function(base_model=base_model,
                             search_space=param_search_space,
                             data=so_data,
                             col_types=so_col_types,
                             save_folder=so_save_folder,
                             **calibration_function_kwargs
                             )


if __name__ == '__main__':
    seed = 42
    np.random.seed(seed)
    random.seed(seed)

    # dataset_name = 'no_pub_weight'
    # dataset_name = 'ratio_no_pub_weight'
    # dataset_name = 'ratio_output_no_pub_weight'

    # dataset_name = 'no_pub_age'
    dataset_name = 'ratio_output_no_pub_age'

    # dataset_name = 'bijection_input'

    dataset_name += '_taxonomy'
    dataset_name += '_ecocodes'

    # Load the data
    dfs = load_data(dataset_name=dataset_name, data_split='train_test')
    col_types = load_col_types(dataset_name=dataset_name)
    data = get_features_targets(dfs, col_types)
    deb_model_dummy_cols = ['metamorphosis', 'weaning']
    deb_model_column_indices = [dfs['train'].columns.get_loc(col) for col in deb_model_dummy_cols]

    os.environ['RAY_AIR_NEW_OUTPUT'] = '0'

    # base_model = Ridge(random_state=seed)
    # base_model = Lasso(random_state=seed, max_iter=10000)
    # param_grid = {
    #     'alpha': [1e-4, 5e-3, 1e-3, 5e-3, 1e-2, 5e-2, 1e-1, 0.5, 1, 5]
    # }

    base_model = RandomForestRegressor
    search_space = {
        'n_estimators': tune.qrandint(100, 10000, 100),
        'min_samples_split': tune.randint(2, 7),
        'max_features': tune.randint(2, len(col_types['input']['all']) + 1),
        'criterion': tune.choice(['squared_error', 'friedman_mse']),
    }
    calibrate_independent_output_models(base_model=base_model,
                                        search_space=search_space,
                                        dataset_name=dataset_name,
                                        calibration_function=hyperopt_calibration,
                                        dfs=dfs,
                                        col_types=col_types,
                                        evaluate_on_test=True,
                                        print_test_score=True,
                                        save_best_model=True,
                                        num_samples=100,
                                        stratify=deb_model_column_indices,
                                        )

    base_model = Ridge
    # base_model = Lasso
    search_space = {'alpha': tune.loguniform(1e-4, 1e4)}
    calibrate_independent_output_models(base_model=base_model,
                                        search_space=search_space,
                                        dataset_name=dataset_name,
                                        calibration_function=hyperopt_calibration,
                                        dfs=dfs,
                                        col_types=col_types,
                                        evaluate_on_test=True,
                                        print_test_score=True,
                                        save_best_model=True,
                                        num_samples=100,
                                        stratify=deb_model_column_indices,
                                        )

    # base_model = RandomForestRegressor(n_jobs=-1, random_state=seed)
    # param_grid = {
    #     'n_estimators': [500, 1000, 1500],
    #     'min_samples_split': [2, 3],
    #     'max_features': [3, 4, 5],
    #     'criterion': ['squared_error', 'friedman_mse'],
    # # }
    #    current_best_params = {
    #     'p_Am': {'n_estimators': 1000, 'min_samples_split': 3, 'max_features': 4, 'criterion': 'squared_error'},
    #     'kap': {'n_estimators': 500, 'min_samples_split': 2, 'max_features': 5, 'criterion': 'squared_error'},
    #     'v': {'n_estimators': 500, 'min_samples_split': 2, 'max_features': 5, 'criterion': 'friedman_mse'},
    #     'p_M': {'n_estimators': 1500, 'min_samples_split': 2, 'max_features': 3, 'criterion': 'friedman_mse'},
    #     'h_a': {'n_estimators': 500, 'min_samples_split': 2, 'max_features': 5, 'criterion': 'friedman_mse'},
    #     'E_Hb': {'n_estimators': 500, 'min_samples_split': 2, 'max_features': 5, 'criterion': 'squared_error'},
    #     'E_Hbjx': {'n_estimators': 500, 'min_samples_split': 2, 'max_features': 5, 'criterion': 'friedman_mse'},
    #     'E_Hp': {'n_estimators': 500, 'min_samples_split': 3, 'max_features': 5, 'criterion': 'friedman_mse'},
    # }

    # base_model = SVR()
    # param_grid = {
    #     'kernel': ['rbf', 'sigmoid'],
    #     'C': [1, 3, 9],
    #     'epsilon': [0.01, 0.1, 1],
    #     'gamma': ['scale', 0.05, 0.5],
    # }
    base_model = SVR
    search_space = {
        'kernel': tune.choice(['linear', 'rbf']),
        'C': tune.loguniform(1e-3, 1e2),
        'epsilon': tune.uniform(0.01, 1),
        'gamma': tune.uniform(0.01, 2),
    }
    # current_best_params = {
    #     'p_Am': {'kernel': 'rbf', 'gamma': 0.10597850244208856, 'C': 3, 'epsilon': 0.1},
    #     'kap': {'kernel': 'rbf', 'gamma': 0.10597850244208856, 'C': 9, 'epsilon': 0.01},
    #     'v': {'kernel': 'rbf', 'gamma': 0.10597850244208856, 'C': 6, 'epsilon': 0.5},
    #     'p_M': {'kernel': 'rbf', 'gamma': 0.5, 'C': 1, 'epsilon': 0.1},
    #     'h_a': {'kernel': 'rbf', 'gamma': 0.5, 'C': 9, 'epsilon': 0.1},
    #     'E_Hb': {'kernel': 'rbf', 'gamma': 0.10597850244208856, 'C': 6, 'epsilon': 0.1},
    #     'E_Hbjx': {'kernel': 'rbf', 'gamma': 0.10597850244208856, 'C': 3, 'epsilon': 0.1},
    #     'E_Hp': {'kernel': 'rbf', 'gamma': 0.10597850244208856, 'C': 9, 'epsilon': 0.1},
    #     # 'E_Hb_bjx': None,
    #     # 'E_Hbjx_p': None,
    # }

    # base_model = xgb.XGBRegressor()
    # param_grid = {
    #     'n_estimators': [1500, 2000, 2500],
    #     'learning_rate': [0.0005, 0.001, 0.005, 0.01],
    #     'grow_policy': ['depthwise', 'lossguide']
    # }
    # base_model = xgb.XGBRegressor
    # search_space = {
    #     'n_estimators': tune.qrandint(100, 10000, 100),
    #     'learning_rate': tune.loguniform(1e-4, 1e-1),
    #     "max_depth": tune.randint(3, 10),
    #     'grow_policy': tune.choice(['depthwise', 'lossguide']),
    #     "subsample": tune.uniform(0.5, 1.0),
    #     "colsample_bytree": tune.uniform(0.5, 1.0),
    # }
    current_best_params = {}

    # model_kwargs = {
    #     # 'scaler_type': 'power_yeo-johnson',
    #     'scaler_type': 'standard',
    #     # 'scaler_type': 'minmax',
    # }

    # search_space['input_scaler_type'] = tune.choice(
    #     ['standard', 'minmax', 'quantile_uniform', 'quantile_normal', 'none'])
    # search_space['output_scaler_type'] = tune.choice(
    #     ['standard', 'minmax', 'quantile_uniform', 'quantile_normal', 'none'])

    # grid_search = grid_search_calibration(base_model=base_model,
    #                                       param_grid=param_grid,
    #                                       data=sub_data,
    #                                       col_types=sub_col_types,
    #                                       # dataset_name=dataset_name,
    #                                       scorer=scorer,
    #                                       save_best_model=True,
    #                                       save_folder=save_folder,
    #                                       print_best_model=True,
    #                                       evaluate_on_test=True,
    #                                       verbose=1,
    #                                       )

    calibrate_independent_output_models(base_model=base_model,
                                        search_space=search_space,
                                        dataset_name=dataset_name,
                                        calibration_function=hyperopt_calibration,
                                        dfs=dfs,
                                        col_types=col_types,
                                        evaluate_on_test=True,
                                        print_test_score=True,
                                        save_best_model=True,
                                        num_samples=100,
                                        stratify=deb_model_column_indices,
                                        )

    # hyperopt_calibration(base_model=base_model,
    #                      search_space=search_space,
    #                      data=sub_data,
    #                      col_types=sub_col_types,
    #                      run_name=f"{col}__{base_model.__name__}__"
    #                               f"{dt.now().strftime('%Y-%m-%d_%H-%M-%S')}",
    #                      current_best_params=[current_best_params[col]] if col in current_best_params else None,
    #
    #                      save_folder=save_folder,
    #                      )

    # evaluate_config(
    #     config={
    #         'n_estimators': 500,
    #         'min_samples_split': 3,
    #         'max_features': 4,
    #         'criterion': 'friedman_mse',
    #     },
    #     base_model=base_model,
    #     col_types=sub_col_types,
    #     X_train=sub_data['train']['input'],
    #     y_train=sub_data['train']['output'],
    # )
    #
    # base_model = MultiOutputRegressor(estimator=RandomForestRegressor(), n_jobs=-1)
    # param_grid = {
    #     'estimator__n_estimators': [500, 750, 1000],
    #     'estimator__min_samples_split': [2, ],
    #     'estimator__max_features': [4, 5],
    # }

    # base_model = MultiOutputRegressor(estimator=xgb.XGBRegressor(), n_jobs=-1)
    # param_grid = {
    #     'estimator__n_estimators': [1000, 2000],
    #     'estimator__learning_rate': [0.005, 0.01, 0.05],
    #     'estimator__grow_policy': ['depthwise', 'lossguide']
    # }

    # base_model = MultiOutputRegressor(estimator=SVR(), n_jobs=-1)
    # param_grid = {
    #     'estimator__kernel': ['rbf',],
    #     'estimator__C': [5],
    #     'estimator__epsilon': [0.01],
    #     'estimator__gamma': [1.5],
    # }

    # print(pd.DataFrame(grid_search.cv_results_).sort_values(by='mean_test_score', ascending=False).iloc[1])

    # n_rows = 3
    # n_cols = 3
    # fig, axes = plt.subplots(nrows=n_rows, ncols=n_cols, figsize=(20, 12))
    # for i, estimator in enumerate(grid_search.best_estimator_.regressor_.named_steps['model'].estimators_):
    #     importances = pd.DataFrame({'importance': estimator.feature_importances_,
    #                                 'input_col': col_types['input']['all']})
    #     ax = axes[i // n_cols, i % n_cols]
    #     sns.barplot(data=importances, x='input_col', y='importance', ax=ax)
    #     ax.set_xlabel(col_types['output']['all'][i])
    #
    # fig.show()

    # base_model = MultiOutputRegressor(estimator=GradientBoostingRegressor(), n_jobs=-1)
    # param_grid = {
    #     'estimator__n_estimators': [1500],
    #     'estimator__learning_rate': [0.01],
    #     'estimator__max_depth': [4],
    # }

    #
    # calibrate_sklearn_model(base_model=base_model, param_grid=param_grid, data=data, col_types=col_types)
