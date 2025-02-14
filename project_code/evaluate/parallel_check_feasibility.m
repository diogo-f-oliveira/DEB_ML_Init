% function parallel_check_feasibility(allSpeciesFolder, resultsFolder, datasetName, modelName, copyMaturities)

% Define file paths
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

%% Set up parallel pool
pool = gcp('nocreate');
if isempty(pool)
    pool = parpool('Processes');
end
numWorkers = pool.NumWorkers;

% Max execution time per future
maxTime = 10*60; % in seconds

% Initialize variables
i = 1; % Index of species to submit
inProgressFutures = struct('future', {}, 'i', {}, 'speciesName', {}, 'startTime', {});

%% Start the processing loop
while i <= numSpecies || ~isempty(inProgressFutures)
    % Submit new tasks if workers are available
    while length(inProgressFutures) < numWorkers && i <= numSpecies
        speciesName = speciesList{i};

        % Prepare data needed for processSpecies
        speciesParameterEstimates = parameterEstimates(speciesName, :);

        % Submit parfeval task
        fut = parfeval(pool, @processSpecies, 2, speciesName, speciesParameterEstimates, allSpeciesFolder, predParNames);
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
                [feasible, infeasibilityFlag] = fetchOutputs(futInfo.future);
                fprintf('[%4d / %d | %50s] RESULT: %d %d \n', futInfo.i, numSpecies, futInfo.speciesName, feasible, infeasibilityFlag)

                % Store results
                feasibleTable{futInfo.speciesName, 'feasible'} = feasible;
                feasibleTable{futInfo.speciesName, 'infeasibility_flag'} = infeasibilityFlag;
            catch ME
                % Handle error
                if isempty(futInfo.future.Error)
                    error_message = ME.message;
                else
                    error_message = futInfo.future.Error.message;
                end
                fprintf('[%4d / %d | %50s] ERROR: %s \n', futInfo.i, numSpecies, futInfo.speciesName, error_message)
                feasibleTable{futInfo.speciesName, 'feasible'} = false;
                feasibleTable{futInfo.speciesName, 'infeasibility_flag'} = "error";
                feasibleTable{futInfo.speciesName, 'error_message'} = string(error_message);
            end
            % Remove future from in-progress list
            inProgressFutures(idx) = [];
        else
            % Check for timeout
            elapsedTime = toc(futInfo.startTime);
            if elapsedTime > maxTime
                cancel(futInfo.future);
                fprintf('[%4d / %d | %50s] TIMEOUT: filter function took longer than %d seconds to execute. \n', futInfo.i, numSpecies, futInfo.speciesName, maxTime)
                feasibleTable{futInfo.speciesName, 'feasible'} = false;
                feasibleTable{futInfo.speciesName, 'infeasibility_flag'} = "timeout";
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

%% Write results to a .csv file
writetable(feasibleTable, outputFileName,'WriteRowNames',true);
fprintf('Table saved in %s\n', outputFileName);

%% Function to process each species
function [feasible, infeasibilityFlag] = processSpecies(speciesName, speciesParameterEstimates, allSpeciesFolder, predParNames)
% Set up data for the species
speciesFolder = fullfile(allSpeciesFolder, speciesName);
% Check if the species folder exists
if isfolder(speciesFolder)
    % Change directory to the species folder
    cd(speciesFolder);

    % Run mydata.m
    [~, ~, metaData, ~, ~] = feval(['mydata_' speciesName]);
    % Run pars_init.m
    [par, metaPar, ~] = feval(['pars_init_' speciesName], metaData);

    % Replace parameters in par
    predPar = par;
    for p=1:length(predParNames)
        parName = predParNames{p};
        % Only set maturities if they are part of pars_init.m
        if any(strcmp(parName, {'E_Hj', 'E_Hx'})) 
            if ~isfield(par, parName)
                continue
            end
        end
        predPar.(parName) = speciesParameterEstimates{1, parName};
    end
    

    % Check feasibility
    % Run filter function
    [feasible, infeasibilityFlag] = feval(['filter_' metaPar.model], predPar);

else
    error('Folder for species "%s" does not exist.', speciesName);
end
end

% end
