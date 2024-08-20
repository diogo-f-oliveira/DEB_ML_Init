from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.preprocessing import StandardScaler
import numpy as np


class LogScaleTransformer(BaseEstimator, TransformerMixin):
    def __init__(self, all_col_names, log_col_names=None, scale_col_names=None, remainder='passthrough'):
        self.all_col_names = all_col_names
        self.log_col_names = log_col_names
        self.log_cols = [i for i, col in enumerate(self.all_col_names) if col in self.log_col_names]
        self.scale_col_names = scale_col_names
        self.scale_cols = [i for i, col in enumerate(self.all_col_names) if col in self.scale_col_names]

        self.remainder = remainder
        self.scaler = StandardScaler()

    def fit(self, X, y=None):
        # Log transform
        X_log = X.copy()
        if self.log_cols:
            X_log[:, self.log_cols] = np.log(X_log[:, self.log_cols])

        # Fit the scaler on the log-transformed data
        if self.scale_cols:
            self.scaler.fit(X_log[:, self.scale_cols])

        return self

    def transform(self, X, y=None):
        X_transformed = X.copy()

        # Apply log transform
        if self.log_cols:
            X_transformed[:, self.log_cols] = np.log(X_transformed[:, self.log_cols])

        # Apply scaling
        if self.scale_cols:
            X_transformed[:, self.scale_cols] = self.scaler.transform(X_transformed[:, self.scale_cols])

        return X_transformed

    def inverse_transform(self, X, y=None):
        X_inverse = X.copy()

        # Inverse scaling
        if self.scale_cols:
            X_inverse[:, self.scale_cols] = self.scaler.inverse_transform(X_inverse[:, self.scale_cols])

        # Inverse log transform
        if self.log_cols:
            X_inverse[:, self.log_cols] = np.exp(X_inverse[:, self.log_cols])

        return X_inverse


def get_features_targets(data, col_types):
    input_cols = col_types['input']['all']
    output_cols = col_types['output']['all']

    # Split data into input and output
    features_targets = {}
    for split, df in data.items():
        features_targets[split] = {
            'input': df[input_cols].astype('float').values,
            'output': df[output_cols].astype('float').values
        }
    return features_targets


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
