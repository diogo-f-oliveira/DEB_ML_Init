function [data, auxData, metaData, txtData, weights] = mydata_Callorhinchus_capensis

%% set  metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Chimaeriformes'; 
metaData.family     = 'Callorhinchidae';
metaData.species    = 'Callorhinchus_capensis'; 
metaData.species_en = 'Cape elephantfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE', 'MISW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12);% K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 't-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2013 04 09];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 


%% set data
% zero-variate data
data.ab = 275; units.ab = 'd';  label.ab = 'age at birth';                 bibkey.ab = 'IUCN';    
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'IUCN: 9-12 months';
data.ap = 1533;   units.ap = 'd';  label.ap = 'age at puberty';            bibkey.ap = 'AnAge';
  temp.ap = C2K(12); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for females, 1204 d for males';
data.am = 12*365;  units.am = 'd';  label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 13*98/120;   units.Lb = 'cm'; label.Lb = 'fork length at birth'; bibkey.Lb = 'IUCN';
data.Lp = 49.6;    units.Lp = 'cm'; label.Lp = 'fork length at puberty';   bibkey.Lp = 'IUCN';
  comment.Lp = 'females, IUCN; males 43.5 cm';
data.Li = 98;    units.Li = 'cm'; label.Li = 'ultimate fork length';       bibkey.Li = 'SASAA';
  comment.Li = 'IUCN: 120 cm total length';

data.Wwi = 5000; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'FreeGrif1993';

data.Ri = 22/365;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% uni-variate data

%  t-L data from  FreeGrif1993
data.tL_f = [ ... % time since birth (yr),
0.070	19.457
0.588	24.802
1.021	32.602
1.022	31.578
1.041	34.036
1.109	26.462
1.128	29.125
1.546	29.142
1.626	34.060
1.975	42.470
2.000	36.123
2.060	39.402
2.188	35.926
2.289	40.435
2.292	37.159
2.368	46.786
2.455	41.671
2.517	43.516
2.520	39.216
2.669	34.307
2.685	41.475
2.973	47.630
3.229	40.474
3.473	49.903
3.577	50.112
3.644	44.381
3.706	43.974
3.726	45.409
4.013	54.021
4.013	53.202
4.056	51.361
4.407	56.904
4.409	54.856
4.473	51.787
4.475	49.944
4.475	48.920
4.992	56.928
5.138	56.320
5.370	53.053
5.390	54.897
5.513	57.564
5.621	53.063
5.665	48.969
5.680	57.980
5.705	51.428
5.706	50.200
5.745	54.911
5.868	57.373
5.971	60.245
6.138	60.251
6.159	59.024
6.370	56.984
6.390	58.009
6.971	62.538
6.972	61.105
6.973	59.876
7.200	64.390
7.972	64.013
8.056	63.811
8.160	63.815
8.805	67.323
9.701	69.612
9.952	69.623];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'female'}; 
temp.tL_f = C2K(12); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FreeGrif1993'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.085	18.966
0.728	27.613
0.977	30.082
0.978	29.257
0.997	31.525
1.247	33.169
1.250	29.870
1.497	34.607
1.623	35.430
1.710	32.541
1.788	37.694
1.797	29.859
1.855	33.775
1.916	36.454
1.932	40.990
2.150	33.769
2.459	38.917
2.465	33.350
2.545	37.060
2.584	40.152
2.791	43.447
2.793	41.179
2.878	40.352
2.919	41.588
2.935	46.330
3.213	41.789
3.231	44.469
3.616	37.450
3.758	42.602
3.818	45.281
3.858	47.755
3.861	44.249
4.005	47.545
4.007	45.896
4.131	47.749
4.257	47.334
4.297	49.395
4.555	43.823
4.801	49.797
4.968	50.618
5.433	47.928];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'male'}; 
temp.tL_m = C2K(12); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FreeGrif1993'; 
comment.tL_m = 'Data for males';

