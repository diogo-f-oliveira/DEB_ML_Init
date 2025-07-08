function [data, auxData, metaData, txtData, weights] = mydata_Euphausia_superba

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Euphausiacea'; 
metaData.family     = 'Euphausiidae';
metaData.species    = 'Euphausia_superba'; 
metaData.species_en = 'Antarctic krill'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwj';  'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-JC';'L-JX';'L-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 02 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 

%% set data
% zero-variate data

data.ah = 6;    units.ah = 'd';     label.ah = 'age at hatch';                bibkey.ah = 'JiaVirt2014';   
  temp.ah = C2K(0.5);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 31;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'JageRava2015';   
  temp.ab = C2K(0);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 32;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'JageRava2015';   
  temp.tj = C2K(0);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 365;   units.tp = 'd';    label.tp = 'time since hatch at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Read from tL-data for Lp';
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.1;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';      bibkey.Lj  = 'JageRava2015';
data.Lp  = 3.5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'JageRava2015';
data.Li  = 6.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'JageRava2015';

data.Ww0 = 65; units.Ww0 = 'mug';   label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'JiaVirt2014';
  comment.Ww0 = 'Computed from egg diameter 0.5 mm assuming specific density 1 g/cm^3';
data.Wwb = 0.125; units.Wwb = 'mg'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'JageRava2015';
  comment.Wwb = 'Based on fig 2, which gives a volumetric length 0.5 mm, and specific density 1 g/cm^3';
data.Wwj = 2.700; units.Wwj = 'mg'; label.Wwj = 'wet weight at metam';        bibkey.Wwj = 'JageRava2015';
  comment.Wwj = 'Based on fig 2, which gives a volumetric length 0.5 mm, and specific density 1 g/cm^3';
data.Wwp = 0.590; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'JageRava2015','Farb1994'};
  comment.Wwp = 'computed from Lp, using F3';
data.Wwi = 3.654;  units.Wwi = 'g'; label.Wwi = 'ultimate dry weight';        bibkey.Wwi = {'JageRava2015','Farb1994'};
  comment.Wwi = 'computed from Li, using F3';

% uni-variate data
% t-L data Fig 2 of JageRava2015:
data.tL_f = [ ... % time since birth (d), body length (mm)
0.624	8.503
9.739	9.590
24.765	11.072
36.420	13.147
48.111	14.135
64.802	15.913
83.170	17.593
96.487	20.063
118.212	21.545
131.573	22.731
146.605	24.015
168.293	26.584
185.017	27.374
211.714	30.437
226.736	32.018
255.168	33.302
281.969	33.302
308.743	34.093
332.140	35.674
360.582	36.662
387.366	37.156
412.415	39.428
435.815	40.910
459.246	41.503
487.598	45.159
517.768	44.566
551.269	44.566
573.025	45.159
604.841	45.455
638.308	46.443
663.454	45.850
693.598	46.048
725.474	44.566
745.567	44.763
769.128	41.503
805.906	43.677
829.356	43.677
857.852	43.084
889.711	42.096
916.459	43.677];
data.tL_f(:,2) = data.tL_f(:,2)/10; % convert mm to cm
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time', 'body length', 'female'};  
temp.tL_f   = C2K(0);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'Iked1985','JageRava2015'};
comment.tL_f = 'female';
%
data.tL_m = [ ... % time since birth (d), body length (cm)
3.203	4.749
13.203	6.231
24.895	7.219
41.582	9.096
53.237	11.171
61.532	13.542
76.517	16.210
94.899	17.494
109.928	18.877
124.939	20.754
143.278	23.323
168.384	23.916
181.710	26.090
201.754	27.769
221.778	30.042
236.830	30.734
268.588	32.710
290.364	32.710
312.130	33.006
333.832	35.180
362.291	35.674
384.036	36.563
412.465	37.946
434.167	40.120
459.292	40.120
487.675	42.886
509.494	41.602
541.313	41.799
568.100	42.195
596.572	42.293
630.046	43.084
653.504	42.886
678.666	41.799
705.443	42.491
727.296	40.219
752.428	40.021
780.901	40.120
809.380	40.021
852.881	41.503
876.378	40.120
904.854	40.120];
data.tL_m(:,2) = data.tL_m(:,2)/10; % convert mm to cm
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time', 'body length', 'male'};  
temp.tL_m   = C2K(0);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'Iked1985','JageRava2015'};
comment.tL_m = 'male';
%
% larva
data.tW = [ ... % time since birth (d), volumetric length (cm)
0.054	0.046
10.572	0.046
16.418	0.048
25.306	0.054
36.988	0.051
42.381	0.065
47.540	0.080
48.488	0.092
52.708	0.103
57.634	0.118
64.427	0.131
68.638	0.135
75.902	0.150
80.098	0.141
85.262	0.159
92.050	0.168
105.143	0.172
108.885	0.174
119.645	0.182
126.911	0.199
131.565	0.182];
data.tW(:,2) = data.tW(:,2).^3; % convert vol length to wet weight using spec density 1 g/cm^3 
units.tW   = {'d', 'g'};  label.tW = {'age', 'larval wet weight'};  
temp.tW    = C2K(0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'Iked1984', 'HuntBrin1991', 'JageRava2015'};
comment.tW = 'from egg to furcilia VI; calyptopsis I starts at 37 d, furcilia I at 63 d';

