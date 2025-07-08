function [data, auxData, metaData, txtData, weights] = mydata_Conilurus_penicillatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Conilurus_penicillatus'; 
metaData.species_en = 'Brush-tailed rabbit rat'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 41;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Kemp2021';   
  temp.tg = C2K(35.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '36-46 d';
data.tx = 25;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Kemp2021';   
  temp.tx = C2K(35.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '23-40';
data.tp = 70;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';
  temp.tp = C2K(35.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 10;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Kemp2021';
  comment.Wwb = 'males are heavier';
data.Wwx = 27;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'Kemp2021';
  comment.Wwx = '23-40 g';
data.Wwi = 168;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Kemp2021';

data.Ri  = 3*2.73/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Kemp2021';   
  temp.Ri = C2K(35.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.73 pups per litter; 3 litters per yr assumed';

% uni-variate data

% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.950	9.761
1.319	5.584
2.427	7.374
3.165	13.342
6.120	10.955
6.120	16.922
7.597	15.729
7.966	22.890
8.705	19.310
8.705	25.874
8.705	12.745
9.074	27.067
10.182	25.277
10.182	20.503
10.551	33.035
12.028	16.326
12.767	22.293
13.136	30.051
14.614	36.616
14.614	32.438
15.721	33.632
16.091	24.680
16.091	22.293
17.199	40.793
17.568	31.841
17.937	47.357
18.306	37.212
19.784	51.535
20.522	47.357
20.522	33.632
20.892	54.518
21.630	40.793
22.369	41.390
22.738	59.889
23.107	42.583
23.107	48.551
23.107	36.019
23.477	58.696
24.215	38.406
24.585	52.728
24.954	64.663
24.954	49.744
24.954	45.567
26.431	41.390
26.800	68.841
26.800	60.486
26.800	57.502
26.800	48.551
27.539	52.728
27.908	39.599
28.277	73.018
29.385	67.050
29.385	55.115
29.755	60.486
30.124	57.502
30.493	67.050
30.863	74.808
32.340	79.582
32.340	63.470
32.709	60.486
33.448	64.067
33.817	64.067
33.817	70.034
34.555	85.550
34.555	92.711
35.663	69.437
35.663	73.018
36.033	81.373
36.033	62.276
36.771	101.662
36.771	89.130
36.771	67.050
38.248	104.050
38.248	74.808
38.248	82.566
38.248	69.437
38.618	93.905
39.726	62.276
40.095	90.921
40.834	98.082
41.203	108.824
41.203	85.550
42.680	114.194
42.680	101.662
42.680	87.340
42.680	92.711
43.049	72.421
43.049	77.792
44.157	96.292
44.157	69.437
44.526	102.856
45.634	117.178
45.634	107.630
45.634	86.147
46.004	111.211
46.004	91.518
47.112	123.146
47.112	98.082
48.219	87.340
48.219	81.969
48.958	120.759
48.958	93.308
50.066	126.130
50.066	117.178
50.435	108.227
50.435	123.146
50.435	114.194
50.435	97.485
51.912	112.404
53.020	133.888
53.020	100.469
53.020	117.178
53.020	121.952
54.497	136.275
54.497	107.630
54.867	94.501
55.605	124.339
55.975	113.001
56.344	121.356
57.083	121.356
57.083	115.985
57.452	142.242
57.452	100.469
57.452	98.679
57.821	83.163
58.929	136.275
59.668	142.242
60.037	115.985
60.406	116.581
60.406	110.017
61.145	128.517
61.145	123.743
61.145	102.856
61.514	132.694
62.991	130.307
63.361	107.630
63.730	143.436
64.099	150.597
64.099	128.517
64.099	99.872
64.468	132.694
65.576	114.791
66.315	141.645
66.315	132.694
66.684	123.743
67.423	136.275
68.161	147.613
68.531	107.630
69.269	150.597
69.269	143.436
70.377	115.388
70.746	154.774
70.746	133.888
71.116	150.000
71.854	114.791
71.854	102.856
73.701	130.307
73.701	118.372
74.809	160.145
74.809	142.839
74.809	150.000
75.547	110.017
76.655	143.436
77.763	163.726
78.132	145.823
80.348	126.130
80.717	155.968
80.717	164.919
81.825	145.823
81.825	132.097
82.195	165.516
84.780	160.145
85.149	114.194
85.149	155.968
85.518	138.662
85.518	150.000
86.995	172.080
87.734	143.436
88.473	126.726
88.473	136.275
90.688	150.597
90.688	116.581
91.427	161.338
91.796	124.339
92.166	140.452
92.904	131.500
94.012	148.210
94.381	160.742
94.381	129.710
96.597	175.064
96.597	162.532
97.336	155.371
97.705	172.080
99.552	151.194
99.921	167.903
100.290	112.404
100.290	160.742
101.029	132.694
101.029	140.452
101.398	158.951
101.767	178.048
101.767	173.274
104.722	126.130
107.676	188.193
107.676	175.064
108.415	164.322
109.522	136.871
111.000	193.564
112.846	188.193
113.215	175.064
113.585	196.547
113.585	143.436
115.431	182.822
116.170	150.597
117.278	176.854
118.016	165.516
118.016	152.387
119.124	147.613
119.493	159.548
120.971	191.177
124.664	161.935
125.033	176.854
125.402	133.291
129.095	198.934
132.050	184.612
132.788	161.338
133.157	133.291
135.373	188.193
138.697	158.355
140.174	182.822
140.543	169.693
140.913	138.662
143.867	137.468
144.236	184.015
150.514	169.096
153.099	143.436
156.054	193.564
156.423	145.823
156.423	182.225
164.548	174.467
169.718	185.806
171.195	178.645
177.473	178.048
188.182	168.500
191.506	186.402
198.523	196.547
215.141	163.129
230.651	182.225];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'weight', 'female'};  
temp.tWw_f  = C2K(35.9);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Kemp2021';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
0.018	10.379
0.407	14.236
0.611	11.350
1.833	8.789
2.240	13.283
3.666	16.177
3.666	13.289
4.073	20.029
4.888	20.033
5.499	14.903
6.721	19.721
6.925	15.551
7.128	25.820
7.739	22.614
7.739	22.614
8.554	16.201
8.758	20.052
8.961	27.753
9.369	30.964
9.776	27.757
10.387	23.910
10.998	31.293
11.202	28.406
11.405	33.541
11.813	25.521
12.016	35.790
12.627	31.621
12.831	29.697
13.035	33.869
13.442	37.080
13.646	31.626
14.257	37.084
14.257	23.929
15.071	34.842
15.071	40.938
15.682	44.791
15.682	28.107
15.682	32.278
15.886	39.658
16.090	24.579
16.497	36.774
17.515	42.875
17.515	36.779
18.126	39.990
18.330	40.312
18.330	33.574
19.145	44.808
19.348	44.809
20.570	41.285
20.570	34.868
20.774	48.987
20.978	39.683
21.181	43.855
21.181	46.101
21.589	49.312
22.607	49.637
22.811	43.542
23.218	54.453
23.625	49.001
24.033	47.719
24.033	53.815
24.236	43.870
24.644	56.706
24.847	63.445
25.662	61.524
25.866	53.182
26.477	56.715
26.680	52.865
27.088	66.343
27.291	43.243
28.310	58.649
28.717	67.314
28.921	54.801
29.735	63.468
30.550	68.927
31.161	82.085
31.976	60.592
32.179	56.421
32.587	67.653
32.587	64.766
32.587	63.161
32.994	74.714
32.994	67.014
33.605	82.097
34.216	69.586
35.031	82.104
35.438	74.726
36.049	81.467
36.049	71.199
36.456	86.282
37.067	76.980
37.271	82.435
37.882	98.160
38.289	91.424
38.289	78.590
38.493	83.083
39.308	83.728
39.511	95.280
40.326	76.033
40.530	97.852
40.530	78.921
40.937	85.020
41.955	103.955
41.955	101.709
41.955	81.174
43.177	92.089
43.585	106.209
44.196	87.923
44.399	109.421
46.029	115.846
46.029	114.884
46.029	108.146
46.029	95.632
46.232	93.067
47.862	108.155
47.862	83.449
49.084	122.920
49.491	113.617
50.509	108.167
51.324	127.423
51.731	129.991
51.935	106.249
51.935	92.773
52.546	120.691
53.360	101.764
53.564	100.482
53.971	126.152
54.175	108.827
54.379	105.619
54.786	91.503
55.397	127.442
55.804	121.990
56.823	122.315
57.026	97.931
57.637	140.929
58.045	105.637
58.248	133.873
58.452	116.548
58.452	118.473
58.452	101.468
58.859	110.454
59.674	137.730
59.674	106.607
59.878	139.977
59.878	104.362
61.303	132.604
61.303	99.235
61.914	108.864
62.525	143.519
63.951	148.018
65.580	149.951
65.784	135.834
65.784	118.508
65.988	113.696
67.006	149.316
67.210	138.729
68.839	116.277
69.450	154.141
71.894	152.869
71.894	153.511
73.116	122.394
73.320	119.828
73.931	161.863
73.931	146.783
74.134	148.067
74.542	161.545
76.986	164.765
77.800	159.956
79.633	165.099
79.837	127.560
79.837	167.025
80.041	135.903
80.448	164.782
81.059	149.384
82.892	166.077
87.169	166.419
87.780	149.416
89.206	151.990
89.206	141.723
89.206	138.835
89.206	130.172
90.428	122.477
90.428	119.910
96.538	177.052
96.741	162.935
96.741	186.037
100.407	170.012
100.611	174.826
101.018	157.180
103.870	137.943
104.684	131.530
107.943	144.380
116.904	157.899
116.904	148.594
119.959	176.202
122.200	191.935
132.179	139.363
138.086	169.231
138.086	162.493
140.122	179.187
147.862	193.021
148.473	203.612
153.157	170.266
153.360	148.448
156.415	161.618
160.692	187.628
163.747	178.338
163.747	180.263
168.839	204.673
172.301	167.470
181.263	204.732
199.796	172.736
205.906	163.140
210.387	205.514
231.161	194.064
231.772	167.435];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'weight', 'male'};  
temp.tWw_m  = C2K(35.9);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Kemp2021';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females and males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'XM78'; % Cat of Life
metaData.links.id_ITIS = '585200 '; % ITIS
metaData.links.id_EoL = '1179048'; % Ency of Life
metaData.links.id_Wiki = 'Conilurus_penicillatus'; % Wikipedia
metaData.links.id_ADW = 'Conilurus_penicillatus'; % ADW
metaData.links.id_Taxo = '89084'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001298'; % MSW3
metaData.links.id_AnAge = 'Conilurus_penicillatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Conilurus_penicillatus}}';
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
bibkey = 'Kemp2021'; type = 'Article'; bib = [ ... 
'doi = {10.1071/AM19027}, ', ...
'author = {Catherine  M. Kemper}, ' ... 
'year = {2021}, ' ...
'title = {Growth and development of the brush-tailed rabbit-rat (\emph{Conilurus penicillatus}), a threatened tree-rat from northern {A}ustralia}, ' ...
'journal = {Australian Mammalogy}, ' ...
'volume = {43}, ' ...
'pages = {151–159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Conilurus_penicillatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

