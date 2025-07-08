function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_falciformis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_falciformis'; 
metaData.species_en = 'Silky shark'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2019 01 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 04];


%% set data
% zero-variate data

data.tp = 9.5 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JounChen2008';
  temp.tp = C2K(27); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 34*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 69;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'JounChen2008';  
data.Lp  = 215;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'JounChen2008'; 
data.Li  = 332;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'JounChen2008';

data.Ri  = 9/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'JounChen2008';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 till 10 pups per yr';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.070	81.461
0.117	86.019
0.233	77.537
0.327	93.171
0.397	76.872
0.490	92.506
0.583	87.284
0.700	80.758
1.026	103.542
1.353	101.560
1.353	108.077
1.469	93.730
1.493	96.986
1.516	98.288
1.516	104.153
1.586	87.854
1.679	92.409
1.679	95.016
1.679	96.319
1.679	104.140
1.679	98.926
1.889	111.944
1.936	107.378
1.983	121.712
2.006	117.148
2.006	127.576
2.029	119.753
2.052	113.886
2.052	124.965
2.099	108.668
2.286	125.598
2.309	128.855
2.332	124.291
2.356	102.782
2.356	117.771
2.356	132.110
2.402	109.295
2.426	102.776
2.426	107.338
2.426	127.542
2.472	113.852
2.472	119.065
2.519	123.624
2.519	127.534
2.542	111.239
2.542	107.329
2.566	113.844
2.589	106.673
2.682	105.362
2.682	112.531
2.706	121.002
2.729	119.696
2.822	127.509
2.822	124.902
2.869	114.471
2.962	115.767
2.962	135.319
2.962	138.577
2.985	124.237
2.985	142.486
3.032	138.572
3.149	124.224
3.265	143.115
3.289	138.551
3.335	132.030
3.335	132.681
3.359	122.252
3.359	127.466
3.359	136.590
3.359	143.107
3.382	131.374
3.405	131.372
3.405	145.710
3.405	148.317
3.452	129.413
3.452	137.886
3.499	133.320
3.499	134.623
3.499	135.927
3.499	148.310
3.545	126.799
3.545	154.171
3.615	139.828
3.615	144.390
3.638	130.050
3.708	133.303
3.755	127.433
3.848	132.640
3.872	128.076
3.918	134.589
3.942	146.970
3.965	137.192
3.965	143.058
3.965	158.699
4.012	137.188
4.012	148.920
4.012	150.875
4.292	135.862
4.315	144.333
4.315	135.860
4.338	165.838
4.338	160.624
4.362	152.802
4.385	154.755
4.385	152.148
4.385	145.631
4.385	142.372
4.408	157.360
4.455	139.759
4.478	182.772
4.478	158.006
4.478	156.702
4.478	152.792
4.478	146.275
4.501	139.755
4.525	163.868
4.525	152.788
4.571	144.964
4.828	153.415
4.851	146.896
4.851	150.806
4.945	155.361
4.945	158.620
5.085	173.598
5.108	168.382
5.318	173.579
5.318	171.624
5.341	180.746
5.434	154.018
5.434	174.221
5.434	174.873
5.481	170.959
5.504	169.002
5.504	176.822
5.504	177.474
5.528	164.438
5.551	156.615
5.621	172.251
5.644	176.159
5.691	160.514
5.784	174.193
5.878	160.499
6.297	179.365
6.344	181.968
6.344	185.227
6.344	191.092
6.507	161.099
6.507	183.258
6.507	179.999
6.531	176.739
6.531	192.380
6.624	183.900
6.694	178.681
6.950	191.043
6.997	196.253
7.277	192.320
7.347	190.359
7.370	186.446
7.440	177.968
7.440	189.048
7.510	189.042
7.534	166.229
7.534	191.647
7.557	192.949
7.557	194.904
7.930	187.053
7.930	192.266
8.583	201.989
8.676	201.982
8.980	207.822
9.050	215.638
9.283	213.012
10.286	227.920
10.309	218.794
10.356	240.297
10.426	226.605
10.449	225.299
10.939	223.304
11.335	232.396
11.382	231.089
11.965	230.390
12.478	231.651
12.478	238.821
12.735	238.148
14.484	256.254];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'JounChen2008';

