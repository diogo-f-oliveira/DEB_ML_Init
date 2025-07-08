function [data, auxData, metaData, txtData, weights] = mydata_Necrosyrtes_monachus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Necrosyrtes_monachus'; 
metaData.species_en = 'Hooded vulture'; 

metaData.ecoCode.climate = {'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTg', '0iTht'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 49;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'MundCook1975';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 110;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MundCook1975';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '70 to 85 d';
data.tp = 330;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '70 to 85 d';
data.tR = 4*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 37*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 80;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MundCook1975';
  comment.Wwb = 'egg weight: 220 g';
data.Wwi = 2500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = ' 1.5 to 2.6 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MundCook1975';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
3.231	101.079
4.717	114.350
4.720	95.715
5.922	191.523
6.064	154.248
6.068	130.288
6.071	111.652
7.143	175.517
7.282	151.553
7.675	226.085
8.369	127.564
9.592	92.923
10.505	295.228
12.267	281.870
16.048	327.027
17.127	345.634
18.739	414.809
19.385	595.823
19.544	457.383
19.845	281.668
20.395	225.747
21.963	558.484
22.005	310.895
23.993	558.429
24.637	750.093
24.639	736.782
24.648	686.199
24.937	574.378
26.808	712.764
27.207	755.349
27.337	787.292
28.165	694.092
29.232	781.917
29.825	475.745
30.171	829.812
30.296	891.040
31.519	864.386
31.533	781.856
31.928	843.077
32.331	864.364
32.781	600.791
33.255	997.451
33.548	864.332
36.249	896.206
36.526	861.590
38.121	1029.268
38.126	1002.645
38.148	872.196
38.152	850.898
41.117	920.037
41.796	906.708
42.982	1095.694
45.123	1234.073
45.443	946.544
46.182	1372.481
47.972	1194.064
48.128	1071.597
49.430	1369.732
50.287	1106.149
51.231	1124.759
51.788	1034.229
55.073	813.176
55.406	1244.448
56.546	1702.321
57.389	1521.267
59.051	1292.271
60.790	1412.025
61.192	1435.975
61.954	1731.462
62.184	1172.388
64.280	1576.991
65.204	1715.402
68.483	1528.959
68.896	1491.677
70.377	1531.571
71.341	1435.705
71.444	1624.720
74.059	1366.414
76.844	1701.781
77.019	1464.838
81.055	1605.829
81.356	1424.789
83.487	1629.724
84.037	1573.803
86.078	1509.855
86.653	1312.834
91.356	1504.390
91.369	1429.847
93.271	1381.876
94.511	1251.394
94.898	1363.197
97.073	1304.570
97.851	1509.541
99.805	1152.750
101.102	1488.157
102.203	1376.314
108.831	1392.111
109.379	1354.825
109.501	1434.689];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MundCook1975';
  
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
D1 = 'Body temperature guessed';
D2 = 'Relative food intake reduced just before fledging';     
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6RVGD'; % Cat of Life
metaData.links.id_ITIS = '561476'; % ITIS
metaData.links.id_EoL = '45515793'; % Ency of Life
metaData.links.id_Wiki = 'Necrosyrtes_monachus'; % Wikipedia
metaData.links.id_ADW = 'Necrosyrtes_monachus'; % ADW
metaData.links.id_Taxo = '52473'; % Taxonomicon
metaData.links.id_WoRMS = '1459954'; % WoRMS
metaData.links.id_avibase = '131038ADDA3373B0'; % avibase
metaData.links.id_birdlife = 'hooded-vulture-necrosyrtes-monachus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Necrosyrtes_monachus}}';
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
bibkey = 'MundCook1975'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1975.9639381}, ' ...
'author = {P. J. Mundy and A. W. Cook}, ' ... 
'year = {1975}, ' ...
'title = {HATCHING AND REARING OF TWO CHICKS BY THE HOODED VULTURE}, ' ...
'journal = {Ostrich}, ' ...
'volume = {46}, ' ...
'pages = {45--50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.arkive.org/white-backed-vulture/necrosyrtes-monachus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1048942/details}}';
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

