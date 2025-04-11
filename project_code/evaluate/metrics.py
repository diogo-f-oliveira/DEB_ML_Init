import numpy as np


# Aggregate over outputs based on multioutput parameter
def aggregate(metric_values, multioutput):
    if multioutput == "raw_values":
        return metric_values
    elif multioutput == "uniform_average":
        return np.mean(metric_values)
    elif isinstance(multioutput, (list, np.ndarray)):
        weights = np.asarray(multioutput)
        if weights.shape[0] != metric_values.shape[0]:
            raise ValueError("Weights must have the same length as the number of outputs.")
        return np.average(metric_values, weights=weights)
    else:
        raise ValueError("multioutput must be 'raw_values', 'uniform_average', or array-like of weights.")


def mean_deb_loss(y_true, y_pred, *, sample_weight=None, multioutput="raw_values", return_std=False):
    """
    Compute the mean DEB loss between true and predicted values.

    The loss is defined as:

        loss = ( (y_true - y_pred)^2 ) / ( y_true^2 + y_pred^2 )

    For multioutput data, the loss is computed for each output (i.e., along axis=0) and then
    aggregated according to the `multioutput` parameter. If `sample_weight` is provided, the mean is
    computed as a weighted average over the samples.

    Parameters
    ----------
    y_true : array-like of shape (n_samples,) or (n_samples, n_outputs)
        True parameter values.

    y_pred : array-like of shape (n_samples,) or (n_samples, n_outputs)
        Predicted parameter values.

    sample_weight : array-like of shape (n_samples,), default=None
        Sample weights used to compute a weighted average over the samples.

    multioutput : {"raw_values", "uniform_average"} or array-like of shape (n_outputs,), default="raw_values"
        Defines aggregating of multiple output losses:
          - If "raw_values", then a numpy array of shape (n_outputs,) is returned.
          - If "uniform_average", then the average of the losses is returned.
          - If array-like, then a weighted average is computed using the provided weights.

    Returns
    -------
    loss : float or ndarray of floats
         The mean DEB loss, either as a single aggregated value or as an array of values per output.

    Raises
    ------
    ValueError
        If sample_weight is not a 1D array with length equal to the number of samples, or if a zero
        denominator is encountered.

    Examples
    --------
    >>> import numpy as np
    >>> y_true = np.array([[1, 10], [2, 20], [3, 30]])
    >>> y_pred = np.array([[1.1, 9], [1.9, 21], [3.2, 29]])
    >>> # Return loss for each output
    >>> mean_deb_loss(y_true, y_pred, multioutput="raw_values")
    array([...])
    >>> # Return a uniform average of the losses
    >>> mean_deb_loss(y_true, y_pred, multioutput="uniform_average")
    0.0123...
    >>> # Using sample weights
    >>> sample_weight = np.array([0.2, 0.3, 0.5])
    >>> mean_deb_loss(y_true, y_pred, sample_weight=sample_weight, multioutput="raw_values")
    array([...])
    """
    y_true = np.asarray(y_true)
    y_pred = np.asarray(y_pred)

    # If inputs are 1D, reshape them to (n_samples, 1)
    if y_true.ndim == 1:
        y_true = y_true.reshape(-1, 1)
        y_pred = y_pred.reshape(-1, 1)

    n_samples = y_true.shape[0]

    # Validate sample_weight: if None, use ones; else ensure it is 1D with shape (n_samples,)
    if sample_weight is None:
        sample_weight = np.ones(n_samples)
    else:
        sample_weight = np.asarray(sample_weight)
        if sample_weight.ndim != 1 or sample_weight.shape[0] != n_samples:
            raise ValueError("sample_weight must be a 1D array with the same number of samples as y_true.")

    # Compute the denominator: y_true^2 + y_pred^2
    denominator = np.power(y_true, 2) + np.power(y_pred, 2)
    if np.any(denominator == 0):
        raise ValueError("Encountered zero in the denominator (y_true^2 + y_pred^2).")

    # Compute the loss for each sample and output
    raw_values = np.power(y_true - y_pred, 2) / denominator

    # Compute the weighted average across samples (axis=0) for each output.
    loss_per_output = np.average(raw_values, axis=0, weights=sample_weight)

    # Aggregate outputs according to the multioutput parameter.
    aggregated_mean = aggregate(loss_per_output, multioutput)

    if return_std:
        # Compute the weighted variance per output:
        # variance = average((loss - mean_loss)^2, weights=sample_weight)
        variance_per_output = np.average((raw_values - loss_per_output) ** 2, axis=0, weights=sample_weight)
        std_loss_per_output = np.sqrt(variance_per_output)
        aggregated_std = aggregate(std_loss_per_output, multioutput)
        return aggregated_mean, aggregated_std
    else:
        return aggregated_mean


