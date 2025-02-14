clear all
format long

global lossfunction;
lossfunction = 'sb';

allSpeciesFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\species\';
resultsFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\results\';

datasetName = 'ratio_output_no_pub_weight_taxonomy_ecocodes';
% modelName = 'RandomForestRegressor';
% modelName = 'KNeighborsRegressor';
% modelName = 'AmP';
% modelName = 'BijectionMethod';
modelName = 'TopML';


parameterPredictionFile = [resultsFolder datasetName '\parameter_predictions\' modelName '_predictions.csv'];
feasibleFile = [resultsFolder datasetName '\feasibility\' modelName '_feasibility.csv'];
outputFileName = [resultsFolder datasetName '\deb_model_loss\' modelName '_deb_model_loss.csv'];

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

%% Loop through species
% Create progress bar
h = waitbar(0, '', 'Name', 'Compution loss...', 'CreateCancelBtn', 'setappdata(gcbf, ''canceling'', 1)', 'WindowStyle', 'docked');
% Check for cancel button press
setappdata(h, 'canceling', 0);

% Max execution time per iteration
maxTime = 3*60; % 3 minutes

for i = 1:numSpecies
    speciesName = speciesList{i};
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
        predPar.(parName) = parameterEstimates{speciesName, parName};
    end
    % Add maturity at weaning
    if strcmp(metaPar.model, 'stx') || isfield(par, 'E_Hx')
        predPar.E_Hx = predPar.E_Hb * 1.05;
    end
    % Add maturity at metamorphosis
    if strcmp(metaPar.model, 'abj') || isfield(par, 'E_Hj')
        predPar.E_Hj = predPar.E_Hb * 1.05;
    end

    % Run predict file
    try
        % Run predict function in parallel
        fut = parfeval(@feval, 2, ['predict_' speciesName], predPar, data, auxData);

        % Block for up to maxTime seconds waiting for a result
        didFinish = wait(fut, 'finished', maxTime);
        if ~didFinish
            % Execution didn't finish in time, cancel this iteration
            debLossTable{speciesName, 'success'} = false;
            debLossTable{speciesName, 'error_type'} = "timeout";
            fprintf('[%4d / %d | %50s] TIMEOUT: predict function took longer than %d seconds to execute. \n', i, numSpecies, speciesName, maxTime)
            cancel(fut);
            continue
        else
            % Predict function was successful
            [prdData, info] = fetchOutputs(fut);
            if ~info
                debLossTable{speciesName, 'success'} = false;
                fprintf('[%4d / %d | %50s] PREDICT_FILTER: Parameter set did not pass custom filter defined in predict file. \n', i, numSpecies, speciesName, fut.Error.message)

                debLossTable{speciesName, 'error_type'} = "predict_filter";
                continue
            else
                % Compute loss
                debLossTable{speciesName, 'deb_loss'} = deb_lossfun(data, prdData, weights);
                debLossTable{speciesName, 'success'} = true;
            end


        end
    catch ME
        % Some error ocurred while computing loss
        if isempty(fut.Error)
            error_message = ME.message;
        else
            error_message = fut.Error.message;
        end
        fprintf('[%4d / %d | %50s] ERROR: %s \n', i, numSpecies, speciesName, error_message)
        debLossTable{speciesName, 'success'} = false;
        debLossTable{speciesName, 'error_type'} = "predict_or_loss_error";
        debLossTable{speciesName, 'error_message'} = string(error_message);

    end
    % Check for cancel button press
    if getappdata(h, 'canceling')
        delete(h)
        fprintf('[%4d / %d | %50s] STOP: User stopped execution. \n', i, numSpecies, speciesName)
        break;
    end

end

%% Write results to a .csv file
writetable(debLossTable, outputFileName,'WriteRowNames',true);
fprintf('Table saved in %s\n', outputFileName);

% Delete progress bar
delete(h)