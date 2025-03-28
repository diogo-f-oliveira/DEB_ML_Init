import inspect
import os
import random
from functools import partial
from datetime import datetime as dt

import numpy as np
import pandas as pd
from ray.tune import CLIReporter
from ray.tune.schedulers import ASHAScheduler
from ray.tune.search.hyperopt import HyperOptSearch
from sklearn.model_selection import GridSearchCV, KFold, StratifiedKFold

from sklearn.ensemble import RandomForestRegressor
from sklearn.linear_model import Ridge, Lasso, MultiTaskElasticNet
from sklearn.neighbors import KNeighborsRegressor
from sklearn.svm import SVR

from ..utils.models import save_sklearn_model
from ..train.train_sklearn_model import train_sklearn_model
from ..utils.results import create_results_directories_for_dataset
from ..algorithms.build_sklearn_model import build_sklearn_model
from ..data.load_data import load_dataframes, load_col_types
from ..data.prepare_data_sklearn import get_features_targets, get_single_output_col_types
from ..evaluate.prediction_error import evaluate_parameter_predictions_on_data, METRIC_LABEL_TO_NAME

from ray import train, tune


def format_param_grid(param_grid, model):
    if model.regressor.named_steps['model'].__class__.__name__ == 'MultiOutputRegressor':
        param_base_str = 'regressor__model__estimator'
    else:
        param_base_str = 'regressor__model'
    # Format the param grid
    formatted_param_grid = {}
    for param_name, param_options in param_grid.items():
        if param_name == 'scaler_type':
            formatted_param_grid[f'regressor__input_transformer__{param_name}'] = param_options
            formatted_param_grid[f'output_transformer__{param_name}'] = param_options
        else:
            formatted_param_grid[f"{param_base_str}__{param_name}"] = param_options
    # param_grid = {'regressor__model__' + param: options for param, options in param_grid.items()}
    return formatted_param_grid


def grid_search_calibration(base_model, search_space, data, col_types, scorer=None,
                            save_best_model=True, save_folder='', print_best_model=True, evaluate_on_test=True,
                            verbose=0,
                            **model_kwargs):
    # Build model so that input and output are scaled
    model = build_sklearn_model(base_model=base_model, col_types=col_types, **model_kwargs)
    # Format the param grid
    formatted_param_grid = format_param_grid(search_space, model)

    # Set up the GridSearchCV
    grid_search = GridSearchCV(model, formatted_param_grid, cv=5, scoring=scorer, verbose=verbose, n_jobs=-1,
                               return_train_score=True)

    # Fit the model
    grid_search.fit(data['train']['input'], data['train']['output'])

    if print_best_model:
        # Best parameters found
        print("Best parameters found: ", grid_search.best_params_)
        print(f"Best score: {grid_search.best_score_:.4f}")

    formatted_score = format(grid_search.best_score_, '.4f').replace('.', '')
    best_model_name = f'R2_{formatted_score}_{base_model.__class__.__name__}'
    if save_best_model:
        save_sklearn_model(grid_search.best_estimator_,
                           folder=os.path.join(save_folder, 'models'),
                           filename=f"{best_model_name}.pkl")

    if evaluate_on_test:
        test_performance_save_folder = os.path.join(save_folder, 'test_performance')
        test_performance_save_file = os.path.join(test_performance_save_folder, f"{best_model_name}.csv")
        evaluate_on_data(data=data['test'],
                         col_types=col_types,
                         model=grid_search.best_estimator_,
                         print_score=print_best_model,
                         save_score=save_best_model,
                         results_save_path=test_performance_save_file
                         )

    return grid_search


