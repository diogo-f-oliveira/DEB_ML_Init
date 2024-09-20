outputFileName = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\results\bijection method\bijection_predictions.csv';
allSpeciesFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\species\';
datasetFile = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\data\raw\dataset_matlab.csv';
datasetTable = readtable(datasetFile, 'ReadRowNames', true);
speciesList = datasetTable.Properties.RowNames;
numSpecies = length(speciesList);


% Initialize table

parameterCols = {'z', 'kap', 'v', 'p_M', 'E_G', 'h_a', 'E_Hb', 'E_Hj', 'E_Hx', 'E_Hp'};
otherCols = {'bijection_flag', 'feasible', 'infeasibility_flag', 'error_message'};

columnNames = [parameterCols otherCols];
numCols = length(columnNames);
% Define variable types based on the column names
varTypes = {
    'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', ... % parameterCols
    'string', 'logical', 'string', 'string',
    };

bijectionTable = table('Size', [numSpecies, numCols], 'VariableTypes', varTypes, 'VariableNames', columnNames, 'RowNames', speciesList);

%% Loop through species
% Create progress bar
h = waitbar(0, 'Processing species...', 'Name', 'Running bijection...', 'CreateCancelBtn', 'setappdata(gcbf, ''canceling'', 1)', 'WindowStyle', 'docked');
% Check for cancel button press
setappdata(h, 'canceling', 0);
% Max execution time per iteration
maxTime = 3*60; % 3 minutes

% start_idx = 3323;
for i = start_idx:numSpecies
    speciesName = speciesList{i};
    waitbar(i / numSpecies, h, sprintf('Processing species %50s\n%d of %d\n', strrep(speciesName, '_', ' '), i, numSpecies));

    speciesFolder = fullfile(allSpeciesFolder, speciesName);
    % Check if the species folder exists
    if isfolder(speciesFolder)
        % Change directory to the species folder
        cd(speciesFolder);

        mydataFilePath = [speciesFolder '/mydata_' speciesName];
        parsInitFilePath = [speciesFolder '/pars_init_' speciesName];
        if (exist(mydataFilePath, 'file') ~= 2) || (exist(parsInitFilePath, 'file') ~= 2)
            fprintf('[%4d / %d | %50s] MISSING: mydata.m or pars_init.m files do not exist. \n', i, numSpecies, speciesName)
            continue
        end



        try
            % Run mydata.m
            [data, auxData, metaData, txtData, weights] = feval(['mydata_' speciesName]);
            % Run bijection function get_pars.m
            fut = parfeval(@get_pars, 4, data, auxData, metaData);

            % Block for up to maxTime seconds waiting for a result
            didFinish = wait(fut, 'finished', maxTime);
            if ~didFinish
                % Execution didn't finish in time, cancel this iteration
                cancel(fut);
                bijectionTable{speciesName, 'bijection_flag'} = "timeout";
                fprintf('[%4d / %d | %50s] TIMEOUT: bijection took longer than %d seconds to execute. \n', i, numSpecies, speciesName, maxTime)
                continue
            else
                % Did complete, retrieve results
                [par, metaPar, txtPar, flag] = fetchOutputs(fut);
            end
        catch ME
            fprintf('[%4d / %d | %50s] ERROR: %s \n', i, numSpecies, speciesName, fut.Error.message)
            bijectionTable{speciesName, 'bijection_flag'} = "error";
            bijectionTable{speciesName, 'error_message'} = string(fut.Error.message);
            continue
        end
        bijectionTable{speciesName, 'bijection_flag'} = string(flag);

        % Replace parameters in par
        for p=1:length(parameterCols)
            parName = parameterCols{p};
            if isfield(par, parName)
                bijectionTable{speciesName, parName} = par.(parName);
            end
        end

        % Check feasibility
        [feasible, infeasibilityFlag] = feval(['filter_' metaPar.model], par);
        bijectionTable{speciesName, 'feasible'} = feasible;
        bijectionTable{speciesName, 'infeasibility_flag'} = infeasibilityFlag;
    else
        warning('[%4d / %d | %50s] MISSING: Folder with AmP files does not exist. \n', i, numSpecies, speciesName);
    end

    % Check for cancel button press
    if getappdata(h, 'canceling')
        delete(h)
        fprintf('[%4d / %d | %50s] STOP: User stopped execution. \n', i, numSpecies, speciesName)
        break;
    end
end

% Write results to a .csv file
bijectionTable.error_message = replace(bijectionTable.error_message, newline, ' ');
writetable(bijectionTable, outputFileName,'WriteRowNames',true);
fprintf('Table saved in %s\n', outputFileName);
delete(h)