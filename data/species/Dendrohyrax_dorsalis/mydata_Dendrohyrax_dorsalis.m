function [data, auxData, metaData, txtData, weights] = mydata_Dendrohyrax_dorsalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Hyracoidea'; 
metaData.family     = 'Procaviidae';
metaData.species    = 'Dendrohyrax_dorsalis'; 
metaData.species_en = 'Western tree hyrax'; 

metaData.ecoCode.climate = {'Aw','Af'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 05]; 

%% set data
% zero-variate data

data.tg = 7*30.5;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(36.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '6.5-7.5 mnths';
data.tx = 3.2*30.5;units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 16*30.5; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(36.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Procavia capensis';

data.Wwb = 367;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Jone1978';
data.Wwi = 5000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 1.5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_1 = [ ... % time since birth (d), wet weight (g)
4.519	420.912
4.801	429.819
4.801	409.056
5.649	432.813
7.061	441.758
8.473	456.635
9.603	459.638
10.167	462.623
12.144	462.688
12.427	483.460
14.121	483.516
15.533	483.563
15.533	471.698
17.228	477.686
17.228	462.856
18.640	486.631
20.052	489.644
20.335	454.060
20.617	501.527
21.464	507.487
22.877	516.432
23.724	513.494
25.701	531.355
27.113	534.368
27.960	555.159
29.090	555.196
30.502	552.276
31.349	570.101
33.326	558.302
35.586	614.732
36.715	602.905
37.845	638.535
38.128	650.409
38.410	611.859
39.822	605.973
41.234	644.579
42.646	665.388
42.929	709.889
44.906	698.090
46.883	715.952
48.295	686.337
48.577	710.075
50.554	710.141
51.684	707.212
51.967	772.475
52.814	757.673
53.661	745.836
54.791	757.738
55.356	793.350
56.485	817.116
57.615	811.221
58.745	781.597
60.157	820.203
60.439	787.585
61.569	805.419
62.699	805.456
64.393	838.139
64.958	841.124
65.523	817.414
66.088	826.331
67.500	885.699
68.347	894.625
69.195	924.314
70.042	948.071
71.172	951.074
72.584	936.290
73.713	924.463
74.561	960.084
75.690	954.189
77.950	983.925
77.950	972.060
79.079	995.826
81.056	998.858
81.056	966.231
81.621	1001.842
82.469	1037.464
85.858	1085.033
85.858	1055.372
89.812	1061.434
91.506	1034.795
93.766	1067.497
94.895	1079.399
96.025	1079.436
96.590	1115.048
98.285	1115.103
98.849	1126.987
100.262	1109.236
100.544	1162.636
102.803	1147.880
103.933	1147.917
105.628	1180.600
106.475	1121.306
107.887	1153.979
113.818	1160.107
120.879	1258.221
125.680	1270.244
127.939	1288.115
131.046	1243.726
134.435	1285.363
135.565	1264.637
136.695	1270.607
142.343	1282.657
210.973	1631.953
227.918	1629.545
247.123	1728.060];
units.tW_1  = {'d', 'g'};  label.tW_1 = {'time since birth', 'wet weight', 'Jone1978'};  
temp.tW_1   = C2K(36.9);  units.temp.tW_1 = 'K'; label.temp.tW_1 = 'temperature';
bibkey.tW_1 = 'Jone1978';
%
data.tW_2 = [ ... % time since birth (d), wet weight (g)
0.847	367.401
3.389	373.417
4.519	394.217
5.649	423.915
6.213	394.273
8.473	424.008
11.579	435.975
12.427	471.596
14.686	447.942
16.098	483.581
20.052	459.983
26.266	685.611
27.113	694.538
28.525	685.686
28.808	739.085
30.502	733.209
35.303	816.418
37.563	822.424
39.822	825.465
40.669	816.595
42.364	816.650
51.967	864.424
57.615	983.255
58.462	1007.011
60.157	971.474
60.439	1048.602
61.851	1078.310
70.042	1054.851
75.408	1152.909
80.774	1173.848
93.483	1346.301
118.619	1708.994];
units.tW_2  = {'d', 'g'};  label.tW_2 = {'time since birth', 'wet weight', 'Four1983'};  
temp.tW_2   = C2K(36.9);  units.temp.tW_2 = 'K'; label.temp.tW_2 = 'temperature';
bibkey.tW_2 = 'Four1983';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_1','tW_2'}; subtitle1 = {'Data for 2 individuals'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '34Q9Y'; % Cat of Life
metaData.links.id_ITIS = '584907'; % ITIS
metaData.links.id_EoL = '326382'; % Ency of Life
metaData.links.id_Wiki = 'Dendrohyrax_dorsalis'; % Wikipedia
metaData.links.id_ADW = 'Dendrohyrax_dorsalis'; % ADW
metaData.links.id_Taxo = '69196'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11400005'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendrohyrax_dorsalis}}';
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
bibkey = 'Jone1978'; type = 'Article'; bib = [ ... 
'author = {Clyde Jones}, ' ... 
'year = {1978}, ' ...
'title = {Dendrohyrax dorsalis}, ' ...
'journal = {Msmmalian Species}, ' ...
'volume = {113}, ' ...
'pages = {1-4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Dendrohyrax_dorsalis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

