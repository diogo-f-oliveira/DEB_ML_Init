%% Clear workspace
% Delete an existing progress bar in case it was not properly delete before
if exist('h', 'var')
    delete(h)
end

clear all
format long

%% Define paths to files

AmPDataFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\';
% allStatPath = [AmPDataFolder 'allStat.mat'];
speciesFolder = [AmPDataFolder 'species\'];
saveFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\data\raw';
tableSavePath = [saveFolder '\dataset_matlab_20250128.csv'];

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
parameterCols = {'p_Am', 'kap', 'v', 'p_M', 'E_G', 'h_a', 'E_Hb', 'E_Hj', 'E_Hx', 'E_Hp', 'k_J', 'kap_R', 'kap_X', 'kap_P'};
taxonomyCols = {'family', 'order', 'class', 'phylum'};
ecoCodeCols = {'climate', 'ecozone', 'habitat', 'embryo', 'migrate', 'food', 'gender', 'reprod'};
ageDataCols = {'ab', 'ah', 'aj', 'ax', 'ap', 'am'};
timeSinceBirthDataCols = {'tg', 'tb', 'tj', 'tx', 'tp'};
weightDataCols = {'Wwb', 'Wwj', 'Wwx', 'Wwp', 'Wwi'};
lengthDataCols = {'Lb', 'Lj', 'Lx', 'Lp', 'Li'};
reproductionDataCols = {'Ri', 'Ni', 'GSI', 'NR'};
otherCols = {'d_V', 'T_typical', 'f', 't_0', 'model', 'completeness'};
columnNames = [parameterCols taxonomyCols ecoCodeCols ageDataCols timeSinceBirthDataCols weightDataCols lengthDataCols reproductionDataCols otherCols];
numCols = length(columnNames);
validModelTypes = {'std', 'stf', 'stx', 'abj'};

% Measurement units for each type

defaultUnits = struct('weight', 'g', 'length', 'cm', 'time', 'd', 'Ri', 'item/d', 'Ni', 'item', 'NR', 'item', 'GSI', '1');
defaultUnits = structfun(@(f) str2symunit(f), defaultUnits, 'UniformOutput', false);

% Define variable types based on the column names
varTypes = {
    'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', ... % parameterCols
    'string', 'string', 'string', 'string', ... % taxonomyCols
    'string', 'string', 'string', 'string', 'string', 'string', 'string', 'string', ... % ecoCodeCols
    'double', 'double', 'double', 'double', 'double', 'double',... %ageDataCols
    'double', 'double', 'double', 'double', 'double', ... % timeSinceBirthDataCols
    'double', 'double', 'double', 'double', 'double', ... % weightDataCols
    'double', 'double', 'double', 'double', 'double', ... % lengthDataCols
    'double', 'double', 'double', 'double', ... % reproductionCols
    'double', 'double', 'double', 'double', 'string', 'double',... % otherCols
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
    waitbar(i / numSpecies, h, sprintf('Processing species %40s\n%d of %d\n', strrep(speciesName, '_', ' '), i, numSpecies));

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
    % if ~ismember(modelType, validModelTypes)
    %     continue
    % end
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
    T{speciesName, 'completeness'} = metaData.COMPLETE;

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
    % Get f
    if isfield(par, 'f')
        T{speciesName, 'f'} = par.f;
    end

    % Get data fields
    dataFields = fieldnames(data);
    % Default temperature correction factor
    defaultTC = tempcorr(metaData.T_typical, par.T_ref, par.T_A);

    % Fetch age datasets
    for a=1:length(ageDataCols)
        ageDataset = ageDataCols{a};
        matchingFields = getMatchingFields(dataFields, ageDataset);
        if numel(matchingFields)
            % Get value closest to typical temperature, correct it for
            % temperature and convert it to default units
            [ageValue, TC] = findValueClosestToTypicalTemperature(data, auxData.temp, metaData, txtData, par, defaultUnits.time, matchingFields);
            T{speciesName, ageDataset} = ageValue / TC;
        end
    end

    % Fetch time since birth dataset
    for t=1:length(timeSinceBirthDataCols)
        tsbDataset = timeSinceBirthDataCols{t};
        matchingFields = getMatchingFields(dataFields, tsbDataset);
        if numel(matchingFields)
            % Get value closest to typical temperature, correct it for
            % temperature and convert it to default units
            [tsbValue, TC] = findValueClosestToTypicalTemperature(data, auxData.temp, metaData, txtData, par, defaultUnits.time, matchingFields);
            T{speciesName, tsbDataset} = tsbValue / TC;
        end
    end

    % Fetch reproduction cols
    matchingFields = getMatchingFields(dataFields, 'Ri');
    if numel(matchingFields)
        [reprodRateValue, TC] = findValueClosestToTypicalTemperature(data, auxData.temp, metaData, txtData, par, defaultUnits.Ri, matchingFields);
        T{speciesName, 'Ri'} = reprodRateValue * TC;
    end
    for r=2:length(reproductionDataCols)
        reprodDataset = reproductionDataCols{r};
        [matchingFields, exactMatchIndex] = getMatchingFields(dataFields, reprodDataset);
        if numel(matchingFields)
            T{speciesName, reprodDataset} = findUnitConvertedMeanValueForDataType(data, metaData, txtData, defaultUnits.(reprodDataset), matchingFields, exactMatchIndex);
        end
    end
    % Fetch length datasets
    for l=1:length(lengthDataCols)
        lenDataset = lengthDataCols{l};
        [matchingFields, exactMatchIndex] = getMatchingFields(dataFields, lenDataset);
        if numel(matchingFields)
            T{speciesName, lenDataset} = findUnitConvertedMeanValueForDataType(data, metaData, txtData, defaultUnits.length, matchingFields, exactMatchIndex);
        end
    end

    % Fetch weight datasets
    for w=1:length(lengthDataCols)
        weightDataset = weightDataCols{w};
        [matchingFields, exactMatchIndex] = getMatchingFields(dataFields, weightDataset);
        if numel(matchingFields)
            T{speciesName, weightDataset} = findUnitConvertedMeanValueForDataType(data, metaData, txtData, defaultUnits.weight, matchingFields, exactMatchIndex);
        else
            maturityPhase = weightDataset(end);
            dryWeightDataset = ['Wd' maturityPhase];
            [matchingFields, exactMatchIndex] = getMatchingFields(dataFields, dryWeightDataset);
            if numel(matchingFields)
                dryWeightValue = findUnitConvertedMeanValueForDataType(data, metaData, txtData, defaultUnits.weight, matchingFields, exactMatchIndex);
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


function [matchingFields, exactMatchIndex] = getMatchingFields(dataFields, datasetName)
matchingFields = dataFields(startsWith(dataFields, datasetName) & ~contains(dataFields, '_m') & ~strcmp(dataFields, [datasetName 'm']));
exactMatchIndex = find(strcmp(matchingFields, datasetName), 1);
end

function [convertedValue] = convertMeasurementUnits(value, origUnit, targetUnit, speciesName)

% EDGE CASES: Correctly format measurements in micro units
if (length(origUnit) > 1) && (strcmp(origUnit(1:2),'mu'))
    origUnit = origUnit(2:end);
elseif (length(origUnit) > 6) && strcmp(origUnit(1:6), 'micro ')
    origUnit = ['u' origUnit(7:end)];
end
% Replace # with 'item'
origUnit = strrep(origUnit, '#', 'item');
% Replace '-' with 'g/g' (dimensionless)
origUnit = strrep(origUnit, '-', '1');
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
if checkUnits(symOrigUnit == targetUnit, 'Compatible')
    % Convert units
    measurement = value * symOrigUnit;
    convertedMeasurement = unitConvert(measurement, targetUnit);
    convertedValue = separateUnits(convertedMeasurement);
else % Assume value is in target unit (assume that there has been a mistake in defining the unit in the mydata.m file)
    fprintf('For species %s: measurement in unit ''%s'' is not compatible with target unit ''%s''\n', speciesName, origUnit, symunit2str(targetUnit))
    convertedValue = value;
end
end

function [dataValue, TC] = findValueClosestToTypicalTemperature(data, temp, metaData, txtData, par, defaultUnit, matchingFields)
% Function to find the value in 'data' corresponding to the field in 'temp'
% that is closest to 'T_typical' among the given 'matchingFields'.
%
% Inputs:
% - data: A struct containing data fields.
% - temp: A struct containing comparison fields.
% - T_typical: A numeric value to compare against the 'temp' fields.
% - matchingFields: A cell array of field names that match the criteria.
%
% Output:
% - dataValue: The value in 'data' corresponding to the closest matching field.

% Initialize variables to track the closest difference and field
minDifference = inf;  % Set an initially high difference
closestField = '';

% Iterate over the matching fields and find the one in 'temp' closest to 'T_typical'
for i = 1:numel(matchingFields)
    currentField = matchingFields{i};

    % Check if 'temp' has this field
    if isfield(temp, currentField)
        if isscalar(data.(currentField))
            % Get the value from 'temp'
            tempValue = temp.(currentField);

            % Compute the difference with 'T_typical'
            difference = abs(tempValue - metaData.T_typical);

            % Update the closest match if this one is better
            if difference < minDifference
                minDifference = difference;
                closestField = currentField;
            end
        end
    else
        fprintf('Species %s does not have a temperature defined for dataset %s. \n', metaData.species, currentField)
    end
end

% Now use the closestField to get the corresponding value from 'data'
if isempty(closestField)
    % If no matching field is found, it's because temp is missing so assume
    % Temperature = T_typical and select the first field
    if isscalar(data.(matchingFields{1}))
        closestField = matchingFields{1};
    else
        dataValue = nan;
        TC = nan;
        return
    end
end
dataValue = data.(closestField);
% Convert measurement to default units
if isfield(txtData.units, closestField)
    dataValue = convertMeasurementUnits(dataValue, txtData.units.(closestField), defaultUnit, metaData.species);
else
    % Assume age measurement is in 'd'
    fprintf('Species %s does not have units for measurement %s. \n', metaData.species, closestField);
end

% Get temperature correction factor
if isfield(temp, closestField)
    TC = tempcorr(temp.(closestField), par.T_ref, par.T_A);
else
    TC = tempcorr(metaData.T_typical, par.T_ref, par.T_A);
end
end

function [meanValue] = findUnitConvertedMeanValueForDataType(data, metaData, txtData, defaultUnit, matchingFields, exactMatchIndex)
dataValues = [];
for i = 1:numel(matchingFields)
    currentField = matchingFields{i};
    % Convert measurement to default units
    if isfield(txtData.units, currentField)
        if isscalar(data.(currentField))
            dataValues(end+1) = convertMeasurementUnits(data.(currentField), txtData.units.(currentField), defaultUnit, metaData.species);
            % Return if an exact match is found for the data type
            if i == exactMatchIndex
                meanValue = dataValues(end);
                return
            end
        end
        fprintf('Species %s does not have units for measurement %s. \n', metaData.species, currentField);
    end
end
% Compute mean value in default units
if numel(dataValues)
    meanValue = mean(dataValues);
else
    meanValue = nan;
end
end
