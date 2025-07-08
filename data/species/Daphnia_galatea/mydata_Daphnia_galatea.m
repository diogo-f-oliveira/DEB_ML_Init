function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_galatea
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_galatea'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B','C','D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 14]; 

%% set data
% zero-variate data

data.tp = 6.5;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'WeerGula1997';   
  temp.tp = C2K(17.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 60;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0689; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'WeerGula1997';
data.Lp  = 0.15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'WeerGula1997';
data.Li  = 0.29;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'guess';
  comment.Li = 'based on tL data';

data.Wdi  = 100;  units.Wdi = 'mug'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Ceriodaphnia_pulchella: (0.25/0.09)^3*4.668';

data.Ri = 43/5;    units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'WeerGula1997';   
  temp.Ri = C2K(17.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 43 neonates at end experiment';

% uni-variate data

% time-length
data.tL = [ ... % instar (#), length (mm)
 0	    0.689
 1.5	0.807
 3.5	1.032
 5.5	1.263
 7.5	1.488
 9.5	1.739
11.5	1.934
13.5	2.019];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(17.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WeerGula1997'; 
comment.tL = 'fed on N-limited Chlamydomonas reinhardtii, assuming 1.5 d for first instar, 2 d for further instars';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'intermoult interval in LN data is guessed at 2 d';
metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '345C2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '33100'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WeerGula1997'; type = 'article'; bib = [ ... 
'author = {Paul M. M. Weers and Ramesh D. Gulati}, ' ... 
'year = {1997}, ' ...
'title = {Growth and reproduction of \emph{Daphnia galeata} in response to changes in fatty acids, phosphorus, and nitrogen in \emph{Chlamydomonas reinhardtii}}, ' ...
'journal = {Limnology and Oceanography}, ' ...
'volume = {42(7)}, ' ...
'pages = {1479-1650}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
