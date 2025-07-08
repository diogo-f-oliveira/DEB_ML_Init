function [data, auxData, metaData, txtData, weights] = mydata_Merlangius_merlangus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Merlangius_merlangus'; 
metaData.species_en = 'Whiting'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % in K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L',; 'L-N'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Lorna Teal', 'Friedemann Keyl'}; 
metaData.date_subm = [2012 04 18]; 
metaData.email    = {'lorna.teal@wur.nl'}; 
metaData.address  = {'IMARES, P.O. Box 68, 1970 AB IJmuiden, The Netherlands'};

metaData.author_mod_1  = {'Dina Lika'}; 
metaData.date_mod_1    = [2015 04 13];
metaData.email_mod_1   = {'lika@biology.uoc.gr'}; 
metaData.address_mod_1 = {'University of Crete, 70013, Greece'};

metaData.author_mod_2  = {'Bas Kooijman'}; 
metaData.date_mod_2    = [2015 08 09];
metaData.email_mod_2   = {'bas.kooijman@vu.nl'}; 
metaData.address_mod_2 = {'VU University, Amsterdam'};

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2016 10 17];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 03];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'PovoDave2011';    
  temp.ab = C2K(8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 59;     units.aj = 'd';    label.aj = 'age at metam for female';        bibkey.aj = 'JoneHisl1972';
  temp.aj = C2K(8); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.aj_m = 50;     units.aj_m = 'd';    label.aj_m = 'age at metam for male';    bibkey.aj_m = 'JoneHisl1972';
  temp.aj_m = C2K(8); units.temp.aj_m = 'K'; label.temp.aj_m = 'temperature';
data.ap = 262;    units.ap = 'd';    label.ap = 'age at puberty for female';      bibkey.ap = 'calculated'; 
  temp.ap = C2K(9.59); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'calculated from 2005 North Sea data (using von Bertalanfy growth)';
data.ap_m = 232;    units.ap_m = 'd';    label.ap_m = 'age at puberty for male';  bibkey.ap_m = 'calculated'; 
  temp.ap_m = C2K(9.59); units.temp.ap_m = 'K'; label.temp.ap_m = 'temperature';
  comment.ap_m = 'calculated from 2005 North Sea data (using van Bertalanfy growth); mean North Sea temp from Hadley SST (based on data)';
data.am = 7300;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'FishBase';  
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.335;             units.Lb = 'cm';   label.Lb = 'total length at first feeding';    bibkey.Lb = 'PovoDave2011';
data.Lj = 0.75;              units.Lj = 'cm';   label.Lj = 'total length at metamorphosis';    bibkey.Lj = {'ShawDiek2008', 'Last1978'};
data.Lp = 17.46;             units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'Datras';
data.Lp_m = 15.88;           units.Lp_m = 'cm'; label.Lp_m = 'total length at puberty for males'; bibkey.Lp_m = 'Datras';
  comment.Lp_m = 'L50% is decreasing over time: we chose lowest L50% in North Sea datras dataset 2008'; 
data.Li = 80;                units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'Datras';
data.Li_m = 68;              units.Li_m = 'cm'; label.Li_m = 'ultimate total length for males'; bibkey.Li_m = 'Datras';

data.Wwb = 3e3*(0.335/80)^3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'estimate';
  comment.Wwb = 'calculated as 3e3*(0.335/80)^3';
data.Wwp = 40.47;            units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'calculated';  
  comment.Wwp = 'L50% is decreasing over time, weight calculated from L50% using 2008 L~W relationship';  
data.Wwp_m = 30.82;          units.Wwp_m = 'g'; label.Wwp_m = 'wet weight at puberty for males';         bibkey.Wwp_m = 'calculated';  
  comment.Wwp_m = 'L50% is decreasing over time, weight calculated from L50% using 2008 L~W relationship';  
data.Wwi = 5695;             units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'FishBase';     
  comment.Wwi = 'L50% is decreasing over time, weight calculated from L50% using 2008 L~W relationship';
data.Wwi_m = 3128;           units.Wwi_m = 'g'; label.Wwi_m = 'ultimate male wet weight for males';      bibkey.Wwi_m = 'FishBase';     
  comment.Wwi_m = 'L50% is decreasing over time, weight calculated from L50% using 2008 L~W relationship';

data.Ri = 3500000/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';                      bibkey.Ri = 'HislHall1974';
  temp.Ri = C2K(9.39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'Mean NNS temperature from Hadley SST for 1962 (mean monthly available, changes different to SNS; from Iceland)';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years) ~ Length (mm) for females in the North Sea
1	150
2	190
3	210
4	260
5	310
6	340
7	350
8	360
9	364
10	370
11	370
12	370];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert a to d
data.tL_f(:,2) = data.tL_f(:,2)/10;    % convert mm to cm
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(9.39);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'unknown';
comment.tL_f = 'Data for females; temperature from Hadley SST for 1962; lengths are median lengths from a time-series';
% 
data.tL_m = [ ... % age (years) ~ Length (cm) for males in the North Sea            
 1  140
 2  190
 3  200
 4  240
 5  280
 6  300
 7  310
 8  317.5
 9  318
10	320
11	320
12	325
13	327
14	330
15	330];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert a to d
data.tL_m(:,2) = data.tL_m(:,2)/10;  % convert mm to cm
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(9.39);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'unknown';
comment.tL_m = 'Data for males; temperature from Hadley SST for 1962; lengths are median lengths from a time-series';

