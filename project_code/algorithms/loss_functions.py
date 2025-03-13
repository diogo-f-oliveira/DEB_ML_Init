import numpy as np
import torch
import torch.nn as nn

from ..inference.parameters import DEFAULT_VALUES, UPPER_BOUNDS
from ..data.prepare_data_pytorch import DEFAULT_TORCH_DTYPE


class MaskedMSELoss(nn.MSELoss):
    def __init__(self, size_average=None, reduce=None, reduction='mean'):
        super(MaskedMSELoss, self).__init__(size_average, reduce, reduction)
        self.size_average = size_average
        self.reduce = reduce
        self.reduction = reduction

    def forward(self, predictions, targets, mask):
        # Calculate element-wise squared errors
        errors = (predictions - targets) ** 2

        # Apply mask (outputs with mask=0 are excluded from loss)
        masked_errors = errors * mask

        # Calculate mean squared error manually (ignoring masked outputs)
        loss = masked_errors.sum() / mask.sum()

        return loss


class MSEInfeasibilityLoss(nn.Module):
    def __init__(self, col_types, output_transformer, lambdas=None):
        super(MSEInfeasibilityLoss, self).__init__()
        self.criterion = MaskedMSELoss()

        self.output_transformer = output_transformer

        # Compute upper bounds in model scale
        upper_bounds = torch.zeros(5, dtype=DEFAULT_TORCH_DTYPE)
        bounded_col_idx = torch.zeros(5, dtype=torch.long)
        for i, col in enumerate(['1-kap', 's_p_M', 's_Hb_j', 's_Hj_p', 's_Hb_p']):
            idx = col_types['output']['all'].index(col)
            bounded_col_idx[i] = idx
            upper_bound_par_scale = UPPER_BOUNDS[col_types['output']['all'][idx]]
            mean = self.output_transformer.mean[idx]
            std = self.output_transformer.std[idx]
            upper_bounds[i] = (np.log(upper_bound_par_scale) - mean) / std

        # Register as buffers so they can be moved to GPU
        self.register_buffer("upper_bounds", upper_bounds)
        self.register_buffer("bounded_col_idx", bounded_col_idx)

        if lambdas is None:
            lambdas = torch.ones([4], dtype=DEFAULT_TORCH_DTYPE)
        self.register_buffer("lambdas", lambdas)
        self.loss_values = torch.zeros(4, dtype=DEFAULT_TORCH_DTYPE)

    def forward(self, outputs, targets, mask):
        mse_loss = self.criterion(outputs, targets, mask)

        # kap must be smaller than 1
        kappa_loss = self.kappa_loss(outputs)
        # Must reach puberty
        reach_pub_loss = self.reach_puberty_loss(outputs)
        # Maturity levels must increase
        mat_levels_loss = self.maturity_levels_loss(outputs, mask)

        self.loss_values = torch.stack([mse_loss, kappa_loss, reach_pub_loss, mat_levels_loss])

        return torch.dot(self.loss_values, self.lambdas)

    def kappa_loss(self, outputs):
        kap_idx = self.bounded_col_idx[0]
        upper_bound = self.upper_bounds[0]
        return torch.mean(torch.square(torch.relu(outputs[:, kap_idx] - upper_bound)))

    def reach_puberty_loss(self, outputs):
        s_p_idx = self.bounded_col_idx[1]
        upper_bound = self.upper_bounds[1]
        return torch.mean(torch.square(torch.relu(outputs[:, s_p_idx] - upper_bound)))

    def maturity_levels_loss(self, outputs, mask):
        # Penalty for E_Hj > E_Hb
        idx_s_Hb_j = self.bounded_col_idx[2]
        ub_s_Hb_j = self.upper_bounds[2]
        penalty_s_Hb_j = mask[:, idx_s_Hb_j] * torch.square(torch.relu(outputs[:, idx_s_Hb_j] - ub_s_Hb_j))

        # Penalty for E_Hj > E_Hb
        idx_s_Hj_p = self.bounded_col_idx[3]
        ub_s_Hj_p = self.upper_bounds[3]
        penalty_s_Hj_p = torch.square(torch.relu(outputs[:, idx_s_Hj_p] - ub_s_Hj_p))

        # Penalty for E_Hp > E_Hb
        idx_s_Hb_p = self.bounded_col_idx[4]
        ub_s_Hb_p = self.upper_bounds[4]
        penalty_s_Hb_p = torch.square(torch.relu(outputs[:, idx_s_Hb_p] - ub_s_Hb_p))

        return torch.mean(penalty_s_Hb_j + penalty_s_Hj_p + penalty_s_Hb_p)


