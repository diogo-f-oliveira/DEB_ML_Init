import numpy as np
import sklearn.metrics
import pandas as pd
import torch
from tabulate import tabulate

from .metrics import mean_deb_loss, geometric_error_factor, symmetric_mean_absolute_percentage_error
from ..inference.parameters import convert_output_to_parameter_predictions, PARAMETER_COLS, DEFAULT_VALUES, \
    MODEL_DEPENDENT_PARAMETER_COLS, impute_predictions

METRIC_LABEL_TO_NAME = {'mean_absolute_percentage_error': 'MAPE',
                        'symmetric_mean_absolute_percentage_error': 'sMAPE',
                        'geometric_error_factor': 'GEF',
                        'mean_deb_loss': 'DEB Loss',
                        }


def get_output_mask_for_parameter_predictions(y, X, *, metamorphosis_idx):
    # TODO: Need to update this function to get masks from dataframes
    output_mask = np.ones_like(y, dtype='float')
    no_metamorphosis_mask = X[:, metamorphosis_idx] == 0
    for i, col in enumerate(PARAMETER_COLS):
        if col in MODEL_DEPENDENT_PARAMETER_COLS:
            output_mask[no_metamorphosis_mask, i] = 0

    k_J_idx = PARAMETER_COLS.index('k_J')
    default_k_J_mask = y[:, k_J_idx] == DEFAULT_VALUES['k_J']
    output_mask[default_k_J_mask, k_J_idx] = 0

    return output_mask


def evaluate_parameter_predictions_on_data(data, col_types, model, print_score=False, save_score=False,
                                           results_save_path=None):
    n_outputs = len(col_types['output']['all'])
    y_true = data['output'].reshape(-1, n_outputs)
    y_pred = model.predict(data['input']).reshape(-1, n_outputs)
    # Convert predictions to parameters
    target_df = convert_output_to_parameter_predictions(y=y_true, y_true=y_true, mask=data['mask'], col_types=col_types)
    pred_df = convert_output_to_parameter_predictions(y=y_pred, y_true=y_true, mask=data['mask'], col_types=col_types)
    mask = get_output_mask_for_parameter_predictions(y_true, data['input'],
                                                     metamorphosis_idx=col_types['input']['all'].index('metamorphosis'))

    metrics_df = compute_metrics(
        y_true=target_df.values,
        y_pred=pred_df.values,
        mask=mask,
        output_col_names=PARAMETER_COLS,
        metrics=[
            geometric_error_factor,
            symmetric_mean_absolute_percentage_error,
            mean_deb_loss,
            'mean_absolute_percentage_error',
        ]
    )
    if print_score:
        print(f"GEF: {metrics_df['geometric_error_factor'].mean():.4f}")
        print(tabulate(metrics_df, headers='keys', tablefmt='simple'))

    if save_score:
        metrics_df.to_csv(results_save_path)

    return metrics_df


def compute_metrics(y_true, y_pred, mask=None, metrics=None, output_col_names=None):
    if output_col_names is None:
        output_col_names = list(range(y_pred.shape[1]))
    metrics_dict = {}

    if mask is None:
        mask = np.ones_like(y_true, dtype=bool)

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

        metric_values = np.zeros(shape=(len(output_col_names)))
        for i in range(len(output_col_names)):
            metric_values[i] = metric(y_true[:, i], y_pred[:, i], sample_weight=mask[:, i])
        metrics_dict[metric_name] = {p: e for p, e in zip(output_col_names, metric_values)}

    # Pack into DataFrame
    metrics_df = pd.DataFrame.from_dict(metrics_dict, orient='index').transpose()

    return metrics_df


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
