function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_asterias
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_asterias'; 
metaData.species_en = 'Starry  smooth-hound'; 

metaData.ecoCode.climate = {'MC','MB'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.1); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data;
data.ab = 1.8*365; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(10.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v around 0.3 cm/d';
data.am = 18.3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FarrMari2010';   
  temp.am = C2K(10.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 33;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'FarrMari2010';
data.Lp = 80;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
data.Lpm = 75; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'guess';
data.Li  = 140;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Ri  = 12/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7-15 pups per litter, 1 litter per 2 yr assumed, based on ab';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	43.371
0.981	47.416
0.981	46.742
0.998	43.820
1.031	51.236
1.978	65.393
1.995	64.494
2.012	44.270
2.012	45.843
2.012	48.315
2.012	50.787
2.012	67.640
2.012	68.989
2.029	52.809
2.029	54.382
2.029	55.730
2.029	59.551
2.976	72.360
2.976	61.798
2.976	60.674
2.976	59.551
2.976	51.910
3.010	67.416
3.010	65.169
3.010	63.596
3.010	56.854
3.940	89.888
3.957	61.573
3.957	64.270
3.957	65.843
3.957	67.865
3.957	69.438
3.957	71.236
3.957	72.809
3.957	78.427
3.973	75.730
3.973	79.101
3.990	88.539
4.007	83.371
4.954	91.910
4.971	92.809
4.971	78.876
4.971	77.079
4.971	74.607
4.971	72.809
4.971	71.685
4.971	70.562
4.971	67.416
4.988	89.888
5.005	88.764
5.005	87.865
5.005	86.517
5.005	85.843
5.005	84.045
5.005	81.798
5.952	84.944
5.952	96.854
5.969	81.573
5.986	74.157
6.002	69.888
6.002	88.315
6.002	92.809
6.036	77.303
7.000	84.494
7.000	82.697
7.017	93.708
7.017	92.360
7.017	91.236
7.017	86.517
7.034	103.820
7.964	81.348
7.981	82.921
7.981	97.303
7.981	101.348
7.981	105.393
7.981	106.742
7.981	111.461
7.998	86.966
7.998	91.011
7.998	93.708
8.995	99.775
8.995	87.191
9.012	93.708
9.993	111.910
11.007	103.371
11.024	106.292
13.019	108.090];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(10.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FarrMari2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	35.506
0.981	51.910
0.998	55.730
1.911	56.404
1.978	55.281
1.978	48.090
1.995	71.910
1.995	73.034
2.012	62.921
2.925	77.528
2.942	53.933
2.993	79.551
2.993	55.506
3.010	74.157
3.010	69.438
3.973	61.124
3.990	80.674
3.990	93.708
3.990	72.809
4.007	76.180
4.971	80.000
4.971	81.348
4.971	84.045
4.971	78.652
5.005	65.393
5.005	69.888
5.005	93.933
6.002	77.753
6.036	89.888
6.053	82.472
6.053	86.517
6.983	80.225
6.983	82.472
7.000	78.652
7.000	86.966
7.000	90.787
7.017	77.079
7.017	95.730
7.998	85.169
7.998	90.112
9.012	91.011
9.012	93.034
10.043	89.213
10.060	100.000
11.988	103.596
13.002	88.315];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(10.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FarrMari2010';
comment.tL_m = 'Data for males';

% time - weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0.000	271.960
0.991	484.797
1.007	402.027
1.022	248.311
1.965	295.608
1.966	886.825
1.981	366.554
1.981	638.514
1.997	697.635
1.997	744.932
2.012	520.271
2.014	1005.068
2.014	1123.311
2.987	496.622
2.987	685.811
2.988	981.419
2.988	1076.014
2.988	1253.379
2.988	1288.852
3.003	768.581
3.003	839.527
3.003	910.473
3.981	2388.514
3.981	2483.108
3.993	1052.365
3.994	1430.744
3.995	1619.933
3.995	1714.527
3.995	1820.946
4.009	957.770
4.025	1123.311
4.029	2719.595
4.040	780.405
4.041	1241.554
4.041	1336.149
4.972	2849.662
4.984	1182.433
4.984	1277.027
4.985	1631.757
4.985	1927.365
4.988	2967.905
5.000	1347.973
5.000	1466.217
5.001	2010.135
5.001	2069.257
5.002	2554.054
5.003	2707.771
5.018	2293.919
5.018	2364.865
5.032	1750.000
5.049	2423.986
5.051	3251.689
5.989	1206.081
5.991	2033.784
5.994	3228.041
6.006	1785.473
6.008	2660.473
6.023	2163.852
6.037	1312.500
6.041	3393.581
6.982	2423.986
7.014	2695.946
7.029	2199.325
7.030	2956.081
7.033	4020.270
7.044	2045.608
7.078	3358.108
7.955	1998.311
7.980	6255.068
7.989	3192.568
7.989	3287.162
7.990	3511.824
8.003	2116.554
8.003	2246.622
8.019	2660.473
8.023	4256.757
8.040	5013.514
8.995	3097.973
9.029	4623.311
9.056	2483.108
10.022	5569.257
11.009	4540.541
11.010	5108.108
13.039	6018.581];
data.tWw_f(:,1) = data.tWw_f(:,1)*365; % % convert yr to d
n=size(data.tWw_f,1); for i=2:n; if data.tWw_f(i,1)<=data.tWw_f(i-1,1); data.tWw_f(i,1)=data.tWw_f(i-1,1)+1e-3; end; end
units.tWw_f = {'d', 'g'};     label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(10.1);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'FarrMari2010';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0.000	130.068
0.991	319.257
1.022	378.378
1.023	662.162
1.949	390.203
2.013	733.108
2.013	815.878
2.014	1158.784
2.014	1347.973
2.014	1407.095
2.989	1407.095
3.018	591.216
3.099	1619.933
3.980	2128.379
3.980	2282.095
4.025	1076.014
4.025	1253.379
4.983	1052.365
4.986	2187.500
4.999	969.595
5.016	1750.000
5.991	1915.541
5.994	3298.987
6.039	2565.879
6.069	1702.703
6.967	2802.365
6.996	1572.635
6.997	2317.568
7.027	1655.406
7.028	1868.243
7.028	1915.541
7.060	2069.257
7.972	2388.514
8.003	2506.757
8.020	2944.257
8.994	2802.365
9.024	2364.865
9.983	2412.162
10.050	4067.567
12.076	3736.487
13.047	2518.581];
data.tWw_m(:,1) = data.tWw_m(:,1)*365; % % convert yr to d
n=size(data.tWw_m,1); for i=2:n; if data.tWw_m(i,1)<=data.tWw_m(i-1,1); data.tWw_m(i,1)=data.tWw_m(i-1,1)+1e-3; end; end
units.tWw_m = {'d', 'g'};     label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(10.1);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'FarrMari2010';
comment.tWw_m = 'Data for males';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
33.140	123.865
35.475	83.719
36.059	104.088
37.520	165.146
39.857	246.622
40.002	206.105
41.025	246.819
42.047	246.992
42.779	449.818
43.215	307.999
44.091	308.147
44.822	348.811
46.281	349.058
47.012	409.992
47.157	349.206
48.910	410.313
49.202	410.362
49.932	471.296
50.516	471.395
51.101	532.305
52.853	573.141
53.438	613.780
54.168	593.633
54.607	715.329
55.774	654.716
56.943	715.724
57.381	715.798
58.550	837.617
59.279	716.118
59.718	858.084
60.155	797.348
61.178	858.331
61.616	817.865
62.347	959.880
63.076	858.651
64.829	980.569
65.559	960.422
65.561	1163.126
65.995	798.334
66.436	1021.381
67.166	1062.045
67.167	1163.397
67.896	1062.169
68.043	1123.004
68.051	1791.924
70.088	1224.701
70.097	1954.432
70.671	1184.259
71.839	1164.186
71.987	1387.184
73.010	1407.627
73.884	1265.883
74.176	1306.473
74.911	1712.003
75.064	2299.866
75.347	1509.373
76.516	1610.922
76.809	1712.323
77.833	1874.658
77.976	1631.439
78.412	1489.621
79.149	2077.583
80.022	1854.758
80.895	1571.121
80.898	1814.365
81.629	1895.569
81.771	1611.810
82.065	1774.021
82.509	2220.042
82.953	2726.874
83.238	2199.895
83.238	2199.895
83.382	2058.028
83.680	2504.024
83.681	2585.105
84.260	2179.798
84.428	3963.610
84.994	2544.787
85.145	2970.488
86.013	2301.715
86.313	2970.685
86.605	2950.464
86.895	2808.621
87.032	2058.644
87.046	3193.782
87.335	2930.317
87.493	3943.857
87.619	2301.987
87.621	2484.419
88.061	2646.656
88.065	2970.981
88.362	3376.436
88.649	2950.809
88.781	1795.426
88.790	2585.968
88.801	3437.322
88.949	3660.319
89.522	2748.254
89.827	3802.359
89.829	3923.981
90.106	2748.352
90.115	3437.544
90.400	2870.024
90.700	3579.535
90.845	3478.207
92.018	3863.541
92.158	3377.078
92.595	3316.341
92.891	3640.715
93.170	2627.249
93.191	4309.685
93.323	3194.842
93.755	2667.888
94.053	3154.424
94.203	3478.775
94.353	3803.124
94.633	2830.198
94.780	2951.845
94.791	3803.198
95.669	3985.779
95.822	4614.183
95.833	5465.537
96.100	3438.555
96.120	5060.180
96.400	4127.795
97.411	3215.803
97.574	4573.938
97.855	3702.365
98.173	5810.526
98.448	4452.464
99.037	4837.699
99.043	5344.457
99.174	4087.722
99.325	4533.694
99.331	5020.181
99.907	4351.359
99.913	4858.117
100.047	3905.437
100.062	5141.926
100.067	5567.603
100.494	4655.513
101.220	4311.041
101.234	5446.179
101.354	3297.550
101.368	4493.499
101.963	5405.761
101.965	5567.924
101.967	5669.275
101.972	6155.763
102.825	4209.960
102.976	4635.662
102.990	5791.070
103.124	4818.119
103.126	4939.741
103.133	5588.391
103.135	5689.743
103.137	5851.906
103.845	4047.971
103.994	4352.050
103.998	4615.564
103.999	4777.727
104.155	5548.023
104.157	5730.456
104.735	5223.797
104.882	5345.443
105.171	5041.438
105.189	6561.711
105.323	5609.032
105.342	7169.845
105.756	5142.888
105.892	4311.830
105.900	5001.020
107.511	5406.698
108.395	6075.766
108.403	6764.957
108.970	5325.864
108.972	5548.837
108.973	5589.378
109.108	4656.968
109.121	5751.565
109.867	7048.988
110.016	7373.338
110.018	7474.689
110.174	8305.797
110.447	6724.762
110.880	6359.970
111.035	7109.996
112.039	5589.896
112.051	6623.681
112.804	8529.214
113.797	6137.490
117.911	8307.104
120.095	7861.527
124.228	11571.684];
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'total length', 'wet weight', 'female'};  
bibkey.LWw_f = 'FarrMari2010';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
27.884	82.436
30.219	42.291
32.264	123.717
33.140	144.136
34.309	184.873
35.331	205.316
38.981	246.474
40.586	226.475
41.317	246.868
42.485	287.606
43.362	389.106
43.945	308.123
44.530	348.762
45.697	288.148
45.990	409.820
47.010	268.100
47.158	430.287
47.304	389.771
48.035	491.247
49.056	390.067
49.058	552.230
49.786	451.001
50.808	430.904
51.102	572.845
51.830	451.346
51.831	552.698
52.853	552.871
53.145	552.920
53.730	634.100
54.314	593.658
54.897	553.216
55.920	654.740
56.069	877.738
56.212	634.520
56.214	776.412
56.651	695.404
57.818	655.061
57.966	796.978
58.694	695.749
59.426	797.224
59.717	736.462
60.301	777.102
60.886	817.741
61.471	919.192
61.763	919.241
63.513	797.915
63.953	939.881
64.975	1000.864
65.997	980.767
66.001	1264.551
66.582	1021.406
66.873	1021.455
67.602	879.686
67.898	1224.331
68.771	1021.776
68.772	1082.587
69.797	1326.003
69.940	1103.054
70.380	1245.020
70.818	1245.094
71.552	1630.354
71.985	1164.211
72.133	1387.209
73.011	1488.708
73.446	1245.538
73.447	1346.890
74.177	1407.824
74.763	1549.815
75.051	1205.269
75.345	1387.751
75.789	1874.313
76.223	1550.061
76.224	1671.683
77.393	1732.692
77.681	1408.416
77.975	1530.087
78.560	1631.537
78.708	1793.724
79.292	1834.364
79.302	2665.447
79.436	1692.497
80.176	2483.162
80.753	1956.232
80.755	2118.395
80.899	1895.446
81.628	1855.029
81.630	2037.462
81.783	2584.785
82.066	1875.373
82.360	1997.044
82.370	2848.397
82.955	2929.577
83.237	2078.273
84.549	1977.144
84.550	2058.225
84.701	2402.845
85.429	2261.076
86.161	2423.362
86.170	3153.093
86.886	2078.890
86.889	2301.863
87.031	1937.022
87.034	2241.077
87.324	2038.423
88.059	2443.953
88.069	3295.306
88.493	2180.513
88.498	2565.649
89.226	2363.069
89.665	2505.035
89.959	2687.517
90.110	3032.138
90.246	2201.079
90.832	2444.421
90.977	2302.554
91.128	2748.525
91.443	4674.255
91.857	2627.027
92.013	3458.135
92.151	2829.779
92.441	2647.396
92.445	3032.532
93.021	2323.169
93.034	3397.496
93.761	3194.916
94.338	2627.446
94.342	2931.501
94.783	3174.819
94.928	3073.492
95.228	3722.191
95.229	3864.083
95.800	2810.126
96.829	3398.137
96.975	3337.351
97.116	2931.969
97.998	3418.604
100.196	4128.436
101.789	3074.651
101.812	4980.060
101.820	5628.710
102.698	5831.561
102.963	3581.606
103.695	3743.892
103.994	4352.050
105.755	5102.348
105.758	5345.591
108.973	5609.648];
units.LWw_m = {'cm', 'g'};     label.LWw_m = {'total length', 'wet weight', 'male'};  
bibkey.LWw_m = 'FarrMari2010';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

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
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LWw_f','LWw_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 0 - 350 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00200 * (TL in cm)^3.11';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '44QZS'; % Cat of Life
metaData.links.id_ITIS = '160240'; % ITIS
metaData.links.id_EoL = '46559983'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_asterias'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_asterias'; % ADW
metaData.links.id_Taxo = '41950'; % Taxonomicon
metaData.links.id_WoRMS = '105821'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-asterias'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_asterias}}';  
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
bibkey = 'FarrMari2010'; type = 'article'; bib = [ ... 
'author = {Edward D. Farrell and Stefano Mariani and Maurice W. Clarke}, ' ...
'year = {2010}, ' ...
'title  = {Age and growth estimates for the starry smoothhound (\emph{Mustelus asterias}) in the {N}ortheast {A}tlantic {O}cean}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {67}, ' ...
'pages = {931-939}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-asterias.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

