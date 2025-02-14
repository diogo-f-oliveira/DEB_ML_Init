% Delete an existing progress bar in case it was not properly delete before
if exist('h', 'var')
    delete(h)
end

% function check_feasibility(allSpeciesFolder, resultsFolder, datasetName, modelName)
clear all
format long

allSpeciesFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\species\';
resultsFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\results\';

datasetName = 'ratio_output_no_pub_weight_taxonomy_ecocodes';
% modelName = 'KNeighborsRegressor';
% modelName = 'RandomForestRegressor';
modelName = 'TopML';

parameterPredictionFile = [resultsFolder datasetName '\parameter_predictions\' modelName '_predictions.csv'];
outputFileName = [resultsFolder datasetName '\feasibility\' modelName '_feasibility.csv'];

% Read the parameter prediction file
parameterEstimates = readtable(parameterPredictionFile, 'ReadRowNames', true);
speciesList = parameterEstimates.Properties.RowNames;
numSpecies = length(speciesList);
predParNames = parameterEstimates.Properties.VariableNames(2:end);

% Initialize table
columnNames = {'data_split', 'feasible', 'infeasibility_flag', 'error_message'};
numCols = length(columnNames);
varTypes = {'string', 'logical', 'string', 'string'};
feasibleTable = table('Size', [numSpecies, numCols], 'VariableTypes', varTypes, 'VariableNames', columnNames, 'RowNames', speciesList);
feasibleTable{:, 'data_split'} = parameterEstimates{:, 'data_split'};

%% Loop through species
% Create progress bar
h = waitbar(0, 'Processing species...', 'Name', 'Checking feasibility', 'CreateCancelBtn', 'setappdata(gcbf, ''canceling'', 1)', 'WindowStyle', 'docked');
% Check for cancel button press
setappdata(h, 'canceling', 0);
% Max execution time per iteration
maxTime = 3*60; % 3 minutes

for i = 1:numSpecies
    speciesName = speciesList{i};
    waitbar(i / numSpecies, h, sprintf('[%4d / %d | %50s]', i, numSpecies, strrep(speciesName, '_', ' ')));

    speciesFolder = fullfile(allSpeciesFolder, speciesName);
    % Check if the species folder exists
    if isfolder(speciesFolder)
        % Change directory to the species folder
        cd(speciesFolder);

        % Run mydata.m
        [data, auxData, metaData, txtData, weights] = feval(['mydata_' speciesName]);
        % Run pars_init.m
        [par, metaPar, txtPar] = feval(['pars_init_' speciesName], metaData);

        % Replace parameters in par
        predPar = par;
        for p=1:length(predParNames)
            parName = predParNames{p};
            predPar.(parName) = parameterEstimates{speciesName, parName};
        end
        % Add maturity at weaning
        % TODO: Check if it exists in predPar
        if strcmp(metaPar.model, 'stx')
            predPar.E_Hx = predPar.E_Hb * 1.05;
        end
        % Add maturity at metamorphosis
        % TODO: Check if it exists in predPar
        if strcmp(metaPar.model, 'abj')
            predPar.E_Hj = predPar.E_Hb * 1.05;
        end

        % Check feasibility
        try
            % Run filter function in parallel
            fut = parfeval(@feval, 2, ['filter_' metaPar.model], predPar);

            % Block for up to maxTime seconds waiting for a result
            didFinish = wait(fut, 'finished', maxTime);
            if ~didFinish
                % Execution didn't finish in time, cancel this iteration
                feasibleTable{speciesName, 'feasible'} = false;
                feasibleTable{speciesName, 'infeasibility_flag'} = "timeout";
                fprintf('[%4d / %d | %50s] TIMEOUT: filter function took longer than %d seconds to execute. \n', i, numSpecies, speciesName, maxTime)
                cancel(fut);
                continue
            else
                [feasible, infeasibilityFlag] = fetchOutputs(fut);
                feasibleTable{speciesName, 'feasible'} = feasible;
                feasibleTable{speciesName, 'infeasibility_flag'} = infeasibilityFlag;
            end
        catch ME
            fprintf('[%4d / %d | %50s] ERROR: %s \n', i, numSpecies, speciesName, fut.Error.message)
            feasibleTable{speciesName, 'feasible'} = false;
            feasibleTable{speciesName, 'infeasibility_flag'} = "error";
            feasibleTable{speciesName, 'error_message'} = string(fut.Error.message);
        end

    else
        warning('Folder for species "%s" does not exist.', speciesName);
    end

    % Check for cancel button press
    if getappdata(h, 'canceling')
        delete(h)
        fprintf('Stopped execution on species %s, %d of %d\n', speciesName, i, numSpecies)
        break;
    end
end

%% Write results to a .csv file
writetable(feasibleTable, outputFileName,'WriteRowNames',true);
fprintf('Table saved in %s\n', outputFileName);

% Delete progress bar
delete(h)