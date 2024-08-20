import numpy as np
import sklearn.metrics
import pandas as pd
import inspect


def multioutput_error(y_true, y_pred, parameter_metrics=None, output_metrics=None, output_transformer=None,
                      output_col_names=None):
    if parameter_metrics is not None and output_transformer is None:
        raise ValueError('Parameter metrics cannot be computed without supplying an output_transformer.')
    if output_col_names is None:
        output_col_names = list(range(y_pred.shape[1]))
    metrics_dict = {}

    # Compute metrics on scaled output of the model
    for m in output_metrics:
        metric = getattr(sklearn.metrics, m)
        signature = inspect.signature(metric)
        if 'multioutput' in signature.parameters:
            metric_values = metric(y_true, y_pred, multioutput='raw_values')
        else:
            metric_values = np.zeros(shape=(1, len(output_col_names)))
            for i in range(len(output_col_names)):
                metric_values[:, i] = metric(y_true[:, i], y_pred[:, i])
        metrics_dict[m] = {p: e for p, e in zip(output_col_names, metric_values)}

    # Compute metrics on unscaled output of the model
    y_pred_unscaled = output_transformer.inverse_transform(y_pred)
    y_true_unscaled = output_transformer.inverse_transform(y_true)
    for m in parameter_metrics:
        metric = getattr(sklearn.metrics, m)
        signature = inspect.signature(metric)
        if 'multioutput' in signature.parameters:
            metric_values = metric(y_true_unscaled, y_pred_unscaled, multioutput='raw_values')
        else:
            metric_values = np.zeros(shape=(len(output_col_names),))
            for i in range(len(output_col_names)):
                metric_values[i] = metric(y_true_unscaled[:, i], y_pred_unscaled[:, i])
        metrics_dict[m] = {p: e for p, e in zip(output_col_names, metric_values)}

    # Pack into DataFrame
    metrics_df = pd.DataFrame.from_dict(metrics_dict, orient='index').transpose()
    mean_metrics_df = metrics_df.mean(axis=0).to_frame()
    mean_metrics_df.index.name = 'metrics'
    mean_metrics_df.columns = ['par_mean']

    return metrics_df, mean_metrics_df