def log_accuracy_ratio(y_true, y_pred, *, sample_weight=None, exponentiate=False, multioutput='raw_values',
                       return_std=False):
    """
    Compute the logarithm of the accuracy ratio.

    The geometric error factor is defined as:
        log Q = mean( | ln( y_pred / y_true ) | )
    For multioutput data, the metric is computed per output (i.e. along axis 0) and then
    aggregated according to the `multioutput` parameter.

    Parameters
    ----------
    y_true : array-like of shape (n_samples,) or (n_samples, n_outputs)
        True (target) values. All elements must be positive.

    y_pred : array-like of shape (n_samples,) or (n_samples, n_outputs)
        Predicted values. All elements must be positive.

    sample_weight: array_like of shape (n_samples,)
        Sample weights.

    exponentiate: boolean, default False
        If true, returns exp(log Q).

    multioutput : {"raw_values", "uniform_average"} or array-like of shape (n_outputs,), default="uniform_average"
        Defines aggregating of multiple output errors:
          - If "raw_values", then a numpy array of shape (n_outputs,) is returned.
          - If "uniform_average", then the average of the errors is returned.
          - If array-like, then weighted average is computed with the provided weights.

    Returns
    -------
    score : float or ndarray of floats
        The geometric error factor, either as a single aggregated value or as an array
        of values per output.

    Raises
    ------
    ValueError
        If any value in y_true or y_pred is not positive.

    Examples
    --------
    >>> import numpy as np
    >>> y_true = np.array([[10, 100], [20, 200], [30, 300]])
    >>> y_pred = np.array([[11, 95], [19, 210], [29, 310]])
    >>> # Return a weighted average (default uniform average)
    >>> log_accuracy_ratio(y_true, y_pred)
    1.055...
    >>> # Return raw error per output
    >>> log_accuracy_ratio(y_true, y_pred, multioutput="raw_values")
    array([1.052..., 1.058...])
    """
    y_true = np.asarray(y_true)
    y_pred = np.asarray(y_pred)

    # If the arrays are one-dimensional, reshape them to 2D (n_samples, 1)
    if y_true.ndim == 1:
        y_true = y_true.reshape(-1, 1)
        y_pred = y_pred.reshape(-1, 1)

    # Ensure that all values are positive
    # if np.any(y_true <= 0):
    #    raise RuntimeWarning("All true values must be positive.")
    # if np.any(y_pred <= 0):
    #    raise RuntimeWarning("All predicted values must be positive.")

    # Compute the absolute log error for each element
    log_errors = np.abs(np.log(y_pred / y_true))

    # Compute the mean of the log errors over samples (axis=0), using sample_weight if provided.
    if sample_weight is not None:
        sample_weight = np.asarray(sample_weight)
        if sample_weight.ndim != 1 or sample_weight.shape[0] != y_true.shape[0]:
            raise ValueError("sample_weight must be a 1D array with the same length as the number of samples.")
        mean_log_error_per_output = np.average(log_errors, axis=0, weights=sample_weight)
    else:
        mean_log_error_per_output = np.mean(log_errors, axis=0)

    # Exponentiate the mean log error to get the geometric error factor per output
    if exponentiate:
        log_acc_ratio = np.exp(mean_log_error_per_output)
    else:
        log_acc_ratio = mean_log_error_per_output

    # Aggregate results according to multioutput parameter
    aggregated_mean = aggregate(log_acc_ratio, multioutput)

    if return_std:
        # Compute the weighted variance per output:
        # variance = average((loss - mean_loss)^2, weights=sample_weight)
        variance_per_output = np.average((log_errors - mean_log_error_per_output) ** 2, axis=0, weights=sample_weight)
        std_loss_per_output = np.sqrt(variance_per_output)
        aggregated_std = aggregate(std_loss_per_output, multioutput)
        return aggregated_mean, aggregated_std
    else:
        return aggregated_mean


