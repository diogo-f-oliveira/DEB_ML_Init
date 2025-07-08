function [data, auxData, metaData, txtData, weights] = mydata_Muraenesox_bagio
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Muraenesocidae';
metaData.species    = 'Muraenesox_bagio'; 
metaData.species_en = 'Common pike conger'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 30];

%% set data
% zero-variate data

data.ab = 11;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 38*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 93.2; units.Lp  = 'cm';  label.Lp  = 'total length puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.7-2.2 mm of Congresox_talabonoides: pi/6*0.2^3';
data.Wwp = 980;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00182*Lp^2.91, see F1';
data.Wwi = 9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00182*Li^2.91, see F1';
 
data.Ri  = 195120/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Nezumia_aequalis from the Atlantic';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
263.306	45.216
292.422	48.475
324.069	48.809
353.607	50.240
365+15.613	49.483
365+47.682	50.912
365+77.642	55.265
365+108.023	55.965
365+139.671	52.281
365+198.746	58.797
365+232.925	62.416
365+262.040	62.021
365+291.578	63.088
365+323.647	64.151
365+353.185	64.487
730+16.457	68.842
730+47.682	68.081
730+75.954	69.513
730+107.179	70.943
730+137.983	69.451
730+199.590	70.851
730+233.347	74.470
730+263.306	76.997
730+292.000	75.873
730+325.335	79.857
730+354.029	80.194
1095+17.301	82.358
1095+49.370	83.421
1095+110.133	84.091
1095+136.717	86.622
1095+197.480	89.848
1095+229.127	88.356
1095+261.618	90.150
1095+290.734	93.408
1095+323.225	91.549
1460+17.301	91.855
1460+49.792	94.745
1460+74.266	95.086
1460+106.335	93.227
1460+138.827	97.213
1460+199.168	99.344
1460+232.081	101.503
1460+263.306	100.376
1460+293.266	100.346
1825+16.035	106.468
1825+48.104	104.975
1825+75.532	107.139
1825+108.445	109.664
1825+137.561	109.269
1825+197.902	111.401
1825+231.659	110.271
1825+325.757	115.291
2190+18.566	116.694
2190+75.110	116.272
2190+110.555	116.967
2190+139.671	118.765
2190+230.393	120.866
2190+262.884	120.468
2190+292.844	120.803
2190+324.069	121.503];  
data.tL(:,1) = data.tL(:,1) + 600; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BaruLiu2023'; 

