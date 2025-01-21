import os

import numpy as np

from ..data.prepare_data_sklearn import get_features_targets
from ..evaluate.prediction_error import evaluate_parameter_predictions_on_data
from ..train.calibrate_sklearn_model import evaluate_config
from ..train.train_sklearn_model import train_sklearn_model
from ..utils.results import create_results_directories_for_dataset
from ..data.load_data import load_data, load_col_types
from ..algorithms.taxonomic_1nn import TaxonomicKNNRegressor, TaxonomicLabelEncoder

if __name__ == '__main__':
    base_dataset_name = 'no_pub_age'
    dataset_name = 'biologist_' + base_dataset_name

    # Load the data
    dfs = load_data(dataset_name=dataset_name, data_split='train_test')
    col_types = load_col_types(dataset_name=dataset_name)

    # Variables to save results
    results_folder = f'results/{dataset_name}'
    create_results_directories_for_dataset(dataset_name, output_cols=col_types['output']['all'],
                                           results_path='results')

    # Instantiate and use the encoder
    encoder = TaxonomicLabelEncoder(
        all_col_names=col_types['input']['all'] + col_types['output']['all'],
        taxonomy_col_names=col_types['input']['category']
    )
    encoded_dfs = {'train': None, 'test': None}
    encoded_dfs['train'] = encoder.fit_transform(dfs['train'])
    encoded_dfs['test'] = encoder.transform(dfs['test'])

    data = get_features_targets(data=encoded_dfs, col_types=col_types)

    base_model = TaxonomicKNNRegressor
    config = {
        'n_neighbors': 1,
        'col_types': col_types
    }
    # save_trained_model = True
    # evaluate_on_test = True

    mape_list = evaluate_config(config=config,
                    base_model=base_model,
                    col_types=col_types,
                    X_train=data['train']['input'],
                    y_train=data['train']['output'],
                    report_metrics=False)
    cv_mape = np.mean(mape_list)
    print(mape_list, cv_mape)

    taxo1nn = train_sklearn_model(
        base_model=base_model,
        config=config,
        col_types=col_types,
        data=data['train']
    )

    model_name = base_model.__class__.__name__
    formatted_score = format(cv_mape, '.4e').replace('.', '')
    best_model_name = f'MAPE_{formatted_score}_{model_name}'

    save_folder = f'results/{dataset_name}/all'
    test_performance_save_folder = os.path.join(save_folder, 'test_performance')
    test_performance_save_file = os.path.join(test_performance_save_folder, f"{best_model_name}.csv")
    evaluate_parameter_predictions_on_data(data=data['test'],
                                           col_types=col_types,
                                           model=taxo1nn,
                                           print_score=True,
                                           save_score=True,
                                           results_save_path=test_performance_save_file)
