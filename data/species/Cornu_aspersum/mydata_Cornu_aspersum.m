function [data, auxData, metaData, txtData, weights] = mydata_Cornu_aspersum

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Helicidae';
metaData.species    = 'Cornu_aspersum'; 
metaData.species_en = 'Garden snail'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f', 't-L', 'Ww-JX_f', 'Ww-JO_f'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 28]; 

%% set data
% zero-variate data

data.ab = 14;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'inspection';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 0.4*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'petsnails';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'inspection gives 2 yr for natural populations';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'cabi';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 3.3;   units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'inspection';
  comment.Li = 'Wiki_ls gives 3.8 cm';

data.Wwb = 0.029;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'CzarKozl2008';

data.Ri  = 86/42;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'cabi';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.057	1.204
0.141	1.300
0.231	1.444
0.309	1.589
0.401	1.657
0.499	1.671
0.572	1.723
0.664	1.758
0.742	1.899
0.827	1.966
0.911	2.018
1.003	2.077
1.080	2.112
1.168	2.151
1.252	2.207
1.329	2.238
1.420	2.265
1.507	2.255
1.588	2.270
1.665	2.273
1.763	2.280
1.840	2.295
1.920	2.301];
data.tL(:,1) = 365 * (0.4 + data.tL(:,1)); % convert yr to d since birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DanBail1982';

data.tW = [ ... % time since birth (d), wet weight (g)
0       0.029 % tab 1
6.636	0.048
8.848	0.222
10.323	0.180
16.037	0.056
19.171	0.101
21.014	0.103
25.253	0.149
30.968	0.111
36.129	0.158
39.078	0.074
40.922	0.419
44.608	0.293
45.161	0.851
45.899	1.152
46.452	0.766
46.820	0.081
49.770	0.340
49.770	0.726
51.982	1.028
56.774	1.246
59.908	1.292
61.751	1.636
61.935	0.822
65.253	1.511
65.991	3.184
65.991	0.954
66.175	1.125
66.544	3.527
66.728	1.812
67.097	0.997
70.783	1.000
70.783	1.301
70.783	1.901
70.783	2.330
72.995	2.632
77.788	3.022
80.922	4.182
82.949	1.825
82.949	4.141
82.949	3.712
86.820	3.372
87.005	2.686
87.005	6.631
87.742	7.275
88.111	3.502
88.479	2.859
91.982	2.132
91.982	2.347
91.982	5.349
92.166	3.676
95.115	4.408
100.092	4.240
103.226	8.188
105.069	5.316
105.069	5.788
105.253	2.915
109.124	9.866
109.124	4.591
109.124	5.620
110.230	3.777
110.230	4.120
110.415	10.982
114.101	2.836
114.286	3.566
114.286	4.766
114.286	5.453
114.470	8.240
116.129	5.797
120.922	5.415
124.055	10.564
126.083	7.092
126.083	7.692
126.083	8.164
126.267	3.575
129.770	11.040
129.954	6.666
129.954	5.980
130.138	7.910
131.060	11.427
131.244	4.823
134.931	7.013
134.931	9.972
135.115	3.368
135.115	3.754
135.115	4.183
135.115	8.986
136.959	7.486
142.120	5.732
145.253	10.795
147.281	4.578
147.281	8.395
147.281	9.339
147.465	10.454
150.968	11.529
150.968	8.570
150.968	7.926
150.968	6.383
152.074	11.401
152.442	5.869
152.627	7.885
155.760	3.599
155.945	10.804
156.129	7.888
156.129	4.414
156.129	4.114];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'CzarKozl2008';
comment.tW = 'Control cohort';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
 0      0.035 % tab 1
 9.585	0.308
