  function [data, auxData, metaData, txtData, weights] = mydata_Megaleporinus_obtusidens
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Anostomidae';
metaData.species    = 'Megaleporinus_obtusidens'; 
metaData.species_en = 'Piapara'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 01];

%% set data
% zero-variate data
data.am = 14*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'ArayAgos2005';   
  temp.am = C2K(24.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21.6;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 76;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 149;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Lp^3.09, see F1';
data.Wwi = 7.3e3;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.09, see F1';
  
data.Ri = 3.7e6/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(24.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Leporinus_acutidens: 2e5*7.3e3/390';

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
 1 17.3 16.6
 2 19.1 19.2
 3 22.4 20.9
 4 26.1 25.5
 5 30.1 28.9
 6 34.5 32.8
 7 37.8 36.3
 8 39.4 38.9
 9 41.8 41.8
10 43.9 45.9
11 46.2 44.7
12 48.8 44.9
13 47.6 NaN]; 
data.tL_fm(:,1) = (data.tL_fm(:,1) +0.8) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm    = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'female','male'}};
bibkey.tL_fm = 'ArayAgos2005';
  
% length-weight
data.LW = [ ... % std length (cm), weight (g)
10.576	14.329
11.241	148.611
11.752	51.154
12.341	112.249
12.413	39.093
13.076	112.399
13.222	88.038
14.029	63.812
14.471	100.487
14.690	51.751
15.353	125.056
15.794	125.146
16.020	344.704
16.233	88.650
16.601	100.920
17.408	88.889
17.483	149.880
17.630	125.519
17.925	186.555
18.293	198.825
18.363	101.278
18.733	186.719
19.025	113.608
19.468	211.259
19.685	89.352
19.834	162.553
20.276	223.618
20.569	174.897
20.576	443.191
20.790	211.527
20.862	150.566
21.157	199.407
21.452	260.443
21.530	406.800
21.669	138.535
21.672	236.097
22.038	199.586
22.200	699.619
22.335	309.402
22.771	150.954
23.002	529.050
23.140	224.200
23.143	321.762
23.439	382.798
23.729	248.710
23.878	346.301
24.175	431.728
24.612	334.256
24.615	431.817
25.128	395.336
25.199	297.789
25.277	444.147
25.570	419.816
25.659	968.615
26.083	383.335
26.232	468.731
26.301	310.208
26.523	383.424
26.528	554.157
26.893	481.061
27.112	420.129
27.118	627.448
27.202	981.123
27.256	322.598
27.262	517.721
27.619	188.525
27.846	420.279
27.852	615.402
28.144	554.486
28.209	274.011
28.360	395.993
28.656	469.224
28.732	578.995
28.735	676.557
29.098	530.289
29.321	615.700
29.470	688.901
29.612	518.198
29.612	530.394
29.830	457.267
30.129	628.060
30.208	823.198
30.209	847.588
30.272	506.138
30.278	689.066
30.423	652.510
30.494	542.768
30.574	774.492
31.017	847.752
31.084	640.449
31.308	750.251
31.524	603.953
31.526	701.515
31.679	908.863
31.826	884.502
31.896	774.760
32.268	957.763
32.358	1506.562
32.425	1274.868
32.631	799.300
32.710	994.438
32.853	872.516
33.143	714.038
33.294	860.410
33.370	945.792
33.446	1031.173
33.511	762.894
33.735	897.085
33.954	823.959
34.032	1006.902
34.034	1067.878
34.247	799.628
34.397	921.610
34.478	1165.529
34.544	909.445
34.620	1019.217
34.697	1128.988
35.061	1031.501
35.216	1299.825
35.431	1104.747
35.435	1251.089
35.579	1141.362
35.596	1751.122
35.646	921.864
35.659	1373.086
35.794	982.870
36.021	1202.428
36.090	1056.101
36.175	1458.557
36.308	970.779
36.439	434.220
36.458	1092.761
36.458	1092.761
36.468	1409.836
36.526	897.653
36.533	1141.557
36.553	1800.097
36.750	1031.845
36.757	1251.358
36.979	1312.379
37.117	1007.529
37.130	1446.556
37.263	983.168
37.270	1214.877
37.281	1592.928
37.339	1080.745
37.562	1166.156
37.643	1410.075
37.732	1958.873
37.794	1568.642
37.939	1483.306
37.944	1666.234
38.079	1276.017
38.148	1093.104
38.150	1166.275
38.228	1324.828
38.523	1385.863
38.591	1178.560
38.672	1446.869
38.675	1544.431
38.679	1690.773
38.739	1215.176
38.756	1800.545
38.961	1288.391
39.120	1703.058
39.188	1495.755
39.478	1373.862
39.484	1581.181
39.779	1617.826
39.781	1703.192
39.844	1337.351
39.920	1422.733
39.996	1508.114
40.004	1800.799
40.008	1934.946
40.283	1288.660
40.286	1374.027
40.367	1654.531
40.374	1874.044
40.593	1837.504
40.670	1959.470
40.724	1313.140
40.730	1496.068
40.807	1618.035
40.818	2008.281
40.883	1703.416
40.947	1386.356
40.960	1825.383
40.962	1910.749
41.318	1520.578
41.464	1484.022
41.480	2020.611
41.547	1801.112
41.554	2057.211
41.603	1240.148
41.838	1715.805
42.225	2398.811
42.280	1752.481
42.345	1496.396
42.429	1850.072
42.445	2398.856
42.572	1703.760
42.654	1996.459
42.662	2276.949
42.722	1813.546
42.731	2106.231
42.732	2167.207
42.945	1898.957
43.011	1642.873
43.021	1996.534
43.101	2203.867
43.308	1752.690
43.532	1899.077
43.551	2521.032
43.610	2057.629
43.669	1545.446
43.760	2143.025
43.766	2350.344
43.838	2289.383
43.908	2204.031
43.985	2313.803
44.212	2533.361
44.282	2411.424
44.332	1618.751
44.412	1850.475
44.423	2204.136
44.492	2082.199
44.511	2728.544
44.653	2533.451
44.708	1911.511
44.710	1996.877
44.718	2265.171
44.801	2594.457
44.837	1313.976
44.851	1777.393
44.852	1838.369
44.878	2716.423
44.950	2667.658
45.079	2057.928
45.087	2314.027
45.144	1753.063
45.200	3667.708
45.300	2070.168
45.448	2118.978
45.463	2618.981
45.546	2960.462
45.677	2399.513
45.694	2997.077
45.698	3131.224
45.743	2167.819
45.885	1997.116
45.903	2606.876
46.107	2033.746
46.413	2460.638
46.553	2228.959
46.572	2887.499
46.653	3119.223
46.782	2509.493
46.784	2582.664
46.844	2119.262
47.095	3180.289
47.158	2826.643
47.286	2168.132
47.287	2229.108
47.293	2412.036
47.303	2753.502
47.369	2521.808
47.385	3046.201
47.441	2473.042
47.526	2863.303
47.629	3863.324
47.752	3046.276
47.787	1753.600
48.210	3619.540
48.406	2802.506
48.415	3131.777
48.482	2887.888
48.484	2973.254
48.504	3643.990
48.541	2412.290
48.621	2644.013
48.834	2387.959
48.991	2729.454
49.005	3192.872
49.160	3485.586
49.204	2485.595
49.281	2607.562
49.287	2814.881
49.529	3534.442
49.539	3863.712
49.668	3278.373
49.821	3485.721
49.951	2900.381
50.022	2827.225
50.110	3327.243
50.126	3863.832
50.389	2802.909
50.691	3083.458
51.657	3473.899
52.080	2888.619
52.192	4205.715
53.270	3401.056
53.648	3742.596
53.678	4766.992
53.914	2803.626
54.736	3279.403];
units.LW   = {'cm', 'g'};  label.LW = {'std length','weight'};  
bibkey.LW = 'ArayAgos2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TG7W'; % Cat of Life
metaData.links.id_ITIS = '641291'; % ITIS
metaData.links.id_EoL = '339901'; % Ency of Life
metaData.links.id_Wiki = 'Megaleporinus_obtusidens'; % Wikipedia
metaData.links.id_ADW = 'Leporinus_obtusidens'; % ADW
metaData.links.id_Taxo = '178532'; % Taxonomicon
metaData.links.id_WoRMS = '1418269'; % WoRMS
metaData.links.id_fishbase = 'Megaleporinus-obtusidens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Megaleporinus_obtusidens}}';  
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
bibkey = 'ArayAgos2005'; type = 'Article'; bib = [ ...  
'author = {Araya, P.R. and A.A. Agostinho and J.A. Bechara}, ' ...
'year  = {2005}, ' ...
'title = {The influence of dam construction on a population of \emph{Leporinus obtusidens} ({V}alenciennes, 1847) ({P}isces, {A}nostomidae) in the {Y}acyreta {R}eservoir ({A}rgentina)}, ' ...  
'journal = {Fisheries Research}, ' ...
'volume = {74}, ' ...
'pages = {198-209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Leporinus-acutidens.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

