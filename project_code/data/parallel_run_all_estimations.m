%% Clear workspace
% Delete an existing progress bar in case it was not properly delete before

clear all
format long

%% Define paths to files

AmPDataFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\';
allSpeciesFolder = [AmPDataFolder 'species\'];
saveFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\data\raw';
% Output file
% outputFileName = [saveFolder '\estimation_from_AmP_pars.csv'];
outputFileName = [saveFolder '\full_estimation_from_AmP_pars_subset_minimum.csv'];

%% Get list of species

% Get a list of all files and folders in the specified directory
allFiles = dir(allSpeciesFolder);

% Filter the list to include only directories
isDir = [allFiles.isdir]; % Logical index for directories
speciesList = {allFiles(isDir).name}; % Extract names of directories

% Remove '.' and '..' from the list (current and parent directory)
speciesList = speciesList(~ismember(speciesList, {'.', '..'}));
allFiles = allFiles(~ismember(speciesList, {'.', '..'}));


speciesList = {
        'Siphateles_bicolor',
        'Macquaria_novemaculeata',
        'Prionotus_albirostris',
        'Decapterus_macrosoma',
        'Etropus_crossotus',
        'Myripristis_murdjan',
        'Cerastoderma_edule',
        'Acipenser_stellatus',
        'Mormyrus_kannume',
        'Mysis_mixta',    
};
numSpecies = length(speciesList);


%% Initialize table
columnNames = {
    'init_loss', 'z_i', 'kap_i', 'v_i', 'p_M_i', 'E_Hb_i', 'E_Hp_i', ...
    'final_loss', 'z_f', 'kap_f', 'v_f', 'p_M_f', 'E_Hb_f', 'E_Hp_f', ...
    'convergence', 'n_runs', 'n_iter', 'execution_time', ...
    'error', 'error_message', ...
    };
numCols = length(columnNames);
varTypes = {
    'double', 'double', 'double', 'double', 'double', 'double', 'double', ...
    'double', 'double', 'double', 'double', 'double', 'double', 'double', ...
    'logical', 'int16', 'int16', 'double', ...
    'logical', 'string', ...
    };
estimationResultsTable = table('Size', [numSpecies, numCols], 'VariableTypes', varTypes, 'VariableNames', columnNames, 'RowNames', speciesList);

%% Settings
maxRuns = 200; % Single run
saveParsList = {'z', 'kap', 'v', 'p_M', 'E_Hb', 'E_Hp',};
saveResultsTableEvery = 200;
% Max execution time per species
maxTime = 15*60*60; % in seconds

%% Set up parallel pool
pool = gcp('nocreate');
if isempty(pool)
    pool = parpool('Processes');
end
numWorkers = pool.NumWorkers;

% Initialize variables
i = 1; % Index of species to submit
inProgressFutures = struct('future', {}, 'i', {}, 'speciesName', {}, 'startTime', {});

% Set global variables used in estimation function
parfevalOnAll(@setGlobalVars, 0);

%% Start the processing loop
while i <= numSpecies || ~isempty(inProgressFutures)
    % Submit new tasks if workers are available
    while length(inProgressFutures) < numWorkers && i <= numSpecies
        speciesName = speciesList{i};

        % Submit parfeval task
        fut = parfeval(pool, @processSpecies, 6, speciesName, allSpeciesFolder, maxRuns, saveParsList);
        % Record the future, species name, start time
        startTime = tic;
        nFutures = length(inProgressFutures);
        inProgressFutures(nFutures+1).future = fut;
        inProgressFutures(nFutures+1).i = i;
        inProgressFutures(nFutures+1).speciesName = speciesName;
        inProgressFutures(nFutures+1).startTime = startTime;
        fprintf('[%4d / %d | %50s] SUBMIT \n', i, numSpecies, speciesName)
        i = i + 1;
    end

    % Check futures for completion or timeout
    idx = 1;
    while idx <= length(inProgressFutures)
        futInfo = inProgressFutures(idx);
        if strcmp(futInfo.future.State, 'finished')
            % Fetch outputs
            try
                [initLoss, initParValues, finalLoss, finalParValues, estimStats, predictError] = fetchOutputs(futInfo.future);
                executionTime = toc(futInfo.startTime);
                fprintf('[%4d / %d | %50s] RESULT: %d %.2f \n', futInfo.i, numSpecies, futInfo.speciesName, estimStats.convergence, executionTime)

                % Store results
                estimationResultsTable{futInfo.speciesName, 'execution_time'} = executionTime;
                estimationResultsTable{futInfo.speciesName, 'init_loss'} = initLoss;
                estimationResultsTable{futInfo.speciesName, 'final_loss'} = finalLoss;
                estimationResultsTable{futInfo.speciesName, 'convergence'} = estimStats.convergence;
                estimationResultsTable{futInfo.speciesName, 'n_runs'} = estimStats.numRuns;
                estimationResultsTable{futInfo.speciesName, 'n_iter'} = estimStats.numIter;
                if predictError
                    estimationResultsTable{futInfo.speciesName, 'error'} = true;
                    estimationResultsTable{futInfo.speciesName, 'error_message'} = "predict_filter";
                else
                    estimationResultsTable{futInfo.speciesName, 'error'} = false;
                    estimationResultsTable{futInfo.speciesName, 'error_message'} = "";
                end
                for p=1:length(saveParsList)
                    parName = saveParsList{p};
                    estimationResultsTable{futInfo.speciesName, [parName '_i']} = initParValues.(parName);
                    estimationResultsTable{futInfo.speciesName, [parName '_f']} = finalParValues.(parName);
                end

            catch ME
                % Handle error
                if isempty(futInfo.future.Error)
                    error_message = ME.message;
                else
                    error_message = futInfo.future.Error.message;
                end
                executionTime = toc(futInfo.startTime);
                fprintf('[%4d / %d | %50s] ERROR: %s %.2f \n', futInfo.i, numSpecies, futInfo.speciesName, error_message, executionTime)
                estimationResultsTable{futInfo.speciesName, 'execution_time'} = executionTime;
                estimationResultsTable{futInfo.speciesName, 'convergence'} = false;
                estimationResultsTable{futInfo.speciesName, 'error'} = true;
                estimationResultsTable{futInfo.speciesName, 'error_message'} = string(error_message);
            end
            % Remove future from in-progress list
            inProgressFutures(idx) = [];
        else
            % Check for timeout
            elapsedTime = toc(futInfo.startTime);
            if elapsedTime > maxTime
                cancel(futInfo.future);
                fprintf('[%4d / %d | %50s] TIMEOUT: predict function took longer than %d seconds to execute. \n', futInfo.i, numSpecies, futInfo.speciesName, maxTime)
                estimationResultsTable{futInfo.speciesName, 'execution_time'} = maxTime;
                estimationResultsTable{futInfo.speciesName, 'convergence'} = false;
                estimationResultsTable{futInfo.speciesName, 'error'} = false;
                estimationResultsTable{futInfo.speciesName, 'error_message'} = "Maximum execution time exceeded";
                % Remove future from in-progress list
                inProgressFutures(idx) = [];
            else
                idx = idx + 1;
            end
        end
    end

    % Pause for a short time to avoid busy waiting
    pause(0.1);

    % Write results to .csv file every once in a while
    if mod(i, saveResultsTableEvery) == 0
        writetable(estimationResultsTable, outputFileName,'WriteRowNames',true);
        fprintf('Table saved in %s\n', outputFileName);
    end
end

%% Write results to a .csv file
writetable(estimationResultsTable, outputFileName,'WriteRowNames',true);
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
function [initLoss, initParValues, finalLoss, finalParValues, estimStats, predictError] = processSpecies(speciesName, allSpeciesFolder, maxRuns, saveParsList)

% Initialize output variables
initLoss = nan; 
finalLoss = nan;
nanValues = num2cell(NaN(size(saveParsList)));
initParValues = cell2struct(nanValues(:), saveParsList(:)); 
finalParValues = cell2struct(nanValues(:), saveParsList(:));
estimStats = struct('convergence', false, 'numRuns', 0, 'numIter', 0);
predictError = false;

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

    % Get initial parameter values
    for p=1:length(saveParsList)
        parName = saveParsList{p};
        initParValues.(parName) = par.(parName);
    end
    % Compute initial loss
    [prdData, info] = feval(['predict_' speciesName], par, data, auxData);
    if ~info
        predictError = true;
        return
    end
    includePseudoData = true;
    initLoss = deb_lossfun(data, prdData, weights, par, includePseudoData);

    % Format arguments for 'petregr_f'
    dataStruct = struct(speciesName, data);
    auxDataStruct = struct(speciesName, auxData);
    weightsStruct = struct(speciesName, weights);
    filternm = ['filter_' metaPar.model];
    % setGlobalVars();
    setGlobalPetsVar(speciesName);
    
    % Run estimation
    global tol_restart
    q = par;
    numRuns = 0;
    numIter = 0;
    converged = false;
    currentLoss = initLoss; 
    prevLoss = inf;
    while ~converged && numRuns < maxRuns && (prevLoss - currentLoss) > tol_restart
        prevLoss = currentLoss;
        [q, converged, itercount, currentLoss] = petregr_f('predict_pets', q, dataStruct, auxDataStruct, weightsStruct, filternm);
        numRuns = numRuns + 1;
        numIter = numIter + itercount;
        alternateSimplexSize();
    end
    % Save estimation stats
    estimStats.convergence = converged;
    estimStats.numRuns = numRuns; 
    estimStats.numIter = numIter;

    % Set final loss
    finalLoss = currentLoss;
    % Get final parameter values
    for p=1:length(saveParsList)
        parName = saveParsList{p};
        finalParValues.(parName) = q.(parName);
    end


else
    error('Folder for species "%s" does not exist.', speciesName);
end
end
