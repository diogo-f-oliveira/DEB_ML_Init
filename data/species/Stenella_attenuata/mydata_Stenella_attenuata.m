function [data, auxData, metaData, txtData, weights] = mydata_Stenella_attenuata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Stenella_attenuata'; 
metaData.species_en = 'Pantropical spotted dolphin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 11.2*30.5;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'KasuMiya1977';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 29*30.5;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'KasuMiya1977';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 8.2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'KasuMiya1977';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 10.3*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'KasuMiya1977';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 46*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 89; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'KasuMiya1977';
data.Lp = 181.9; units.Lp = 'cm';   label.Lp = 'length at puberty for females'; bibkey.Lp = 'KasuMiya1977';
data.Lpm = 193.3; units.Lpm = 'cm';   label.Lpm = 'length at puberty for males'; bibkey.Lpm = 'KasuMiya1977';
data.Li = 194.9; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'KasuMiya1977';
data.Lim = 203.3; units.Lim = 'cm'; label.Lim = 'ultimate length for males'; bibkey.Lim = 'KasuMiya1977';

data.Ri  = 1/365/3;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 calves per litter, 1 litter per 3 yr';
  
% uni-variate data
% time-length
data.tL_f = [ % time since birth (yr), length (cm)
0.177	100.631
0.230	119.695
0.418	119.701
0.419	117.513
0.446	127.201
0.480	120.640
0.538	130.017
0.575	120.330
0.753	138.461
0.758	128.461
0.784	140.024
0.792	123.775
1.003	140.969
1.003	139.719
1.248	150.977
1.277	155.040
1.936	153.811
1.963	163.186
1.965	159.749
1.988	174.750
2.036	142.564
2.217	156.944
2.404	158.825
2.464	164.764
2.903	163.216
3.016	186.657
3.434	167.920
3.435	166.357
3.435	166.357
3.436	164.170
3.464	170.108
3.468	162.608
3.470	159.171
3.485	190.109
4.404	170.138
4.408	163.888
4.528	173.891
5.439	170.170
5.465	179.858
5.466	177.358
5.492	188.922
5.495	182.672
6.405	180.200
6.407	176.763
6.467	181.452
6.475	167.702
6.493	192.703
6.496	186.141
6.631	167.707
7.408	181.481
7.441	177.420
7.467	188.983
7.468	186.483
7.470	183.358
7.475	172.109
7.488	208.671
7.527	192.735
7.533	182.423
8.406	191.513
8.436	193.701
8.436	192.764
8.439	188.076
8.471	186.827
8.495	199.953
8.501	189.641
8.504	182.766
8.505	181.516
8.506	180.266
8.531	191.517
8.542	170.579
8.596	187.144
8.599	182.144
8.656	191.521
8.667	170.583
8.692	182.772
9.410	188.419
9.434	202.795
9.466	201.546
9.467	199.671
9.470	194.358
9.471	193.421
9.471	192.483
9.472	190.921
9.472	189.671
9.477	180.921
9.478	179.046
9.479	178.109
9.504	188.735
9.505	187.172
9.507	184.047
9.529	201.548
9.530	199.673
9.533	193.423
9.629	190.926
10.438	202.201
10.439	200.014
10.440	196.889
10.441	195.639
10.441	195.326
10.442	194.076
10.443	192.201
10.443	191.576
10.447	184.076
10.447	184.076
10.448	182.827
10.449	180.327
10.468	204.077
10.477	187.202
10.535	196.892
10.563	202.205
10.571	187.205
10.593	204.081
11.347	200.980
11.352	191.917
11.383	193.168
11.442	200.045
11.443	198.795
11.477	193.484
11.478	190.359
11.482	184.109
11.504	201.297
11.508	193.797
11.536	199.736
11.537	198.798
11.540	191.923
11.567	201.299
11.572	190.362
11.634	191.926
12.323	193.198
12.385	195.075
12.413	202.263
12.415	197.575
12.445	200.389
12.445	199.451
12.454	182.577
12.473	206.640
12.474	204.140
12.480	193.203
12.481	191.640
12.482	189.453
12.482	189.453
12.483	187.890
12.485	184.140
12.489	176.953
12.507	202.266
12.517	182.891
12.539	200.392
12.540	199.142
12.542	195.079
12.572	196.955
12.573	195.080
12.574	192.893
13.356	195.730
13.358	192.917
13.451	195.108
13.452	192.920
13.454	189.170
13.470	217.921
13.475	207.921
13.479	201.359
13.486	187.296
13.487	185.421
13.544	196.673
13.545	195.736
13.546	192.923
13.579	189.799
13.638	196.989
14.429	183.263
14.446	210.451
14.451	201.702
14.452	198.264
14.454	194.202
14.458	187.639
14.459	185.764
14.548	194.205
14.553	186.392
15.363	195.793
15.363	194.543
15.396	191.731
15.422	201.419
15.423	200.169
15.425	196.420
15.455	199.233
15.456	197.983
15.458	192.983
15.460	189.233
15.461	187.358
15.490	191.422
15.525	184.548
15.582	196.424
15.583	194.237
15.584	191.425
16.456	203.014
16.460	195.514
16.460	194.889
16.467	181.765
16.497	184.891
16.524	193.016
16.525	191.141
17.425	208.045
17.430	198.045
17.431	196.482
17.463	195.233
17.495	195.234
17.496	193.359
17.496	191.797
17.499	186.797
17.529	189.298
18.436	193.701
18.468	191.827
18.529	195.267
18.561	193.705
20.476	188.140
21.474	197.859
22.412	203.200]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KasuMiya1977';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.078	100.105
0.094	120.524
0.133	110.157
0.172	101.361
0.182	128.063
0.193	113.613
0.195	112.042
0.201	103.874
0.223	115.811
0.248	123.979
0.250	121.780
0.257	112.984
0.258	110.785
0.319	113.613
0.341	125.550
0.349	115.811
0.409	118.639
0.459	134.974
0.465	127.435
0.466	126.178
0.502	120.838
0.526	129.319
0.527	128.063
0.562	123.665
0.656	123.979
0.706	140.314
0.714	130.262
0.801	139.686
1.170	149.424
1.172	146.283
1.428	141.257
1.478	157.277
1.915	160.419
1.925	147.539
1.945	161.990
1.972	168.272
1.973	166.702
2.105	157.906
2.141	152.880
2.162	165.445
2.232	156.335
2.262	157.906
2.388	157.906
2.410	170.157
2.412	167.016
2.695	166.702
2.907	176.440
3.474	174.555
3.482	164.503
4.385	173.927
4.415	175.812
4.417	172.670
4.419	170.471
4.421	168.272
4.438	185.550
4.510	173.927
5.447	180.524
5.448	179.267
5.460	164.503
5.486	171.414
5.546	174.241
6.400	206.283
6.405	199.686
6.416	185.864
6.418	183.037
6.422	178.639
6.422	178.010
6.423	176.754
6.424	175.497
6.456	174.555
6.458	172.042
6.485	178.010
7.371	208.796
7.382	195.602
7.398	215.079
7.419	188.063
7.420	186.492
7.422	184.921
7.424	182.408
7.425	180.209
7.427	178.010
7.428	177.068
7.428	176.126
7.435	167.958
7.484	185.236
7.488	180.209
7.579	183.979
8.395	184.607
8.396	183.665
8.404	173.927
8.404	172.984
8.407	169.843
8.411	203.770
8.415	199.372
8.417	196.544
8.421	191.832
8.429	181.780
8.432	177.068
8.436	212.880
8.455	188.063
8.456	186.492
8.519	186.806
8.521	184.607
8.554	182.094
9.346	212.565
9.387	200.628
9.415	205.654
9.416	204.084
9.418	201.257
9.421	197.801
9.425	193.089
9.455	194.346
9.463	184.293
9.464	182.723
9.466	180.524
9.472	173.298
9.546	198.115
9.550	193.089
9.590	182.094
10.352	211.937
10.356	206.597
10.378	178.325
10.387	207.539
10.391	201.885
10.395	196.859
10.397	194.660
10.405	184.293
10.413	213.508
10.421	203.455
10.429	194.031
10.477	211.937
10.481	206.597
10.493	191.832
10.496	188.377
10.498	185.864
10.530	184.293
10.548	201.885
11.401	195.602
11.402	193.717
11.416	216.649
11.417	214.136
11.421	209.424
11.425	205.026
11.427	201.885
11.428	200.628
11.431	197.487
12.306	202.199
12.313	193.717
12.334	206.911
12.381	187.120
12.422	214.450
12.427	207.539
12.428	206.283
12.430	204.712
12.431	202.827
12.432	202.199
12.432	201.257
12.437	195.602
12.438	193.717
13.283	197.801
13.337	208.482
13.339	205.654
13.395	214.136
13.406	200.628
13.408	198.115
13.428	212.880
13.429	211.937
13.430	210.681
13.502	198.115
13.526	208.168
14.382	197.487
14.383	195.602
14.384	194.346
14.408	204.398
14.425	182.408
14.433	212.565
14.434	211.623
14.436	208.796
14.438	205.969
14.450	191.204
14.451	189.948
14.451	189.319
14.471	204.398
15.383	201.885
15.384	200.314
15.412	205.340
15.442	207.225
15.497	216.335
15.498	215.079
16.347	214.450
17.319	215.707
17.453	205.340
20.464	209.424
20.469	202.513
21.414	198.429
22.883	206.911]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KasuMiya1977';
comment.tL_m = 'Data for males';