def symmetric_mean_absolute_percentage_error(y_true, y_pred, *, sample_weight=None, percentage=True, normalize=True,
                                             multioutput='raw_values', return_std=False):
    """
    Compute the symmetric Mean Absolute Percentage Error (sMAPE).

    The unnormalized sMAPE is defined as:
        sMAPE = mean( |y_true - y_pred| / ((|y_true| + |y_pred|)/2) )
    When `normalize=True`, the result is divided by 2 so that it ranges between 0 and 1
    (or 0 and 100% if percentage=True). For multioutput data, the metric is computed per output
    (i.e. along axis 0) and then aggregated according to the `multioutput` parameter.

    Parameters
    ----------
    y_true : array-like of shape (n_samples,) or (n_samples, n_outputs)
        Ground truth (correct) target values.
    y_pred : array-like of shape (n_samples,) or (n_samples, n_outputs)
        Estimated target values.
    percentage : bool, default=True
        If True, the result is multiplied by 100 (i.e., returned as a percentage).
    normalize : bool, default=True
        If True, divide the sMAPE by 2 so that the range is [0, 1] (or [0, 100] when percentage=True).
    multioutput : {"raw_values", "uniform_average"} or array-like of shape (n_outputs,), default="uniform_average"
        Defines aggregating of multiple output errors:
          - If "raw_values", then a numpy array of shape (n_outputs,) is returned.
          - If "uniform_average", then the average of the errors is returned.
          - If array-like, then a weighted average is computed using the provided weights.

    Returns
    -------
    smape : float or ndarray of floats
        The symmetric mean absolute percentage error, either as a single aggregated value or
        as an array of values per output.

    Raises
    ------
    ValueError
        If any denominator element is zero (i.e., if |y_true| + |y_pred| == 0 for any sample).

    Examples
    --------
    >>> import numpy as np
    >>> y_true = np.array([[100, 200], [300, 400], [500, 600]])
    >>> y_pred = np.array([[110, 190], [290, 410], [510, 590]])
    >>> # Uniform average (default)
    >>> symmetric_mean_absolute_percentage_error(y_true, y_pred)
    3.57...
    >>> # Raw values per output
    >>> symmetric_mean_absolute_percentage_error(y_true, y_pred, multioutput="raw_values")
    array([3.45..., 3.69...])
    """
    y_true = np.asarray(y_true)
    y_pred = np.asarray(y_pred)

    # If one-dimensional, reshape to 2D (n_samples, 1)
    if y_true.ndim == 1:
        y_true = y_true.reshape(-1, 1)
        y_pred = y_pred.reshape(-1, 1)

    # Compute denominator: average of absolute true and predicted values
    denominator = (np.abs(y_true) + np.abs(y_pred)) / 2.0

    # Check for zeros in the denominator
    if np.any(denominator == 0):
        raise ValueError("sMAPE is not defined when any |y_true| + |y_pred| equals 0.")

    # Compute absolute percentage errors for each sample
    errors = np.abs(y_true - y_pred) / denominator

    # Compute the mean error for each output (axis=0), using sample_weight if provided.
    if sample_weight is not None:
        sample_weight = np.asarray(sample_weight)
        if sample_weight.ndim != 1 or sample_weight.shape[0] != y_true.shape[0]:
            raise ValueError("sample_weight must be a 1D array with the same length as the number of samples.")
        smape_per_output = np.average(errors, axis=0, weights=sample_weight)
    else:
        smape_per_output = np.mean(errors, axis=0)

    # Normalize if desired
    if normalize:
        smape_per_output = smape_per_output / 2.0

    # Multiply by 100 if percentage output is desired
    if percentage:
        smape_per_output = smape_per_output * 100.0

    # Aggregate results according to multioutput parameter
    aggregated_mean = aggregate(smape_per_output, multioutput)

    if return_std:
        # Compute the weighted variance per output:
        # variance = average((loss - mean_loss)^2, weights=sample_weight)
        variance_per_output = np.average((errors - smape_per_output) ** 2, axis=0, weights=sample_weight)
        std_loss_per_output = np.sqrt(variance_per_output)
        aggregated_std = aggregate(std_loss_per_output, multioutput)
        return aggregated_mean, aggregated_std
    else:
        return aggregated_mean
