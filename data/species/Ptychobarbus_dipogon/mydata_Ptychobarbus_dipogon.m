  function [data, auxData, metaData, txtData, weights] = mydata_Ptychobarbus_dipogon
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Ptychobarbus_dipogon'; 
metaData.species_en = 'Brahmaputra barbal'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 15];

%% set data
% zero-variate data
data.tp = 13*365;      units.tp = 'd';  label.tp = 'age at puberty for females';  bibkey.tp = 'LiuLiu2018';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 13.5*365;      units.tpm = 'd';  label.tpm = 'age at puberty for males';  bibkey.tpm = 'LiuLiu2018';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 44*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'LiChen2009';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 36;    units.Lp = 'cm'; label.Lp = 'std length at puberty for females'; bibkey.Lp = 'LiuLiu2018';
data.Lpm = 35.4;    units.Lpm = 'cm'; label.Lpm = 'std length at puberty for males'; bibkey.Lpm = 'LiuLiu2018';
data.Li = 64.4;    units.Li = 'cm'; label.Li = 'ultimate std length for females';            bibkey.Li = 'fishbase';

data.Wwb = 2.5e-2;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'LiuLiu2018';
  comment.Wwb = 'based on egg diameter of 3.63 mm: pi/6*0.363^3';
data.Wwi = 2.2e3;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';               bibkey.Wwi = 'fishbase';
 
% univariate data

