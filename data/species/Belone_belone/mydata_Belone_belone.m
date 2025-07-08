function [data, auxData, metaData, txtData, weights] = mydata_Belone_belone

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Belonidae';
metaData.species    = 'Belone_belone'; 
metaData.species_en = 'Garfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'biMcp'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ah'; 'am'; 'Lh'; 'L_t'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};
   
metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 06];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.ah = 330/24;  units.ah = 'd';    label.ah = 'age at hatch';              bibkey.ah = 'DulcBazd2009';   
  temp.ah = C2K(22);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.2269; units.L0  = 'cm';  label.L0  = 'egg diameter';            bibkey.L0  = 'ZoriSino2011'; 
%  comment.L0 = 'ZoriSino2011: 0.12 - 0.43 cm';
data.Lh  = 0.90;   units.Lh  = 'cm';  label.Lh  = 'standard length at hatch'; bibkey.Lh  = 'DulcBazd2009'; 
data.Lht  = 0.978; units.Lht  = 'cm'; label.Lht  = 'total length at hatch';   bibkey.Lht  = 'DulcBazd2009'; 
data.L1  = 0.95;   units.L1  = 'cm';  label.L1  = 'standard length at 1 d';   bibkey.L1  = 'DulcBazd2009';  
  temp.L1 = C2K(22); units.temp.L1 = 'K'; label.temp.L1 = 'temperature';
data.L1t  = 1.04;  units.L1t  = 'cm'; label.L1t  = 'total length at 1 d';     bibkey.L1t  = 'DulcBazd2009';  
  temp.L1t = C2K(22);  units.temp.L1t = 'K'; label.temp.L1t = 'temperature';
data.L3  = 1.305;  units.L3  = 'cm';  label.L3  = 'standard length at 3 d';   bibkey.L3  = 'DulcBazd2009';  
  temp.L3 = C2K(22); units.temp.L3 = 'K'; label.temp.L3 = 'temperature';
data.L3t  = 1.397; units.L3t  = 'cm'; label.L3t  = 'standard length at 3 d';  bibkey.L3t  = 'DulcBazd2009';  
  temp.L3t = C2K(22);  units.temp.L3t = 'K'; label.temp.L3t = 'temperature';
data.Lp_f  = 31.5; units.Lp_f  = 'cm'; label.Lp_f  = 'total length at puberty for females';  bibkey.Lp_f  = 'ZoriSino2011'; 
data.Lp_m  = 28.0; units.Lp_m  = 'cm'; label.Lp_m  = 'total length at puberty for males';    bibkey.Lp_m  = 'ZoriSino2011'; 
data.Li_f  = 93;     units.Li_f  = 'cm'; label.Li_f  = 'ultimate total length for females';  bibkey.Li_f  = 'fishbase';
data.Li_m  = 88;     units.Li_m  = 'cm'; label.Li_m  = 'ultimate total length for males';    bibkey.Li_m  = 'guess';

