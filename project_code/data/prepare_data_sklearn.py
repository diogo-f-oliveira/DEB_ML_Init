from copy import deepcopy

from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.preprocessing import StandardScaler, MinMaxScaler, RobustScaler, QuantileTransformer, PowerTransformer, \
    FunctionTransformer
import numpy as np

from ..inference.parameters import get_parameter_mask


class LogScaleClipTransformer(BaseEstimator, TransformerMixin):
    def __init__(self, all_col_names, log_col_names=None, clip_col_names=None, scale_col_names=None,
                 scaler_type='standard', a=0 + 1e-10, b=1 - 1e-10):
        self.all_col_names = all_col_names
        self.n_cols = len(self.all_col_names)
        # Columns to apply logarithm transformation
        self.log_col_names = log_col_names
        self.log_cols = [i for i, col in enumerate(self.all_col_names) if col in self.log_col_names]

        # Columns to scale
        self.scale_col_names = scale_col_names
        self.scale_cols = [i for i, col in enumerate(self.all_col_names) if col in self.scale_col_names]

        # Columns to clip between a and b
        self.a, self.b = a, b
        self.clip_col_names = clip_col_names
        self.clip_only_cols = [i for i, col in enumerate(self.all_col_names) if
                               col in self.clip_col_names and col not in self.log_col_names]
        self.log_clip_cols = [i for i, col in enumerate(self.all_col_names) if
                              col in self.clip_col_names and col in self.log_col_names]

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
        X_log, flattened = self.unflatten_matrix_if_needed(X)

        if self.log_cols:
            X_log[:, self.log_cols] = np.log(X_log[:, self.log_cols].astype('float'))

        # Fit the scaler on the log-transformed data
        if self.scale_cols:
            self.scaler.fit(X_log[:, self.scale_cols])

        return self

    def clip_model_scale(self, X):
        X_clipped, flattened = self.unflatten_matrix_if_needed(X)

        if self.clip_only_cols:
            X_clipped[:, self.clip_only_cols] = np.clip(X_clipped[:, self.clip_only_cols], self.a, self.b)
        if self.log_clip_cols:
            X_clipped[:, self.log_clip_cols] = np.clip(X_clipped[:, self.log_clip_cols], np.log(self.a), np.log(self.b))

        if flattened:
            return X_clipped.ravel()
        else:
            return X_clipped

    def clip_parameter_scale(self, X):
        X_clipped, flattened = self.unflatten_matrix_if_needed(X)
        if self.clip_only_cols:
            X_clipped[:, self.clip_only_cols] = np.clip(X_clipped[:, self.clip_only_cols], self.a, self.b)
        if self.log_clip_cols:
            X_clipped[:, self.log_clip_cols] = np.clip(X_clipped[:, self.log_clip_cols], self.a, self.b)

        if flattened:
            return X_clipped.ravel()
        else:
            return X_clipped

    def transform(self, X, y=None):
        X_transformed, flattened = self.unflatten_matrix_if_needed(X)

        # Apply log transform
        if self.log_cols:
            X_transformed[:, self.log_cols] = np.log(X_transformed[:, self.log_cols].astype('float'))

        # Apply scaling
        if self.scale_cols:
            X_transformed[:, self.scale_cols] = self.scaler.transform(X_transformed[:, self.scale_cols])

        # # Apply clipping
        # X_transformed = self.clip(X_transformed)

        if flattened:
            return X_transformed.ravel()
        else:
            return X_transformed

    def inverse_transform(self, X, y=None):
        X_inverse, flattened = self.unflatten_matrix_if_needed(X)

        # Inverse scaling
        if self.scale_cols:
            X_inverse[:, self.scale_cols] = self.scaler.inverse_transform(X_inverse[:, self.scale_cols])

        # Inverse log transform
        if self.log_cols:
            X_inverse[:, self.log_cols] = np.exp(X_inverse[:, self.log_cols])

        X_inverse = self.clip_parameter_scale(X_inverse)

        if flattened:
            return X_inverse.ravel()
        else:
            return X_inverse

    def unflatten_matrix_if_needed(self, X):
        X_unflatten = X.copy()
        if X.ndim == 1 or self.n_cols == 1:
            X_unflatten = X_unflatten.reshape(-1, 1)
            flattened = True
        else:
            flattened = False
        return X_unflatten, flattened


def get_output_mask(df, col_types):
    output_cols = col_types['output']['all']
    mask_cols = col_types['mask']['all']
    output_mask = np.ones((df.shape[0], len(output_cols)))

    for idx, col in enumerate(output_cols):
        mask_col = f'estim_{col}'
        if mask_col not in df.columns or mask_col not in mask_cols:
            raise Warning(f"Mask column for output {col} is missing, assuming no mask is needed.")
        no_estim_mask = ~df[mask_col].values
        output_mask[no_estim_mask, idx] = 0

    return output_mask


def get_output_mask_old(df, col_types):
    output_cols = col_types['output']['all']
    mask_cols = col_types['mask']['all']
    output_mask = np.ones((df.shape[0], len(output_cols)))

    # Columns only for `abj` species
    if 'metamorphosis' in mask_cols:
        no_metamorphosis_mask = ~df['metamorphosis'].values
        for col in ['s_M', '1/s_M', 's_Hb_bj', 'E_Hj', 's_Hb_j', 's_Hj_p']:
            if col in output_cols:
                col_idx = output_cols.index(col)
                output_mask[no_metamorphosis_mask, col_idx] = 0
        if {'s_Hb_p', 's_Hb_j', 's_Hj_p'}.issubset(output_cols):
            s_Hb_p_idx = output_cols.index('s_Hb_p')
            output_mask[~no_metamorphosis_mask, s_Hb_p_idx] = 0

    # Non-estimated k_J
    if 'estim_k_J' in mask_cols and 'k_J' in output_cols:
        no_estim_k_J_mask = ~df['estim_k_J'].values
        k_J_idx = output_cols.index('k_J')
        output_mask[no_estim_k_J_mask, k_J_idx] = 0

    return output_mask


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
        # Compute output mask
        mask = get_output_mask(df=df, col_types=col_types)
        param_mask = get_parameter_mask(df=df, col_types=col_types)
        # Pack data
        features_targets[split] = {
            'input': input_values,
            'output': output_values,
            'mask': mask,
            'param_mask': param_mask
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
            'quantile': [output_col] if output_col in col_types['output']['quantile'] else [],
        }
    }


def scale_data(features_targets, col_types):
    # Scale the data
    scalers = {}
    # Transform the input
    input_cols = col_types['input']['all']
    input_log_cols = col_types['input']['log']
    input_scale_cols = col_types['input']['scale']
    scalers['input'] = LogScaleClipTransformer(
        all_col_names=input_cols,
        log_col_names=input_log_cols,
        scale_col_names=input_scale_cols
    ).fit(features_targets['train']['input'])

    # Transform the output
    output_cols = col_types['output']['all']
    output_log_cols = col_types['output']['log']
    output_scale_cols = col_types['output']['scale']
    scalers['output'] = LogScaleClipTransformer(
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
