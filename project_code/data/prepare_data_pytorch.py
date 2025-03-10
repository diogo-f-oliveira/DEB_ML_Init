import torch
from sklearn.preprocessing import QuantileTransformer
from torch.utils.data import TensorDataset, DataLoader
from ..inference.parameters import impute_predictions_for_DEB_model_dependent_outputs

DEFAULT_TORCH_DTYPE = torch.float32


def get_output_mask(X, y, col_types):
    output_mask = torch.ones_like(y, dtype=DEFAULT_TORCH_DTYPE)
    metamorphosis_idx = col_types['input']['all'].index('metamorphosis')
    no_metamorphosis_mask = X[:, metamorphosis_idx] == 0

    for col in ['s_M', '1/s_M', 's_Hb_bj', 'E_Hj']:
        if col in col_types['output']['all']:
            col_idx = col_types['output']['all'].index(col)
            output_mask[no_metamorphosis_mask, col_idx] = 0

    return output_mask


class LogScaleTensorTransformer:
    def __init__(self, all_cols, log_cols=None, scale_cols=None):
        self.all_col_names = all_cols
        self.log_col_names = log_cols
        self.log_cols = [i for i, col in enumerate(self.all_col_names) if col in self.log_col_names]
        self.scale_col_names = scale_cols
        self.scale_cols = [i for i, col in enumerate(self.all_col_names) if col in self.scale_col_names]
        self.mean = None
        self.std = None

    def fit(self, x):
        x_log = x.clone()
        # Log transform
        if self.log_cols:
            x_log[:, self.log_cols] = torch.log(x_log[:, self.log_cols])

        # Fit the scaler on the log-transformed data
        if self.scale_cols:
            self.std, self.mean = torch.std_mean(x_log[:, self.scale_cols], dim=0)

        return self

    def transform(self, x):
        x_transformed = x.clone()

        # Apply log transform
        if self.log_cols:
            x_transformed[:, self.log_cols] = torch.log(x_transformed[:, self.log_cols])

        # Apply scaling
        if self.scale_cols:
            x_transformed[:, self.scale_cols] = (x_transformed[:, self.scale_cols] - self.mean) / self.std

        return x_transformed

    def inverse_transform(self, x):
        x_inverse = x.clone()

        # Inverse scaling
        if self.scale_cols:
            x_inverse[:, self.scale_cols] = x_inverse[:, self.scale_cols] * self.std + self.mean

        # Inverse log transform
        if self.log_cols:
            x_inverse[:, self.log_cols] = torch.exp(x_inverse[:, self.log_cols])

        return x_inverse


def log_standardize_data(data, col_types):
    input_cols = col_types['input']['all']
    output_cols = col_types['output']['all']

    # Split data into input and output
    data_tensors = {}
    for split, df in data.items():
        data_tensors[split] = {
            'input': torch.tensor(df[input_cols].astype('float').values, dtype=DEFAULT_TORCH_DTYPE),
            'output': torch.tensor(df[output_cols].astype('float').values, dtype=DEFAULT_TORCH_DTYPE),
        }

        data_tensors[split]['mask'] = get_output_mask(
            X=data_tensors[split]['input'],
            y=data_tensors[split]['output'],
            col_types=col_types
        )

    # Scale the data
    scalers = {}
    # Transform the input
    input_log_cols = col_types['input']['log']
    input_scale_cols = col_types['input']['scale']
    scalers['input'] = LogScaleTensorTransformer(
        all_cols=input_cols,
        log_cols=input_log_cols,
        scale_cols=input_scale_cols
    ).fit(data_tensors['train']['input'])

    # Transform the output
    output_log_cols = col_types['output']['log']
    output_scale_cols = col_types['output']['scale']
    scalers['output'] = LogScaleTensorTransformer(
        all_cols=output_cols,
        log_cols=output_log_cols,
        scale_cols=output_scale_cols
    ).fit(data_tensors['train']['output'])

    scaled_data_tensors = {}
    for split in data_tensors:
        scaled_data_tensors[split] = {}
        for subset in ('input', 'output'):
            scaled_data_tensors[split][subset] = scalers[subset].transform(data_tensors[split][subset])

    return data_tensors, scalers, scaled_data_tensors


class QuantileTensorTransformer:
    DTYPE = torch.float32

    def __init__(self, all_cols, quantile_cols=None):
        self.all_col_names = all_cols
        self.quantile_col_names = quantile_cols
        self.quantile_cols = [i for i, col in enumerate(self.all_col_names) if col in self.quantile_col_names]
        self.quantile_transformer = QuantileTransformer(random_state=42)

    def fit(self, x):
        x_quantile = x.copy()
        if self.quantile_cols:
            self.quantile_transformer.fit(x_quantile[:, self.quantile_cols])

        return self

    def transform(self, x):
        if torch.is_tensor(x):
            x = x.numpy()
        x_transformed = x.copy()
        if self.quantile_cols:
            x_transformed[:, self.quantile_cols] = self.quantile_transformer.transform(
                x_transformed[:, self.quantile_cols])
        return torch.tensor(x_transformed, dtype=DEFAULT_TORCH_DTYPE)

    def inverse_transform(self, x):
        if torch.is_tensor(x):
            x = x.numpy()
        x_inverse = x.copy()
        if self.quantile_cols:
            x_inverse[:, self.quantile_cols] = self.quantile_transformer.inverse_transform(
                x_inverse[:, self.quantile_cols])

        return torch.tensor(x_inverse, dtype=DEFAULT_TORCH_DTYPE)


def quantile_transform_data(data, col_types):
    data_tensors = {}
    scalers = {}
    scaled_data_tensors = {}
    for split, df in data.items():
        data_tensors[split] = {}
        scaled_data_tensors[split] = {}
        for subset in ('input', 'output'):
            subset_cols = col_types[subset]['all']

            # Convert original data to tensors
            data_tensors[split][subset] = torch.tensor(df[subset_cols].astype('float').values,
                                                       dtype=DEFAULT_TORCH_DTYPE)

            # Fit the quantile transformer
            if split == 'train':
                scalers[subset] = QuantileTensorTransformer(
                    all_cols=subset_cols,
                    quantile_cols=col_types[subset]['quantile'],
                ).fit(df[subset_cols].astype('float').values)

            # Transform the data
            scaled_data_tensors[split][subset] = scalers[subset].transform(data_tensors[split][subset])

    return data_tensors, scalers, scaled_data_tensors


def prepare_data_tensors(data, col_types, batch_size, scaling_type, device):
    if scaling_type == 'log_standardize':
        data_tensors, scalers, scaled_data_tensors = log_standardize_data(data, col_types)
    if scaling_type == 'quantile':
        data_tensors, scalers, scaled_data_tensors = quantile_transform_data(data, col_types)

    datasets = {}
    dataloaders = {}
    for split in data_tensors:
        # Move data to device
        data_tensors[split]['input'] = data_tensors[split]['input'].to(device)
        data_tensors[split]['output'] = data_tensors[split]['output'].to(device)
        data_tensors[split]['mask'] = data_tensors[split]['mask'].to(device)

        # Create dataset
        datasets[split] = TensorDataset(
            scalers['input'].transform(data_tensors[split]['input']),
            scalers['output'].transform(data_tensors[split]['output']),
            data_tensors[split]['mask'],
        )
        # Create dataloader
        dataloaders[split] = DataLoader(
            datasets[split],
            batch_size=batch_size if split == 'train' else len(datasets[split]),
            shuffle=True if split == 'train' else False,
        )

    return data_tensors, dataloaders, datasets, scalers
