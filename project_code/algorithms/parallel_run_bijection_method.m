clear all
format long

%% Define folders
scriptsFolder = pwd;
addpath(scriptsFolder)

filePathsCSVPath = '..\..\filepaths.csv';
pathsTable = readtable(filePathsCSVPath, 'Delimiter', ',', 'ReadVariableNames', true, 'ReadRowNames', true);
allSpeciesFolder = pathsTable{'species_folder', 'path'}{:};

datasetsFolder = '..\..\data\processed\';
resultsFolder = '..\..\results\';

datasetName = 'biologist_no_pub_age';
modelName = 'BijectionMethod';

datasetFile = [datasetsFolder datasetName '\' datasetName '.csv'];
parameterTableOutputFile = [resultsFolder '\parameter_predictions\' modelName '_predictions.csv'];
bijectionStatsOutputFile = [resultsFolder 'bijection_method\bijection_stats.csv'];

datasetTable = readtable(datasetFile, 'ReadRowNames', true);
speciesList = datasetTable.Properties.RowNames;
numSpecies = length(speciesList);


% Initialize tables
parameterCols = {'data_split', 'z', 'p_M', 'kap', 'v', 'E_G', 'h_a', 'E_Hb', 'E_Hj', 'E_Hx', 'E_Hp', 'k_J', 's_M'};
statsCols = {'bijection_flag', 'feasible', 'infeasibility_flag', 'get_tj_error', 'error_message'};
varTypesParameterTable = {
    'string', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', ... % parameterCols
    };
parameterPredictionTable = table('Size', [numSpecies, length(parameterCols)], 'VariableTypes', varTypesParameterTable, 'VariableNames', parameterCols, 'RowNames', speciesList);
parameterPredictionTable{:, 'data_split'} = datasetTable{:, 'data_split'};

varTypesStatsTable = {
    'string', 'logical', 'string', 'logical', 'string',
    };
bijectionStatsTable = table('Size', [numSpecies, length(statsCols)], 'VariableTypes', varTypesStatsTable, 'VariableNames', statsCols, 'RowNames', speciesList);

% Settings
useDefaultParameterValues = true;
% Max execution time per iteration
maxTime = 5*60; % 3 minutes


%% Set up parallel pool
pool = gcp('nocreate');
if isempty(pool)
    pool = parpool('Processes');
end
numWorkers = pool.NumWorkers;

% Initialize variables
i = 1; % Index of species to submit
inProgressFutures = struct('future', {}, 'i', {}, 'speciesName', {}, 'startTime', {});

%% Start the processing loop
while i <= numSpecies || ~isempty(inProgressFutures)
    % Submit new tasks if workers are available
    while length(inProgressFutures) < numWorkers && i <= numSpecies
        speciesName = speciesList{i};

        % Submit parfeval task
        fut = parfeval(pool, @processSpecies, 2, speciesName, allSpeciesFolder, useDefaultParameterValues);
        % Record the future, species name, start time
        startTime = tic;
        nFutures = length(inProgressFutures);
        inProgressFutures(nFutures+1).future = fut;
        inProgressFutures(nFutures+1).i = i;
        inProgressFutures(nFutures+1).speciesName = speciesName;
        inProgressFutures(nFutures+1).startTime = startTime;
        % inProgressFutures(end+1) = struct('future', fut, 'speciesName', speciesName, 'startTime', startTime);
        fprintf('[%4d / %d | %50s] SUBMIT \n', i, numSpecies, speciesName)

        % fprintf('Submitted species %s (%d/%d)\n', speciesName, i, numSpecies);
        i = i + 1;
    end

    % Check futures for completion or timeout
    idx = 1;
    while idx <= length(inProgressFutures)
        futInfo = inProgressFutures(idx);
        if strcmp(futInfo.future.State, 'finished')
            % Fetch outputs
            try
                [bijectionPar, bijectionFlag] = fetchOutputs(futInfo.future);
                fprintf('[%4d / %d | %50s] RESULT: %s \n', futInfo.i, numSpecies, futInfo.speciesName, bijectionFlag)

                for p=1:length(parameterCols)
                    parName = parameterCols{p};
                    if isfield(bijectionPar, parName)
                        parameterPredictionTable{futInfo.speciesName, parName} = bijectionPar.(parName);
                    end
                end
                bijectionStatsTable{futInfo.speciesName, 'bijection_flag'} = string(bijectionFlag);
                
            catch ME
                % Handle error
                if isempty(futInfo.future.Error)
                    error_message = ME.message;
                else
                    error_message = futInfo.future.Error.message;
                end
                if any(strcmp('get_tj', {futInfo.future.Error.stack.name}))
                    bijectionStatsTable{futInfo.speciesName, 'get_tj_error'} = true;
                end
                fprintf('[%4d / %d | %50s] ERROR: %s \n', futInfo.i, numSpecies, futInfo.speciesName, error_message)
                bijectionStatsTable{futInfo.speciesName, 'bijection_flag'} = "error";
                bijectionStatsTable{futInfo.speciesName, 'error_message'} = string(error_message);
            end
            % Remove future from in-progress list
            inProgressFutures(idx) = [];
        else
            % Check for timeout
            elapsedTime = toc(futInfo.startTime);
            if elapsedTime > maxTime
                cancel(futInfo.future);
                fprintf('[%4d / %d | %50s] TIMEOUT: bijection method took longer than %d seconds to execute. \n', futInfo.i, numSpecies, futInfo.speciesName, maxTime)
                bijectionStatsTable{futInfo.speciesName, 'bijection_flag'} = "timeout";
                % Remove future from in-progress list
                inProgressFutures(idx) = [];
            else
                idx = idx + 1;
            end
        end
    end

    % Optionally, pause for a short time to avoid busy waiting
    pause(0.1);
end

%% Write results to .csv files
bijectionStatsTable.error_message = replace(bijectionStatsTable.error_message, newline, ' ');
writetable(bijectionStatsTable, bijectionStatsOutputFile,'WriteRowNames',true);
fprintf('Bijection stats table saved in %s\n', bijectionStatsOutputFile);

% Only save successful predictions
writetable(parameterPredictionTable(parameterPredictionTable.z ~= 0, :), parameterTableOutputFile, 'WriteRowNames',true);
fprintf('Parameter predictions table saved in %s\n', parameterTableOutputFile);

%% Function to process each species
function [bijectionPar, bijectionFlag] = processSpecies(speciesName, allSpeciesFolder, useDefaultParameterValues)
% Set up data for the species
speciesFolder = fullfile(allSpeciesFolder, speciesName);
% Check if the species folder exists
if isfolder(speciesFolder)
    % Change directory to the species folder
    cd(speciesFolder);

    % Run mydata.m
    [data, auxData, metaData, ~, ~] = feval(['mydata_' speciesName]);

    % If species is of class Aves
    if strcmp(metaData.class, 'Aves') && ~isfield(data, 'Wwp') && isfield(data, 'Wwi')
        data.Wwp = 0.95*data.Wwi;
    end
    
    % Run bijection
    [bijectionPar, metaPar, ~, bijectionFlag] = bijection_method(data, auxData, metaData, useDefaultParameterValues);
    
    % Run get_tj to get prediction for s_M
    if strcmp(metaPar.model, 'abj')
        cPar = parscomp_st(bijectionPar);  
        pars_tj = [cPar.g cPar.k cPar.l_T cPar.v_Hb cPar.v_Hj cPar.v_Hp];
        [~, ~, ~, l_j, ~, l_b, ~, ~, ~, ~] = get_tj(pars_tj, bijectionPar.f);
        bijectionPar.s_M = l_j/l_b;
    else
        bijectionPar.s_M = 1;
    end

else
    error('Folder for species "%s" does not exist.', speciesName);
end
end

% end
