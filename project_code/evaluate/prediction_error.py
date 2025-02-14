from functools import partial

import numpy as np
import sklearn.metrics
import pandas as pd
import inspect
import torch
from sklearn import metrics as metrics
from tabulate import tabulate

from .score import mean_deb_loss, geometric_error_factor, symmetric_mean_absolute_percentage_error
from ..inference.parameters import convert_output_to_parameter_predictions, PARAMETER_COLS

METRIC_LABEL_TO_NAME = {'mean_absolute_percentage_error': 'MAPE',
                        'symmetric_mean_absolute_percentage_error': 'sMAPE',
                        'geometric_error_factor': 'GEF',
                        'mean_deb_loss': 'DEB Loss',
                        }


def compute_parameter_mape(y_true, y_pred, output_col_names):
    target_df = convert_output_to_parameter_predictions(y_true, output_col_names)
    pred_df = convert_output_to_parameter_predictions(y_pred, output_col_names)

    mape_df = compute_metrics(
        y_true=target_df,
        y_pred=pred_df,
        output_col_names=PARAMETER_COLS,
        metrics=['mean_absolute_percentage_error'],
    )

    return mape_df


def evaluate_parameter_predictions_on_data(data, col_types, model, print_score=False, save_score=False,
                                           results_save_path=None):
    n_outputs = len(col_types['output']['all'])
    output_col_names = col_types['output']['all']
    y_true = data['output'].reshape(-1, n_outputs)
    y_pred = model.predict(data['input']).reshape(-1, n_outputs)
    target_df = convert_output_to_parameter_predictions(y_true, output_col_names)
    pred_df = convert_output_to_parameter_predictions(y_pred, output_col_names)

    metrics_df = compute_metrics(
        y_true=target_df.values,
        y_pred=pred_df.values,
        output_col_names=PARAMETER_COLS,
        metrics=['mean_absolute_percentage_error',
                 geometric_error_factor,
                 symmetric_mean_absolute_percentage_error,
                 mean_deb_loss,
                 ]
    )
    if print_score:
        print(f"GEF: {metrics_df['geometric_error_factor'].mean():.4f}")
        print(tabulate(metrics_df, headers='keys', tablefmt='simple'))

    if save_score:
        metrics_df.to_csv(results_save_path)

    return metrics_df


def compute_metrics(y_true, y_pred, metrics=None, output_col_names=None):
    if output_col_names is None:
        output_col_names = list(range(y_pred.shape[1]))
    metrics_dict = {}

    # Compute metrics on scaled output of the model
    for m in metrics:
        if isinstance(m, str):
            metric_name = m
            metric = getattr(sklearn.metrics, m)
        elif callable(m):
            metric_name = m.__name__
            metric = m
        elif isinstance(m, (list, tuple)):
            metric_name = m[0]
            metric = m[1]

        signature = inspect.signature(metric)
        if 'multioutput' in signature.parameters:
            metric_values = metric(y_true, y_pred, multioutput='raw_values')
        else:
            metric_values = np.zeros(shape=(len(output_col_names)))
            for i in range(len(output_col_names)):
                metric_values[i] = metric(y_true[:, i], y_pred[:, i])
        metrics_dict[metric_name] = {p: e for p, e in zip(output_col_names, metric_values)}

    # Pack into DataFrame
    metrics_df = pd.DataFrame.from_dict(metrics_dict, orient='index').transpose()

    return metrics_df


def evaluate_on_data(data, col_types, model, print_score=False, save_score=False, results_save_path=None):
    n_outputs = len(col_types['output']['all'])
    y_pred_test = model.predict(data['input']).reshape(-1, n_outputs)
    y_pred_unscaled_test = model.output_transformer.inverse_transform(y_pred_test).reshape(-1, n_outputs)
    y_true_test = model.output_transformer.transform(data['output']).reshape(-1, n_outputs)
    y_true_unscaled_test = data['output'].reshape(-1, n_outputs)

    output_metrics_df = compute_metrics(
        y_true=y_true_test,
        y_pred=y_pred_test,
        metrics=['r2_score',
                 'mean_squared_error',
                 'max_error'],
        output_col_names=col_types['output']['all'],
    )
    r2_test_score = output_metrics_df['r2_score'].mean()

    unscaled_metrics_df = compute_metrics(
        y_true=y_true_unscaled_test,
        y_pred=y_pred_unscaled_test,
        metrics=['mean_absolute_percentage_error',
                 'mean_gamma_deviance',
                 ('d2_score', partial(metrics.d2_tweedie_score, power=2)),
                 mean_deb_loss],
        output_col_names=col_types['output']['all'],
    )

    metrics_df = pd.concat([output_metrics_df, unscaled_metrics_df], axis=1)

    if print_score:
        print(f"R^2 score: {r2_test_score:.4f}")
        print(tabulate(metrics_df, headers='keys', tablefmt='simple'))

    if save_score:
        # test_performance_save_folder = os.path.join(save_folder, 'test_performance')
        # metrics_df.to_csv(os.path.join(test_performance_save_folder, f"{best_model_name}.csv"))
        metrics_df.to_csv(results_save_path)


def evaluate_pytorch_model(dataloader, model, criterion):
    eval_loss = 0
    model.eval()
    with torch.no_grad():
        for X_batch, y_batch in dataloader:
            outputs = model(X_batch)
            eval_loss += criterion(outputs, y_batch).item()
        return eval_loss / len(dataloader)
