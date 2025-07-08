function [data, auxData, metaData, txtData, weights] = mydata_Pseudomys_gracilicaudatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Pseudomys_gracilicaudatus'; 
metaData.species_en = 'Eastern chestnut mouse'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 15];

%% set data
% zero-variate data

data.tg = 27;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'FoxKemp1982';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 24;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'FoxKemp1982';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 145;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on P. australis';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on P. australis';
    
data.Wwb = 3.8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'FoxKemp1982';
data.Wwi = 69.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'FoxKemp1982';
data.Wwim = 90.5;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'FoxKemp1982';

data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'FoxKemp1982';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 litters per yr, 3 pups per litter assumed, based on P. australis';

% uni-variate data

% time-weight
data.tWw_f = [ ... % time since birth (mnth), weight (g)
0.000	3.865
7.704	8.145
14.323	13.339
20.941	18.533
25.627	22.427
32.542	25.598
39.180	28.768
49.973	33.067
57.998	36.429
65.187	39.970
74.871	44.079
85.109	48.375
93.965	51.926
103.932	55.484
114.731	59.231
128.587	62.813
146.069	64.761
160.223	66.136
179.659	66.992];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'weight', 'female'};  
temp.tWw_f  = C2K(37.5);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'FoxKemp1982';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (mnth), weight (g)
0.515	4.604
9.909	9.999
16.807	15.011
23.150	20.019
31.419	26.880
38.594	32.077
49.368	38.401
66.220	48.443
82.807	57.011
82.807	57.011
82.807	57.011
83.364	56.830
96.087	62.798
107.155	67.467
127.632	75.875
148.115	83.731
179.165	90.363];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'weight', 'male'};  
temp.tWw_m  = C2K(37.5);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'FoxKemp1982';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4P4J3'; % Cat of Life
metaData.links.id_ITIS = '585497 '; % ITIS
metaData.links.id_EoL = '1179345'; % Ency of Life
metaData.links.id_Wiki = 'Pseudomys_gracilicaudatus'; % Wikipedia
metaData.links.id_ADW = 'Pseudomys_gracilicaudatus'; % ADW
metaData.links.id_Taxo = '89285'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001715'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudomys_gracilicaudatus}}';
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
bibkey = 'FoxKemp1982'; type = 'Article'; bib = [ ... 
'author = {Barry  J. Fox  and  Catherine  M. Kemper}, ' ... 
'year = {1982}, ' ...
'title = {Growth  and  Development  of \emph{Pseudomys  gracilicaudatus}  ({R}odentia : {M}uridae) in  the  Laboratory}, ' ...
'journal = {Austr. J. Zool.}, ' ...
'volume = {30}, ' ...
'pages = {175-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

