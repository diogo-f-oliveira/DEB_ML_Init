import inspect

from ..algorithms.build_sklearn_model import build_sklearn_model


def train_sklearn_model(base_model, config, data, col_types, random_state=42):
    model_config = config.copy()
    if random_state in inspect.signature(base_model.__init__).parameters:
        model_config['random_state'] = random_state
    if 'input_scaler_type' in model_config:
        input_scaler_type = model_config['input_scaler_type']
        model_config.pop('input_scaler_type')
    else:
        input_scaler_type = 'standard'
    if 'output_scaler_type' in model_config:
        output_scaler_type = model_config['output_scaler_type']
        model_config.pop('output_scaler_type')
    else:
        output_scaler_type = 'standard'
    configured_base_model = base_model(**model_config)
    model = build_sklearn_model(regressor=configured_base_model, col_types=col_types,
                                input_scaler_type=input_scaler_type, output_scaler_type=output_scaler_type)

    model.fit(X=data['input'], y=data['output'])
    return model
