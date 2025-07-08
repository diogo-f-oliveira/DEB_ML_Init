function [data, auxData, metaData, txtData, weights] = mydata_Heterodontus_portusjacksoni

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Heterodontiformes'; 
metaData.family     = 'Heterodontidae';
metaData.species    = 'Heterodontus_portusjacksoni'; 
metaData.species_en = 'Port Jackson shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.8); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 20];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 


%% set data
% zero-variate data;
data.ab = 365; units.ab = 'd';      label.ab = 'age at birth';               bibkey.ab = 'ADW';    
  temp.ab = C2K(16.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap_f = 12.5*365; units.ap_f = 'd'; label.ap_f = 'age at puberty';           bibkey.ap_f = 'Austr_Museum';
  temp.ap_f = C2K(16.8);  units.temp.ap_f = 'K'; label.temp.ap_f = 'temperature';
data.ap_m = 9*365; units.ap_m = 'd';    label.ap_m = 'age at puberty';           bibkey.ap_m = 'Austr_Museum';
  temp.ap_m = C2K(16.8); units.temp.ap_m = 'K'; label.temp.ap_m = 'temperature';
data.am = 33*365;  units.am = 'd';      label.am = 'life span';                  bibkey.am = 'Ramo2007';   
  temp.am = C2K(16.8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'AnAge for Heterodontus galeatus gives 12 yr, but this is shorter than ap!';

data.Lb  = 20;     units.Lb  = 'cm';    label.Lb  = 'fork length at birth';     bibkey.Lb  = 'Ramo2007';
data.Lp_f  = 0.917*73.5; units.Lp_f  = 'cm';  label.Lp_f  = 'fork length at puberty'; bibkey.Lp_f  = 'ADW';
  comment.Lp_f = 'ADW: 64-83 cm TL';
data.Lp_m  = 0.917*65;   units.Lp_m  = 'cm';  label.Lp_m  = 'fork length at puberty'; bibkey.Lp_m  = 'ADW';
  comment.Lp_m = 'ADW: 50-80 cm TL';
data.Li_f  = 0.917*165; units.Li_f  = 'cm';  label.Li_f  = 'ultimate fork length';   bibkey.Li_f  = 'EoL';
data.Li_m  = 0.917*165; units.Li_m  = 'cm';  label.Li_m  = 'ultimate fork length';   bibkey.Li_m  = 'EoL';

data.Ri  = 13/365; units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(16.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'ADW: 10 -16 per clutch';

% uni-variate data at f
% time-length
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.128	24.734
0.128	29.620
0.128	32.673
0.171	19.239
0.256	21.377
0.256	23.820
1.066	37.876
1.066	40.930
1.066	44.899
1.620	33.303
1.790	38.191
1.876	45.215
2.004	44.300
2.046	45.217
2.089	49.798
2.089	52.240
2.217	39.418
2.259	42.777
2.302	35.754
2.387	40.641
2.558	37.590
2.600	38.812
2.728	38.508
2.728	46.142
2.813	36.372
2.856	40.952
2.856	43.090
3.069	45.230
3.069	47.367
3.069	48.894
3.112	40.345
3.240	51.034
3.240	53.476
3.538	37.602
3.666	51.344
3.751	39.437
3.751	40.964
3.837	41.881
3.964	54.402
3.964	56.234
4.092	44.938
4.092	47.686
4.135	51.656
4.135	53.488
4.178	43.717
4.178	48.603
4.263	52.879
4.561	39.753
4.561	42.501
4.604	53.494
4.689	43.113
4.732	52.274
4.774	45.252
4.860	48.001
5.030	44.033
5.030	47.392
5.030	51.362
5.030	55.026
5.073	57.469
5.073	69.072
5.158	57.470
5.201	61.746
5.499	63.887
5.755	53.203
5.755	57.478
5.840	48.624
6.053	65.115
6.096	48.016
6.096	54.734
6.181	58.399
6.266	62.370
6.565	54.129
6.735	66.040
6.821	61.766
7.119	60.549
7.162	57.190
7.844	64.527
8.014	67.278
8.142	64.836
8.185	71.249
8.696	72.172
8.909	79.808
8.995	70.343
9.123	66.681
9.208	59.964
9.506	57.831
9.591	64.550
10.188	56.924
10.316	78.910
10.316	82.879
10.870	70.062
10.870	71.894
10.913	80.139
10.913	84.108
10.956	68.231
11.169	78.615
11.211	76.479
11.254	89.609
11.510	81.978
11.766	81.982
11.893	81.678
12.064	82.902
12.448	79.548
12.575	83.824
12.618	76.802
12.618	80.466
12.959	92.073
13.044	86.884
13.641	85.364
13.812	83.840
13.897	81.093
13.940	75.597
13.940	87.506
13.940	100.330
14.281	55.449
14.835	78.967
14.835	89.654
14.920	75.304
15.858	80.812
15.901	86.004
15.901	87.531
16.028	100.357
16.114	87.533
16.114	89.976
16.284	88.451
16.881	84.184
16.881	85.711
16.924	82.353
16.924	87.544
17.989	88.168
17.989	95.496
18.160	93.361
18.799	95.812
18.927	87.874
19.055	92.456
19.822	97.351
20.845	87.899
20.845	98.891
20.931	91.259
21.996	95.547
22.892	90.062
23.787	95.264];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'fork length', 'male'};
  temp.tL_m = C2K(16.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Ramo2007';
comment.tL_m = 'Data for males';
%
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.229	24.306
0.231	22.180
0.231	20.965
0.708	34.032
1.004	44.668
1.005	43.453
1.063	48.921
1.066	41.934
1.067	39.200
1.186	42.847
1.671	39.205
1.792	40.422
1.970	46.499
1.971	44.676
2.032	42.247
2.089	49.842
2.094	38.905
2.575	42.859
2.693	48.328
2.695	45.290
2.758	39.519
2.876	44.684
2.878	41.039
2.879	40.431
2.933	51.672
2.994	51.369
3.115	50.155
3.115	49.851
3.130	20.079
3.241	39.827
3.485	34.665
3.601	44.995
3.657	54.413
3.719	51.376
3.724	39.527
3.725	38.920
3.838	53.503
3.841	48.642
3.841	47.731
3.841	47.123
3.904	41.959
3.958	55.631
4.021	50.771
4.024	44.999
4.024	43.480
4.446	46.825
4.680	61.409
4.688	45.004
4.747	48.651
4.806	49.866
4.986	52.906
4.989	46.830
5.104	57.768
5.412	47.137
5.529	54.733
6.007	63.548
6.072	55.346
6.076	46.536
6.973	65.075
7.038	55.962
7.154	65.381
8.002	59.009
8.114	77.541
8.120	65.390
8.480	69.342
9.925	79.684
9.931	67.532
10.173	65.104
10.217	98.522
10.227	78.168
10.890	80.604
11.131	82.733
12.886	74.242
13.731	76.984
14.510	88.535
14.757	76.386
15.113	90.667
18.066	102.238
20.118	104.687
21.083	107.733
21.086	100.442
21.212	90.722
21.328	100.444
22.048	109.565
22.171	105.009
22.172	103.794
23.081	97.118
23.922	105.632
24.042	108.063
24.045	101.684
24.222	110.192
24.232	90.749
26.279	101.704
26.821	105.962
26.884	100.494
27.059	111.736
27.184	103.838
27.845	109.920
28.875	104.461
28.994	107.804
29.839	108.115
29.898	111.458
32.194	109.351];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'fork length', 'female'};  
  temp.tL_f = C2K(16.8); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Ramo2007';
