function [data, auxData, metaData, txtData, weights] = mydata_Epigonus_telescopus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Epigonidae';
metaData.species    = 'Epigonus_telescopus'; 
metaData.species_en = 'Black cardinalfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MA','MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 03];

%% set data
% zero-variate data

data.am = 105*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'TracGeor2011';   
  temp.am = C2K(8.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 56; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 75;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.13e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'OkamMoto2011';
  comment.Wwb = 'based egg diameter of 0.6 mm for Epigonus affinis: pi/6*0.06^3'; 
data.Wwp = 3.16e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01950*Lp^2.98, see F1';
data.Wwi = 7.77e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01950*Li^2.98, see F1';

data.Ri = 3.5e5/365;       units.Ri = '#/d';  label.Ri = 'reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(8.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.95';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
2.885	14.042
2.988	15.288
3.081	18.871
6.069	22.637
6.160	26.842
7.665	25.767
8.378	35.739
8.809	34.965
8.934	30.451
9.048	28.583
9.052	27.338
9.140	32.477
9.671	33.883
9.677	32.326
9.766	37.154
10.117	29.372
10.642	32.336
11.723	29.855
12.012	38.422
12.125	37.022
12.129	35.776
12.328	39.826
12.360	31.419
13.087	37.654
13.199	36.409
13.963	32.836
14.127	46.072
14.171	34.551
14.926	33.157
16.105	33.324
16.185	40.332
16.840	37.224
17.143	42.210
17.254	41.276
17.367	39.565
18.006	40.817
18.019	37.391
18.322	42.221
18.439	39.731
18.870	38.957
19.288	42.075
20.027	44.885
20.142	43.018
20.264	38.815
20.343	46.445
20.472	40.686
20.800	38.820
21.008	40.535
21.083	49.255
21.111	41.782
21.212	43.496
21.623	48.015
21.865	40.699
21.872	38.987
22.076	41.791
22.166	46.152
22.279	44.596
22.286	42.883
22.828	41.332
23.009	50.209
23.035	43.202
23.122	48.653
23.136	44.916
23.145	42.425
23.226	49.432
23.343	46.942
23.345	46.164
23.903	40.408
24.004	42.122
24.840	47.891
24.845	46.334
24.850	45.089
24.984	38.083
25.047	49.762
25.285	43.536
25.289	42.446
25.792	51.170
25.817	44.475
26.012	49.615
26.128	47.281
26.181	61.762
26.348	45.726
26.866	50.558
26.890	44.175
26.982	48.224
26.991	45.888
27.076	51.806
27.109	42.931
27.119	40.440
27.737	47.141
27.840	48.232
27.936	51.192
27.942	49.479
28.005	61.313
28.090	38.581
28.146	52.439
28.191	40.295
28.691	49.953
28.793	51.356
29.017	48.711
29.028	45.908
29.030	45.130
29.216	52.917
29.236	47.623
29.544	51.207
29.547	50.429
29.748	53.856
29.772	47.473
29.950	57.128
30.063	55.728
30.193	49.501
30.268	58.221
30.289	52.616
30.313	46.077
30.642	44.056
30.713	53.866
30.731	49.039
30.793	61.029
30.843	47.639
30.892	63.366
31.150	51.691
31.154	50.601
31.244	55.117
31.592	48.114
31.781	54.967
31.909	49.207
31.988	56.837
32.001	53.256
32.013	50.142
32.304	58.397
32.861	52.797
32.879	47.815
32.972	51.553
32.983	48.750
33.043	61.207
33.085	50.153
33.166	57.004
33.176	54.513
33.277	56.071
33.587	59.188
33.618	50.936
33.720	52.183
33.825	52.963
33.917	57.012
33.928	54.054
33.944	49.850
33.953	47.359
34.135	55.924
34.482	49.232
34.750	63.560
34.796	51.260
34.893	53.907
34.911	49.081
34.969	62.316
35.007	52.196
35.081	61.072
35.084	60.293
35.087	59.359
35.092	57.958
35.096	57.023
35.100	55.934
35.105	54.688
35.129	48.149
35.537	53.758
35.552	49.710
35.561	47.375
35.638	55.472
35.849	56.252
35.862	52.671
35.953	57.188
36.041	62.171
36.152	61.238
36.153	60.927
36.159	59.214
36.504	52.989
36.901	61.557
36.918	57.042
36.926	54.862
37.128	58.289
37.135	56.265
37.213	64.207
37.228	60.003
37.973	61.567
37.996	55.339
38.174	64.995
38.198	58.767
38.204	57.054
38.218	53.473
38.300	60.169
38.513	60.483
38.611	62.975
38.741	56.904
38.759	51.922
38.861	53.324
38.871	50.833
38.951	57.996
39.087	50.212
39.596	57.379
39.896	63.143
39.907	60.341
39.931	53.802
40.018	59.252
40.033	55.204
40.160	49.911
40.689	51.941
40.761	61.284
40.784	55.211
40.862	62.997
40.887	56.147
41.111	53.658
41.196	59.575
41.312	57.241
41.604	65.029
41.652	52.262
41.942	60.672
41.959	56.157
42.040	63.165
42.061	57.715
42.178	55.070
42.185	53.045
42.484	59.121
42.900	62.550
42.908	60.526
42.930	54.610
42.940	51.963
43.020	59.126
43.026	57.413
43.088	69.715
43.104	65.199
43.141	55.546
43.225	61.619
43.257	53.056
43.578	53.371
43.755	63.337
43.866	62.093
43.978	61.004
43.992	57.267
44.003	54.153
44.064	66.455
44.175	65.521
44.201	58.671
44.215	54.934
44.426	55.870
44.615	62.567
44.741	57.430
44.758	52.915
44.832	61.791
44.837	60.545
44.877	49.802
44.962	55.876
45.074	54.631
45.140	65.531
45.166	58.680
45.777	67.250
45.792	63.202
45.826	54.171
46.012	61.647
46.030	56.820
46.127	59.624
46.242	57.445
46.345	58.536
46.377	50.129
46.787	55.115
46.854	65.859
46.994	57.141
46.996	56.519
47.078	63.215
47.091	59.789
47.097	58.077
47.189	62.126
47.192	61.347
47.326	54.342
48.198	50.302
48.788	64.477
48.808	59.339
48.832	52.956
48.833	52.489
48.905	61.831
48.909	60.897
49.006	63.701
49.026	58.251
49.105	65.726
49.137	57.163
49.208	66.817
49.248	56.229
49.359	55.141
49.776	58.259
49.945	70.405
50.072	65.113
50.076	64.023
50.080	63.089
50.103	57.016
50.175	66.204
50.202	59.197
50.386	67.296
50.410	60.756
50.513	62.003
50.919	67.924
50.936	63.409
50.940	62.319
50.961	56.869
50.970	54.378
51.036	65.434
51.040	64.344
51.057	59.829
51.159	61.231
51.276	58.429
51.353	66.682
51.907	61.861
51.916	59.370
51.985	69.647
51.994	67.156
52.000	65.443
52.116	63.109
52.234	60.307
52.327	64.045
52.352	57.350
53.066	67.167
53.075	64.831
53.274	68.726
53.295	63.276
53.415	59.852
53.517	61.254
53.747	57.053
54.044	63.595
54.057	60.170
54.062	58.768
54.145	65.309
54.155	62.506
54.161	61.105
54.904	62.825
55.007	64.072
55.106	66.253
55.111	65.007
55.241	58.936
55.342	60.494
55.446	61.429
55.955	68.441
55.968	65.171
55.972	63.926
56.192	62.526
56.205	59.101
56.219	55.364
56.429	56.456
56.859	56.149
56.916	69.540
57.033	66.894
57.258	63.938
57.375	61.448
57.466	65.653
57.488	59.892
57.992	68.305
58.009	63.790
58.129	60.521
58.752	65.977
59.090	61.465
59.172	68.161
59.188	63.957
59.934	65.210
59.948	61.474
60.035	66.613
60.451	70.042
60.710	58.211
61.016	62.263
61.746	67.875
61.893	57.289
62.076	65.543
62.421	59.318
62.935	65.240
62.965	57.300
63.034	67.265
63.048	63.529
63.276	60.105
63.991	69.455
64.550	63.232
64.556	61.675
64.776	60.276
64.861	66.193
64.938	74.135
64.956	69.308
65.634	60.129
65.920	69.474
65.923	68.695
66.041	65.894
66.142	67.452
66.155	64.026
66.702	61.229
66.766	72.596
67.011	64.346
67.558	61.549
67.758	65.444
68.834	64.209
68.936	65.767
69.662	72.002
70.000	67.646
70.863	66.409
70.868	65.007
71.088	63.453
71.713	68.285
71.833	64.861
71.932	67.042
73.103	69.233
73.913	58.934
74.632	67.442
74.774	69.624
74.795	63.956
74.938	65.702
75.079	68.319
75.553	61.784
76.405	74.871
77.021	70.736
77.060	60.273
77.346	63.982
77.484	67.253
78.213	72.928
79.751	62.916
83.037	67.090
86.056	62.324
88.870	72.379
89.024	71.291
89.036	68.021
90.056	76.097
92.342	66.964
94.893	66.989
99.548	66.163
103.736	69.911];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(8.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TracGeor2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length: Ww in g = 0.01950*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; bathydemersal; depth range 180 - 400 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6FTKX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46578379'; % Ency of Life
metaData.links.id_Wiki = 'Epigonus_telescopus'; % Wikipedia
metaData.links.id_ADW = 'Epigonus_telescopus'; % ADW
metaData.links.id_Taxo = '173873'; % Taxonomicon
metaData.links.id_WoRMS = '126858'; % WoRMS
metaData.links.id_fishbase = 'Epigonus-telescopus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epigonus_telescopus}}';
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
bibkey = 'TracGeor2011'; type = 'techreport'; bib = [ ... 
'author = {D. M. Tracey and K. George and D. J. Gilbert}, ' ... 
'year = {2011}, ' ...
'title = {Estimation of age, growth, and mortality parameters of black cardinalfish (\emph{Epigonus telescopus}) in QMA 2 (east coast {N}orth {I}sland)}, ' ...
'institution = {New Zealand Fisheries Assessment}, ' ...
'volume = {Report 2000/27}, ' ...
'pages = {1-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OkamMoto2011'; type = 'Article'; bib = [ ... 
'author = {Makoto Okamoto and Hiroyuki Motomura and Takashi Asahida}, ' ... 
'year = {2011}, ' ...
'title = {Redescription of a Poorly Known Deepwater Cardinalfish, \emph{Epigonus affinis} ({A}ctinopterygii: {P}erciformes: {E}pigonidae), and Comparison with Related Species}, ' ...
'journal = {Species diversity}, ' ...
'volume = {16}, ' ...
'pages = {85-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epigonus-telescopus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
