function [data, auxData, metaData, txtData, weights] = mydata_Geronticus_eremita
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Threskiornithidae';
metaData.species    = 'Geronticus_eremita'; 
metaData.species_en = 'Northern bald ibis'; 

metaData.ecoCode.climate = {'BWh', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTs', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 24.5;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'TintKotr2002';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 45;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'TintKotr2002';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 135;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'Wiki';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '3 till 5 yrs';
data.am = 32.9*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 37;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'TintKotr2002';
data.Wwi = 1202;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 4 eggs per clutch';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.466	37.293
1.602	49.724
2.537	49.724
3.673	66.298
4.408	66.298
4.673	103.591
5.340	136.740
5.610	87.017
6.475	157.459
6.610	132.597
7.478	161.602
7.543	194.752
8.344	219.613
8.479	186.464
9.344	265.193
9.346	232.044
10.346	281.768
10.411	331.492
11.346	331.492
11.611	377.072
12.279	381.215
12.478	430.939
13.346	439.227
13.478	480.663
14.479	501.381
14.744	555.249
15.345	563.536
15.411	592.541
16.478	646.409
16.544	662.983
17.277	716.851
17.545	683.702
18.544	774.862
18.611	758.287
19.410	837.017
19.411	812.155
20.544	886.740
20.545	861.879
21.478	924.033
21.479	886.740
22.613	944.751
22.614	915.746
23.412	998.619
23.415	948.895
24.346	1044.199
24.349	986.188
25.280	1073.204
25.282	1031.768
26.483	1077.348
26.818	1064.917
27.351	1085.635
27.352	1064.917
28.351	1143.646
28.353	1093.923
29.287	1135.359
29.352	1176.796
30.088	1151.934
30.354	1193.370
31.157	1176.796
31.422	1222.376
32.425	1201.657
32.426	1189.227
33.293	1214.088
33.295	1180.939
34.297	1189.227
34.298	1185.083
35.500	1197.514
35.501	1193.370
36.301	1214.088
36.302	1209.945
37.236	1214.088
37.371	1197.514
38.507	1201.657
38.508	1189.227
39.644	1176.796
39.776	1201.657
40.311	1193.370
40.312	1185.083
41.115	1164.365
41.382	1164.365
42.117	1164.365
42.385	1160.221
43.520	1164.365
43.521	1160.221
44.255	1172.652
44.389	1168.508
45.258	1168.508
45.259	1160.221
46.461	1156.077
46.462	1131.215
47.531	1135.359
47.533	1110.497
48.199	1160.221
48.200	1122.928
49.402	1160.221
49.403	1122.928
50.404	1168.508
50.405	1135.359
51.472	1193.370
51.608	1143.646
52.407	1197.514
52.409	1147.790
53.142	1201.657
53.144	1164.365
54.146	1164.365
54.212	1193.370];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'TintKotr2002';
comment.tW = 'Data for single raised';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'scaled functional response turned out to vary, which has been implemented';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Males are generally larger than females';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Group-raised individuals grew faster, but to the same ultimate wieght';
metaData.bibkey.F2 = 'TintKotr2002'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3FWY9'; % Cat of Life
metaData.links.id_ITIS = '174953'; % ITIS
metaData.links.id_EoL = '45513839'; % Ency of Life
metaData.links.id_Wiki = 'Geronticus_eremita'; % Wikipedia
metaData.links.id_ADW = 'Geronticus_eremita'; % ADW
metaData.links.id_Taxo = '51905'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B20FECE2231097F4'; % avibase
metaData.links.id_birdlife = 'northern-bald-ibis-geronticus-eremita'; % birdlife
metaData.links.id_AnAge = 'Geronticus_eremita'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geronticus_eremita}}';
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
bibkey = 'TintKotr2002'; type = 'Article'; bib = [ ... 
'author = {A. Tintner and K. Kotrschal}, ' ... 
'year = {2002}, ' ...
'title = {Early Social Influence on Nestling Development in Waldrapp ibis (\emph{Geronticus eremita)}}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {21}, ' ...
'pages = {467--480}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Geronticus_eremita}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

