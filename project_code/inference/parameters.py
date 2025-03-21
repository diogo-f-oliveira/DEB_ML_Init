import numpy as np
import pandas as pd
import torch

from ..algorithms.theoretical import predict_E_G_from_theory
from ..data.prepare_data_sklearn import get_output_mask

PARAMETER_COLS = ['p_Am', 'kap', 'v', 'p_M', 'E_Hb', 'E_Hj', 'E_Hp', 'k_J', 's_M']
MODEL_DEPENDENT_PARAMETER_COLS = ['E_Hj', 's_M']
AmP_CORE_DEB_PARS = ['z', 'p_M', 'kap', 'v', 'E_G', 'E_Hb', 'E_Hx', 'E_Hj', 'E_Hp', 'k_J']
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
    's_p_M': 1 ** 3,
    's_H': 1,
    's_Hb_bj': 1,
    's_Hbj_p': 1,
    's_Hb_p': 1,
    's_Hb_j': 1,
    's_Hj_p': 1,
    '1/s_M': 1,
}


def impute_predictions_old(y, X, y_true, col_types, default_k_J=DEFAULT_VALUES['k_J']):
    if torch.is_tensor(y):
        y = y.clone()
    else:
        y = y.copy()

    metamorphosis_idx = col_types['input']['all'].index('metamorphosis')
    no_metamorphosis_mask = X[:, metamorphosis_idx] == 0.0
    # Impute values for s_M
    if 's_M' in col_types['output']['all']:
        s_M_idx = col_types['output']['all'].index('s_M')
        y[no_metamorphosis_mask, s_M_idx] = y_true[no_metamorphosis_mask, s_M_idx]
    elif '1/s_M' in col_types['output']['all']:
        s_M_idx = col_types['output']['all'].index('1/s_M')
        y[no_metamorphosis_mask, s_M_idx] = y_true[no_metamorphosis_mask, s_M_idx]

    # Impute values for s_Hb_bj or E_Hj
    if 's_Hb_bj' in col_types['output']['all']:
        s_Hb_bj_idx = col_types['output']['all'].index('s_Hb_bj')
        y[no_metamorphosis_mask, s_Hb_bj_idx] = y_true[no_metamorphosis_mask, s_Hb_bj_idx]
    elif 'E_Hj' in col_types['output']['all'] and 'E_Hb' in col_types['output']['all']:
        E_Hb_idx = col_types['output']['all'].index('E_Hb')
        E_Hj_idx = col_types['output']['all'].index('E_Hj')
        y[no_metamorphosis_mask, E_Hj_idx] = y_true[no_metamorphosis_mask, E_Hb_idx]

    if 'k_J' in col_types['output']['all']:
        k_J_idx = col_types['output']['all'].index('k_J')
        default_k_J_mask = y_true[:, k_J_idx] == default_k_J
        y[default_k_J_mask, k_J_idx] = y_true[default_k_J_mask, k_J_idx]

    return y


def impute_predictions(y, y_true, mask):
    if torch.is_tensor(y):
        y_imputed = y.clone()
    else:
        y_imputed = y.copy()
    imputation_mask = mask == 0
    y_imputed[imputation_mask] = y_true[imputation_mask]

    return y_imputed