% length-fecundity
data.LN = [ ... % Length (cm) ~ Fecundity (nr of eggs) 
26.08673479	255692.3638
26.08773193	244524.0368
26.09138845	207587.9559
26.09371559	187044.2448
27.06508671	167828.5154
27.06175346	193804.8421
26.84369033	247112.0215
27.05577763	250860.0841
27.03005067	241091.2561
28.00569339	244890.627
27.99867672	328189.7685
28.02544463	339797.366
28.01842302	455378.8777
29.00977456	326809.9024
29.01310131	285829.2066
28.99080706	221914.5412
28.99314654	201947.3809
29.99413523	381427.1259
29.99044124	440464.0279
30.97543532	556544.5232
30.97754025	514064.6945
31.00926318	491621.2117
30.98319798	415285.7594
31.0184834	347353.173
30.95846949	333819.829
32.04009954	395460.3397
32.00691424	419715.976
32.0636493	529986.5469
32.9840887	728543.415
32.98857173	621571.6046
32.98969258	597379.2022
32.93173852	466095.9754
32.96518265	450192.7066
33.94767127	563184.3096
33.94334623	653588.7236
33.93945416	747296.8545
33.93743622	801059.9566
36.04818464	610497.5007
36.12220702	555590.0084
36.97983485	688084.9116
38.00054775	1049739.146
38.00216169	998918.504
38.00393709	945852.8787
37.98070195	611171.0986
38.98315266	1165666.02
39.96586661	857396.6194
39.96773376	811849.0723
40.9935443	1121486.151
41.9654035	1445182.156
20.92973647	96280.54379
22.01753366	176285.3559
21.99457458	168704.3027
21.9949531	161451.3213
22.04473682	112977.1549
23.04770286	128259.8305
23.0467113	143153.5263
23.04611638	152907.5338
23.06942872	173501.2081
23.06739415	217325.5816
24.09329446	200241.3281
24.06915459	172638.5659
24.12088289	161630.0215
24.12280281	131903.3912
25.11139382	186533.4308
25.05775693	194908.2353
25.10998938	215169.883
25.08299623	223601.621
25.10809891	260781.281
25.10637061	310895.6436
26.13898064	305962.1964
27.1264489	336059.151
27.12691573	321611.2043
27.1572184	278812.2729
28.06783633	213103.2979
28.06517981	271365.8708
28.03440678	297923.2416
28.06348944	316483.5714
27.97404504	325283.8126
28.06282539	336195.917
28.03145193	389939.5513
29.08778509	539435.0484
29.11915064	516250.0739
29.12065403	452487.3685
29.028652	433017.3901
29.03052541	367230.0863
29.12353575	351455.4365
28.96982608	341912.3655
29.15487714	338202.4907
29.06245439	332662.2548
29.06332965	308038.8934
29.09510695	283679.2271
30.25282942	497004.0619
30.12483152	494256.3755
30.09354792	467833.2269
30.06255548	433199.1233
30.09477792	421468.6188
30.09536057	401139.2138
30.09652591	363374.8529
30.0657891	329161.5485
29.93871136	323765.2993
30.03437299	316741.2224
31.17000563	320382.6599
31.16853053	361535.9848
31.13462262	388291.9717
31.10115301	403507.7451
31.13368498	419330.4338
31.13288131	447902.2218
31.13234554	468023.621
31.16491014	486376.1611
31.16182644	626193.3845
31.16135721	650739.9375
32.16788078	695344.3964
32.06894182	537108.0095
32.17141006	525455.47
32.20617	500116.6513
32.17258658	478609.4141
32.13959127	438335.4583
32.10587009	426455.023
32.14042093	410373.9364
32.10752768	373783.019
32.1425643	346120.3366
33.13940849	596428.8393
32.89515426	558332.806
33.14012138	564550.6873
33.10542164	546240.6316
33.31653138	555359.0365
33.17678437	503050.4064
33.14204625	486734.9876
33.10791425	450701.5701
33.07488462	384328.008
33.07744609	315370.84
34.14652113	320733.1929
34.14365654	397357.2269
34.17687123	497731.3381
34.17635659	517242.2255
34.1032106	546435.1422
34.17415111	609903.4009
34.17356301	637302.4831
34.17297491	665932.4319
34.09998287	695830.8467
34.13572506	719155.1855
34.13521105	747345.8073
34.20680679	798287.7778
35.12321404	967815.2576
35.08658884	926194.9032
35.12442294	886386.9498
35.1645671	719411.2692
35.12789878	688473.3895
34.75957311	583801.026
34.98160744	577466.5704
35.1299391	593576.6163
35.31709315	577532.6577
35.13349106	458516.554
36.00014831	487217.9647
36.03671936	546796.5601
36.03555657	593757.783
36.03509147	613652.8168
36.07301716	627293.1311
36.03230097	747830.6006
35.99341152	785720.0489
35.95232114	968086.0272
37.07321916	1110998.136
36.99570353	1034403.266
36.99920536	812315.6635
36.99984209	777392.3669
37.07912114	739913.909
36.80487914	739848.0548
37.08294994	568425.8998
38.03024152	1017833.524
38.11148244	984859.7267
38.11246625	922035.2933
37.95186781	877516.5813
38.03465945	756581.9932
39.97773841	795400.147
39.93931574	617794.3757
42.78342042	893379.624
43.83944284	913493.224];
units.LN = {'cm', '# of eggs'};     label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(9.39); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HislHall1974';
comment.LN = 'temperature from Hadley SST for 1962; Data from northern North Sea (1961 and 1962)';

