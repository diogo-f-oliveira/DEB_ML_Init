function [data, auxData, metaData, txtData, weights] = mydata_Mycteria_americana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Ciconiiformes'; 
metaData.family     = 'Ciconiidae';
metaData.species    = 'Mycteria_americana'; 
metaData.species_en = 'Wood stork'; 

metaData.ecoCode.climate = {'Af','Cf'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 08 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 62;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Kahl1962';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 186;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'sexually matury in 3 mnth in captivity';
data.am = 27*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 80;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 62;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwi = 2115; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'avibase';
data.Wwim = 2640; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of males';       bibkey.Wwim = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'AnAge','avibase'};   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
tW = [ ... % age (d) weight (g)
0.000	65.306
0.688	65.306
1.434	73.469
2.554	106.122
3.798	138.776
4.670	171.429
5.666	212.245
6.912	269.388
7.786	334.694
8.905	359.184
9.902	416.327
10.899	465.306
12.021	530.612
12.894	587.755
13.893	669.388
14.765	702.041
15.766	824.490
16.766	922.449
17.892	1044.898
18.890	1118.367
19.763	1175.510
20.764	1281.633
21.890	1412.245
22.888	1477.551
23.883	1510.204
24.755	1551.020
25.752	1591.837
26.747	1608.163
28.740	1706.122
32.727	1885.714
34.718	1951.020
36.710	2016.327
38.826	2089.796
57.989	2612.245
62.827	2497.959];

% time-food intake
tJX = [ % time since birth (d), food intake (g/d)
1.116	28.741
2.515	41.598
3.317	62.415
4.120	85.217
5.125	116.946
6.127	137.756
7.029	158.570
8.235	197.240
9.035	208.132
9.932	211.080
10.831	217.005
12.125	212.000
13.023	216.933
14.227	246.670
15.230	270.458
16.035	301.200
17.031	302.160
17.828	297.171
19.021	286.213
20.129	334.812
21.035	369.521
22.139	401.246
23.025	357.545
24.212	319.788
25.201	289.979
26.211	341.558
27.204	329.615
27.909	356.391
28.995	314.667
30.001	353.344
31.399	363.223
32.009	413.823
33.302	400.877
34.303	420.695
35.289	375.997
36.286	377.950
37.274	344.170
38.162	306.424
39.170	351.055
40.067	352.018
40.964	350.996
42.152	321.180
43.453	341.980
44.362	390.586
45.255	373.683
46.437	318.060
47.225	279.325
48.412	243.553
49.211	249.482
50.003	229.605
51.299	227.577
52.190	205.711
53.491	227.504
54.292	242.366
55.289	242.333
56.576	208.544
57.567	183.697
58.360	168.783
59.557	171.721
60.549	152.829];    
data.tWJX = merge(tW, tJX);
units.tWJX   = {'d', 'g', 'g/d'};  label.tWJX = {'time since birth', 'wet weight', 'food intake'};  
temp.tWJX    = C2K(40.5);  units.temp.tWJX = 'K'; label.temp.tWJX = 'temperature';
bibkey.tWJX = 'Kahl1962'; treat.tWJX = {1, {'Ww','J_X'}};
comment.tWJX = 'food mainly consists of fish, which vary in length from 20 to 250 mm';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tWJX = weights.tWJX * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response varies';
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'tW data is inconsistent with tJX data after day 30; additional food intake must have occured';
D5 = 'mod_1: v is reduced';
D6 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Links
metaData.links.id_CoL = '44ZJ8'; % Cat of Life
metaData.links.id_ITIS = '174897'; % ITIS
metaData.links.id_EoL = '45511325'; % Ency of Life
metaData.links.id_Wiki = 'Mycteria_americana'; % Wikipedia
metaData.links.id_ADW = 'Mycteria_americana'; % ADW
metaData.links.id_Taxo = '51882'; % Taxonomicon
metaData.links.id_WoRMS = '159150'; % WoRMS
metaData.links.id_avibase = '19196211B7630B88'; % avibase
metaData.links.id_birdlife = 'wood-stork-mycteria-americana'; % birdlife
metaData.links.id_AnAge = 'Mycteria_americana'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteria_americana}}';
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
bibkey = 'Kahl1962'; type = 'Article'; bib = [ ... 
'author = {M. Philip Kahl}, ' ... 
'year = {1994}, ' ...
'title = {Bioenergetics of Growth in Nestling Wood Storks}, ' ...
'journal = {The Condor}, ' ...
'volume = {64(3)}, ' ...
'pages = {169-183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=19196211B7630B88&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mycteria_americana}}';
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

