import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
from ..data.prepare_data_pytorch import DEFAULT_TORCH_DTYPE
from ..inference.parameters import UPPER_BOUNDS


class DEBNet(nn.Module):
    BIAS_INITIAL_VALUE = 0.1

    def __init__(self, col_types, shared_hidden_layers, par_hidden_layers, dropout_prob, output_transformer,
                 input_transformer, use_skip_connection=True):
        super(DEBNet, self).__init__()

        self.n_inputs = len(col_types['input']['all'])
        self.input_transformer = input_transformer
        self.output_transformer = output_transformer
        self.use_skip_connection = use_skip_connection
        # Shared hidden layers
        layers = []
        prev_dim = self.n_inputs
        for hidden_dim in shared_hidden_layers:
            # Create and initialize layer
            hidden_layer = nn.Linear(prev_dim, hidden_dim)
            nn.init.kaiming_normal_(tensor=hidden_layer.weight, nonlinearity='relu')
            nn.init.constant_(tensor=hidden_layer.bias, val=self.BIAS_INITIAL_VALUE)
            # Append layer with ReLu activation and dropout
            layers.append(hidden_layer)
            layers.append(nn.ReLU())
            layers.append(nn.Dropout(p=dropout_prob))
            prev_dim = hidden_dim
        self.shared_layers = nn.Sequential(*layers)

        # Separate hidden layers for each output
        self.n_outputs = len(col_types['output']['all'])
        self.par_hidden_layers = nn.ModuleList()
        for _ in range(self.n_outputs):
            layers = []
            prev_dim = shared_hidden_layers[-1] + self.use_skip_connection * self.n_inputs
            # Create hidden layers for each output parameter
            for hidden_dim in par_hidden_layers:
                hidden_layer = nn.Linear(prev_dim, hidden_dim)
                nn.init.kaiming_normal_(tensor=hidden_layer.weight, nonlinearity='relu')
                nn.init.constant_(tensor=hidden_layer.bias, val=self.BIAS_INITIAL_VALUE)
                layers.append(hidden_layer)
                layers.append(nn.ReLU())
                layers.append(nn.Dropout(p=dropout_prob))
                prev_dim = hidden_dim
            # Create the output parameter layer
            par_output_layer = nn.Linear(prev_dim, 1)
            nn.init.xavier_normal_(par_output_layer.weight)
            nn.init.constant_(tensor=par_output_layer.bias, val=self.BIAS_INITIAL_VALUE)
            layers.append(par_output_layer)
            self.par_hidden_layers.append(nn.Sequential(*layers))

    def forward(self, x):
        shared_out = self.shared_layers(x)
        if self.use_skip_connection:
            input_par_layers = torch.cat([shared_out, x], dim=1)
        else:
            input_par_layers = shared_out
        outputs = [layer(input_par_layers).squeeze(-1) for layer in self.par_hidden_layers]
        return torch.stack(outputs, dim=-1)

    def predict(self, x):
        if not torch.is_tensor(x):
            x = torch.tensor(x, dtype=DEFAULT_TORCH_DTYPE)
        with torch.no_grad():
            x_model_scale = self.input_transformer.transform(x)
            y_pred_model_scale = self(x_model_scale)

            return self.output_transformer.inverse_transform(y_pred_model_scale)


class LogScaleOutputClamp(nn.Module):
    EPSILON = 1e-6  # Approximately equal in both log and linear scale

    def __init__(self, bounded_col_idx, upper_bounds, clamp_type='logsigmoid'):
        super(LogScaleOutputClamp, self).__init__()

        # Convert upper_bounds to a tensor and register as buffer
        if not torch.is_tensor(upper_bounds):
            upper_bounds = torch.tensor(upper_bounds, dtype=DEFAULT_TORCH_DTYPE)
        self.register_buffer("upper_bounds", upper_bounds)

        # Convert bounded_col_idx to a tensor for indexing and register as buffer
        self.register_buffer("bounded_col_idx", torch.tensor(bounded_col_idx, dtype=torch.long))

        if clamp_type == 'logsigmoid':
            self.clamp_function = self.clamp_logsigmoid
        elif clamp_type == 'relu':
            self.clamp_function = self.clamp_relu
        elif clamp_type == 'softplus':
            self.clamp_function = self.clamp_softplus
        else:
            raise ValueError("Unsupported clamp_type.")

    def forward(self, x):
        if self.bounded_col_idx.numel() == 0:
            # No bounded columns; return x as is
            return x

        # Extract the bounded outputs
        raw_bounded = x[:, self.bounded_col_idx]

        # Apply the clamp with epsilon
        clamped_bounded = self.clamp_function(raw_bounded)

        # Clone the input to avoid in-place modifications
        x_clamped = x.clone()

        # Replace the bounded indices with clamped values
        x_clamped[:, self.bounded_col_idx] = clamped_bounded

        return x_clamped

    def clamp_logsigmoid(self, x):
        return self.upper_bounds + F.logsigmoid(x) - self.EPSILON

    def clamp_relu(self, x):
        return self.upper_bounds - F.relu(x) - self.EPSILON

    def clamp_softplus(self, x):
        return self.upper_bounds - F.softplus(x) - self.EPSILON


class DEBNetHC(DEBNet):
    def __init__(self, col_types, shared_hidden_layers, par_hidden_layers, dropout_prob, output_transformer,
                 input_transformer, use_skip_connection=True, clamp_function='logsigmoid'):
        super(DEBNetHC, self).__init__(col_types, shared_hidden_layers, par_hidden_layers, dropout_prob,
                                       output_transformer, input_transformer, use_skip_connection=use_skip_connection)
        self.log_bounded_col_indices = [i for i, col in enumerate(col_types['output']['all']) if
                                        (col in col_types['output']['bounded01']) and
                                        (col in col_types['output']['log'])]
        # Compute upper bounds in standardized log scale as -mu/sigma
        upper_bounds = torch.zeros(len(self.log_bounded_col_indices), )
        for i, idx in enumerate(self.log_bounded_col_indices):
            upper_bound_par_scale = UPPER_BOUNDS[col_types['output']['all'][idx]]
            mean = self.output_transformer.mean[idx]
            std = self.output_transformer.std[idx]
            upper_bounds[i] = (np.log(upper_bound_par_scale) - mean) / std

        # Create clamp
        self.clamp = LogScaleOutputClamp(bounded_col_idx=self.log_bounded_col_indices,
                                         upper_bounds=upper_bounds,
                                         clamp_type=clamp_function)

    def forward(self, x):
        # Compute predictions from NN, output is unbounded
        y_unbounded = super(DEBNetHC, self).forward(x)
        # Clamp output to be smaller than 1
        y = self.clamp(y_unbounded)
        return y