% length - ingestion data
data.LjX = [ ... % body length (d), specific ingestion (g/d.g)
0.496	0.446
0.786	0.519
0.786	0.440
0.808	0.292
0.571	0.280
0.603	0.263
0.485	0.259
0.496	0.215
0.808	0.180
0.700	0.147
0.819	0.132
1.777	0.040
1.896	0.041
1.961	0.030
2.693	0.072
2.995	0.171
2.995	0.075
3.738	0.123
3.749	0.070
3.749	0.041
3.996	0.028
3.986	0.050
4.050	0.085
4.050	0.112
4.212	0.212
4.481	0.088
4.998	0.034
5.127	0.018
5.171	0.014
5.224	0.019];
units.LjX   = {'cm', 'g C/d.g C'};  label.LjX = {'body length', 'specific ingestion rate'};  
temp.LjX   = C2K(0);  units.temp.LjX = 'K'; label.temp.LjX = 'temperature';
bibkey.LjX = {'JageRava2015'};

% length - respiration data
data.LjC = [ ... % body length (d), specific CO2 production (g C/ d.g C)
0.35036	0.03702
0.37226	0.02874
0.40511	0.02741
0.47080	0.01616
0.49270	0.02680
0.52555	0.02792
0.59124	0.03345
0.60219	0.02639
0.62409	0.01422
0.66788	0.02578
0.73358	0.01995
0.87591	0.03355
0.91971	0.02476
1.28102	0.02681
1.37956	0.01505
1.65328	0.02896
1.66423	0.01577
1.67518	0.01751
1.68613	0.00811
1.69708	0.03070
1.76277	0.01803
1.78467	0.03183
1.79562	0.02355
1.79563	0.02549
1.85036	0.01680
1.88321	0.01445
1.89416	0.01598
1.91606	0.02232
1.91607	0.01343
1.95985	0.01844
1.97080	0.01200
1.97081	0.02151
2.02555	0.03030
2.14599	0.01813
2.16788	0.01476
2.21168	0.02284
2.22263	0.02928
2.34307	0.03010
2.34308	0.01303
2.34309	0.01262
2.37591	0.02213
2.37592	0.01047
2.41971	0.01078
2.48540	0.02704
2.51824	0.01190
2.51825	0.01262
2.51826	0.01313
2.58394	0.01589
2.62774	0.01099
2.69343	0.01906
2.75911	0.01181
2.75912	0.01722
2.82482	0.01436
2.91241	0.01140
2.92336	0.00976
2.93430	0.00711
2.93431	0.01222
2.93432	0.01344
2.94526	0.01212
3.04380	0.01201
3.04381	0.00987
3.08759	0.01733
3.10949	0.01018
3.19708	0.00926
3.24088	0.01161
3.24089	0.01253
3.27370	0.01028
3.27371	0.01427
3.27372	0.01744
3.27373	0.02357
3.33942	0.01151
3.37226	0.01202
3.41606	0.01110
3.47080	0.01151
3.48175	0.01417
3.50365	0.01161
3.53650	0.01305
3.60219	0.01489
3.61314	0.01796
3.62409	0.01192
3.65693	0.00783
3.70073	0.01336
3.74453	0.01540
3.75547	0.01192
3.75548	0.01264
3.78832	0.01090
3.79927	0.01060
3.85401	0.01039
3.86496	0.01970
3.89781	0.01346
3.94161	0.00896
3.98540	0.01234
3.98541	0.02011
3.99635	0.01295
4.00730	0.01091
4.02920	0.01050
4.04015	0.01684
4.05109	0.01111
4.10584	0.00999
4.12774	0.01418
4.17153	0.01183
4.18248	0.01970
4.19343	0.01520
4.20438	0.01439
4.22628	0.00948
4.24818	0.01071
4.31387	0.01643
4.33577	0.01132
4.33578	0.01091
4.35767	0.00938
4.37955	0.01132
4.37956	0.01868
4.37957	0.01868
4.40146	0.01010
4.40147	0.01930
4.46715	0.01940
4.46716	0.00877
4.50000	0.01286
4.51095	0.01224
4.51096	0.01173
4.57664	0.00959
4.57665	0.01163
4.58758	0.01654
4.58759	0.01899
4.59854	0.01337
4.63139	0.01501
4.64234	0.01020
4.65327	0.01399
4.65328	0.01225
4.78466	0.01429
4.78467	0.01552
4.79562	0.01164
4.89416	0.00847
4.90511	0.00806
4.99270	0.00857
5.01460	0.01399
5.01461	0.01307
5.03650	0.01246
5.06934	0.01092
5.08029	0.01000
5.10218	0.01430
5.10219	0.01532
5.10220	0.01614
5.12409	0.01113
5.16788	0.00898
5.18978	0.01604
5.20073	0.00919
5.20074	0.02033
5.22263	0.01389
5.24453	0.01093
5.26641	0.00919
5.26642	0.00796
5.29926	0.01226
5.29927	0.01573
5.29928	0.01410
5.31022	0.01798
5.33212	0.01164
5.37591	0.01042
5.40876	0.01410
5.41971	0.01512
5.47445	0.01328
5.48540	0.00899
5.51825	0.01226
5.55109	0.01431
5.56204	0.00684
5.60584	0.01001
5.61679	0.01635
5.71533	0.01124
5.78102	0.01227
5.85765	0.00715
5.85766	0.00777
5.92336	0.00951
5.93431	0.01186
5.95620	0.00787
6.08759	0.00839];
units.LjC   = {'cm', 'g C/d.g C'};  label.LjC = {'body length', 'specific CO_2 production rate'};  
temp.LjC   = C2K(0);  units.temp.LjC = 'K'; label.temp.LjC = 'temperature';
bibkey.LjC = {'JageRava2015'};

