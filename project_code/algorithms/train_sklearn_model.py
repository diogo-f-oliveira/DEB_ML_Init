import numpy as np
import torch
from tabulate import tabulate
import pandas as pd

from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.linear_model import LinearRegression, Ridge, ElasticNet, Lasso
from sklearn.svm import SVR


from ..data.prepare_data_sklearn import get_features_targets, scale_data
from ..data.load_data import load_data


if __name__ == '__main__':
    # seed = 47
    seed = 42
    torch.manual_seed(seed=seed)
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