% time-length-weight
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.027	7.790
2.067	6.902
2.108	8.579
2.109	10.060
3.082	13.609
3.122	12.623
3.161	11.241
3.163	14.892
3.164	16.175
3.972	14.396
3.976	20.811
4.017	21.896
4.055	18.047
4.094	16.074
4.095	17.258
4.097	20.317
4.136	18.935
4.948	23.769
4.950	25.545
4.993	30.775
5.025	17.453
5.026	18.735
5.028	22.288
5.031	26.235
5.070	24.952
5.110	23.275
5.195	29.393
5.229	20.116
5.959	23.667
6.001	26.825
6.003	28.404
6.039	23.173
6.040	24.259
6.041	25.344
6.043	27.910
6.044	29.390
6.085	30.278
6.125	30.772
6.167	32.153
6.970	24.157
6.972	27.019
7.013	28.598
7.015	31.263
7.016	32.940
7.050	22.578
7.055	30.572
7.056	32.151
7.059	36.394
7.092	25.539
7.093	26.229
7.095	29.387
7.134	27.808
7.139	35.407
7.902	28.102
7.981	25.339
8.026	31.358
8.027	32.740
8.065	29.582
8.109	33.924
8.112	39.055
8.150	35.207
8.151	36.983
8.154	40.733
8.154	41.621
8.156	44.286
8.191	36.193
8.955	29.777
8.994	28.099
8.997	31.849
8.999	35.402
9.002	39.349
9.037	31.257
9.076	29.086
9.078	32.835
9.079	33.625
9.079	34.414
9.081	37.474
9.115	27.013
9.120	34.908
9.122	38.164
9.202	36.585
10.944	42.304
10.983	40.330
11.023	39.343
11.026	43.981
11.030	49.902
11.031	50.889
11.059	32.139
11.061	35.297
11.099	31.448
11.101	34.902
11.264	37.665
11.997	44.965
12.002	51.873
12.032	36.182
12.113	37.070
12.113	37.761
12.117	42.794
13.010	47.923
13.045	40.620
13.087	42.988
13.088	43.778
13.127	42.593
13.133	50.982
13.206	39.435
14.015	39.433
14.016	40.913
14.017	43.084
14.056	40.025
14.058	43.578
15.066	39.529
15.068	41.996
15.107	41.107
15.109	42.884
16.000	45.743
16.001	47.519
16.086	52.749
16.203	46.729
17.053	48.799
17.139	56.694
18.019	42.086
18.059	41.296
18.106	50.770
18.997	54.320
19.034	49.089
19.035	50.175
19.039	56.293
19.155	47.806
20.042	43.856
20.084	47.113
22.109	51.548
22.997	49.966
23.044	59.440
23.077	48.880
23.122	54.999
24.002	42.266
24.008	49.865
24.010	53.911
24.130	51.048
25.016	46.013
25.140	50.848
28.053	54.590
28.088	46.497
29.066	57.449
32.094	51.223];
data.tL_f (:,1) = (.5 + data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females';
bibkey.tL_f = 'LiChen2009';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
5.028	21.499
5.109	22.880
5.152	25.840
5.232	24.853
5.881	27.516
5.919	23.667
5.957	20.114
5.996	18.634
5.996	19.226
6.041	25.739
6.084	29.292
6.125	29.982
6.162	24.653
6.169	35.903
6.888	23.171
6.931	26.329
6.934	30.967
7.057	32.644
7.094	28.302
7.098	34.322
7.986	31.556
7.989	35.799
8.030	37.082
8.064	28.200
8.067	32.937
8.106	30.766
8.109	34.121
8.109	34.713
8.113	41.128
8.194	40.437
8.267	29.680
8.953	27.902
8.965	44.283
8.965	45.270
9.034	26.717
9.035	28.888
9.080	35.204
9.081	37.079
9.117	30.072
9.122	38.164
9.125	41.914
9.966	31.353
9.967	31.945
10.008	33.622
10.014	41.517
10.050	34.708
10.094	40.727
10.096	42.997
10.129	32.832
10.219	45.661
10.978	31.843
10.978	32.337
10.980	34.804
11.869	34.900
11.992	37.959
12.031	35.886
12.110	32.037
12.153	36.873
13.124	37.758
13.851	35.782
13.978	45.255
14.013	36.769
14.139	43.479
14.139	43.972
14.981	33.707
15.187	38.838
15.351	42.192
16.038	42.585
16.039	43.572
16.242	45.644
17.048	40.904
17.090	43.371
18.021	45.638
22.991	41.479
24.045	46.213];
data.tL_m (:,1) = (.5 + data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m= 'temperature';
comment.tL_m = 'Data for males';
bibkey.tL_m = 'LiChen2009';

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
7.063	5.236
7.504	-8.143
7.651	2.534
8.091	2.510
8.385	7.837
9.339	-2.899
10.294	5.064
11.028	2.353
12.276	10.300
12.570	7.613
12.790	7.602
13.818	7.547
14.258	15.536
14.626	26.201
15.066	28.849
15.286	18.153
15.433	20.816
15.727	26.142
16.094	36.807
16.167	20.777
16.608	36.780
16.902	26.080
17.709	39.392
17.856	28.700
18.150	36.698
18.223	42.036
18.443	47.366
18.884	39.329
19.031	44.664
19.398	52.658
19.765	39.282
20.059	44.609
20.352	57.949
20.352	57.949
20.866	68.606
21.307	55.227
21.821	52.528
21.894	73.893
22.041	65.872
22.482	92.560
22.775	73.846
23.289	87.174
23.436	89.837
24.464	108.480
24.464	81.769
24.537	100.463
25.345	119.118
25.932	103.060
26.446	135.086
26.593	137.749
27.107	111.010
27.401	145.719
27.548	148.382
27.988	175.070
28.355	129.641
28.649	212.430
28.796	191.054
28.796	132.289
28.796	142.974
29.236	196.372
29.310	145.617
29.530	177.659
29.897	223.048
29.971	164.280
30.264	201.660
30.485	193.635
30.631	231.022
30.999	228.332
31.292	252.356
31.439	225.637
31.512	271.042
31.586	188.233
31.733	198.910
32.394	276.337
32.614	212.219
32.907	209.532
33.054	281.644
33.495	276.278
33.789	252.223
34.009	316.318
34.229	238.844
34.376	308.285
34.596	300.260
35.110	241.468
35.404	284.190
35.624	268.151
35.771	326.908
35.844	313.549
35.844	326.904
35.991	308.198
36.138	297.506
36.358	350.917
36.432	388.308
36.579	281.456
36.799	300.142
37.019	449.713
37.093	372.246
37.533	417.632
37.606	332.152
37.974	366.857
38.047	393.564
38.488	353.474
38.561	470.999
38.561	380.181
38.781	452.290
39.295	519.040
39.295	398.840
39.589	484.300
39.589	468.273
39.589	390.811
39.956	551.058
40.176	486.940
40.250	510.976
40.543	473.565
40.617	500.272
40.690	529.650
40.690	446.846
40.837	510.945
40.910	484.229
40.984	548.332
41.057	457.510
41.204	492.227
41.278	526.948
41.278	452.156
41.424	556.322
41.571	476.181
41.645	505.559
41.718	583.018
41.718	569.662
41.791	481.511
41.791	564.316
42.232	497.514
42.379	513.533
42.526	457.432
43.040	548.223
43.040	532.196
43.113	673.761
43.186	577.597
43.480	612.306
43.921	665.705
43.921	636.322
43.921	596.256
44.214	577.542
44.435	721.771
44.508	625.607
44.655	641.625
44.802	737.778
45.242	700.359
45.756	681.633
45.903	721.692
46.123	735.036
46.270	612.157
46.490	633.514
46.490	665.567
47.004	873.887
47.078	745.670
47.518	823.109
47.812	775.013
48.032	836.437
48.253	828.412
48.253	791.016
48.546	831.067
48.840	887.145
48.913	807.007
49.134	841.720
49.794	855.040
49.794	876.409
49.941	1095.433
50.015	814.962
50.602	1047.318
50.602	871.024
50.822	1009.910
50.896	1114.080
51.043	796.209
51.116	1175.504
51.410	911.048
51.630	1052.605
51.997	1151.417
53.025	1300.945
53.025	1258.207
54.126	1322.255
54.273	1239.442
54.934	1263.447
54.934	1113.864
56.402	1076.390
56.549	1212.609
56.916	1426.279
57.430	1348.789
59.266	1233.833];
units.LW_f = {'cm', 'g'}; label.LW_f  = {'total length', 'wet weight', 'females'};  
bibkey.LW_f = 'LiChen2009';
%
data.LW_m = [ ...  % total length (cm), wet weight (g)
28.869	175.023
29.163	148.296
29.750	273.807
30.485	206.990
31.733	172.199
31.953	252.321
32.247	246.963
32.761	278.989
33.128	313.694
34.009	316.318
34.229	225.488
34.596	244.166
34.816	342.986
34.963	289.556
35.037	356.330
35.184	361.664
35.404	326.928
36.211	390.991
36.505	326.869
36.505	300.158
37.386	374.902
37.533	447.014
37.533	428.316
38.781	412.223
38.928	374.820
39.148	462.955
39.369	409.521
39.442	462.939
40.103	521.668
40.250	564.398
40.396	551.035
40.617	569.721
40.690	444.174
41.204	524.281
41.424	452.149
41.498	572.345
42.012	641.767
42.379	582.982
42.526	612.357
42.966	668.427
43.040	529.525
43.333	631.012
45.022	638.935
45.242	585.501
45.463	646.925
45.536	844.583
46.344	724.340
46.637	670.902
46.858	772.393
49.207	844.387
49.721	857.715];
units.LW_m = {'cm', 'g'}; label.LW_m  = {'total length', 'wet weight', 'males'};  
bibkey.LW_m = 'LiChen2009';

