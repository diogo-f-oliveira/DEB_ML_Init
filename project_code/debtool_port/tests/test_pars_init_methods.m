clear; clc;

%% Load data for species
speciesName = 'Orectolobus_maculatus';
[data, auxData, metaData, txtData, weights] = feval(['mydata_' speciesName]);
[par, metaPar, txtPar] = feval(['pars_init_' speciesName], metaData);
% Add Wwi
% data.Wwi = 15000;

%% Test pars_init_Taxo1NN
[parTaxo1NN, metaPar, txtPar] = init_Taxo1NN(data, metaData);


%% Predict parameters
% testInput = [1.5403705e+02, 8.8162334e+03, 2.0000000e-01, 5.2000000e+01, ...
%        1.4468680e+03, 2.5500000e+05, 9.2329681e-02, 2.9214999e+02, ...
%        0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]';
% testInput = [6.0102e+00, 1.2909e+03, 2.8000e-01, 8.9300e+01, 3.3535e+03, ...
%         3.5300e+03, 3.7182e-02, 3.1265e+02, ...
%         0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1]';
