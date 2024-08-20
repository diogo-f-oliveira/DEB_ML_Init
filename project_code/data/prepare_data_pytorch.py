import torch
from torch.utils.data import TensorDataset, DataLoader


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
            self.std, self.mean = torch.std_mean(x_log[:, self.scale_cols], 0)

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


def prepare_data_tensors(data, col_types, batch_size):
    input_cols = col_types['input']['all']
    output_cols = col_types['output']['all']

    # Split data into input and output
    data_tensors = {}
    for split, df in data.items():
        data_tensors[split] = {
            'input': torch.tensor(df[input_cols].astype('float').values, dtype=torch.float32),
            'output': torch.tensor(df[output_cols].astype('float').values, dtype=torch.float32)
        }

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

    datasets = {}
    dataloaders = {}
    for split in data_tensors:
        datasets[split] = TensorDataset(
            scalers['input'].transform(data_tensors[split]['input']),
            scalers['output'].transform(data_tensors[split]['output']),
        )
        dataloaders[split] = DataLoader(
            datasets[split],
            batch_size=batch_size,
            shuffle=False if split == 'train' else True,
        )

    return dataloaders, datasets, scalers
