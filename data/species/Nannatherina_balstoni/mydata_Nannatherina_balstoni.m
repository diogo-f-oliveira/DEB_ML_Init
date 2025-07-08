  function [data, auxData, metaData, txtData, weights] = mydata_Nannatherina_balstoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Nannatherina_balstoni'; 
metaData.species_en = 'Balston''s pygmy perch'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biFr','biFm'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 16];

%% set data
% zero-variate data
data.ab = 10; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.7;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 9;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MorgGill1995';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*0.075^3';
data.Wwp = 0.86;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 5.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';
 
data.Ri = 1600/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate ';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since hatch (d), total length (cm), weight (g)
42.019	1.350
43.445	1.277
43.504	0.985
65.909	1.881
67.287	2.045
67.343	1.771
67.409	1.442
70.287	1.168
71.607	1.625
77.095	2.411
77.220	1.790
77.227	1.753
77.323	1.278
78.525	2.320
78.547	2.210
78.613	1.881
78.790	1.004
78.820	0.858
79.900	2.503
79.970	2.156
80.191	1.059
80.275	0.639
81.540	1.370
81.547	1.333
82.807	2.083
83.110	0.584
84.245	1.955
84.521	0.584
89.972	1.553
92.770	1.681
98.331	2.101
101.121	2.266
101.202	1.864
102.393	2.961
102.725	1.316
104.059	1.700
105.290	2.595
105.489	1.608
136.054	4.040
137.498	3.876
137.804	2.359
137.848	2.139
138.851	4.168
139.124	2.816
139.242	2.231
140.635	2.322
140.712	1.938
141.785	3.620
142.021	2.450
142.946	4.863
143.322	2.999
143.347	2.871
144.578	3.766
144.645	3.437
144.859	2.377
145.968	3.876
146.108	3.181
146.403	1.719
147.427	3.638
147.509	3.236
148.964	3.017
150.416	2.816
153.155	3.237
164.540	2.780
168.399	4.644
169.994	3.731
171.174	4.882
171.189	4.809
171.200	4.754
171.358	3.968
171.528	3.128
171.609	2.725
172.737	4.133
172.936	3.146
174.108	4.334
174.192	3.914
174.211	3.822
174.251	3.621
174.325	3.256
175.501	4.425
175.538	4.243
175.567	4.096
175.715	3.365
176.887	4.553
193.958	3.896
193.984	3.768
193.999	3.695
194.025	3.567
194.043	3.476
194.098	3.201
195.138	5.047
195.481	3.348
195.591	2.799
196.505	5.267
196.638	4.609
196.664	4.481
196.675	4.426
196.697	4.316
196.730	4.152
196.759	4.006
196.977	2.927
197.891	5.395
198.024	4.737
223.768	3.075
224.634	5.780
224.671	5.597
224.719	5.359
224.796	4.975
224.803	4.939
224.895	4.482
226.101	5.505
226.222	4.902
226.263	4.701
226.289	4.573
226.322	4.409
226.344	4.299
226.396	4.043
226.458	3.733
227.767	4.244
227.851	3.824
227.932	3.422
228.968	5.286
229.001	5.122
229.193	4.171
229.244	3.915
253.149	4.373
254.421	5.068
255.943	4.520
255.995	4.264
256.057	3.953
257.152	5.525
257.178	5.397
257.288	4.849
257.561	3.496
258.608	5.306
258.718	4.757
264.365	4.757
264.553	3.825
265.669	5.288
265.695	5.160
266.834	6.512
266.849	6.439
266.864	6.366
266.937	6.000
266.993	5.726
267.022	5.580
267.041	5.489
267.136	5.013
267.155	4.922
267.254	4.429
268.327	6.110
268.360	5.946
268.426	5.617
268.684	4.337
268.699	4.264
268.717	4.173
285.365	5.617
287.399	4.531
288.218	5.471
289.447	4.375
289.755	4.850
292.490	5.289
293.702	6.275
293.717	6.202
295.173	5.983
295.413	4.793
296.640	5.709
296.662	5.599
296.688	5.471
296.754	5.142
296.772	5.051
297.461	4.636
297.498	4.453
297.540	4.244
298.033	5.800
298.158	5.179
299.544	5.307
299.618	4.942
309.200	6.422
309.344	5.709
309.421	5.326
309.451	5.179
310.630	6.331
310.656	6.203
310.708	5.947
310.789	5.545
310.922	4.887
313.516	6.020
319.512	5.289
319.533	5.185
319.554	5.081
319.717	4.271
321.633	4.767
321.649	4.689
321.776	4.062
321.849	3.697
323.287	6.569
323.318	6.412
323.339	6.308
323.350	6.256
323.782	4.115
325.272	6.726
337.492	6.126
339.477	6.282
339.661	5.369
341.346	7.013
341.404	6.726
341.425	6.622
341.546	6.021
341.599	5.760
341.657	5.473
343.800	4.846
343.921	4.246
345.353	7.144
345.490	6.465
345.564	6.100
347.343	7.275
347.459	6.700
347.549	6.257
347.638	5.813
347.680	5.604
347.701	5.499
349.428	6.935
349.865	4.768
375.644	6.936
377.734	6.571
377.802	6.232
377.834	6.075
377.929	5.605
377.939	5.553
379.924	5.709
408.130	5.841
410.015	6.494
411.989	6.703
416.238	5.632
436.267	6.312
438.531	5.085
440.042	7.591
440.431	5.659
444.101	7.461
460.539	5.947
468.495	6.496
502.708	6.836
502.850	6.132
502.882	5.975
508.963	5.818
531.145	5.819
533.109	6.080
535.231	5.558
629.814	6.528
647.637	8.147
685.931	8.253
714.057	8.776
722.108	8.855
752.524	8.020
774.496	9.066
829.127	8.154
831.123	8.258];
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MorgGill1995';
%
data.tL_m = [ ... % time since hatch (d), total length (cm), weight (g)
41.147	1.194
42.560	1.267
46.931	1.029
65.324	1.905
65.581	1.010
68.266	1.649
68.307	1.503
68.370	1.284
69.789	1.338
72.537	1.759
73.798	2.362
74.076	1.393
75.636	0.954
75.725	0.643
75.751	0.552
76.976	1.283
78.153	2.179
79.666	1.904
79.718	1.722
79.980	0.807
81.074	1.996
82.786	1.027
84.346	0.588
94.081	1.647
95.552	1.519
99.572	2.506
99.656	2.214
101.231	1.720
101.305	1.464
101.357	1.281
105.435	2.067
134.182	1.845
135.076	3.728
135.558	2.046
136.211	4.770
136.243	4.661
136.463	3.893
136.814	2.668
136.935	2.247
137.866	4.002
137.965	3.655
138.012	3.491
138.327	2.394
138.390	2.174
139.573	3.052
139.609	2.924
139.641	2.814
139.777	2.339
140.834	3.655
141.101	2.722
143.922	2.887
144.279	1.644
145.330	2.978
145.399	2.740
146.555	3.709
146.618	3.490
148.099	3.325
148.167	3.088
165.247	3.543
165.514	2.611
166.461	4.311
166.545	4.019
166.922	2.702
167.780	4.713
167.921	4.220
168.016	3.890
168.084	3.653
169.256	4.567
169.313	4.366
169.397	4.073
169.487	3.762
171.057	3.287
171.089	3.177
171.110	3.104
171.130	3.031
188.215	3.468
188.420	2.755
189.172	5.132
189.524	3.907
190.989	3.797
191.005	3.742
191.194	3.084
192.093	4.949
192.287	4.273
192.303	4.218
192.366	3.998
192.471	3.633
192.539	3.395
192.549	3.358
192.738	2.700
193.648	4.528
193.999	3.303
194.998	4.821
195.140	4.327
195.350	3.596
195.470	3.175
196.291	5.314
196.883	3.248
222.128	5.239
222.238	4.855
222.317	4.581
222.327	4.545
222.353	4.453
222.374	4.380
222.416	4.234
222.804	2.881
223.310	6.117
223.646	4.947
223.725	4.672
223.871	4.160
223.908	4.033
223.960	3.850
224.013	3.667
224.039	3.575
225.138	4.745
225.243	4.380
226.378	5.422
226.457	5.147
226.997	3.264
229.299	5.239
250.864	5.054
252.330	4.944
252.346	4.890
252.556	4.158
252.765	3.427
253.848	4.652
253.916	4.414
255.068	5.401
255.324	4.505
255.330	4.487
255.492	3.920
256.806	4.341
256.827	4.268
257.010	3.628
262.328	5.090
262.364	4.962
262.401	4.834
262.496	4.505
263.657	5.455
263.710	5.273
263.883	4.669
265.039	5.638
265.128	5.327
265.448	4.212
266.914	4.102
268.400	3.919
269.939	3.554
284.045	4.375
284.103	4.174
285.233	5.234
286.725	5.033
289.494	5.380
289.777	4.393
291.049	4.960
291.091	4.814
291.353	3.899
292.593	4.576
292.703	4.192
293.702	5.709
293.970	4.777
293.980	4.740
294.054	4.484
295.220	5.417
295.325	5.051
295.608	4.064
296.696	5.270
296.870	4.667
303.820	5.434
305.171	5.727
305.449	4.758
306.773	5.141
307.971	5.964
308.170	5.269
311.143	4.903
316.456	6.384
317.843	6.548
317.989	6.036
318.142	5.506
318.163	5.433
318.252	5.122
318.357	4.757
319.366	6.237
319.843	4.574
319.969	4.135
320.016	3.970
320.921	5.817
320.984	5.597
321.482	3.861
321.993	7.078
322.796	4.281
334.091	4.902
335.436	5.212
336.419	6.785
336.755	5.615
336.807	5.432
338.126	5.834
340.774	6.601
341.010	5.779
342.707	4.865
342.833	4.426
343.721	6.327
343.915	5.651
344.062	5.139
344.094	5.029
344.230	4.554
345.035	6.747
345.224	6.089
345.240	6.034
345.276	5.906
345.308	5.797
345.376	5.559
345.612	4.736
345.753	4.243
346.637	6.162
348.045	6.254
348.297	5.376
348.669	4.078
372.705	5.283
372.804	4.935
373.945	5.959
373.966	5.886
373.982	5.831
373.992	5.795
374.029	5.667
374.186	5.118
378.153	6.288
378.410	5.392
378.594	4.752
387.319	4.331
404.069	5.939
405.246	6.834
427.257	5.096
437.166	5.552
440.286	4.674
441.201	6.484
441.217	6.429
441.295	6.155
441.552	5.259
442.525	6.868
442.682	6.320
442.719	6.192
444.227	5.936
447.168	5.679
451.282	6.337
452.832	5.935
455.800	5.587
461.720	4.947
467.085	6.245
467.274	5.586
469.995	6.098
500.324	5.365
503.140	5.547
505.840	6.132
532.028	4.832
646.205	6.780
750.598	7.832];
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MorgGill1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.ab = weights.ab * 0;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'southwest Australia: from Two People Bay (near Albany) to Blackwood River; western Australia: from Goodga River to Gin Gin Brook';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '45M6W'; % Cat of Life
metaData.links.id_ITIS = '641899'; % ITIS
metaData.links.id_EoL = '218807'; % Ency of Life
metaData.links.id_Wiki = 'Nannatherina_balstoni'; % Wikipedia
metaData.links.id_ADW = 'Nannatherina_balstoni'; % ADW
metaData.links.id_Taxo = '180705'; % Taxonomicon
metaData.links.id_WoRMS = '991283'; % WoRMS
metaData.links.id_fishbase = 'Nannatherina-balstoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Nannatherina_balstoni}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...1020471
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MorgGill1995'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1995.tb06004.x}, ' ...
'author = {Morgan, D.L. and H.S. Gill and I.C. Potter}, ' ... 
'year   = {1995}, ' ...
'title  = {Life cycle, growth and diet of Balston''s pygmy perch in its natural habitat of acidic pools in south-western {A}ustralia}, ' ...
'journal = {J. Fish Biol.}, ' ...
'page = {808-825}, ' ...
'volume = {47(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Nannatherina-balstoni.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

