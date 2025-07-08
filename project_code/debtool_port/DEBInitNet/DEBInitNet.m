classdef DEBInitNet < handle
    %DEBInitNet Neural network for DEB initialization with selective log and standardization transforms
    properties (Constant)
        EPSILON = 1e-6;
    end
    properties
        nInputs
        nOutputs
        useSkipConnection
        sharedWeights    % cell array of weight matrices for shared layers
        sharedBiases     % cell array of bias vectors for shared layers
        parWeights       % 2D cell array (param x layer) of weight matrices
        parBiases        % 2D cell array (param x layer) of bias vectors
        boundedColIdx    % indices of outputs to clamp in log space
        upperBounds      % standardized log-scale upper bounds vector (loaded)
        % Transformer parameters
        inputMean        % vector of means for input standardization (for scaled inputs)
        inputStd         % vector of std devs for input standardization
        outputMean       % vector of means for output standardization
        outputStd        % vector of std devs for output standardization
        % Column indices for transforms (loaded directly from file)
        inputLogIdx      % indices of inputs to apply log
        inputScaleIdx    % indices of inputs to standardize (corresponding to inputMean/std)
        outputLogIdx     % indices of outputs to apply inverse log
        outputScaleIdx   % indices of outputs to destandardize (corresponding to outputMean/std)
    end

    methods
        function obj = DEBInitNet(modelStructureFile)
            % Constructor loads entire model structure from .mat
            if nargin < 1 || isempty(modelStructureFile)
                error('A .mat file containing the model structure must be provided.');
            end
            data = load(modelStructureFile);
            % Required variables in .mat:
            % sharedWeights, sharedBiases, parWeights, parBiases,
            % useSkipConnection,
            % inputMean, inputStd, outputMean, outputStd,
            % inputLogIdx, inputScaleIdx, outputLogIdx, outputScaleIdx,
            % boundedColIdx, upperBounds

            % Network parameters
            obj.sharedWeights     = data.sharedWeights;
            obj.sharedBiases      = data.sharedBiases;
            obj.parWeights        = data.parWeights;
            obj.parBiases         = data.parBiases;
            obj.useSkipConnection = data.useSkipConnection;

            % Scaler parameters (only for scale indices)
            obj.inputMean   = data.inputMean;
            obj.inputStd    = data.inputStd;
            obj.outputMean  = data.outputMean;
            obj.outputStd   = data.outputStd;

            % Column indices for transforms
            obj.inputLogIdx    = data.inputLogIdx;
            obj.inputScaleIdx  = data.inputScaleIdx;
            obj.outputLogIdx   = data.outputLogIdx;
            obj.outputScaleIdx = data.outputScaleIdx;

            % Loaded bounded clamp configuration
            obj.boundedColIdx = data.boundedColIdx;
            obj.upperBounds   = data.upperBounds;

            % Dimensions based on model structure
            obj.nInputs  = size(obj.sharedWeights{1}, 2);
            obj.nOutputs = size(obj.parWeights, 1);
        end

        function yPred = predict(obj, x)
            % Predict parameters from a single input column vector x (nInputs x 1)
            assert(isvector(x) && numel(x)==obj.nInputs, 'Input must be a column vector of length nInputs');

            % Transform input selectively
            xMod = obj.transformInput(x);

            % Shared layers
            out = xMod;
            for i = 1:numel(obj.sharedWeights)
                out = obj.relu(obj.sharedWeights{i} * out + obj.sharedBiases{i});
            end

            % Skip connection
            if obj.useSkipConnection
                inPar = [out; xMod];
            else
                inPar = out;
            end

            % Parameter-specific layers
            yUn = zeros(obj.nOutputs,1);
            numLayers = size(obj.parWeights, 2);
            for o = 1:obj.nOutputs
                tmp = inPar;
                for l = 1:numLayers
                    tmp = obj.parWeights{o, l} * tmp + obj.parBiases{o, l};
                    if l < numLayers
                        tmp = obj.relu(tmp);
                    end
                end
                yUn(o) = tmp;
            end

            % Clamp log-scale outputs
            if ~isempty(obj.boundedColIdx)
                raw = yUn(obj.boundedColIdx);
                yUn(obj.boundedColIdx) = obj.upperBounds + log(obj.sigmoid(raw)) - obj.EPSILON;
            end

            % Inverse transform outputs selectively
            yPred = obj.inverseTransformOutput(yUn);
        end
    end

    methods (Access = private)
        function xOut = transformInput(obj, x)
            % Selectively apply log and standardization to column vector
            xOut = x;
            if ~isempty(obj.inputLogIdx)
                xOut(obj.inputLogIdx) = log(xOut(obj.inputLogIdx));
            end
            if ~isempty(obj.inputScaleIdx)
                % inputMean/std correspond exactly to these indices
                xOut(obj.inputScaleIdx) = (xOut(obj.inputScaleIdx) - obj.inputMean) ./ obj.inputStd;
            end
        end

        function yOut = inverseTransformOutput(obj, yIn)
            % Selectively destandardize and exp for column vector output
            yOut = yIn;
            if ~isempty(obj.outputScaleIdx)
                yOut(obj.outputScaleIdx) = yOut(obj.outputScaleIdx) .* obj.outputStd + obj.outputMean;
            end
            if ~isempty(obj.outputLogIdx)
                yOut(obj.outputLogIdx) = exp(yOut(obj.outputLogIdx));
            end
        end
    end

    methods (Static, Access=private)
        function s = sigmoid(x)
            s = 1 ./ (1 + exp(-x));
        end

        function y = relu(x)
            y = max(x, 0);
        end
    end
end
