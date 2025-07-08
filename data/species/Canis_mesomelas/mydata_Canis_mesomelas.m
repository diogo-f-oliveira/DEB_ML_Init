function [data, auxData, metaData, txtData, weights] = mydata_Canis_mesomelas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Canis_mesomelas'; 
metaData.species_en = 'Black-backed jackal';

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 10 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 60;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 309;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 251;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 16.7*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 159;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 10.25e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'ADW: ';
  
data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 pups per litter, 1 litters per yr';
  
% uni-variate data
% time-length
data.tL_f = [ % time since birth (d), length (cm)
32.724	34.461
39.842	39.612
46.599	39.076
54.245	42.036
60.453	44.651
67.636	46.719
74.847	47.486
82.051	48.596
90.161	52.379
96.430	52.116
109.832	56.320
124.241	58.471
138.114	63.155
166.935	67.319
195.798	69.497
223.187	73.043
251.094	74.877
279.025	75.615]; 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'head-body length'};  
temp.tL_f  = C2K(38);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lomb1971';
comment.tL_f = 'Data for females';
%
data.tL_m = [ % time since birth (d), wet weight (g)
33.118	38.571
46.005	44.281
54.155	46.214
61.842	47.256
68.510	50.899
75.254	50.980
81.923	54.555
88.627	56.485
96.329	56.842
109.773	59.060
125.036	66.349
138.455	69.731
166.377	70.880
194.745	73.673
278.988	77.327]; 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'head-body length'};  
temp.tL_m  = C2K(38);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lomb1971';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ % time since birth (d), wet weight (g)
32.130	821.115
40.587	789.537
46.640	1226.041
53.651	1512.131
61.612	1698.016
68.141	2084.417
75.183	2102.731
81.706	2539.340
89.221	2524.288
93.892	2742.908
111.188	3416.241
123.781	4155.465
137.807	4677.438
166.391	5202.674
194.504	5744.540
221.211	6252.618
249.868	6158.623]; 
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'total weight', 'female'};  
temp.tWw_f  = C2K(38);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Lomb1971';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ % time since birth (d), wet weight (g)
33.476	1356.981
40.048	1375.191
46.585	1694.648
54.529	2031.156
60.600	2317.036
67.597	2720.278
74.621	2889.216
81.616	3309.194
89.135	3260.670
96.144	3563.497
109.669	4353.139
124.128	5193.200
138.625	5715.278
167.205	6273.986
194.376	6832.377
222.005	7491.290
249.733	7313.405]; 
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'total weight', 'male'};  
temp.tWw_m  = C2K(38);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Lomb1971';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; weights.psd.t_0 = 1; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plotsset1 = {'tL_f','tL_m'}; comment1 = {'Data for female, male'};
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'QLXN'; % Cat of Life
metaData.links.id_ITIS = '183818'; % ITIS
metaData.links.id_EoL = '328682'; % Ency of Life
metaData.links.id_Wiki = 'Canis_mesomelas'; % Wikipedia
metaData.links.id_ADW = 'Canis_mesomelas'; % ADW
metaData.links.id_Taxo = '167578'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000776'; % MSW3
metaData.links.id_AnAge = 'Canis_mesomelas'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Canis_mesomelas}}';
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
bibkey = 'Lomb1971'; type = 'article'; bib = [ ... 
'author = {L. J. Lombaard}, ' ... 
'year = {1971}, ' ...
'title = {Age determination and growth curves in the black-backed jackal, \emph{Canis mesomelas} {S}chreber, 1775 ({C}arnivora: {C}anidae)}, ' ...
'journal = {Annals of the Transvaal Museum}, ' ...
'volume = {27(7)}, '...
'pages = {135-181}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Canis_mesomelas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Canis_mesomelas/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