def evaluate_config(config, base_model, col_types, data, random_state=42, n_splits=5, stratify=None,
                    report_metrics=False, verbose=False):
    X_train = data['input']
    if random_state in inspect.signature(base_model.__init__).parameters:
        config['random_state'] = random_state

    # Create KFold class with stratification
    if stratify is None:
        cv = KFold(n_splits=n_splits, random_state=random_state, shuffle=True)
        stratify_col = None
    elif isinstance(stratify, (list, tuple)):
        stratify_col = np.apply_along_axis(lambda row: '_'.join(row), 1, X_train[:, stratify].astype(str))
        cv = StratifiedKFold(n_splits=n_splits, random_state=random_state, shuffle=True)
    elif isinstance(stratify, int):
        stratify_col = X_train[:, stratify]
        cv = StratifiedKFold(n_splits=n_splits, random_state=random_state, shuffle=True)

    # Run K-Fold cross validation
    cv_metrics_df = pd.DataFrame(columns=list(METRIC_LABEL_TO_NAME.values()))
    for i, (train_index, val_index) in enumerate(cv.split(X_train, stratify_col)):
        # Get fold training data
        fold_train_data = {sp: d[train_index] for sp, d in data.items()}
        # Train model
        model = train_sklearn_model(
            base_model=base_model,
            config=config,
            col_types=col_types,
            data=fold_train_data,
            random_state=random_state
        )
        # Evaluate on fold validation data
        fold_val_data = {sp: d[val_index] for sp, d in data.items()}

        fold_metrics_df = evaluate_parameter_predictions_on_data(
            data=fold_val_data,
            col_types=col_types,
            model=model
        )
        cv_metrics_df.loc[i] = fold_metrics_df.mean().rename(METRIC_LABEL_TO_NAME)
        # Report metrics
        if report_metrics:
            train.report({m: cv_metrics_df[m].mean() for m in METRIC_LABEL_TO_NAME.values()})
        elif verbose:
            print(cv_metrics_df.loc[i])

    # Report the CV R2 score to Ray Tune
    if report_metrics:
        train.report({m: cv_metrics_df[m].mean() for m in METRIC_LABEL_TO_NAME.values()})
    else:
        return cv_metrics_df


def hyperopt_calibration(base_model, search_space, data, col_types,
                         num_samples=100, metric='logQ', mode='min', current_best_params=None,
                         run_name=None, model_name=None, tune_dir=None, max_concurrent_trials=None,
                         evaluate_on_test=False, save_best_model=False,
                         save_folder='', random_state=42,
                         **evaluate_config_options):
    if model_name is None:
        if hasattr(base_model, '__name__'):
            model_name = base_model.__name__
        elif hasattr(base_model, '__class__'):
            model_name = base_model.__class__.__name__
    if run_name is None:
        time_str = dt.now().strftime('%Y-%m-%d_%H-%M-%S')
        run_name = f"{model_name}__{time_str}"
    if tune_dir is None:
        tune_dir = os.path.abspath(f'tune')

    alg = HyperOptSearch(metric=metric, mode=mode, points_to_evaluate=current_best_params,
                         random_state_seed=random_state)

    tuner = tune.Tuner(
        partial(evaluate_config, base_model=base_model, col_types=col_types, data=data['train'],
                report_metrics=True, **evaluate_config_options),
        tune_config=tune.TuneConfig(
            search_alg=alg,
            max_concurrent_trials=max_concurrent_trials,
            num_samples=num_samples,
            trial_dirname_creator=lambda t: t.trial_id,
            scheduler=ASHAScheduler(metric=metric, mode=mode, grace_period=2, max_t=100),
        ),
        run_config=train.RunConfig(
            name=run_name,
            verbose=1,
            progress_reporter=CLIReporter(
                metric=metric, mode=mode,
                metric_columns=list(METRIC_LABEL_TO_NAME.values()),
                parameter_columns=[p for p, s in search_space.items() if isinstance(s, tune.search.sample.Domain)],
                sort_by_metric=True,
                max_report_frequency=60,
            ),
            storage_path=tune_dir,
        ),
        param_space=search_space,
    )
    results = tuner.fit()

    best_result = results.get_best_result(metric=metric, mode=mode)

    best_model = train_sklearn_model(
        base_model=base_model,
        config=best_result.config,
        col_types=col_types,
        data=data['train'],
        random_state=random_state
    )
    formatted_score = format(best_result.metrics[metric], '.4e').replace('.', '')
    best_model_name = f'{metric}_{formatted_score}_{model_name}'

    print("Best parameters found: ", best_result.config)
    print(f"Best score: {best_result.metrics[metric]:.4f}")

    if save_best_model:
        save_sklearn_model(best_model,
                           folder=os.path.join(save_folder, 'models'),
                           filename=f"{best_model_name}.pkl")

    if evaluate_on_test:
        test_performance_save_folder = os.path.join(save_folder, 'test_performance')
        test_performance_save_file = os.path.join(test_performance_save_folder, f"{best_model_name}.csv")
        evaluate_parameter_predictions_on_data(data=data['test'],
                                               col_types=col_types,
                                               model=best_model,
                                               print_score=True,
                                               save_score=save_best_model,
                                               results_save_path=test_performance_save_file)

    return best_model


