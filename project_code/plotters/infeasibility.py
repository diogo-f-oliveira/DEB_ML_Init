infeasibility_flag_to_text = {
    '0': 'Feasible',
    'failed': 'Method failed',
    '1': 'Non-positive parameters',
    '2': r'$\kappa > 1$',
    '3': 'Efficiencies greater than 1',
    '4': 'Non-increasing maturity levels',
    '6': 'Unable to reach birth',
    '7': 'Unable to reach metamorphosis',
    '5': 'Unable to reach puberty',
    'timeout': 'Time limit reached',
    'error': 'Error',
}
# TODO: Update strings with version above
infeasibility_flag_to_plot_text = {
    '0': 'Feasible',
    'error': 'Error',
    'failed': 'Method failed',
    '1': 'Non-positive \nparameters',
    '2': 'Efficiency not \n between 0 and 1',
    '3': 'Growth effieciency\n larger than 1',
    '4': 'Maturities are not\n increasing',
    '5': 'Puberty cannot \nbe reached',
    '6': 'Birth cannot \nbe reached',
    'timeout': 'Time limit reached'
}

method_labels = {
    'DEBNetHC': 'DEBNet w/ HC',
    'DEBNetSC': 'DEBNet w/ SC',
    'Taxo1NN': 'Taxo1NN',
    'SRTaxo1NN': 'SR-Taxo1NN',
    'MultiTaskElasticNet': 'Elastic Net',
    'RandomForestRegressor': 'Random Forest',
    'MLP': 'HC-InitNet',
    'MLPSC': 'SC-InitNet',
    'BijectionMethod': 'Bijection'
}

par_to_latex = {
    'p_Am': r'\{\dot{p}_{Am}\}',
    'kap': r'\kappa',
    'v': r'\dot{v}',
    'p_M': r'[\dot{p}_{M}]',
    'E_Hb': r'E_H^b',
    'E_Hj': r'E_H^j',
    'E_Hp': r'E_H^p',
    'k_J': r'\dot{k}_J',
    's_M': r's_M',
    'E_G': r'[E_G]',
}