data.Wwi = 1300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'fishbase';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since hatch (yr), total length (cm) for females
2.488	30.083
2.488	30.428
2.488	30.774
2.488	31.464
2.489	32.040
2.489	32.500
2.528	32.845
2.568	33.535
2.490	34.112
2.490	34.342
2.490	34.572
2.490	34.802
2.490	34.917
2.451	35.494
2.451	35.724
2.451	36.069
2.451	36.299
2.452	36.760
2.452	36.760
2.373	37.222
2.373	37.682
2.374	38.257
2.413	38.602
2.414	39.523
2.414	40.904
3.435	37.434
3.514	38.239
3.514	38.814
3.515	39.160
3.515	39.735
3.515	40.426
3.516	41.231
3.516	41.577
3.516	41.922
3.516	42.498
3.477	43.074
3.438	43.420
3.438	43.995
3.399	44.687
3.399	45.032
3.400	45.608
3.400	46.183
3.440	46.873
3.440	47.218
3.440	47.679
3.440	47.909
3.440	48.139
3.441	48.830
4.420	40.986
4.420	41.677
4.421	42.713
4.500	44.784
4.461	45.360
4.462	46.511
4.423	47.317
4.423	48.008
4.424	49.044
4.424	49.504
4.424	49.850
4.424	50.195
4.425	50.771
4.425	51.231
4.425	51.922
4.426	52.612
4.426	53.533
4.426	53.994
4.427	54.454
4.427	54.914
4.427	55.490
4.427	55.950
4.428	56.641
4.428	57.332
4.468	58.597
5.486	50.062
5.448	52.826
5.448	53.171
5.449	53.631
5.409	54.092
5.410	54.668
5.410	55.013
5.449	55.358
5.371	56.395
5.411	57.200
5.451	57.890
5.451	58.466
5.451	58.926
5.452	59.962
6.472	55.686
6.434	59.140
6.435	59.946
6.435	60.637
6.435	60.982
6.436	61.442
6.436	62.133
6.437	63.860
7.537	62.806
7.499	63.727
7.499	64.188
7.499	65.108
7.499	65.569
7.500	65.914
7.421	66.376
7.421	66.721
7.422	67.182
7.422	67.412
7.422	67.872
7.422	68.103
7.462	69.138
7.542	71.208
7.503	73.281
7.504	74.893];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(17.35);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ZoriKec2013';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since hatch (yr), total length (cm) for males
1.525	28.449
1.491	29.600
1.491	30.060
2.525	28.811
2.526	30.307
2.526	30.653
2.492	31.228
2.458	31.918
2.458	32.263
2.458	32.839
2.458	33.184
2.493	33.990
2.493	34.336
2.493	34.681
2.493	34.911
2.494	35.256
2.494	35.602
2.494	35.602
2.494	35.832
2.494	36.177
2.494	36.408
2.494	36.523
2.494	36.753
2.460	37.788
2.460	37.443
2.460	38.134
2.495	38.940
2.462	40.896
3.530	38.727
3.427	39.876
3.427	40.452
3.427	40.912
3.462	41.488
3.462	41.834
3.462	42.064
3.497	42.525
3.497	42.870
3.497	43.100
3.497	43.676
3.497	44.251
3.498	45.518
3.498	46.208
3.499	46.669
3.499	47.359
3.499	48.395
4.531	41.851
4.531	42.887
4.463	43.922
4.498	45.419
4.567	46.226
4.533	46.686
4.499	47.376
4.500	48.987
4.500	49.217
4.500	50.369
4.535	50.945
4.535	52.211
4.467	52.900
4.467	54.051
4.467	54.397
4.502	55.318
5.500	49.234
5.466	51.881
5.502	54.529
5.434	58.096
6.537	54.891
6.469	58.574
6.470	59.725
6.505	61.107];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m  = C2K(17.35); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ZoriKec2013';
comment.tL_m = 'Data for males';

