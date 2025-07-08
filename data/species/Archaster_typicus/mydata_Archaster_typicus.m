function [data, auxData, metaData, txtData, weights] = mydata_Archaster_typicus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Valvatida'; 
metaData.family     = 'Archasteridae';
metaData.species    = 'Archaster_typicus'; 
metaData.species_en = 'Sand star'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCi', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29.5); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 02]; 


%% set data
% zero-variate data

data.aj = 30; units.aj = 'd'; label.aj = 'age at settlement';   bibkey.aj = 'BosGuma2011';
  temp.aj = C2K(29.5); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.tp = 365; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'BosGuma2011';
  temp.tp = C2K(29.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;  units.am = 'd';     label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(29.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 1.7e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.15 mm: pi/6*0.015^3';
data.Wwp  = 3.16;   units.Wwp  = 'g';  label.Wwp  = 'radius at puberty';    bibkey.Wwp  = 'Wiki';
  comment.Wwp = 'based on 0.0007*29^2.499, for radius length 29 mm, see F3';
data.Wwi  = 28.6;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight'; bibkey.Wwi  = 'BosGuma2011';
  comment.Wwp = 'based on 0.0007*70^2.499, for radius length 70 mm, see F3';

data.GSI  = 0.10; units.GSI  = '-'; label.GSI  = 'gonado somatic index';     bibkey.GSI  = 'Runchen1988';   
  temp.GSI = C2K(29.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% univariate data

% time-length
data.tL = [... % time since , (d), radius (cm)
3.491	1.668
24.825	2.290
55.080	3.047
68.656	3.119
85.723	3.368
113.262	3.679
134.208	3.824
159.809	4.197
173.773	4.352
188.124	4.249
203.252	4.342
215.276	4.352
228.852	4.342
240.877	4.394
268.029	4.736
280.053	4.984];
units.tL   = {'d', 'cm'};  label.tL = {'time since 2008/01/01', 'radius length'};  
temp.tL   = C2K(29.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BosGuma2011';
%
data.tL1 = [ ... % time since settlement, (d), radius (cm)
3.103	4.145
25.600	4.290
55.855	4.570
67.492	4.808
85.335	4.798
113.650	4.943
134.208	5.098
159.033	5.285
173.773	5.347
188.124	5.347
202.864	5.254
216.052	5.347
229.240	5.295
240.101	5.472
267.641	5.461
281.993	5.534];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since 2008/01/01', 'radius length'};  
temp.tL1   = C2K(29.5);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BosGuma2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.tL1 = weights.tL1 * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for different cohorts'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'unlike other sea stars, males mount on females for mating';
metaData.bibkey.F1 = 'BosGuma2011'; 
F2 = 'males is a bit smaller than female';
metaData.bibkey.F2 = 'Wiki';
F3 = 'length-weight: wet weight (g) = 0.0007 * (radius in  mm)^2.499';
metaData.bibkey.F3 = 'BosGuma2011';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);  

%% Links
metaData.links.id_CoL = 'G85B'; % Cat of Life
metaData.links.id_ITIS = '989423'; % ITIS
metaData.links.id_EoL = '45328970'; % Ency of Life
metaData.links.id_Wiki = 'Archaster_typicus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '40840'; % Taxonomicon
metaData.links.id_WoRMS = '213119'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Archaster_typicus}}';
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
bibkey = 'BosGuma2011'; type = 'Article'; bib = [ ... 
'author = {A. R. Bos and G. S. Gumanao and M. M. van Katwijk and B. Mueller and M. M. Saceda and R. L. P. Tejada}, ' ... 
'year = {2011}, ' ...
'title = {Ontogenetic habitat shift, population growth, and burrowing behavior of the {I}ndo-{P}acific beach star, \emph{Archaster typicus} ({E}chinodermata; {A}steroidea)}, ' ...
'journal = {Mar. Biol.}, ' ...
'doi = {10.1007/s00227-010-1588-0}, ' ...
'volume = {158}, ' ...
'pages = {639--648}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Runchen1988'; type = 'Article'; bib = [ ... 
'author = {J.-Q. Run and C.-P. Chen and K.-H. Chang and F.-S. Chia}, ' ... 
'year = {1988}, ' ...
'title = {Mating behaviour and reproductive cycle of \emph{Archaster typicus} ({E}chinodermata: {A}steroidea)}, ' ...
'journal = {Mar. Biol.}, ' ...
'doi = {10.1007/s00227-010-1588-0}, ' ...
'volume = {99}, ' ...
'pages = {247--253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Archaster-typicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