% length - clutch size
data.LN = [ ... % body length (cm), clutch size (#)
3.326	1868.857
3.605	372.337
3.661	542.993
3.642	1066.438
3.719	1237.002
3.744	1568.005
3.793	2796.099
3.991	3030.233
4.035	2474.639
3.976	1994.249
3.927	1802.204
3.914	1684.767
3.899	1578.024
3.785	1087.191
3.828	894.749
3.905	1268.250
3.961	1065.074
3.912	819.625
3.902	723.536
3.955	744.673
3.986	691.136
3.999	605.636
3.999	488.146
3.995	1663.061
4.072	1897.710
4.094	1790.809
4.079	1641.342
4.082	1331.581
4.116	925.561
4.150	1395.376
4.165	2121.613
4.100	2922.960
4.195	4065.409
4.196	2986.635
4.218	2997.224
4.273	2964.943
4.230	2719.467
4.280	2441.551
4.323	2238.428
4.215	2057.315
4.240	1929.038
4.221	1811.627
4.206	1768.970
4.227	1512.535
4.215	914.456
4.268	326.780
4.305	444.112
4.354	1544.035
4.308	1768.533
4.367	2024.624
4.338	2868.536
4.400	2665.334
4.450	2590.356
4.475	2921.359
4.478	3017.474
4.487	3188.329
4.508	3647.516
4.620	3422.740
4.562	2515.113
4.503	2376.512
4.620	2578.947
4.441	1298.003
4.478	1426.015
4.466	1543.559
4.447	1693.171
4.445	165.812
4.559	122.599
4.603	389.436
4.590	624.469
4.497	1041.423
4.534	1041.264
4.615	763.216
4.640	944.685
4.674	848.412
4.708	773.500
4.686	538.612
4.627	1158.357
4.584	1222.628
4.608	1436.141
4.649	1371.883
4.686	1542.619
4.698	1713.461
4.692	1734.849
4.704	1884.329
4.670	1927.199
4.676	2226.238
4.658	2269.041
4.692	2439.790
4.685	2802.968
4.732	2535.747
4.760	2535.628
4.763	2984.213
4.719	3336.869
4.754	2022.970
4.723	2151.273
4.760	1905.453
4.819	1873.158
4.779	1681.074
4.739	1542.394
4.751	1307.361
4.760	1200.512
4.751	976.252
4.776	741.166
4.801	805.145
4.826	356.440
4.872	420.327
4.878	313.492
4.944	217.086
4.940	441.399
4.875	794.147
4.798	1285.800
4.819	1381.836
4.832	1445.869
4.838	1531.290
4.838	1563.332
4.863	1403.013
4.887	1338.821
4.887	1296.097
4.869	1264.134
4.890	1648.555
4.921	1648.422
4.940	1840.599
4.940	1947.409
4.933	2139.692
4.853	2150.717
4.834	2204.201
4.853	2278.888
4.856	2342.961
4.862	2407.020
4.946	2331.896
4.927	2438.784
4.902	2545.699
4.862	2780.852
4.877	2866.233
4.896	2972.963
4.778	3614.321
4.818	3731.640
4.741	4084.441
4.669	4672.197
4.669	5195.562
4.691	5270.236
4.768	4949.477
4.843	5066.650
4.803	4351.200
4.827	4180.199
4.861	4564.567
4.911	4115.756
4.933	4350.644
4.945	5055.532
4.985	5471.916
5.028	6251.438
5.084	6069.624
5.164	6464.475
5.023	2865.611
4.986	3613.435
4.986	2801.684
4.989	2652.138
5.029	2459.710
4.992	2299.655
5.014	1968.453
5.051	1925.571
5.045	1776.064
5.005	1744.193
4.989	1701.536
4.980	1552.042
4.962	1413.270
4.946	1274.484
4.925	1338.662
4.956	1231.720
4.986	1295.674
5.005	1220.828
4.987	1210.227
4.968	1135.539
4.996	1114.058
4.940	986.126
4.987	847.075
4.999	740.213
4.993	708.196
5.086	462.138
5.098	291.190
5.160	269.564
5.042	846.836
5.076	953.500
5.120	974.677
5.061	1028.333
5.042	1327.478
5.064	1359.428
4.983	1359.772
4.962	1423.951
5.039	1562.472
5.027	1615.929
5.107	1476.733
5.113	1957.349
5.104	2010.793
5.098	2288.523
5.094	2438.070
5.110	2523.451
5.091	2555.573
5.041	3474.345
5.075	3645.094
5.119	3730.356
5.217	5417.519
5.289	4754.997
5.159	3708.822
5.221	3815.367
5.221	3879.452
5.125	2950.622
5.159	2822.305
5.265	3056.835
5.296	2853.766
5.147	1700.861
5.178	1828.900
5.228	1892.773
5.138	1497.963
5.144	1327.041
5.135	1230.953
5.148	1188.176
5.148	1113.410
5.157	889.071
5.210	1070.421
5.219	1273.319
5.262	856.578
5.268	2095.539
5.346	1913.632
5.327	1198.089
5.340	909.651
5.355	984.352
5.399	984.167
5.439	727.652
5.423	1774.449
5.380	1817.358
5.383	2308.668
5.389	2586.346
5.627	2467.836
5.550	3194.470
5.723	3289.857
5.689	3386.131
5.438	3632.864
5.456	3782.318
5.410	3867.964
5.388	4263.251
5.453	4252.292
5.655	3760.109
5.689	4101.753
5.617	4828.360
5.434	5544.763
5.377	7585.058
5.570	5693.714
5.744	6194.976
5.949	4869.668];
units.LN   = {'cm', '#'};  label.LN = {'body length', 'clutch size'};  
temp.LN   = C2K(0);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'JageRava2015'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data at females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'The expected clutch size ia based on spawing twice per yr';
D2 = 'Metamorphosis is assumed to affect morphology, not metabolism';     
D3 = 'Males are assumed to have the same parameters as females';     
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'This entry is discussed in JageRava2015; notice, however that this ref fits a model without reserve, with the consequence that some symbols have a different meaning.';
metaData.bibkey.F1 = 'JageRava2015'; 
F2 = 'Feeding starts at stage Calyptopsis I';
metaData.bibkey.F2 = 'JageRava2015'; 
F3 = 'Length (mm) - wet weight (mg) relationship: Ww = 0.00503 * L^3.283';
metaData.bibkey.F3 = 'Farb1994';   
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3CMD5'; % Cat of Life
metaData.links.id_ITIS = '95514'; % ITIS
metaData.links.id_EoL = '509426'; % Ency of Life
metaData.links.id_Wiki = 'Euphausia_superba'; % Wikipedia
metaData.links.id_ADW = 'Euphausia_superba'; % ADW
metaData.links.id_Taxo = '33778'; % Taxonomicon
metaData.links.id_WoRMS = '236217'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euphausia_superba}}';
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
bibkey = 'JageRava2015'; type = 'Article'; bib = [ ... 
'author = {Jager, T. and Ravanan, E.}, ' ... 
'year = {2015}, ' ...
'title = {Parameterising a generic model for the {D}ynamic {E}nergy {B}udget of {A}ntarctic krill, \emph{Euphausia superba}}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {519}, ' ...
'pages = {115-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JiaVirt2014'; type = 'Article'; bib = [ ... 
'author = {Z. Jia and P. Virtue and K. M. Swadling}, ' ... 
'year = {2014}, ' ...
'title = {A photographic documentation of the development of {A}ntarctic krill (\emph{Euphausia superba}) from egg to early juvenile}, ' ...
'journal = {Polar Biol}, ' ...
'doi = {10.1007/s00300-013-1420-7}, ' ...
'volume = {37}, ' ...
'pages = {165-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Farb1994'; type = 'Article'; bib = [ ... 
'author = {Farber-Lorda, J.}, ' ... 
'year = {1994}, ' ...
'title = {Length-weight relationships and coefficient of condition of \emph{Euphausia superba} and \emph{Thysanoessa macrura} ({C}rustacea: {E}uphausiacea) in southwest {I}ndian {O}cean during summer}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {118}, ' ...
'pages = {645--650}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Iked1984'; type = 'Article'; bib = [ ... 
'author = {Ikeda, T}, ' ... 
'year = {1984}, ' ...
'title = {Development of the larvae of the {A}ntarctic krill (\emph{Euphausia superba} {D}ana) observed in the laboratory}, ' ...
'journal = {J Exp Mar Biol Ecol}, ' ...
'volume = {75}, ' ...
'pages = {107--117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Iked1985'; type = 'Article'; bib = [ ... 
'author = {Ikeda, T}, ' ... 
'year = {1985}, ' ...
'title = {Life history of Antarctic krill \emph{Euphausia superba}: a new look from an 663 experimental approach}, ' ...
'journal = {Bull Mar Sci}, ' ...
'volume = {37}, ' ...
'pages = {599--608}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HuntBrin1991'; type = 'Article'; bib = [ ... 
'author = {Huntley, M. and Brinton, E.}, ' ... 
'year = {1991}, ' ...
'title = {Mesoscale variation in growth and early development of \emph{Euphausia superba} {D}ana in the western {B}ransfield {S}trait region}, ' ...
'journal = {Deep-Sea Res.}, ' ...
'volume = {38}, ' ...
'pages = {1213--1240}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
