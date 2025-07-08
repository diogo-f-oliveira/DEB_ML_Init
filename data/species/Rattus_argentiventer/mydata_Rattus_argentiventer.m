function [data, auxData, metaData, txtData, weights] = mydata_Rattus_argentiventer
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Rattus_argentiventer'; 
metaData.species_en = 'Ricefield rat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 15];

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'YoshShir1997';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'ADW';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 35;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'YoshShir1997';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '30-40 d';
data.tpm = 60;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male';  bibkey.tpm = 'YoshShir1997';
  temp.tpm = C2K(35);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 880;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'YoshShir1997';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature';   comment.am = 'YoshShir1997';
  
data.Wwb = 4.9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'YoshShir1997';
data.Wwbm = 7; units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';          bibkey.Wwbm = 'YoshShir1997';

data.Ri  = 21/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5-10 pups per litter; 3 litters per yr assumed';
   
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
1.134	4.896
4.093	5.604
7.453	10.508
12.290	15.417
18.963	18.932
23.051	22.440
27.898	28.747
32.427	42.047
38.429	54.651
42.917	62.356
47.764	68.663
53.340	73.574
63.055	88.986
73.852	100.904
83.177	113.517
93.235	125.434
104.006	133.855
113.362	150.665
124.185	166.080
134.228	175.898
144.235	180.821
154.955	182.250
195.243	187.257
214.451	188.010
233.653	188.064
253.605	189.519];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(35); units.temp.tW_f = 'C'; label.temp.tW_f = 'temperature'; 
bibkey.tW_f = 'YoshShir1997';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
1.518	6.995
4.863	9.802
10.069	14.711
14.531	18.920
20.486	25.230
26.452	32.939
30.966	44.141
35.849	55.343
41.122	69.344
45.600	75.650
50.848	86.154
61.342	107.163
71.889	135.164
80.891	154.070
91.755	175.080
101.553	201.681
111.632	216.394
122.429	228.312
132.836	237.432
142.458	240.257
152.814	242.383
173.494	242.441
192.784	254.383
212.346	253.039
233.031	253.797
252.280	260.144];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(35);  units.temp.tW_m = 'C'; label.temp.tW_m = 'temperature'; 
bibkey.tW_m = 'YoshShir1997';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4RM3V'; % Cat of Life
metaData.links.id_ITIS = '585512'; % ITIS
metaData.links.id_EoL = '1179360'; % Ency of Life
metaData.links.id_Wiki = 'Rattus_argentiventer'; % Wikipedia
metaData.links.id_ADW = 'Rattus_argentiventer'; % ADW
metaData.links.id_Taxo = '89124'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001732'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rattus_argentiventer}}';
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
bibkey = 'YoshShir1997'; type = 'Article'; bib = [ ... 
'doi = {10.15017/23590}, ' ...
'author = {Yoshimatsu, K. and Shiraishi, S.}, ' ... 
'year = {1997}, ' ...
'title = {Growth, Development and Fecundity of Rice-field Rat, \emph{Rattus agrentiventer}, in Capitvity}, ' ...
'journal = {Sci. Bull. Faculty of Agriculture, Kyushu University}, ' ...
'volume = {51}, ' ...
'number = {3/4}, ' ...
'pages = {145-156}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Rattus_argentiventer/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

