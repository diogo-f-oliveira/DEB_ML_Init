def predict_unscaled(model, data):
    y_pred = model.predict(data['input'])
    y_pred_unscaled = model.output_transformer.inverse_transform(y_pred)
    return y_pred_unscaled


def unscale_output(model, y):
    return model.output_transformer.inverse_transform(y)
