import os.path
from functools import partial

from ray import train, tune
from ray.tune import CLIReporter
from ray.tune.schedulers import ASHAScheduler
from ray.tune.search.hyperopt import HyperOptSearch
from datetime import datetime as dt
import torch

from project_code.evaluate.prediction_error import evaluate_parameter_predictions_on_data, METRIC_LABEL_TO_NAME
from project_code.utils.models import save_pytorch_model
from ..algorithms.neural_networks import DEBNet, DEBNetHC
from .train_pytorch_model import train_neural_network
from ..data.load_data import load_data, load_col_types
from ..data.prepare_data_pytorch import prepare_data_tensors


def hyperopt_calibration(model_class, search_space, dataset_name, device,
                         num_samples=100, metric='mape', mode='min', model_name=None, run_name=None,
                         patience=10, grace_period=30,
                         evaluate_on_test=False, save_best_model=False,
                         save_folder='', tune_dir=None, random_state=42, datasets_folder='data/processed'):
    if model_name is None:
        model_name = model_class.__name__

    if run_name is None:
        time_str = dt.now().strftime('%Y-%m-%d_%H-%M-%S')
        run_name = f"{model_name}__{time_str}"
    if tune_dir is None:
        tune_dir = os.path.abspath(f'tune')
    alg = HyperOptSearch(metric=metric, mode=mode, random_state_seed=random_state)

    tuner = tune.Tuner(
        partial(train_neural_network, model_class=model_class, dataset_name=dataset_name, patience=patience,
                report_val_scores=True, verbose=False, seed=random_state, print_val_metrics_every=1000,
                datasets_folder=datasets_folder, device=device),

        tune_config=tune.TuneConfig(
            search_alg=alg,
            num_samples=num_samples,
            trial_dirname_creator=lambda t: t.trial_id,
            scheduler=ASHAScheduler(metric=metric, mode=mode, grace_period=grace_period, max_t=1000),
        ),
        run_config=train.RunConfig(
            name=run_name,
            verbose=1,
            progress_reporter=CLIReporter(
                metric=metric, mode=mode,
                metric_columns=list(METRIC_LABEL_TO_NAME.values()) + ['val_loss', 'epoch'],
                parameter_columns=[p for p, s in search_space.items() if isinstance(s, tune.search.sample.Domain)],
                sort_by_metric=True,
                max_report_frequency=60,
            ),
            storage_path=tune_dir,
        ),
        param_space=search_space
    )
    results = tuner.fit()

    best_config = results.get_best_result(metric=metric, mode=mode).config

    print(f"Retraining best configuration: {best_config}")
    best_model, best_epoch_metrics_df = train_neural_network(
        config=best_config,
        model_class=model_class, dataset_name=dataset_name, patience=patience,
        report_val_scores=False, verbose=False, seed=random_state,
        print_val_metrics_every=1000,
        datasets_folder=datasets_folder, device=device,
    )

    formatted_score = format(best_epoch_metrics_df[metric], '.4e').replace('.', '')
    best_model_name = f'{metric}_{formatted_score}_{model_name}'
    test_performance_save_folder = os.path.join(save_folder, 'test_performance')
    test_performance_save_file = os.path.join(test_performance_save_folder, f"{best_model_name}.csv")

    if save_best_model:
        save_pytorch_model(model=best_model, folder=os.path.join(save_folder, 'models'), filename=best_model_name)

    if evaluate_on_test:
        # Load and preprocess data
        data = load_data(dataset_name=dataset_name, data_split='train_val_test')
        col_types = load_col_types(dataset_name=dataset_name)
        data_tensors, dataloaders, datasets, scalers = prepare_data_tensors(data=data, col_types=col_types,
                                                                            batch_size=best_config['batch_size'],
                                                                            scaling_type=best_config['scaling_type'],
                                                                            device=device)

        # Evaluate parameter predictions in parameter scale
        evaluate_parameter_predictions_on_data(
            data=data_tensors['test'],
            col_types=col_types,
            model=best_model,
            print_score=True,
            save_score=save_best_model,
            results_save_path=test_performance_save_file,
        )


if __name__ == '__main__':
    os.environ['RAY_AIR_NEW_OUTPUT'] = '0'

    device = torch.device('cpu')

    dataset_name = 'all_constraints_no_pub_age'
    dataset_name += '_taxonomy'
    dataset_name += '_ecocodes'

    search_space = {
        # Optimizer hyperparameters
        'batch_size': tune.choice([2, 4, 8, 16]),
        'learning_rate': tune.loguniform(1e-6, 1e-2),
        # Architecture hyperparameters
        'n_shared_layers': tune.randint(1, 5),
        'shared_hidden_size': tune.choice([16, 32, 64, 96, 128]),
        # 'n_par_layers': tune.randint(1, 5),
        # 'par_hidden_size': tune.choice([8, 16, 32, 64]),
        # 'dropout_prob': tune.uniform(0, 0.4),
        # Fixed options
        'dropout_prob': 0.0,
        'n_par_layers': 0,
        'par_hidden_size': 0,
        'scaling_type': 'log_standardize',
        'max_epochs': 500,
        'early_stopping_metric': 'GEF',
    }
    model_name = 'MLP'

    # if model_class == DEBNet:
    #     if use_infeasibility_loss:
    #         search_space['loss_function'] = 'mse_infeasibility'
    #         model_name = 'DEBNetSC'
    #         search_space['lambda_kap'] = tune.loguniform(1e-1, 1e1)
    #         search_space['lambda_s_H'] = tune.loguniform(1e-1, 1e1)
    #         search_space['lambda_s_p'] = tune.loguniform(1e-1, 1e1)
    #     else:
    #         search_space['loss_function'] = 'mse'
    #         model_name = 'DEBNet'
    if model_name == 'DEBNetHC':
        search_space['loss_function'] = 'mse'
        model_class = DEBNetHC
        use_infeasibility_loss = False
    elif model_name == 'MLP':
        search_space['loss_function'] = 'mse'
        model_class = DEBNetHC
        use_infeasibility_loss = False

    metric = 'GEF'

    print(f"Tuning hyperparameters for {model_name} ({model_class.__name__}) with "
          f"{'infeasibility loss' if use_infeasibility_loss else 'MSE loss'} and metric {metric}")

    hyperopt_calibration(model_class=model_class,
                         search_space=search_space,
                         dataset_name=dataset_name,
                         num_samples=300,
                         datasets_folder=os.path.abspath('data/processed'),
                         save_best_model=True,
                         evaluate_on_test=True,
                         save_folder=f'results/{dataset_name}/all',
                         model_name=model_name,
                         patience=10,
                         grace_period=50,
                         device=device,
                         metric=metric,
                         )
