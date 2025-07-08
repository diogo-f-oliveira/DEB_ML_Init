function [data, auxData, metaData, txtData, weights] = mydata_Todarodes_angolensis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Todarodes_angolensis'; 
metaData.species_en = 'Angolan flying squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'Vill1992';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'Vill1992';
  comment.Lp = '195 to 330 mm';
data.Lpm  = 24;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male'; bibkey.Lpm  = 'Vill1992';
  comment.Lpm = '142 to 250 mm';
data.Li  = 54; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Vill1992';
data.Lim = 46; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'Vill1992';

data.Wwb  = 6.8e-4; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'LaptNigm1999';

data.Ni  = 1.17e6; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'LaptNigm1999';   
  temp.Ni = C2K(15); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length data
data.tL_f = [ ... % time since birth (d), mantle length (cm)
123.504	12.961
125.790	11.806
125.801	11.033
127.529	9.200
131.458	12.202
132.041	11.140
137.182	8.637
139.964	12.506
141.620	15.794
142.223	13.283
145.086	11.452
145.105	10.099
145.611	14.448
146.729	15.609
146.737	15.030
149.015	14.454
150.735	13.201
155.216	17.266
155.801	16.011
164.367	12.161
164.861	17.283
165.404	19.023
168.804	19.318
169.340	21.541
171.121	15.941
171.679	16.618
172.197	20.097
172.800	17.586
173.410	14.592
173.883	21.259
174.482	19.038
174.495	18.072
175.031	20.295
175.079	16.913
176.711	21.844
176.773	17.496
176.814	14.598
177.301	20.299
177.919	16.725
178.401	22.716
179.556	21.269
180.636	25.135
180.731	18.469
181.271	20.402
182.418	19.535
182.475	15.477
182.977	20.115
184.650	22.147
186.340	23.019
186.448	15.387
186.891	24.180
187.482	22.538
187.520	19.833
187.526	19.447
187.532	18.963
188.066	21.380
189.210	20.705
189.761	21.866
190.909	20.902
190.959	17.423
191.426	24.477
191.452	22.642
191.488	20.130
192.641	18.779
192.707	14.141
194.289	22.646
194.302	21.680
194.324	20.134
195.393	24.774
195.943	26.031
196.510	26.032
198.342	16.856
199.351	25.747
199.855	30.192
199.935	24.588
199.949	23.622
200.564	20.242
201.651	23.625
203.391	20.923
203.841	29.233
203.897	25.271
204.985	28.558
205.700	18.125
206.768	22.861
207.851	26.534
208.477	22.381
208.959	28.372
209.003	25.280
209.032	23.251
210.182	22.190
211.300	23.351
212.902	30.407
212.988	24.321
213.513	27.317
213.526	26.447
214.134	23.550
215.673	35.050
218.532	33.509
218.600	28.678
218.602	28.581
218.619	27.325
219.127	31.577
219.768	26.361
219.820	22.690
221.433	28.972
221.515	23.176
224.253	30.137
224.360	22.601
224.749	35.162
225.398	29.462
225.436	26.757
225.487	23.182
228.197	32.076
228.880	23.961
230.455	32.949
230.494	30.147
231.101	27.346
231.125	25.704
232.124	35.271
232.180	31.309
232.841	24.741
233.301	32.278
233.342	29.379
235.649	26.774
236.691	33.249
237.851	31.512
237.969	23.203
238.439	30.064
239.691	21.757
240.096	33.255
240.160	28.714
240.700	30.648
241.315	27.267
241.332	26.108
242.346	34.612
242.978	30.072
244.211	23.117
244.647	32.393
244.692	29.205
245.279	27.853
246.337	33.266
247.465	33.751
248.687	27.569
249.265	26.797
250.899	31.631
250.947	28.249
252.057	29.990
252.613	30.764
253.140	33.664
255.464	29.803
255.867	41.398
256.579	31.158
256.612	28.839
258.365	25.267
258.857	30.582
260.582	28.942
261.735	27.688
262.221	33.389
262.820	31.168
263.301	37.256
266.237	30.304
267.304	35.040
267.345	32.142
269.615	32.146
273.528	36.307
274.132	33.699
274.140	33.120
274.150	32.443
274.181	30.221
277.529	34.188
278.564	41.243
279.201	36.317
280.374	33.613
281.554	30.427
282.064	34.486
283.199	34.488
283.774	33.909
284.939	31.785
286.536	39.227
287.166	34.784
287.655	40.292
289.475	31.986
290.536	37.205
291.683	36.338
293.913	39.143
295.104	35.184
297.387	34.222
297.401	33.256
298.472	37.702
298.511	34.997
300.750	37.126
300.769	35.773
301.898	36.162
306.410	38.102
310.394	37.239
310.920	40.138
314.922	38.019
314.945	36.377
316.050	38.504
316.089	35.703
318.914	36.577
319.428	40.346
319.973	41.893
321.762	35.809
322.340	35.037
327.415	37.268
327.952	39.394
329.696	36.402
333.080	37.857
334.788	37.473
336.528	34.771
342.731	37.487
347.797	40.297
347.825	38.365
349.568	35.469
384.677	40.263];
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Vill1992';
comment.tL_f = 'Data for females from northern Benguela upwelling system)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
120.743	10.152
136.114	11.213
139.534	11.601
145.294	14.333
152.084	13.349
157.754	12.952
158.960	15.396
160.046	13.634
161.088	10.308
161.138	12.068
163.492	14.902
165.759	14.705
165.770	15.096
166.942	16.366
168.059	15.680
169.714	13.918
169.755	15.385
169.844	18.515
171.997	14.307
172.621	16.263
173.738	15.577
174.384	18.315
177.230	18.507
177.261	19.583
177.721	15.769
178.381	18.995
182.372	19.480
184.009	17.132
184.034	18.012
184.697	21.336
185.215	19.575
185.689	16.250
186.992	22.117
188.749	23.973
189.267	22.212
189.952	26.319
192.050	20.156
193.139	18.492
194.434	24.065
196.578	19.564
197.776	21.715
198.319	20.834
200.661	23.277
201.736	21.124
201.875	26.014
202.268	19.852
202.313	21.417
202.413	24.938
205.641	18.578
206.310	22.098
207.365	19.260
207.463	22.683
208.607	22.976
210.292	22.289
210.345	24.147
210.356	24.539
211.367	20.137
213.269	27.079
213.790	25.415
215.386	21.600
215.913	20.132
217.631	20.620
218.244	22.184
218.352	25.998
218.959	27.366
219.987	23.551
220.007	24.236
222.736	20.321
224.126	29.220
224.655	27.850
225.140	24.915
225.201	27.067
225.749	26.382
226.223	23.056
228.460	21.783
228.576	25.890
229.217	28.432
231.339	23.149
231.451	27.061
231.467	27.648
234.347	29.014
235.317	23.145
238.141	22.555
238.207	24.903
238.274	27.250
240.497	25.487
240.998	23.140
243.889	24.897
243.956	27.244
243.989	28.418
245.059	26.070
247.298	24.894
249.604	26.065
249.676	28.608
251.818	24.009
256.417	25.863
256.508	29.090
257.700	31.045
257.725	31.925
260.327	23.512
263.842	27.225
265.050	29.766
265.585	28.592
268.849	23.503
269.027	29.762
269.476	25.557
269.562	28.588
270.823	32.988
271.890	30.542
272.300	24.967
272.938	27.411
276.236	23.496
277.048	32.102
277.514	28.483
279.772	27.992
283.145	26.717
283.658	24.760
286.070	29.648
290.565	27.883
292.444	34.043
293.433	28.858
293.464	29.934
294.534	27.586
295.567	23.966
296.255	28.171
296.892	30.615
298.639	32.081
300.820	28.851
300.853	30.025
302.073	32.958
304.290	30.999
305.930	28.748
306.618	32.953
309.780	24.246
310.542	31.091
311.088	30.308
311.623	29.134
315.556	27.565
316.238	31.574
318.012	34.018
333.269	31.069
335.653	34.978];
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Vill1992';
comment.tL_m = 'Data for males from northern Benguela upwelling system)'; 

