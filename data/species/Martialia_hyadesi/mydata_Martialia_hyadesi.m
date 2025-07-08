function [data, auxData, metaData, txtData, weights] = mydata_Martialia_hyadesi

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Martialia_hyadesi'; 
metaData.species_en = 'Sevenstar flying squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 400;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'ArkhSilv1997';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 31;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';    bibkey.Lp  = 'ArkhSilv1997';
data.Lpm  = 27;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';    bibkey.Lpm  = 'ArkhSilv1997';
data.Li  = 42;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female';     bibkey.Li  = 'ArkhSilv1997';
data.Lim  = 42;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for male';    bibkey.Lim  = 'ArkhSilv1997';

data.Wwb  = 3e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on Ancistrocheirus_lesueurii';

data.Ni  = 29e3; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'guess';   
  temp.Ni = C2K(13);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on Ancistrocheirus_lesueurii';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
164.706	8.374
192.157	8.020
196.732	7.406
201.307	9.754
201.307	8.767
201.961	12.347
209.804	8.895
209.804	10.130
213.072	10.626
215.033	11.615
215.686	8.652
216.993	10.628
218.954	10.629
218.954	11.987
218.954	12.975
220.261	13.593
223.529	9.521
227.451	12.980
228.758	17.796
229.412	8.537
233.987	14.960
233.987	14.713
233.987	13.725
234.641	15.701
235.294	12.738
235.948	16.319
235.948	11.381
236.601	17.307
237.908	14.098
240.523	14.099
240.523	11.877
241.176	12.865
242.484	13.360
243.791	16.324
246.405	13.609
249.020	19.413
249.020	12.747
249.673	16.080
250.980	18.427
251.634	16.082
252.288	14.724
252.288	15.094
253.595	10.651
255.556	14.232
255.556	18.430
256.863	16.085
261.438	14.112
261.438	14.977
261.438	15.470
261.438	15.717
261.438	16.088
262.092	13.002
262.745	18.064
262.745	17.447
264.052	20.657
264.706	18.435
266.667	17.943
267.320	28.437
267.320	17.696
268.627	16.833
268.627	16.216
269.281	15.599
269.281	14.117
270.588	17.081
271.242	18.810
271.895	24.242
273.203	21.897
275.163	18.071
276.471	27.702
277.778	19.431
278.431	22.394
278.431	18.074
280.392	29.803
282.353	18.570
282.353	17.335
283.660	21.163
284.967	21.164
287.582	19.561
288.889	26.228
289.542	18.574
293.464	31.540
293.464	30.182
293.464	26.231
294.771	19.935
295.425	18.207
296.078	21.294
298.693	26.851
299.346	33.889
299.346	28.457
299.346	19.815
300.654	30.680
302.614	27.101
303.922	21.793
304.575	32.781
307.843	27.845
308.497	31.549
309.804	37.229
309.804	29.821
310.458	27.723
312.418	38.959
312.418	30.811
314.379	18.836
316.993	33.406
316.993	34.270
318.954	30.938
318.954	25.629
320.261	32.420
320.261	33.038
321.569	27.483
323.529	26.496
324.183	30.694
328.105	35.635
328.105	34.030
328.758	32.179
330.065	34.896
333.333	33.910
338.562	35.148
340.523	31.692
341.830	32.310
343.137	29.842
344.444	33.793
345.098	40.090
345.098	32.683
345.752	35.893
347.712	30.462
348.366	35.030
349.020	32.685
352.288	36.761
352.941	33.922
357.516	37.505
362.092	41.212
364.052	38.126
364.706	34.917
374.510	39.861
377.124	36.406
398.693	40.123];
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhSilv1997';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
147.973	6.778
187.189	6.766
191.915	10.611
195.758	8.624
196.387	8.004
199.080	9.988
199.728	9.864
204.933	9.242
207.044	13.087
209.034	13.831
215.434	10.355
221.331	10.726
222.043	12.214
223.272	10.229
223.345	12.090
227.233	11.220
232.568	13.948
235.168	13.575
235.192	14.195
239.767	14.194
240.948	10.968
241.070	14.069
241.104	14.938
242.972	12.580
243.801	17.046
244.240	11.587
244.967	13.448
245.025	14.937
246.894	12.579
248.376	17.045
248.425	18.285
249.005	16.424
251.615	16.299
252.166	13.694
253.507	14.562
254.516	23.619
256.083	13.568
256.297	19.027
256.887	17.414
257.512	16.670
257.570	18.159
260.804	17.289
262.155	18.405
262.716	16.048
265.389	17.536
266.071	18.280
269.213	15.053
271.983	19.023
273.149	15.424
275.139	16.168
276.602	20.138
277.358	22.743
278.470	17.780
280.397	16.911
280.470	18.772
283.825	21.004
287.191	23.484
287.611	17.529
289.844	24.476
289.927	26.585
292.127	16.039
293.897	27.825
299.907	14.423
300.403	27.078
300.447	28.195
301.164	29.808
301.526	22.363
301.793	29.187
302.687	18.641
303.139	30.179
304.915	25.464
305.008	27.821
305.086	29.806
306.944	27.200
307.218	17.523
308.208	26.083
308.671	21.244
310.900	28.068
311.480	26.206
311.651	30.549
311.787	34.023
312.299	30.424
312.807	26.702
314.192	28.687
316.918	31.540
319.377	27.569
319.533	31.539
320.708	28.189
321.235	24.963
321.763	21.737
322.363	20.372
322.805	31.662
325.976	29.179
326.044	30.916
326.503	25.954
326.615	28.807
327.410	32.405
329.883	28.806
330.444	26.449
333.229	30.790
333.258	31.535
334.429	28.060
335.039	26.943
336.380	27.811
336.472	30.169
339.609	26.818
339.692	28.927
343.706	31.283
346.417	33.764
349.568	30.785
351.026	34.631
354.778	30.287];
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhSilv1997';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
166.824	7.463
191.590	26.119
201.635	29.851
202.280	48.507
206.330	26.119
210.350	26.119
210.360	18.657
215.680	48.507
215.710	26.119
219.720	33.582
220.376	44.776
227.076	44.776
229.646	126.866
233.756	59.701
234.396	82.090
236.411	78.358
236.431	63.433
237.736	89.552
238.446	59.701
240.431	78.358
241.136	52.239
241.146	44.776
244.456	74.627
245.836	44.776
249.141	78.358
250.386	149.254
250.466	89.552
251.121	100.746
251.871	41.045
253.136	97.015
253.181	63.433
254.591	11.194
255.181	70.896
255.796	111.940
257.111	130.597
259.846	89.552
260.567	52.239
261.827	111.940
264.527	97.015
265.077	186.567
265.157	126.866
265.262	48.507
265.972	18.657
267.197	104.478
267.207	97.015
268.542	100.746
268.732	458.955
269.167	134.328
270.537	111.940
271.277	59.701
272.342	264.925
272.512	138.060
272.547	111.940
273.797	179.104
275.862	138.060
276.262	339.552
277.062	242.537
277.877	134.328
278.587	104.478
279.102	220.149
283.267	111.940
283.412	503.731
283.807	208.955
283.832	190.299
283.892	145.522
287.912	145.522
289.687	320.896
289.712	302.239
291.967	119.403
293.422	533.582
294.842	473.881
295.902	182.836
295.927	164.179
296.392	317.164
298.012	108.209
298.667	119.403
298.767	544.776
298.957	402.985
300.383	839.552
302.468	783.582
302.908	455.224
303.313	652.985
304.143	533.582
306.673	645.522
306.893	481.343
307.318	164.179
310.193	518.657
310.268	962.687
311.013	406.716
311.623	451.493
312.893	1003.731
314.053	138.060
314.533	779.851
314.603	727.612
317.293	720.149
318.593	750.000
319.823	332.090
320.938	500.000
321.278	746.269
322.193	563.433
322.448	373.134
323.453	623.134
325.238	291.045
329.943	779.851
330.298	514.925
331.178	858.209
332.188	604.478
337.353	750.000
341.439	701.493
341.714	496.269
342.889	619.403
343.769	462.687
344.834	667.910
344.864	1145.522
346.224	630.597
347.484	690.299
348.984	570.896
349.494	690.299
353.514	690.299
354.819	716.418
356.739	783.582
363.654	1123.134
365.524	727.612
366.484	1011.194
376.404	608.209
400.345	1242.537];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(13);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ArkhSilv1997';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
144.000	16.142
186.000	20.235
187.333	42.469
192.000	27.698
196.000	49.957
197.333	27.747
202.667	35.204
207.333	53.766
210.000	57.494
216.667	46.445
218.667	31.648
221.333	42.784
224.667	28.000
225.333	50.228
230.000	50.272
231.333	68.803
231.333	53.988
237.333	68.858
240.000	57.772
241.333	105.932
242.667	46.685
243.333	120.766
245.333	72.636
247.333	131.914
247.333	109.691
248.000	109.698
251.333	28.247
252.000	76.401
252.667	39.370
253.333	157.895
253.333	235.673
254.667	106.056
256.000	113.475
256.000	76.438
260.000	102.401
260.000	72.772
262.667	157.982
262.667	117.241
262.667	135.759
264.000	128.364
264.000	120.957
271.333	154.358
271.333	135.840
272.000	124.735
272.000	72.883
272.667	180.296
275.333	124.766
276.667	147.000
278.000	198.864
284.000	191.512
284.667	69.296
286.000	306.346
290.000	343.420
290.667	432.315
290.667	76.759
293.333	369.377
294.667	421.241
298.667	224.982
299.333	54.617
299.333	80.543
300.667	317.593
302.000	539.827
302.000	517.605
302.000	350.938
302.667	447.241
304.000	495.401
304.000	476.883
304.667	110.222
306.667	362.093
306.667	202.833
308.000	380.624
310.000	325.086
310.667	343.611
311.333	447.321
311.333	476.951
312.000	517.698
312.000	247.327
315.333	436.247
315.333	506.617
315.333	325.136
320.000	380.735
320.000	228.883
320.667	595.556
320.667	514.074
320.667	410.370
320.667	262.222
320.667	110.370
322.667	558.537
324.000	484.475
326.000	580.790
326.667	388.204
328.667	291.926
330.667	477.130
331.333	440.099
331.333	403.062
332.000	551.216
332.667	462.333
332.667	499.370
335.333	562.358
336.000	499.401
338.000	466.086
341.333	406.858
343.333	480.951
344.000	732.809
346.667	499.500
348.000	629.142
348.667	592.111
354.667	455.130];
n=size(data.tWw_m,1); for i=2:n; if data.tWw_m(i,1)<=data.tWw_m(i-1,1); data.tWw_m(i,1)=data.tWw_m(i-1,1)+1e-3; end; end
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(13);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ArkhSilv1997';
comment.tWw_m = 'Data for males';

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
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3Y9ZQ'; % Cat of Life
metaData.links.id_ITIS = '556427'; % ITIS
metaData.links.id_EoL = '3020601'; % Ency of Life
metaData.links.id_Wiki = 'Martialia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '158109'; % Taxonomicon
metaData.links.id_WoRMS = '325305'; % WoRMS
metaData.links.id_molluscabase = '325305'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Martialia_hyadesii}}';
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
bibkey = 'ArkhSilv1997'; type = 'article'; bib = [ ... 
'author = {Alexander I. Arkhipkin and Natalia V. Silvanovich}, ' ... 
'year = {1997}, ' ...
'title = {Age, growth and maturation of the squid \emph{Martialia hyadesi} ({C}ephalopoda, {O}mmastrephidae) in the south-west {A}tlantic}, ' ...
'journal = {Antarctic Science}, ' ...
'volume = {9(4)}, ' ...
'pages = {373-380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Martialia-hyadesi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

