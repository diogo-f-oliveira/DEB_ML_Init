from sklearn.base import BaseEstimator, RegressorMixin
from sklearn.neighbors import NearestNeighbors
from sklearn.exceptions import NotFittedError
from sklearn.preprocessing import LabelEncoder
import numpy as np


class TaxonomicLabelEncoder:
    """
    Encodes each taxon T as a label from 0 to n_T-1, where n_T is the number of different values in taxon T. If a value
    is missing or if it is different from the labels found during the fitting process, then it is replaced by 'other'
    and encoded with the value n_T.
    """

    def __init__(self, all_col_names, taxonomy_col_names):
        """
        Create the TaxonomyLabelEncoder instance. Uses column names of a Dataframe to know which columns are taxons.
        :param all_col_names: All column names. Kept for reference if needed.
        :param taxonomy_col_names: List of columns that are taxons.
        """
        self.label_encoders = []
        self.all_col_names = all_col_names
        self.taxonomy_col_names = taxonomy_col_names
        # self.taxonomy_cols = [i for i, col in enumerate(self.all_col_names) if col in self.taxonomy_col_names]

    def fit_transform(self, df):
        """
        Assigns a label to each different value in taxon T. The values found are stored in each taxons LabelEncoder.
        Returns the encoded dataframe used to fit the TaxonomicLabelEncoder.
        :param df: A dataframe containing the columns in self.taxonomy_col_names to be label encoded.
        :return: The dataframe df label encoded for each taxon.
        """
        encoded_df = df.copy()
        self.label_encoders = [LabelEncoder() for _ in self.taxonomy_col_names]
        for i, col in enumerate(self.taxonomy_col_names):
            taxonomy_col = df[col].astype(str)
            taxonomy_col = taxonomy_col.fillna('other')  # Fill missing values with 'other'
            # Add 'other' category to the classes
            unique_values = taxonomy_col.unique().tolist() + ['other']
            self.label_encoders[i].fit(unique_values)
            encoded_df[col] = self.label_encoders[i].transform(taxonomy_col)
        return encoded_df

    def transform(self, df):
        """
        Encodes the taxonomic columns in dataframe df with the encoding found during the fitting process. If a value is
        missing or if the taxon was not present in the fitting process, it is assigned the label n_T.
        :param df: A dataframe containing the columns in self.taxonomy_col_names to be label encoded.
        :return: The dataframe df label encoded for each taxon.
        """
        encoded_df = df.copy()
        for i, col in enumerate(self.taxonomy_col_names):
            taxonomy_col = df[col].astype(str)
            taxonomy_col = taxonomy_col.fillna('other')  # Fill missing values with 'other'
            encoded_col = []
            for value in taxonomy_col:
                if value in self.label_encoders[i].classes_:
                    encoded_col.append(self.label_encoders[i].transform([value])[0])
                else:
                    # Assign 'other' label if value is unseen
                    encoded_col.append(self.label_encoders[i].transform(['other'])[0])
            encoded_df[col] = encoded_col
        return encoded_df


class TaxonomicKNNRegressor(BaseEstimator, RegressorMixin):
    """
    A k-NN Regressor based on taxonomic distance between species. Ties are broken with the numerical column maximum
    weight Wwi
    """
    def __init__(self, col_types, n_neighbors=1):
        self.n_neighbors = n_neighbors
        self.col_types = col_types
        self.wi_col = col_types['input']['all'].index('Wwi')
        self.taxonomy_cols = [col_types['input']['all'].index(taxon) for taxon in col_types['input']['category']]
        self.knn_model = None
        self.train_data = None
        self.train_targets = None
        self.train_weights = None

    @staticmethod
    def _taxonomy_distance(tax1, tax2):
        # Custom distance function for taxonomy
        distance = 0
        for i in range(len(tax1)):
            if tax1[i] != tax2[i]:
                # Assign a penalty based on the taxonomic level
                distance += 2 ** (len(tax1) - i - 1)
        return distance

    def _compute_distance_matrix(self, data_a, data_b, weights_a, weights_b):
        # Compute pairwise distances between all elements in data_a and data_b
        n_a, n_b = len(data_a), len(data_b)
        distance_matrix = np.zeros((n_a, n_b))

        for i in range(n_a):
            for j in range(n_b):
                taxonomy_distance = self._taxonomy_distance(data_a[i], data_b[j])
                weight_distance = abs(weights_a[i] - weights_b[j]) if taxonomy_distance == 0 else 0
                distance = taxonomy_distance + weight_distance * 0.01  # Small weight to break ties
                distance_matrix[i, j] = distance

        return distance_matrix

    def fit(self, X, y):
        if self.wi_col is None:
            raise ValueError("wi_col must be specified when initializing the regressor.")
        self.train_data = X[:, self.taxonomy_cols]
        self.train_targets = y
        self.train_weights = X[:, self.wi_col]

        # Compute pairwise distances within the training set
        train_distance_matrix = self._compute_distance_matrix(self.train_data, self.train_data, self.train_weights,
                                                              self.train_weights)

        # Fit the 1-NN model using the training distance matrix
        self.knn_model = NearestNeighbors(n_neighbors=self.n_neighbors, metric='precomputed')
        self.knn_model.fit(train_distance_matrix)

        return self

    def predict(self, X):
        if self.knn_model is None:
            raise NotFittedError(
                "This TaxonomicKNNRegressor instance is not fitted yet. Call 'fit' with appropriate arguments before "
                "using this estimator.")

        test_data = X[:, self.taxonomy_cols]
        test_weights = X[:, self.wi_col]

        # Compute distances from each test sample to each training sample
        test_distance_matrix = self._compute_distance_matrix(test_data, self.train_data, test_weights,
                                                             self.train_weights)

        # Find the nearest neighbor in the training set for each test sample
        distances, indices = self.knn_model.kneighbors(test_distance_matrix)

        # Predict the target values based on the nearest neighbors
        predictions = [self.train_targets[idx[0]] for idx in indices]

        return np.array(predictions)
