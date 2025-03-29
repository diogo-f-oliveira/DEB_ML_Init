% function parallel_compute_deb_loss(allSpeciesFolder, resultsFolder, datasetName, modelName)

parameterPredictionFile = [resultsFolder '\parameter_predictions\' modelName '_predictions.csv'];
feasibleFile = [resultsFolder '\feasibility\' modelName '_feasibility.csv'];
outputFileName = [resultsFolder '\deb_model_loss\' modelName '_deb_model_loss.csv'];

% Read the parameter prediction file
parameterEstimates = readtable(parameterPredictionFile, 'ReadRowNames', true);
predParNames = parameterEstimates.Properties.VariableNames(2:end);

% Read the feasible file
feasibleTable = readtable(feasibleFile, 'ReadRowNames', true);
speciesList = feasibleTable.Properties.RowNames(feasibleTable.feasible & (feasibleTable.data_split == "test"));
numSpecies = length(speciesList);

% Initialize table
columnNames = {'data_split', 'deb_loss', 'success', 'error_type', 'error_message'};
numCols = length(columnNames);
varTypes = {'string', 'double', 'logical', 'string', 'string'};
debLossTable = table('Size', [numSpecies, numCols], 'VariableTypes', varTypes, 'VariableNames', columnNames, 'RowNames', speciesList);
% debLossTable{:, 'data_split'} = parameterEstimates{:, 'data_split'};
debLossTable{:, 'data_split'} = "test";

%% Set up parallel pool
pool = gcp('nocreate');
if isempty(pool)
    pool = parpool('Processes');
end
numWorkers = pool.NumWorkers;

% Max execution time per future
maxTime = 5*60; % in seconds
includePseudoData = true;

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
        fut = parfeval(pool, @processSpecies, 3, speciesName, speciesParameterEstimates, allSpeciesFolder, predParNames, includePseudoData);
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
                [debLoss, success, error_type] = fetchOutputs(futInfo.future);
                fprintf('[%4d / %d | %50s] RESULT: %d %s \n', futInfo.i, numSpecies, futInfo.speciesName, success, error_type)

                % Store results
                debLossTable{futInfo.speciesName, 'deb_loss'} = debLoss;
                debLossTable{futInfo.speciesName, 'success'} = success;
                debLossTable{futInfo.speciesName, 'error_type'} = error_type;

            catch ME
                % Handle error
                if isempty(futInfo.future.Error)
                    error_message = ME.message;
                else
                    error_message = futInfo.future.Error.message;
                end
                fprintf('[%4d / %d | %50s] ERROR: %s \n', futInfo.i, numSpecies, futInfo.speciesName, error_message)
                debLossTable{futInfo.speciesName, 'deb_loss'} = nan;
                debLossTable{futInfo.speciesName, 'success'} = false;
                debLossTable{futInfo.speciesName, 'error_type'} = "predict_or_loss_error";
                debLossTable{futInfo.speciesName, 'error_message'} = string(error_message);
            end
            % Remove future from in-progress list
            inProgressFutures(idx) = [];
        else
            % Check for timeout
            elapsedTime = toc(futInfo.startTime);
            if elapsedTime > maxTime
                cancel(futInfo.future);
                fprintf('[%4d / %d | %50s] TIMEOUT: predict function took longer than %d seconds to execute. \n', futInfo.i, numSpecies, futInfo.speciesName, maxTime)
                debLossTable{futInfo.speciesName, 'deb_loss'} = nan;
                debLossTable{futInfo.speciesName, 'success'} = false;
                debLossTable{futInfo.speciesName, 'error_type'} = "timeout";
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
writetable(debLossTable, outputFileName,'WriteRowNames',true);
fprintf('Table saved in %s\n', outputFileName);

%% Function to process each species
function [debLoss, success, errorType] = processSpecies(speciesName, speciesParameterEstimates, allSpeciesFolder, predParNames, includePseudoData)
% Set up data for the species
speciesFolder = fullfile(allSpeciesFolder, speciesName);
% Check if the species folder exists
if isfolder(speciesFolder)
    % Change directory to the species folder
    cd(speciesFolder);

    % Run mydata.m
    [data, auxData, metaData, ~, weights] = feval(['mydata_' speciesName]);
    % Get par struct
    resultsMatFileName = ['results_' speciesName '.mat'];
    parsInitFileName = ['pars_init_' speciesName '.m'];
    if exist(resultsMatFileName, 'file')
        load(resultsMatFileName, "par")
    elseif exist(parsInitFileName, 'file')
        % If results.mat file does not exist load parameters from
        % pars_init.m file. This has lower precision due to rounding errors
        % when printing to pars_init.m
        [par, ~, ~] = feval(['pars_init_' speciesName], metaData);
    end


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
        if par.free.(parName)
            predPar.(parName) = speciesParameterEstimates{1, parName};
        end
    end

    % Run predict function
    [prdData, info] = feval(['predict_' speciesName], predPar, data, auxData);
    % Check if there was a failed predict filter
    if ~info
        debLoss = nan;
        success = false;
        errorType = "predict_filter";
    else
        % Compute loss
        debLoss = deb_lossfun(data, prdData, weights, predPar, includePseudoData);
        success = true;
        errorType = "";
    end

else
    error('Folder for species "%s" does not exist.', speciesName);
end
end

% end
