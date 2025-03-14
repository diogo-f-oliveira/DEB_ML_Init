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
    weight Wwi.
    """
    LINEAR_SCALING_COLS = ['p_Am', 'h_a']
    CUBE_SCALING_COLS = ['E_Hb', 'E_Hj', 'E_Hx', 'E_Hp']
    PENALTY_NO_ESTIM_k_J = 10000

    def __init__(self, col_types, taxonomy_encoder, n_neighbors=1, use_scaling_relationships=True,
                 ultimate_weight_factor=0.01, deb_model_factor=0):
        self.n_neighbors = n_neighbors
        self.col_types = col_types
        self.output_col_idx_dict = {col: i for i, col in enumerate(col_types['output']['all'])}

        self.taxonomy_encoder = taxonomy_encoder
        if not len(self.taxonomy_encoder.taxonomy_col_names):
            raise Exception("Missing taxonomic columns in dataset.")
        self.taxonomy_cols = [col_types['input']['all'].index(taxon) for taxon in taxonomy_encoder.taxonomy_col_names]

        if 'Wwi' not in col_types['input']['all']:
            raise Exception("Missing maximum weight column 'Wwi' in dataset.")
        self.wi_col = col_types['input']['all'].index('Wwi')
        self.ultimate_weight_factor = ultimate_weight_factor

        if 'estim_k_J' not in col_types['input']['all']:
            raise Exception("Missing column 'estim_k_J' that says whether k_J is to be estimated")
        self.estim_k_J = col_types['input']['all'].index('estim_k_J')
        self.k_J_col = col_types['input']['all'].index('k_J')

        if 'metamorphosis' not in col_types['input']['all']:
            raise Exception("Missing column 'metamorphosis' to differentiate DEB models of species")
        self.abj_col = col_types['input']['all'].index('metamorphosis')
        self.deb_model_factor = deb_model_factor

        self.use_scaling_relationships = use_scaling_relationships

        self.knn_model = None
        self.train_data = None
        self.train_targets = None

    def encode_data(self, df):
        encoded_df = self.taxonomy_encoder.transform(df)
        return encoded_df

    @staticmethod
    def _taxonomy_distance(tax1, tax2):
        # Custom distance function for taxonomy
        distance = 0
        for i in range(len(tax1)):
            if tax1[i] != tax2[i]:
                # Assign a penalty based on the taxonomic level
                distance += 1
        return distance

    def _compute_distance_matrix(self, data_queries, data_indexed, data_split='test'):
        # Compute pairwise distances between all elements in data_a and data_b
        n_queries, n_indexed = data_queries.shape[0], data_indexed.shape[0]
        distance_matrix = np.zeros((n_queries, n_indexed))

        for q in range(n_queries):
            for i in range(n_indexed):
                # Get taxonomy distance
                taxonomy_distance = self._taxonomy_distance(
                    tax1=data_queries[q, self.taxonomy_cols],
                    tax2=data_indexed[i, self.taxonomy_cols]
                )
                # Get weight distance
                weight_distance = abs(data_queries[q, self.wi_col] - data_indexed[i, self.wi_col])
                # Add distance between ultimate weights
                distance = (taxonomy_distance + weight_distance * self.ultimate_weight_factor)
                # Add distance if DEB models are not the same
                distance += self.deb_model_factor * (data_queries[q, self.abj_col] + data_indexed[i, self.abj_col])
                # Add penalty if k_J is not to be estimated for query but was estimated for indexed species
                incompatible_estim_k_J = (not data_queries[q, self.estim_k_J]) and bool(data_indexed[i, self.estim_k_J])
                k_J_distance = abs(data_queries[q, self.k_J_col] - data_indexed[i, self.k_J_col])
                distance += self.PENALTY_NO_ESTIM_k_J * incompatible_estim_k_J * k_J_distance

                # In case distance is zero for multiple species during training, add small factor to ensure the nearest
                # neighbor is itself
                if distance == 0 and data_split == 'train' and q != i:
                    distance += 1e-10
                distance_matrix[q, i] = distance

        return distance_matrix

    def fit(self, X, y):
        if self.wi_col is None:
            raise ValueError("wi_col must be specified when initializing the regressor.")
        self.train_data = X
        self.train_targets = y

        # Compute pairwise distances within the training set
        train_distance_matrix = self._compute_distance_matrix(self.train_data, self.train_data, data_split='train')

        # Fit the 1-NN model using the training distance matrix
        self.knn_model = NearestNeighbors(n_neighbors=self.n_neighbors, metric='precomputed')
        self.knn_model.fit(train_distance_matrix)

        return self

    def predict(self, X):
        if self.knn_model is None:
            raise NotFittedError(
                "This TaxonomicKNNRegressor instance is not fitted yet. Call 'fit' with appropriate arguments before "
                "using this estimator.")

        # Compute distances from each test sample to each training sample
        test_distance_matrix = self._compute_distance_matrix(X, self.train_data, data_split='test')

        # Get parameter values for closest species
        y_hat, indices = self.get_predictions_from_distance_matrix(test_distance_matrix)

        # Apply scaling laws
        y_hat = self.apply_scaling_relationships(X, y_hat, indices)

        return y_hat

    def get_predictions_from_distance_matrix(self, distance_matrix):
        # Find the nearest neighbor in the training set for each test sample
        distances, indices = self.knn_model.kneighbors(distance_matrix)

        # Predict the target values based on the nearest neighbors
        predictions = [self.train_targets[idx[0]] for idx in indices]

        return np.array(predictions), indices

    def apply_scaling_relationships(self, X, y, indices):
        if not self.use_scaling_relationships:
            return y

        # Get zoom factor ratios
        train_maximum_weights = self.train_data[indices, self.wi_col].ravel()
        target_maximum_weights = X[:, self.wi_col]
        zoom_factor_ratios = np.exp((target_maximum_weights - train_maximum_weights) / 3)

        # Scale parameters by 'z'
        for col in self.LINEAR_SCALING_COLS:
            if col in self.output_col_idx_dict:
                col_idx = self.output_col_idx_dict[col]
                y[:, col_idx] *= zoom_factor_ratios
        # Scale parameters by 'z^3'
        for col in self.CUBE_SCALING_COLS:
            if col in self.output_col_idx_dict:
                col_idx = self.output_col_idx_dict[col]
                y[:, col_idx] *= np.power(zoom_factor_ratios, 3)

        return y
