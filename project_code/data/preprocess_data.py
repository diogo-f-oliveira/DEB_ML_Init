import os
import pandas as pd
import json

from sklearn.model_selection import train_test_split

SAVE_FLOAT_FORMAT = '%.10e'


def encode_taxonomy(df: pd.DataFrame, categories: dict, include_other_col: dict):
    """"""
    dummy_cols = []
    for col, options in categories.items():
        if include_other_col[col]:
            df[f"{col}_other"] = True
            dummy_cols.append(f"{col}_other")
        for taxo in options:
            dummy_col = f'{col}_{taxo}'
            dummy_cols.append(dummy_col)
            df[dummy_col] = False
            for species, species_taxo in df[col].items():
                if pd.isna(taxo):
                    continue
                if taxo == species_taxo:
                    df.loc[species, dummy_col] = True
                    df.loc[species, f"{col}_other"] = False
    return df, dummy_cols


def encode_eco_codes(df, categories: dict, include_other_col: dict):
    """Encodes ecocodes into binary variables. For the same species, several ecocode categories can be true. Also adds
    an 'other' option if none of the provided options for the category are true."""
    dummy_cols = []
    for cat, options in categories.items():
        # Create an 'other' option if requested
        if include_other_col[cat]:
            df[f"{cat}_other"] = True
            dummy_cols.append(f"{cat}_other")
        for ecocode in options:
            dummy_col = f'{cat}_{ecocode}'
            dummy_cols.append(dummy_col)
            df[dummy_col] = False
            # Loop through every species
            for species, value in df[cat].items():
                if pd.isna(value):
                    continue
                # Check if the ecocode is in the species' ecocodes
                if ecocode in value:
                    df.loc[species, dummy_col] = True
                    if include_other_col[cat]:
                        df.loc[species, f"{cat}_other"] = False

    return df, dummy_cols


def drop_species_with_missing_values(df):
    stx_columns = ['E_Hx', 'Wwx', 'ax']
    abj_columns = ['E_Hj', 'Wwj', 'aj']

    # abj models
    subset = [col for col in df.columns if col not in stx_columns]
    # print(len(subset), subset)
    abj_df = df[df['metamorphosis']].dropna(subset=subset)

    # stx models
    subset = [col for col in df.columns if col not in abj_columns]
    # print(len(subset), subset)
    stx_df = df[df['weaning']].dropna(subset=subset)

    # std models
    subset = [col for col in df.columns if col not in abj_columns and col not in stx_columns]
    # print(len(subset), subset)
    std_df = df[~df['weaning'] & ~df['metamorphosis']].dropna(subset=subset)

    return pd.concat([abj_df, std_df, stx_df], axis=0)


def save_types_of_col(types_of_col, dataset_folder):
    with open(f'{dataset_folder}/types_of_col.json', "w") as json_file:
        json.dump(types_of_col, json_file, indent=4)


def split_and_save_dataset(df, dataset_name, types_of_col, train_percentage=0.70, val_percentage=0.15,
                           test_percentage=0.15, seed=42, stratify=None,
                           save_folder='data/processed'):
    if stratify is not None:
        # Reindex ´stratify´ series to only include species in the provided dataframe
        stratify_array = stratify.loc[df.index]
    else:
        stratify_array = None

    # First split to separate train and temp (test + val)
    train_df, temp_df = train_test_split(df, test_size=(1 - train_percentage), random_state=seed,
                                         stratify=stratify_array)

    # Calculate the percentage of temp that should be in test and val splits
    val_test_ratio = val_percentage / (val_percentage + test_percentage)

    # Split temp into validation and test sets
    if stratify is not None:
        stratify_array = stratify.loc[temp_df.index]
    else:
        stratify_array = None
    val_df, test_df = train_test_split(temp_df, test_size=(1 - val_test_ratio), random_state=seed,
                                       stratify=stratify_array)

    print(f"Train set size: {len(train_df)}")
    print(f"Validation set size: {len(val_df)}")
    print(f"Test set size: {len(test_df)}")

    # Set data split in df
    df.loc[train_df.index, 'data_split'] = 'train'
    df.loc[test_df.index, 'data_split'] = 'test'
    df.loc[val_df.index, 'data_split'] = 'val'

    # Save datasets
    dataset_folder = os.path.join(save_folder, dataset_name)
    if not os.path.exists(dataset_folder):
        os.makedirs(dataset_folder)
    df.to_csv(os.path.join(dataset_folder, f'{dataset_name}.csv'), index=True, float_format=SAVE_FLOAT_FORMAT)
    train_df.to_csv(os.path.join(dataset_folder, f'train.csv'), index=True, float_format=SAVE_FLOAT_FORMAT)
    val_df.to_csv(os.path.join(dataset_folder, f'val.csv'), index=True, float_format=SAVE_FLOAT_FORMAT)
    test_df.to_csv(os.path.join(dataset_folder, f'test.csv'), index=True, float_format=SAVE_FLOAT_FORMAT)

    # Check if all keys in col_types are in df.columns
    missing_cols_in_df = [col for col in types_of_col if col not in df.columns]
    if len(missing_cols_in_df):
        raise Exception(f"Columns {missing_cols_in_df} defined in ´types_of_col´ are not present in the dataset.")
    # Check if all columns are defined in types_of_col
    missing_cols_in_toc = [col for col in df.columns if col not in types_of_col and col != 'data_split']
    if len(missing_cols_in_toc):
        raise Warning(f"Columns {missing_cols_in_toc} in the dataset do not have a definition in ´types_of_col´.")
    # Save dataset info
    save_types_of_col(types_of_col, dataset_folder)
