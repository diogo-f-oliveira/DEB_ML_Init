import torch
import torch.nn as nn

class FeedForwardNetwork(nn.Module):
    def __init__(self, col_types, hidden_sizes, dropout_prob):
        super(FeedForwardNetwork, self).__init__()
        self.bounded_col_indices = [i for i, col in enumerate(col_types['output']['all']) if
                                    col in col_types['output']['bounded01']]

        if isinstance(hidden_sizes, int):
            hidden_sizes = [hidden_sizes]

        # Input layer
        self.linear_layers = nn.ModuleList([nn.Linear(len(col_types['input']['all']), hidden_sizes[0])])
        # Hidden layers and dropout regularization for each one
        self.dropout_layers = nn.ModuleList([nn.Dropout(p=dropout_prob)])
        for i in range(len(hidden_sizes) - 1):
            self.linear_layers.append(nn.Linear(hidden_sizes[i], hidden_sizes[i + 1]))
            nn.init.kaiming_normal_(tensor=self.linear_layers[-1].weight, nonlinearity='relu')
            self.dropout_layers.append(nn.Dropout(p=dropout_prob))
        # Output layer
        self.output_layer = nn.Linear(hidden_sizes[-1], len(col_types['output']['all']))
        nn.init.xavier_uniform_(self.output_layer.weight)
        self.activation = nn.ReLU()

    def forward(self, x):
        y_hat = x
        for i in range(len(self.linear_layers)):
            # Compute the pre-activiation
            y_hat = self.linear_layers[i](y_hat)
            # Now apply the activation function
            y_hat = self.activation(y_hat)
            # Then dropout
            y_hat = self.dropout_layers[i](y_hat)
        # Output layer
        y_hat = self.output_layer(y_hat)
        # Apply sigmoid transformation to ensure output between 0 and 1
        y_hat[:, self.bounded_col_indices] = torch.sigmoid(y_hat[:, self.bounded_col_indices])
        return y_hat

    def predict(self, x):
        with torch.no_grad():
            return self(x)
