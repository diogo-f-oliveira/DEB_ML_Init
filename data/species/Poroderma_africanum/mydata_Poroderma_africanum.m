function [data, auxData, metaData, txtData, weights] = mydata_Poroderma_africanum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Scyliorhinidae';
metaData.species    = 'Poroderma_africanum'; 
metaData.species_en = 'Striped catshark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 29];

%% set data
% zero-variate data;
data.ab = 239.5;    units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'KiyaJohn2023';    
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps of all data are guessed';
data.ap = 6.6*365;  units.ap = 'd';      label.ap = 'age at puberty';           bibkey.ap = 'KiyaJohn2023';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 12*365; units.am = 'd';       label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 14.6;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';   bibkey.Lb  = 'KiyaJohn2023';
data.Lp  = 79;    units.Lp  = 'cm';    label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Grus2017';
data.Lpm  = 78;    units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Grus2017';
data.Li  = 100;   units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'Grus2017';

data.L_24 = 82.4; units.L_24  = 'cm';    label.L_24  = 'total length 24 yr'; bibkey.L_24  = 'Grus2017';

data.Wwb = 17.19;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KiyaJohn2023';
data.Wwp = 2.56e3;    units.Wwp = 'g';     label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'KiyaJohn2023'; 
  comment.Wwp = 'based on (Lp/Li)^3 * Wwi';
data.Wwi = 5.2e3;  units.Wwi = 'g';     label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KiyaJohn2023';
  comment.Wwi = 'based on LW_f data';

data.Ri  = 2.5/30.5; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'KiyaJohn2023';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
13.032	77.346
13.242	57.444
14.923	57.166
15.135	116.733
15.975	76.859
17.027	116.420
17.446	76.616
18.497	96.309
19.547	56.400
20.176	36.429
21.859	75.885
22.491	115.516
23.753	135.174
24.592	115.168
25.643	114.994
25.643	114.994
26.277	194.359
27.114	114.750
27.324	94.848
28.798	193.942
30.059	193.733
30.059	193.733
30.903	273.063
32.164	292.722
33.004	272.715
33.004	272.715
34.476	292.339
34.688	351.907
35.530	391.502
36.369	331.761
36.583	431.063
37.420	331.587
37.842	391.120
37.842	391.120
38.685	450.583
39.527	510.046
39.942	351.037
40.577	470.137
40.577	470.137
41.627	450.096
41.843	609.000
42.472	569.161
43.312	549.155
44.361	509.246
44.367	688.053
44.993	548.876
45.415	608.409
45.420	747.481
45.838	667.942
47.101	727.335
47.102	767.070
48.778	607.852
48.786	826.394
49.417	846.157
50.049	905.655
50.254	746.681
50.257	826.150
51.316	1084.253
51.942	945.077
52.571	905.237
53.415	984.568
53.817	487.813
54.049	1103.668
54.257	1024.164
55.515	944.485
55.521	1123.292
55.938	1043.753
56.997	1262.121
57.179	467.388
57.396	646.160
57.411	1083.244
57.834	1162.644
58.471	1361.214
58.675	1162.505
59.312	1361.075
59.940	1281.501
60.366	1440.371
60.774	1102.555
60.783	1340.964
61.630	1539.499
61.630	1539.499
62.043	1320.888
62.467	1420.155
63.313	1578.956
63.520	1499.451
63.740	1777.560
64.157	1678.154
64.167	1976.165
64.364	1578.782
65.428	1956.089
65.632	1797.115
66.261	1737.408
66.905	2134.652
67.521	1737.199
67.736	1876.237
67.958	2213.948
68.375	2094.674
69.203	1756.788
69.423	2034.898
70.049	1895.721
70.476	2094.326
70.485	2352.603
70.902	2253.196
70.906	2372.400
71.102	1975.017
71.944	2014.613
72.578	2113.845
72.586	2332.387
72.592	2491.327
73.006	2312.450
73.234	2828.969
73.422	2193.176
73.646	2590.490
73.850	2411.648
74.486	2570.483
76.163	2451.000
76.165	2510.603
76.171	2689.410
76.812	2987.317
77.001	2391.259
77.009	2609.801
77.024	3027.017
77.648	2848.105
77.657	3106.382
78.486	2768.497
78.914	2986.969
79.333	2947.164
79.344	3265.043
79.976	3304.674
79.981	3463.613
80.150	2291.400
80.608	3364.172
80.809	3105.860
80.982	2032.984
81.009	2807.814
81.015	2986.621
81.032	3463.439
81.670	3681.877
81.861	3145.421
82.074	3224.856
82.502	3443.328
82.926	3542.596
83.120	3085.610
83.129	3324.019
83.327	2986.238
83.975	3482.820
83.983	3721.229
84.174	3164.906
84.182	3383.448
84.372	2807.257
84.608	3562.185
84.619	3880.064
84.801	3065.464
84.834	4019.101
85.008	2966.092
85.053	4257.476
85.241	3621.683
85.245	3740.887
85.441	3343.504
85.640	3025.590
85.892	4217.601
86.069	3283.797
86.074	3403.002
86.088	3800.351
86.923	3641.272
87.136	3720.707
87.140	3859.779
87.358	4058.418
87.584	4535.202
87.775	3978.879
87.785	4257.023
87.978	3780.170
88.176	3422.521
88.616	3978.740
88.623	4177.414
88.822	3879.368
90.066	3382.473
90.081	3819.557
90.305	4216.871
90.725	4196.934
90.924	3879.020
90.927	3958.490
93.883	4355.351
94.297	4176.475
94.723	4335.345
96.825	4354.864];
units.LW_f = {'cm', 'g'}; label.LW_f = {'time since birth', 'total length', 'females'};  
bibkey.LW_f = 'KiyaJohn2023';
comment.LW_f = 'data from captive individuals';
%
data.LW_m = [ ... % total length (cm), weight (g)
12.654	37.392
14.341	56.852
15.185	17.239
16.450	36.768
16.661	56.470
16.872	56.436
18.348	56.193
18.770	36.387
19.613	75.721
20.246	95.354
21.090	36.005
22.144	35.832
22.777	94.938
23.620	134.273
24.464	94.661
24.886	94.591
25.308	55.048
25.308	114.259
26.151	114.120
27.627	94.140
28.049	153.281
28.893	153.143
29.947	133.232
30.369	172.637
30.791	192.304
31.213	251.445
31.424	172.463
32.056	251.307
32.478	192.027
32.689	330.150
33.322	251.098
34.165	310.170
34.798	270.592
35.641	329.664
35.641	250.717
36.274	428.244
36.907	270.246
37.961	349.020
38.383	289.740
38.594	447.600
39.438	427.724
39.859	388.181
40.281	506.533
40.914	605.113
40.914	447.218
41.336	486.622
41.547	664.219
42.390	565.396
43.234	703.416
43.234	525.784
44.077	584.856
45.554	505.666
45.764	781.947
45.975	663.491
47.663	663.213
47.873	564.494
48.295	742.057
48.928	781.426
49.561	919.480
50.404	919.341
51.670	800.712
51.880	958.572
52.513	879.521
53.146	997.838
54.622	997.595
56.942	1095.898
58.629	1233.778
59.051	1312.656
62.004	1766.118
62.425	1469.996
62.636	1746.277
63.691	1647.419
63.691	1785.577
64.745	1528.825
65.167	1607.703
65.378	1923.458
66.011	2081.248
66.011	1725.985
68.752	2061.060
69.807	2120.098
71.705	2277.680
72.759	2238.033
72.970	2415.630
74.657	2553.510
75.079	2652.125
75.290	2494.196
76.134	3184.846
77.610	2651.709
78.453	2789.728
78.875	2730.448
79.297	2513.274
80.351	3085.469
81.617	3262.892
82.250	2986.472
82.882	3262.684
83.093	3144.228
84.148	2808.528
84.359	3834.809
84.569	3420.301
84.780	2966.319
84.780	4130.793
84.991	3262.337
85.413	3617.531
85.624	3124.075
85.835	3400.356
86.678	3183.112
86.889	3775.183
86.889	3479.130
87.311	3340.903
87.522	3459.289
87.944	3834.220
88.366	3340.729
88.998	3656.415
89.420	2294.503
89.420	3597.135
90.053	2866.768
90.053	3064.136
90.053	3241.768
91.318	3182.349
91.318	3340.244
91.318	3498.138
91.951	3379.613
94.271	3280.548
96.169	4346.025
96.380	3734.148
97.645	3003.677
97.856	3497.063
98.278	4148.310];
units.LW_m = {'cm', 'g'}; label.LW_m = {'time since birth', 'total length', 'males'};  
bibkey.LW_m = 'KiyaJohn2023';
comment.LW_m = 'data from captive individuals';