% Length weigth data for females
data.LW_f = [ ... Length (mm) ~ Weight (g) FEMALES from datras database (North Sea) 
70	3
80	4
87	4
90	6.5
91	4
93	4
97	5
99	6
100	8
101	6
103	8
106	9
107	9
108	6
110	11
111	10
112	10
113	12
114	10
115	10
116	10
118	12
119	14
120	14
121	12
122	11
123	13
125	14
126	14
127	16
128	14
129	13
130	17
131	16
132	16
133	16
134	17
135	17
136	16
137	18
138	20
139	18
140	21
141	18
142	20
143	20
144	22
145	22
146	22
147	22
148	22
149	24
150	26
151	24
152	26
153	24
154	26
155	24
156	26
157	26
158	27
159	26
160	32
161	28
162	30
163	30
164	30
165	32
166	32
167	34
168	34
169	32
170	40
171	34
172	36
173	38
174	38
175	36
176	40
177	38
178	39
179	40
180	46
181	42
182	42
183	44
184	43
185	42
186	44
187	46
188	46
189	48
190	55
191	47
192	50
193	50
194	52
195	54
196	54
197	54
198	56
199	60
200	65
201	58
202	59
203	61
204	62
205	62
206	64
207	61
208	64
209	68
210	76
211	68
212	66
213	70
214	70
215	72
216	72
217	74
218	76
219	76
220	87
221	78
222	86
223	80
224	80
225	84
226	84
227	86
228	86
229	88
230	100
231	88
232	96
233	90
234	98
235	96.5
236	98
237	98
238	97.5
239	101
240	114
241	102
242	103.5
243	106
244	113.5
245	110
246	110
247	112
248	112
249	116
250	128
251	115
252	120
253	124
254	121
255	124
256	126
257	124
258	133
259	142
260	142
261	128
262	136
263	138
264	139
265	138
266	144
267	147
268	156
269	150
270	161
271	160
272	152
273	158
274	162
275	159
276	158
277	160
278	166
279	160
280	179
281	169
282	174
283	182
284	164
285	172
286	176
287	186
288	178
289	188
290	200
291	190
292	187
293	198
294	192
295	204
296	200
297	200
298	202
299	191
300	222
301	230
302	218
303	220
304	226
305	218
306	234
307	231
308	230
309	241
310	246
311	242
312	246
313	227
314	244
315	253
316	262
317	252
318	244
319	256
320	270
321	261
322	266
323	272
324	284
325	278
326	266
327	264
328	290
329	290
330	298
331	278
332	296
333	290
334	302
335	300
336	308
337	324
338	314
339	320
340	332
341	334
342	314
343	317
344	341
345	332
346	352
347	336
348	340
349	348
350	361
351	340.5
352	382
353	349
354	386
355	384
356	370
357	364
358	380
359	421
360	396
361	380
362	358
363	422
364	390
365	408
366	450
367	360
368	412
369	388
370	436
371	456
372	450
373	430
375	435
376	504
377	486
378	384
379	483
380	474.5
381	488
382	436
383	462
384	492
385	468
386	500
387	528
388	482
389	526
390	515
391	532
392	514
394	532
395	464
396	594
397	462
398	516
400	560
401	556
402	576
403	500
405	574
406	608.5
408	562
409	663
410	613
411	524
412	576
413	620
414	650
415	718
417	510
418	690
419	598
420	645
422	673
423	752
425	674
427	888
428	616
429	722
430	716.5
431	726
432	750
433	679
434	719
435	698
438	926
440	736
441	926
442	679
443	736
445	752
447	780
448	934
450	794
451	850
453	1006
454	897
460	848
461	664
462	800
467	916
470	894
480	951.5
490	1004
500	1069
510	1144
511	1194
520	1415
528	1350
530	1491
540	1224
550	1304
560	1656
578	1788
580	1528];
data.LW_f(:,1) = data.LW_f(:,1)/10; % convert mm to cm
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'Datras';
comment.LW_f = 'Data for females from the North sea';
% males
data.LW_m = [ ... Length (mm) ~ Weight (g) MALES from datras database (North Sea) 
60	4.5
70	4
73	3
80	5
85	4
90	6
91	6
93	6
94	6
95	6
96	6
97	9
98	6
99	8
100	9
101	7
102	8
103	8
104	8
105	8
106	8.5
107	12
108	9
109	10
110	11
111	10
112	11
113	10
114	13
115	10
116	12
117	11
118	12
119	12
120	14
121	12
122	12
123	14
124	12
125	13
126	14
127	13
128	14
129	14
130	18
131	16
132	16
133	18
134	16
135	16
136	18
137	18
138	19
139	18
140	22
141	20
142	20
143	22
144	20
145	22
146	22
147	23
148	24
149	26
150	27
151	24
152	24
153	24
154	27
155	26
156	26
157	26
158	29
159	29.5
160	33
161	30
162	30
163	32
164	32
165	32
166	32
167	32
168	34
169	34
170	40
171	36
172	37.5
173	38
174	36
175	38
176	40
177	40
178	40
179	40.5
180	48
181	43
182	43.5
183	46
184	46
185	45.5
186	45
187	46
188	48
189	46
190	56
191	50
192	52
193	50
194	57
195	54
196	53
197	58
198	54.5
199	55
200	65
201	57
202	58
203	62
204	62
205	60
206	60
207	64
208	64
209	64
210	75
211	68
212	71
213	70
214	72
215	70
216	72
217	76
218	76
219	78
220	86
221	76
222	78
223	82
224	80
225	83
226	83.5
227	83.5
228	84
229	88
230	98
231	90
232	96
233	92
234	94
235	96
236	96
237	98
238	101
239	98.5
240	112
241	102
242	103
243	104
244	106
245	106
246	114
247	106
248	110
249	109
250	126
251	117
252	118
253	116
254	122
255	126
256	120
257	120
258	128
259	124
260	142
261	135
262	138
263	139
264	132
265	136
266	134
267	136
268	144
269	139
270	160
271	150
272	156
273	156
274	142
275	154
276	161
277	154
278	156
279	176
280	177
281	168.5
282	163
283	182
284	180
285	174
286	186
287	167
288	179
289	174
290	199
291	194
292	182
293	202
294	188
295	196
296	193
297	200
298	198
299	222
300	220
301	194
302	206
303	214
304	208
305	228
306	218
307	216
308	223
309	247
310	240
311	223
312	239
313	231
314	274
315	230
316	234
317	240
318	240
319	241
320	267
321	240
322	264
323	255
324	266
325	278
326	286
327	250
328	279
329	290
330	295
331	238
332	284
333	291.5
334	310
335	288
336	288
337	292
338	286
339	296
340	319.5
341	331
342	313
343	341
344	338
345	332
347	331
348	363.5
349	278
350	360
352	328
353	372
355	301
356	398
357	346
358	386
360	394
361	360
363	444
365	376
370	420.5
373	441
374	390
380	453
390	489
400	540.5
410	580
420	604.5
428	545
430	725
440	711.5
450	735
460	761
470	885
480	912
490	1072];
data.LW_m(:,1) = data.LW_m(:,1)/ 10; % convert mm to cm
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'Datras';
comment.LW_m = 'Data for males from the North sea';

