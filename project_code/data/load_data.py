import pandas as pd
import json


def load_data(dataset_name, dataset_folder='data/processed', data_split='train_val_test'):
    data = {
        'train': pd.read_csv(f"{dataset_folder}/{dataset_name}_train.csv", index_col=0),
        'val': pd.read_csv(f"{dataset_folder}/{dataset_name}_val.csv", index_col=0),
        'test': pd.read_csv(f"{dataset_folder}/{dataset_name}_test.csv", index_col=0)
    }
    if data_split == 'train_test':
        data = {
            'train': pd.concat([data['train'], data['val']], axis=0),
            'test': data['test'],
        }
    return data


def load_col_types(dataset_name, dataset_folder='data/processed'):
    with open(f"{dataset_folder}/{dataset_name}_types_of_col.json", "r") as json_file:
        types_of_col = json.load(json_file)
        col_types = {'input': {}, 'output': {}}
        for col, type_list in types_of_col.items():
            io = type_list[0]
            for t in type_list:
                if t == io:
                    t = 'all'
                if t not in col_types[io]:
                    col_types[io][t] = []
                col_types[io][t].append(col)

    return col_types
