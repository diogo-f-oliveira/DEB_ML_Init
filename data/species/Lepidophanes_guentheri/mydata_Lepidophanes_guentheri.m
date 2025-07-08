function [data, auxData, metaData, txtData, weights] = mydata_Lepidophanes_guentheri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Lepidophanes_guentheri'; 
metaData.species_en = 'Guenther''s lanternfish'; 
metaData.ecoCode.climate = {'MA', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(15); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 22]; 

%% set data
% zero-variate data
data.tj = 27; units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'Gart1991';  
  temp.tj = C2K(15); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Gart1991';  
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.3;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'Gart1993';
data.Li = 7.0;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'Gart1991';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Gart1993';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 0.28; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = '';  
  comment.Wwp = 'based on 0.00537*Lp^3.08, see F4';
data.Wwi = 2.15;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = '';     
  comment.Wwi = 'based on 0.00537*Li^3.08, see F4';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (d) standard length (cm) 
40.406	1.602
46.424	1.425
46.424	1.425
46.893	1.492
51.542	1.625
51.996	1.492
52.924	1.492
52.948	1.802
54.323	1.592
55.707	1.493
56.188	1.703
56.660	1.814
57.602	2.002
58.034	1.581
59.444	1.814
60.834	1.803
61.785	2.102
62.713	2.102
63.619	1.814
65.017	1.892
65.474	1.803
66.417	2.003
67.330	1.815
67.346	2.014
69.186	1.815
69.186	1.815
70.145	2.214
71.057	2.014
72.442	1.926
72.918	2.081
73.359	1.793
75.215	1.793
76.158	1.993
76.175	2.214
76.616	1.915
77.111	2.314
77.120	2.436
78.488	2.126
81.262	2.004
81.272	2.126
82.664	2.126
84.068	2.292
84.108	2.802
84.983	2.126
87.294	2.016
87.820	2.813
88.268	2.614
89.645	2.426
90.547	2.083
90.589	2.625
92.889	2.371
92.907	2.603
94.258	2.083
94.274	2.282
95.236	2.725
96.615	2.570
97.051	2.205
97.098	2.814
98.457	2.393
98.955	2.825
99.863	2.571
101.274	2.825
102.202	2.826
103.586	2.726
104.488	2.394
106.370	2.726
107.774	2.893
110.063	2.494
110.603	3.480
112.855	2.605
112.885	2.993
113.341	2.893
113.789	2.683
113.839	3.325
114.767	3.325
117.062	3.015
117.074	3.170
117.077	3.203
117.526	3.015
117.550	3.325
118.439	2.827
118.462	3.115
120.310	3.016
121.237	3.016
123.543	2.828
124.044	3.315
124.524	3.525
124.950	3.027
124.986	3.503
126.378	3.503
126.834	3.393
127.268	3.016
127.285	3.227
128.233	3.492
129.140	3.227
129.625	3.492
130.089	3.493
130.996	3.227
131.924	3.227
132.357	2.829
133.336	3.493
135.665	3.615
137.057	3.615
137.970	3.427
137.976	3.504
138.457	3.726
140.760	3.505
141.210	3.328
141.241	3.726
141.709	3.781
143.548	3.571
143.567	3.815
144.956	3.782
145.420	3.782
146.825	3.948
146.828	3.992
146.852	4.302
147.218	3.029
147.240	3.317
147.286	3.904
149.104	3.428
149.132	3.782
149.591	3.727
152.390	3.915
154.214	3.517
155.662	4.237
156.556	3.805
156.564	3.905
158.380	3.396
158.882	3.883
158.894	4.038
160.255	3.639
160.286	4.038
160.295	4.160
160.732	3.817
162.583	3.750
163.966	3.640
163.997	4.038
164.475	4.215
164.497	4.503
164.924	4.027
167.654	3.330
168.650	4.216
169.555	3.917
169.578	4.216
173.273	4.006
173.289	4.216
178.377	4.018
179.767	3.996
180.224	3.907
180.715	4.261
180.729	4.438
182.567	4.217
184.454	4.616
188.120	4.030
189.520	4.140
189.580	4.915
190.000	4.340
190.941	4.517
191.351	3.820
193.254	4.429
193.692	4.097
194.637	4.318
196.045	4.529
197.351	3.422
200.668	4.319
201.147	4.507
201.179	4.928
202.578	5.016
204.388	4.430
207.172	4.441
207.644	4.541
210.440	4.707
212.770	4.840
213.642	4.121
214.142	4.575
214.176	5.017
215.542	4.685
216.441	4.309
216.912	4.409
216.975	5.217
217.415	4.918
217.889	5.040
220.160	4.409
224.391	5.129
224.831	4.819
225.288	4.731
227.598	4.609
228.503	4.310
229.014	4.930
229.028	5.107
229.987	5.506
230.391	4.731
232.762	5.396
233.642	4.776
234.076	4.399
235.056	5.064
235.501	4.820
238.292	4.920
242.427	4.400
242.522	5.629
243.881	5.209
244.771	4.710
247.603	5.342
248.042	5.021
248.514	5.131
248.520	5.198
249.450	5.231
249.921	5.320
252.681	5.021
255.489	5.331
257.778	4.944
258.695	4.800
259.216	5.542
260.120	5.232
263.784	4.624
264.744	5.033
266.183	5.642
268.039	5.643
269.894	5.643
270.334	5.333
271.764	5.831
273.604	5.621
274.046	5.333
275.437	5.333
277.286	5.245
278.260	5.843
281.490	5.611
282.443	5.943
283.339	5.533
284.291	5.843
285.668	5.644
285.697	6.021
286.578	5.423
287.033	5.301
288.403	5.025
289.848	5.711
291.710	5.789
292.152	5.512
299.576	5.524
300.976	5.635
303.284	5.480
304.200	5.325
312.149	6.134
315.395	6.123
318.637	6.046
321.891	6.135
323.267	5.925
323.273	6.013
323.716	5.737
326.445	5.040
328.369	5.914
331.136	5.704
334.873	6.037
336.226	5.539
336.249	5.826
341.870	6.524
344.158	6.126
344.638	6.325
346.897	5.540
347.366	5.617
349.709	5.916
349.717	6.016
351.127	6.260
354.775	5.441
355.292	6.127
356.670	5.939
362.197	5.430
371.515	5.941
373.811	5.631
377.562	6.140
381.754	6.362
387.256	5.522
388.705	6.263
390.561	6.264
392.862	6.031
401.684	6.121
410.058	6.431
429.520	6.135
438.326	6.025];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(8.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gart1991';

% length-fecundity
data.LN = [ ... % standard length (cm), number of oocytes (#)
3.674	508.083
3.805	560.046
3.916	900.693
4.110	808.314
4.204	577.367
4.310	831.409
4.610	1045.035
4.705	1224.019
4.805	1281.755
5.104	1356.813
5.195	1905.312
5.209	1264.434
5.610	1882.217
5.699	1934.180
5.904	2015.011
6.210	2297.921];
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(15);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Gart1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.LN = 5 * weights.LN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 18 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Nyctoepipelagic';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g =  0.00537*(SL in cm)^3.08';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '3TCFW'; % Cat of Life
metaData.links.id_ITIS = '162748'; % ITIS
metaData.links.id_EoL = '46564188'; % Ency of Life
metaData.links.id_Wiki = 'Lepidophanes_guentheri'; % Wikipedia
metaData.links.id_ADW = 'Lepidophanes_guentheri'; % ADW
metaData.links.id_Taxo = '178393'; % Taxonomicon
metaData.links.id_WoRMS = '126621'; % WoRMS
metaData.links.id_fishbase = 'Lepidophanes-guentheri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidophanes}}';
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
bibkey = 'Gart1991'; type = 'article'; bib = [ ...
'author = {J.V. Gartner}, ' ... 
'year   = {1991}, ' ...
'title  = {Life histories of three species of lanternfishes ({P}isces: {M}yctophidae) from the eastern {G}ulf of {M}exico {I}{I}. {A}ge and growth patterns}, ' ...
'journal = {Marine Biology}, ' ...
'page = {21-27}, ' ...
'volume = {111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gart1993'; type = 'article'; bib = [ ...
'author = {J.V. Gartner}, ' ... 
'year   = {1993}, ' ...
'title  = {PATTERNS OF REPRODUCTION IN THE DOMINANT LANTERNFISH SPECIES ({P}ISCES: {M}YCTOPHIDAE) OF THE {E}ASTERN {G}ULF OF {M}EXICO, WITH A REVIEW OF REPRODUCTION AMONG TROPICAL-SUBTROPICAL {M}YCTOPHIDAE}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'page = {721-750}, ' ...
'volume = {52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lepidophanes-guentheri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