% length-fecundity
data.LN = [ ...
31.986	3995.740
35.628	2980.093
36.237	2368.588
36.616	2298.432
36.619	1844.564
36.847	1530.150
37.368	3275.331
37.752	2384.722
37.902	2716.262
37.980	2209.960
37.983	1668.810
38.247	1965.338
38.319	2680.986
38.325	1424.122
38.582	3047.340
38.889	2261.535
38.893	1458.539
38.967	1877.427
39.304	2575.388
39.498	1650.031
39.610	2033.974
39.760	2278.231
39.871	2871.651
39.941	3936.428
40.511	3586.803
40.589	3097.956
40.854	3097.725
40.928	3534.070
40.933	2591.422
41.158	2887.983
41.202	1788.195
41.225	4528.823
41.314	2137.224
41.383	3428.935
41.580	1997.341
41.955	2677.812
42.399	4632.536
42.591	4056.308
43.231	4928.569
43.284	2030.767
43.551	1751.232
43.582	2990.606
43.689	4195.001
43.838	4613.824
44.080	1977.703
44.678	3426.058
45.042	6131.476
45.618	4769.378
45.932	2621.971
46.405	6374.676
46.417	4035.513
46.875	3459.053
47.253	3563.462
47.711	2864.807
48.583	2829.134
48.969	1502.114
50.016	3945.090];
data.LN(:,1) = data.LN(:,1) * 95/88; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LiuLiu2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.tp = 0 * weights.tp;
weights.tpm = 0 * weights.tpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic species found only in the middle reaches of the Yarlung Tsangpo River';
metaData.bibkey.F1 = 'LiChen2009'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Q9VX'; % Cat of Life
metaData.links.id_ITIS = '689770'; % ITIS
metaData.links.id_EoL = '217812'; % Ency of Life
metaData.links.id_Wiki = 'Ptychobarbus_dipogon'; % Wikipedia
metaData.links.id_ADW = 'Ptychobarbus_dipogon'; % ADW
metaData.links.id_Taxo = '185519'; % Taxonomicon
metaData.links.id_WoRMS = '1018515'; % WoRMS
metaData.links.id_fishbase = 'Ptychobarbus-dipogon'; % fishbase

%% References
bibkey = 'LiChen2009'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-008-9371-5}, ' ...
'author = {Xiuqi Li and Yifeng Chen}, ' ...
'year = {2009}, ' ...
'title = {Age structure, growth and mortality estimates of an endemic \emph{Ptychobarbus dipogon} ({R}egan, 1905) ({C}yprinidae: {S}chizothoracinae) in the {L}hasa {R}iver, {T}ibet}, ' ... 
'journal = {Environ Biol Fish}, ' ...
'volume = {86}, '...
'pages = {97–105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiuLiu2018'; type = 'Article'; bib = [ ... 
'doi = {10.7541/2018.143}, ' ...
'author = {Liu, Hai-Ping and Liu, Yan-Chao and Liu, Shu-Yun and Song, Xiao-Guang and Tsering, Luo-Jie and Liu, Meng-Jun and Liu, Le-Le and Rao, Chang-Wei}, ' ...
'year = {2018}, ' ...
'title = {FECUNDITY AND REPRODUCTIVE STRATEGY OF \emph{Ptychobarbus dipogon} POPULATIONS FROM THE MIDDLE REACHES OF THE {Y}ARLUNG {Z}ANGBO {R}IVER}, ' ... 
'journal = {Acta Hydrobiologica Sinica}, ' ...
'volume = {42(6)}, '...
'pages = {1169-1179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ptychobarbus-dipogon}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
