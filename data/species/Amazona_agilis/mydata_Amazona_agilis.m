function [data, auxData, metaData, txtData, weights] = mydata_Amazona_agilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Amazona_agilis'; 
metaData.species_en = 'Black-billed amazon'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'CollBoes2020';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '26 till 28 d';
data.tx = 56;    units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'CollBoes2020';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 168;    units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 49*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 14;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Koen2001';
data.Wwi = 212.25;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'avibase';
  comment.Wwi = 'CollBoes2020: 178–220 g';

data.Ri = 2.9/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.9 eggs/clutch; breeds once per 1 yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.275	15.075
1.527	10.469
2.206	15.075
2.291	18.844
2.292	21.776
3.307	17.588
3.392	21.357
3.394	25.544
4.243	33.082
4.577	19.682
4.578	23.451
4.579	27.219
4.840	48.157
5.089	33.082
5.090	36.432
5.342	29.313
5.346	42.714
6.109	45.226
6.698	35.595
7.206	38.526
7.208	42.295
7.209	45.226
7.210	49.832
7.212	54.858
8.145	60.720
8.146	65.327
8.308	42.295
8.394	46.064
8.475	36.013
8.479	49.414
8.481	54.858
9.410	48.995
9.417	68.677
9.501	66.583
9.503	72.027
9.577	41.457
10.267	81.240
10.427	54.020
10.602	69.933
11.366	76.214
11.369	85.846
11.464	117.253
11.531	63.233
12.043	76.633
12.216	88.358
13.151	98.409
13.152	101.759
13.238	106.784
13.318	92.546
13.324	111.809
13.734	73.283
14.173	120.184
14.248	90.871
14.510	113.484
14.590	100.084
14.676	104.271
14.937	125.209
15.257	70.771
15.271	111.809
15.347	88.358
15.358	118.509
15.438	106.365
15.604	97.571
16.287	114.740
16.291	126.884
16.624	108.878
16.972	137.772
16.973	141.541
17.228	145.310
17.399	149.916
17.642	116.834
17.645	126.884
18.581	142.379
19.417	111.390
19.431	151.173
19.514	146.985
19.682	144.472
20.192	151.591
20.366	163.735
20.711	183.417
22.146	171.273
22.393	153.685
22.479	156.198
22.480	160.385
22.561	147.822
22.566	162.898
22.651	163.735
23.080	180.486
23.401	128.978
23.416	173.786
23.488	137.772
24.182	186.348
24.258	162.898
24.422	144.891
24.517	176.298
25.187	154.941
26.126	180.067
26.302	198.911
26.456	154.104
27.308	172.111
27.312	184.255
27.565	180.067
28.487	156.198
28.498	187.605
29.179	199.330
29.185	215.662
29.515	192.211
30.200	213.987
30.448	199.330
30.531	192.630
31.205	184.255
31.373	179.229
31.534	157.454
32.227	204.774
33.316	170.854
33.494	197.655
33.497	204.774
33.914	186.348
34.001	193.886
34.339	191.374
35.358	202.680
35.518	175.461
35.600	168.342
36.130	232.412
36.200	189.280
36.293	216.499
36.295	221.943
36.367	183.417
36.543	202.680
37.302	195.980
37.629	161.223
38.413	226.968
39.506	206.449
40.083	160.804
40.343	180.905
40.365	244.137
40.527	222.362
41.698	183.836
41.871	192.211
42.304	222.781
42.561	231.575
43.314	206.868
44.424	234.925
45.417	169.598
45.430	206.449
45.509	191.374
46.189	198.492
46.365	219.430
46.431	164.154
46.519	175.042
47.443	154.941
47.530	162.060
47.621	179.229
47.712	198.074
48.052	203.518
48.457	149.079
48.465	174.623
48.544	155.360
48.562	210.637
48.800	162.060
49.140	168.760
49.228	177.554
49.474	155.360
50.411	170.854
50.493	163.735
51.349	192.211
51.429	178.811
51.511	170.436
51.526	216.080
51.676	158.710
52.532	188.861
53.716	185.092
54.569	206.449
55.323	182.161
56.340	187.186
57.432	162.898
58.450	170.436];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Koen2001';
  
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
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Female breeds, both parents feed young; nest in tree cavities';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '65ZS8'; % Cat of Life
metaData.links.id_ITIS = '177784'; % ITIS
metaData.links.id_EoL = '1178049'; % Ency of Life
metaData.links.id_Wiki = 'Amazona_agilis'; % Wikipedia
metaData.links.id_ADW = 'Amazona_agilis'; % ADW
metaData.links.id_Taxo = '70812'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'EE6765946463859C'; % avibase
metaData.links.id_birdlife = 'black-billed-amazon-amazona-agilis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amazona_agilis}}';
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
bibkey = 'Koen2001'; type = 'Article'; bib = [ ... 
'author = {Susan E. Koenig}, ' ... 
'year = {2001}, ' ...
'title = {The breeding biology of Black-billed Parrot \emph{Amazona agilis} and Yellow-billed Parrot \emph{Amazona collaria} in {C}ockpit {C}ountry, {J}amaica} , ' ...
'journal = {Bird Conservation International}, ' ...
'volume = {11}, ' ...
'pages = {205–225}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4B268FD25510C6CB&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CollBoes2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.blbpar1.01}, ' ...
'author = {Collar, N. and P. F. D. Boesman}, ' ...
'year = {2020}, ' ...
'title = {Black-billed Parrot (\emph{Amazona agilis}), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
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

