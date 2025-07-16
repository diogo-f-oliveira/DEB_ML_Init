classdef Taxo1NN < handle
    % TaxonomicKNNRegressor 1-NN regressor based on taxonomic distance
    %   Assumes taxonomic columns are pre-encoded in the input data at fixed positions.
    %   Uses hard-coded column indices for ultimate weight, taxonomy features,
    %   parameter values, and estimation flags.

    properties (Constant)
        penaltyNoEstim = 100;    % penalty for fixed parameter distance

        % Fixed column indices of trainData
        wiCol = 1;               % ultimate weight (Wwi) at column 1
        taxonomyCols = 2:6;      % five taxonomic features at columns 2-6 (genus, family, order, class, phylum)
        parValueCols = 7:15;     % nine parameter values at columns 7-15, order is s_p_M, p_M, kap, v, k_J, E_Hb, E_Hp, E_Hj, s_M
        freeParCols = 16:24;     % nine free-parameter flags at columns 16-24, order is same as parameters
    end

    properties
        % Model hyperparameters
        useScalingRelationships = true;
        ultimateWeightFactor = 0.01;

        % Data storage
        trainData           % numeric matrix of training inputs
    end

    methods
        function obj = Taxo1NN(useScalingRelationships, ultimateWeightFactor)
            % TaxonomicKNNRegressor Construct an instance
            %   obj = TaxonomicKNNRegressor(useScalingRelationships, ultimateWeightFactor)
            %   useScalingRelationships: boolean flag (default true)
            %   ultimateWeightFactor: scalar weight (default 0.01)
          
            obj.useScalingRelationships = useScalingRelationships;
            obj.ultimateWeightFactor = ultimateWeightFactor;
        end

        function loadTrainingData(obj, matFilename)
            % loadTrainingData Load training inputs from a .mat file
            %   File must contain a variable 'trainData'.
            data = load(matFilename, 'trainData');
            if ~isfield(data, 'trainData')
                error('MAT-file must contain variable ''trainData''.');
            end
            obj.trainData = data.trainData;
        end

        function yPred = predict(obj, X)
            % predict Apply 1-NN inference on X
            if isempty(obj.trainData)
                error('Model has not been provided training data. Use loadTrainingData.');
            end
            % Compute distance matrix on pre-encoded inputs
            D = obj.computeDistanceMatrix(X, obj.trainData);
            % Find the single nearest neighbor per query
            [~, idx] = min(D, [], 2);
            yPred = obj.trainData(idx, Taxo1NN.parValueCols);
            % Apply scaling relationships if enabled
            if obj.useScalingRelationships
                NNLogWwi = obj.trainData(idx, Taxo1NN.wiCol);
                XLogWwi = X(:, 1);
                yPred = obj.applyScaling(yPred, XLogWwi, NNLogWwi);
            end
        end

        function D = computeDistanceMatrix(obj, Xq, Xi)
            % computeDistanceMatrix Compute pairwise distances
            [nQ, ~] = size(Xq);
            [nI, ~] = size(Xi);
            D = zeros(nQ, nI);
            for q = 1:nQ
                for i = 1:nI
                    % Taxonomic distance 
                    taxQ = Xq(q, Taxo1NN.taxonomyCols);
                    taxI = Xi(i, Taxo1NN.taxonomyCols);
                    taxDist = obj.taxonomyDistance(taxQ, taxI);

                    % Ultimate weight distance
                    wiQ   = Xq(q, Taxo1NN.wiCol);
                    wiI   = Xi(i, Taxo1NN.wiCol);
                    wDist   = obj.ultimateWeightDistance(wiQ, wiI);

                    % Fixed parameter distance
                    parsQ = Xq(q, Taxo1NN.parValueCols);
                    parsI = Xi(i, Taxo1NN.parValueCols);
                    estimParQ = Xq(q, Taxo1NN.freeParCols);
                    parDist = obj.fixedParamDistance(parsQ, parsI, estimParQ);
                    
                    % Sum distance components
                    D(q,i) = taxDist + obj.ultimateWeightFactor * wDist + Taxo1NN.penaltyNoEstim * parDist;
                end
            end
        end

        function d = taxonomyDistance(~, taxQ, taxI)
            % taxonomyDistance Count mismatches in taxonomic features
            d = sum(taxQ ~= taxI);
        end

        function d = ultimateWeightDistance(~, wQ, wI)
            % ultimateWeightDistance Absolute difference in ultimate weight
            d = abs(wQ - wI);
        end

        function d = fixedParamDistance(~, parsQ, parsI, estimParQ)
            % fixedParamDistance Distance on fixed parameter values
            d = 0;
            for k = 1:length(parsQ)
                if ~estimParQ(k)
                    d = d + abs(log(parsQ(k)) - log(parsI(k)));
                end
            end
        end

        function yScaled = applyScaling(~, y, XLogWwi, NNLogWwi)
            % applyScaling Apply linear and cubic scaling if enabled (placeholder)
            zRatio = exp((XLogWwi - NNLogWwi) / 3); % zoom factor ratio from log scaled ultimate weights           
            
            yScaled = y;
            % Scale maturities
            for p=6:8
                yScaled(p) = y(p) * zRatio^3;
            end
        end
    end
end