% length-weight
data.LW = [ ...  % weight (kg), length (cm)
6.064	85.868
7.238	87.624
7.315	86.084
7.907	89.142
14.688	123.838
15.379	113.340
15.544	118.242
15.544	119.925
15.544	124.238
16.275	118.213
16.921	130.478
17.041	123.738
17.041	128.188
24.449	149.454
34.583	152.907
34.829	162.367
34.829	164.678
36.469	166.980
39.421	163.986
50.681	177.625
53.067	192.614
53.255	182.024
53.633	167.810
55.762	195.303
56.357	206.649
60.920	194.520
61.352	200.797
66.790	198.588
67.742	196.479
68.952	190.311
69.441	200.661
70.681	206.394
80.284	198.389];
data.LW = [data.LW(:,2), 1e3*data.LW(:,1)];
units.LW  = {'cm', 'g'};  label.LW = {'length', 'weight'};  
bibkey.LW = 'KasuMiya1977';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';
weights.psd.p_M = 8 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6ZJBD'; % Cat of Life
metaData.links.id_ITIS = '180430'; % ITIS
metaData.links.id_EoL = '46559279'; % Ency of Life
metaData.links.id_Wiki = 'Stenella_attenuata'; % Wikipedia
metaData.links.id_ADW = 'Stenella_attenuata'; % ADW
metaData.links.id_Taxo = '68733'; % Taxonomicon
metaData.links.id_WoRMS = '137105'; % WoRMS
metaData.links.id_MSW3 = '14300085'; % MSW3
metaData.links.id_AnAge = 'Stenella_attenuata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stenella_attenuata}}';
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
bibkey = 'KasuMiya1977'; type = 'article'; bib = [ ... 
'author = {T. Kasuya and N. Miyazaki}, ' ... 
'year = {1974}, ' ...
'title = {Growth and reproduction of \emph{Stenella attenuata} in the {P}acific coast of {J}apan}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {29}, ' ...
'pages = {21--48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Stenella_attenuata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Stenella_attenuata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

