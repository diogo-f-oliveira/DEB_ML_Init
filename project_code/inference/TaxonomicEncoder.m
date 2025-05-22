classdef TaxonomicEncoder < handle
    %UNTITLED5 Summary of this class goes here
    %   Detailed explanation goes here
    properties (Constant)
        taxa = {'genus', 'family', 'order', 'class', 'phylum'};
    end
    properties
        taxonomyLabels
    end

    methods
        function obj = TaxonomicEncoder()
            %TaxonomicEncoder Construct an instance of this class
            %   Detailed explanation goes here
        end

        function loadEncoding(obj, matFilename)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            data = load(matFilename);
            obj.taxonomyLabels = struct();
            % Loop through each taxon field
            for t = 1:length(TaxonomicEncoder.taxa)
                taxon = TaxonomicEncoder.taxa{t};
                if ~isfield(data, taxon)
                    error(['MAT-file does not contain taxonomy encoding for taxon ' taxon '.']);
                end

                % Initialize sub-struct for each taxon
                s = struct();
                class_names = data.(taxon);

                for j = 1:length(class_names)
                    % Store the index (starting from 0 like in Python)
                    s.(class_names{j}) = j - 1;
                end
                obj.taxonomyLabels.(taxon) = s;
            end

        end

        function encodedTaxonomy = encode(obj, metaData)
            encodedTaxonomy = zeros(size(TaxonomicEncoder.taxa));
            % Get genus from species name
            parts = split(metaData.species, '_');
            speciesGenus = parts{1};

            % Get encoding for genus
            if isfield(obj.taxonomyLabels.genus, speciesGenus)
                encodedTaxonomy(1) = obj.taxonomyLabels.genus.(speciesGenus);
            else
                encodedTaxonomy(1) = obj.taxonomyLabels.genus.other;
            end

            % Get encoding for other taxa
            for t=2:length(TaxonomicEncoder.taxa)
                taxon = TaxonomicEncoder.taxa{t};
                speciesTaxon = metaData.(taxon);
                if isfield(obj.taxonomyLabels.(taxon), speciesTaxon)
                    encodedTaxonomy(t) = obj.taxonomyLabels.(taxon).(speciesTaxon);
                else
                    encodedTaxonomy(t) = obj.taxonomyLabels.(taxon).other;
                end
            end
        end
    end
end