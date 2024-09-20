from copy import deepcopy

from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.preprocessing import StandardScaler, MinMaxScaler, RobustScaler, QuantileTransformer, PowerTransformer, \
    FunctionTransformer
import numpy as np


class LogScaleTransformer(BaseEstimator, TransformerMixin):
    def __init__(self, all_col_names, log_col_names=None, scale_col_names=None, scaler_type='standard'):
        self.all_col_names = all_col_names
        self.n_cols = len(self.all_col_names)
        self.log_col_names = log_col_names
        self.log_cols = [i for i, col in enumerate(self.all_col_names) if col in self.log_col_names]
        self.scale_col_names = scale_col_names
        self.scale_cols = [i for i, col in enumerate(self.all_col_names) if col in self.scale_col_names]
        self.scaler_type = scaler_type
        if scaler_type == 'standard':
            self.scaler = StandardScaler()
        elif scaler_type == 'minmax':
            self.scaler = MinMaxScaler()
        elif scaler_type == 'robust':
            self.scaler = RobustScaler()
        elif scaler_type == 'quantile_uniform':
            self.scaler = QuantileTransformer(output_distribution='uniform')
        elif scaler_type == 'quantile_normal':
            self.scaler = QuantileTransformer(output_distribution='normal')
        elif scaler_type == 'power_yeo-johnson':
            self.scaler = PowerTransformer(method='yeo-johnson')
        elif scaler_type == 'none':
            self.scaler = FunctionTransformer()
        else:
            raise ValueError('Invalid scaler type')

    def fit(self, X, y=None):
        # Log transform
        X_log = X.copy().reshape(-1, self.n_cols)
        if self.log_cols:
            X_log[:, self.log_cols] = np.log(X_log[:, self.log_cols])

        # Fit the scaler on the log-transformed data
        if self.scale_cols:
            self.scaler.fit(X_log[:, self.scale_cols])

        return self

    def transform(self, X, y=None):
        X_transformed = X.copy().reshape(-1, self.n_cols)

        # Apply log transform
        if self.log_cols:
            X_transformed[:, self.log_cols] = np.log(X_transformed[:, self.log_cols])

        # Apply scaling
        if self.scale_cols:
            X_transformed[:, self.scale_cols] = self.scaler.transform(X_transformed[:, self.scale_cols])

        if self.n_cols == 1:
            return X_transformed.ravel()
        else:
            return X_transformed

    def inverse_transform(self, X, y=None):
        X_inverse = X.copy().reshape(-1, self.n_cols)

        # Inverse scaling
        if self.scale_cols:
            X_inverse[:, self.scale_cols] = self.scaler.inverse_transform(X_inverse[:, self.scale_cols])

        # Inverse log transform
        if self.log_cols:
            X_inverse[:, self.log_cols] = np.exp(X_inverse[:, self.log_cols])

        if self.n_cols == 1:
            return X_inverse.ravel()
        else:
            return X_inverse


def get_features_targets(data, col_types):
    input_cols = col_types['input']['all']
    output_cols = col_types['output']['all']

    # Split data into input and output
    features_targets = {}
    for split, df in data.items():
        input_values = df[input_cols].astype('float').values
        output_values = df[output_cols].astype('float').values
        if output_values.shape[1] == 1:
            output_values = output_values.ravel()
        features_targets[split] = {
            'input': input_values,
            'output': output_values,
        }
    return features_targets


def get_single_output_col_types(col_types, output_col):
    return {
        'input': deepcopy(col_types['input']),
        'output': {
            'all': [output_col],
            'scale': [output_col] if output_col in col_types['output']['scale'] else [],
            'log': [output_col] if output_col in col_types['output']['log'] else [],
            'bounded01': [output_col] if output_col in col_types['output']['bounded01'] else [],
        }
    }


def scale_data(features_targets, col_types):
    # Scale the data
    scalers = {}
    # Transform the input
    input_cols = col_types['input']['all']
    input_log_cols = col_types['input']['log']
    input_scale_cols = col_types['input']['scale']
    scalers['input'] = LogScaleTransformer(
        all_col_names=input_cols,
        log_col_names=input_log_cols,
        scale_col_names=input_scale_cols
    ).fit(features_targets['train']['input'])

    # Transform the output
    output_cols = col_types['output']['all']
    output_log_cols = col_types['output']['log']
    output_scale_cols = col_types['output']['scale']
    scalers['output'] = LogScaleTransformer(
        all_col_names=output_cols,
        log_col_names=output_log_cols,
        scale_col_names=output_scale_cols
    ).fit(features_targets['train']['output'])

    scaled_data = {}
    for split in features_targets:
        scaled_data[split] = {
            'input': scalers['input'].transform(features_targets[split]['input']),
            'output': scalers['output'].transform(features_targets[split]['output']),
        }

    return scaled_data, scalers
