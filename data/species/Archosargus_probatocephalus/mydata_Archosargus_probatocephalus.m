function [data, auxData, metaData, txtData, weights] = mydata_Archosargus_probatocephalus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Archosargus_probatocephalus'; 
metaData.species_en = 'Sheepshead'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAW','MAg'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 07 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 1.67;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'fishbase';   
  temp.ab = C2K(25.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1.25*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';          bibkey.tp = 'floridamuseum';
  temp.tp = C2K(20);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on maturity in 2nd yr';
data.am = 20*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'BeckStan1991';   
  temp.am = C2K(20);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = {'floridamuseum','BeckStan1991'}; 
  comment.Lp = 'based on tp 2 yr and tL data';
data.Li  = 91;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 698;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^3.04, see F1';
data.Wwi = 12.75e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^3.04, see F1';

data.Ri = 25e4/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'floridamuseum';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data

% time - length
data.tL_f = [ ... % yr class (yr), fork length (cm)
1.973	32.981
1.979	36.717
2.136	27.144
2.217	33.524
2.246	30.100
2.308	25.664
2.417	28.387
2.422	31.344
2.493	32.200
2.670	33.599
2.672	34.611
2.703	32.587
2.871	29.162
2.910	31.341
2.976	29.706
3.013	30.562
3.016	32.351
3.019	34.064
3.056	35.308
3.060	37.954
3.096	38.343
3.153	31.105
3.156	33.051
3.157	33.362
3.202	39.121
3.233	37.330
3.239	40.755
3.263	34.451
3.268	37.252
3.335	35.851
3.400	33.049
3.402	54.450
3.403	34.995
3.440	36.317
3.481	39.819
3.494	46.901
3.514	38.574
3.895	37.715
3.957	32.890
3.966	38.570
4.107	39.503
4.179	40.748
4.274	35.144
4.282	40.047
4.394	44.015
4.425	41.913
4.525	39.500
4.527	40.434
4.545	51.251
4.667	41.367
4.724	34.051
4.728	36.230
4.900	34.906
5.086	41.909
5.157	42.764
5.256	39.495
5.283	35.293
5.285	36.382
5.323	38.016
5.324	38.327
5.328	40.584
5.406	45.953
5.429	39.027
5.449	50.233
5.486	51.400
5.506	43.307
5.535	39.727
5.537	40.972
5.819	42.993
5.902	30.697
5.988	40.268
6.014	34.743
6.130	41.824
6.200	41.901
6.224	35.597
6.228	38.243
6.298	38.087
6.312	46.025
6.344	44.857
6.352	49.371
6.400	36.686
6.405	39.565
6.407	40.577
6.412	43.534
6.466	34.506
6.505	37.307
6.508	38.708
6.516	43.689
6.538	36.295
6.574	56.529
6.591	46.334
6.604	53.805
6.619	42.443
6.619	42.676
6.712	35.827
6.735	29.290
6.820	38.239
6.918	34.347
6.984	32.557
7.006	45.086
7.065	38.782
7.181	45.474
7.207	40.182
7.213	43.606
7.220	48.119
7.375	36.912
7.424	45.161
7.426	46.095
7.454	42.359
7.480	37.534
7.678	50.918
7.766	41.345
8.163	49.669
8.256	42.898
8.354	39.473
8.359	42.508
8.483	33.791
8.510	49.278
8.542	47.254
8.557	35.814
8.569	42.740
8.638	42.351
8.639	43.207
8.740	41.416
8.747	45.385
9.132	46.627
9.161	43.047
9.196	43.281
9.325	37.210
9.397	38.688
9.477	44.601
9.513	45.302
9.518	47.947
9.766	50.514
9.767	51.136
10.172	43.818
10.412	41.715
10.416	44.284
10.579	37.590
10.629	46.694
10.922	54.786
11.254	45.834
11.321	44.044
11.501	47.311
11.815	47.931
12.184	40.224
12.193	45.360
12.210	35.088
12.338	48.317
12.370	46.682
12.403	46.059
12.558	55.086
12.693	52.127
12.694	52.906
12.715	45.045
13.263	39.828
14.103	42.234
14.416	42.388
14.475	56.084
14.524	44.644
14.552	40.519
15.157	47.908
15.199	52.032
15.219	43.549
15.257	45.417
15.340	53.120
15.361	45.027
15.677	46.814
16.221	39.340
16.550	48.676
16.736	55.523
17.127	40.112
17.381	45.946
17.578	39.330
17.722	41.975
18.182	46.252
18.458	44.927];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
data.tL_f(:,2) = data.tL_f(:,2)/0.87; % conver FL to TL
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BeckStan1991';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % yr class (yr), fork length (cm); FL is about equal to TL
2.137	27.455
2.138	28.311
2.169	25.743
2.212	30.645
2.256	35.703
2.330	38.582
2.358	34.691
2.387	31.111
2.493	31.966
2.736	31.731
2.738	32.820
2.739	33.443
2.821	40.602
2.845	34.298
2.865	25.582
2.904	27.916
2.907	30.173
2.947	32.819
2.949	33.753
2.978	30.640
3.050	31.806
3.093	36.553
3.121	32.818
3.153	31.105
3.192	33.440
3.228	34.062
3.233	37.019
3.269	37.642
3.269	37.642
3.330	32.816
3.359	29.625
3.369	35.306
3.370	36.007
3.379	41.298
3.438	34.761
3.788	36.159
3.798	41.529
3.920	31.723
3.924	33.979
3.934	39.738
3.991	32.967
4.034	37.558
4.036	38.726
4.037	39.115
4.073	39.893
4.080	43.939
4.102	36.624
4.140	38.102
4.151	44.717
4.179	40.670
4.380	36.389
4.410	33.587
4.418	38.100
4.495	42.380
4.588	35.453
4.627	38.177
4.803	39.498
4.979	40.509
5.187	39.729
5.187	39.729
5.190	41.675
5.226	42.453
5.252	37.238
5.254	38.250
5.264	44.242
5.293	40.740
5.298	43.619
5.359	38.638
5.363	40.817
5.401	43.074
5.431	39.805
5.456	34.124
5.485	31.167
5.876	35.755
5.941	32.876
5.943	33.965
5.981	35.988
6.055	38.400
6.159	38.555
6.197	40.345
6.301	40.110
6.307	43.067
6.308	44.079
6.366	37.464
6.367	37.931
6.370	39.487
6.403	38.709
6.409	41.899
6.453	47.035
6.819	37.227
6.951	33.180
6.962	39.950
6.988	34.580
6.990	35.747
7.029	38.237
7.030	38.704
7.130	36.291
7.209	41.660
7.279	42.049
7.340	36.834
7.346	40.025
7.388	44.538
7.632	44.381
7.707	47.493
7.794	37.843
7.900	38.543
7.937	39.632
8.153	44.066
8.288	41.653
8.326	43.598
8.360	42.742
8.385	36.983
8.390	40.173
8.458	39.473
8.468	44.998
8.492	38.538
8.605	43.518
8.779	43.439
8.803	37.213
8.812	42.427
9.018	41.181
9.197	43.825
9.441	44.213
9.471	41.255
9.479	45.691
9.513	45.068
9.647	42.343
9.659	49.425
9.855	41.797
10.266	37.903
10.268	39.148
10.270	40.004
10.275	42.884
10.383	44.906
10.551	41.715
10.552	42.259
10.681	36.500
11.076	43.267
11.206	38.208
11.278	39.219
11.351	41.086
11.359	46.222
11.559	40.618
11.560	41.707
11.566	44.742
11.634	43.886
12.226	43.882
12.294	43.103
12.321	38.511
12.396	41.624
12.433	43.102
12.497	39.522
12.498	40.300
13.482	45.429
13.815	36.789
13.862	43.792
14.170	41.222
14.179	45.969
14.204	40.599
14.307	39.587
14.415	41.609
14.690	39.740
15.181	41.915
15.212	39.736
15.440	50.629
15.640	45.725
16.257	40.196
16.363	41.051
16.404	44.475
16.434	41.906
16.718	45.017
17.418	47.347
17.654	42.832
17.725	43.765
18.251	45.629
18.525	43.292];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
data.tL_m(:,2) = data.tL_m(:,2)/0.87; % conver FL to TL
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BeckStan1991';
comment.tL_m = 'data for males';

