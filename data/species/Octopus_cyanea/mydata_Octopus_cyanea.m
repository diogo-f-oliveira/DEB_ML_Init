function [data, auxData, metaData, txtData, weights] = mydata_Octopus_cyanea

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_cyanea'; 
metaData.species_en = 'Big blue octopus';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPSW'};
metaData.ecoCode.habitat = {'0jMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab_T'; 'as'; 'ap'; 'am'; 'Lb'; 'Wwb'; 'Wws'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab_25 = 25;   units.ab_25 = 'd'; label.ab_25 = 'age at birth';         bibkey.ab_25 = 'Heuk1976';   
  temp.ab_25 = C2K(25);  units.temp.ab_25 = 'K'; label.temp.ab_25 = 'temperature';
data.ab_13 = 125;  units.ab_13 = 'd'; label.ab_13 = 'age at birth';          bibkey.ab_13 = 'Heuk1976';   
  temp.ab_13 = C2K(13);  units.temp.ab_13 = 'K'; label.temp.ab_13 = 'temperature';
data.ts = 32.5;    units.ts = 'd';    label.ts = 'time since birth at settlement'; bibkey.ts = 'Heuk1976';   
  temp.ts = C2K(24);  units.temp.ts = 'K'; label.temp.ts = 'temperature';
  comment.ts = 'for O. vulgaris';
data.tp = 210;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'HerwDepz2012';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10.5*30.5;  units.am = 'd'; label.am = 'life span';                bibkey.am = 'Heuk1976';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.3;    units.Lb  = 'cm';  label.Lb  = 'mantle length at birth';  bibkey.Lb  = 'Heuk1976';

data.Wwb = 5.5e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'calculated from O. maya: Wb * (3/17)^3';
data.Wws = 0.3;    units.Wws = 'g';   label.Wws = 'wet weight at settlement'; bibkey.Wws = 'Heuk1976';
data.Wwp = 1000;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Heuk1976';
data.Wwi = 3600;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Heuk1976';

data.Ni  = 7e5;    units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'Heuk1976';   
  temp.Ni = C2K(24);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'at Monterey Bay';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
100.390	52.071
112.068	102.282
116.467	102.980
127.374	189.338
131.709	250.474
133.238	190.267
138.294	263.608
138.331	227.344
145.573	313.121
146.951	397.968
152.815	398.898
152.866	350.547
156.379	496.182
156.493	387.391
160.689	581.494
161.397	605.786
161.485	521.171
162.888	581.842
164.266	666.689
166.528	606.599
168.007	594.744
168.601	727.825
168.639	691.563
168.816	522.333
172.152	837.197
172.506	498.739
172.961	764.787
173.795	668.200
174.427	765.019
174.478	716.668
175.703	946.569
175.766	886.130
177.296	825.923
182.983	996.082
183.021	959.819
183.097	887.292
183.122	863.116
183.173	814.765
187.065	1298.975
188.038	1069.422
188.342	779.315
188.380	743.052
188.949	900.309
189.454	1118.006
189.568	1009.216
191.666	1106.267
192.891	1336.168
193.005	1227.377
193.941	1034.089
197.454	1179.724
197.505	1131.373
197.947	1409.508
197.985	1373.245
198.048	1312.805
199.022	1083.254
203.027	1458.673
203.381	1821.423
203.419	1785.160
203.495	1712.633
203.572	938.898
204.810	1156.710
205.454	1241.441
205.480	1217.266
207.350	1531.897
208.146	1471.575
212.152	1846.994
212.190	1810.731
212.834	1895.462
213.100	1641.618
213.151	1593.266
213.239	1508.651
213.290	1460.301
218.092	1775.397
218.256	2319.464
218.306	2271.113
218.332	2246.937
218.346	1533.641
218.396	1485.289
218.521	2065.621
219.446	1183.211
222.313	1945.323
222.603	2368.512
223.376	1631.157
226.799	2562.615
227.002	2369.210
227.760	2345.151
227.899	2212.185
228.089	2030.868
228.165	1958.341
228.203	1922.077
228.317	1813.288
232.638	2587.720
232.915	3022.997
232.941	2998.822
233.296	1959.155
233.448	1814.101
233.574	2394.432
236.317	1875.005
236.847	2769.735
236.897	2721.383
241.813	2927.690
242.331	3133.298
242.484	2287.036
242.749	2734.401
242.901	2589.347
243.015	2480.557
243.103	2395.943
243.154	2347.591
247.285	3303.341
248.082	3243.019
248.322	3013.350
248.867	2493.575
249.056	2312.258
249.107	2263.907
252.100	3606.350
252.379	3340.419
257.499	2652.111
257.611	3244.530
257.661	3897.387
257.662	3196.179
261.123	4091.373
261.490	3740.827
262.755	3233.255
263.338	2677.216
263.753	3680.736
266.495	3862.519
267.379	4418.790
270.867	4588.601
273.637	3343.789
277.604	4456.681
278.339	3054.379
281.052	5363.964
282.281	4191.446
287.081	5207.752
287.627	3986.767
295.258	5801.449
296.688	4435.527
302.981	5427.889
308.350	6601.452];
units.tW  = {'d', 'g'};  label.tW = {'time since settlement', 'wet weight'};  
temp.tW   = C2K(25.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Heuk1976';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 20 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = weights.psd.p_M * 5; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'z is not well-fixed by data, size ultimate size is much larger than size at death';
D2 = 'in view of fitting results, puberty does not coincide with mating and part of structure converts to eggs just before death';
D3 = 'model abj has been used, meaning that settlement has no effect on acceleration';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'semelparous: death at first spawning, 10 d after last hatch';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Digestion efficiency independent of feeding rate';
metaData.bibkey.F2 = 'Heuk1976'; 
F3 = 'small eggs with a planktontic larval stage, difficult to culture';
metaData.bibkey.F3 = 'Heuk1976'; 
F4 = 'hatches using a hatching gland (Hoyles organ)';
metaData.bibkey.F4 = 'Heuk1976'; 
F5 = 'males and females grow at the same rate';
metaData.bibkey.F5 = 'Heuk1976'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '48KKV'; % Cat of Life
metaData.links.id_ITIS = '556153'; % ITIS
metaData.links.id_EoL = '593207'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_cyanea'; % Wikipedia
metaData.links.id_ADW = 'Octopus_cyanea'; % ADW
metaData.links.id_Taxo = '158218'; % Taxonomicon
metaData.links.id_WoRMS = '210788'; % WoRMS
metaData.links.id_molluscabase = '210788'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Octopus_cyanea}}';
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
bibkey = 'Heuk1976'; type = 'Phdthesis'; bib = [ ... 
'author = {Heukelem, W. F. van.}, ' ... 
'year = {1976}, ' ...
'title = {Growth, bioenergetics and life span of \emph{Octopus cyanea} and \emph{Octopus maya}}, ' ...
'howpublished = {\url{http://scholarspace.manoa.hawaii.edu/handle/10125/18157}}, ' ...
'school = {Univ Hawaii}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HerwDepz2012'; type = 'Article'; bib = [ ... 
'author = {Herwig, J. N. and Depczynski, M. and Roberts, J. D. and Semmens, J. M. and Gagliano, M. and Heyward, A. J.}, ' ... 
'year = {2012}, ' ...
'title = {Using Age-Based Life History Data to Investigate the Life Cycle and Vulnerability of \emph{Octopus cyanea}}, ' ...
'howpublished = {\url{http://www.plosone.org/article/info%%3Adoi%%2F10.1371%%2Fjournal.pone.0043679}}, ' ...
'journal = {Plos One}, ' ...
'volume = {7}, ' ...
'number = {8}, '...
'pages = {e43679}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

