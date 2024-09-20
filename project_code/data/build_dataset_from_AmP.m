clear all
format long

AmPDataFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\';
% allStatPath = [AmPDataFolder 'allStat.mat'];
speciesFolder = [AmPDataFolder 'species\'];
saveFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\data\raw';
tableSavePath = [saveFolder '\dataset_matlab.csv'];

%% Get list of species

% Get a list of all files and folders in the specified directory
allFiles = dir(speciesFolder);

% Filter the list to include only directories
isDir = [allFiles.isdir]; % Logical index for directories
speciesList = {allFiles(isDir).name}; % Extract names of directories

% Remove '.' and '..' from the list (current and parent directory)
speciesList = speciesList(~ismember(speciesList, {'.', '..'}));
allFiles = allFiles(~ismember(speciesList, {'.', '..'}));
numSpecies = length(speciesList);

%% Create the table
% Define columns
parameterCols = {'p_Am', 'kap', 'v', 'p_M', 'E_G', 'h_a', 'E_Hb', 'E_Hj', 'E_Hx', 'E_Hp'};
taxonomyCols = {'family', 'order', 'class', 'phylum'};
ecoCodeCols = {'climate', 'ecozone', 'habitat', 'embryo', 'migrate', 'food', 'gender', 'reprod'};
ageDataCols = {'ab', 'ah', 'aj', 'ax', 'ap', 'am'};
timeSinceBirthDataCols = {'tg', 'tb', 'tj', 'tx', 'tp'};
weightDataCols = {'Wwb', 'Wwj', 'Wwx', 'Wwp', 'Wwi'};
lengthDataCols = {'Lb', 'Lj', 'Lx', 'Lp', 'Li'};
otherCols = {'d_V', 'Ri', 'T_typical', 't_0', 'model'};
columnNames = [parameterCols taxonomyCols ecoCodeCols ageDataCols timeSinceBirthDataCols weightDataCols lengthDataCols otherCols];
numCols = length(columnNames);
validModelTypes = {'std', 'stf', 'stx', 'abj'};

% Measurement units for each type
defaultUnits = struct('weight', 'g', 'length', 'cm', 'time', 'd');

% Define variable types based on the column names
varTypes = {
    'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', ... % parameterCols
    'string', 'string', 'string', 'string', ... % taxonomyCols
    'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string', ... % ecoCodeCols 
    'double', 'double', 'double', 'double', 'double', 'double',... %ageDataCols
    'double', 'double', 'double', 'double', 'double', ... % timeSinceBirthDataCols
    'double', 'double', 'double', 'double', 'double', ... % weightDataCols
    'double', 'double', 'double', 'double', 'double', ... % lengthDataCols
    'double', 'double', 'double', 'double', 'string', ... % otherCols
    };

% Initialize the table with missing values
T = table('Size', [numSpecies, numCols], 'VariableTypes', varTypes, 'VariableNames', columnNames, 'RowNames', speciesList);

for i = 1:numCols
    if strcmp(varTypes{i}, 'double')
        T{:, i} = NaN; % Use NaN for double types
    end
end

%% Loop through species
% Create progress bar
h = waitbar(0, 'Processing species...', 'Name', 'Building dataset', 'CreateCancelBtn', 'setappdata(gcbf, ''canceling'', 1)', 'WindowStyle', 'docked');
% Check for cancel button press
setappdata(h, 'canceling', 0);

for i=1:numSpecies
    % Update the progress bar
    speciesName = speciesList{i};
    waitbar(i / numSpecies, h, sprintf('Processing species %40s\n%d of %d\n', speciesName, i, numSpecies));

    folder = [speciesFolder speciesName];
    cd(folder);
    % Check if mydata.m and pars_init.m files exist
    mydataFilePath = [folder '/mydata_' speciesName];
    parsInitFilePath = [folder '/pars_init_' speciesName];
    if (exist(mydataFilePath, 'file') ~= 2) || (exist(parsInitFilePath, 'file') ~= 2)
        fprintf('Missing files for species %s\n', speciesName)
        continue
    end

    % Load mydata.m and pars_init.m file
    try
        [data, auxData, metaData, txtData, weights] = feval(['mydata_' speciesName]);
        [par, metaPar, txtPar] = feval(['pars_init_' speciesName], metaData);
    catch ME
        fprintf(ME.message)
        continue
    end
    % Check for valid model
    modelType = metaPar.model;
    if ~ismember(modelType, validModelTypes)
        continue
    end
    T{speciesName, 'model'} = string(modelType);

    % Fetch parameters
    for p=2:length(parameterCols)
        parName = parameterCols{p};
        if isfield(par, parName)
            T{speciesName, parName} = par.(parName);
        end
    end
    T{speciesName, 'p_Am'} = par.z * par.p_M / par.kap;

    % Fetch taxonomy
    for n=1:length(taxonomyCols)
        colName = taxonomyCols{n};
        T{speciesName, colName} = string(metaData.(colName));
    end
    T{speciesName, 'T_typical'} = metaData.T_typical;
    
    % Fetch ecocodes
    for e=1:length(ecoCodeCols)
        if ~isfield(metaData, 'ecoCode')
            fprintf('Species %s has no ecocodes defined \n', speciesName)
            break
        end
        colName = ecoCodeCols{e};
        if isempty(metaData.ecoCode.(colName))
            continue
        else
            T{speciesName, colName} = string(strjoin(metaData.ecoCode.(colName)));
        end
    end
    
    % Get d_V
    if isfield(par, 'd_V')
        T{speciesName, 'd_V'} = par.d_V;
    else
        T{speciesName, 'd_V'} = get_d_V(metaData.phylum, metaData.class);
    end

    % Get t_0
    if isfield(par, 't_0')
        T{speciesName, 't_0'} = par.t_0;
    end

    % Default temperature correction factor
    defaultTC = tempcorr(metaData.T_typical, par.T_ref, par.T_A);

    % Fetch age datasets
    for a=1:length(ageDataCols)
        ageDataset = ageDataCols{a};
        if isfield(data, ageDataset)
            if isfield(auxData.temp, ageDataset)
                TC = tempcorr(auxData.temp.(ageDataset), par.T_ref, par.T_A);
            else
                TC = defaultTC;
            end
            if isfield(txtData.units, ageDataset)
                ageValue = convertMeasurementUnits(data.(ageDataset), txtData.units.(ageDataset), defaultUnits.time, speciesName);
            else
                % Assume age measurement is in 'd'
                ageValue = data.(ageDataset);
                fprintf('Species %s does not have units for age measurement %s.\n', speciesName, ageDataset);
            end
            T{speciesName, ageDataset} = ageValue / TC;
        end
    end

    % Fetch time since birth dataset
    for t=1:length(timeSinceBirthDataCols)
        tsbDataset = timeSinceBirthDataCols{t};
        if isfield(data, tsbDataset)
            if isfield(auxData.temp, tsbDataset)
                TC = tempcorr(auxData.temp.(tsbDataset), par.T_ref, par.T_A);
            else
                TC = defaultTC;
            end
            if isfield(txtData.units, tsbDataset)
                tsbValue = convertMeasurementUnits(data.(tsbDataset), txtData.units.(tsbDataset), defaultUnits.time, speciesName);
            else
                % Assume time since birth measurement is in 'd'
                tsbValue = data.(tsbDataset);
                fprintf('Species %s does not have units for time since birth measurement %s.\n', speciesName, tsbDataset);
            end
            T{speciesName, tsbDataset} = tsbValue / TC;
        end
    end

    % Fetch reproduction rate
    if isfield(data, 'Ri')
        if isfield(auxData.temp, 'Ri')
            TC = tempcorr(auxData.temp.Ri, par.T_ref, par.T_A);
        else
            TC = defaultTC;
        end
        T{speciesName, 'Ri'} = data.Ri * TC;
    end

    % Fetch length datasets
    for l=1:length(lengthDataCols)
        lenDataset = lengthDataCols{l};
        if isfield(data, lenDataset)
            if isfield(txtData.units, lenDataset)
                lenValue = convertMeasurementUnits(data.(lenDataset), txtData.units.(lenDataset), defaultUnits.length, speciesName);
            else
                % Assume length measurement is in 'cm'
                lenValue = data.(lenDataset);
                fprintf('Species %s does not have units for length measurement %s.\n', speciesName, lenDataset);
            end
            T{speciesName, lenDataset} = lenValue;
        end
    end

    % Fetch weight datasets
    for w=1:length(weightDataCols)
        weightDataset = weightDataCols{w};
        maturityPhase = weightDataset(end);
        if isfield(data, weightDataset)
            if isfield(txtData.units, weightDataset)
                weightValue = convertMeasurementUnits(data.(weightDataset), txtData.units.(weightDataset), defaultUnits.weight, speciesName);
            else
                % Assume weight measurement is in 'g'
                weightValue = data.(weightDataset);
                fprintf('Species %s does not have units for weight measurement %s.\n', speciesName, weightDataset);
            end
            T{speciesName, weightDataset} = weightValue;
        else % Check if data for dry weight exists and convert to wet weight
            dryWeightDataset = ['Wd' maturityPhase];
            if isfield(data, dryWeightDataset)
                if isfield(txtData.units, dryWeightDataset)
                    dryWeightValue = convertMeasurementUnits(data.(dryWeightDataset), txtData.units.(dryWeightDataset), defaultUnits.weight, speciesName);
                else % Assume weight measurement is in 'g'
                    dryWeightValue = data.(dryWeightDataset);
                    fprintf('Species %s does not have units for weight measurement %s.\n', speciesName, weightDataset);
                end
                T{speciesName, weightDataset} = dryWeightValue / T{speciesName, 'd_V'};
            end
        end
    end

    % Check for cancel button press
    if getappdata(h, 'canceling')
        delete(h)
        fprintf('Stopped execution on species %s, %d of %d\n', speciesName, i, numSpecies)
        break;
    end
end


%% Save the table as a .csv file
writetable(T, tableSavePath,'WriteRowNames',true);
fprintf('Table saved in %s\n', tableSavePath);
delete(h)

function [convertedValue] = convertMeasurementUnits(value, origUnit, targetUnit, speciesName)

% EDGE CASES: Correctly format measurements in micro units
if (length(origUnit) > 1) && (strcmp(origUnit(1:2),'mu'))
    origUnit = origUnit(2:end);
elseif (length(origUnit) > 6) && strcmp(origUnit(1:6), 'micro ')
    origUnit = ['u' origUnit(7:end)];
end
usym = symunit;
try
    symOrigUnit = str2symunit(origUnit);
catch ME
    fprintf(ME.message)
    % Assume value is in target unit (assume that there has been a mistake in defining the unit in the mydata.m file)
    convertedValue = value;
    fprintf('\nFor species %s: ''%s'' is not a unit.\n', speciesName, origUnit)
    return
end
% Check if unit conversion is compatible
if checkUnits(symOrigUnit == usym.(targetUnit), 'Compatible')
    % Convert units
    measurement = value * usym.(origUnit);
    convertedMeasurement = unitConvert(measurement, usym.(targetUnit));
    convertedValue = separateUnits(convertedMeasurement);
else % Assume value is in target unit (assume that there has been a mistake in defining the unit in the mydata.m file)
    fprintf('For species %s: measurement in unit ''%s'' is not compatible with target unit ''%s''\n', speciesName, origUnit, targetUnit)
    convertedValue = value;
end
end
