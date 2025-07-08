function [data, auxData, metaData, txtData, weights] = mydata_Cryptoprocta_ferox

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Eupleridae';
metaData.species    = 'Cryptoprocta_ferox'; 
metaData.species_en = 'Fossa'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Aw', 'As'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf', '0iTf', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 90;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 129;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1496 ;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 23.1*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 230;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Albi1975';
data.Wwi = 8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki:  5.5 and 8.6 kg';
data.Wwim = 11e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';    bibkey.Wwim = 'ADW';
  comment.Wwim = 'based on upper end weight range, given  7 till 12 kg and males larger than females';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter, 1 litter per yr';
 
% uni-variate data
% time-weight 
data.tW_f = [ ... % time since birth (d), body weight (g)
 0.946	237.744
30.877	477.586
61.712	699.888
93.468	1010.284
122.479	1170.834
153.334	1507.573
183.287	1861.853
212.337	2233.673
244.126	2728.931
274.957	2933.626
304.030	3428.687
363.868	3767.524
407.433	4272.436];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(37.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Albi1975';
comment.tW_f = 'Data for female';
%
data.tW_f1 = [ ... % time since birth (d), body weight (g)
 0.064	246.417
32.686	460.112
62.611	664.741
91.645	948.532
123.379	1135.687
152.410	1401.872
183.242	1615.371
214.116	2057.745
242.270	2482.317
272.205	2739.765
303.985	3182.205
364.738	3573.925
410.133	4175.801];
units.tW_f1 = {'d', 'g'};  label.tW_f1 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f1  = C2K(37.9);  units.temp.tW_f1 = 'K'; label.temp.tW_f1 = 'temperature';
bibkey.tW_f1 = 'Albi1975';
comment.tW_f1 = 'Data for female';
%
data.tW_m = [ ... % time since birth (d), body weight (g)
0.046	272.891
29.980	521.535
58.999	726.100
91.667	1071.773
120.685	1267.535
153.347	1577.996
182.396	1941.014
212.361	2365.717
244.138	2790.551
273.232	3408.853
302.346	4132.791
335.004	4425.647
364.043	4735.846
388.557	5063.324];
units.tW_m = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(37.9);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Albi1975';
comment.tW_m = 'Data for male';
%
data.tW_m1 = [ ... % time since birth (d), body weight (g)
 0.071	211.205
31.772	416.031
59.887	629.333
88.912	860.307
120.646	1047.462
150.569	1243.289
181.401	1447.984
214.966	1749.708
245.823	2095.251
271.279	2625.261
303.016	2830.022
334.757	3061.192
364.671	3204.202
418.276	4132.376];
units.tW_m1 = {'d', 'g'};  label.tW_m1 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m1  = C2K(37.9);  units.temp.tW_m1 = 'K'; label.temp.tW_m1 = 'temperature';
bibkey.tW_m1 = 'Albi1975';
comment.tW_m1 = 'Data for male';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_f1','tW_m','tW_m1'}; subtitle1 = {'Data for female (2x), male (2x)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'ZZ3R'; % Cat of Life
metaData.links.id_ITIS = '621973'; % ITIS
metaData.links.id_EoL = '347438'; % Ency of Life
metaData.links.id_Wiki = 'Cryptoprocta_ferox'; % Wikipedia
metaData.links.id_ADW = 'Cryptoprocta_ferox'; % ADW
metaData.links.id_Taxo = '66938'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000446'; % MSW3
metaData.links.id_AnAge = 'Cryptoprocta_ferox'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cryptoprocta_ferox}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cryptoprocta_ferox/}}';
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
bibkey = 'Albi1975'; type = 'Article'; bib = [ ... 
'author = {Albignac, R.}, ' ... 
'doi = {10.1111/j.1748-1090.1975.tb01381.x}, ' ...
'year = {1975}, ' ...
'title = {Breeding the fossa at {M}ontpellier {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {15}, ' ...
'pages = {147-150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cryptoprocta_ferox}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

