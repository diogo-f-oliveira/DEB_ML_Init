function [data, auxData, metaData, txtData, weights] = mydata_Enicognathus_ferrugineus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Enicognathus_ferrugineus'; 
metaData.species_en = 'Austral parakeet'; 

metaData.ecoCode.climate = {'Csb','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JOe'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 27.2;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 54;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Buch1983';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 162;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15.2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 10.46;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'Buch1983';
data.Wwb = 9.77;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Buch1983';
data.Wwi = 166.95; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 5.7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.182	6.558
3.131	12.370
3.934	10.179
3.936	15.280
4.025	14.186
5.187	16.730
7.156	26.191
8.047	22.907
8.051	30.923
8.054	36.024
8.858	39.298
8.859	39.298
8.949	41.484
9.933	44.029
11.008	53.132
11.010	55.318
11.908	66.243
11.994	59.684
12.977	62.593
12.979	66.601
13.875	71.333
14.141	69.145
14.145	75.339
15.043	87.358
15.219	80.798
16.028	93.911
16.029	95.368
16.921	93.541
16.924	99.007
17.015	101.921
17.905	95.721
17.997	102.279
17.999	105.194
18.890	102.274
18.893	108.833
19.164	114.297
19.964	107.733
19.967	112.470
19.972	123.037
21.040	116.471
21.136	130.317
22.117	128.125
22.119	132.133
23.103	136.135
23.189	128.118
24.086	137.222
24.268	144.508
25.162	146.325
25.257	157.984
26.148	155.064
27.044	159.795
27.127	148.135
28.206	162.339
29.098	161.969
29.104	173.265
29.191	168.892
30.083	167.793
30.085	171.072
30.809	191.837
31.067	170.338
32.226	167.051
32.944	174.334
33.213	176.883
34.103	171.412
34.909	177.237
35.005	190.354
36.072	180.510
37.320	177.587
39.196	179.033
39.469	189.963
39.998	175.749
40.089	179.028
40.090	181.943
40.274	192.508
41.070	177.564
41.336	172.826
42.137	169.177
42.855	175.367
43.932	187.021
44.019	181.919
44.284	177.545
45.354	174.623
46.067	170.247
46.073	183.364
47.057	186.273
47.144	182.993
47.942	170.235
48.028	165.133
49.102	169.864
50.172	166.214
51.159	177.139
54.182	150.886
54.986	152.703
56.056	148.324
59.984	148.664
60.161	144.291
61.237	154.486
64.091	147.546
64.894	145.355
65.074	148.269
65.164	150.454
66.410	143.524
66.414	149.718];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Buch1983';
  
% time - O2 consumption of embryo
data.tJOe = [ ...
1.422	1.715
3.517	3.417
3.609	0.807
4.486	1.226
5.265	2.082
5.752	2.509
6.535	5.104
6.637	7.711
7.462	6.827
8.287	5.943
8.401	15.506
9.321	12.882
9.506	7.661
9.657	10.702
10.388	11.559
10.631	11.120
11.514	15.452
11.527	23.278
12.201	18.918
12.407	25.871
12.441	17.175
13.376	23.681
13.542	35.417
13.710	19.762
14.348	23.229
14.404	27.576
14.436	17.575
15.337	32.777
15.344	36.690
15.737	38.857
16.494	55.365
16.519	41.452
16.574	45.364
17.309	48.395
17.313	50.569
17.469	27.957
17.497	44.478
17.925	67.514
18.306	62.290
18.345	57.072
18.630	52.720
19.373	60.968
19.561	56.616
19.586	71.833
19.616	60.529
19.673	65.745
20.209	66.170
20.262	68.778
20.561	72.686
20.667	77.902
20.848	98.768
20.867	80.942
21.440	74.845
21.502	111.365
21.697	83.101
21.705	87.884
21.738	78.753
22.414	75.697
22.448	95.697
22.520	109.174
22.661	135.258
22.765	138.735
22.780	90.474
22.903	77.428
23.540	108.286
23.625	72.633
23.648	172.198
23.725	131.761
23.966	244.801
24.397	97.837
24.586	123.051
24.651	132.615
24.685	152.614
24.765	199.569
24.784	96.526
24.969	119.566
25.470	128.253
25.598	203.033
25.749	92.161
25.754	180.857
26.554	107.364
26.600	163.016
26.767	118.665
26.931	186.054
27.623	192.563
27.973	198.209
28.529	153.417];
units.tJOe   = {'d', 'ml/d'};  label.tJOe = {'age', 'O2 consumption'};  
temp.tJOe    = C2K(41.3);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'Buch1983';

%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = weights.Ww0 * 0;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6F9ZK'; % Cat of Life
metaData.links.id_ITIS = '177720'; % ITIS
metaData.links.id_EoL = '1178006'; % Ency of Life
metaData.links.id_Wiki = 'Enicognathus_ferrugineus'; % Wikipedia
metaData.links.id_ADW = 'Enicognathus_ferrugineus'; % ADW
metaData.links.id_Taxo = '70736'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '7A8B7C274883A485'; % avibase
metaData.links.id_birdlife = 'austral-parakeet-enicognathus-ferrugineus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Enicognathus_ferrugineus}}';
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
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=7A8B7C274883A485&sec=lifehistory}}';
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

