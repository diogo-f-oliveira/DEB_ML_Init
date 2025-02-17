import pandas as pd
import json


def load_data(dataset_name, datasets_folder='data/processed', data_split='train_val_test'):
    data = {
        'train': pd.read_csv(f"{datasets_folder}/{dataset_name}/train.csv", index_col=0),
        'val': pd.read_csv(f"{datasets_folder}/{dataset_name}/val.csv", index_col=0),
        'test': pd.read_csv(f"{datasets_folder}/{dataset_name}/test.csv", index_col=0)
    }
    if data_split == 'train_test':
        data = {
            'train': pd.concat([data['train'], data['val']], axis=0),
            'test': data['test'],
        }
    return data


def load_col_types(dataset_name, datasets_folder='data/processed'):
    col_types_options = ['all', 'boolean', 'scale', 'log', 'bounded01', 'quantile', 'category']

    with open(f"{datasets_folder}/{dataset_name}/types_of_col.json", "r") as json_file:
        types_of_col = json.load(json_file)
        col_types = {'input': {t: [] for t in col_types_options}, 'output': {t: [] for t in col_types_options}}
        for col, type_list in types_of_col.items():
            io = type_list[0]
            for t in type_list:
                if t == io:
                    t = 'all'
                col_types[io][t].append(col)

    return col_types
