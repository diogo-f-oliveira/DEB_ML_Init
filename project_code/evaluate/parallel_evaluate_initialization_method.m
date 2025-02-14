parameterPredictionFile = [resultsFolder datasetName '\parameter_predictions\' modelName '_predictions.csv'];
% feasibleFile = [resultsFolder datasetName '\feasibility\' modelName '_feasibility.csv'];
debLossFile = [resultsFolder datasetName '\deb_model_loss\' modelName '_deb_model_loss.csv'];
outputFileName = [resultsFolder datasetName '\initialization\' modelName '_initialization.csv'];

% Read the parameter prediction file
parameterEstimates = readtable(parameterPredictionFile, 'ReadRowNames', true);
predParNames = parameterEstimates.Properties.VariableNames(2:end);

% Read the DEB model loss file
debLossTable = readtable(debLossFile, 'ReadRowNames', true);
% Filter species that could not initialize the estimation
speciesList = debLossTable.Properties.RowNames(logical(debLossTable.success));
numSpecies = length(speciesList);

% Set global variables used in estimation function
parfevalOnAll(@setGlobalVars, 0);

%% Initialize table
columnNames = {'data_split', 'deb_loss', 'convergence', 'n_restarts', 'n_iter', 'execution_time', 'error', 'error_message'};
numCols = length(columnNames);
varTypes = {'string', 'double', 'logical', 'int16', 'int16', 'double', 'logical', 'string'};
initResultsTable = table('Size', [numSpecies, numCols], 'VariableTypes', varTypes, 'VariableNames', columnNames, 'RowNames', speciesList);
% debLossTable{:, 'data_split'} = parameterEstimates{:, 'data_split'};
initResultsTable{:, 'data_split'} = "test";

%% Set up parallel pool
pool = gcp('nocreate');
if isempty(pool)
    pool = parpool('Processes');
end
numWorkers = pool.NumWorkers;

% Max execution time per future
maxTime = 15*60; % in seconds

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
        fut = parfeval(pool, @processSpecies, 4, speciesName, speciesParameterEstimates, allSpeciesFolder, predParNames);
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
                [n_restarts, converged, n_iter, fval] = fetchOutputs(futInfo.future);
                executionTime = toc(futInfo.startTime);
                fprintf('[%4d / %d | %50s] RESULT: %d %.2f \n', futInfo.i, numSpecies, futInfo.speciesName, converged, executionTime)

                % Store results
                initResultsTable{futInfo.speciesName, 'execution_time'} = executionTime;
                initResultsTable{futInfo.speciesName, 'deb_loss'} = fval;
                initResultsTable{futInfo.speciesName, 'convergence'} = converged;
                initResultsTable{futInfo.speciesName, 'n_restarts'} = n_restarts;
                initResultsTable{futInfo.speciesName, 'n_iter'} = n_iter;

            catch ME
                % Handle error
                if isempty(futInfo.future.Error)
                    error_message = ME.message;
                else
                    error_message = futInfo.future.Error.message;
                end
                executionTime = toc(futInfo.startTime);
                fprintf('[%4d / %d | %50s] ERROR: %s %.2f \n', futInfo.i, numSpecies, futInfo.speciesName, error_message, executionTime)
                initResultsTable{futInfo.speciesName, 'execution_time'} = executionTime;
                initResultsTable{futInfo.speciesName, 'convergence'} = false;
                initResultsTable{futInfo.speciesName, 'error_message'} = string(error_message);
            end
            % Remove future from in-progress list
            inProgressFutures(idx) = [];
        else
            % Check for timeout
            elapsedTime = toc(futInfo.startTime);
            if elapsedTime > maxTime
                cancel(futInfo.future);
                fprintf('[%4d / %d | %50s] TIMEOUT: predict function took longer than %d seconds to execute. \n', futInfo.i, numSpecies, futInfo.speciesName, maxTime)
                initResultsTable{futInfo.speciesName, 'execution_time'} = maxTime;
                initResultsTable{futInfo.speciesName, 'convergence'} = false;
                initResultsTable{futInfo.speciesName, 'error_message'} = "Maximum execution time exceeded";
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
writetable(initResultsTable, outputFileName,'WriteRowNames',true);
fprintf('Table saved in %s\n', outputFileName);

%% Functions to set global variables
function setGlobalVars
    global lossfunction report max_step_number max_fun_evals tol_simplex tol_fun simplex_size covRules;
    lossfunction = 'sb';
    report = 0;
    max_step_number = 5e2;
    max_fun_evals = 5e3;
    tol_simplex = 1e-4;
    tol_fun = 1e-4;
    simplex_size = 0.05;
    covRules = 0;
end

function setGlobalPetsVar(speciesName)
    global pets
    pets = {speciesName};
end

%% Function to process each species
function [n_restarts, converged, n_iter, fval] = processSpecies(speciesName, speciesParameterEstimates, allSpeciesFolder, predParNames)
% Set up data for the species
speciesFolder = fullfile(allSpeciesFolder, speciesName);
% Check if the species folder exists
if isfolder(speciesFolder)
    % Change directory to the species folder
    cd(speciesFolder);

    % Run mydata.m
    [data, auxData, metaData, ~, weights] = feval(['mydata_' speciesName]);
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

    % Format arguments for 'petregr_f'
    dataStruct = struct(speciesName, data);
    auxDataStruct = struct(speciesName, auxData);
    weightsStruct = struct(speciesName, weights);
    filternm = ['filter_' metaPar.model];

    setGlobalVars();
    setGlobalPetsVar(speciesName);

    q = predPar;
    n_restarts = 0;
    n_iter = 0;
    converged = false;
    while ~converged && n_restarts < 5
        [q, converged, itercount, fval] = petregr_f('predict_pets', q, dataStruct, auxDataStruct, weightsStruct, filternm);
        n_restarts = n_restarts + 1;
        n_iter = n_iter + itercount;
    end

else
    error('Folder for species "%s" does not exist.', speciesName);
end
end