% length - weight
data.LW = [ ... % total length (cm), wet weight (g)
75.182	3696.102
79.854	3696.102
83.942	4435.320
86.277	5174.538
86.277	3449.692
86.861	3449.692
88.029	3696.102
89.781	5420.948
92.117	5420.948
92.701	3449.692
94.161	4681.730
95.328	6652.975
97.080	7145.794
97.664	5174.538
100.000	6160.166
100.000	8131.422
101.752	8131.422
102.336	5174.538
103.504	7638.603
104.088	13059.551
104.672	8131.422
104.964	6160.166
106.715	10102.667
107.007	8131.422
109.051	8131.422
109.343	6652.975
110.803	10349.077
111.679	12073.923
111.971	9117.039
112.555	7638.603
113.139	9856.268
114.307	14291.578
114.307	12073.923
114.599	8131.422
115.182	10349.077
117.226	12566.732
117.226	9856.268
117.810	8624.231
118.686	13059.551
118.686	14045.179
118.978	11088.295
120.730	9117.039
121.606	11088.295
123.066	12566.732
123.066	13798.769
123.650	10102.667
125.109	11334.705
125.693	15277.206
126.277	11088.295
126.277	13305.960
127.737	8870.640
128.321	11088.295
128.905	13305.960
129.197	15523.615
130.365	12813.141
130.657	16262.834
131.825	14537.987
132.409	18973.308
133.285	12073.923
134.161	18973.308
134.453	17002.052
134.745	14784.397
135.912	16262.834
136.496	15030.807
136.496	20698.154
137.080	18973.308
138.540	21190.962
138.832	18234.089
140.000	16016.424
140.000	21190.962
142.044	19219.717
142.628	17248.461
144.088	22669.409
144.380	20698.154
144.672	13059.551
144.964	18973.308
145.839	16509.243
146.131	22669.409
146.715	20451.744
147.883	22915.809
148.175	19219.717
149.051	21437.372
150.219	17494.871
150.803	19219.717
150.803	22669.409
151.971	21930.191
152.555	24887.064
153.139	26858.320
153.139	28336.757
154.015	22669.409
154.015	25872.692
154.599	17494.871
155.474	25133.474
156.058	21437.372
156.058	22915.809
156.350	28336.757
156.642	26365.501
157.518	25133.474
157.518	31540.039
158.102	28583.166
160.146	25872.692
160.438	23901.436
161.022	28583.166
163.066	30308.012
163.358	27843.948
164.526	25626.283
164.526	35728.950
165.401	28583.166
167.445	26858.320
167.445	28829.576
168.029	33264.885
169.197	27104.730
169.197	35728.950
169.489	30308.012
170.365	39178.642
171.241	34743.332
171.825	32525.667
172.117	39671.461
172.701	29815.193
173.285	29568.794
173.285	31786.449
173.285	36714.578
174.453	34250.513
176.204	37946.615
176.204	30554.422
177.372	32772.077
177.372	38685.833
178.248	40657.089
178.832	32772.077
179.416	36714.578
179.708	34004.104
179.708	42381.935
179.708	38685.833
180.876	46078.027
181.168	37700.206
181.168	40903.488
181.752	35236.141
181.752	39178.642
182.044	42874.744
182.628	32525.667
182.628	37453.796
183.504	42628.334
183.504	46078.027
184.380	36468.179
185.547	42628.334
186.131	40903.488
187.007	38685.833
187.883	43613.962
187.883	46817.250
188.759	55934.290
189.051	39671.461
189.051	38193.025
189.051	45338.808
189.343	54702.257
190.219	48542.096
191.095	45585.213
191.387	30554.422
191.387	43121.154
191.387	54702.257
192.555	38685.833
192.555	45092.404
192.555	50513.347
192.847	45585.213
193.139	34743.332
196.058	48542.096
196.642	70965.091
199.854	60616.014
200.730	48295.687
200.730	53470.225
200.730	55687.885
202.774	52731.007
203.066	42628.334
203.066	50759.751
204.526	44599.590
205.109	61355.238
205.401	53470.225
206.569	55687.885
207.737	58644.764
207.737	64312.116
209.489	51498.975
210.073	62833.674
210.365	70225.873
213.285	58398.359
213.577	60862.424
214.745	78110.885
215.328	65051.334
217.664	73429.161
218.832	78850.103
219.416	62833.674
220.000	54455.853
220.292	76139.629
221.752	68254.622
222.628	87474.334
222.920	74168.379
222.920	79096.508
223.796	77864.476
224.088	88459.959
225.255	68501.027
225.255	79342.917
225.255	80821.354
227.591	78603.699
227.883	65544.148
228.759	91663.245
229.343	92895.277
229.635	75646.815
231.095	81560.577
231.095	110390.143
231.971	64804.930
232.847	86488.706
234.015	73921.969
238.102	79589.322
238.394	85503.078
239.270	82546.200
239.270	102012.319
242.482	103244.354
242.774	78110.885
244.526	89938.399
247.445	102997.947
255.620	97823.408
255.912	116550.308];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW  = 'JounChen2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'R3ND'; % Cat of Life
metaData.links.id_ITIS = '160310'; % ITIS
metaData.links.id_EoL = '46559780'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_falciformis'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_falciformis'; % ADW
metaData.links.id_Taxo = '41976'; % Taxonomicon
metaData.links.id_WoRMS = '105789'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-falciformis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_falciformis}}';
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
bibkey = 'JounChen2008'; type = 'Article'; bib = [ ... 
'author = {Shoou-Jeng Joung and Che-Tsung Chen and Hsian-Hau Lee and Kwang-Ming Liu}, ' ... 
'year = {2008}, ' ...
'title = {Age, growth, and reproduction of silky sharks, \emph{Carcharhinus falciformis}, in northeastern {T}aiwan waters}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {90}, ' ...
'pages = {78-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-falciformis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