12.535	0.053
24.516	0.191
26.175	0.321
28.387	0.237
29.124	0.366
33.548	0.284
40.922	0.590
47.189	0.510
48.111	0.896
48.664	1.283
49.401	1.884
49.401	2.313
50.138	1.541
53.088	1.372
69.493	4.730
69.677	1.986
69.677	2.500
69.862	3.873
70.046	3.015
70.415	3.273
70.968	4.174
70.968	4.732
70.968	5.418
71.336	3.574
74.470	3.662
90.691	3.933
90.691	4.147
90.691	4.490
90.691	5.434
90.876	5.005
90.876	7.364
90.876	9.036
91.060	9.551
91.060	10.065
91.429	6.292
91.982	5.649
91.982	7.150
92.166	8.651
92.535	4.792
92.535	9.295
95.115	6.809
104.700	5.959
109.124	5.749
112.811	4.422
112.811	11.327
112.811	15.058
112.811	17.802
112.995	6.867
112.995	13.342
113.180	7.982
113.364	7.639
113.548	7.296
114.101	12.185
114.101	12.657
114.101	17.246
114.286	8.883
114.470	6.868
114.470	13.558
114.470	14.158
117.419	8.886
133.641	8.556
133.641	8.899
133.825	13.188
133.825	20.821
134.009	9.328
134.009	9.928
134.009	17.219
134.194	4.568
134.562	14.732
134.931	8.300
134.931	14.475
134.931	17.134
134.931	19.793
135.115	16.319
135.300	11.945
138.433	11.519
154.839	7.201
154.839	14.791
155.023	5.314
155.023	8.401
155.023	17.707
155.023	21.481
155.207	9.131
155.207	11.318
155.207	13.119
155.207	15.606
155.760	9.646
155.760	17.494
155.760	18.394
155.760	18.737
155.945	15.135
156.129	20.367
156.313	11.404
156.498	12.305
157.051	9.261
159.631	13.551];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(20);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'CzarKozl2008';
comment.tW1 = 'Cohort selected for fast growth';

data.WJX = [ ... % 10 log wet weight (g), 10 log food consumption rate (g/d)
-1.662	-2.153
-1.649	-1.830
-1.639	-2.068
-1.630	-1.866
-1.620	-2.004
-1.593	-2.060
-1.570	-1.979
-1.565	-2.093
-1.556	-1.818
-1.551	-1.790
-1.551	-2.153
-1.537	-2.137
-1.523	-1.987
-1.510	-1.858
-1.481	-2.185
-1.477	-2.125
-1.449	-2.024
-1.422	-1.963
-1.421	-2.036
-1.343	-2.096
-1.310	-2.153
-1.287	-1.987
-1.250	-2.019
-1.240	-2.310
-1.135	-1.805
-1.116	-1.850
-1.116	-1.882
-1.116	-2.157
-0.996	-1.728
-0.964	-1.764
-0.954	-1.995
-0.880	-1.890
-0.802	-1.712
-0.802	-1.760
-0.645	-1.602
-0.622	-1.623
-0.608	-1.667
-0.603	-1.534
-0.446	-1.638
-0.446	-1.695
-0.428	-1.424
-0.427	-1.558
-0.372	-1.525
-0.367	-1.485
-0.339	-1.618
-0.321	-1.719
-0.256	-1.509
-0.220	-1.335
-0.113	-1.501
-0.099	-1.557
-0.095	-1.234
-0.072	-1.222
-0.039	-1.436
-0.030	-1.359
0.002	-1.218
0.012	-1.238
0.030	-1.286
0.039	-1.319
0.081	-1.278
0.090	-1.108
0.099	-1.088
0.123	-1.395
0.164	-1.019
0.178	-1.120
0.206	-1.177
0.234	-1.246
0.243	-1.140
0.261	-1.262
0.289	-1.088
0.331	-1.092
0.336	-1.322
0.372	-0.999
0.418	-1.092
0.492	-0.914
0.534	-0.829
0.534	-0.970
0.557	-0.869
0.567	-1.071
0.612	-0.801];
units.WJX   = {'g', 'g/d'};  label.WJX = {'_{10} log wet weight', '_{10} log food consumption rate'};  
temp.WJX    = C2K(20);  units.temp.WJX = 'K'; label.temp.WJX = 'temperature';
bibkey.WJX  = 'CzarKozl2008';
comment.WJX = 'Control cohort';
%
data.WJX1 = [ ... % 10 log wet weight (g), 10 log food consumption rate (g/d)
-1.569	-2.016
-1.532	-2.093
-1.518	-2.056
-1.496	-1.915
-1.463	-1.866
-1.463	-1.995
-1.463	-2.060
-1.440	-2.060
-1.426	-2.206
-1.408	-1.991
-1.403	-1.915
-1.389	-2.092
-1.384	-2.040
-1.375	-2.137
-1.371	-1.882
-1.098	-1.841
-0.945	-1.809
-0.885	-1.845
-0.876	-1.607
-0.774	-1.655
-0.761	-1.611
-0.738	-1.518
-0.737	-1.570
-0.737	-1.691
-0.733	-1.635
-0.631	-1.505
-0.626	-1.542
-0.622	-1.566
-0.580	-1.590
-0.557	-1.477
-0.520	-1.396
-0.224	-1.291
-0.210	-1.388
-0.136	-1.355
-0.108	-1.375
-0.099	-1.282
-0.044	-1.335
0.067	-1.153
0.072	-1.230
0.095	-1.379
0.099	-1.222
0.113	-1.145
0.113	-1.270
0.132	-1.157
0.146	-1.213
0.284	-1.169
0.335	-1.140
0.335	-1.169
0.354	-1.088
0.372	-1.104
0.381	-1.035
0.427	-0.995
0.497	-0.983
0.529	-1.011
0.538	-0.938
0.547	-0.780
0.548	-0.898
0.562	-1.023
0.571	-0.942
0.575	-0.825
0.612	-0.861
0.612	-0.910
0.659	-0.902
0.668	-0.792
0.705	-0.833
0.728	-0.877
1.014	-0.521];
units.WJX1   = {'g', 'g/d'};  label.WJX1 = {'_{10} log wet weight', '_{10} log food consumption rate'};  
temp.WJX1    = C2K(20);  units.temp.WJX1 = 'K'; label.temp.WJX1 = 'temperature';
bibkey.WJX1  = 'CzarKozl2008';
comment.WJX1 = 'Cohort selected for fast growth';

