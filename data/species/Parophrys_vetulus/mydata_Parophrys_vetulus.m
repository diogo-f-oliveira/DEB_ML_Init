function [data, auxData, metaData, txtData, weights] = mydata_Parophrys_vetulus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Parophrys_vetulus'; 
metaData.species_en = 'English sole'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 10];

%% set data
% zero-variate data

data.ab = 324.5/24;    units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(5.6); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Eopsetta jordani';
data.am = 22*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(5.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 31;  units.Lp  = 'cm';  label.Lp  = 'length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 57;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 49;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'fishbase';

data.Wwb = 1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 1.24 mm of Eopsetta jordani: pi/6*0.124^3';
data.Wwp = 190;  units.Wwp = 'g';   label.Wwp = 'wet weight puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00575*Lp^3.03, see F1';
data.Wwi = 1.2e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.03, see F1';
data.Wwim = 760;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00575*Lim^3.03, see F1';
  
data.Ri  = 500e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(5.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
59.599	1.938
71.567	1.957
75.752	1.994
75.781	1.768
87.724	1.975
88.287	2.258
95.510	1.937
100.812	2.596
102.677	2.050
104.490	1.918
105.047	2.238
115.285	1.748
116.279	3.331
116.964	2.652
117.650	1.974
118.217	2.219
124.800	2.219
127.824	1.973
128.859	3.236
130.201	2.105
131.958	2.407
136.167	2.256
138.542	2.406
139.128	2.501
139.642	3.160
139.761	2.237
139.777	2.105
142.673	2.858
143.892	2.689
144.500	2.613
152.746	3.649
153.393	3.273
156.473	2.594
158.196	3.159
160.612	2.990
161.307	2.236
162.477	2.443
166.498	3.762
167.207	2.895
168.327	3.498
170.178	3.065
172.003	2.838
172.056	2.424
172.538	3.328
179.100	3.498
179.723	3.309
180.474	2.122
186.186	4.251
187.404	4.081
190.590	2.574
193.018	2.310
198.723	4.496
199.481	3.252
201.894	3.101
204.172	4.005
204.233	3.534
207.281	3.101
207.838	3.421
209.556	4.024
209.580	3.836
213.292	2.893
213.712	4.288
213.768	3.854
215.001	3.572
218.556	3.854
226.278	4.306
226.307	4.080
227.533	3.854
227.560	3.647
229.280	4.231
230.419	4.683
231.182	3.401
234.030	4.532
235.295	4.004
236.591	3.232
243.946	6.548
253.068	5.417
255.014	4.248
258.390	5.925
258.412	5.756
260.340	4.719
260.716	6.453
261.028	4.022
261.605	4.192
264.510	4.870
265.036	5.435
266.880	5.058
268.692	4.926
269.028	6.980
270.447	5.246
271.101	4.813
272.175	5.774
274.229	3.758
275.240	5.209
276.538	4.417
279.383	5.566
282.395	5.416
285.795	6.904
287.874	4.699
290.685	6.112
291.691	7.601
292.642	4.850
294.737	7.186
294.862	6.206
298.640	4.755
299.045	6.263
300.222	6.414
301.284	7.469
305.549	6.884
308.201	4.868
310.479	5.772
312.060	7.449
312.955	9.805
313.843	7.544
317.369	8.052
317.463	7.317
318.670	7.242
322.268	7.185
322.797	7.732
324.759	6.431
325.820	7.487
325.883	6.997
327.553	7.976
331.050	8.711
334.629	8.805
337.400	5.866
337.962	6.148
339.564	7.656
341.787	8.993
342.402	8.861
342.470	8.334
344.551	6.110
345.906	9.540
349.635	8.465
349.773	7.391
353.948	7.504
354.898	9.426
361.446	9.709
364.523	9.049
365.153	8.804
367.265	6.336
369.362	8.653
369.670	10.914
369.750	10.292
370.423	9.708
370.450	9.501
371.102	9.086
371.661	9.388
371.942	7.202
372.602	11.385
376.840	11.008
377.656	9.312
378.006	11.253
385.471	9.048
393.215	9.330
398.085	8.690
401.299	11.629
401.497	10.084
412.476	8.482
413.460	10.140
422.588	8.971
423.560	10.724
425.650	8.425
425.694	8.086
428.937	10.799
435.887	12.607
436.998	8.613
450.102	9.102
451.953	8.669
463.655	10.760
463.822	9.460
464.731	11.702];
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length', 'female'};  
temp.tL = C2K(5.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Rose1982';

%% set weights for all real data
weights = setweights(data, []);
% weights.tL = 5 * weights.tL;
% weights.Wwb = 10 * weights.Wwb;
% weights.Wwi = 3 * weights.Wwi;
% weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight Ww in g = 0.00575*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4DRYX'; % Cat of Life
metaData.links.id_ITIS = '172921'; % ITIS
metaData.links.id_EoL = '46570134'; % Ency of Life
metaData.links.id_Wiki = 'Parophrys_vetulus'; % Wikipedia
metaData.links.id_ADW = 'Parophrys_vetulus'; % ADW
metaData.links.id_Taxo = '183251'; % Taxonomicon
metaData.links.id_WoRMS = '254393'; % WoRMS
metaData.links.id_fishbase = 'Parophrys-vetulus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parophrys_vetulus}}';
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
bibkey = 'Rose1982'; type = 'Article'; bib = [ ... 
'author = {Andrew A. Rosenberg}, ' ... 
'year = {1982}, ' ...
'title = {GROWTH OF JUVENILE {E}NGLISH SOLE, \emph{Parophrys vetulus}, IN ESTUARINE AND OPEN COASTAL NURSERY GROUNDS}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {80(2)}, ' ...
'pages = {245-252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Parophrys-vetulus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