class MSEInfeasibiltyLossParameterScale(nn.Module):

    def __init__(self, scalers, col_types, lambdas=None, output_weights=None):
        super(MSEInfeasibiltyLossParameterScale, self).__init__()
        self.scalers = scalers

        input_cols = col_types['input']['all']
        output_cols = col_types['output']['all']
        self.input_col_idx = {col: i for i, col in enumerate(input_cols)}
        self.output_col_idx = {col: i for i, col in enumerate(output_cols)}

        if output_weights is None:
            output_weights = torch.ones(len(output_cols))
        self.output_weights = output_weights
        self.loss_values = None

        if lambdas is None:
            self.lambdas = torch.ones([4], dtype=torch.float32)
        else:
            self.lambdas = lambdas

    def weighted_mse_loss(self, y_pred, y_true):
        return torch.mean(self.output_weights * (y_true - y_pred) ** 2)

    def forward(self, outputs, targets):
        # Standard MSE loss
        weighted_mse_loss = self.weighted_mse_loss(outputs, targets)

        # Unscale inputs and outputs
        # inputs_unscaled = self.scalers['input'].inverse_transform(inputs)
        outputs_unscaled = self.scalers['output'].inverse_transform(outputs)

        # Maturity levels must increase
        mat_level_penalty = self.maturity_levels_loss(outputs_unscaled)
        # Efficiency must be smaller than 1
        efficiency_loss = self.efficiency_loss(outputs_unscaled)
        # Must reach puberty
        reach_pub_loss = self.reach_puberty_loss(outputs_unscaled)

        self.loss_values = torch.stack([weighted_mse_loss, mat_level_penalty, efficiency_loss, reach_pub_loss])

        return torch.dot(self.loss_values, self.lambdas)

    def maturity_levels_loss(self, outputs_unscaled):
        if 'E_Hb_p' in self.output_col_idx:
            b_p_mat_ratio = outputs_unscaled[:, self.output_col_idx['E_Hb_p']]
        elif 'E_Hb' in self.output_col_idx and 'E_Hp' in self.output_col_idx:
            E_Hb = outputs_unscaled[:, self.output_col_idx['E_Hb']]
            E_Hp = outputs_unscaled[:, self.output_col_idx['E_Hp']]
            b_p_mat_ratio = E_Hb / E_Hp

        b_p_loss = torch.sum(torch.relu(b_p_mat_ratio - 1) ** 2)

        return b_p_loss

    def efficiency_loss(self, outputs_unscaled):
        if 'kap' in self.output_col_idx:
            kap = outputs_unscaled[:, self.output_col_idx['kap']]
        elif '1-kap' in self.output_col_idx:
            kap = 1 - outputs_unscaled[:, self.output_col_idx['1-kap']]
        return torch.sum(torch.relu(kap - 1) ** 2)

    def reach_puberty_loss(self, outputs_unscaled):
        if 'kap' in self.output_col_idx:
            kap = outputs_unscaled[:, self.output_col_idx['kap']]
        elif '1-kap' in self.output_col_idx:
            kap = 1 - outputs_unscaled[:, self.output_col_idx['1-kap']]

        p_Am = outputs_unscaled[:, self.output_col_idx['p_Am']]
        p_M = outputs_unscaled[:, self.output_col_idx['p_M']]
        E_Hp = outputs_unscaled[:, self.output_col_idx['E_Hp']]
        left_hand_side = DEFAULT_VALUES['k_J'] * E_Hp * torch.pow(p_M, 2) / (
                (1 - kap + 1e-10) * torch.pow(kap, 2) * torch.pow(p_Am, 3))

        return torch.sum(torch.relu(left_hand_side - 1) ** 2)
