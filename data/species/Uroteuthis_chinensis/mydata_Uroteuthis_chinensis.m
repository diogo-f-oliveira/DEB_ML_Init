function [data, auxData, metaData, txtData, weights] = mydata_Uroteuthis_chinensis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Uroteuthis_chinensis'; 
metaData.species_en = 'Mitre squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 180;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'JinLi2019';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.28;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'guess';
  comment.Lb = 'based on U. edulis';
data.Lp  = 7;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'sealifebase';
data.Li  = 31;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'JinLi2019';
data.Lim = 49; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'JinLi2019';

data.Ni  = 43*700; units.Ni  = '#';      label.Ni  = 'cum reprod at death';  bibkey.Ni  = 'guess';   
  temp.Ni = C2K(25); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on a relative fecumdity of 43/g for U. edulis';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
101.563	11.880
102.903	8.733
107.667	9.740
108.263	14.346
110.050	9.400
110.794	16.478
112.730	18.050
112.731	11.083
113.176	12.431
116.600	18.158
117.643	9.506
117.792	25.685
117.940	24.112
120.174	9.279
121.811	22.535
121.960	17.704
122.258	19.838
122.705	15.231
124.045	16.017
124.938	8.825
125.236	11.633
125.831	16.127
125.980	24.105
126.576	10.059
126.873	25.003
126.874	26.463
127.618	11.519
127.767	22.080
128.065	16.013
128.066	18.485
128.809	10.282
129.404	12.191
130.149	10.730
130.298	19.831
130.893	23.651
130.894	22.527
130.895	21.516
131.638	27.358
131.935	25.335
131.936	20.728
132.084	22.975
132.085	19.942
132.233	13.537
132.531	26.346
132.680	16.907
133.722	15.670
134.020	20.277
134.764	12.523
135.062	28.141
135.360	21.512
135.955	24.320
137.891	11.734
137.892	11.060
138.337	24.542
139.082	19.373
139.529	24.429
139.826	17.125
139.975	20.271
140.123	19.709
140.124	21.507
140.125	25.215
140.422	28.698
140.571	23.304
141.613	21.843
142.060	22.854
142.208	25.213
142.953	18.583
143.697	21.054
144.144	10.942
144.739	12.851
144.888	19.480
145.186	21.727
145.335	11.278
145.931	19.592
146.078	20.490
146.079	21.164
149.057	23.971
150.099	25.880
150.993	23.519
151.141	24.643
152.184	23.518
152.779	24.641
153.821	21.157
154.119	13.067
154.268	20.033
155.608	22.504
156.203	23.739
156.204	27.784
157.692	24.974
157.841	22.614
159.926	41.601
160.074	20.028
164.541	21.147
166.328	16.089
170.199	22.940
179.429	19.223];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JinLi2019';
comment.tL_f = 'data for females'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
85.931	7.513
90.993	7.059
102.010	7.835
103.052	6.823
106.923	18.167
107.816	7.268
114.814	17.598
114.963	7.149
116.303	6.249
116.304	15.462
119.876	15.009
119.877	19.504
121.514	28.378
121.960	11.524
121.961	16.580
123.151	17.815
123.896	6.916
126.129	15.340
126.725	18.374
127.469	10.845
128.065	14.777
129.107	24.326
129.404	21.742
130.149	16.348
130.298	9.494
131.638	17.358
134.169	17.580
134.913	20.838
135.955	11.511
136.253	17.466
136.849	20.499
136.998	8.027
136.999	13.982
138.040	27.576
139.975	17.912
141.911	19.483
143.251	28.583
145.930	40.940
145.931	18.917
149.950	10.824
153.077	47.338
153.821	18.461
154.119	35.427
155.012	47.111
155.013	20.819
156.055	41.942
156.203	19.582
157.097	24.300
157.990	44.861
158.139	30.142
158.883	18.681
160.223	22.724
162.308	26.880
163.051	43.396
163.052	23.508
164.243	15.192
164.988	46.091
166.625	43.842
169.305	37.884
177.196	25.854
179.132	39.448];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JinLi2019';
comment.tL_m = 'data for males'; 

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
7.558	16.957
8.949	36.633
9.227	42.552
9.448	26.653
9.950	42.466
10.060	32.533
10.507	58.273
10.616	36.435
10.950	46.315
11.115	34.391
11.393	32.374
11.617	52.188
11.838	42.242
11.896	60.092
12.450	50.105
13.008	67.896
13.339	49.999
13.341	65.872
14.565	83.584
15.511	95.376
15.512	107.280
15.903	121.123
16.345	97.261
16.368	309.559
16.457	113.120
16.728	49.596
16.845	99.185
17.119	71.375
17.965	184.369
18.120	75.224
18.123	106.969
18.182	132.756
18.455	95.025
18.627	134.687
19.408	164.356
19.572	140.527
19.737	124.635
20.077	192.054
20.123	104.747
20.131	172.207
20.138	241.650
20.184	148.391
20.746	205.864
21.021	184.006
21.079	207.808
21.355	189.918
21.409	174.039
21.460	136.334
21.582	233.542
21.803	221.611
21.909	173.979
21.972	245.400
22.189	195.771
22.470	227.484
22.631	177.861
22.634	203.655
22.642	275.082
22.863	265.135
23.083	243.284
23.199	290.889
23.248	231.359
23.412	205.546
23.533	296.802
24.027	239.203
24.038	338.408
24.086	266.974
24.471	231.214
24.586	272.867
24.644	292.701
24.706	350.233
24.979	308.534
24.981	324.407
25.428	348.163
25.473	248.952
25.526	231.088
25.531	276.722
26.144	292.523
26.203	324.262
26.486	365.895
26.769	413.480
27.477	286.412
28.048	425.232
28.375	367.654
28.883	442.990
41.967	695.401];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'JinLi2019';
comment.LWw_f = 'data for females'; 
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
6.502	11.131
7.447	16.971
7.614	24.887
8.115	28.796
13.895	51.917
14.286	65.760
15.506	49.741
15.509	75.535
16.008	67.539
16.228	49.655
16.507	57.559
16.732	81.342
17.288	91.196
17.679	110.991
18.185	160.534
18.291	114.886
19.015	128.689
19.233	96.917
19.402	110.786
20.293	128.537
20.629	154.290
20.675	74.920
20.962	150.282
21.071	136.380
21.965	177.941
22.017	150.157
22.800	197.683
23.077	185.745
23.358	221.426
23.689	193.609
23.969	221.353
24.635	207.385
25.196	260.889
25.253	268.819
26.084	248.879
27.240	157.471
27.586	266.557
28.085	256.577
28.652	361.668
28.804	228.714
30.605	442.785
35.835	513.591
38.277	487.507
39.571	634.178
41.063	562.572
42.290	604.092
43.629	653.536
43.975	766.590
45.070	627.571
46.413	710.745
47.246	708.661
47.614	524.094];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'JinLi2019';
comment.LWw_m = 'data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f; 
weights.tL_m = 3 * weights.tL_m; 
weights.am = 10 * weights.am; 
%weights.Lim = 3 * weights.Lim; 

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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and del_M only';
D2 = 'Males are longer than females, but weigh less and deviate strongly from isomorphy';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DZJZ'; % Cat of Life
metaData.links.id_ITIS = '556152'; % ITIS
metaData.links.id_EoL = '593206'; % Ency of Life
metaData.links.id_Wiki = 'Uroteuthis_chinensis'; % Wikipedia
metaData.links.id_ADW = 'Uroteuthis_chinensis'; % ADW
metaData.links.id_Taxo = '157893'; % Taxonomicon
metaData.links.id_WoRMS = '574516'; % WoRMS
metaData.links.id_molluscabase = '574516'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Uroteuthis_chinensis}}';
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
bibkey = 'JinLi2019'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.aaf.2019.02.002}, ' ...
'author = {Yue Jin and Na Li and Xinjun Chen and Bilin Liu and Jianhua Lia}, ' ... 
'year = {2019}, ' ...
'title = {Comparative age and growth of \emph{Uroteuthis chinensis} and \emph{Uroteuthis edulis} from {C}hina {S}eas based on statolith}, ' ...
'journal = {Aquaculture and Fisheries}, ' ...
'volume = {4}, ' ...
'pages = {166-172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Uroteuthis-chinensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