def convert_output_to_parameter_predictions(y, y_true, mask, col_types):
    y_imputed = impute_predictions(y=y, y_true=y_true, mask=mask)
    pars_df = pd.DataFrame(y_imputed, columns=col_types['output']['all'])

    # If the model did not predict 's_M', set it to default value
    if 's_M' not in pars_df.columns:
        if '1/s_M' in pars_df.columns:
            pars_df['s_M'] = 1 / pars_df['1/s_M']
            pars_df.drop(columns=['1/s_M'], inplace=True)
        else:
            pars_df['s_M'] = DEFAULT_VALUES['s_M']

    # If the model predicts '1-kap' instead of 'kap', compute 'kap'
    if 'kap' not in pars_df.columns and '1-kap' in pars_df.columns:
        pars_df['kap'] = 1 - pars_df['1-kap']
        pars_df.drop(columns=['1-kap'], inplace=True)

    if 'E_Hj' not in pars_df.columns and 'E_Hb' not in pars_df.columns:
        pars_df['E_Hb'] = np.nan
        pars_df['E_Hj'] = np.nan
        if {'s_Hb_p', 'E_Hp'}.issubset(pars_df.columns):
            s_Hb_p_mask = np.asarray(mask[:, col_types['output']['all'].index('s_Hb_p')]) == 1
            pars_df.loc[s_Hb_p_mask, 'E_Hb'] = pars_df.loc[s_Hb_p_mask, 'E_Hp'] * pars_df.loc[s_Hb_p_mask, 's_Hb_p'] * (1-1e-10)
            pars_df.loc[s_Hb_p_mask, 'E_Hj'] = pars_df.loc[s_Hb_p_mask, 'E_Hp'] * pars_df.loc[s_Hb_p_mask, 's_Hb_p'] * (1-1e-10)
            pars_df.drop(columns=['s_Hb_p'], inplace=True)
        if {'s_Hb_j', 's_Hj_p', 'E_Hp'}.issubset(pars_df.columns):
            s_Hb_j_mask = np.asarray(mask[:, col_types['output']['all'].index('s_Hb_j')]) == 1
            s_Hj_p_mask = np.asarray(mask[:, col_types['output']['all'].index('s_Hj_p')]) == 1
            pars_df.loc[s_Hj_p_mask, 'E_Hj'] = pars_df.loc[s_Hj_p_mask, 'E_Hp'] * pars_df.loc[s_Hj_p_mask, 's_Hj_p'] * (1-1e-10)
            pars_df.loc[s_Hj_p_mask, 'E_Hb'] = pars_df.loc[s_Hb_j_mask, 'E_Hj'] * pars_df.loc[s_Hj_p_mask, 's_Hb_j'] * (1-1e-10)
            pars_df.drop(columns=['s_Hb_j', 's_Hj_p'], inplace=True)

    # If the model did not predict 'E_Hj',
    if 'E_Hj' not in pars_df.columns:
        if {'s_Hbj_p', 'E_Hp'}.issubset(pars_df.columns):
            pars_df['E_Hj'] = pars_df['s_Hbj_p'] * pars_df['E_Hp']
            pars_df.drop(columns=['s_Hbj_p'], inplace=True)
        # set it to 1.05x 'E_Hb'
        elif 'E_Hb' in pars_df.columns:
            pars_df['E_Hj'] = 1.05 * pars_df['E_Hb']

    if 'E_Hb' not in pars_df.columns:
        # If the model predicts 's_H' instead of 'E_Hb', compute 'E_Hb'
        if {'s_H', 'E_Hp'}.issubset(pars_df.columns):
            pars_df['E_Hb'] = pars_df['s_H'] * pars_df['E_Hp']
            pars_df.drop(columns=['s_H'], inplace=True)
        # If the model predicts 's_Hb_bj' instead of 'E_Hb', compute 'E_Hb'
        elif {'s_Hb_bj', 'E_Hj'}.issubset(pars_df.columns):
            pars_df['E_Hb'] = pars_df['s_Hb_bj'] * pars_df['E_Hj']
            pars_df.drop(columns=['s_Hb_bj'], inplace=True)

    # If the model predicts 's_p' instead of 'p_M', compute 'p_M'
    if 'p_M' not in pars_df.columns:
        if {'s_p', 'kap', 'E_Hp', 'p_Am', 'k_J'}.issubset(pars_df.columns):
            pars_df['p_M'] = np.sqrt(
                pars_df['s_p'] * np.power(pars_df['kap'], 2) * (1 - pars_df['kap']) * np.power(pars_df['p_Am'], 3)
                /
                pars_df['k_J'] / pars_df['E_Hp']
            )
            pars_df.drop(columns=['s_p'], inplace=True)
        elif {'s_p_M', 's_M', 'kap', 'E_Hp', 'p_Am', 'k_J', 's_M'}.issubset(pars_df.columns):
            pars_df['p_M'] = np.sqrt(
                pars_df['s_p_M'] * np.power(pars_df['s_M'], 3) * np.power(pars_df['p_Am'], 3) *
                np.power(pars_df['kap'], 2) * (1 - pars_df['kap'])
                /
                pars_df['k_J'] / pars_df['E_Hp']
            )
            pars_df.drop(columns=['s_p_M'], inplace=True)

    # If the model did not predict 'k_J', set it to default value
    if 'k_J' not in pars_df.columns:
        if {'s_p', 'kap', 'p_Am', 'p_M', 'E_Hp'}.issubset(pars_df.columns):
            pars_df['k_J'] = (
                    pars_df['s_p'] * np.power(pars_df['kap'], 2) * (1 - pars_df['kap']) * np.power(pars_df['p_Am'], 3)
                    /
                    np.power(pars_df['p_M'], 2) / pars_df['E_Hp']
            )
            pars_df.drop(columns=['s_p'], inplace=True)
        elif {'s_p_M', 's_M', 'p_Am', 'kap', 'p_M', 'E_Hp'}.issubset(pars_df.columns):
            pars_df['k_J'] = (
                    pars_df['s_p_M'] * np.power(pars_df['s_M'], 3) * np.power(pars_df['p_Am'], 3)
                    * np.power(pars_df['kap'], 2) * (1 - pars_df['kap'])
                    /
                    np.power(pars_df['p_M'], 2) / pars_df['E_Hp']
            )
            pars_df.drop(columns=['s_p_M'], inplace=True)
        else:
            pars_df['k_J'] = DEFAULT_VALUES['k_J']

    pars_df = pars_df[PARAMETER_COLS].copy()

    return pars_df


