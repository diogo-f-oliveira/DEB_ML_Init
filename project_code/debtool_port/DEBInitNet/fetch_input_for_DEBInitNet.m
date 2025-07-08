function [inputData, flag] = fetch_input_for_DEBInitNet(data, auxData, metaData, par, metaPar)
% created 2025/06/20 by Diogo F. Oliveira

%% Syntax
% [inputData, flag] = <../fetch_input_for_DEBInitNet.m *fetch_input_for_DEBInitNet*> (data, auxData, metaData, par, metaPar)

%% Description
% Fetches data and metadata from the mydata_my_pet.m file and formats it so it can be used as input 
% for the DEBInitNet parameter initialization method. Assumes data are in standard units (d, g, cm).
% 
% The following datasets are required to exist
%   ab, am, Wwb, Wwp, Wwi, Ri
% 
% If some dataset does not exist, then it tries to fill in its value from other datasets:
%   - ab: can be computed from tg
%   - Wwb, Wwp, Wwi: can be computed from the respective dry weights or via isomorphy if a pair of
%   weight and length exist at the same transition
%   - Ri: can be computed from Ni and am
%
% Time dependent datasets (ab, am, Ri) are normalized to the reference temperature. 
% In addition to the above datasets, the following are also collected to be used as input:
%   - d_V: obtained from get_d_V
%   - T_typical: obtained from metaData
%   - metamorphosis: whether the model is abj or not, obtained from metaPar
%   - class: the class taxon of the species, obtained from metaData
%   - ecocodes habitat, climate, migrate, and food, obtained from metaData
%
% Input
%
% * data: structure with values of data (only zero-variate data are used)
% * auxData: structure with auxiliary data (includes temperatures)
% * metaData: structure with info about data
% * par: structure with parameter values (used to get T_A and T_ref)
% * metaPar: structure with information on metaparameters (used to get the model type)
%
% Output
% * inputData: vector with the above data in the correct format to be given to DEBInitNet
% * flag: identifier for whether the input data was successful or where it failed
%   - 0: successful
%   - 1: missing age at birth (ab)
%   - 2: missing lifespan (am)
%   - 3: missing wet weight at birth, puberty or ultimate
%   - 4: missing reproduction rate

%% Remarks 
% Description of the DEBInitMethod is given in Oliveira et al. (in prep)
% The data preparation is described in section 3.

flag = 0;
inputData = zeros(34, 1);

% TODO: Other temperature corrections
pars_T = [par.T_A];

%% Zero-variate data
% age at birth, ab
if isfield(data, 'ab')
    ab = data.ab;
    temp = auxData.temp.ab;
elseif isfield(data, 'tg')
    temp = auxData.temp.tg;
    if isfield(data, 't_0')
        ab = data.tg + data.t_0;
    else
        ab = data.tg;
    end
else % Missing ab
    flag = 1; return;
end
abT = ab / tempcorr(temp, par.T_ref, pars_T);

% lifespan, am
if isfield(data, 'am')
    amT = data.am / tempcorr(auxData.temp.am, par.T_ref, pars_T);
else % Missing am
    flag = 2; return
end

% d_V
d_V = get_d_V(metaData.phylum, metaData.class);

% Weights at birth, puberty and ultimate
WLFactor = get_weight_length_proportion(data);
transitions = {'b', 'p', 'i'};
transitionWeights = struct('Wwb', nan, 'Wwp', nan, 'Wwi', nan);
for t=1:numel(transitions)
    wtr = ['Ww' transitions{t}];
    ltr = ['L' transitions{t}];
    if isfield(data, wtr) % Check if weight at transition exists
        transitionWeights.(wtr) = data.(wtr);
    elseif ~isnan(WLFactor) && isfield(data, ltr) % Check if length exists and convert to weight
        transitionWeights.(wtr) = WLFactor * data.(ltr)^3; 
    end
end
% For Aves species, impute Wwp with 0.95 * Wwi
if isnan(transitionWeights.Wwp) && ~isnan(transitionWeights.Wwi) && strcmp(metaData.class, 'Aves')
    transitionWeights.Wwp = 0.95 * transitionWeights.Wwi;
end
% Check if any weight is missing
if any(isnan(struct2array(transitionWeights)))
    flag = 3; return
end

% Reproduction rate
if isfield(data, 'Ri')
    RiT = data.Ri * tempcorr(auxData.temp.Ri, par.T_ref, pars_T);
elseif isfield(data, 'Ni')
    RiT = data.Ni / amT * tempcorr(auxData.temp.Ni, par.T_ref, pars_T);
else
    flag = 4; return
end

% Typical temperature
T_typical = metaData.T_typical;

% All zero-variate data is available, so there is enough data to run the
% model

%% Categorical data

% Metamorphosis
metamorphosis = strcmp(metaPar.model, 'abj');

% Class
classes = {'Aves', 'Actinopterygii', 'Reptilia', 'Chondrichthyes', 'Amphibia', 'Mammalia', ...
    'Bivalvia', 'Branchiopoda', 'Malacostraca'};
classMatches = strcmp(metaData.class, classes);
classDummies = [~any(classMatches) classMatches];

% Climate
climateCodes = {'A', 'B', 'C', 'D', 'E'};
climateDummies = zeros(1, numel(climateCodes));
for c=1:numel(climateCodes)
    for i=1:numel(metaData.ecoCode.climate)
        if any(ismember(metaData.ecoCode.climate{i}, climateCodes{c}))
            climateDummies(c) = true;
            break
        end
    end
end

% Habitat
habitatCodes = {'T', 'F', 'S', 'M',};
habitatDummies = zeros(1, numel(habitatCodes));
for h=1:numel(habitatCodes)
    for i=1:numel(metaData.ecoCode.habitat)
        if any(ismember(metaData.ecoCode.habitat{i}, habitatCodes{h}))
            habitatDummies(h) = true;
            break
        end
    end
end

% Migrate
migrateCodes = {'T'};
migrateDummies = zeros(1, numel(migrateCodes));
for m=1:numel(migrateCodes)
    for i=1:numel(metaData.ecoCode.migrate)
        if any(ismember(metaData.ecoCode.migrate{i}, migrateCodes{m}))
            migrateDummies(m) = true;
            break
        end
    end
end

% Food
foodCodes = {'P', 'O', 'H', 'C',};
foodDummies = zeros(1, 1+numel(foodCodes)); % First column is for other codes of food
for f=1:numel(foodCodes) 
    for i=1:numel(metaData.ecoCode.food)
        if any(ismember(metaData.ecoCode.food{i}, foodCodes{f}))
            foodDummies(f+1) = true;
            break
        end
    end
end
if ~any(foodDummies)
    foodDummies(1) = true;
end

%% Pack to output

inputData = [abT, amT, d_V, ...
    transitionWeights.Wwb, transitionWeights.Wwp, transitionWeights.Wwi, ...
    RiT, T_typical, metamorphosis, ...
    classDummies, ...,
    climateDummies, habitatDummies, migrateDummies, foodDummies,
    ]';

end

function WLFactor = get_weight_length_proportion(data)
    transitions = {'b', 'j', 'x', 'p', 'i'};
    WLFactor = nan;
    factors = [];
    for t=1:numel(transitions)
        wtr = ['Ww' transitions{t}];
        ltr = ['L' transitions{t}];
        if isfield(data, {wtr, ltr})
            factors(end+1) = data.(wtr) / (data.(ltr)^3);
        end
    end
    if numel(factors)
        WLFactor = mean(factors);
    end
end