% length-weight
data.LW = [ ... % length (cm), weight (g)
16.864	133.368
35.207	196.554
40.533	90.353
42.899	263.443
43.491	367.585
46.154	123.180
47.633	296.579
47.929	122.563
48.521	331.053
49.704	226.293
50.296	330.435
51.479	851.763
51.775	399.486
52.071	225.470
52.071	-18.008
52.959	225.161
55.917	363.263
55.917	363.263
56.805	119.475
58.876	710.060
58.876	188.321
59.467	466.375
60.059	640.083
60.651	883.356
61.538	570.003
61.538	152.612
63.609	325.805
63.609	1160.587
64.201	534.295
65.680	429.432
66.272	950.965
66.272	81.401
66.864	255.108
67.160	1159.353
67.751	567.842
68.047	1228.609
68.639	358.838
70.710	810.292
71.302	1262.260
71.598	601.287
72.189	1470.646
73.669	1017.958
73.669	1296.218
73.964	496.116
76.035	564.960
76.035	912.787
76.627	1608.233
77.811	912.170
78.107	668.588
79.586	1120.247
79.586	1015.899
79.882	946.232
79.882	1920.144
80.178	1920.041
80.473	459.069
80.769	1676.358
81.065	876.255
81.361	1258.761
81.657	632.571
82.249	1814.974
82.840	910.421
82.840	945.202
82.840	458.246
84.024	736.095
84.615	1883.716
85.207	666.118
85.503	944.276
86.686	665.604
86.982	839.414
87.574	2613.122
87.870	1952.149
87.870	1604.323
87.870	1430.410
87.870	699.975
88.166	1291.176
88.462	1812.813
88.757	838.796
89.053	1047.389
90.237	664.369
90.828	2438.077
90.828	2090.251
90.828	1081.555
90.828	872.859
92.604	2576.589
93.491	1150.194
93.787	2541.396
93.787	2263.135
93.787	1254.439
94.083	732.596
94.379	1636.842
94.970	2123.592
96.450	2575.251
97.337	1601.030
97.337	1322.769
97.929	2087.781
98.225	939.851
98.225	765.938
98.521	1218.009
98.521	2678.879
98.817	1357.037
98.817	2783.124
99.704	1391.511
100.296	2782.610
101.183	1530.127
101.183	2990.997
101.479	2643.067
101.775	1460.355
101.775	869.052
102.071	1042.862
102.367	2921.019
102.663	2120.916
102.959	2329.510
103.254	694.624
103.550	1424.956
103.846	1529.201
104.438	2294.212
104.734	2885.414
104.734	1911.500
105.030	972.268
105.325	833.034
105.917	1667.611
105.917	1180.654
106.805	3058.607
107.101	2815.026
107.396	3093.184
107.692	1319.167
108.284	971.136
108.580	1736.249
109.467	2014.202
109.467	1283.767
109.763	1840.186
109.763	2953.229
110.355	866.067
110.355	1387.806
110.651	2813.791
110.947	2048.470
111.538	3161.308
111.834	1561.204
113.018	1734.706
113.314	1004.168
113.905	3056.137
114.793	2638.436
115.089	3194.855
115.089	1907.898
115.385	1351.275
115.385	1525.188
115.680	1072.911
116.864	3368.151
117.456	1350.554
117.751	3506.973
117.751	2011.320
118.639	2254.491
119.231	3541.241
119.231	2184.719
119.822	1071.470
120.118	2671.367
120.118	2427.889
120.414	3297.351
120.414	2497.351
120.710	3540.727
120.710	1592.900
121.302	3957.912
122.485	2635.761
122.781	3540.007
122.781	3087.833
123.964	3087.421
123.964	2496.116
124.852	3469.720
125.148	3852.226
125.444	2495.602
126.331	2912.684
126.627	3295.190
126.627	3434.321
127.219	4129.767
127.219	2947.158
128.994	3224.801
129.290	4372.524
129.586	3259.379
129.882	4059.276
129.882	3850.580
129.882	3815.798
131.361	3710.935
131.361	3502.239
131.657	4893.441
131.953	4510.729
132.840	4127.811
134.615	5240.237
135.207	5761.771
135.503	3848.624
135.503	4405.146
135.799	4091.999
136.686	4404.735
137.870	5099.975
137.870	3986.932
138.166	4925.959
138.166	3743.350
138.757	2699.667
139.941	4925.341
139.941	3603.603
140.237	5203.500
141.420	5098.740
142.308	5202.779
142.604	5654.850
142.604	5272.242
143.491	6419.759
143.787	6210.960
144.083	5341.292
144.970	6071.418
144.970	4019.244
145.266	5793.054
145.562	4158.170
145.858	5271.110
146.154	5410.137
146.154	4088.398
146.450	4957.861
146.450	4505.687
147.337	6174.943
147.337	6522.769
147.633	5861.797
147.633	6313.971
147.633	5235.709
147.929	4992.129
148.817	5443.994
149.408	4435.093
149.704	6939.337
149.704	6139.337
151.183	6904.040
151.183	4330.127
151.479	5756.111
151.479	4956.111
151.775	5234.269
152.663	6451.352
152.959	6972.988
152.959	5894.727
154.438	6624.647
154.734	6972.370
155.030	6380.963
155.325	5476.512
156.509	5476.101
157.101	8362.852
157.101	6936.764
157.101	7354.156
157.988	7945.151
157.988	9127.760
158.580	5231.902
159.172	5579.522
159.467	5196.811
159.763	7979.316
159.763	7805.404
159.763	5788.012
159.763	5753.230
159.763	7353.230
159.763	7144.534
160.651	6970.312
161.834	5822.074
162.130	7978.493
162.130	7456.754
163.314	8291.125
163.905	8047.441
164.201	7595.165
164.497	8429.844
164.793	8081.915
165.089	6029.638
166.272	10307.487
166.568	7698.689
166.568	9507.385
166.864	8568.151
167.160	10237.614
167.456	6341.858
167.751	9193.929
168.047	9819.913
168.047	9993.826
168.047	10272.087
168.639	9506.664
168.639	10063.186
169.231	9541.241
170.118	10340.932
170.414	6514.742
170.414	8984.308
171.598	10931.722
172.189	6757.603
174.852	11034.938];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'BaruLiu2023'; 
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00182*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44L7R'; % Cat of Life
metaData.links.id_ITIS = '636199'; % ITIS
metaData.links.id_EoL = '46561545'; % Ency of Life
metaData.links.id_Wiki = 'Muraenesox_bagio'; % Wikipedia
metaData.links.id_ADW = 'Muraenesox_bagio'; % ADW
metaData.links.id_Taxo = '180487'; % Taxonomicon
metaData.links.id_WoRMS = '220037'; % WoRMS
metaData.links.id_fishbase = 'Muraenesox-bagio'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Muraenesox_bagio}}';
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
bibkey = 'BaruLiu2023'; type = 'Article'; bib = [ ... 
'doi = {10:1134343}, ' ...
'author = {Barua, S. and Q. Liu and M.S. Alam and P. Schneider and M.M.H. Mozumder and M.A. Rouf}, ' ... 
'year = {2023}, ' ...
'title = {Population dynamics and stock assessment of two major eels (\emph{Muraenesox bagio} and \emph{Congresox talabonoides}) from the marine waters of {B}angladesh}, ' ...
'journal = {Frontiers in Marine Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'howpublished = {\url{https://www.fishbase.de/summary/Muraenesox-bagio.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
