import pandas as pd
import numpy as np

LENGTH_COLS = ['Lb', 'Lj', 'Lx', 'Lp', 'Li']
WEIGHT_COLS = ['Wwb', 'Wwj', 'Wwx', 'Wwp', 'Wwi']
AGE_COLS = ['ab', 'aj', 'ax', 'ap', 'am']
aves_puberty_weight_factor = 0.95


def check_column_values_increase(series: pd.Series, columns: list):
    # Get not NaN values
    values = [series[col] for col in columns if pd.notnull(series[col])]
    # Check if values always increase
    return all(values[i] < values[i + 1] for i in range(len(values) - 1))


def impute_weight_and_length_data(series: pd.Series, length_cols=None, weight_cols=None):
    if length_cols is None:
        length_cols = LENGTH_COLS
    if weight_cols is None:
        weight_cols = WEIGHT_COLS

    # Get proportional factor (1+f*omega) candidates
    candidate_ome_values = []
    for L_col, W_col in zip(length_cols, weight_cols):
        L_val = series[L_col]
        W_val = series[W_col]
        if pd.notnull(L_val) and pd.notnull(W_val):
            candidate_ome_values.append(W_val / (L_val ** 3))
    if len(candidate_ome_values) == 0:
        return series
    elif len(candidate_ome_values) >= 1:
        # Add average value as first candidate omega value then iterate over candidate omega values from adult to birth
        candidate_ome_values = [np.mean(candidate_ome_values)] + list(reversed(candidate_ome_values))

    # Impute values
    for ome in candidate_ome_values:
        temp = series.copy()  # work on a copy for this candidate
        # Impute missing values in each pair based on candidate a.
        for L_col, W_col in zip(length_cols, weight_cols):
            L_val = temp[L_col]
            W_val = temp[W_col]
            # If L is missing and W is available, impute L = (W/(1+f*omega))^(1/3)
            if pd.isna(L_val) and pd.notnull(W_val):
                temp[L_col] = (W_val / ome) ** (1 / 3)
            # If W is missing and L is available, impute W = (1+f*omega) * L^3
            elif pd.isna(W_val) and pd.notnull(L_val):
                temp[W_col] = ome * (temp[L_col] ** 3)
            # If both are missing, we leave them as is.

        # Check if the imputed weight and length columns are strictly increasing.
        if check_column_values_increase(temp, weight_cols) and check_column_values_increase(temp, length_cols):
            # Accept this candidate's imputations.
            return temp

    # If none of the candidate a's worked, leave the series unchanged.
    return series


def impute_age_data(series: pd.Series):
    # If no data on age at birth 'ab'
    temp = series.copy()
    if pd.isna(temp['ab']):
        # Infer it from gestation time 'tg'
        if not pd.isna(temp['tg']):
            # If diapause exists, take it into account for calculating age at birth
            if not pd.isna(temp['t_0']):
                temp['ab'] = temp['tg'] + temp['t_0']
            else:
                temp['ab'] = temp['tg']

        # Infer from age at hatch 'ah' and time since hatch at birth 'tb'
        elif not pd.isna(temp['ah']) and not pd.isna(temp['tb']):
            temp['ab'] = temp['ah'] + temp['tb']
        # Check that the imputed age at birth is smaller than all other ages
        if not check_column_values_increase(temp, AGE_COLS):
            return series

    # Compute age at maturity levels from time since birth data
    if not pd.isna(temp['ab']):
        for mat in ('j', 'x', 'p'):
            if pd.isna(temp[f'a{mat}']) and not pd.isna(temp[f't{mat}']):
                temp[f'a{mat}'] = temp[f't{mat}'] + temp['ab']
        if check_column_values_increase(temp, AGE_COLS):
            return temp
        else:
            return series
    return series


def impute_reproduction_rate_data(series: pd.Series):
    # If no data on reproduction rate 'Ri'
    if pd.isna(series['Ri']):
        # Infer it from total reproduction, maximum age, and age at puberty
        if not any(pd.isna(series[['Ni', 'am', 'ap']])):
            series['Ri'] = series['Ni'] / (series['am'] - series['ap'])
        elif not any(pd.isna(series[['NR', 'am', 'ap']])):
            series['Ri'] = series['NR'] / (series['am'] - series['ap'])

    return series


def impute_weight_at_puberty_for_aves(series: pd.Series):
    # If the species is 'Aves' and 'Wwp' is missing
    if series['class'] == 'Aves' and pd.isna(series['Wwp']) and not pd.isna(series['Wwi']):
        series['Wwp'] = aves_puberty_weight_factor * series['Wwi']

    return series
