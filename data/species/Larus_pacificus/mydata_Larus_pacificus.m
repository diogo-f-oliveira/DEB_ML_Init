function [data, auxData, metaData, txtData, weights] = mydata_Larus_pacificus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Larus_pacificus'; 
metaData.species_en = 'Pacific gull'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MIS', 'MPSW'};
metaData.ecoCode.habitat = {'0iMm', 'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCi', 'biSi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 10 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Widd2013';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '26 to 28 d. Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 57;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Widd2013';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 171;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on other Larus species';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Based on other Larus species in AnAge';

data.Wwb = 63; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Widd2013';
  comment.Wwb = 'egg weight: 84 to 92 g';
data.Wwi = 1500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Widd2013';
  comment.Wwi = 'asyumptotic weight of nestling, adult 900 to 1180 g (wiki)';

data.Ri  = 2.11/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Widd2013';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% titme-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.197	61.450
0.198	69.466
0.199	77.481
0.775	69.466
1.065	82.824
1.066	98.855
1.931	74.809
1.932	82.824
2.319	101.527
2.320	125.573
2.993	109.542
3.089	98.855
3.090	117.557
3.958	130.916
3.959	136.260
4.246	120.229
4.921	133.588
4.922	144.275
5.019	157.634
6.080	179.008
7.137	141.603
7.138	154.962
7.139	168.321
7.140	176.336
7.237	203.053
7.238	211.069
8.004	152.290
8.101	168.321
8.102	173.664
8.103	187.023
8.104	200.382
8.873	184.351
8.971	211.069
9.070	251.145
9.074	307.252
9.932	168.321
9.936	240.458
10.032	232.443
10.036	285.878
10.126	189.695
10.803	232.443
10.997	251.145
10.998	259.160
11.095	285.878
11.098	323.282
11.954	162.977
11.958	227.099
11.960	253.817
11.961	272.519
11.962	291.221
12.061	317.939
12.919	192.366
12.920	205.725
12.925	283.206
12.926	299.237
13.025	344.656
13.027	363.359
13.030	416.794
13.031	419.466
14.083	317.939
14.085	350.000
14.087	376.718
14.088	390.076
14.853	315.267
14.956	400.763
15.048	344.656
15.053	422.137
15.057	480.916
16.009	309.924
16.011	350.000
16.013	379.389
16.014	392.748
16.016	416.794
16.116	475.573
16.786	406.107
16.884	435.496
16.890	515.649
16.992	601.145
18.140	499.618
18.145	566.412
18.147	587.786
18.910	491.603
18.912	512.977
19.206	590.458
19.212	670.611
19.775	464.885
19.873	483.588
21.900	555.725
22.099	638.550
22.296	702.672
22.297	713.359
23.169	798.855
24.120	627.863
24.995	742.748
25.078	542.366
25.852	595.802
25.861	724.046
25.960	766.794
27.028	895.038
27.030	924.427
27.878	649.237
29.907	750.763
31.843	884.351
32.041	964.504
32.045	1023.282
32.985	694.656
35.022	895.038
39.373	1151.527
39.655	1041.985
40.909	1071.374
41.201	1116.794
43.034	1172.901
46.116	1172.901
55.078	1247.710
57.183	1047.328];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Widd2013';
  
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
D1 = 'males are assumed not to differ from females';
D2 = 'Feeding is slightly reduced towards end of nestling period';
D3 = 'Long tp cannot be captured by std model';
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6NZ3Y'; % Cat of Life
metaData.links.id_ITIS = '176861'; % ITIS
metaData.links.id_EoL = '1049316'; % Ency of Life
metaData.links.id_Wiki = 'Larus_pacificus'; % Wikipedia
metaData.links.id_ADW = 'Larus_pacificus'; % ADW
metaData.links.id_Taxo = '70317'; % Taxonomicon
metaData.links.id_WoRMS = '343917'; % WoRMS
metaData.links.id_avibase = 'C08157E78A294559'; % avibase
metaData.links.id_birdlife = 'pacific-gull-larus-pacificus'; % birdlife
metaData.links.id_AnAge = 'Larus_pacificus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Larus_dominicanus}}';
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
bibkey = 'Widd2013'; type = 'Article'; bib = [ ... 
'author = {Widdup, L.}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive success and chick growth of {P}acific Gulls \emph{Larus pacificus} in the {F}urneaux Group, {A}ustralia}, ' ...
'journal = {Marine Ornithology}, ' ...
'volume = {41}, ' ...
'pages = {187--194}'];
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

