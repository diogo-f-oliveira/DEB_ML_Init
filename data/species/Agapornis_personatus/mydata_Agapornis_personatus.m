function [data, auxData, metaData, txtData, weights] = mydata_Agapornis_personatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittaculidae';
metaData.species    = 'Agapornis_personatus'; 
metaData.species_en = 'Yellow-collared lovebird'; 

metaData.ecoCode.climate = {'Aw','BWh','BSh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'; 't-JOe'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 23;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 44.3;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 132.9;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 34.1*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Agapornis roseicollis';

data.Ww0 = 3.95;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'Buch1983';
data.Wwb = 2.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Buch1983';
data.Wwi = 56; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 5.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.111	2.193
0.499	1.894
0.610	2.990
0.942	2.691
1.220	3.090
1.441	2.990
1.774	3.488
2.439	5.282
2.993	5.482
3.492	7.575
3.603	6.379
4.157	7.375
4.545	8.173
4.767	8.870
4.989	7.575
5.598	10.166
5.599	8.272
5.820	10.764
6.596	11.960
6.818	10.565
7.206	11.561
7.927	12.957
8.758	14.053
9.035	13.754
9.701	14.651
9.978	17.741
10.089	22.625
10.643	16.844
10.754	19.834
11.031	23.322
11.308	17.342
11.530	16.844
11.863	25.316
12.748	29.900
12.749	24.917
13.027	27.608
13.415	22.027
14.191	30.100
14.634	24.917
14.967	34.585
15.022	31.296
15.521	33.389
15.965	35.482
17.018	34.485
17.517	33.688
19.013	39.169
19.900	41.262
21.009	41.761
21.951	40.963
22.007	46.844
23.060	45.648
23.061	46.445
23.448	43.256
23.891	47.641
24.446	42.458
25.000	52.824
25.499	43.953
26.441	52.824
27.550	46.844
28.714	45.050
29.878	41.960
30.820	44.452
30.931	51.329
31.929	53.123
33.093	49.635
39.246	43.654
40.854	42.757];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Buch1983';
  
% time - embryo weight
data.tWe = [ ...
8.614	0.128
10.529	0.232
11.574	0.538
11.696	0.387
12.652	0.381
16.453	1.219
17.451	1.190
17.660	1.242
17.662	1.341
18.622	1.520
18.663	1.479
19.415	1.682
19.583	1.751
19.797	2.029
20.032	1.333
20.382	2.174
20.802	2.382
20.954	1.692
21.175	2.307
21.717	2.399];
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'embryo wet weight'};  
temp.tWe    = C2K(41.3);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'Buch1983';

% time - O2 consumption of embryo
data.tJOe = [ ...
4.779	3.671
4.978	2.307
5.796	2.916
7.438	5.259
7.752	7.257
7.898	5.448
7.905	7.245
8.667	6.511
9.896	7.538
9.901	8.886
10.473	11.762
10.511	8.388
10.980	10.823
11.015	6.776
11.602	13.471
11.656	14.366
11.898	10.751
11.902	11.874
12.478	15.874
12.684	16.307
12.877	13.371
13.306	18.730
13.452	16.921
13.568	20.507
13.803	15.320
13.816	18.690
13.918	18.682
14.012	16.652
14.229	20.006
14.535	19.982
14.641	21.097
14.681	18.173
14.861	25.125
14.933	17.254
15.042	19.043
15.051	21.514
15.518	23.500
15.562	21.699
15.668	22.814
15.681	26.184
15.700	31.126
15.914	20.323
15.919	21.671
16.449	26.798
16.496	25.895
16.520	31.961
16.559	28.812
16.580	34.428
16.586	22.742
16.592	24.315
16.803	26.096
16.819	30.139
16.900	24.740
17.490	32.109
17.532	29.859
17.546	33.453
17.682	28.948
17.705	35.014
17.711	36.586
17.727	27.371
17.739	30.517
17.802	33.658
17.982	27.576
18.418	34.733
18.562	32.250
18.591	39.888
18.617	33.369
18.688	38.532
18.698	41.228
18.831	36.049
19.165	29.955
19.270	44.104
19.279	46.350
19.542	35.094
19.609	39.358
19.684	32.161
19.697	35.531
19.910	37.986
19.985	44.272
20.177	41.111
20.541	42.880
20.556	46.924
20.570	50.519
20.635	40.850
20.652	45.344
20.866	47.799
21.352	68.210
21.393	65.510
21.471	45.953
21.555	41.228
21.617	70.661
21.639	49.760
21.651	52.905
21.670	57.848
21.761	68.402
21.911	54.233
21.989	61.193
22.004	78.496
22.397	61.161
22.431	83.406
22.597	46.764
22.630	82.042
22.687	70.352
22.843	84.497
22.876	79.775];
units.tJOe   = {'d', 'ml/d'};  label.tJOe = {'age', 'O2 consumption'};  
temp.tJOe    = C2K(41.3);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'Buch1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tWe = weights.tWe * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '65MFM'; % Cat of Life
metaData.links.id_ITIS = '554886'; % ITIS
metaData.links.id_EoL = '45510816'; % Ency of Life
metaData.links.id_Wiki = 'Agapornis_personatus'; % Wikipedia
metaData.links.id_ADW = 'Agapornis_personatus'; % ADW
metaData.links.id_Taxo = '107749'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4396F4F1345FBE2C'; % avibase
metaData.links.id_birdlife = 'yellow-collared-lovebird-agapornis-personatus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Agapornis_personatus}}';
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
bibkey = 'Buch1983'; type = 'Article'; bib = [ ... 
'doi = {10.1086/physzool.56.3.30152612}, ' ...
'author = {Bucher, T. L.}, ' ... 
'year = {1983}, ' ...
'title = {Parrot Eggs, Embryos, and Nestlings: {P}atterns and Energetics of Growth and Development}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {56(3)}, ' ...
'pages = {465–483}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4396F4F1345FBE2C&sec=lifehistory}}';
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

