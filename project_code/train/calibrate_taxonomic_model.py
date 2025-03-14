import os
from ray import tune

from ..data.prepare_data_sklearn import get_features_targets
from ..train.calibrate_sklearn_model import hyperopt_calibration
from ..utils.results import create_results_directories_for_dataset
from ..data.load_data import load_dataframes, load_col_types
from ..algorithms.taxonomic_1nn import TaxonomicKNNRegressor, TaxonomicLabelEncoder

if __name__ == '__main__':
    base_dataset_name = 'no_pub_age'
    dataset_name = 'biologist_' + base_dataset_name

    # Load the data
    dfs, col_types = load_dataframes(dataset_name=dataset_name, data_split='train_test')

    # Variables to save results
    results_folder = f'results/{dataset_name}'
    create_results_directories_for_dataset(dataset_name)

    # Encode taxonomy labels
    taxonomy_encoder = TaxonomicLabelEncoder(
        all_col_names=col_types['input']['all'] + col_types['output']['all'],
        taxonomy_col_names=col_types['input']['category']
    )
    encoded_dfs = {
        'train': taxonomy_encoder.fit_transform(dfs['train']),
        'test': taxonomy_encoder.transform(dfs['test'])
    }

    data = get_features_targets(data=encoded_dfs, col_types=col_types)

    base_model = TaxonomicKNNRegressor
    search_space = {
        'ultimate_weight_factor': tune.qloguniform(1e-3, 1e2, 1e-3),
        'deb_model_factor': tune.qloguniform(1e-3, 1e2, 1e-3),

        # Fixed params
        'n_neighbors': 1,
        'col_types': col_types,
        'output_scaler_type': 'none',
        'taxonomy_encoder': taxonomy_encoder,
        'use_scaling_relationships': True,
    }
    for model_name in ['Taxo1NN', 'SRTaxo1NN']:
    #model_name = 'SRTaxo1NN' if search_space['use_scaling_relationships'] else 'Taxo1NN'
        if 'SR' in model_name:
            search_space['use_scaling_relationships'] = True
        else:
            search_space['use_scaling_relationships'] = False

        os.environ['RAY_AIR_NEW_OUTPUT'] = '0'
        hyperopt_calibration(
            base_model=base_model,
            search_space=search_space,
            data=data,
            col_types=col_types,
            metric='GEF',
            mode='min',
            num_samples=50,
            #max_concurrent_trials=None,
            evaluate_on_test=True,
            save_best_model=True,
            save_folder=f'results/{dataset_name}',
            model_name=model_name,
            run_name=f'{model_name}',
            n_splits=10,
            stratify=col_types['input']['all'].index('metamorphosis'),
        )
