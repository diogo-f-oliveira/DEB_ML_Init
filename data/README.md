# DEBMLInit Dataset
The content of this dataset is derived from the [Add-my-Pet (AmP) collection](https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/) 
and is used in the paper: 

> Oliveira, D.F., Marques, G.M., Santos, F.M.P., Pecquerie, L., Sousa, J.M.C., Domingos, T. (2025).
Reliable machine learning initialization methods for the calibration of Dynamic Energy Budget models. 
Available at SSRN: https://ssrn.com/abstract=5434102 or http://dx.doi.org/10.2139/ssrn.5434102.

The dataset follows the structure below:
```
data/
├───deb_model_predictions
├───interim
├───processed
│   ├───init_net
│   └───taxo1nn
├───raw
├───species
├───PROVENANCE.md
└───README.md
```

The DEB models of the species included in this dataset were downloaded from AmP are a copy of each is stored in the 
folder `/species`. 
The parameters of each species were reestimated by starting from the parameters in AmP and applied repeated runs of the 
Nelder-Mead algorithm, each with 500 steps and alternating the direction of the simplex size (either +0.02 or -0.02 of
the current parameter values). We stopped the estimation when a run of Nelder-Mead converged, when the difference in 
loss function after two runs was less than $10^{−4}$, or when a maximum time limit of 15 hours was reached.
The final parameters are stored in the `results_species.mat` file of each species. 

The raw data consists of the parameters and zero-variate traits of the species.
A full description of the collect data is available in section 3.1 of the paper.
The dataset is available in a `.csv` file in `/raw/raw_amp_dataset.csv`.
In the folder `deb_model_predictions`, the file `metamorphosis_predictions.csv` contains the predicitons of species 
with an abj DEB model, which are needed to derive the value of $s_M=L_j/L_b$ for the species.

The interim data is obtained by imputing missing values with theory-based techniques.
A description of the theoretical relationships used is in section 3.2 of the paper.
The dataset is available in a `.csv` file in `/interim/filled_data.csv`.

The final dataset has different structure depending on the machine learning model.
For the neural networks, the dataset is stored in `/processed/init_net`. 
For the taxonomic 1-nearest neighbor models, the dataset is stored in `/processed/taxo1nn`. 
For each version, the species included in the dataset are the same. 
There are .csv files for the full dataset as well as the train, test, and validation splits, which are the same
for both versions.
The `types_of_col.json` file is used by the Python code to handle the different types of data in the dataset.