% time-weight data
data.tWw_f = [ ... % time since birth (d), wet weight (g)
128.506	11.563
136.240	24.743
141.088	72.496
143.017	61.845
146.887	77.733
147.361	51.161
165.256	112.024
167.707	215.596
170.561	85.388
171.036	61.472
173.006	170.365
174.900	58.765
175.392	85.324
175.891	133.135
178.297	103.881
178.812	196.853
180.245	149.016
183.626	148.971
183.638	183.506
184.583	122.393
186.064	212.696
186.529	162.215
187.025	199.401
188.458	151.564
188.938	140.931
191.382	225.908
192.870	337.463
193.283	135.560
193.756	106.332
194.263	172.739
194.289	249.778
194.715	85.067
198.138	204.566
198.615	185.964
199.114	231.119
199.558	119.538
201.062	278.910
202.982	241.693
203.517	393.109
204.869	111.497
206.369	257.588
206.374	270.870
207.324	225.696
207.374	369.149
208.758	180.516
208.831	393.039
210.684	161.895
210.714	249.560
211.730	393.000
212.633	209.687
212.642	236.252
214.111	294.676
215.606	427.484
218.653	855.147
218.971	376.965
219.395	206.940
219.884	222.873
221.396	406.155
221.435	517.729
222.438	626.634
222.838	384.883
223.272	241.424
224.337	528.317
224.699	177.648
225.212	265.307
225.369	719.574
225.722	342.340
226.157	204.194
226.753	530.941
228.599	278.545
229.160	507.000
229.539	204.149
229.678	607.942
230.528	270.549
233.437	299.733
234.868	246.583
236.325	270.472
236.495	761.931
236.801	249.214
236.915	578.624
237.843	469.693
238.707	172.149
239.257	366.069
240.314	629.053
240.717	397.928
241.295	674.201
242.683	496.194
243.066	206.626
243.627	429.768
243.642	474.929
244.187	652.911
244.196	679.476
244.586	411.160
245.519	312.855
248.053	658.172
248.415	307.503
248.969	512.050
250.520	806.906
250.879	448.268
251.382	504.049
253.387	716.546
253.810	541.208
254.828	692.618
255.216	416.332
255.668	326.003
255.735	519.930
258.066	275.497
259.542	352.517
261.500	426.874
261.565	615.488
267.845	615.405
267.900	774.797
268.776	511.787
274.084	495.777
274.094	524.999
274.132	633.917
274.185	787.996
275.611	721.564
275.622	753.442
279.923	617.901
280.335	410.685
281.928	827.741
283.349	745.370
285.320	856.918
287.216	750.631
290.102	716.058
290.136	814.350
292.993	694.767
295.523	1026.802
296.348	617.683
297.410	893.949
297.809	649.542
300.292	846.093
300.837	1026.731
300.862	1098.458
313.302	750.285
313.394	1015.938
314.828	970.758
315.863	1169.985
318.519	468.622
319.625	872.402
320.155	1010.535
325.915	901.541
326.417	957.321
331.778	1092.734
333.683	1013.012
334.543	704.841
340.388	845.561
346.398	1461.800
347.301	1278.486
351.538	956.988];
n=size(data.tWw_f,1); for i=2:n; if data.tWw_f(i,1)<=data.tWw_f(i-1,1); data.tWw_f(i,1)=data.tWw_f(i-1,1)+1e-3; end; end
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(15);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Vill1992';
comment.tWw_f = 'Data for females from northern Benguela upwelling system)'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
154.971	48.319
157.310	25.781
158.480	90.493
160.819	55.022
164.327	100.429
167.836	132.904
167.836	65.005
168.421	90.895
172.515	74.894
174.269	152.563
176.023	130.001
181.287	152.847
181.287	88.182
185.965	143.336
187.135	272.714
190.643	217.890
190.643	201.724
191.813	143.573
194.152	176.000
194.737	91.959
195.322	208.380
198.830	121.223
200.000	182.703
200.000	166.536
200.585	134.227
201.754	328.270
205.848	111.807
207.018	199.152
208.187	131.301
209.357	302.711
209.942	147.539
212.865	218.788
213.450	183.246
214.620	341.723
215.789	173.641
216.959	309.485
217.544	277.176
218.129	144.636
218.713	189.925
219.883	432.467
220.468	364.592
220.468	248.195
221.637	345.240
222.807	141.592
225.146	474.712
225.731	403.604
225.731	193.442
225.731	293.673
226.316	157.900
227.485	339.010
229.240	297.048
229.825	429.635
229.825	213.007
232.749	455.620
233.333	319.847
234.503	303.728
236.842	213.291
238.596	342.692
239.181	161.653
239.766	274.841
240.936	229.623
244.444	378.494
244.444	342.928
245.029	287.987
245.029	229.788
246.199	414.131
246.199	239.535
247.368	326.880
247.953	265.472
251.462	459.609
252.632	294.760
255.556	362.777
258.480	240.031
259.649	463.173
263.743	473.039
265.497	253.248
265.497	547.474
269.006	457.085
271.345	337.549
271.345	473.346
272.515	363.462
274.269	295.635
276.023	402.403
278.363	253.768
278.947	434.854
280.117	399.335
284.795	457.723
284.795	477.123
285.965	302.574
291.228	445.050
291.813	373.942
292.982	393.389
295.322	299.719
297.661	393.578
297.661	539.075
301.170	500.417
302.339	545.730
302.339	487.532
305.263	519.982
307.018	274.326
309.942	565.437
309.942	478.139
314.620	694.956
314.620	407.196
331.579	647.143];
n=size(data.tWw_m,1); for i=2:n; if data.tWw_m(i,1)<=data.tWw_m(i-1,1); data.tWw_m(i,1)=data.tWw_m(i-1,1)+1e-3; end; end
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(15);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Vill1992';
comment.tWw_m = 'Data for males from northern Benguela upwelling system)'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lpm = 3 * weights.Lpm;
weights.am = 50 * weights.am;
weights.Ni = 10 * weights.Ni;
weights.Wwb = 10 * weights.Wwb;

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
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7CG54'; % Cat of Life
metaData.links.id_ITIS = '555983'; % ITIS
metaData.links.id_EoL = '399986'; % Ency of Life
metaData.links.id_Wiki = 'Todarodes_angolensis'; % Wikipedia
metaData.links.id_ADW = 'Todarodes_angolensis'; % ADW
metaData.links.id_Taxo = '158101'; % Taxonomicon
metaData.links.id_WoRMS = '225569'; % WoRMS
metaData.links.id_molluscabase = '225569'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Todarodes_angolensis}}';
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
bibkey = 'LaptNigm1999'; type = 'Article'; bib = [ ... 
'author = {V. V. Laptikhovsky and C. M. Nigmatullin}, ' ... 
'year = {1999}, ' ...
'title = {Egg size and fecundity in females of the subfamilies {T}odaropsinae and {T}odarodinae ({C}ephalopoda: {O}mmastrephidae)}, ' ...
'journal = {J.Mar. Biol. Ass. U.K.}, ' ...
'volume = {79}, ' ...
'pages = {569-570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vill1992'; type = 'Article'; bib = [ ... 
'author = {Roger Villanueva}, ' ... 
'year = {1992}, ' ...
'title = {Interannual growth differences in the oceanic squid \emph{Todarodes angolensis} {A}dam in the northern {B}enguela upwelling system, based on statolith growth increment analysis}, ' ...
'journal = {J. Exp. Mar. BioL EcoL}, ' ...
'volume = {159}, ' ...
'pages = {157-177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Todarodes-angolensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

