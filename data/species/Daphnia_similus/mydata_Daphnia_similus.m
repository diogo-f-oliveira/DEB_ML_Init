function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_similus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_similus'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A','B','C'};
metaData.ecoCode.ecozone = {'TPi','TA','TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 15]; 

%% set data
% zero-variate data

data.ab = 1.62;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Venk1992';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2.9;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'Venk1992';   
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 36;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Venk1992';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.070; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Venk1992';
data.Lp  = 0.180; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Venk1992';
data.Li  = 0.710; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Venk1992';
  
data.Wdi  = 4.2;  units.Wdi  = 'mg';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(710/370)^3';

data.Ri  = 200/33; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Venk1992';   
  temp.Ri = C2K(29); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
1	0.745 0.685
2	0.864 0.859
3	0.939 1.114
4	1.172 1.401
5	1.536 1.808
6	1.834 2.221
7	2.018 2.438
8	2.098 2.605
9	2.201 2.701
10	2.248 2.825
11	2.291 2.971
12	2.339 3.057
13	2.376 3.111
14	2.396 3.088
15	2.428 NaN
16	2.508 NaN
17	2.545 NaN
18	2.577 NaN
19	2.581 NaN
20	2.563 NaN
21	2.567 NaN
22	2.572 NaN
23	2.581 NaN
24	2.559 NaN
25	2.584 NaN
26	2.632 NaN
27	2.636 NaN];	
data.tL(:,1) = data.tL(:,1) - 1; % start counting from 0
data.tL(:,2:3) = data.tL(:,2:3)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
bibkey.tL = 'Venk1992'; treat.tL = {1 {'29 C','16.5 C'}};
units.instar.tL = '#'; label.instar.tL = 'instar';
instar.tL = [ ... % moult (#), intermoult interval (h) at 29, 16.5 C
 0   0   0
 1	12  10
 2	13  20
 3	14  20
 4	15  20
 5	20  30
 6	29  40
 7	31  50
 8	31  60
 9	33  70
10	33  85
11	35 180
12	35 185
13	35 190
14	35 190
15	35 190
16	35 190
17	35 190
18	35 190
19	35 190
20	35 190
21	35 190
22	35 190
23	35 190
24	35 190
25	35 190
26	35 190
27	35 190];
instar.tL(:,2:3) = cumsum(instar.tL(:,2:3)/ 24,1); % convert h to d

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
%weights.Lb = 3 * weights.Lb; 
%weights.Li = 3 * weights.Li; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.instar = instar;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3459M'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3208998'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4615044'; % Taxonomicon
metaData.links.id_WoRMS = '1302472'; % WoRMS

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
bibkey = 'Venk1992'; type = 'Article'; bib = [ ... 
'author = {Krishnamoorthy Venkataraman}, ' ... 
'year = {1992}, ' ...
'title = {Biology of \emph{Daphnia similis} {C}laus and \emph{Daphnia cephalata} {K}ing under different temperature conditions.}, ' ...
'journal = {J. Andaman Sci. Assoc.}, ' ...
'volume = {8(1)}, ' ...
'pages = {12-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
%
bibkey = 'gbif'; type = 'misc'; bib = [ ... 
'author = {Krishnamoorthy Venkataraman}, ' ... 
'year = {1992}, ' ...
'title = {Biology of \emph{Daphnia similis} {C}laus and \emph{Daphnia cephalata} {K}ing under different temperature conditions.}, ' ...
'howpublished = {\url{https://www.gbif.org/species/2234810}}, ' ...
'volume = {8(1)}, ' ...
'pages = {12-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];