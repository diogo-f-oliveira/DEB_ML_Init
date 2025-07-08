function [data, auxData, metaData, txtData, weights] = mydata_Parathyasira_sp
  
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Lucinida'; 
metaData.family     = 'Thyasiridae';
metaData.species    = 'Parathyasira_sp'; 
metaData.species_en = 'Northern hatchet shell';

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp','biAb'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); 

metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Wd'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Joany Marino'};            
metaData.date_subm = [2017 11 22];                
metaData.email    = {'joanyvalentina@gmail.com'};
metaData.address  = {'Memorial University of Newfoundland, A1B 3X9, Canada'}; 

metaData.author_mod_1   = {'Joany Marino'};          
metaData.date_mod_1 = [2018 01 20];              
metaData.email_mod_1     = {'joanyvalentina@gmail.com'};
metaData.address_mod_1   = {'Memorial University of Newfoundland, A1B 3X9, Canada'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 30]; 

%% set data

% % zero-variate data

data.am = 6*365;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'Dufo2017';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0138;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'GiolDufo2015';
  comment.Lb = 'Length at birth is measured by the size (length) of the prodissoconch (range 122-156 microm).';

data.Lp  = 0.28;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Dufo2017'; 
  comment.Lb = 'Measured as the length of the smallest individual found bearing eggs.'; 

data.Li  = 0.514;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Dufo2017';
  comment.Li = 'Total length measured as shell length (anterior-posterior).';

data.Wdi = 0.002783;   units.Wdi = 'g';   label.Wdi = 'ultimate ash-free dry weight';     bibkey.Wdi = 'Mari2017';

data.Ri  = 2.2399e+03/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(10);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = ['Guessed based on Thyasira gouldi (Blac1973).' ...
             'The Ri is taken as the maximum number of eggs contained within the gonad divided by days in a year.' ...
             'In this population, temperature ranges from 7 to 13°C.'];


% % uni-variate data
 
% L-Wd data
data.LWd = [3.146	3.958	2.551	2.4	2.711	2.996	3.306	3.384	3.733	3.703	4.826	5.14; % total length (mm) 
	 0.000229	0.000992	0.000201	0.000142	0.000223	0.0008	0.000672	0.000777	0.001321	0.00274	0.003066	0.002783]';    % ash-free dry weight (g) 
data.LWd = sortrows(data.LWd); % sort data
data.LWd(:,1) = data.LWd(:,1) * 1e-1; % convert mm to cm
  units.LWd = {'cm', 'g'};     label.LWd = {'total length', 'ash-free dry weight'};  
  bibkey.LWd = 'Mari2017';
  temp.LWd = C2K(6);  units.temp.LWd = 'K'; label.temp.LWd = 'temperature';
  comment.LWd = 'Ash-free dry weight was used to remove the weight of the shell.';

% Age-length data
data.tL = [1 2 3 4 5; % age (years)
    0.975925519	1.9718941806	2.9123529288	3.6547318091	4.2023899111]';  % average length (mm)
data.tL(:,1) = data.tL(:,1) * 365; % convert a to d
data.tL(:,2) = data.tL(:,2) * 1e-1; % convert mm to cm
  units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'average length'};  
  bibkey.tL = 'Dufo2017';
  comment.tL = 'Measurements are taken as the average shell length for various individuals at that age.';
  temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'A minimal amount of information on Thyasira gouldi is used in this entry when there is no corresponding data for Parathyasira sp.';
D2 = 'Growth measurements were updated in January 2018.';
D3 = 'T_typical is taken to be equal to the temperature of the sediment, which is seasonal (range 0.7-14C, LaurBats2015).';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Thyasirids may have sulfur-oxidizing bacterial symbionts. Symbiotic thyasirids are mixotrophs, deriving nutritional input from particulate feeding and from their symbionts.';
metaData.bibkey.F1 = 'DandSpir1993';
F2 = 'Parathyasira sp. is sympatric with Thyasira cf. gouldi (including symbiotic OTUs). These thyasirids are found in close proximity and with a patchy distribution.';
metaData.bibkey.F2 = 'BatsLaur2014';
F3 = 'Parathyasira sp. may be constrained to lower latitudes when compared to Thyasira gouldi, which is described as being panarctic. The distribution of Parathyasira sp. and Thyasira cf. gouldi (outside of Bonne Bay, Newfoundland) remains uncertain.';
metaData.bibkey.F3 = 'Dufo2017';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '7PBWQ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46472981'; % Ency of Life
metaData.links.id_ADW = 'Parathyasira'; % ADW
metaData.links.id_Taxo = '135456'; % Taxonomicon
metaData.links.id_WoRMS = '152893'; % WoRMS
metaData.links.id_molluscabase = '152893'; % MolluscaBase

%% References

bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thyasira_gouldi}},'...
'note = {Accessed : 2017-11-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DandSpir1993'; type = 'Article'; bib = [ ...
'author = {Dando, P. R. and Spiro, B.}, '...
'title = {Varying nutritional dependence of the thyasirid bivalves \emph{Thyasira sarsi} and \emph{T. equalis} on chemoautotrophic symbiotic bacteria, demonstrated by isotope ratios of tissue carbon and shell carbonate}, '...
'journal = {Marine Ecology Progress Series}, '...
'pages = {151--158}, '...
'year = {1993}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Blac1973'; type = 'PhDthesis'; bib = [ ...
'author = {Blacknell, W. M.}, '...
'year = {1973}, '...
'pages = {191}, '...
'school = {University of Stirling}, '...
'title = {Aspects of the biology of \emph{Thyasira gouldi} (Philippi) and its copepod parasite \emph{Axinophilus thyasirae} (Bresciani and Ockelmann)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LaurBats2015'; type = 'Article'; bib = [ ...
'author = {Laurich, J. R. and Batstone, R. T. and Dufour, S. C.}, '...
'doi = {10.1007/s00227-015-2727-4}, '...
'isbn = {ISSN 0025-3162}, '...
'issn = {00253162}, '...
'journal = {Marine Biology}, '...
'number = {10}, '...
'pages = {2017--2028},'...
'publisher = {Springer Berlin Heidelberg}, '...
'title = {Temporal variation in chemoautotrophic symbiont abundance in the thyasirid bivalve \emph{Thyasira cf. gouldi}}, '...
'volume = {162},'...
'year = {2015}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BatsLaur2014'; type = 'Article'; bib = [ ...
'author = {Batstone, R. T. and Laurich, J. R. and Salvo, F. and Dufour, S. C.},'...
'doi = {10.1371/journal.pone.0092856}, '...
'journal = {PLoS ONE}, '...
'number = {3}, '...
'pages = {1--9}, '...'pmid = {24658402},'...
'title = {Divergent chemosymbiosis-related characters in \emph{Thyasira cf. gouldi} ({B}ivalvia: {T}hyasiridae)},'...
'volume = {9}, '...
'year = {2014}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GiolDufo2015'; type = 'Article'; bib = [ ...
'author = {Giolland, M. and Dufour, S. C.},'...
'journal = {Unpublished}, '...
'title = {Identification de bivalves de la famille des Thyasirids formant un complexe despeces cryptiques dans un fjord de {T}erre-{N}euve ({C}anada)}, '...
'year = {2015}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dufo2017'; type = 'Misc'; bib = ...
 'note = {Observations by Suzanne Dufour}';
 metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mari2017'; type = 'Misc'; bib = ...
 'note = {Observations by Joany Marino}';
 metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

