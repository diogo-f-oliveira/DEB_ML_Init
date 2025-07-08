function [data, auxData, metaData, txtData, weights] = mydata_Dosidicus_gigas

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Dosidicus_gigas'; 
metaData.species_en = 'Humboldt squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.ab = 6; units.ab = 'd'; label.ab = 'age at birth';           bibkey.ab = 'StaaCama2008';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2*365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'Wiki';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'MarkQuin2004';
data.Li  = 120; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'RosaYama2013';
data.Li_m = 90; units.Li_m = 'cm'; label.Li_m  = 'mantle length at death for male'; bibkey.Li_m  = 'MarkQuin2004';

data.Wwb  = 5.2e-4; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'StaaCama2008';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi  = 65e3; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';       bibkey.Wwi  = 'RosaYama2013';

data.Ni  = 2e7; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'RosaYama2013';   
  temp.Ni = C2K(10); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length data
data.tL_f = [ ... % time since birth (d), mantle length (cm)
81.818	11.142
131.431	16.087
141.876	30.253
146.228	35.223
152.321	30.495
157.544	38.448
159.284	23.779
164.507	24.771
164.508	26.262
164.509	30.737
167.988	27.255
168.859	39.437
170.600	25.513
170.601	31.728
174.081	26.257
176.692	37.941
176.693	40.924
177.563	42.167
178.433	39.183
183.656	44.898
183.657	40.920
185.397	36.444
185.398	33.461
186.267	39.427
187.137	27.990
188.008	43.653
188.878	41.415
188.879	42.658
190.617	37.436
190.618	35.198
190.619	33.209
190.620	31.717
194.971	43.400
194.972	36.190
197.582	36.437
197.583	34.200
199.323	47.127
199.324	47.376
200.193	30.220
201.064	41.408
201.065	41.408
204.545	44.887
204.546	39.168
204.547	33.201
204.548	34.942
208.027	37.426
208.028	30.465
210.638	42.397
210.639	31.955
212.378	39.164
212.379	37.424
214.990	45.627
215.861	42.394
216.731	35.432
217.601	45.625
217.602	47.117
217.603	34.437
218.472	38.912
219.342	41.149
221.954	38.164
224.565	39.903
225.435	35.676
225.436	33.687
226.306	41.394
228.917	35.426
228.918	42.387
231.528	46.115
232.396	33.683
232.397	39.402
232.398	51.087
233.268	42.384
233.269	48.351
234.138	40.644
234.139	50.837
235.010	36.168
235.880	38.405
236.750	43.128
238.490	44.868
238.491	47.851
240.232	50.585
243.714	47.848
248.936	51.326
252.418	45.109
253.288	51.821
255.028	42.621
255.029	47.593
256.770	52.565
257.640	54.802
260.251	50.325
261.122	57.286
261.991	45.352
261.992	47.590
262.863	48.832
263.733	54.799
264.602	58.030
264.603	59.273
268.956	52.309
270.695	49.325
270.696	55.292
270.697	57.281
271.567	58.524
271.567	59.767
274.178	53.550
275.048	59.765
275.919	56.035
278.530	50.315
279.400	54.293
280.271	47.331
281.141	58.767
281.141	57.027
282.012	61.998
285.493	61.996
288.975	56.028
288.976	55.530
294.197	51.550
295.068	65.969
296.807	50.554
296.809	62.487
297.678	56.272
297.679	57.266
298.549	58.260
302.031	60.496
303.772	55.274
304.642	70.936
305.512	59.251
305.513	64.223
305.514	64.969
308.124	62.481
308.994	59.746
308.994	61.238
309.865	64.718
309.865	66.707
309.865	68.198
311.605	63.722
313.346	66.208
314.217	61.235
315.087	62.726
315.087	71.179
315.087	75.654
316.828	62.476
319.439	68.690
320.309	59.988
320.309	65.209
321.180	67.944
322.050	63.717
322.050	66.203
322.921	65.705
322.921	67.197
324.661	75.400
324.661	71.174
325.532	69.184
326.402	59.985
329.014	71.669
329.884	65.204
330.754	67.441
330.754	74.154
331.625	69.678
334.236	61.224
335.977	73.156
335.977	77.383
336.847	72.410
338.588	65.696
338.588	68.183
342.070	72.407
342.940	66.191
345.551	65.195
345.551	71.908
345.551	69.173
345.551	68.179
347.292	61.216
347.292	57.736
347.292	70.664
350.774	68.176
350.774	71.159
350.774	74.143
350.774	76.380
352.514	78.368
354.255	73.892
355.996	69.913
355.996	71.405
356.867	75.134
356.867	77.869
362.089	73.639
363.830	70.406
364.700	76.124
366.441	72.891
367.311	78.857
370.793	75.623
371.663	78.109
373.404	77.114
376.015	70.400
377.756	79.349
377.756	81.586
378.627	65.177
378.627	73.133
382.108	70.396
386.460	87.797
388.201	70.393
388.201	76.608
391.683	79.590
391.683	76.358
392.553	81.827
395.164	74.118
408.220	86.045
412.573	83.805
413.443	77.589
415.184	83.057
434.333	86.528
436.944	83.045
439.555	81.055];
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MarkQuin2004';
comment.tL_f = 'Data for females'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
134.913	17.033
146.228	26.226
156.673	24.231
173.211	35.907
177.563	30.186
177.563	33.170
177.563	34.413
178.433	36.401
181.045	25.709
194.101	31.172
201.064	36.389
203.675	40.117
204.545	41.359
208.027	45.087
212.379	40.609
214.120	44.089
214.990	35.635
215.861	37.872
216.731	42.844
219.342	35.136
220.213	36.875
221.083	44.085
222.824	46.819
224.565	42.094
226.306	49.303
228.917	38.114
231.528	43.582
234.139	47.310
235.010	48.801
236.750	39.104
237.621	37.860
238.491	48.550
238.491	47.307
241.103	43.825
244.584	47.553
245.455	50.784
247.195	41.336
248.066	47.799
249.807	51.030
253.288	50.034
254.159	58.238
255.029	48.044
255.029	46.801
258.511	40.584
258.511	49.037
258.511	52.020
258.511	57.241
259.381	50.279
259.381	54.008
261.992	46.548
268.085	44.308
268.085	48.037
268.085	54.998
268.085	52.512
268.955	41.075
271.567	49.775
271.567	52.013
274.178	47.785
275.919	46.789
275.919	50.519
275.919	56.983
276.789	53.999
277.660	53.004
279.400	55.986
282.882	57.973
286.364	59.463
287.234	47.778
288.104	57.971
290.716	53.991
290.716	59.212
290.716	60.704
292.456	54.985
293.327	55.979
294.197	66.172
296.809	61.198
299.420	55.975
303.772	57.465
303.772	57.962
304.642	59.204
307.253	69.396
310.735	61.190
313.346	58.454
313.346	62.183
313.346	64.918
315.087	66.657
317.698	63.672
317.698	65.661
317.698	66.656
317.698	67.899
317.698	70.385
320.309	58.699
320.309	55.467
320.309	68.892
324.662	55.216
324.662	53.227
329.884	66.898
331.625	60.930
334.236	67.641
335.106	61.674
335.106	70.375
339.458	67.638
341.199	64.902
341.199	70.372
344.681	67.884
345.551	66.143
345.551	72.607
349.033	73.600
355.996	73.845
362.959	72.846
363.830	71.105
363.830	69.614
366.441	65.883
368.182	67.622
372.534	71.349];
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MarkQuin2004';
comment.tL_m = 'Data for males'; 

