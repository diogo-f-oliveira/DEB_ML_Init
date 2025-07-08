function [data, auxData, metaData, txtData, weights] = mydata_Calliopius_laeviusculus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Calliopiidae';
metaData.species    = 'Calliopius_laeviusculus'; 
metaData.species_en = 'Carnivorous shrimp'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMp', '0iMc', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpHl','piCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'WCb'; 'WCp'; 'WCi'; 'Ri'}; 
metaData.data_1     = {'t-WC_T'; 'WC-JX_T'; 'WC-JC_T'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 23];

%% set data
% zero-variate data 
data.ab = 20;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(10.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.WCb = 20; units.WCb = 'mug';  label.WCb = 'C weight at birth';     bibkey.WCb = 'Dagg1976';
data.WCp = 1400;    units.WCp = 'g';  label.WCp = 'C weight at puberty'; bibkey.WCp = 'Dagg1976';
data.WCi = 4600;   units.WCi = 'mug C';  label.WCi = 'ultimate C weight';   bibkey.WCi = 'Dagg1976';
  comment.WCi = 'based in WJX8 data';

data.Ri  = 80/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Dagg1976';   
  temp.Ri = C2K(8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on egg mass of 1600 mug and Wwb, assuming yearly fecundity';  

% uni-variate data

% time-weight
data.tW8 = [ ... % time since birth (d), C-weight (mug)
1.214	21.704
4.833	30.509
4.843	25.205
6.673	19.967
7.540	46.674
8.453	42.885
11.149	81.118
13.435	61.598
14.783	84.717
16.577	138.089
17.464	215.679
17.478	163.680
17.492	121.609
18.835	185.973
22.007	225.302
22.023	163.877
22.929	174.692
22.942	135.418
24.735	225.465
24.742	194.341
24.777	96.476
28.803	360.009
29.251	408.945
33.393	144.720
34.724	279.509
35.162	392.566
36.974	446.088
38.366	251.613
38.839	171.747
44.198	1186.359
46.933	1023.328
54.614	2608.734
55.540	1858.108
56.892	2347.520
56.896	2156.470
61.905	1783.903
63.250	2614.717
68.242	3102.648
68.261	2117.562
75.047	4009.735
77.329	3314.586
77.340	2680.801
77.802	2311.009
79.600	3460.382
85.061	3051.080
108.225	4311.097
108.233	3715.973
110.052	3639.699
112.314	4502.897
118.675	4807.005
119.143	3648.487
138.670	5260.712
138.698	2966.196
169.136	4199.252];
units.tW8   = {'d', '{\mu}g C'};  label.tW8 = {'time since birth','C weight', '8 C'};  
temp.tW8    = C2K(8);  units.temp.tW8 = 'K'; label.temp.tW8 = 'temperature';
bibkey.tW8 = 'Dagg1976'; 
%
data.tW12 = [ ... % time since birth (d), C-weight (mug)
0.000	11.254
1.676	20.978
1.687	16.933
2.121	26.562
2.143	16.940
3.939	30.908
3.953	22.901
3.961	19.712
3.982	12.844
5.315	26.637
5.725	66.935
7.565	49.674
8.013	58.983
8.445	96.571
8.913	76.331
11.627	122.576
12.078	136.487
12.095	96.886
12.984	155.330
13.024	68.831
13.928	81.762
13.935	71.902
14.328	254.525
14.349	169.431
14.795	205.536
14.811	149.059
17.518	278.084
18.007	143.217
18.437	244.747
18.456	166.450
19.392	103.991
21.618	317.379
22.517	419.621
22.550	216.022
24.364	268.055
24.805	361.933
26.600	674.669
26.605	606.152
27.039	950.820
27.525	522.181
29.799	607.882
29.818	413.413
30.240	820.772
31.129	1315.887
31.566	1935.665
32.491	1530.604
33.421	1064.348
33.886	897.110
34.308	1781.081
37.531	1001.774
38.406	2121.731
38.412	1865.859
38.874	1677.050
38.879	1506.734
45.234	2943.551
46.154	2535.781
51.182	2100.583
62.109	3398.023
85.839	3118.262
85.845	2801.580
86.288	3624.124
104.068	4864.346
104.989	4101.693];
units.tW12   = {'d', '{\mu}g C'};  label.tW12 = {'time since birth','C weight', '12 C'};  
temp.tW12    = C2K(12);  units.temp.tW12 = 'K'; label.temp.tW12 = 'temperature';
bibkey.tW12 = 'Dagg1976'; 
%
data.tW15 = [ ... % time since birth (d), C-weight (mug)
2.568	24.660
4.358	29.865
4.786	34.651
5.209	41.068
9.951	174.091
10.006	132.120
10.975	100.291
11.500	71.426
11.708	249.840
11.750	202.069
11.805	153.352
11.856	118.877
12.266	150.151
14.044	193.790
14.908	250.052
15.780	309.240
16.745	239.777
18.066	309.428
18.095	266.715
19.776	560.817
21.181	473.424
22.909	788.221
23.399	665.229
29.211	1286.338
29.614	1695.186
30.096	1492.703
31.522	1133.241
32.495	842.174
36.018	1662.411
37.364	1888.831
37.876	1433.627
38.295	1735.538
40.492	2711.663
41.448	2193.714
46.485	2105.362
47.429	1815.178
47.814	2604.029
47.835	2341.883
51.433	3155.091
51.471	2606.556
56.436	3588.292
56.453	3296.276
56.999	2111.242
58.324	2667.308
58.882	1603.020
71.601	2407.243
72.562	1906.549
77.108	2168.060
88.909	3324.776];
units.tW15   = {'d', '{\mu}g C'};  label.tW15 = {'time since birth','C weight', '15 C'};  
temp.tW15    = C2K(15);  units.temp.tW15 = 'K'; label.temp.tW15 = 'temperature';
bibkey.tW15 = 'Dagg1976'; 

% weight-ingestion
data.WJX8 = [ ... % C weight (mug), ingestoion rate (mug C/d)
19.860	7.361
20.442	4.341
26.863	5.839
27.493	7.503
38.848	14.327
43.095	8.653
56.540	14.592
72.515	17.759
108.491	12.718
122.598	18.967
156.013	67.992
172.726	54.134
176.846	66.154
180.801	98.839
375.077	57.554
404.107	61.974
467.376	118.768
554.253	227.505
571.102	115.401
585.685	112.487
697.721	114.981
810.936	111.823
869.100	249.502
915.882	179.822
919.055	111.569
1015.656	114.199
1142.926	303.518
1148.140	161.965
1295.780	287.989
1300.743	169.924
1405.249	125.526
1431.456	309.968
1470.414	240.998
1796.092	246.231
1805.271	121.856
1892.773	177.464
2198.301	190.834
2301.080	348.429
2304.014	292.240
2377.515	121.248
2478.275	394.524
2536.932	494.391
2676.413	306.461
2962.576	250.207
3023.326	480.592
3094.884	602.245
3183.167	392.733
3258.508	492.146
3269.204	313.115
3345.972	402.357
3359.400	231.516
3367.973	162.867
3537.653	184.497
3597.074	585.702
3615.457	289.856
3633.933	143.446
3692.954	491.027
3768.680	943.152
3772.798	811.183
3796.914	336.705
3872.656	697.361
4000.567	248.845
4631.132	420.595];
units.WJX8   = {'{\mu}g C', '{\mu}g C/d'};  label.WJX8 = {'C weight','ingestion', '8 C'};  
temp.WJX8    = C2K(8);  units.temp.WJX8 = 'K'; label.temp.WJX8 = 'temperature';
bibkey.WJX8 = 'Dagg1976'; 
%
data.WJX12 = [ ... % C weight (mug), ingestoion rate (mug C/d)
12.289	3.877
13.944	6.243
15.705	3.589
17.446	9.316
17.941	15.011
18.872	18.345
19.228	8.007
20.121	4.723
22.912	12.568
23.432	9.296
25.890	11.357
44.494	12.508
49.223	18.218
49.408	30.873
55.650	17.750
60.049	24.591
60.253	39.632
64.899	42.710
68.036	32.388
69.505	20.604
69.691	30.032
70.904	10.721
75.240	44.863
76.426	12.776
78.651	22.761
82.925	38.559
87.213	45.954
89.016	25.784
93.904	47.098
98.759	56.132
108.710	40.466
119.793	33.917
119.857	36.571
120.329	63.552
132.454	45.815
149.856	49.357
152.682	21.542
169.545	53.172
178.503	73.678
185.764	19.950
192.336	83.492
206.871	73.599
215.247	19.434
217.646	92.234
232.841	38.270
240.692	127.760
259.669	172.609
275.277	19.893
311.166	18.901
320.568	39.153
371.513	39.111
475.294	42.096
496.308	18.370
514.513	91.659
626.215	89.258
630.033	209.670
729.897	199.183
888.677	203.958
958.058	249.216
1004.898	203.776
1086.651	381.621
1200.427	454.655
1254.847	230.673
1387.226	303.864
1498.206	477.309
1655.074	568.655
1781.421	554.252
1923.250	827.963
1968.295	677.119
2113.635	476.116
2172.052	693.846
2223.719	596.670
2448.221	441.084
2640.304	566.727
2770.875	499.662
2829.695	302.293
2832.732	351.462
2836.279	419.024
2985.602	566.221
3197.475	273.153];
units.WJX12   = {'{\mu}g C', '{\mu}g C/d'};  label.WJX12 = {'C weight','ingestion', '12 C'};  
temp.WJX12    = C2K(12);  units.temp.WJX12 = 'K'; label.temp.WJX12 = 'temperature';
bibkey.WJX12 = 'Dagg1976'; 
%
data.WJX15 = [ ... % C weight (mug), ingestoion rate (mug C/d)
23.787	12.093
25.621	10.392
28.998	33.126
30.470	40.521
30.470	29.198
34.485	35.706
36.236	24.459
37.144	39.484
40.008	19.984
45.281	27.032
53.850	59.022
64.040	36.535
92.841	81.750
164.079	71.918
195.129	71.873
237.872	73.655
304.699	77.394
336.420	145.302
410.113	152.706
430.932	211.891
538.496	206.448
624.739	134.414
640.400	211.585
724.795	211.489
840.875	141.212
861.954	227.961
1000.000	152.210
1131.784	141.059
1249.609	292.928
1313.045	155.941
1523.336	332.041
1523.336	168.101
1681.924	245.272
1767.306	185.837
1811.609	323.570
1903.575	251.420
2000.209	121.005
2208.442	405.690
2208.442	190.426
2263.803	724.402
2263.803	133.784
2320.552	331.531
2378.724	864.060
2378.724	654.796
2438.354	448.573
2562.136	1111.514
2562.136	307.270
2692.201	251.103
2759.689	534.908];
units.WJX15   = {'{\mu}g C', '{\mu}g C/d'};  label.WJX15 = {'C weight','ingestion', '15 C'};  
temp.WJX15    = C2K(8);  units.temp.WJX15 = 'K'; label.temp.WJX15 = 'temperature';
bibkey.WJX15 = 'Dagg1976'; 

% C weight-CO2 production
data.WJC8 = [ ... % C weight (mug), CO2 production (mug C/d)
40.873	5.088
53.183	7.464
54.170	4.502
58.283	5.724
62.663	6.771
71.970	5.068
100.905	10.922
113.780	13.552
143.674	10.636
182.183	12.567
248.311	17.147
279.031	15.190
323.333	27.039
519.122	32.672
628.722	43.555
899.411	67.005
1089.301	89.323
1172.301	116.338
1789.306	100.398
1824.329	66.675
2169.212	147.363
2271.138	130.613
2447.205	191.870
2734.417	97.721
2805.859	121.335
2891.970	232.341
2994.463	69.722
3021.146	165.825
3312.542	133.443
3561.433	157.851];
units.WJC8   = {'{\mu}g C', '{\mu}g C/d'};  label.WJC8 = {'C weight','CO2 production', '8 C'};  
temp.WJC8    = C2K(8);  units.temp.WJC8 = 'K'; label.temp.WJC8 = 'temperature';
bibkey.WJC8 = 'Dagg1976'; 
%
data.WJC12 = [ ... % C weight (mug), CO2 production (mug C/d)
63.789	8.770
71.879	9.635
72.158	11.650
79.306	11.922
82.439	7.961
97.931	11.626
99.292	7.231
103.441	16.991
106.878	26.668
124.044	12.464
141.410	24.206
177.649	17.334
255.776	31.300
308.661	31.260
371.939	29.074
387.385	21.348
480.917	27.028
518.288	33.448
534.477	47.744
617.473	56.318
867.128	94.719
905.326	78.313
1799.728	103.633
1804.092	116.691
1820.772	183.183
2005.987	211.082
2188.737	151.308
2442.536	103.415
2475.290	62.813
2511.522	128.022
2900.115	147.473
3052.905	182.533
3102.849	127.836
3158.196	96.137
3263.163	150.893
3637.141	307.343
4355.278	209.960];
units.WJC12   = {'{\mu}g C', '{\mu}g C/d'};  label.WJC12 = {'C weight','CO2 production', '12 C'};  
temp.WJC12    = C2K(12);  units.temp.WJC12 = 'K'; label.temp.WJC12 = 'temperature';
bibkey.WJC12 = 'Dagg1976'; 
%
data.WJC15 = [ ... % C weight (mug), CO2 production (mug C/d)
51.751	11.998
61.128	14.909
63.890	9.668
71.542	4.813
72.037	13.226
88.642	6.586
93.365	13.238
118.520	19.947
161.186	23.070
176.836	18.141
312.163	26.081
807.927	83.081
868.994	113.632
908.261	73.691
1100.401	119.334
1640.225	93.937
1724.228	141.454
1804.806	113.922
1851.815	155.788
1983.947	119.579
2038.967	208.025
2183.377	148.552
2400.488	159.728
2766.614	171.772
2836.341	208.264
3182.823	141.756
3421.150	176.087
3425.650	213.478
3755.786	152.458
4139.440	235.208];
units.WJC15   = {'{\mu}g C', '{\mu}g C/d'};  label.WJC15 = {'C weight','CO2 production', '15 C'};  
temp.WJC15    = C2K(8);  units.temp.WJC15 = 'K'; label.temp.WJC15 = 'temperature';
bibkey.WJC15 = 'Dagg1976'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW8 = weights.tW8 * 3;
weights.tW12 = weights.tW12 * 3;
weights.tW15 = weights.tW15 * 3;
weights.WCi = weights.WCi * 5;
weights.WCb = weights.WCb * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.tW8 = weights.tW8 * 3;
weights.tW12 = weights.tW12 * 3;
weights.tW15 = weights.tW15 * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW15','tW12','tW8'}; subtitle1 = {'Data for 15, 12, 8 C'};
set2 = {'WJX15','WJX12','WJX8'}; subtitle2 = {'Data for 15, 12, 8 C'};
set3 = {'WJC15','WJC12','WJC8'}; subtitle3 = {'Data for 15, 12, 8 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'males are assumed not to differ from females due to lack of data';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'PRD2'; % Cat of Life
metaData.links.id_ITIS = '93542'; % ITIS
metaData.links.id_EoL = '46530930'; % Ency of Life
metaData.links.id_Wiki = 'Calliopius_laeviusculus'; % Wikipedia
metaData.links.id_ADW = 'Calliopius_laeviusculus'; % ADW
metaData.links.id_Taxo = '291122'; % Taxonomicon
metaData.links.id_WoRMS = '102178'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dagg1976'; type = 'Article'; bib = [ ... 
'doi = {10.1002/iroh.19760610303}, ' ...
'author = {Dagg, M. J.}, ' ... 
'year = {1976}, ' ...
'title = {Complete Carbon and Nitrogen Budgets for the Carnivorous Amphipod, \emph{Calliopius laeviusculus} ({K}r{\o}yer)}, ' ...
'journal = {Internationale Revue Der Gesamten Hydrobiologie Und Hydrographie}, ' ...
'volume = {61(3)}, ' ...
'pages = {297–357}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
