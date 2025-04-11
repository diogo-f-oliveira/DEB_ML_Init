import inspect

import numpy as np
import sklearn.metrics
import pandas as pd
import torch
from tabulate import tabulate

from .metrics import mean_deb_loss, log_accuracy_ratio, symmetric_mean_absolute_percentage_error
from ..inference.parameters import convert_output_to_parameter_predictions, PARAMETER_COLS, impute_predictions

METRIC_LABEL_TO_NAME = {'mean_absolute_percentage_error': 'MAPE',
                        'symmetric_mean_absolute_percentage_error': 'sMAPE',
                        'log_accuracy_ratio': 'logQ',
                        'mean_deb_loss': 'DEB Loss',
                        }


def evaluate_parameter_predictions_on_data(data, col_types, model, print_score=False, save_score=False,
                                           results_save_path=None, return_std=None):
    n_outputs = len(col_types['output']['all'])
    y_true = data['output'].reshape(-1, n_outputs)
    y_pred = model.predict(data['input']).reshape(-1, n_outputs)
    # Convert predictions to parameters
    target_df = convert_output_to_parameter_predictions(y=y_true, y_true=y_true, mask=data['mask'], col_types=col_types)
    pred_df = convert_output_to_parameter_predictions(y=y_pred, y_true=y_true, mask=data['mask'], col_types=col_types)
    mask = data['param_mask']

    metrics_df = compute_metrics(
        y_true=target_df.values,
        y_pred=pred_df.values,
        mask=mask,
        output_col_names=PARAMETER_COLS,
        metrics=[
            log_accuracy_ratio,
            symmetric_mean_absolute_percentage_error,
            mean_deb_loss,
            'mean_absolute_percentage_error',
        ],
        return_std=return_std,
    )
    if print_score:
        if return_std:
            print(f"logQ: {metrics_df.loc['log_accuracy_ratio'].loc['mean'].mean():.4f}")
        else:
            print(f"logQ: {metrics_df.loc['log_accuracy_ratio'].mean():.4f}")
        print(tabulate(metrics_df.rename(METRIC_LABEL_TO_NAME), headers='keys', tablefmt='simple'))

    if save_score:
        metrics_df.to_csv(results_save_path)

    return metrics_df


def compute_metrics(y_true, y_pred, metrics, mask=None, output_col_names=None, return_std=False):
    if output_col_names is None:
        output_col_names = list(range(y_pred.shape[1]))
    metrics_dict = {}

    if mask is None:
        mask = np.ones_like(y_true, dtype=bool)

    metric_function_dict = {}
    for m in metrics:
        if isinstance(m, str):
            metric_name = m
            metric_function = getattr(sklearn.metrics, m)
        elif callable(m):
            metric_name = m.__name__
            metric_function = m
        elif isinstance(m, (list, tuple)):
            metric_name = m[0]
            metric_function = m[1]
        metric_function_dict[metric_name] = metric_function

    index = pd.MultiIndex.from_product([list(metric_function_dict.keys()), ['mean', 'std']],
                                       names=['metric', 'agg'])
    metrics_df = pd.DataFrame(index=index, columns=output_col_names)

    # Compute metrics on scaled output of the model
    for metric_name, metric_function in metric_function_dict.items():
        has_return_std_arg = 'return_std' in inspect.signature(metric_function).parameters
        if has_return_std_arg and return_std:
            for i, p in enumerate(output_col_names):
                mean, std = metric_function(y_true[:, i], y_pred[:, i], sample_weight=mask[:, i], return_std=return_std)
                metrics_df.loc[(metric_name, 'mean'), p] = mean
                metrics_df.loc[(metric_name, 'std'), p] = std
        else:
            for i, p in enumerate(output_col_names):
                mean = metric_function(y_true[:, i], y_pred[:, i], sample_weight=mask[:, i])
                metrics_df.loc[(metric_name, 'mean'), p] = mean

    # Drop agg column if
    if return_std:
        return metrics_df.dropna(how='all')
    else:
        return metrics_df.reset_index(level='agg', drop=True).dropna(how='all')


def evaluate_pytorch_model(dataloader, model, criterion, col_types):
    # Set model to evaluation state
    model.eval()
    eval_loss = 0

    # Compute loss
    with torch.no_grad():
        for X_batch, y_batch, mask_batch in dataloader:
            # Get model output
            outputs = model(X_batch)
            # Impute predictions for non-estimated DEB parameter outputs
            imputed_outputs = impute_predictions(y=outputs, y_true=y_batch, mask=mask_batch)
            # Add loss
            eval_loss += criterion(imputed_outputs, y_batch, mask_batch).item()
        return eval_loss / len(dataloader)
