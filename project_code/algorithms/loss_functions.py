import torch
import torch.nn as nn


class MSEInfeasibiltyLoss(nn.Module):
    w_V = 23.9
    mu_V = 550_000
    k_J = 0.002

    def __init__(self, scalers, col_types, lambdas=None):
        super(MSEInfeasibiltyLoss, self).__init__()
        self.mse_loss = nn.MSELoss()

        self.scalers = scalers

        input_cols = col_types['input']['all']
        output_cols = col_types['output']['all']
        self.input_col_idx = {col: i for i, col in enumerate(input_cols)}
        self.output_col_idx = {col: i for i, col in enumerate(output_cols)}

        if lambdas is None:
            self.lambdas = torch.ones([4], dtype=torch.float32)
        else:
            self.lambdas = lambdas

    def forward(self, outputs, targets, inputs):
        # Standard MSE loss
        mse_loss = self.mse_loss(outputs, targets)

        # Unscale inputs and outputs
        inputs_unscaled = self.scalers['input'].inverse_transform(inputs)
        outputs_unscaled = self.scalers['output'].inverse_transform(outputs)

        # Maturity levels must increase
        mat_level_penalty = self.maturity_levels_loss(outputs_unscaled)
        # Growth efficiency kap_G must be lower than 1
        kap_G_penalty = self.growth_efficiency_loss(inputs_unscaled, outputs_unscaled)
        # Must reach puberty
        reach_pub_loss = self.reach_puberty_loss(inputs_unscaled, outputs_unscaled)

        losses = torch.stack([mse_loss, mat_level_penalty, kap_G_penalty, reach_pub_loss])
        # losses = torch.stack([mse_loss, mat_level_penalty, kap_G_penalty])

        return torch.dot(losses, self.lambdas)

    def maturity_levels_loss(self, outputs_unscaled):
        b_p_mat_ratio = outputs_unscaled[:, self.output_col_idx['E_Hb']] / outputs_unscaled[:,
                                                                           self.output_col_idx['E_Hp']]
        b_bjx_mat_ratio = outputs_unscaled[:, self.output_col_idx['E_Hb']] / outputs_unscaled[:,
                                                                             self.output_col_idx['E_Hbjx']]
        bjx_p_mat_ratio = outputs_unscaled[:, self.output_col_idx['E_Hp']] / outputs_unscaled[:,
                                                                             self.output_col_idx['E_Hbjx']]

        b_p_loss = torch.sum(torch.relu(b_p_mat_ratio - 1))
        b_bjx_loss = torch.sum(torch.relu(b_bjx_mat_ratio - 1))
        bjx_p_loss = torch.sum(torch.relu(bjx_p_mat_ratio - 1))

        return b_p_loss + b_bjx_loss + bjx_p_loss

    def growth_efficiency_loss(self, inputs_unscaled, outputs_unscaled):
        # Assume standard composition
        M_V = inputs_unscaled[:, self.input_col_idx['d_V']] / self.w_V
        kap_G = self.mu_V * M_V / outputs_unscaled[:, self.output_col_idx['E_G']]

        return torch.sum(torch.relu(kap_G - 1))

    def reach_puberty_loss(self, inputs, outputs_unscaled):
        s_M_cubed = (1 + (inputs[:, self.input_col_idx['Wwbjx']] / inputs[:, self.input_col_idx['Wwb']] - 1) *
                     inputs[:, self.input_col_idx['metamorphosis']])
        # with torch.no_grad():
        #     b_idx = self.input_col_idx['Wwb']
        #     bjx_idx = self.input_col_idx['Wwbjx']
        #     log_Wwbjx = inputs[:, bjx_idx] * self.input_scaler.std[bjx_idx] + self.input_scaler.mean[bjx_idx]
        #     log_Wwb = inputs[:, b_idx] * self.input_scaler.std[b_idx] + self.input_scaler.mean[b_idx]
        #     s_M_cubed = torch.exp(log_Wwbjx - log_Wwb)
        kap = outputs_unscaled[:, self.output_col_idx['kap']]
        p_Am = outputs_unscaled[:, self.output_col_idx['p_Am']]
        p_M = outputs_unscaled[:, self.output_col_idx['p_M']]
        E_Hp = outputs_unscaled[:, self.output_col_idx['E_Hp']]
        left_hand_side = self.k_J * E_Hp * torch.pow(p_M, 2) / (
                (1 - kap + 1e-10) * torch.pow(kap, 2) * torch.pow(p_Am, 3) * s_M_cubed)

        return torch.sum(torch.relu(left_hand_side - 1))
