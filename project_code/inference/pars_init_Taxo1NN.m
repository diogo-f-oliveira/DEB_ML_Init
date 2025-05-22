function [par, metaPar, txtPar] = pars_init_Taxo1NN(data, metaData)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

modelFolder = '../../models/Taxo1NN/';

%% Get ultimate weight
% Impute Wwi if it is missing
if isfield(data, 'Wwi')
    Wwi = data.Wwi;
elseif isfield(data, 'Li')
    if isfield(data, {'Lp', 'Wwp'})
        Wwi = data.Wwp * (data.Li / data.Lp)^3;
    elseif isfield(data, {'Lj', 'Wwj'})
        Wwi = data.Wwj * (data.Li / data.Lj)^3;
    elseif isfield(data, {'Lx', 'Wwx'})
        Wwi = data.Wwx * (data.Li / data.Lx)^3;
    elseif isfield(data, {'Lb', 'Wwb'})
        Wwi = data.Wwb * (data.Li / data.Lb)^3;
    end
else
    error('Wwi is not defined in mydata and could not be inferred from Li. It is needed to run the model.')
end
% Log scale Wwi
logWwi = log(Wwi);

%% Get par information

[par, metaPar, txtPar] = feval(['pars_init_', metaData.species], metaData);

if ~par.free.z
    error('Parameter ''z'' should be set free.')
end
parOrder = {'s_p_M', 'p_M', 'kap', 'v', 'k_J', 'E_Hb', 'E_Hp', 'E_Hj', 's_M'};
parValues = zeros(1,9);
freePar = ones(1,9);

parValues(1) = par.z; % z and s_p_M need to be free, so the value is not important

for p=2:length(parOrder)-2
    parName = parOrder{p};
    if isfield(par, parName)
        parValues(p) = par.(parName);
        freePar(p) = par.free.(parName);
    else
        error(['Parameter ' parName ' is not defined in pars_init.'])
    end
end
if isfield(par, 'E_Hj')
    parValues(8) = par.E_Hj;
    freePar(8) = par.free.E_Hj;
else
    parValues(8) = par.E_Hb;
    freePar(8) = 1;
end
parValues(9) = parValues(8) / parValues(6); % approximation for s_M = E_Hj/E_Hb



%% Load Taxo1NN model
% Load model
model = Taxo1NN(true, 0.551);
model.loadTrainingData([modelFolder '/train_data.mat']);

% Load taxonomy encoding
encoder = TaxonomicEncoder();
encoder.loadEncoding([modelFolder '/taxonomy_encoding.mat'])
% Encode taxonomic classifications
encodedTaxonomy = encoder.encode(metaData);

%% Predict parameters
% Concatenate data
X = [logWwi encodedTaxonomy parValues freePar];

% Get taxonomic 1-NN model output
yPred = model.predict(X);


%% Predict [E_G]
d_V = get_d_V(metaData.phylum, metaData.class);
kap_G = 0.8;
w_V = 23.9;
E_G = par.mu_V * d_V / kap_G / w_V;

%% Prepare output

% Save parameters into par
for p=2:length(parOrder)-2
    par.(parOrder{p}) = yPred(p);
end
if isfield(par, 'E_Hj')
    par.E_Hj = yPred(8);
end
if isfield(par, 'E_Hx')
    par.E_Hx = par.E_Hb*1.05; % Small increment to E_Hx just to ensure feasibility
end
par.E_G = E_G;

% Compute z from s_p_M
s_p_M = yPred(1);
s_M = yPred(9);
z3 = par.k_J * par.E_Hp * par.kap / (s_M^3 * s_p_M * (1-par.kap) * par.p_M);
par.z = nthroot(z3, 3);


end