function [data, auxData, metaData, txtData, weights] = mydata_Uroteuthis_noctiluca
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Uroteuthis_noctiluca'; 
metaData.species_en = 'Luminous bay squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 250;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'DimmHoed1998';   
  temp.am = C2K(25);     units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 0.28;    units.Lb = 'cm';   label.Lb = 'mantle length at birth';   bibkey.Lb = 'guess';
  comment.Lb = 'based on Uroteuthis_edulis';
data.Lp = 2.6;    units.Lp = 'cm';   label.Lp = 'mantle length at puberty';   bibkey.Lp = 'DimmHoed1998';
data.Li = 9;    units.Li = 'cm';   label.Li = 'mantle length at death';   bibkey.Li = 'Wiki';

data.Wwi = 15.26;   units.Wwi = 'g';   label.Wwi = 'wet weight at death d'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Uroteuthis_edulis: 443*(9/27.66)^3';

data.Ni  = 1788; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'guess';   
  temp.Ni = C2K(25);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on kap=0.9';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
4.569	0.194
30.352	0.412
63.969	1.190
69.843	1.341
73.433	1.427
87.141	2.139
97.911	1.860
107.050	2.808
112.272	3.282
113.903	2.507
116.841	2.206
120.431	2.336
122.715	2.616
126.632	3.951
128.590	3.219
129.569	3.478
132.833	3.650
134.791	3.047
135.117	3.844
136.097	2.638
137.728	2.897
138.708	3.349
138.709	3.371
139.360	4.318
139.361	3.694
140.339	4.900
140.666	3.522
141.319	4.318
142.624	3.543
145.561	4.491
146.867	2.209
148.499	3.953
148.825	3.824
149.151	3.695
150.131	5.417
150.457	4.513
150.458	4.642
151.110	3.587
152.415	3.760
155.352	4.018
156.658	4.621
156.984	3.803
157.311	4.298
158.290	3.631
158.943	4.191
160.574	5.633
160.901	4.191
165.144	4.665
165.145	4.342
167.428	4.837
170.039	4.816
170.366	4.536
171.345	6.711
172.324	4.235
173.629	4.752
176.567	4.967
179.178	4.666
179.179	4.903
182.441	6.949
182.442	5.183
186.358	5.183
189.621	5.787
190.601	5.227
190.927	7.272
190.928	4.710
193.211	5.012
193.538	7.251
200.065	5.012
201.044	6.068
201.045	5.615
205.940	7.123
207.245	5.487
209.856	6.413
211.488	5.918
211.489	6.284
212.141	6.047
214.426	6.607
218.668	8.308
219.648	6.155
219.974	6.930
221.279	5.531
222.258	6.155
222.585	7.490
230.418	6.781
232.702	5.726
236.619	5.726
239.230	7.018
239.883	6.523
240.862	6.222
249.674	7.041];
units.tL_f   = {'d', 'cm'};  label.tL_f= {'time time birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DimmHoed1998';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
6.201	0.204
30.679	0.431
63.316	1.201
70.170	1.292
74.086	1.383
87.467	2.106
98.238	1.926
110.313	2.807
113.251	3.258
114.230	2.514
117.167	2.176
118.146	3.687
121.410	3.169
122.715	2.898
126.305	3.959
132.180	3.711
137.728	3.621
138.055	3.261
138.708	4.208
139.360	3.757
140.666	3.554
141.319	4.321
142.298	3.509
142.950	4.727
144.582	3.396
145.888	3.983
146.540	4.457
146.867	3.600
147.846	3.442
149.478	4.525
149.479	4.074
152.089	3.623
152.742	4.390
153.068	4.548
156.005	3.916
157.311	4.255
158.616	4.029
159.269	3.804
159.595	5.563
161.554	3.443
167.102	4.414
167.755	4.256
171.018	5.429
171.671	4.910
171.997	4.527
175.261	5.046
175.262	5.362
176.240	5.226
179.830	5.227
181.462	5.046
182.768	5.610
186.358	5.272
187.010	5.002
188.969	5.927
192.232	5.160
197.128	5.431
198.107	5.364
201.044	5.206
202.350	5.905
204.308	5.590
205.287	5.003
207.898	5.477
209.530	5.771
212.141	5.252
219.974	6.200
225.849	5.547
229.765	5.840
234.334	6.066
241.188	5.977
257.833	5.865];
units.tL_m   = {'d', 'cm'};  label.tL_m= {'time time birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DimmHoed1998';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
%weights.Ni = 0 * weights.Ni;
%weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are gussed';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'The light-output by bacteria of the famili Vibrionaceae in the photophores on its underside matches moon/starrlight';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DZK2'; % Cat of Life
metaData.links.id_ITIS = '556302'; % ITIS
metaData.links.id_EoL = '591349'; % Ency of Life
metaData.links.id_Wiki = 'Uroteuthis_noctiluca'; % Wikipedia
metaData.links.id_ADW = 'Uroteuthis_noctiluca'; % ADW
metaData.links.id_Taxo = '157895'; % Taxonomicon
metaData.links.id_WoRMS = '878153'; % WoRMS
metaData.links.id_molluscabase = '878153'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Uroteuthis_noctiluca}}';
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
bibkey = 'DimmHoed1998'; type = 'article'; bib = [ ...
'author = {Wetjens F. Dimmlich and Frank E. Hoedt}, ' ... 
'year = {1998}, ' ...
'title = {AGE AND GROWTH OF THE MYOSID SQUID \emph{ Loliolus noctiluca} IN {W}ESTERN {P}ORT, {V}ICTORIA, DETERMINED FROM STATOLITH MICROSTRUCTURE ANALYSIS}, ' ...
'journal = {Mar. Biol. Ass. U.K.}, ' ...
'volume = {78}, ' ...
'pages = {577-586}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Uroteuthis-noctiluca.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