%  L-W data from  FreeGrif1993
data.tW_m = [ ... % time since birth (yr), wet weight (g)
0.569	166.163
0.894	302.115
1.056	407.855
1.139	679.758
1.321	498.489
1.462	377.644
1.463	528.701
1.645	392.749
1.666	558.912
1.666	649.547
1.848	513.595
1.848	619.335
1.849	709.970
1.849	800.604
1.870	891.239
1.970	709.970
2.011	574.018
2.072	634.441
2.173	740.181
2.194	830.816
2.195	1132.931
2.396	694.864
2.397	785.498
2.397	951.662
2.439	1132.931
2.478	755.287
2.497	604.230
2.579	815.710
2.681	800.604
2.723	1117.825
2.883	755.287
2.884	966.767
2.885	1148.036
2.887	1540.785
3.007	1148.036
3.007	1283.988
3.047	1027.190
3.148	891.239
3.169	1027.190
3.190	1329.305
3.191	1540.785
3.311	1178.248
3.351	891.239
3.371	1042.296
3.394	1691.843
3.433	1268.882
3.473	1132.931
3.595	1223.565
3.617	1646.526
3.656	1132.931
3.657	1389.728
3.678	1525.680
3.720	1858.006
3.739	1646.526
3.818	1057.402
3.839	1223.565
3.859	1344.411
3.860	1419.940
3.983	1676.737
4.043	1495.468
4.103	1268.882
4.144	1389.728
4.146	2024.169
4.185	1525.680
4.206	1782.477
4.266	1661.631
4.285	1299.094
4.286	1480.363
4.369	1858.006
4.408	1510.574
4.408	1646.526
4.427	1314.199
4.428	1525.680
4.471	2129.909
4.472	2265.861
4.488	1359.517
4.490	1691.843
4.509	1465.257
4.611	1586.103
4.632	1752.266
4.671	1299.094
4.671	1435.045
4.793	1404.834
4.834	1510.574
4.834	1601.208
4.837	2341.390
4.855	1752.266
4.975	1283.988
4.976	1465.257
4.976	1646.526
5.038	1918.429
5.039	2024.169
5.118	1555.891
5.218	1268.882
5.241	1993.958
5.260	1510.574
5.342	1722.054
5.483	1510.574
5.545	1722.054
5.571	3157.100
5.585	1601.208
5.605	1540.785
5.665	1389.728
5.727	1797.583
5.769	1948.640
5.828	1706.949
5.933	2537.764
6.010	1480.363
6.255	1737.160
6.358	2250.755
6.460	2371.601
6.701	1706.949
6.701	1812.689
7.086	1722.054];
data.tW_m(:,1) = 365 * (.5 + data.tW_m(:,1)); % convert yr to d
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(12); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'FreeGrif1993';
comment.tW_m = 'Data for males';
%
data.tW_f = [ ... % time since birth (yr), wet weight (g)
0.121	29.577
0.383	148.554
0.543	237.893
0.564	148.010
0.967	371.357
1.047	371.115
1.189	385.662
1.248	520.214
1.309	520.033
1.451	369.905
1.530	609.190
1.653	429.182
1.693	503.913
1.712	578.705
1.732	668.467
1.933	787.625
1.934	682.832
1.934	593.010
2.217	681.985
2.317	771.505
2.336	921.149
2.515	1220.013
2.516	1130.191
2.520	666.108
2.559	785.750
2.700	920.060
2.700	815.267
2.701	695.504
2.738	1099.585
2.841	919.637
2.921	994.247
2.923	814.602
2.982	904.243
3.200	1502.395
3.201	1412.572
3.201	1367.661
3.244	1068.132
3.341	1501.971
3.383	1382.087
3.405	1142.500
3.505	1276.931
3.519	1980.480
3.546	1142.076
3.666	1321.358
3.702	1920.054
3.783	1844.960
3.845	1665.134
3.845	1605.252
3.848	1320.814
3.869	1200.990
3.887	1470.397
3.902	2054.183
3.944	1934.299
3.986	1754.533
3.987	1604.829
4.108	1649.377
4.109	1514.643
4.110	1409.850
4.144	2173.221
4.151	1289.966
4.166	1993.515
4.172	1244.994
4.246	2068.125
4.250	1604.042
4.271	1469.248
4.325	2322.381
4.370	1648.591
4.372	1424.034
4.510	1857.753
4.511	1737.990
4.631	1902.302
4.632	1797.509
4.690	2036.854
4.735	1527.739
4.754	1692.353
4.791	2126.374
4.812	1946.668
4.830	2290.928
4.851	2186.074
4.854	1826.784
4.855	1707.021
4.991	2320.385
5.015	1916.123
5.074	2035.705
5.097	1736.236
5.191	2604.218
5.192	2454.514
5.197	1855.697
5.198	1691.022
5.216	2035.281
5.216	1975.400
5.233	2349.600
5.272	2529.124
5.336	2154.682
5.340	1690.599
5.454	2528.579
5.460	1765.088
5.477	2214.140
5.500	1854.789
5.531	3022.361
5.598	2183.836
5.600	1974.250
5.674	2797.382
5.691	3216.493
5.697	2482.942
5.722	1869.094
5.725	1554.716
5.737	2542.703
5.823	1928.674
5.844	1823.820
5.877	2647.073
5.880	2392.575
5.882	2093.167
5.883	2018.315
6.003	2167.656
6.061	2421.972
6.062	2302.208
6.063	2167.475
6.178	2945.574
6.196	3244.922
6.225	2137.050
6.264	2361.485
6.281	2765.626
6.326	2181.659
6.385	2361.122
6.403	2645.500
6.403	2615.559
6.404	2495.796
6.564	2749.809
6.608	2255.664
6.647	2420.218
6.662	3048.915
6.764	2943.820
6.766	2689.322
6.767	2584.529
6.783	3108.434
6.797	1326.953
6.800	3542.515
6.907	2688.899
6.987	2883.272
7.069	2703.385
7.074	2044.687
7.151	2523.498
7.228	3017.280
7.282	3810.531
7.342	1400.172
7.351	2762.420
7.352	2642.657
7.364	3750.408
7.370	2927.035
7.527	3525.368
7.548	3420.514
7.549	3315.721
7.561	4288.738
7.636	2551.988
7.653	2986.069
7.772	3225.233
7.794	3000.616
7.815	2865.822
7.838	2476.531
7.867	1413.570
7.915	3000.253
8.056	2999.830
8.089	3957.816
8.115	3239.175
8.135	3313.967
8.137	2999.588
8.143	2236.097
8.374	3657.561
8.376	3492.886
8.424	4974.777
8.453	3896.846
8.554	3986.366
8.729	4719.372
8.752	4479.785
8.822	3311.910
8.855	4239.956
8.857	3970.488
8.939	3805.571
8.958	3985.156
9.116	4343.962
9.164	3400.705
9.222	3789.754
9.261	3924.367
9.381	4058.738
9.407	3340.097
10.375	3636.602
10.636	3815.461];
data.tW_f(:,1) = 365 * (.5 + data.tW_f(:,1)); % convert yr to d
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(12); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'FreeGrif1993';
comment.tW_f = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.Li = 10 * weights.Li;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouped plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'Wwi is ignored, in view of tL versus tW';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Most fish are caught at less than 100 m depth; occur also at 375 m';
metaData.bibkey.F1 = 'IUCN';
F2 = 'Feeds on sea urchins, bivalves, crustaceans, gastropods, polychaetes and bony fish.';
metaData.bibkey.F2 = 'IUCN';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'PVZC'; % Cat of Life
metaData.links.id_ITIS = '564643'; % ITIS
metaData.links.id_EoL = '46561157'; % Ency of Life
metaData.links.id_Wiki = 'Callorhinchus_capensis'; % Wikipedia
metaData.links.id_ADW = 'Callorhinchus_capensis'; % ADW
metaData.links.id_Taxo = '42191'; % Taxonomicon
metaData.links.id_WoRMS = '221460'; % WoRMS
metaData.links.id_fishbase = 'Callorhinchus-capensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Callorhinchus_capensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Misc'; bib = [ ... % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year   = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'page = {300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FreeGrif1993'; type = 'Article'; bib = [...
'author = {Freer, D. W. L. and Griffiths, C. L.}, ' ... 
'year   = {2010}, ' ...
'title  = {Estimation of age and growth in the {S}t {J}oseph \emph{Callorhinchus capensis} ({D}umeril).}, ' ...
'journal = {S. Afr. J. mar. Sci.}, '...
'page = {75-81}, ' ...
'volume = {13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Callorhinchus_capensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SASAA'; type = 'Misc'; bib = ...
'howpublished = {\url{www.wpangling.co.za/SASAA Records/Ladies Records.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IUCN'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/60138/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Callorhinchus_capensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