%% set weights for all real data
weights = setweights(data, []);
weights.L_24 = 3 * weights.L_24;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00282*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LY3N'; % Cat of Life
metaData.links.id_ITIS = '160168'; % ITIS
metaData.links.id_EoL = '46559914'; % Ency of Life
metaData.links.id_Wiki = 'Poroderma_africanum'; % Wikipedia
metaData.links.id_ADW = 'Poroderma_africanum'; % ADW
metaData.links.id_Taxo = '41933'; % Taxonomicon
metaData.links.id_WoRMS = '217649'; % WoRMS
metaData.links.id_fishbase = 'Poroderma-africanum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Poroderma_africanum}}';
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
bibkey = 'Grus2017'; type = 'phdthesis'; bib = [ ...
'author = {Samantha P. Grusd}, ' ...
'year = {2017}, ' ...
'title  = {Using mark-recapture methods to estimate population size and survival of pyjama  sharks (\emph{Poroderma africanum}) in {M}ossel {B}ay, {S}outh {A}frica}, ' ...
'school = {University of Cape Town}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KiyaJohn2023'; type = 'article'; bib = [ ... 
'doi = {10.1111/jfb.15555}, ' ...
'author = {Itsuki Kiyatake and Thomas L. Johnson and Emy Cottrant and Yoshikazu Kitadani and Kiyoko Onda and Mikito Murata and Natalia J. Drobniewska and Timothy G. Paulet and Kiyonori Nishida}, ' ... 
'year = {2023}, ' ...
'title = {A comparison of the growth and development of pyjama sharks (\emph{Poroderma africanum}) in wild and captive populations}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {306(6)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Poroderma-africanum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  