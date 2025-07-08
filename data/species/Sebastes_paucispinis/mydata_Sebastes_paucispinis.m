function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_paucispinis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_paucispinis'; 
metaData.species_en = 'Bocaccio rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 22];

%% set data
% zero-variate data

data.am = 50*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMorr1990'; 
data.Li  = 91;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 892;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMorr1990'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 11.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 2.3e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(5.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_fm = [ ...
  2.5 33.4 34.5
  3.5 39.1 38.2
  4.5 43.1 42.0
  5.5 45.5 44.2
  6.5 51.4 47.8
  7.5 57.9 56.3
  8.5 63.4 58.1
  9.5 66.4 58.9
 10.5 65.5 63.2
 11.5 66.5 58.0
 12.5 68.0 NaN
 13.5 73.0 NaN];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % convert yr 
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(5.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Wilk1980'; treat.tL_fm = {1 {'females','males'}}; 

% length-weight
data.LW_f = [ ... length (cm), weight (g)
22.883	71.198
23.423	187.703
23.784	187.703
23.964	161.813
24.504	135.923
24.504	161.813
26.126	433.658
27.027	161.813
28.288	174.758
31.712	317.153
33.874	368.933
34.595	420.712
35.135	731.392
35.495	459.547
35.856	394.823
36.036	446.603
36.757	563.107
36.937	550.163
37.117	873.787
38.198	524.272
39.640	692.557
40.000	757.282
40.180	627.833
41.081	537.217
41.622	770.227
41.622	860.842
41.802	705.502
43.423	796.117
43.423	692.557
43.604	860.842
44.865	964.402
44.865	1003.237
45.225	1572.816
45.225	847.897
45.405	822.007
46.126	1663.431
46.667	938.512
46.847	1236.246
47.027	873.787
47.207	1067.962
47.928	1029.127
48.108	1106.797
48.108	1055.017
48.288	834.952
48.468	1042.072
48.649	1210.357
48.649	1378.641
49.189	1275.081
49.550	1080.907
50.090	1456.311
50.090	1430.421
50.090	1417.476
50.090	1326.862
50.270	1546.926
50.270	1508.091
50.270	1016.182
50.450	1132.687
51.171	1456.311
51.171	1249.192
51.351	1132.687
51.712	1792.881
51.712	1663.431
51.892	1210.357
52.072	1132.687
52.252	1391.586
52.432	1508.091
52.613	1689.321
53.153	1236.246
53.333	1650.486
53.513	1145.632
53.694	1391.586
53.874	1715.211
53.874	1689.321
53.874	1521.036
54.054	1611.651
54.595	1288.027
54.775	1508.091
54.955	1909.386
54.955	1572.816
55.135	2038.835
55.495	1805.826
55.676	1689.321
56.036	1883.495
56.036	1805.826
56.216	1831.716
56.396	1598.706
56.577	2090.615
56.577	2194.175
56.757	1987.056
56.757	1715.211
57.297	2349.515
57.297	1469.256
57.477	2245.955
57.658	2284.790
57.838	1987.056
57.838	1482.201
58.018	1857.606
58.018	1987.056
58.378	2530.745
58.559	2453.075
58.559	2375.405
58.739	1741.101
58.919	2155.340
59.640	2582.525
59.820	2673.140
59.820	2310.680
59.820	2038.835
60.000	2388.350
60.000	1948.221
60.360	1974.110
60.360	1857.606
60.360	1598.706
60.541	2194.175
61.081	2750.809
61.081	2090.615
61.261	2828.479
61.261	2517.800
61.441	2699.029
61.622	2828.479
62.342	2893.204
62.342	2258.900
62.342	2194.175
62.523	2207.120
62.703	3165.049
62.703	2983.819
62.883	2906.149
62.883	2466.020
62.883	2323.625
63.063	3126.214
63.063	2673.140
63.604	2880.259
63.784	2750.809
63.784	2789.644
63.964	2271.845
64.144	3398.059
64.144	3048.544
64.144	2944.984
64.324	2440.130
64.685	3087.379
64.685	2103.560
64.865	2983.819
65.045	2802.589
65.045	2582.525
65.225	4032.363
65.225	3501.618
65.225	2621.360
65.405	3928.803
65.405	3152.104
65.405	2711.975
65.586	3656.958
65.586	3035.599
65.946	2789.644
66.306	3320.389
66.306	3177.994
66.667	2802.589
67.387	3423.949
67.387	3423.949
67.748	3682.848
67.748	3682.848
67.928	2789.644
68.108	3152.104
68.288	3074.434
68.468	3190.939
68.468	3126.214
68.829	3579.288
69.009	2919.094
69.189	3682.848
69.189	3501.618
69.189	3449.839
70.270	3877.023
70.631	3773.463
72.072	4161.812
72.072	4045.308
72.432	3773.463
74.054	4511.327
75.135	4860.842
77.658	4640.777
78.739	4990.291
78.919	5844.660
82.162	5831.715];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'LoveMorr1990';
%
data.LW_m = [ ... length (cm), weight (g)
20.278	112.862
20.280	99.005
22.832	126.971
22.836	106.186
22.985	175.485
22.988	154.701
22.988	154.701
25.382	175.723
25.492	487.512
25.861	175.770
26.504	155.049
27.131	231.323
27.294	210.554
27.931	224.474
29.040	286.939
29.995	307.819
31.539	647.464
31.742	377.276
32.320	765.324
33.660	377.466
33.971	432.923
33.981	370.569
34.757	516.142
35.405	460.779
35.656	890.365
35.715	516.237
36.197	502.428
36.199	488.572
36.750	1042.899
36.823	585.631
36.829	550.990
37.602	710.419
38.254	634.272
38.580	592.733
39.378	599.740
39.526	675.968
40.332	627.549
40.333	620.620
40.470	766.130
41.120	696.911
41.122	689.982
41.429	766.225
41.735	849.396
41.752	745.472
41.761	690.046
42.063	800.930
42.686	897.990
43.335	842.627
43.350	745.630
43.654	842.658
43.976	828.833
44.115	960.487
44.764	898.195
45.085	891.298
45.383	1022.968
45.396	946.757
45.625	1507.980
45.690	1106.139
45.699	1050.713
45.702	1029.928
46.037	932.963
46.519	919.154
46.987	988.485
46.987	988.485
47.055	1563.549
47.124	1133.995
47.283	1134.011
47.588	1231.038
47.748	1224.126
47.933	1071.719
47.934	1064.791
48.536	1293.488
48.544	1244.990
48.882	1134.169
49.322	1376.706
49.513	1182.730
49.683	1120.391
49.783	1494.535
49.815	1293.614
50.249	1577.722
50.311	1189.737
50.599	1390.689
50.644	1106.629
50.768	1328.351
50.781	1252.139
50.900	1501.574
51.020	1751.009
51.593	1169.079
51.598	1134.438
51.717	1390.800
51.731	1307.661
51.827	1702.589
51.846	1584.808
51.851	1557.095
51.863	1480.884
51.903	1231.465
52.295	1778.848
52.663	1474.035
52.678	1377.039
52.915	1896.693
52.958	1626.489
53.167	1321.660
53.425	1702.747
53.443	1591.895
53.495	1266.265
53.608	1557.269
53.618	1494.914
53.624	1460.273
53.892	1785.935
54.071	1661.241
54.340	2977.665
54.369	1799.839
54.592	1404.942
54.670	1917.651
54.673	1896.867
54.838	1862.241
55.014	1765.260
55.329	1793.005
55.504	1696.025
55.521	1592.101
55.530	1536.674
55.623	1952.388
55.835	1626.774
56.190	1405.100
56.233	2132.587
56.259	1973.236
56.271	2894.715
56.277	1862.383
56.308	1668.391
56.331	1522.897
56.619	1716.921
56.701	2208.845
56.764	1813.933
57.231	1890.191
57.342	2195.052
57.349	2153.483
57.695	1987.235
57.709	1897.167
57.856	1980.323
57.860	1952.609
57.878	1841.757
58.001	2070.406
58.051	1758.633
58.631	2132.824
58.988	1897.294
58.996	1848.795
59.009	1765.656
59.054	2486.215
59.087	2278.366
59.106	2160.585
59.408	2271.469
59.452	1994.337
59.757	2084.437
59.856	2465.509
60.065	2160.679
60.138	2701.102
60.217	2209.193
60.235	2091.413
60.245	2029.058
60.317	2583.337
60.380	2188.424
60.631	2618.010
60.684	2285.452
60.886	2022.193
61.294	2465.651
61.787	2382.559
62.059	2680.507
62.103	2403.376
62.116	2327.164
62.195	2832.946
62.227	2632.025
62.420	2424.192
62.440	2299.483
62.453	3214.034
63.511	2597.510
66.680	2764.106];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
38.435	34894.734
41.830	156440.539
42.923	310328.826
43.920	124139.898
45.005	246145.946
47.972	341206.900
52.410	441288.678
52.611	409364.599
55.527	329073.239
56.658	610490.481
58.532	556976.855
62.741	588022.289
65.692	1363279.512
66.083	1262235.408
66.238	1070900.135
67.638	826176.756
68.403	1298971.111
68.901	836553.128
69.205	1165961.089
69.653	1261524.125
72.412	2100587.665
75.531	1993685.932
75.643	1648253.171];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(5.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set2};
metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XZRV'; % Cat of Life
metaData.links.id_ITIS = '166733'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_paucispinis'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_paucispinis'; % ADW
metaData.links.id_Taxo = '187315'; % Taxonomicon
metaData.links.id_WoRMS = '274833'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-paucispinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_paucispinis}}';
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
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins},' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wilk1980'; type = 'article'; bib = [ ... 
'author = {Wilkins, M.E.},' ...
'year = {1980}, ' ...
'title = {Size composition, age composition and growth of chilepepper, \emph{Sebastes goodei}, and bocaccio, \emph{S. paucipinis} from the 1977 rockfish survey}, ' ...
'journal = {Mar. Fish. Rev.}, ' ...
'volume = {(Mar.-Apr.)}, ' ...
'pages = {48-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-paucispinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