% time weight data
data.tW_f = [ ... % time since birth (d), wet weight (kg)
131.178	0.207
143.340	0.758
147.683	2.204
153.764	0.689
156.371	0.413
160.714	1.584
166.795	0.413
171.139	1.584
175.483	0.826
177.220	1.309
179.826	2.066
183.301	2.342
183.301	1.928
185.039	1.309
186.776	0.482
188.514	2.342
190.251	1.997
191.988	1.033
197.201	1.653
197.201	2.410
197.201	2.961
199.807	0.895
200.676	1.309
200.676	2.686
201.544	2.961
202.413	1.309
202.413	2.066
204.151	2.273
212.838	2.135
212.838	1.515
212.838	1.033
216.313	1.791
218.919	2.686
221.525	2.893
221.525	1.997
221.525	1.515
228.475	1.860
228.475	1.033
230.212	1.309
234.556	2.961
234.556	3.719
235.425	1.309
235.425	2.410
237.162	3.719
238.900	1.928
238.900	2.961
242.375	2.410
244.981	3.581
251.930	3.512
253.668	3.237
253.668	2.824
255.405	2.066
256.274	4.614
256.274	5.165
259.749	1.860
259.749	4.339
261.486	5.716
263.224	2.273
263.224	2.893
263.224	3.719
264.961	5.716
266.699	3.719
267.568	5.165
268.436	4.614
270.174	4.063
270.174	6.061
271.911	4.959
272.780	2.755
276.255	5.716
277.124	4.614
278.861	3.237
279.730	2.686
279.730	6.405
283.205	4.063
284.073	5.647
284.073	7.989
287.548	2.273
288.417	5.579
289.286	6.680
290.154	5.165
291.023	3.788
291.023	4.201
294.498	5.785
296.236	6.267
297.973	3.581
297.973	4.339
297.973	5.028
300.579	7.645
301.448	6.267
303.185	4.063
303.185	5.854
304.923	6.061
304.923	12.052
305.792	5.028
305.792	8.264
307.529	7.645
308.398	9.229
310.135	6.680
313.610	8.747
315.347	6.474
315.347	7.920
315.347	7.438
315.347	13.843
316.216	4.201
316.216	3.857
316.216	10.950
317.954	6.129
317.954	7.645
317.954	8.127
317.954	8.471
317.954	9.298
318.822	11.570
321.429	10.950
322.297	7.438
322.297	9.573
322.297	14.532
324.903	6.818
324.903	12.466
325.772	9.298
326.641	11.433
326.641	13.705
327.510	15.978
328.378	5.992
328.378	10.399
328.378	10.813
330.985	8.471
332.722	9.435
332.722	11.708
332.722	12.190
332.722	12.948
333.591	7.369
336.197	14.394
337.934	15.289
340.541	9.229
343.147	7.645
344.015	8.127
344.015	8.609
344.884	13.774
346.622	5.716
346.622	7.645
346.622	13.430
347.490	13.154
349.228	10.331
349.228	10.055
349.228	15.083
349.228	11.983
351.834	14.050
351.834	12.397
352.703	10.124
353.571	13.154
353.571	12.603
355.309	18.733
357.915	10.124
359.653	12.052
360.521	13.705
362.259	11.777
363.127	14.532
364.865	14.945
367.471	12.466
367.471	13.705
370.946	15.771
371.815	13.292
371.815	12.879
372.683	11.777
377.027	14.807
377.027	15.909
377.027	16.736
378.764	18.182
379.633	11.226
379.633	12.879
380.502	8.678
381.371	9.642
384.846	23.278
385.714	11.226
386.583	13.705
388.320	15.840
389.189	15.152
390.927	17.631
391.795	12.810
392.664	9.917
409.170	19.008
410.907	22.245
415.251	14.738
415.251	21.832
434.363	23.347
437.838	18.595
442.181	19.490];
n=size(data.tW_f,1); for i=2:n; if data.tW_f(i,1)<=data.tW_f(i-1,1); data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3; end; end
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(10);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MarkQuin2004';
comment.tW_f = 'Data for females'; 
%
data.tW_m = [ ... % time since birth (d), wet weight (kg)
134.913	0.104
146.228	0.516
156.673	0.170
174.081	0.925
175.822	0.580
177.563	0.924
179.304	1.199
182.785	0.441
194.971	0.646
201.934	0.783
206.286	1.677
206.286	1.471
208.898	1.470
212.379	1.194
214.120	1.745
214.990	2.158
218.472	1.400
218.472	0.849
221.083	2.157
224.565	2.019
224.565	3.258
231.528	1.122
231.528	1.880
232.398	2.706
233.269	2.224
235.880	3.119
236.750	2.568
240.232	1.465
242.843	2.705
243.714	2.085
248.066	1.602
248.936	2.015
248.936	3.393
252.418	2.841
254.159	3.116
254.159	5.733
256.770	3.736
257.640	1.669
258.511	2.978
259.381	2.289
259.381	5.319
260.251	4.217
261.122	3.804
265.474	3.459
265.474	4.285
266.344	2.977
268.085	1.806
268.085	3.665
269.826	2.219
271.567	4.284
275.919	2.906
276.789	4.284
277.660	3.388
278.530	3.801
279.400	4.145
282.012	5.040
285.493	5.246
286.364	2.698
288.975	6.417
289.845	5.521
290.716	4.488
291.586	4.144
291.586	6.003
294.197	8.689
295.068	4.281
295.938	5.451
296.809	7.173
302.901	5.244
302.901	4.693
303.772	11.924
306.383	6.345
308.994	7.447
313.346	5.587
315.087	6.895
315.957	7.239
315.957	7.859
315.957	8.065
316.828	4.897
318.569	9.167
318.569	10.613
319.439	9.305
319.439	9.993
320.309	4.070
320.309	5.241
320.309	7.238
320.309	8.271
322.050	8.822
323.791	4.552
329.884	9.716
329.884	6.824
334.236	8.614
336.847	7.925
337.718	9.715
337.718	9.095
337.718	7.098
340.329	10.817
341.199	8.750
343.810	7.992
343.810	8.612
344.681	4.067
344.681	7.786
344.681	7.648
344.681	9.301
344.681	9.921
347.292	10.540
358.607	12.467
359.478	12.122
362.959	9.160
363.830	9.711
364.700	10.537
364.700	10.262
368.182	9.435
368.182	8.746
373.404	10.261];
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(10);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MarkQuin2004';
comment.tW_m = 'Data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3 * weights.Wwb;
weights.Lp = 3 * weights.Lp;
weights.Ni = 3 * weights.Ni;
weights.tW_m = 3 * weights.tW_m;
weights.tW_f = 3 * weights.tW_f;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and h_a only';
D2 = 'Reproductive output is assumed to correspond to death at 600 d';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'typically lives for 1 yr, some reach 2 yr; Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '37G6Q'; % Cat of Life
metaData.links.id_ITIS = '82538'; % ITIS
metaData.links.id_EoL = '403181'; % Ency of Life
metaData.links.id_Wiki = 'Dosidicus_gigas'; % Wikipedia
metaData.links.id_ADW = 'Dosidicus_gigas'; % ADW
metaData.links.id_Taxo = '158112'; % Taxonomicon
metaData.links.id_WoRMS = '342291'; % WoRMS
metaData.links.id_molluscabase = '342291'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dosidicus_gigas}}';
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
bibkey = 'MarkQuin2004'; type = 'Article'; bib = [ ... 
'author = {U. Markaida and C. Quin\''{o}nez-Vel\''{a}zquez and O. Sosa-Nishizaki}, ' ... 
'year = {2004}, ' ...
'title = {Age, growth and maturation of jumbo squid \emph{Dosidicus gigas} ({C}ephalopoda: {O}mmastrephidae) from the {G}ulf of {C}alifornia, {M}exico}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {66}, ' ...
'pages = {31-47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StaaCama2008'; type = 'Article'; bib = [ ... 
'author = {D. J. Staaf and S. Camarillo-Coop and S. H. D. Haddock and A. C. Nyack and J. Payne and C. A. Salinas-Zavala and B. A. Seibel and L. Trueblood and C. Widmer and W. F. Gilly}, ' ... 
'year = {2008}, ' ...
'title = {Natural egg mass deposition by the {H}umboldt squid (\emph{Dosidicus gigas}) in the {G}ulf of {C}alifornia and characteristics of hatchlings and paralarvae}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'doi = {10.1017/S0025315408001422}, ' ...
'volume = {88}, ' ...
'pages = {759-770}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RosaYama2013'; type = 'incollection'; bib = [ ... 
'author = {Rosa, R. and Yamashiro, C. and Markaida, U. and Rodhouse, P. and Waluda, C. and Zavala, C. A. and Keyl, F. and O''Dor, R. and Stewart, J. and William, G.}, ' ... 
'year = {2013}, ' ...
'editor = {Rosa, R. and Pierce, G. J. and O''Dor, R.}, ' ...
'booktitle = {Advances in Squid Biology, Ecology and Fisheries. Part II }, ' ...
'title = {\emph{Dosidicus gigas}, Humboldt squid}, ' ...
'publisher = {Nova Science Publishers, Inc.}, ' ...
'isbn = {978-1-62808-337-8}, ' ...
'doi = {10.13140/2.1.4154.2083}, ' ...
'pages = {169-206}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
