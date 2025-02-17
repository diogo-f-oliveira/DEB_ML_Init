%% Clear workspace
% Delete an existing progress bar in case it was not properly delete before

clear all
format long

%% Define paths to files
filePathsCSVPath = '..\..\filepaths.csv';
pathsTable = readtable(filePathsCSVPath, 'Delimiter', ',', 'ReadVariableNames', true, 'ReadRowNames', true);
allSpeciesFolder = pathsTable{'species_folder', 'path'}{:};
saveFolder = '..\..\data\deb_model_predictions';
% Output file
% outputFileName = [saveFolder '\full_estimation_from_AmP_pars_subset_test_set.csv'];
outputFileName = [saveFolder '\metamorphosis_predictions.csv'];

%% Get list of species

speciesList = getAllSpeciesNames(allSpeciesFolder);

numSpecies = length(speciesList);


%% Initialize table
columnNames = {
    'L_b', 'L_j', 'L_p', 'L_i', 'a_b', 'a_j', 'a_p', ...
    'success', 'execution_time', 'error', 'error_message', ...
    };
numCols = length(columnNames);
varTypes = {
    'double', 'double', 'double', 'double', 'double', 'double', 'double', ...
    'logical', 'double', 'string', 'string', ...
    };
predictionsTable = table('Size', [numSpecies, numCols], 'VariableTypes', varTypes, 'VariableNames', columnNames, 'RowNames', speciesList);

%% Settings
saveResultsTableEvery = 200;

% Max execution time per species
maxTime = 15*60; % in seconds

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
        fut = parfeval(pool, @processSpecies, 2, speciesName, allSpeciesFolder);
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
                [predictions, success] = fetchOutputs(futInfo.future);
                executionTime = toc(futInfo.startTime);
                fprintf('[%4d / %d | %50s] RESULT: %d %.2f \n', futInfo.i, numSpecies, futInfo.speciesName, success, executionTime)

                % Store results
                predictionsTable{futInfo.speciesName, 'execution_time'} = executionTime;
                predictionsTable{futInfo.speciesName, 'success'} = success;
                

                for p=1:7
                    predName = columnNames{p};
                    predictionsTable{futInfo.speciesName, predName} = predictions.(predName);
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
                predictionsTable{futInfo.speciesName, 'execution_time'} = executionTime;
                predictionsTable{futInfo.speciesName, 'success'} = false;
                predictionsTable{futInfo.speciesName, 'error'} = true;
                predictionsTable{futInfo.speciesName, 'error_message'} = string(error_message);
            end
            % Remove future from in-progress list
            inProgressFutures(idx) = [];
        else
            % Check for timeout
            elapsedTime = toc(futInfo.startTime);
            if elapsedTime > maxTime
                cancel(futInfo.future);
                fprintf('[%4d / %d | %50s] TIMEOUT: predict function took longer than %d seconds to execute. \n', futInfo.i, numSpecies, futInfo.speciesName, maxTime)
                predictionsTable{futInfo.speciesName, 'execution_time'} = maxTime;
                predictionsTable{futInfo.speciesName, 'success'} = false;
                predictionsTable{futInfo.speciesName, 'error'} = false;
                predictionsTable{futInfo.speciesName, 'error_message'} = "Maximum execution time exceeded";
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
        writetable(predictionsTable, outputFileName,'WriteRowNames',true);
        fprintf('Table saved in %s\n', outputFileName);
    end
end

%% Write results to a .csv file
writetable(predictionsTable, outputFileName,'WriteRowNames',true);
fprintf('Table saved in %s\n', outputFileName);

%% Function to process each species
function [predictions, success] = processSpecies(speciesName, allSpeciesFolder)
predictions = struct( ...
    'a_b', 0, ...
    'a_p', 0, ...
    'a_j', 0, ...
    'L_b', 0, ...
    'L_j', 0, ...
    'L_p', 0, ...
    'L_i', 0  ...
    );
success = 0;
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
    
    if ~strcmp(metaPar.model, 'abj')
        return
    end
    
    % Simulate until puberty
    cPar = parscomp_st(par);  
    pars_tj = [cPar.g cPar.k cPar.l_T cPar.v_Hb cPar.v_Hj cPar.v_Hp];
    [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, ~, ~, success] = get_tj(pars_tj, par.f);

    % Pack predictions
    predictions = struct( ...
        'a_b', tau_b / cPar.k_M, ...
        'a_p', tau_p / cPar.k_M, ...
        'a_j', tau_j / cPar.k_M, ...
        'L_b', l_b * cPar.L_m, ...
        'L_j', l_j * cPar.L_m, ...
        'L_p', l_p * cPar.L_m, ...
        'L_i', l_i * cPar.L_m  ...
        );

else
    error('Folder for species "%s" does not exist.', speciesName);
end
end

function speciesList = getAllSpeciesNames(allSpeciesFolder)
% Get a list of all files and folders in the specified directory
allFiles = dir(allSpeciesFolder);

% Filter the list to include only directories
isDir = [allFiles.isdir]; % Logical index for directories
speciesList = {allFiles(isDir).name}; % Extract names of directories

% Remove '.' and '..' from the list (current and parent directory)
speciesList = speciesList(~ismember(speciesList, {'.', '..'}));
end