data.WJO = [ ... % 10 log weight (g), 10 log dioxygen consumption (mul/h)
-1.685	0.603
-1.518	0.833
-1.512	0.543
-1.418	0.526
-1.199	1.038
-1.178	1.004
-1.109	0.662
-1.099	0.868
-1.094	1.124
-1.052	1.030
-1.005	1.209
-0.948	1.380
-0.895	1.141
-0.869	1.295
-0.812	1.415
-0.785	1.209
-0.740	1.927
-0.728	1.432
-0.717	0.953
-0.556	1.885
-0.530	1.662
-0.472	1.594
-0.378	1.808
-0.367	1.765
-0.326	2.064
-0.283	1.560
-0.236	1.585
-0.205	2.004
-0.180	2.252
-0.178	1.355
-0.101	2.209
0.093	1.936
0.103	2.201
0.124	2.021
0.145	2.355
0.156	2.184
0.160	2.474
0.187	2.073
0.203	1.970
0.271	2.235
0.280	2.705
0.281	2.338
0.296	2.645
0.302	2.474
0.317	2.543
0.323	2.030
0.348	2.645
0.349	2.372
0.375	2.603
0.381	2.132
0.391	2.329
0.406	2.799
0.407	2.175
0.422	2.825
0.427	2.560
0.448	2.782
0.505	2.551
0.506	2.406
0.511	2.808
0.532	2.654
0.537	2.885
0.569	2.560
0.610	2.662
0.616	2.406
0.621	2.885
0.648	2.303
0.678	2.714
0.683	2.876
0.709	2.987
0.730	2.962
0.741	2.885
0.766	3.038
0.767	2.808
0.773	2.731
0.783	2.927
0.804	2.679
0.809	3.013
0.830	2.987
0.836	2.714
0.846	2.808
0.882	2.910
0.904	2.774
0.908	3.115
0.940	2.816
0.956	2.816
1.033	3.261
1.034	3.132];
units.WJO   = {'g', 'mul/h'};  label.WJO = {'_{10} log wet weight', '_{10} log O_2 consumption rate'};  
temp.WJO    = C2K(20);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO  = 'CzarKozl2008';
comment.WJO = 'Control cohort';
%
data.WJO1 = [ ... % 10 log weight (g), 10 log dioxygen consumption (mul/h)
-1.397	0.464
-1.255	0.722
-1.132	0.797
-1.112	0.723
-1.029	1.110
-0.994	0.936
-0.960	1.424
-0.916	1.102
-0.896	1.406
-0.847	1.176
-0.793	1.204
-0.739	1.324
-0.709	1.278
-0.670	1.296
-0.611	1.223
-0.415	1.593
-0.385	1.068
-0.356	1.694
-0.194	2.100
-0.179	2.174
-0.160	2.146
-0.042	2.138
-0.022	2.248
-0.017	2.055
0.002	2.083
0.042	2.322
0.130	2.010
0.135	2.139
0.194	2.544
0.204	2.240
0.233	2.066
0.268	2.361
0.292	2.158
0.346	2.508
0.400	2.582
0.449	2.389
0.489	2.196
0.493	2.390
0.507	2.288
0.508	2.472
0.518	2.813
0.528	2.647
0.564	2.473
0.565	2.786
0.566	2.905
0.587	2.169
0.597	2.841
0.606	2.694
0.631	2.915
0.700	2.805
0.701	2.915
0.744	3.026
0.764	2.778
0.765	2.879
0.802	2.916
0.803	2.971
0.808	2.714
0.822	2.842
0.823	3.045
0.842	3.091
0.857	2.778
0.872	2.990
0.881	2.926
0.926	3.092
0.930	2.889
0.950	3.027
0.951	3.128
0.955	2.963
0.965	2.788
1.029	3.055
1.038	3.157
1.151	3.185
1.161	2.752
1.176	3.139
1.196	2.955
1.197	3.369
1.200	2.808
1.210	3.149
1.220	3.038
1.250	3.149
1.251	3.305
1.274	3.370];
units.WJO1   = {'g', 'mul/h'};  label.WJO1 = {'_{10} log wet weight', '_{10} log O_2 consumption rate'};  
temp.WJO1    = C2K(20);  units.temp.WJO1 = 'K'; label.temp.WJO1 = 'temperature';
bibkey.WJO1  = 'CzarKozl2008';
comment.WJO1 = 'Cohort selected for fast growth';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Kappa_R = 0.95/2 because of hermaphroditism';
D2 = 'Selection for growth is assumed to affect digestion efficiency kappa_X and spec max assim {p_Am} only, letting {p_Xm} unaffected';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Group plots
set1 = {'tW1','tW'}; subtitle1 = {'Data for growth selected, control'};
set2 = {'WJX1','WJX'}; subtitle2 = {'Data for growth selected, control'};
set3 = {'WJO1','WJO'}; subtitle3 = {'Data for growth selected, control'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Facts
F1 = 'This species is hermaphroditic';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Egg cannibalism by hatchlings is frequent';
metaData.bibkey.F2 = 'cabi'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'YG75'; % Cat of Life
metaData.links.id_ITIS = '77906'; % ITIS
metaData.links.id_EoL = '49995512'; % Ency of Life
metaData.links.id_Wiki = 'Cornu_aspersum'; % Wikipedia
metaData.links.id_ADW = 'Helix_aspersa'; % ADW
metaData.links.id_Taxo = '5327853'; % Taxonomicon
metaData.links.id_WoRMS = '820000'; % WoRMS
metaData.links.id_molluscabase = '820000'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cornu_aspersum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_ls'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Land_snail}}';
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
bibkey = 'DanBail1982'; type = 'Article'; bib = [ ... 
'author = {Dan, N. and Bailey, S. E. R.}, ' ... 
'year = {1982}, ' ...
'title = {Growth, mortality, and feeding rates of the snail \emph{Helix aspersa} at different population densities in the laboratory, and the depression of activity of helicid snails by other individuals, or their mucus}, ' ...
'journal = {J. Molluscan Stud.}, ' ...
'volume = {48}, ' ...
'pages = {257--265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CzarKozl2008'; type = 'Article'; bib = [ ... 
'author = {M. Czarnoleski and J. Kozlowski and G. Dumiot and J.-C. Bonnet and J. Mallard and M. Dupont-Nivet}, ' ... 
'year = {2008}, ' ...
'title = {Scaling of metabolism in \emph{Helix aspersa} snails: changes through ontogeny and response to selection for increased size}, ' ...
'journal = {The Journal of Experimental Biology}, ' ...
'volume = {211}, ' ...
'pages = {391--399}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'inspection'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.inspection.gc.ca/plants/plant-pests-invasive-species/nematodes-other/european-brown-garden-snail/fact-sheet/eng/1326334238293/1326341285764}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'petsnails'; type = 'Misc'; bib = ...
'howpublished = {\url{http://petsnails.proboards.com/thread/14253/cornu-aspersum-helix-aspersa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'cabi'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.cabi.org/isc/datasheet/26821}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