% time - weight
data.tWw_f = [ ... % yr class (yr), wet weight (g)
2.114	929.866
2.246	647.478
2.248	738.552
2.289	993.547
2.701	747.472
2.815	1139.049
2.855	1312.077
2.881	984.194
2.907	665.419
2.917	1020.610
2.987	1047.903
3.052	883.940
3.058	1084.304
3.152	710.855
3.157	911.219
3.171	1439.451
3.203	1330.147
3.224	774.579
3.245	1585.142
3.263	938.498
3.273	1330.119
3.305	1211.707
3.325	1976.733
3.344	1402.949
3.370	1056.852
3.417	1530.425
3.449	1402.906
3.522	1521.274
3.791	1193.291
3.934	1329.845
4.002	1256.956
4.105	1193.161
4.161	1994.602
4.214	1393.482
4.224	1748.673
4.283	1357.023
4.308	992.711
4.315	1238.612
4.389	1429.839
4.419	1229.461
4.727	1019.860
4.729	1110.934
4.751	3287.630
5.005	992.423
5.242	2076.123
5.244	2158.090
5.416	2076.051
5.535	1292.752
5.578	1620.606
5.691	1948.431
5.826	1802.654
5.870	809.913
5.920	1392.776
6.398	1037.383
6.407	2713.169
6.555	1711.277
6.633	2011.794
6.636	3478.108
6.649	2640.208
6.687	1447.103
6.957	1119.120
7.160	2230.157
7.175	1446.902
7.206	2639.978
7.212	1547.069
7.282	1556.148
7.296	2093.487
7.655	2521.394
7.774	3076.905
7.880	1783.589
7.952	1883.742
8.231	1892.734
8.247	2530.256
8.280	2430.060
8.296	1719.664
8.376	2120.363
8.391	2685.025
8.429	2830.730
8.449	936.351
8.488	1082.056
8.552	2202.258
8.602	1437.203
8.868	2293.203
8.952	1537.241
9.147	2338.625
9.211	2110.910
9.465	2511.537
9.519	1910.416
9.549	1737.360
9.587	1855.743
9.664	2128.937
9.902	3221.745
9.904	3294.605
10.365	2310.798
10.652	1308.849
10.752	2474.574
11.498	1718.338
11.499	1727.446
11.678	1927.737
11.874	2765.551
12.278	2255.361
12.385	1007.582
12.389	2510.326
12.660	2209.665
12.767	3648.614
12.770	3739.688
12.813	2737.840
12.938	3521.037
14.393	1926.613
14.737	1762.535
15.300	1989.991
15.316	2609.298
15.339	3492.721
15.353	2691.250
15.663	2581.831
16.690	3218.935
17.170	1634.022
17.550	1533.682
18.342	2498.755
18.381	2689.997
20.254	2415.995];
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % convert yr to d
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(20);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'BeckStan1991';
comment.tWw_f = 'data for females';
%
data.tWw_m = [ ... % yr class (yr), wet weight (g)
2.108	720.395
2.139	574.661
2.180	793.226
2.210	620.170
2.293	1111.943
2.295	1193.910
2.344	428.855
2.356	893.336
2.388	756.709
2.880	965.979
3.044	556.072
3.051	829.295
3.058	1084.304
3.126	1020.523
3.198	1120.676
3.202	1284.610
3.228	947.620
3.235	1211.736
3.259	792.779
3.290	665.260
3.307	1311.889
3.323	583.279
3.414	1402.921
3.717	992.956
3.726	1348.146
3.757	1220.627
3.945	1748.788
3.958	901.780
4.002	1275.171
4.035	1202.297
4.107	1275.128
4.202	2240.489
4.205	1047.399
4.265	2003.667
4.292	1712.214
4.383	1174.831
4.384	1229.476
4.399	1803.245
4.419	1247.676
4.532	1557.286
4.625	1101.870
4.667	1411.509
4.970	1019.759
5.203	1921.310
5.249	2331.131
5.265	1629.843
5.274	1985.034
5.375	1839.271
5.385	901.189
5.399	1429.421
5.425	1101.539
5.431	1338.333
5.473	1602.434
5.494	2412.998
5.530	1128.818
5.576	1556.854
5.579	1666.143
5.810	1183.347
5.814	1319.959
5.955	1383.654
5.978	946.482
6.019	1174.154
6.211	1857.141
6.212	1920.892
6.250	2011.953
6.275	1665.855
6.319	1993.709
6.343	1574.752
6.395	2257.796
6.407	1374.359
6.519	1647.539
6.865	1574.536
6.893	1310.405
6.931	1428.787
7.023	964.264
7.237	1164.542
7.247	1556.162
7.303	1027.901
7.306	1128.083
7.421	1528.768
7.440	2275.579
7.486	1355.697
7.563	1647.107
7.723	2430.290
7.748	2065.978
7.799	1364.675
7.975	1428.355
8.396	1555.687
8.449	2266.053
8.457	1227.790
8.571	1582.937
8.633	1300.577
8.749	1746.799
9.531	2347.574
9.553	1855.757
9.726	1837.470
10.027	2702.563
10.385	1737.014
10.451	1600.374
10.534	2119.469
10.584	1363.522
10.592	1664.068
10.629	1746.021
10.630	1809.773
10.640	2164.964
10.864	2747.754
11.327	1827.700
11.329	1891.452
11.348	1290.345
11.421	1426.928
11.423	1518.003
11.585	2383.153
12.256	1390.153
12.431	1453.833
13.193	1307.797
13.669	2191.032
13.736	2109.036
13.760	1680.972
13.945	2090.735
14.315	1616.989
14.398	2136.085
14.441	2427.509
14.529	1808.159
14.623	1398.280
15.156	1835.222
15.320	1434.422
15.570	3009.925
15.652	2162.888
16.214	2344.807
16.242	2098.891
16.335	1661.691
16.438	1588.787
16.515	1871.090
16.518	1998.594
16.824	1716.133
17.512	2726.787
17.631	1961.703
17.633	2043.670
18.301	2271.083
18.574	2052.388];
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % convert yr to d
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(20);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'BeckStan1991';
comment.tWw_m = 'data for males';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'All temperatures are guessed';  
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01413 * (TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
F1 = 'length-length from photo: FL = 0.87*TL'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5VQ8G'; % Cat of Life
metaData.links.id_ITIS = '169189'; % ITIS
metaData.links.id_EoL = '46579984'; % Ency of Life
metaData.links.id_Wiki = 'Archosargus_probatocephalus'; % Wikipedia
metaData.links.id_ADW = 'Archosargus_probatocephalus'; % ADW
metaData.links.id_Taxo = '45302'; % Taxonomicon
metaData.links.id_WoRMS = '159238'; % WoRMS
metaData.links.id_fishbase = 'Archosargus-probatocephalus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Archosargus_probatocephalus}}';
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
bibkey = 'BeckStan1991'; type = 'Article'; bib = [ ... 
'author = {Daniel W. Beckman and A. Louise Stanley and Jeffrey H. Render and Charles A. Wilson}, ' ... 
'year = {1991}, ' ...
'title = {Age and Growth-Rate Estimation of Sheepshead \emph{Archosargus probatocephalus} in {L}ouisiana Waters Using Otoliths}, ' ...
'journal = {Fishery Bulletin, U.S.}, ' ...
'volume = {89}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Archosargus-probatocephalus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'floridamuseum'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.floridamuseum.ufl.edu/discover-fish/species-profiles/archosargus-probatocephalus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