comment.tL_f = 'Data for females';

% length-weight
data.LW_f = [... % fork length (cm), wet weight (g)
18.466	58.167
19.656	53.853
19.724	63.940
20.069	88.421
20.139	58.107
20.139	63.924
20.563	65.139
20.634	58.090
20.778	81.890
21.068	60.335
21.068	71.639
21.141	97.213
21.437	71.625
21.511	75.841
21.586	86.675
21.586	97.189
21.964	72.983
22.193	90.017
22.348	67.606
22.348	78.756
22.348	100.928
22.503	70.231
22.582	106.861
22.660	91.729
22.977	89.980
23.056	77.239
23.379	78.714
23.705	81.762
23.788	126.804
23.870	97.073
23.870	108.848
24.120	134.252
24.542	86.544
24.542	100.816
25.763	142.050
26.488	117.336
27.614	156.141
28.292	181.839
28.292	192.552
28.391	215.899
28.688	181.810
29.907	199.911
29.907	219.923
30.325	168.339
30.430	241.888
31.070	224.058
31.286	251.215
32.055	265.939
32.278	298.172
32.503	271.017
32.843	315.673
33.767	334.161
34.239	297.963
34.358	436.397
34.477	250.926
34.838	353.716
34.959	321.516
35.202	453.242
35.202	527.989
35.325	367.415
35.943	381.629
36.319	427.867
36.699	346.817
37.470	435.948
37.862	507.780
37.994	435.876
37.994	537.673
38.928	537.518
39.335	452.646
39.335	488.546
39.472	650.414
39.472	702.000
39.609	537.408
39.884	934.514
40.302	507.404
40.302	637.964
40.865	255.245
41.007	801.952
41.292	602.297
41.292	675.354
41.580	537.098
42.161	728.738
42.307	625.546
42.307	649.880
42.898	613.622
43.047	701.279
43.047	786.343
43.197	625.392
43.649	728.439
44.105	771.258
44.105	988.391
44.567	898.340
44.877	649.425
45.033	728.169
45.189	848.221
46.300	932.864
46.461	578.935
46.461	770.783
46.622	1026.163
47.110	831.779
47.438	897.675
47.934	1065.730
48.268	1241.384
48.604	727.511
48.604	1194.803
49.112	365.983
49.112	880.347
49.112	1006.147
49.798	880.203
49.798	1128.005
50.494	1194.263
50.669	1044.900
51.556	1085.323
51.915	1193.870
52.458	1619.917
52.640	1216.670
53.006	1005.237
53.191	1105.822
53.561	1338.189
53.561	1472.148
53.934	1650.580
53.934	2075.287
55.068	1500.014
55.644	1618.785
57.408	1780.174
57.808	1528.031
58.211	1415.628
59.229	1779.515
61.532	1956.767
63.704	2554.913
64.148	3151.341
65.044	2919.285
65.270	1777.467
65.497	2756.642
67.808	2808.592
68.756	4439.160
74.208	3880.611
75.506	5165.508
76.296	3879.335
76.296	4519.100
77.362	4349.173
79.263	5363.359
80.371	4968.417
82.061	5160.413
88.261	7408.990
89.805	7550.168
90.745	10441.883
91.060	8793.861
93.947	10240.315
97.601	8955.902
98.281	11476.304
98.965	9850.809
99.654	11920.773
100.696	10629.919
103.889	9121.673
103.889	11468.755
103.889	13107.628
104.976	12858.302
106.074	14693.926
107.184	13612.469
107.930	14413.240
109.438	11461.683
110.199	12369.725
110.967	15551.279
112.517	13604.634
113.694	18815.209
118.938	18101.033
119.351	15837.185];
units.LW_f = {'cm', 'g'}; label.LW_f = {'fork length', 'wet weight', 'female'};  
bibkey.LW_f = 'Ramo2007';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % fork length (cm), wet weight (g)
18.979	71.502
19.552	57.801
19.693	72.436
19.988	67.774
20.585	78.414
20.695	51.952
20.792	65.976
21.099	78.398
21.208	60.914
21.259	66.846
21.465	83.768
21.465	80.497
21.733	74.325
21.735	67.727
21.844	61.713
22.217	88.313
22.442	70.461
22.603	91.889
22.607	77.320
22.773	81.533
22.995	96.888
23.056	78.341
23.107	106.322
23.223	95.602
23.690	77.290
23.806	82.593
23.861	96.859
24.093	116.638
24.277	95.567
24.392	116.627
24.638	95.556
24.698	102.113
25.370	136.729
25.750	122.934
25.943	112.015
26.775	190.477
27.042	173.555
27.381	153.989
27.720	158.118
27.924	168.962
28.068	131.280
28.410	164.510
28.687	195.492
28.903	173.460
29.117	175.768
29.184	214.504
30.133	220.220
30.360	195.401
30.810	214.408
31.116	211.563
31.575	248.080
32.277	298.710
32.682	254.684
32.834	345.641
33.242	345.606
33.658	298.607
33.908	302.580
33.911	268.496
34.149	421.687
34.417	268.463
34.750	336.425
35.442	336.371
35.614	379.056
36.591	389.171
36.595	345.332
36.861	415.862
36.949	450.342
37.503	410.318
37.967	415.761
38.055	494.090
38.058	450.232
38.627	421.258
38.719	462.284
39.000	564.141
39.004	500.593
39.010	421.224
39.391	487.433
39.874	571.578
40.377	450.013
40.463	652.669
40.571	520.768
40.666	602.661
40.768	571.474
40.965	652.602
41.175	527.665
41.278	507.047
41.477	586.770
41.680	618.755
41.780	661.219
42.098	534.621
42.100	506.965
42.514	556.304
42.609	706.496
42.613	643.784
42.711	775.300
42.721	602.416
42.818	735.179
42.830	548.932
43.139	687.910
43.465	594.385
43.882	817.412
43.889	697.006
43.993	764.887
44.206	850.581
44.327	643.575
44.538	785.393
44.540	734.940
44.659	594.252
45.078	1037.889
45.425	774.906
45.430	687.616
46.212	839.053
46.433	997.111
46.439	861.601
46.443	795.617
46.897	920.674
47.248	850.114
47.582	1249.381
48.184	957.878
48.187	896.344
48.191	816.781
48.294	1153.558
48.404	1426.604
48.781	957.780
48.907	849.872
49.141	1009.968
49.373	1265.696
49.641	754.045
49.749	1037.045
49.869	1093.595
49.878	908.067
50.361	1153.160
51.239	1107.966
51.486	1248.568
51.622	1050.587
51.622	1050.587
51.874	1107.854
51.995	1282.068
52.385	1183.811
52.635	1406.812
53.285	1503.236
53.678	1585.144
53.958	1167.910
54.071	1739.449
54.480	1502.961
54.620	1351.458
54.854	2731.731
54.887	1425.126
55.701	1543.129
56.963	1198.806
57.084	1761.913
57.360	1959.310
57.375	1482.502
57.513	1584.242
58.368	1648.426
58.506	1833.146
59.841	1214.338
59.968	1761.196
60.706	1932.559
61.311	1832.438
61.751	2358.177
62.665	2622.164
63.139	2265.666
64.516	4342.116
64.549	2485.913
64.704	2692.026
64.713	2295.487
65.830	2691.643
65.990	2800.978
66.003	2264.837
66.490	2356.739
66.658	2234.779
67.009	1582.246
67.801	2914.162
68.805	3197.642
68.808	3032.228
71.046	3154.628
71.406	2762.230
71.554	4224.705
71.921	3461.570
74.435	4058.392
75.165	4512.893
75.727	4222.729
75.926	3600.642
77.824	3413.686
78.382	4451.821
79.347	4884.982
79.360	4110.468
79.755	3949.776
80.120	5882.555
80.529	4884.386
81.536	4391.667
81.733	4631.148
81.927	5150.106
82.525	5881.119
82.540	4818.972
82.928	6201.699
82.974	3411.882
83.759	5502.651
84.374	6038.300
85.018	4817.797
85.822	7770.098
85.845	5801.653
86.276	5357.126
87.113	6624.743
87.555	5800.709
87.764	6281.661
88.847	6712.211
88.870	5078.762
89.057	7464.366
89.959	5955.499
90.600	8082.269
91.285	6983.443
91.522	6114.912
91.964	6890.899
92.880	6533.900
94.246	7973.061
94.268	6195.145
94.490	6981.455
95.657	7361.560
97.084	7167.748
98.285	7458.297
98.781	6617.877
99.007	8076.355
100.239	7657.785];
units.LW_m = {'cm', 'g'};  label.LW_m = {'fork length', 'wet weight', 'male'};  
bibkey.LW_m = 'Ramo2007';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'all temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = {'Depth 100-275 m'};
metaData.bibkey.F1 = 'ADW'; 
F2 = 'FL = 0.917 * TL ';
metaData.bibkey.F1 = 'Ramo2007'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6M4RL'; % Cat of Life
metaData.links.id_ITIS = '159798'; % ITIS
metaData.links.id_EoL = '46560135'; % Ency of Life
metaData.links.id_Wiki = 'Heterodontus_portusjacksoni'; % Wikipedia
metaData.links.id_ADW = 'Heterodontus_portusjacksoni'; % ADW
metaData.links.id_Taxo = '106314'; % Taxonomicon
metaData.links.id_WoRMS = '276699'; % WoRMS
metaData.links.id_fishbase = 'Heterodontus-portusjacksoni'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterodontus_portusjacksoni}}';  
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
bibkey = 'Ramo2007'; type = 'Misc'; bib = [ ...
'author = {R. {\O}. Ramos}, ' ...
'year = {2007}, ' ...
'howpublished = {\url{http://ogma.newcastle.edu.au:8080/vital/access/services/Download/uon:2136/ATTACHMENT02?view=true}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Austr_Museum'; type = 'Misc'; bib = ...
'howpublished = {\url{http://australianmuseum.net.au/Port-Jackson-Shark-Heterodontus-portusjacksoni-Meyer-1793}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Heterodontus_portusjacksoni/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/query.php?search=Heterodontus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/743}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46560135}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  