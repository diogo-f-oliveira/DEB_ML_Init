% Delete an existing progress bar in case it was not properly delete before
if exist('h', 'var')
    delete(h)
end

clear all
format long


%% Load variables
allSpeciesFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\species\';
resultsFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\results\';

datasetName = 'ratio_output_no_pub_age_taxonomy_ecocodes';
% modelName = 'RandomForestRegressor';
% modelName = 'KNeighborsRegressor';
% modelName = 'TopML';
modelName = 'BijectionMethod';
% modelName = 'AmP';

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

%% Loop through species

% Create progress bar
h = waitbar(0, 'Running species estimation...', 'Name', 'Running species estimation...', 'CreateCancelBtn', 'setappdata(gcbf, ''canceling'', 1)', 'WindowStyle', 'docked');
% Check for cancel button press
setappdata(h, 'canceling', 0);

% Max execution time per iteration
maxTime = 15*60; % 15 minutes
start_idx = 1;
for i = start_idx:numSpecies
    speciesName = speciesList{i};
    parfevalOnAll(@setGlobalPetsVar, 0, speciesName);
    waitbar(i / numSpecies, h, sprintf('[%4d / %d | %50s]', i, numSpecies, strrep(speciesName, '_', ' ')));

    % Change directory to the species folder
    speciesFolder = fullfile(allSpeciesFolder, speciesName);
    cd(speciesFolder);

    % Run mydata.m
    [data, auxData, metaData, txtData, weights] = feval(['mydata_' speciesName]);
    % Run pars_init.m
    [par, metaPar, txtPar] = feval(['pars_init_' speciesName], metaData);

    % Replace parameters in par
    predPar = par;
    for p=1:length(predParNames)
        parName = predParNames{p};
        if ~isnan(parameterEstimates{speciesName, parName})
            predPar.(parName) = parameterEstimates{speciesName, parName};
        end
    end
    % Add maturity at weaning
    % TODO: Check if it exists in predPar
    if strcmp(metaPar.model, 'stx') && isfield(par, 'E_Hx')
        predPar.E_Hx = predPar.E_Hb * 1.05;
    end
    % Add maturity at metamorphosis
    % TODO: Check if it exists in predPar
    if strcmp(metaPar.model, 'abj') && isfield(par, 'E_Hj')
        predPar.E_Hj = predPar.E_Hb * 1.05;
    end

    % Format arguments for 'petregr_f'
    dataStruct = struct(speciesName, data);
    auxDataStruct = struct(speciesName, auxData);
    weightsStruct = struct(speciesName, weights);
    filternm = ['filter_' metaPar.model];

    % Run and time Nelder-Mead estimation
    try
        % Start timer
        tic;        
        % Run parameter estimation in parallel
        fut = parfeval(@parameterEstimationWithRestarts, 4, predPar, dataStruct, auxDataStruct, weightsStruct, filternm);

        % Block for up to maxTime seconds waiting for a result
        didFinish = wait(fut, 'finished', maxTime);
        if ~didFinish
            fprintf('[%4d / %d | %50s] TIMEOUT: parameter estimation took longer than %d seconds to finish. \n', i, numSpecies, speciesName, maxTime)
            initResultsTable{speciesName, 'execution_time'} = maxTime;
            initResultsTable{speciesName, 'convergence'} = false;
            initResultsTable{speciesName, 'error_message'} = "Maximum execution time exceeded";
            cancel(fut);
        else
            [n_restarts, converged, n_iter, fval] = fetchOutputs(fut);
            initResultsTable{speciesName, 'execution_time'} = toc;
            initResultsTable{speciesName, 'deb_loss'} = fval;
            initResultsTable{speciesName, 'convergence'} = converged;
            initResultsTable{speciesName, 'n_restarts'} = n_restarts;
            initResultsTable{speciesName, 'n_iter'} = n_iter;
        end
    catch ME
        % Some error ocurred while running estimation
        if isempty(fut.Error)
            error_message = ME.message;
        else
            error_message = fut.Error.message;
        end
        initResultsTable{speciesName, 'execution_time'} = toc;
        initResultsTable{speciesName, 'convergence'} = false;
        initResultsTable{speciesName, 'error_message'} = string(error_message);
        fprintf('[%4d / %d | %50s] ERROR: %s \n', i, numSpecies, speciesName, error_message)
    end
    % Check for cancel button press
    if getappdata(h, 'canceling')
        delete(h)
        fprintf('[%4d / %d | %50s] STOP: User stopped execution. \n', i, numSpecies, speciesName)
        break;
    end
    % Save table every iteration
    writetable(initResultsTable, outputFileName,'WriteRowNames',true);

end


%% Write results to a .csv file
writetable(initResultsTable, outputFileName,'WriteRowNames',true);
fprintf('Table saved in %s\n', outputFileName);

% Delete progress bar
delete(h)

%% Functions for parallel execution


function [n_restarts, converged, n_iter, fval] = parameterEstimationWithRestarts(predPar, dataStruct, auxDataStruct, weightsStruct, filternm)
    q = predPar;
    n_restarts = 0;
    n_iter = 0;
    converged = false;
    while ~converged && n_restarts < 5
        [q, converged, itercount, fval] = petregr_f('predict_pets', q, dataStruct, auxDataStruct, weightsStruct, filternm);
        n_restarts = n_restarts + 1;
        n_iter = n_iter + itercount;
    end
end

%% Functions to set global variables
function setGlobalVars
    global lossfunction report max_step_number max_fun_evals tol_simplex tol_fun simplex_size covRules;
    lossfunction = 'sb';
    report = 0;
    max_step_number = 5e3;
    max_fun_evals = 5e2;
    tol_simplex = 1e-4;
    tol_fun = 1e-4;
    simplex_size = 0.05;
    covRules = 0;
end

function setGlobalPetsVar(speciesName)
    global pets
    pets = {speciesName};
end