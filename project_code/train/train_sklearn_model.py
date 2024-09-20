import inspect

import numpy as np
from tabulate import tabulate
import pandas as pd

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


if __name__ == '__main__':
    # seed = 47
    seed = 42
    np.random.seed(seed)

    dfs, col_types = load_data(dataset_folder='data/processed', dataset_name='no_pub_weight')
    data = get_features_targets(dfs, col_types)
    scaled_data, scalers = scale_data(data, col_types)

    # model = RandomForestRegressor(random_state=seed)
    # model = DecisionTreeRegressor(random_state=seed)
    # model = Lasso(alpha=0.01, random_state=seed)
    # model = ElasticNet(random_state=seed)
    model = Ridge(alpha=0.1)
    # model = LinearRegression()

    model.fit(scaled_data['train']['input'], scaled_data['train']['output'])

    y_pred_test = model.predict(scaled_data['test']['input'])
    # y_pred_test_df = pd.DataFrame(y_pred_test,
    #                               index=dfs['test'].index,
    #                               columns=col_types['output']['all'])
    y_pred_test_unscaled = scalers['output'].inverse_transform(y_pred_test)
    # y_pred_test_unscaled_df = pd.DataFrame(y_pred_test_unscaled,
    #                                        index=dfs['test'].index,
    #                                        columns=col_types['output']['all'])
