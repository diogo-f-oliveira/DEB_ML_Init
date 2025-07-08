function [data, auxData, metaData, txtData, weights] = mydata_Disparalona_rostrata
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Disparalona_rostrata'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A','B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH','TPi'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ap'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'; 'T-am'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 15]; 

%% set data
% zero-variate data

data.tp = 8;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'Robe1988';   
  temp.tp = C2K(19);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 

data.Lb  = 0.034; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'Robe1988';
data.Lp  = 0.048; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'Robe1988';
data.Li  = 0.0572;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'Robe1988';

data.Wdi  = 1.2;  units.Wdi = 'mug'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Ceriodaphnia_pulchella: (0.0572/0.09)^3*4.668';

data.Ri = 2/7.3;    units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Robe1988';   
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 2 eggs per moult interval of 7.3 d';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
 0.000	0.340
 4.732	0.428
 9.764	0.491
16.557	0.504
23.171	0.529
30.490	0.534
36.937	0.539
44.080	0.548
51.050	0.553
57.671	0.558
64.814	0.567
71.784	0.572
78.233	0.572];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(14); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Robe1988'; 
  
% temperature-age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
    10 13.0
    14  6.9
    19  4.8];
units.Tab  = {'C', 'd'};  label.Tab = {'temperature','age at birth'};  
bibkey.Tab = 'Robe1988'; 

% temperature-life span
data.Tam = [ ... % temperature (C), age at birth (d)
    10 80 
    14 42
    19 30];
units.Tam  = {'C', 'd'};  label.Tam = {'temperature','life span'};  
bibkey.Tam = 'Robe1988'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1',D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DBNG'; % Cat of Life
metaData.links.id_ITIS = '84102'; % ITIS
metaData.links.id_EoL = '46498242'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Disparalona_rostrata'; % ADW
metaData.links.id_Taxo = '156232'; % Taxonomicon
metaData.links.id_WoRMS = '148402'; % WoRMS

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
bibkey = 'Robe1988'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1365-2427.1988.tb01719.x}, ' ...
'author = {Anne L. Robertson}, ' ... 
'year = {1988}, ' ...
'title = {Life histories of some species of {C}hydoridae ({C}ladocera: {C}rustacea)}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {20(1)}, ' ...
'pages = {75–84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
