
clear all
format long

%% Define folders
filePathsCSVPath = '..\..\filepaths.csv';
pathsTable = readtable(filePathsCSVPath, 'Delimiter', ',', 'ReadVariableNames', true, 'ReadRowNames', true);
allSpeciesFolder = pathsTable{'species_folder', 'path'}{:};
resultsFolder = '..\..\results';

%% Define model
modelNamesCell = {
    % 'AmP',
    'BijectionMethod',
    'SRTaxo1NN',
    'Taxo1NN',
    % 'RandomForestRegressor',
    'MultiTaskElasticNet',
    'MLP',
    % 'DEBNetHC',
    % 'DEBNetSC',
    % 'DEBNet',
    };

%%
for iter=1:numel(modelNamesCell)

    modelName = modelNamesCell{iter};

    %% Check feasibility of parameter sets
    currentTime = datestr(datetime('now', 'TimeZone', 'UTC'), 'yyyy-mm-dd HH:MM:SS');
    fprintf('[%s] Checking feasibility for predictions of model %s.\n\n', currentTime, modelName)
    parallel_check_feasibility

    %% Check deb loss of parameter sets
    currentTime = datestr(datetime('now', 'TimeZone', 'UTC'), 'yyyy-mm-dd HH:MM:SS');
    fprintf('[%s] Computing DEB Model Loss for predictions of model %s.\n\n', currentTime, modelName)
    parallel_compute_deb_loss

    %% Run initialization
    currentTime = datestr(datetime('now', 'TimeZone', 'UTC'), 'yyyy-mm-dd HH:MM:SS');
    fprintf('[%s] Evaluating intitialization for predictions of model %s.\n\n', currentTime, modelName)
    parallel_evaluate_initialization_method

end


