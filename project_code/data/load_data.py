import pandas as pd
import json


def load_dataframes(dataset_name, datasets_folder='data/processed', data_split='train_val_test'):
    col_types = load_col_types(dataset_name=dataset_name, datasets_folder=datasets_folder)
    data = {
        'train': pd.read_csv(f"{datasets_folder}/{dataset_name}/train.csv", index_col=0),
        'val': pd.read_csv(f"{datasets_folder}/{dataset_name}/val.csv", index_col=0),
        'test': pd.read_csv(f"{datasets_folder}/{dataset_name}/test.csv", index_col=0)
    }
    ordered_cols = list(set(col_types['input']['all'] + col_types['output']['all'] + col_types['mask']['all']))
    for split, df in data.items():
        data[split] = df[ordered_cols]
    if data_split == 'train_test':
        data = {
            'train': pd.concat([data['train'], data['val']], axis=0),
            'test': data['test'],
        }
    return data, col_types


def load_col_types(dataset_name, datasets_folder='data/processed'):
    col_types_qualifiers = ['all', 'boolean', 'scale', 'log', 'bounded01', 'quantile', 'category']

    with open(f"{datasets_folder}/{dataset_name}/types_of_col.json", "r") as json_file:
        types_of_col = json.load(json_file)
        col_types = {
            'input': {t: [] for t in col_types_qualifiers},
            'output': {t: [] for t in col_types_qualifiers},
            'mask': {t: [] for t in col_types_qualifiers},
        }
        for col, type_info in types_of_col.items():
            for c in type_info['classes']:
                col_types[c]['all'].append(col)
            for t in type_info['qualifiers']:
                for c in type_info['classes']:
                    col_types[c][t].append(col)

    return col_types