% length-weight for females (males are very similar)
data.LW = [ ... % total length (cm), wet weight (g)
26.279	16.727
26.977	22.329
28.605	17.620
29.535	22.281
28.372	24.175
28.140	26.987
28.605	28.850
29.535	30.704
30.000	26.952
32.558	24.097
33.256	27.827
32.558	27.840
31.628	29.729
31.628	34.408
30.930	34.421
30.233	38.177
31.860	39.083
31.860	42.826
34.186	36.232
34.651	31.544
36.512	32.445
37.209	37.111
37.907	38.970
35.814	41.816
34.884	40.898
34.186	44.654
33.488	44.667
33.488	50.282
33.023	52.163
36.047	46.491
36.744	46.478
37.674	46.461
39.070	46.435
39.767	50.165
38.140	51.131
36.512	51.162
36.047	54.914
35.349	52.119
34.186	54.013
35.116	56.803
35.116	63.353
34.186	64.307
35.116	67.097
32.558	75.567
37.442	75.476
37.442	67.989
38.605	63.288
37.674	58.626
38.605	56.737
40.465	57.638
41.628	57.617
43.023	57.590
42.326	64.154
41.163	65.112
40.465	65.125
40.465	68.868
39.767	68.881
39.535	71.693
38.605	74.518
37.674	81.086
38.605	83.876
39.302	86.671
40.465	81.034
41.163	77.278
42.326	72.577
43.488	67.876
44.186	74.414
45.116	80.011
44.186	81.900
43.023	82.858
42.558	85.674
41.628	85.691
41.163	90.379
40.465	93.200
40.465	96.943
41.860	96.917
43.721	92.203
43.953	86.584
45.581	86.553
46.279	86.540
47.674	92.129
47.674	100.552
46.977	95.885
45.349	95.916
44.651	97.801
43.721	99.690
42.791	100.643
41.860	105.340
43.023	109.997
43.721	107.176
44.419	105.292
45.581	103.398
46.744	105.248
48.140	103.350
47.907	101.483
50.233	100.504
50.000	111.738
48.605	111.764
47.674	113.653
46.512	113.675
45.116	116.509
44.651	120.261
43.953	120.274
43.953	125.889
45.349	125.862
46.744	121.157
48.372	121.127
49.535	119.233
50.233	122.028
50.930	122.015
51.860	123.869
52.791	128.531
53.023	132.270
52.326	135.090
51.628	129.488
50.930	130.437
49.767	129.523
49.070	126.729
47.907	127.686
47.674	133.306
46.744	131.451
45.814	133.340
45.581	133.345
44.884	132.422
45.349	139.900
44.884	143.652
45.814	145.506
46.744	142.681
47.442	137.989
48.837	139.835
49.535	140.757
49.535	136.078
51.860	142.586
52.791	143.504
53.256	138.816
54.186	146.285
55.349	139.713
51.628	147.269
50.465	147.291
49.070	149.189
48.140	149.206
47.209	149.223
47.209	151.095
47.907	156.697
46.977	161.394
45.581	158.612
57.209	149.972
56.744	161.211
54.651	159.378
55.814	161.228
54.419	164.062
53.256	158.468
53.256	153.789
53.721	150.973
52.791	150.991
51.395	151.017
48.837	144.514
49.767	162.277
50.465	159.457
51.163	163.187
51.860	171.596
50.465	173.494
48.605	169.785
47.442	172.615
48.837	175.396
49.535	180.998
56.744	170.569
55.814	174.330
54.651	175.287
53.023	175.318
53.256	181.864
51.860	180.955
51.860	182.826
51.860	185.634
52.791	190.295
52.791	194.975
52.326	198.727
51.628	201.547
50.930	202.496
50.233	202.509
49.767	198.774
57.907	179.906
57.907	187.392
56.977	185.538
56.047	189.299
55.814	195.854
57.442	195.823
59.070	205.151
57.907	209.852
56.279	208.011
55.116	205.225
53.721	202.444
52.558	208.080
51.628	212.777
53.488	212.742
54.419	219.276
55.814	215.506
56.744	217.360
57.907	219.210
58.605	222.941
59.767	224.790
58.372	230.432
57.442	228.577
55.581	228.612
54.884	229.561
54.186	224.895
53.488	227.715
52.791	230.536
52.558	234.284
52.558	239.899
54.186	237.997
55.581	233.291
56.744	236.077
57.674	236.060
59.302	233.222
60.930	242.549
62.326	248.138
59.535	248.191
59.070	252.878
57.907	251.029
57.442	247.294
57.209	242.619
55.349	242.654
55.349	248.269
54.419	252.030
54.419	256.709
55.349	261.370
55.349	268.857
56.744	268.831
57.209	262.272
58.605	270.668
59.302	265.040
60.698	265.014
61.628	262.189
62.326	262.176
64.186	271.499
62.326	273.406
62.093	279.961
60.930	280.918
61.163	284.657
59.767	279.069
59.070	276.274
57.209	286.603
59.070	294.991
57.209	296.897
58.605	307.165
56.512	308.140
62.093	296.806
63.953	285.541
63.953	308.001
64.884	312.663
60.930	308.057
60.930	314.608
61.628	316.467
62.326	320.197
61.163	328.641
59.302	328.676
58.140	325.890
58.605	320.267
63.488	332.341
64.419	336.067
62.791	339.841
62.326	343.593
62.093	349.212
59.767	347.384
62.093	356.699
63.256	345.447
64.651	347.293
65.116	356.642
66.512	356.616
66.977	362.222
62.791	364.172
64.186	366.954
65.116	368.808
66.512	373.461
65.814	376.282
67.442	383.738
60.465	370.767
61.628	374.488
62.326	379.154
63.488	381.940
63.488	392.234
59.767	381.074
71.395	398.637
70.000	395.856
68.140	404.313
68.605	396.818
66.512	405.279
63.721	410.011
64.884	415.604
66.279	417.449
67.442	420.235
68.372	417.410
67.442	424.914
65.349	426.825
65.349	435.248
64.419	451.174
64.419	460.532
72.093	452.902
72.093	481.913
68.837	470.744
68.372	480.111
67.442	484.807
69.070	510.980
70.930	519.368
73.256	532.426
75.349	563.269
71.163	568.026
73.721	639.102];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'ZoriKec2013';
comment.LW = 'Data for females, butmales are very similar'; 

