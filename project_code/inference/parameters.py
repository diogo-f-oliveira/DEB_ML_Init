import numpy as np
import pandas as pd

from ..algorithms.theoretical import predict_E_G_from_theory

PARAMETER_COLS = ['p_Am', 'kap', 'v', 'p_M', 'E_Hb', 'E_Hp', 'k_J', 'E_Hj', 'E_Hx', 's_M']
AmP_CORE_DEB_PARS = ['z', 'p_M', 'kap', 'v', 'E_G', 'h_a', 'E_Hb', 'E_Hx', 'E_Hj', 'E_Hp', 'k_J']
DEFAULT_VALUES = {
    'h_a': 3.0e-9,
    'kap_G': 0.8,
    'mu_V': 500_000,
    'w_V': 23.9,
    'k_J': 0.002,
    's_M': 1,
}
UPPER_BOUNDS = {
    'kap': 1,
    '1-kap': 1,
    's_p': 0.8 ** 3,
    's_H': 1,
    's_M': 1,
}


def convert_output_to_parameter_predictions(y, output_col_names):
    pars_df = pd.DataFrame(y, columns=output_col_names)

    # If the model did not predict 'k_J', set it to default value
    if 'k_J' not in pars_df.columns:
        pars_df['k_J'] = DEFAULT_VALUES['k_J']

    # If the model did not predict 's_M', set it to default value
    if 's_M' not in pars_df.columns:
        pars_df['s_M'] = DEFAULT_VALUES['s_M']

    # If the model predicts '1-kap' instead of 'kap', compute 'kap'
    if 'kap' not in pars_df.columns and '1-kap' in pars_df.columns:
        pars_df['kap'] = 1 - pars_df['1-kap']
        pars_df.drop(columns=['1-kap'], inplace=True)

    # If the model predicts 's_H' instead of 'E_Hb', compute 'E_Hb'
    if 'E_Hb' not in pars_df.columns and {'s_H', 'E_Hp'}.issubset(pars_df.columns):
        pars_df['E_Hb'] = pars_df['s_H'] * pars_df['E_Hp']
        pars_df.drop(columns=['s_H'], inplace=True)

    # If the model predicts 's_p' instead of 'p_M', compute 'p_M'
    if 'p_M' not in pars_df.columns:
        if {'s_p', 'kap', 'E_Hp', 'p_Am'}.issubset(pars_df.columns):
            pars_df['p_M'] = np.sqrt(np.power(pars_df['s_p'] * pars_df['kap'], 2) * (1 - pars_df['kap']) *
                                     np.power(pars_df['p_Am'], 3) / pars_df['k_J'] / pars_df['E_Hp'])
            pars_df.drop(columns=['s_p'], inplace=True)

    # If the model did not predict 'E_Hj', set it to 1.05x 'E_Hb'
    if 'E_Hx' not in pars_df.columns and 'E_Hb' in pars_df.columns:
        pars_df['E_Hx'] = 1.05 * pars_df['E_Hb']

    # If the model did not predict 'E_Hj', set it to 1.05x 'E_Hb'
    if 'E_Hj' not in pars_df.columns and 'E_Hb' in pars_df.columns:
        pars_df['E_Hj'] = 1.05 * pars_df['E_Hb']

    pars_df = pars_df[PARAMETER_COLS].copy()

    return pars_df


def get_core_parameter_predictions(dfs, pred_df):
    # TODO: Call convert_output_to_parameter_predictions
    pars_df = pred_df.copy()
    pars_df.index.name = 'species'

    pars_df = convert_output_to_parameter_predictions(pars_df, pars_df.columns)

    # If the model predicts 'p_Am' instead of 'z', compute 'z'
    if 'z' not in pars_df.columns:
        if {'p_Am', 'p_M', 'kap'}.issubset(pars_df.columns):
            pars_df['z'] = pars_df['p_Am'] * pars_df['kap'] / pars_df['p_M']

    # If the model did not predict 'E_G', compute it from theory
    if 'E_G' not in pars_df.columns:
        for species in pars_df.index.values:
            pars_df.loc[species, 'E_G'] = predict_E_G_from_theory(
                d_V=dfs[pars_df.loc[species, 'data_split']].loc[species, 'd_V'],
                kap_G=DEFAULT_VALUES['kap_G'],
                mu_V=DEFAULT_VALUES['mu_V'],
                w_V=DEFAULT_VALUES['w_V'],
            )

    # Convert to float
    pars_df[AmP_CORE_DEB_PARS] = pars_df[AmP_CORE_DEB_PARS].astype('float')

    # Return only the predicitons for core parameters
    return pars_df[['data_split'] + AmP_CORE_DEB_PARS].copy()
