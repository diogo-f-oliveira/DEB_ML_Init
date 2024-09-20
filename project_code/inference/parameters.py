import pandas as pd

from ..algorithms.theoretical import predict_E_G_from_theory

CORE_DEB_PARS = ['z', 'p_M', 'kap', 'v', 'E_G', 'h_a', 'E_Hb', 'E_Hp']


def get_core_parameter_predictions(dfs, pred_df):
    pars_df = pd.DataFrame(index=pred_df.index, columns=['data_split'] + CORE_DEB_PARS, dtype='float')
    pars_df['data_split'] = pred_df['data_split']
    pars_df.index.name = 'species'

    # If the model predicted a core parameter, copy the predictions
    for p in CORE_DEB_PARS:
        if p in pred_df.columns:
            pars_df[p] = pred_df[p]

    # If the model predicted the ratio 'E_Hb/E_Hp' instead of 'E_Hb', compute 'E_Hb'
    if 'E_Hb' not in pred_df.columns and 'E_Hb_p' in pred_df.columns and 'E_Hp' in pred_df.columns:
        pars_df['E_Hb'] = pred_df['E_Hb_p'] * pred_df['E_Hp']

    # If the model predicted 'p_Am' instead of 'z', compute 'z'
    if 'z' not in pred_df.columns and 'p_Am' in pred_df.columns and 'p_M' in pred_df.columns and 'kap' in pred_df.columns:
        pars_df['z'] = pred_df['p_Am'] * pred_df['kap'] / pred_df['p_M']

    # If the model did not predict 'E_G', compute it from theory
    if 'E_G' not in pred_df.columns:
        for species in pred_df.index.values:
            pars_df.loc[species, 'E_G'] = predict_E_G_from_theory(
                dfs[pred_df.loc[species, 'data_split']].loc[species, 'd_V'])

    pars_df[CORE_DEB_PARS] = pars_df[CORE_DEB_PARS].astype('float')

    return pars_df
