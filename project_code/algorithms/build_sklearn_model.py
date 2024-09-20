import numpy as np
from sklearn.base import BaseEstimator, RegressorMixin, clone
from sklearn.multioutput import MultiOutputRegressor
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import FunctionTransformer

from ..data.prepare_data_sklearn import LogScaleTransformer


class RegressorOnTransformedInput(RegressorMixin, BaseEstimator):
    def __init__(self, regressor, input_scaler_type, col_types):
        self.base_regressor = regressor
        self.regressor_ = None
        self.input_scaler_type = input_scaler_type
        self.input_transformer = LogScaleTransformer(
            all_col_names=col_types['input']['all'],
            log_col_names=col_types['input']['log'],
            scale_col_names=col_types['input']['scale'],
            scaler_type=input_scaler_type
        )
        self.col_types = col_types

    def fit(self, X, y, sample_weight=None):
        X_transformed = self.input_transformer.fit_transform(X)

        self.regressor_ = clone(self.base_regressor)

        self.regressor_.fit(X_transformed, y)

        return self

    def predict(self, X, y=None):
        X_transformed = self.input_transformer.transform(X)

        return self.regressor_.predict(X_transformed)


class RegressorOnTransformedTarget(RegressorOnTransformedInput):
    def __init__(self, regressor, input_scaler_type, output_scaler_type, col_types):
        super(RegressorOnTransformedTarget, self).__init__(regressor=regressor, input_scaler_type=input_scaler_type,
                                                           col_types=col_types)
        self.output_transformer = LogScaleTransformer(
            all_col_names=col_types['output']['all'],
            log_col_names=col_types['output']['log'],
            scale_col_names=col_types['output']['scale'],
            scaler_type=output_scaler_type,
        )
        self.output_scaler_type = output_scaler_type

    def fit(self, X, y, sample_weight=None):
        # Scale the target
        y_transformed = self.output_transformer.fit_transform(y)

        # Fit the model on the scaled target
        super(RegressorOnTransformedTarget, self).fit(X, y_transformed)
        return self

    def score(self, X, y, sample_weight=None):
        # Scale the target for scoring
        y_scaled = self.output_transformer.transform(y)

        # Score the model on the scaled target
        return super(RegressorOnTransformedTarget, self).score(X, y_scaled)


class BoundedRegressor(RegressorOnTransformedInput):
    def __init__(self, regressor, input_scaler_type, col_types, a=0, b=1, tol=1e-16):
        super(BoundedRegressor, self).__init__(regressor=regressor, input_scaler_type=input_scaler_type,
                                               col_types=col_types)
        self.a = a
        self.b = b
        self.tol = tol
        # Output transformer is just an identity function to ensure functionality with RegressorOnTransformedTarget
        self.output_transformer = FunctionTransformer(func=None, inverse_func=None)

    def bound_output(self, y):
        return np.minimum(self.b - self.tol, np.maximum(self.a + self.tol, y))

    def predict(self, X):
        # Predict using the fitted model
        y_pred = super(BoundedRegressor, self).predict(X)

        # Bound the output between a b
        return self.bound_output(y_pred)


def build_sklearn_model(regressor, col_types, input_scaler_type='standard', output_scaler_type='standard'):
    if len(col_types['output']['bounded01']):
        return BoundedRegressor(regressor=regressor, input_scaler_type=input_scaler_type, col_types=col_types)
    else:
        return RegressorOnTransformedTarget(regressor=regressor, input_scaler_type=input_scaler_type, col_types=col_types,
                                            output_scaler_type=output_scaler_type)
