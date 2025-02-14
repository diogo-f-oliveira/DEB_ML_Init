
clear all
format long

%% Define folders
allSpeciesFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\DEB Resources\DEBtool\AmPdata\species\';
resultsFolder = 'C:\Users\diogo\OneDrive - Universidade de Lisboa\Terraprima\Code\DEB Model Calibration Algorithms\DEB_ML_Bijection\results\';

%% Define dataset and model
% datasetName = 'ratio_output_no_pub_weight_taxonomy_ecocodes';
% datasetName = 'all';
% datasetName = 'ratio_output_no_pub_age_taxonomy_ecocodes';
datasetNamesCell = {
    % 'ratio_output_no_pub_age_taxonomy_ecocodes',
    % 'ratio_output_no_pub_age_taxonomy_ecocodes',
    'biologist_no_pub_age',
    % 'biologist_no_pub_age',
    % 'ratio_output_no_pub_age_taxonomy_ecocodes',
    % 'ratio_output_no_pub_age_taxonomy_ecocodes',
    % 'all_constraints_no_pub_age_taxonomy_ecocodes',
    % 'all_constraints_no_pub_age_taxonomy_ecocodes',
    % 'all_constraints_no_pub_age_taxonomy_ecocodes',
    % 'all_constraints_no_pub_age_taxonomy_ecocodes',
    };
% datasetNamesCell = {'ratio_output_no_pub_age_taxonomy_ecocodes', 'ratio_output_no_pub_age_taxonomy_ecocodes', 'ratio_output_no_pub_age_taxonomy_ecocodes', 'ratio_output_no_pub_age_taxonomy_ecocodes', 'ratio_output_no_pub_age_taxonomy_ecocodes', 'ratio_output_no_pub_age_taxonomy_ecocodes', };

modelNamesCell = {
    % 'BijectionMethod',
    'AmP',
    % 'TaxonomicKNNRegressor',
    % 'RandomForestRegressor',
    % 'MultiTaskElasticNet',
    % 'DEBNetHC',
    % 'DEBNetSC',
    % 'DEBNet',
    };


%%
for iter=1:numel(modelNamesCell)

    datasetName = datasetNamesCell{iter};
    modelName = modelNamesCell{iter};

    %% Check feasibility of parameter sets
    fprintf('Checking feasibility for predictions of model %s in dataset %s.\n\n', modelName, datasetName)
    parallel_check_feasibility

    %% Check deb loss of parameter sets
    fprintf('Computing DEB Model Loss for predictions of model %s in dataset %s.\n\n', modelName, datasetName)
    parallel_compute_deb_loss

    %% Run initialization
    fprintf('Evaluating intitialization for predictions of model %s in dataset %s.\n\n', modelName, datasetName)
    parallel_evaluate_initialization_method

end


