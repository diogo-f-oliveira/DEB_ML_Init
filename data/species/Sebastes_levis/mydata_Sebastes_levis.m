function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_levis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_levis'; 
metaData.species_en = 'Cowcod'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
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

data.am = 55*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 39.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 864;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^3.09, see F1';
data.Wwi = 15480;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.09, see F1';

data.Ri  = 1.95e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
0.821	10.286
2.007	19.429
3.182	21.143
4.143	27.048
7.808	28.762
8.550	34.667
9.862	30.667
9.939	32.762
10.618	46.286
10.679	37.714
10.892	33.143
12.062	31.619
12.237	51.238
12.876	37.524
12.897	51.810
13.032	44.190
13.622	46.667
13.850	52.571
14.000	54.667
14.351	44.190
14.434	50.857
14.634	37.143
14.812	58.857
14.949	52.000
15.074	37.714
15.376	44.000
15.615	56.571
16.686	37.905
17.224	55.238
17.422	39.810
17.597	59.810
17.741	58.095
18.183	59.619
18.530	46.476
18.693	57.333
19.192	48.000
20.456	60.571
20.460	63.238
20.761	69.143
20.893	59.048
21.624	58.095
22.160	73.524
22.651	58.667
24.787	66.476
24.998	60.952
25.371	65.143
25.616	82.476
26.252	66.286
27.278	66.667
27.650	71.048
27.862	65.143
28.166	73.143
28.384	71.810
29.780	74.286
30.292	73.905
30.368	75.810
30.726	69.905
31.391	74.095
31.891	65.143
33.135	64.190
33.737	75.429
35.141	83.429
35.355	79.429
36.666	74.476
38.134	76.190
39.818	75.429
39.969	78.667
41.943	75.429
43.265	77.714
43.565	82.476
43.845	73.524
43.856	81.333
44.514	80.381
52.069	86.476
54.702	83.619];
data.tL_f(:,1) = 365*(0.8+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ButlJaco2003';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
7.808	28.571
7.973	41.524
8.555	38.667
9.075	43.619
9.285	36.762
10.031	45.524
10.166	37.905
10.389	40.000
10.616	44.952
11.361	53.524
11.409	36.381
11.635	40.381
11.791	46.667
11.929	41.143
12.239	52.952
12.443	42.286
12.525	47.619
12.653	35.429
12.871	34.095
13.028	40.952
13.125	57.524
13.241	36.571
13.482	51.048
14.437	52.571
14.869	47.429
15.232	45.143
15.321	56.190
16.216	66.857
16.272	55.238
16.704	50.286
16.992	46.667
17.729	49.333
17.822	63.238
18.982	55.048
19.219	66.286
19.580	63.048
19.649	60.381
19.714	54.667
20.234	59.429
20.243	65.714
20.836	70.095
21.039	58.476
21.483	61.905
21.639	68.571
21.852	63.429
22.220	64.952
22.298	68.000
22.800	60.762
23.103	67.238
23.994	75.429
24.632	60.952
24.857	64.571
25.001	62.476
25.006	66.095
25.011	69.714
25.743	69.524
26.764	66.095
27.210	70.286
27.508	74.095
31.030	77.333
31.322	76.571
31.760	75.810
32.634	72.381
33.449	78.476
34.165	67.238
34.534	69.143
34.539	72.571
35.060	78.286
35.415	70.476
37.106	74.286
37.116	81.143
37.535	67.238
37.836	72.952
37.924	82.476
38.791	74.286
39.540	85.524
39.764	88.762
41.153	86.857
41.655	79.429
44.439	79.429
46.121	77.143
47.807	77.905
51.341	89.714
52.067	85.524
55.667	92.571];
data.tL_m(:,1) = 365*(0.8+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ButlJaco2003';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... length (cm), weight (g)
24.380	350.105
25.746	333.334
26.845	377.520
28.215	391.066
28.475	269.472
29.989	358.652
31.634	387.034
32.199	553.136
32.884	567.489
33.562	506.047
34.112	535.720
34.399	656.668
35.053	383.003
35.640	746.169
35.650	837.122
36.579	578.293
36.734	744.879
37.147	774.713
38.390	879.374
38.662	863.892
39.354	938.880
39.494	969.037
40.857	921.947
42.645	1010.804
43.359	1282.857
43.892	1160.941
44.184	1327.365
44.568	1084.340
45.293	1462.504
46.124	1552.490
46.130	4084.335
46.411	1673.438
46.686	1688.274
47.215	1520.882
47.223	1596.677
47.790	1777.937
47.944	1929.364
48.030	1474.438
49.440	1851.796
49.980	1790.516
50.272	1956.940
50.956	1956.134
51.228	1940.652
51.535	2243.506
51.623	1803.739
51.630	1864.374
51.663	2167.551
51.955	2333.975
52.619	2151.263
52.729	1908.561
52.744	2044.990
53.007	1953.715
53.436	2119.978
53.731	2316.720
54.012	2377.033
54.178	2649.730
54.559	2376.388
54.669	2133.686
55.175	1769.229
55.669	2526.686
56.388	2844.215
56.608	2358.810
56.742	2328.331
56.772	2601.190
56.810	2949.843
56.915	2661.664
56.919	2691.982
56.964	3101.269
57.826	3479.273
58.125	3706.332
58.175	2917.912
58.200	3145.295
58.218	3312.042
58.270	2538.781
58.325	3039.022
58.343	3205.769
58.550	3842.278
60.300	3582.481
60.333	3885.658
60.364	2930.491
60.386	3127.556
60.405	3294.303
60.452	3718.750
60.511	3021.283
60.628	2839.216
60.913	2945.005
61.237	3399.447
61.522	3505.236
61.564	3884.207
61.946	3626.023
62.034	3186.256
62.115	3913.879
62.159	3079.983
62.333	3413.315
62.376	3807.445
62.433	4322.845
62.480	3504.107
62.580	4413.636
62.595	4550.066
63.419	4579.416
63.423	3381.708
63.434	3472.661
63.477	3866.790
63.659	4275.917
63.704	4685.205
63.784	4169.644
63.803	4336.391
63.987	3532.651
64.691	3713.751
65.205	4653.114
65.403	3970.644
65.491	4758.903
65.660	3818.733
65.686	5289.300
65.722	4379.610
65.790	3757.937
65.793	5016.280
65.851	5546.839
65.964	4091.270
65.965	5334.454
66.258	4272.853
66.267	3120.622
66.291	4576.029
66.486	5106.427
66.553	4469.595
66.591	4818.248
66.841	4605.702
67.172	5120.779
67.277	6075.785
67.321	2755.520
67.378	4514.104
67.387	4589.898
67.487	5499.428
67.502	4392.672
67.615	4180.288
67.637	4377.352
67.680	4771.481
67.685	4816.958
68.574	4194.318
68.663	4997.735
68.775	4770.191
68.778	6043.694
68.821	5194.639
69.015	5709.877
69.275	4345.100
69.314	5936.937
69.332	6103.684
69.370	5209.152
69.684	5572.641
69.797	5360.257
69.859	4677.948
70.022	4920.328
70.169	5011.120
70.593	5131.907
70.815	5904.846
70.833	6071.592
70.913	5556.031
70.928	5692.461
70.962	5995.637
71.180	5495.073
71.496	4645.696
71.543	5070.143
71.567	5282.366
72.803	5326.391
72.908	6281.397
72.924	5189.801
73.203	6478.139
73.256	5720.037
73.302	6129.325
74.454	6658.594
74.461	6719.229
74.471	6810.182
74.556	6340.097
74.656	6006.442
74.992	5338.970
75.081	6142.388
75.095	6263.658
76.377	6732.130
76.574	6034.502
76.626	6504.425
76.668	6883.396
76.769	5321.715
76.783	6686.170
77.844	7624.888
78.367	7412.019
78.377	7502.972
78.486	7245.111
78.811	7714.712
79.754	8820.338
80.076	8016.437
80.098	9456.686
80.127	7243.176
80.132	7288.652
80.284	8668.105
80.290	7485.556
80.312	7682.620
81.148	7818.082
81.845	7938.546
81.851	9227.208
82.044	8499.262
82.087	7650.206
82.628	8832.110
84.224	9664.072
85.793	9010.307
85.818	9237.690];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
45.782	180849.969
50.715	665299.117
51.255	379154.395
53.647	552193.926
58.413	665568.103
59.807	583855.815
61.520	1058758.376
62.223	1105952.727
63.054	973906.278
63.592	668893.658
65.012	958251.448
65.271	659518.346
65.434	983423.419
65.439	1058895.315
67.261	1093550.192
68.404	1417489.449
68.793	980396.196
70.489	1216304.471
70.504	1430141.459
70.756	1024489.862
72.695	735249.447
72.875	1307582.807
76.556	1905195.656
78.065	1458707.503
79.358	1943029.418
79.882	1430469.134
80.041	1704059.610];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01023*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7MW'; % Cat of Life
metaData.links.id_ITIS = '166754'; % ITIS
metaData.links.id_EoL = '46568158'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_levis'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_levis'; % ADW
metaData.links.id_Taxo = '187290'; % Taxonomicon
metaData.links.id_WoRMS = '274812'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-levis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_levis}}';
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
bibkey = 'ButlJaco2003'; type = 'article'; bib = [ ... 
'author = {Butler, J.L. and L.D. Jacobson and J.T. Barnes and H.G. Moser},' ...
'year = {2003}, ' ...
'title = {Biology and population dynamics of cowcod (\emph{Sebastes levis}) in the southern {C}alifornia {B}ight}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {101(2)}, ' ...
'pages = {260-280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-levis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
