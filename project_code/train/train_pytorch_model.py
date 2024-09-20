import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from tabulate import tabulate
import pandas as pd

from DEB_ML_Bijection.project_code.data.prepare_data_pytorch import prepare_data_tensors
from DEB_ML_Bijection.project_code.data.load_data import load_data, load_col_types
from DEB_ML_Bijection.project_code.algorithms.neural_networks import FeedForwardNetwork
from DEB_ML_Bijection.project_code.algorithms.loss_functions import MSEInfeasibiltyLoss
from DEB_ML_Bijection.project_code.evaluate.prediction_error import compute_metrics

if __name__ == '__main__':
    # seed = 47
    seed = 42
    torch.manual_seed(seed=seed)
    np.random.seed(seed)
    dataset_name = 'no_pub_weight'
    data = load_data(dataset_name=dataset_name)
    col_types = load_col_types(dataset_name=dataset_name)
    # data['train'] = data['train'].head(50)
    # data['train'] = data['train'].head(50)
    dataloaders, datasets, scalers = prepare_data_tensors(data, col_types, batch_size=4)

    n_hidden = 5
    hidden_size = 100
    hidden_sizes = [hidden_size] * n_hidden
    # hidden_sizes = [64, 48, 32, 16]
    model = FeedForwardNetwork(col_types=col_types, hidden_sizes=hidden_sizes, dropout_prob=0)

    # criterion = MSEInfeasibiltyLoss(scalers=scalers,
    #                                 col_types=col_types,
    #                                 lambdas=torch.tensor([1, 10, 2, 10], dtype=torch.float32))
    criterion = nn.MSELoss(reduction='sum')
    optimizer = optim.Adam(model.parameters(), lr=1e-4, weight_decay=1e-3)

    # Train the model with batches
    num_epochs = 1000
    for epoch in range(num_epochs):
        model.train()
        epoch_loss = 0
        for X_batch, y_batch in dataloaders['train']:
            optimizer.zero_grad()
            outputs = model(X_batch)
            # loss = criterion(outputs, y_batch, X_batch)
            loss = criterion(outputs, y_batch)
            loss.backward()
            torch.nn.utils.clip_grad_norm_(model.parameters(), 100)
            optimizer.step()
            epoch_loss += loss.item()

        if (epoch + 1) % 20 == 0:
            model.eval()
            # Evaluate on validation set
            val_loss = 0
            with torch.no_grad():
                all_outputs = []
                for X_val_batch, y_val_batch in dataloaders['val']:
                    val_outputs = model(X_val_batch)
                    # val_loss += criterion(val_outputs, y_val_batch, X_val_batch).item()
                    val_loss += criterion(val_outputs, y_val_batch).item()
                    all_outputs.append(val_outputs)
            print(f"Epoch [{epoch + 1}/{num_epochs}], "
                  f"Loss: {epoch_loss / len(dataloaders['train']):.4f}, "
                  f"Validation Loss: {val_loss / len(dataloaders['val']):.4f}")
            all_outputs = torch.cat(all_outputs, dim=0)

            metrics_df, mean_metrics_df = compute_metrics(
                y_true=datasets['val'].tensors[1],
                y_pred=all_outputs,
                output_metrics=['r2_score', 'mean_squared_error'],
                parameter_metrics=['mean_absolute_percentage_error', 'mean_gamma_deviance'],
                output_transformer=scalers['output'],
                output_col_names=col_types['output']['all'],
            )
            print(tabulate(metrics_df, headers='keys', tablefmt='simple'))
            print(tabulate(mean_metrics_df, headers='keys', tablefmt='simple'))

    # Evaluate on test set
    model.eval()
    test_loss = 0
    with torch.no_grad():
        # Concat all outputs
        all_outputs = []
        for X_test_batch, y_test_batch in dataloaders['test']:
            outputs = model(X_test_batch)
            # test_loss += criterion(outputs, y_test_batch, X_test_batch).item()
            test_loss += criterion(outputs, y_test_batch).item()
            all_outputs.append(outputs)
        print(f"\nTest Loss: {test_loss / len(dataloaders['test']):.4f}")
        all_outputs = torch.cat(all_outputs, dim=0)
        # mape = parameter_mape(y_true=datasets['test'].tensors[1],
        #                       y_pred=all_outputs,
        #                       output_scaler=scalers['output'],
        #                       output_cols=col_types['output']['all'])
        # mse = output_mse(y_true=datasets['test'].tensors[1],
        #                  y_pred=all_outputs,
        #                  output_cols=col_types['output']['all'])
        # metrics_df = pd.DataFrame.from_dict({
        #     'output_mse': mse,
        #     'par_mape': mape,
        # }, orient='index').transpose()
        #
        # print(tabulate(metrics_df, headers='keys', tablefmt='simple'))
        # mean_metrics_df = metrics_df.mean(axis=0).to_frame()
        # mean_metrics_df.index.name = 'metrics'
        # mean_metrics_df.columns = ['par_mean']
        # print(tabulate(mean_metrics_df, headers='keys', tablefmt='simple'))