def calibrate_independent_output_models(base_model, search_space, dataset_name, calibration_function,
                                        dfs=None, col_types=None, save_folder=None,
                                        **calibration_function_kwargs):
    if dfs is None:
        dfs = load_dataframes(dataset_name=dataset_name, data_split='train_test')
    if col_types is None:
        col_types = load_col_types(dataset_name=dataset_name)

    if save_folder is None:
        save_folder = f'results/{dataset_name}'
        create_results_directories_for_dataset(dataset_name)

    for i, col in enumerate(col_types['output']['all']):
        if col not in ['kap', 'E_Hb_p']:
            continue
        so_col_types = get_single_output_col_types(col_types=col_types, output_col=col)
        so_data = get_features_targets(data=dfs, col_types=so_col_types)
        so_save_folder = f'{save_folder}/{col}'
        param_search_space = search_space.copy()
        if len(so_col_types['output']['bounded01']) and 'output_scaler_type' in param_search_space:
            param_search_space.pop('output_scaler_type')
        print(f'\n\nCalibrating submodel for output {col}')

        calibration_function(base_model=base_model,
                             search_space=param_search_space,
                             data=so_data,
                             col_types=so_col_types,
                             save_folder=so_save_folder,
                             **calibration_function_kwargs
                             )


if __name__ == '__main__':
    seed = 42
    np.random.seed(seed)
    random.seed(seed)

    dataset_name = 'final'
    dataset_name += '_taxonomy'
    dataset_name += '_ecocodes'

    # Load the data
    dfs, col_types = load_dataframes(dataset_name=dataset_name, data_split='train_test')
    data = get_features_targets(dfs, col_types)

    os.environ['RAY_AIR_NEW_OUTPUT'] = '0'
    num_samples = 100

    ## Train independent output models
    base_models = {
        'Ridge': Ridge,
        'Lasso': Lasso,
        'SVR': SVR,
        'RandomForestRegressor': RandomForestRegressor,
        'KNeighborsRegressor': KNeighborsRegressor,
        'MultiTaskElasticNet': MultiTaskElasticNet,
    }

    search_spaces = {
        'Ridge': {'alpha': tune.loguniform(1e-4, 1e4)},
        'Lasso': {'alpha': tune.loguniform(1e-4, 1e4)},
        'MultiTaskElasticNet': {
            'l1_ratio': tune.uniform(0, 1),
            'alpha': tune.loguniform(1e-4, 1e4),
            # 'input_scaler_type': tune.choice(['standard', 'quantile_normal', 'quantile_uniform']),
            # 'output_scaler_type': tune.choice(['standard', 'quantile_normal', 'quantile_uniform']),
        },
        'RandomForestRegressor': {
            'n_estimators': tune.qrandint(100, 10000, 100),
            # 'min_samples_split': tune.randint(2, 4),
            'max_features': tune.randint(2, len(col_types['input']['all']) + 1),
            'criterion': tune.choice(['squared_error', 'friedman_mse']),
        },
        'KNeighborsRegressor': {
            'n_neighbors': tune.randint(1, 10),
            'weights': tune.choice(['uniform', 'distance']),
            'p': tune.uniform(1, 3),
        },
    }

    # Train multioutput models
    multi_output_models_to_train = [
        # 'MultiTaskElasticNet',
        'RandomForestRegressor',
    ]
    model_names = {
        # 'RandomForestRegressor': 'RandomForest',
        'MultiTaskElasticNet': 'ElasticNet',
    }

    for model_type in multi_output_models_to_train:
        model_name = model_names[model_type]
        print(f"Training model {model_name} on dataset {dataset_name}")
        base_model = base_models[model_type]
        search_space = search_spaces[model_type]
        hyperopt_calibration(
            base_model=base_model,
            search_space=search_space,
            data=data,
            col_types=col_types,
            evaluate_on_test=True,
            save_best_model=True,
            save_folder=f'results/{dataset_name}',
            metric='logQ',
            mode='min',
            num_samples=150,
            max_concurrent_trials=24,
            stratify=col_types['input']['all'].index('metamorphosis'),
            model_name=model_name,
        )