def get_core_parameter_predictions(dfs, pred_df, col_types):
    pred_df.index.name = 'species'
    # X = pd.concat([dfs[ds][col_types['input']['all']] for ds in pred_df['data_split'].unique()]).values
    y = pred_df.drop(columns=['data_split']).values
    y_true = pd.concat([dfs[ds][col_types['output']['all']] for ds in pred_df['data_split'].unique()]).values
    mask = np.concatenate([get_output_mask(df=dfs[ds], col_types=col_types) for ds in pred_df['data_split'].unique()],
                          axis=0)

    converted_output_df = convert_output_to_parameter_predictions(y=y, y_true=y_true, mask=mask, col_types=col_types)
    pars_df = pd.DataFrame(converted_output_df.values,
                           columns=list(converted_output_df.columns),
                           index=pred_df.index)
    pars_df['data_split'] = pred_df['data_split']
    for col in pred_df.columns:
        if col in AmP_CORE_DEB_PARS and col not in pars_df.columns:
            pars_df[col] = pred_df[col]

    # If the model predicts 'p_Am' instead of 'z', compute 'z'
    if 'z' not in pars_df.columns:
        if {'p_Am', 'p_M', 'kap'}.issubset(pars_df.columns):
            pars_df['z'] = pars_df['p_Am'] * pars_df['kap'] / pars_df['p_M']

    # If the model did not predict 'E_Hj', set it to 1.05x 'E_Hb'
    if 'E_Hx' not in pars_df.columns:
        if 'E_Hb' in pars_df.columns:
            pars_df['E_Hx'] = 1.05 * pars_df['E_Hb']

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


if __name__ == '__main__':
    from ..data.load_data import load_dataframes, load_col_types

    dataset_name = 'biologist_no_pub_age'
    dfs, col_types = load_dataframes(dataset_name=dataset_name, data_split='train_test')
    gt_df = pd.concat({ds: dfs[ds][col_types['output']['all']] for ds in ('train', 'test')})
    gt_df.reset_index(level=0, names='data_split', inplace=True)
    gt_pars_df = get_core_parameter_predictions(dfs, pred_df=gt_df, col_types=col_types)
    gt_pars_df.to_csv(f'results/parameter_predictions/AmP_predictions.csv', float_format='%.10e')
