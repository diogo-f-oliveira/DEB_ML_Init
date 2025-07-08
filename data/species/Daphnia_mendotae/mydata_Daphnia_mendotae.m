function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_mendotae

%% set metaData

metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_mendotae';  
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'; };  
metaData.data_1     = {'t-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 24];

%% set data
% zero-variate data;

data.ab = 2.6;   units.ab = 'd';  label.ab = 'age at birth';         bibkey.ab = 'DudyLync2005';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on instar duration';
data.tp = 4;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'DudyLync2005';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 136;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'DudyLync2005';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
   
% weight
data.Wdb = 1.41;  units.Wdb = 'mug';    label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'DudyLync2005';
data.Wdp = 6.094;  units.Wdp = 'mug';    label.Wdp = 'dry weight at puberty'; bibkey.Wdp = 'DudyLync2005';
data.Wdi = 39.5;  units.Wdi = 'mug';    label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'DudyLync2005';

% reproduction
data.Ri = 2/3; units.Ri = '#/d'; label.Ri = 'ultimate reproduction rate'; bibkey.Ri = 'Thre2005';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';  
  comment.Ri = '2 eggs per clutch/ 1 clutch  per instar';

% uni-variate data

idW = [ ... % instar (#), duration (d), dry weight (mug)
 1	1.247  3.758
 2	1.472  5.215
 3	1.150  7.619
 4	1.398 10.859
 5	2.323 13.842
 6	2.272 16.390
 7	2.686 20.717
 8	2.560 22.369
 9	2.790 24.217
10	2.859 26.508
11	2.802 28.548
12	3.009 30.649
13	3.015 32.875
14	2.998 34.979
15	3.096 37.712
16	3.114 39.115];
data.tW = [cumsum(idW(:,1)),idW(:,3)]; % set origin at first data point
units.tW   = {'d', 'mug'};  label.tW = {'time', 'dry weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DudyLync2005';
comment.tW = 'high food: 1.54 mug C/ml of algae Chlamydomonas and Scenedesmus; data composed from figs 3 and 4';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.Wdi = 3 * weights.Wdi;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weights.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '345BZ'; % Cat of Life
metaData.links.id_ITIS = '83877'; % ITIS
metaData.links.id_EoL = '9055505'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5343982'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ceriodaphnia}}';
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
bibkey = 'DudyLync2005'; type = 'Article'; bib = [...
'doi = {10.1111/j.0014-3820.2005.tb01016.x}, ' ...
'author = {Jeffry L. Dudycha and Michael Lynch}, ' ... 
'year = {2005}, ' ...
'title = {CONSERVED ONTOGENY AND ALLOMETRIC SCALING OF RESOURCE ACQUISITION AND ALLOCATION IN THE {D}APHNIIDAE}, ' ...
'journal = {Evolution}, ' ...
'volume = {59(3)}, ' ...
'pages = {565–576}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thre2005'; type = 'Article'; bib = [...
'doi = {10.1093/plankt/8.4.639}, ' ...
'author = {Stephen T. Threlkeld}, ' ... 
'year = {2005}, ' ...
'title = {Life table responses and population dynamics of four cladoceran zooplankton during a reservoir flood}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {8(4)}, ' ...
'pages = {639-647}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

