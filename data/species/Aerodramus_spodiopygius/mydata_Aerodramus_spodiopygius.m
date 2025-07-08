function [data, auxData, metaData, txtData, weights] = mydata_Aerodramus_spodiopygius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Apodidae';
metaData.species    = 'Aerodramus_spodiopygius'; 
metaData.species_en = 'White-rumped swiftlet'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2018 10 11];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 18];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 23;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Aerodramus_fuciphagus';
data.tx = 47;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Tarb1987';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 141;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 7702;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Apus apus';
  
data.Wwb = 1.1;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Tarb1987';
data.Wwi = 11.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Tarb1987';
  comment.Wwi = 'asymptotic weight of nestling, adult weight 8.2 g';

data.Ri  = 3.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 or 2 clutches per yr; guess based on Aerodramus_fuciphagus';
 
% uni-variate data
% time-weight
data.tW = [ ...  % weight (g) at age (d)
0.555	1.128
1.967	1.256
3.018	1.687
4.021	1.903
4.979	2.191
5.984	2.622
7.037	3.251
7.996	3.699
9.135	3.845
10.188	4.491
11.194	5.065
12.109	5.514
13.114	6.017
14.121	6.662
15.215	6.879
16.222	7.507
17.181	7.867
18.184	7.994
19.141	8.210
20.188	8.212
21.191	8.393
22.242	8.878
23.197	8.879
24.245	9.024
25.204	9.330
26.196	8.384
27.199	8.583
28.204	8.960
29.206	9.016
30.068	8.803
31.163	9.109
32.120	9.236
33.123	9.363
34.122	9.150
35.176	10.011
36.173	9.529
37.179	10.050
38.177	9.694
39.182	10.125
40.135	9.841
41.175	9.056
46.985	7.403];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', '1 chick'};  
temp.tW    = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Tarb1987';
comment.tW = 'data concern single chick broods';
%
data.tW2 = [ ...  % weight (g) at age (d)
0.964	1.039
2.286	1.346
3.336	1.705
5.435	2.264
7.262	2.983
8.406	3.700
9.453	3.774
10.323	4.294
11.374	4.761
12.379	5.192
13.338	5.552
14.298	6.072
15.394	6.450
16.305	6.577
17.311	7.080
18.405	7.296
19.319	7.710
20.367	7.872
21.460	8.018
22.420	8.502
23.328	8.200
24.422	8.434
25.332	8.418
26.429	8.939
27.430	8.959
28.519	8.603
29.475	8.605
30.205	8.839
31.478	8.680
33.391	8.862
34.303	9.043
35.346	8.633
36.442	9.029
37.536	9.264
38.397	8.925
39.355	9.106
40.266	9.251
43.398	8.362
44.315	9.133
46.221	8.492
47.318	8.995];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', '2 chicks'};  
temp.tW2    = C2K(38.1);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Tarb1987';
comment.tW2 = 'data concern broods with 2 chicks';
%
data.tW3 = [ ...  % weight (g) at age (d)
1.375	1.165
2.605	1.382
3.655	1.706
4.703	1.851
5.526	2.300
6.619	2.373
7.487	2.697
8.444	2.842
9.632	3.452
10.548	4.008
11.460	4.278
12.508	4.352
13.515	5.051
14.562	5.053
15.476	5.520
16.476	5.361
17.576	6.275
18.533	6.366
19.537	6.672
20.532	5.977
21.490	6.300
22.543	6.964
23.497	6.769
24.502	7.164
25.456	6.987
26.549	7.079
27.552	7.277
28.647	7.673
29.511	7.549
30.473	8.213
31.508	6.963
32.605	7.537
33.471	7.610
34.425	7.415
36.465	6.596
37.435	8.208
44.487	8.006
45.534	8.044
46.578	7.688];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', '3 chicks'};  
temp.tW3    = C2K(38.1);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Tarb1987';
comment.tW3 = 'data concern broods with 3 chicks';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW3 = weights.tW3 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW2','tW3'}; subtitle1 = {'Broods with 1, 2, 3 chicks'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: v is reduced';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '64YT8'; % Cat of Life
metaData.links.id_ITIS = '178018'; % ITIS
metaData.links.id_EoL = '916126'; % Ency of Life
metaData.links.id_Wiki = 'Aerodramus_spodiopygius'; % Wikipedia
metaData.links.id_ADW = 'Aerodramus_spodiopygius'; % ADW
metaData.links.id_Taxo = '72154'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'E1989B1D2C76266F'; % avibase
metaData.links.id_birdlife = 'white-rumped-swiftlet-aerodramus-spodiopygius'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aerodramus_spodiopygius}}';
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
bibkey = 'Tarb1987'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1987.tb03166.x}, ' ...
'author = {M. K. Tarburton}, ' ... 
'year = {1987}, ' ...
'title = {An experimental manipulation of clutch and brood size of White?rumped Swiftlets \emph{Aerodramus spodiopygius} of {F}iji}, ' ...
'journal = {Ibis}, ' ...
'volume = {129}, ' ...
'pages = {107--114}'];
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

