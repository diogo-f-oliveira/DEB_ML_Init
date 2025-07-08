function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_productus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_productus'; 
metaData.species_en = 'North Pacific hake'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.6); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 02];

%% set data
% zero-variate data
data.am = 16*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(8.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 37;  units.Lp = 'cm';  label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Lpm = 28; units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'Wiki';
data.Li = 105; units.Li = 'cm';  label.Li = 'ultimate total length';               bibkey.Li = 'fishbase';
data.Lim = 83; units.Lim = 'cm'; label.Lim = 'ultimate total length for males';    bibkey.Lim = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 900 mum: pi/6*0.09^3';
data.Wwp = 332;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwp = 0.00457*Lp^3.10, see F1';
data.Wwi = 8.4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.00457*Li^3.10, see F1';
  
data.Ri = 5e5/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';           bibkey.Ri = 'fishbase';
  temp.Ri = C2K(8.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length   
data.tL_f = [ ... % time since birth (yr), total length (cm) 
1.023	21.503
1.023	23.333
1.040	18.758
1.040	19.673
1.043	26.993
1.076	15.556
1.926	19.673
1.988	37.974
2.012	52.614
2.023	33.399
2.035	17.386
2.036	18.301
2.040	30.654
2.056	23.333
2.057	25.621
2.057	26.078
2.057	26.536
2.058	27.908
2.994	17.843
2.997	24.248
2.997	25.621
3.015	22.876
3.019	34.771
3.023	44.379
3.038	36.144
3.039	38.889
3.051	21.961
3.054	28.366
3.059	41.176
3.059	42.092
3.080	47.582
3.091	29.739
3.092	31.569
4.031	75.033
4.033	32.941
4.041	52.614
4.041	54.444
4.047	21.046
4.054	38.889
4.054	40.261
4.057	48.497
4.058	50.784
4.068	29.281
4.070	34.314
4.071	37.059
4.074	44.837
4.075	45.752
4.075	45.752
4.080	58.105
4.990	28.824
5.024	68.627
5.025	23.333
5.028	30.654
5.031	37.974
5.047	32.941
5.048	34.314
5.052	45.294
5.053	47.582
5.060	66.340
5.064	75.490
5.065	30.654
5.068	39.804
5.070	43.464
5.072	49.869
5.073	52.614
5.074	54.444
5.076	58.562
5.078	64.967
6.036	63.137
6.038	67.255
6.046	41.176
6.047	43.922
6.051	54.902
6.053	59.935
6.055	64.967
6.056	65.425
6.057	68.170
6.058	70.458
6.068	50.784
6.071	58.562
6.078	75.948
7.003	82.353
7.020	80.065
7.022	84.641
7.023	86.928
7.031	61.307
7.031	61.307
7.034	68.627
7.035	70.458
7.035	70.458
7.036	72.745
7.036	73.660
7.048	57.647
7.048	58.105
7.049	60.392
7.051	64.510
7.052	66.340
7.056	75.948
7.056	76.863
7.056	77.778
7.059	38.431
7.089	68.170
7.974	66.797
7.976	70.915
7.996	75.033
7.999	82.810
8.009	61.765
8.013	72.745
8.021	92.876
8.034	77.778
8.034	80.065
8.037	85.556
8.038	87.843
8.038	88.301
8.057	91.046
8.078	96.078
9.010	76.405
9.013	82.810
9.014	84.641
9.014	85.556
9.019	97.908
9.030	78.693
9.033	87.843
9.049	80.065
9.049	81.895
9.052	89.673
9.053	91.961
9.062	67.255
9.073	94.248
9.073	95.163
9.073	96.078
10.030	90.588
10.068	94.248
10.070	97.908
10.070	98.824
11.065	96.078
12.102	106.144
13.095	99.281];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
for i=2:size(data.tL_f,1);if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f = C2K(8.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AlvaQuin2022';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
0.975	13.471
1.000	19.307
1.000	18.891
1.013	17.226
1.951	19.856
1.964	19.858
1.988	26.945
2.001	23.196
2.026	21.533
2.026	17.367
2.038	22.368
2.050	30.286
3.001	31.669
3.013	38.754
3.014	32.504
3.014	28.754
3.015	22.504
3.026	35.422
3.038	41.257
3.038	40.007
3.077	26.262
3.988	60.972
4.001	51.807
4.002	45.558
4.002	39.308
4.003	29.308
4.003	29.308
4.014	48.476
4.016	26.810
4.027	44.728
4.027	43.061
4.027	36.811
4.028	35.561
4.028	32.228
4.037	65.979
4.979	33.193
4.989	66.945
5.002	56.946
5.003	50.280
5.003	50.280
5.015	46.532
5.016	42.365
5.027	58.617
5.027	52.367
5.029	39.450
5.040	53.618
5.053	44.037
5.054	36.120
5.980	43.749
6.002	70.002
6.004	46.669
6.015	62.921
6.016	57.504
6.017	47.087
6.027	74.589
6.027	71.255
6.027	67.922
6.029	54.172
6.029	51.672
6.040	66.257
7.003	75.974
7.004	65.974
7.005	53.058
7.016	73.476
7.016	70.976
7.016	68.476
7.016	67.643
7.017	61.393
7.030	59.728
7.030	56.811
7.979	76.110
7.992	78.612
7.993	61.112
8.004	79.863
8.005	67.364
8.017	71.532
9.017	87.087
9.018	75.421];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
for i=2:size(data.tL_m,1);if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m = C2K(8.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AlvaQuin2022';


% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
14.960	20.798
15.733	30.282
17.468	47.421
17.854	47.683
18.241	13.903
18.432	48.076
19.013	49.613
19.588	48.863
20.745	15.609
21.129	49.913
22.280	152.825
23.051	153.349
24.016	119.963
24.594	120.357
24.787	120.488
25.559	86.972
26.713	121.800
27.288	190.276
28.059	190.801
28.059	190.801
29.216	157.547
29.984	226.154
30.947	226.810
31.524	261.245
32.871	296.205
33.837	228.778
34.410	331.296
34.997	161.482
35.165	672.234
35.568	298.041
36.143	366.518
36.915	333.001
37.111	265.049
38.265	299.878
38.840	368.354
39.222	436.699
39.598	641.211
39.606	471.003
40.566	539.742
41.152	369.928
41.725	472.446
43.063	711.655
43.259	643.703
44.046	303.813
44.602	746.746
45.185	645.015
46.137	883.961
46.353	407.512
46.536	611.891
46.709	1020.520
47.489	816.796
47.633	1838.170
47.879	714.934
49.406	1022.356
49.623	511.866
50.009	512.129
50.756	989.234
50.915	1704.235
51.721	955.848
52.677	1126.711
52.871	1092.800
54.607	1059.940
54.608	1025.898
54.788	1298.361
55.753	1264.975
56.341	1061.120
56.522	1299.542
56.685	1912.418
57.291	1334.107
57.315	823.486
58.244	1539.012
58.421	1879.558
58.638	1369.067
58.824	1505.364
59.199	1709.875
59.796	1335.813
60.558	1506.545
62.083	1848.008
62.287	1609.850
63.061	1542.292
63.237	1882.837
63.265	1304.133
63.628	1780.975
64.186	2189.866
64.927	2803.137
65.340	2224.695
65.739	1952.625
65.744	1850.501
66.116	2123.095
66.877	2327.868
67.305	1443.053
67.842	2294.482
68.611	2329.049
68.817	2056.849
68.864	1069.647
69.360	2772.112
69.582	2159.497
69.759	2500.043
69.919	3181.003
70.347	2296.188
70.897	2875.286
71.493	2501.223
71.503	2296.975
71.519	1956.561
72.810	3148.929
72.820	2944.680
73.019	2808.646
73.579	3183.495
74.189	2537.101
74.223	1822.232
74.353	3115.937
74.562	2775.654
75.294	3593.173
75.315	3150.634
75.887	3287.194
76.105	2742.662
77.250	2981.739
77.258	2811.532
77.405	3764.823
77.803	3492.754
77.975	3935.424
79.121	4140.460
79.142	3697.921
79.544	3357.769
80.102	3766.660
80.689	3596.846
80.842	4413.972
81.076	3563.067
81.446	3869.702
82.008	4210.510
82.986	3904.793
83.192	3632.593
83.520	4824.305
84.057	5675.735
84.339	3803.587
84.835	5506.052
84.908	4008.229
85.283	4212.740
85.504	3634.167
85.632	4961.914
86.247	4213.396
86.273	3668.733
86.451	3975.237
86.583	5234.901
86.627	4315.783
87.281	6733.249
89.105	4862.151
90.062	4998.973
90.634	5135.532
90.710	7552.605
91.187	5646.547
91.741	6157.562
91.790	5136.319
92.301	6532.411
92.508	6226.169
92.559	5170.885
92.588	4558.139
93.871	5920.715
94.413	6670.020
94.673	5274.452
95.251	5274.846
96.185	5888.248
97.924	5787.304
98.850	6570.913
99.199	7320.087];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'AlvaQuin2022';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
15.800	162.288
16.763	102.038
17.341	132.808
17.919	163.577
18.882	194.583
19.075	42.608
20.231	104.148
21.195	135.152
21.773	165.922
21.965	74.785
22.929	105.789
24.277	197.865
24.277	106.610
24.855	167.797
25.626	289.940
26.012	259.755
26.590	108.016
27.360	290.995
28.324	169.907
28.709	230.978
29.094	292.050
29.094	231.213
30.250	231.916
30.636	262.568
30.636	414.661
31.407	323.874
32.177	293.926
32.563	263.741
33.526	325.164
34.875	508.494
35.067	295.684
35.067	143.592
35.645	235.198
35.838	387.406
35.838	296.153
36.994	357.692
37.187	479.482
38.536	267.374
38.921	358.864
39.306	419.935
39.692	450.588
40.462	481.474
40.655	420.756
41.040	512.245
41.426	573.315
41.619	451.760
42.197	634.621
42.775	513.300
43.160	665.625
43.931	544.421
44.509	605.610
45.665	697.567
46.628	758.990
47.399	911.549
47.784	729.276
48.748	973.207
48.940	821.234
49.326	517.286
49.904	973.910
50.096	639.427
50.482	852.589
50.867	1035.334
51.638	944.548
52.216	1492.427
52.408	1005.852
52.987	914.949
53.179	1280.086
54.335	1067.861
55.299	1342.211
55.877	1099.217
55.877	1160.054
56.647	1343.031
56.840	1099.803
57.418	1313.082
58.574	1465.878
58.767	1374.740
58.960	1618.203
59.538	1375.209
60.308	1527.768
60.501	1740.813
61.272	1984.629
61.464	1467.636
61.850	1619.961
62.428	1863.658
62.813	1559.711
63.391	1925.081
63.776	1681.970
63.776	2199.081
64.933	1834.764
64.933	2138.947
65.896	2017.860
66.474	1227.337
66.474	2231.139
66.474	1683.611
68.593	1776.156
68.593	2567.029
68.786	2050.036
68.786	2384.637
69.750	1351.002
69.750	2537.315
70.328	1898.883
70.328	2294.321
71.098	1899.352
71.098	2081.861
72.062	2356.212
72.254	2812.602
72.447	2569.374
72.447	2691.046
73.603	2570.077
73.603	1931.294
74.181	2296.665
74.566	2692.336
75.915	2510.648
76.879	3028.343
77.264	2876.487
83.622	3579.975
86.705	4220.634];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'AlvaQuin2022';
comment.LW_m = 'Data for males';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 0 * weights.Lim;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females,males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females,males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Lim is ignored since males still growth at am';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZV7D'; % Cat of Life
metaData.links.id_ITIS = '164792'; % ITIS
metaData.links.id_EoL = '46564953'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_productus'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_productus'; % ADW
metaData.links.id_Taxo = '44372'; % Taxonomicon
metaData.links.id_WoRMS = '272458'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-productus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Merluccius_productus}}';
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
bibkey = 'AlvaQuin2022'; type = 'article'; bib = [ ...
'doi = {10.3897/aiep.52.89824}, ' ...
'author = {Eduardo Alvarez-Trasvi\~{n}a and Casimiro Qui\~{n}onez-Vel\''{a}zquez and Dana I. Arizmendi-Rofr\''{i}Guez and Luis A. Salcido-Guevara and Guillermo Rodr\''{i}guez-Dom\''{i}nguez and Rebeca Sanchez-Cardenas}, ' ... 
'year   = {2022}, ' ...
'title  = {Age and growth of the {P}acific hake, \emph{Merluccius productus} ({A}ctinopterygii: {G}adiformes: {M}erlucciidae), in the {G}ulf of {C}alifornia: {A} multimodel approach}, ' ...
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'page = {251–260}, ' ...
'volume = {52(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-productus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

