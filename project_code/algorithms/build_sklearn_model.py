from sklearn.base import BaseEstimator, RegressorMixin, clone

from ..data.prepare_data_sklearn import LogScaleClipTransformer


class RegressorOnTransformedInput(RegressorMixin, BaseEstimator):
    def __init__(self, regressor, input_scaler_type, col_types):
        self.regressor = regressor
        self.regressor_ = None
        self.input_scaler_type = input_scaler_type
        self.input_transformer = LogScaleClipTransformer(
            all_col_names=col_types['input']['all'],
            log_col_names=col_types['input']['log'],
            clip_col_names=col_types['input']['bounded01'],
            scale_col_names=col_types['input']['scale'],
            scaler_type=input_scaler_type
        )
        self.col_types = col_types

    def fit(self, X, y, sample_weight=None):
        X_model_scale = self.input_transformer.fit_transform(X)

        self.regressor_ = clone(self.regressor)

        self.regressor_.fit(X_model_scale, y)

        return self

    def predict(self, X, y=None):
        X_model_scale = self.input_transformer.transform(X)

        return self.regressor_.predict(X_model_scale)


class RegressorOnTransformedTarget(RegressorOnTransformedInput):
    def __init__(self, regressor, input_scaler_type, output_scaler_type, col_types):
        super(RegressorOnTransformedTarget, self).__init__(regressor=regressor, input_scaler_type=input_scaler_type,
                                                           col_types=col_types)
        self.output_transformer = LogScaleClipTransformer(
            all_col_names=col_types['output']['all'],
            log_col_names=col_types['output']['log'],
            clip_col_names=col_types['output']['bounded01'],
            scale_col_names=col_types['output']['scale'],
            scaler_type=output_scaler_type,
        )
        self.output_scaler_type = output_scaler_type

    def fit(self, X, y, sample_weight=None):
        # Scale the target
        y_model_scale = self.output_transformer.fit_transform(y)

        # Fit the model on the scaled target
        # Inputs are scaled as well inside the RegressorOnTransformedInput.fit() method
        super(RegressorOnTransformedTarget, self).fit(X, y_model_scale)
        return self

    def predict(self, X, y=None):
        # Predict the output using the scaled input (scaled inside the RegressorOnTransformedInput.predict() method)
        y_pred_model_scale = super(RegressorOnTransformedTarget, self).predict(X)

        # Predict in parameter scale
        y_pred_par_scale = self.output_transformer.inverse_transform(y_pred_model_scale)

        return y_pred_par_scale

    def score(self, X, y, sample_weight=None):
        # Scale the target for scoring
        y_transformed = self.output_transformer.transform(y)

        # Score the model on the scaled target
        return super(RegressorOnTransformedTarget, self).score(X, y_transformed)


def build_sklearn_model(regressor, col_types, input_scaler_type='standard', output_scaler_type='standard'):
    return RegressorOnTransformedTarget(regressor=regressor, input_scaler_type=input_scaler_type,
                                        col_types=col_types,
                                        output_scaler_type=output_scaler_type)
