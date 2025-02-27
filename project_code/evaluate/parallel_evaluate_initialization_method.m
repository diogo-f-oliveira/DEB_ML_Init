parameterPredictionFile = [resultsFolder '\parameter_predictions\' modelName '_predictions.csv'];
debLossFile = [resultsFolder '\deb_model_loss\' modelName '_deb_model_loss.csv'];
outputFileName = [resultsFolder '\initialization\' modelName '_initialization.csv'];

% Read the parameter prediction file
parameterEstimates = readtable(parameterPredictionFile, 'ReadRowNames', true);
predParNames = parameterEstimates.Properties.VariableNames(2:end);

% Read the DEB model loss file
debLossTable = readtable(debLossFile, 'ReadRowNames', true);
% Filter species that could not initialize the estimation
speciesList = debLossTable.Properties.RowNames(logical(debLossTable.success));
numSpecies = length(speciesList);



%% Initialize table
columnNames = {'data_split', 'deb_loss', 'convergence', 'n_runs', 'n_iter', 'execution_time', 'error', 'error_message'};
numCols = length(columnNames);
varTypes = {'string', 'double', 'logical', 'int16', 'int16', 'double', 'logical', 'string'};
initResultsTable = table('Size', [numSpecies, numCols], 'VariableTypes', varTypes, 'VariableNames', columnNames, 'RowNames', speciesList);
% debLossTable{:, 'data_split'} = parameterEstimates{:, 'data_split'};
initResultsTable{:, 'data_split'} = "test";


%% Settings
% Max execution time per future
maxEstimationTime = 1*60; % in seconds
maxExecutionTime = 1.2*maxEstimationTime; % in seconds
maxRuns = 200;
saveResultsTableEvery = 30;


%% Set up parallel pool
pool = gcp('nocreate');
if isempty(pool)
    pool = parpool('Processes');
end
numWorkers = pool.NumWorkers;

% Set global variables used in estimation function
parfevalOnAll(@setGlobalVars, 0);

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
        fut = parfeval(pool, @processSpecies, 5, speciesName, speciesParameterEstimates, allSpeciesFolder, predParNames, maxRuns, maxEstimationTime);
        % Record the future, species name, start time
        startTime = tic;
        nFutures = length(inProgressFutures);
        inProgressFutures(nFutures+1).future = fut;
        inProgressFutures(nFutures+1).i = i;
        inProgressFutures(nFutures+1).speciesName = speciesName;
        inProgressFutures(nFutures+1).startTime = startTime;
        fprintf('[%4d / %d | %50s] SUBMIT \n', i, numSpecies, speciesName)

        i = i + 1;

        % Write results to .csv file every once in a while
        if mod(i, saveResultsTableEvery) == 0
            writetable(initResultsTable, outputFileName,'WriteRowNames',true);
            fprintf('Table saved in %s\n', outputFileName);
        end
    end

    % Check futures for completion or timeout
    idx = 1;
    while idx <= length(inProgressFutures)
        futInfo = inProgressFutures(idx);
        if strcmp(futInfo.future.State, 'finished')
            % Fetch outputs
            try
                [numRuns, converged, numIter, fval, estimationTime] = fetchOutputs(futInfo.future);
                % executionTime = toc(futInfo.startTime);
                fprintf('[%4d / %d | %50s] RESULT: %d %.2f \n', futInfo.i, numSpecies, futInfo.speciesName, converged, estimationTime)

                % Store results
                initResultsTable{futInfo.speciesName, 'execution_time'} = estimationTime;
                initResultsTable{futInfo.speciesName, 'deb_loss'} = fval;
                initResultsTable{futInfo.speciesName, 'convergence'} = converged;
                initResultsTable{futInfo.speciesName, 'n_runs'} = numRuns;
                initResultsTable{futInfo.speciesName, 'n_iter'} = numIter;

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
                initResultsTable{futInfo.speciesName, 'error'} = true;

            end
            % Remove future from in-progress list
            inProgressFutures(idx) = [];
        else
            % Check for timeout
            elapsedTime = toc(futInfo.startTime);
            if elapsedTime > maxExecutionTime
                cancel(futInfo.future);
                fprintf('[%4d / %d | %50s] TIMEOUT: predict function took longer than %d seconds to execute. \n', futInfo.i, numSpecies, futInfo.speciesName, maxExecutionTime)
                initResultsTable{futInfo.speciesName, 'execution_time'} = maxExecutionTime;
                initResultsTable{futInfo.speciesName, 'convergence'} = false;
                initResultsTable{futInfo.speciesName, 'error_message'} = "Maximum execution time exceeded";
                initResultsTable{futInfo.speciesName, 'error'} = true;
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
global lossfunction report max_step_number max_fun_evals tol_simplex tol_fun simplex_size covRules tol_restart;
lossfunction = 'sb';
report = 0;
max_step_number = 5e2;
max_fun_evals = 5e3;
tol_simplex = 1e-4;
tol_fun = 1e-4;
simplex_size = 0.02;
covRules = 0;
tol_restart = 1e-4;
end

function alternateSimplexSize
global simplex_size
simplex_size = -simplex_size;
end

function setGlobalPetsVar(speciesName)
global pets
pets = {speciesName};
end

%% Function to process each species
function [numRuns, converged, numIter, finalLoss, estimationTime] = processSpecies(speciesName, speciesParameterEstimates, allSpeciesFolder, predParNames, maxRuns, maxEstimationTime)
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
    setGlobalPetsVar(speciesName);

     % Run estimation
    global tol_restart
    estimatedPar = par;
    numRuns = 0;
    numIter = 0;
    converged = false;
    currentLoss = 0;
    prevLoss = inf;
    startTime = tic;
    elapsedTime = toc(startTime);
    while ~converged ... 
            && (prevLoss - currentLoss) > tol_restart ...
            && numRuns < maxRuns...
            && elapsedTime < maxEstimationTime

        prevLoss = currentLoss;
        [estimatedPar, converged, itercount, currentLoss] = petregr_f('predict_pets', estimatedPar, dataStruct, auxDataStruct, weightsStruct, filternm);
        alternateSimplexSize();
        numRuns = numRuns + 1;
        numIter = numIter + itercount;
        elapsedTime = toc(startTime);

    end
    finalLoss = currentLoss;
    estimationTime = elapsedTime;
else
    error('Folder for species "%s" does not exist.', speciesName);
end
end
