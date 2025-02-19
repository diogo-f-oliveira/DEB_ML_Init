import os

from ..utils.models import save_sklearn_model
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
    config = {
        'weight_factor': 0.1,
        'n_neighbors': 1,
        'col_types': col_types,
        'output_scaler_type': 'none',
        'taxonomy_encoder': taxonomy_encoder,
        'use_scaling_relationships': True,
    }

    save_trained_model = True
    evaluate_on_test = True

    cv_metrics_df = evaluate_config(config=config,
                                    base_model=base_model,
                                    col_types=col_types,
                                    data=data['train'],
                                    report_metrics=False,
                                    stratify=col_types['input']['all'].index('metamorphosis'),
                                    )

    cv_gef = cv_metrics_df['GEF'].mean()
    print(cv_metrics_df)
    print(f"CV GEF:  {cv_gef:.4f} \n")

    taxo1nn = train_sklearn_model(
        base_model=base_model,
        config=config,
        col_types=col_types,
        data=data['train']
    )

    model_name = 'SRTaxo1NN' if config['use_scaling_relationships'] else 'Taxo1NN'
    formatted_score = format(cv_gef, '.4e').replace('.', '')
    best_model_name = f'GEF_{formatted_score}_{model_name}'

    save_folder = f'results/{dataset_name}'
    test_performance_save_folder = os.path.join(save_folder, 'test_performance')
    test_performance_save_file = os.path.join(test_performance_save_folder, f"{best_model_name}.csv")
    if evaluate_on_test:
        evaluate_parameter_predictions_on_data(data=data['test'],
                                               col_types=col_types,
                                               model=taxo1nn,
                                               print_score=True,
                                               save_score=save_trained_model,
                                               results_save_path=test_performance_save_file)
    if save_trained_model:
        save_sklearn_model(taxo1nn,
                           folder=os.path.join(save_folder, 'models'),
                           filename=f"{best_model_name}.pkl")
