import numpy as np
import sklearn.metrics
from functools import partial


def make_unscaled_scorer(metric, **metrics_kws):
    if not callable(metric):
        metric = getattr(sklearn.metrics, metric)
    if len(metrics_kws):
        metric = partial(metric, **metrics_kws)

    # Unscale both the predictions and the true values
    def unscaled_scorer(estimator, X, y):
        y_pred = estimator.predict(X)
        y_pred_unscaled = estimator.output_transformer.inverse_transform(y_pred)
        # print(y_pred_unscaled)
        y_unscaled = estimator.output_transformer.inverse_transform(y)
        # print(y_unscaled)

        return metric(y_unscaled, y_pred_unscaled)

    return unscaled_scorer


def mean_deb_loss(y_true, y_pred, sample_weights=None, multioutput='raw_values'):
    if sample_weights is None:
        sample_weights = np.ones((len(y_true), 1)) / len(y_true)
    raw_values = sample_weights * (np.power(y_true - y_pred, 2)) / (np.power(y_true, 2) + np.power(y_pred, 2))
    if multioutput == 'raw_values':
        return np.mean(raw_values, axis=0)
    elif multioutput == 'uniform_average':
        return np.mean(raw_values)