% length-fecundity
data.LN = [ ... % total length (cm), eggs #
37.575	539.216
37.711	318.627
38.016	367.647
37.948	612.745
38.050	808.824
38.151	931.373
38.524	784.314
38.795	955.882
38.998	931.373
39.168	735.294
39.168	588.235
38.965	392.157
39.473	710.784
39.371	931.373
39.642	1029.412
39.880	1225.490
40.015	1495.098
39.812	784.314
40.117	857.843
39.913	392.157
39.778	563.725
40.286	735.294
40.591	612.745
40.930	1053.922
41.201	857.843
41.675	367.647
41.913	563.725
42.285	833.333
42.082	1004.902
42.252	1250.000
42.692	1200.980
42.963	490.196
42.963	833.333
43.438	955.882
43.709	1102.941
44.115	1102.941
44.217	980.392
44.251	686.275
43.878	857.843
43.844	514.706
44.725	759.804
44.861	1053.922
44.928	1470.588
45.200	1127.451
45.437	1176.471
45.606	1004.902
45.877	857.843
46.318	833.333
46.962	1470.588
46.928	1838.235
47.470	1151.961
47.741	759.804
48.656	1004.902
49.063	955.882
48.690	1323.529
49.300	2230.392
50.282	2450.980
51.163	2475.490
50.011	1176.471
50.045	1004.902
51.502	1200.980
52.485	1568.627
52.451	2107.843
52.756	2475.490
53.908	1740.196
55.196	2132.353
62.549	3774.510
63.125	2083.333
64.447	2377.451
64.311	2647.059
64.074	3014.706
66.141	3308.824
73.731	4730.392];
units.LN = {'g', '#'}; label.LN =  {'wet weight', 'fecundity'};  
temp.LN = C2K(17);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'ZoriKec2013';

% weight-fecundity
data.WN = [ ... % wet weight (g), eggs #
30.360	750.034
53.380	316.178
57.010	461.251
55.212	581.952
58.402	847.781
63.823	799.690
69.209	365.124
71.488	558.453
70.594	679.190
75.994	389.552
77.826	655.326
74.675	800.127
73.342	1065.774
75.179	1379.857
80.122	1041.892
84.181	921.282
84.211	1259.448
88.728	1211.321
93.256	1283.967
93.245	1163.193
93.219	873.337
96.356	559.454
87.765	559.108
90.015	438.426
102.682	511.399
103.160	801.274
100.473	1091.021
109.068	1139.676
112.675	1019.048
113.555	753.383
120.374	1164.285
121.753	1405.887
127.187	1502.724
122.157	874.502
124.437	1091.985
124.400	681.356
131.641	754.111
135.726	923.358
141.612	1020.213
138.910	1140.877
143.941	1769.099
158.019	2445.994
167.044	2253.121
156.099	1214.033
168.318	1335.298
168.735	948.841
179.726	2495.177
182.304	997.696
196.785	1143.207
195.018	1602.073
195.964	2061.048
198.714	2471.787
209.085	2158.195
223.971	1772.321
333.420	2090.737
358.319	2429.903
368.740	2671.869
371.033	3034.280
365.217	3710.374
426.217	3278.047
532.151	4731.587];
units.WN = {'g', '#'}; label.WN =  {'wet weight', 'fecundity'};  
temp.WN = C2K(17);  units.temp.WN = 'K'; label.temp.WN = 'temperature'; 
bibkey.WN = 'ZoriKec2013';

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
set1 = {'tL_f','tL_m'};
subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Birth is assumed to coincide with hatch due to lack of data';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '68GF7'; % Cat of Life
metaData.links.id_ITIS = '165594'; % ITIS
metaData.links.id_EoL = '46566886'; % Ency of Life
metaData.links.id_Wiki = 'Belone_belone'; % Wikipedia
metaData.links.id_ADW = 'Belone_belone'; % ADW
metaData.links.id_Taxo = '44420'; % Taxonomicon
metaData.links.id_WoRMS = '126375'; % WoRMS
metaData.links.id_fishbase = 'Belone-belone'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Belone_belone}}';
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
bibkey = 'ZoriSino2011'; type = 'Article'; bib = [ ... 
'author = {Zorica, B. and Sinovcic, G. and Kec, V. C.}, ' ... 
'year = {2011}, ' ...
'title = {The reproductive cycle, size at maturity and fecundity of garfish (\emph{Belone belone}, {L}. 1761) in the eastern {A}driatic {S}ea}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {65}, ' ...
'pages = {435-444}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZoriKec2013'; type = 'Article'; bib = [ ... 
'author = {Zorica, B. and Kec, V. C.}, ' ... 
'year = {2013}, ' ...
'title = {Age, growth and mortality of the garfish, \emph{Belone belone} ({L}. 1761) in the eastern {A}driatic {S}ea}, ' ...
'journal = {J. Mar. Biol. Assoc.}, ' ...
'volume = {93}, ' ...
'pages = {365--372}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DulcBazd2009'; type = 'Article'; bib = [ ... 
'author = {Dulcic, J. and Bazdaric, B. and Grubisic, L. and Tutman, P. and  Dragicevic, B.}, ' ... 
'year = {2009}, ' ...
'title = {Embryonic and larval development of garpike from the {A}driatic {S}ea}, ' ...
'journal = {Integrative Zoology}, ' ...
'volume = {4}, ' ...
'pages = {272--276}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Belone-belone.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