%% set weights for all real data
weights = setweights(data, []);

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'FEMALE total length at maturity - NOTE L50% is decreasing over time: we chose lowest L50% in North Sea datras dataset (2008)';
D2 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_4: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3ZV5N'; % Cat of Life
metaData.links.id_ITIS = '164758'; % ITIS
metaData.links.id_EoL = '46564422'; % Ency of Life
metaData.links.id_Wiki = 'Merlangius_merlangus'; % Wikipedia
metaData.links.id_ADW = 'Merlangius_merlangus'; % ADW
metaData.links.id_Taxo = '92959'; % Taxonomicon
metaData.links.id_WoRMS = '126438'; % WoRMS
metaData.links.id_fishbase = 'Merlangius-merlangus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Merlangius_merlangus}}';
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
bibkey = 'PovoDave2011'; type = 'article'; bib = [ ...
'author = {Povoa, I. and Davie, A. and Treasurer, J. and Migaud, H.}, ' ... 
'year   = {2011}, ' ...
'title  = {Broodstock spawning and larviculture of whiting (\emph{Merlangius merlangus} {L}.) reared in captivity}, ' ...
'journal = {Aquaculture Research}, ' ...
'page = {386--389}, ' ...
'volume = 42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Last1978'; type = 'article'; bib = [ ...
'author = {Last, J. M.}, ' ...
'year   = {1978}, ' ...
'title  = {The food of four species of {P}leuronectiform larvae in the eastern {E}nglish {C}hannel and southern {N}orth {S}ea}, ' ...
'journal = {Marine Biology}, ' ...
'page = {359--368}, ' ...
'volume = {45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneHisl1972'; type = 'article'; bib = [ ...
'author = {Jones, R. and Hislop, J. R. G.}, ' ...
'year   = {1972}, ' ...
'title  = {Investigations into the growth of haddock, \emph{Melangrammus aeglefinud} ({L}.) and whiting, \emph{Merlangius merlangus} ({L}.) in aquaria}, ' ...
'journal = {J. Cons. int. Explor. Mer.}, ' ...
'page = {174--189}, ' ...
'volume = {34}, ' ...
'issue = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HislHall1974'; type = 'article'; bib = [ ...
'author = {Hislop, J. R. G. and Hall, W. B.}, ' ... 
'year   = {1974}, ' ...
'title  = {The fecundity of whiting \emph{Merlangius merlangus} ({L}.) in the {N}orth {S}ea, the {M}inch and at {I}celand}, ' ...
'journal = {J. Cons. int. Explor. Mer.}, ' ...
'page = {42--49}, ' ...
'volume = {36}, ' ...
'number = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShawDiek2008'; type = 'article'; bib = [ ...
'author = {Shaw, M. and Diekman, R. and van der Kooij, J. and Milligan, S. and Bromley, P. and Righton, D.}, ' ... 
'year   = {2008}, ' ... 
'title  = {T Assessment of the diets of cod \emph{Gadus morhus} and whiting \emph{Merlangius merlangus} juveniles in a frontal region close to the {N}orwefgiena {T}rench: co-existence of competition?}, ' ... 
'journal = {Journal of Fish Biology}, ' ... 
'page = {1612--1634}, ' ... 
'volume = {73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Datras'; type = 'Misc'; bib = ...
'howpublished = {\url{www.ices.dk/marine-data/data-portals/Pages/DATRAS.aspx}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FishBase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/SpeciesSummary.php?ID=29&genusname=Merlangius&speciesname=merlangus&AT=Merlangius+merlangus&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

