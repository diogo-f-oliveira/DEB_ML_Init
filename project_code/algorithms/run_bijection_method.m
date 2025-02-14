% Delete an existing progress bar in case it was not properly delete before
if exist('h', 'var')
    delete(h)
end

clear all
format long

%%
scriptsFolder = pwd;
addpath(scriptsFolder)

allSpeciesFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\species\';
datasetsFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\data\';
resultsFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\results\';

datasetName = 'ratio_output_no_pub_age_taxonomy_ecocodes';
modelName = 'BijectionMethod';

datasetFile = [datasetsFolder 'processed\' datasetName '\' datasetName '.csv'];
parameterTableOutputFile = [resultsFolder datasetName '\parameter_predictions\' modelName '_predictions.csv'];
bijectionStatsOutputFile = [resultsFolder 'bijection method\bijection_stats.csv'];

datasetTable = readtable(datasetFile, 'ReadRowNames', true);
speciesList = datasetTable.Properties.RowNames;
numSpecies = length(speciesList);


% Initialize tables
parameterCols = {'data_split', 'z', 'p_M', 'kap', 'v', 'E_G', 'h_a', 'E_Hb', 'E_Hj', 'E_Hx', 'E_Hp'};
varTypesParameterTable = {
    'string', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', ... % parameterCols
    };
parameterPredictionTable = table('Size', [numSpecies, length(parameterCols)], 'VariableTypes', varTypesParameterTable, 'VariableNames', parameterCols, 'RowNames', speciesList);
statsCols = {'bijection_flag', 'feasible', 'infeasibility_flag', 'error_message'};
parameterPredictionTable{:, 'data_split'} = datasetTable{:, 'data_split'};

varTypesStatsTable = {
    'string', 'logical', 'string', 'string',
    };
bijectionStatsTable = table('Size', [numSpecies, length(statsCols)], 'VariableTypes', varTypesStatsTable, 'VariableNames', statsCols, 'RowNames', speciesList);

% Settings
useDefaultParameterValues = true;
% Max execution time per iteration
maxTime = 3*60; % 3 minutes

%% Loop through species
% Create progress bar
h = waitbar(0, 'Processing species...', 'Name', 'Running bijection...', 'CreateCancelBtn', 'setappdata(gcbf, ''canceling'', 1)', 'WindowStyle', 'docked');
% Check for cancel button press
setappdata(h, 'canceling', 0);

start_idx = 1;
for i = start_idx:numSpecies
    speciesName = speciesList{i};
    waitbar(i / numSpecies, h, sprintf('Processing species %50s\n%d of %d\n', strrep(speciesName, '_', ' '), i, numSpecies));

    speciesFolder = fullfile(allSpeciesFolder, speciesName);
    % Check if the species folder exists
    if isfolder(speciesFolder)
        % Change directory to the species folder
        cd(speciesFolder);

        mydataFilePath = [speciesFolder '/mydata_' speciesName];
        parsInitFilePath = [speciesFolder '/pars_init_' speciesName];
        if (exist(mydataFilePath, 'file') ~= 2) || (exist(parsInitFilePath, 'file') ~= 2)
            fprintf('[%4d / %d | %50s] MISSING: mydata.m or pars_init.m files do not exist. \n', i, numSpecies, speciesName)
            continue
        end

        try
            % Run mydata.m
            [data, auxData, metaData, txtData, weights] = feval(['mydata_' speciesName]);
            % Run bijection function get_pars.m
            fut = parfeval(@bijection_method, 4, data, auxData, metaData, useDefaultParameterValues);

            % Block for up to maxTime seconds waiting for a result
            didFinish = wait(fut, 'finished', maxTime);
            if ~didFinish
                % Execution didn't finish in time, cancel this iteration
                cancel(fut);
                bijectionStatsTable{speciesName, 'bijection_flag'} = "timeout";
                fprintf('[%4d / %d | %50s] TIMEOUT: bijection took longer than %d seconds to execute. \n', i, numSpecies, speciesName, maxTime)
                continue
            else
                % Did complete, retrieve results
                [par, metaPar, txtPar, flag] = fetchOutputs(fut);
            end
        catch ME
            fprintf('[%4d / %d | %50s] ERROR: %s \n', i, numSpecies, speciesName, fut.Error.message)
            bijectionStatsTable{speciesName, 'bijection_flag'} = "error";
            bijectionStatsTable{speciesName, 'error_message'} = string(fut.Error.message);
            continue
        end
        bijectionStatsTable{speciesName, 'bijection_flag'} = string(flag);

        % Save parameters in table
        for p=1:length(parameterCols)
            parName = parameterCols{p};
            if isfield(par, parName)
                parameterPredictionTable{speciesName, parName} = par.(parName);
            end
        end
    else
        warning('[%4d / %d | %50s] MISSING: Folder with AmP files does not exist. \n', i, numSpecies, speciesName);
    end

    % Check for cancel button press
    if getappdata(h, 'canceling')
        delete(h)
        fprintf('[%4d / %d | %50s] STOP: User stopped execution. \n', i, numSpecies, speciesName)
        break;
    end
end

%% Write results to .csv files
bijectionStatsTable.error_message = replace(bijectionStatsTable.error_message, newline, ' ');
writetable(bijectionStatsTable, bijectionStatsOutputFile,'WriteRowNames',true);
fprintf('Bijection stats table saved in %s\n', bijectionStatsOutputFile);

% Only save successful predictions
writetable(parameterPredictionTable(parameterPredictionTable.z ~= 0, :), parameterTableOutputFile, 'WriteRowNames',true);
fprintf('Parameter predictions table saved in %s\n', parameterTableOutputFile);


%% Clean up
delete(h)
rmpath(scriptsFolder)