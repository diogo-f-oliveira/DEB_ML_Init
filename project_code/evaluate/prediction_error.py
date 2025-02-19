import numpy as np
import sklearn.metrics
import pandas as pd
import torch
from tabulate import tabulate

from .metrics import mean_deb_loss, geometric_error_factor, symmetric_mean_absolute_percentage_error
from ..inference.parameters import convert_output_to_parameter_predictions, PARAMETER_COLS, \
    impute_predictions_for_DEB_model_dependent_outputs

METRIC_LABEL_TO_NAME = {'mean_absolute_percentage_error': 'MAPE',
                        'symmetric_mean_absolute_percentage_error': 'sMAPE',
                        'geometric_error_factor': 'GEF',
                        'mean_deb_loss': 'DEB Loss',
                        }


def evaluate_parameter_predictions_on_data(data, col_types, model, print_score=False, save_score=False,
                                           results_save_path=None):
    n_outputs = len(col_types['output']['all'])
    output_col_names = col_types['output']['all']
    y_true = data['output'].reshape(-1, n_outputs)
    y_pred = model.predict(data['input']).reshape(-1, n_outputs)
    # Convert predictions to parameters
    target_df = convert_output_to_parameter_predictions(y_true, data['input'], output_col_names)
    pred_df = convert_output_to_parameter_predictions(y_pred, data['input'], output_col_names)

    metrics_df = compute_metrics(
        y_true=target_df.values,
        y_pred=pred_df.values,
        mask=data['mask'],
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
    eval_loss = 0
    model.eval()
    with torch.no_grad():
        for X_batch, y_batch, mask in dataloader:
            outputs = model(X_batch)
            outputs = impute_predictions_for_DEB_model_dependent_outputs(y=outputs, X=X_batch, col_types=col_types)
            eval_loss += criterion(outputs, y_batch, mask).item()
        return eval_loss / len(dataloader)
