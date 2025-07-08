function [data, auxData, metaData, txtData, weights] = mydata_Pomacanthus_imperator
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pomacanthiformes'; 
metaData.family     = 'Pomacanthidae';
metaData.species    = 'Pomacanthus_imperator'; 
metaData.species_en = 'Emperor angelfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCis', 'jiCit'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 14]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};
metaData.date_mod_1     = [2017 11 11]; 
metaData.email_mod_1    = {'bas.kooijman@vu.nl'}; 
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19.2; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'ArelCeba2007'; 
  comment.Lp = 'based on same relative length compared to P. zonipectus: Li * 21.5/ 46';
data.Li  = 41.2;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'ChunWoo1999';

data.Wwb = 1.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'reefbuilders';
  comment.Wwb = 'based on assumed egg diameter of 0.6 mm : 4/3*pi*0.03^3, motivated by being less then 0.9 mm for P. annularis'; 
data.Wwi = 2852; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ChunWoo1999';

data.Ri = 0.54e6/365; units.Ri = '#/d';   label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(25.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.92';

% uni-variate data
% time-length-weight
data.tLW = [ ... % age group (yr), standard length (mm), wet weight (g)
 0  46.0     3.9 
 1  66.4    12.5 
 2  94.2    40.8 
 3 120.7    85.5 
 4 133.9   125.3 
 5 145.6   145.5 
 6 157.9   193.6 
 7 170.7   237.9 
 8 188.0   344.1 
 9 200.9   406.6 
10 217.6   500.7 
11 222.0   555.8 
12 242.8   658.5 
13 253.0   743.5 
14 268.1   969.7 
15 277.0   766.6 
16 293.0  1030.7];
data.tLW(:,1) = 365 * (.9 + data.tLW(:,1));  % convert yr to d
data.tLW(:,2) = data.tLW(:,2)/10; % convert mm to cm
units.tLW  = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'standard length', 'weight'};  
temp.tLW   = C2K(25.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'ChunWoo1999'; treat.tLW = {1 {'std length','weight'}};
comment.tLW = 'temp varies between 22 and 29 C';

% Leng-weight
data.LW = [ ... % standard length (cm), wet weight (g)
25.763	0.185
30.162	0.199
40.215	0.247
45.242	6.174
45.871	6.170
50.269	6.143
52.783	6.127
57.181	6.100
60.323	6.081
62.837	8.216
62.837	14.668
65.350	16.803
67.864	16.787
69.749	16.776
71.005	16.768
74.776	18.895
76.661	18.884
76.661	25.335
78.546	27.474
79.803	29.617
81.688	21.003
82.944	20.996
82.944	31.748
92.998	42.439
98.025	42.408
99.910	46.698
101.795	57.439
103.052	57.431
105.566	48.814
106.194	48.810
108.707	50.945
108.707	63.848
108.707	68.149
110.592	68.138
111.849	59.528
114.363	68.115
114.363	78.867
114.991	85.315
117.504	70.246
118.761	87.442
120.646	72.377
123.788	72.358
123.788	87.411
125.045	102.457
125.673	91.701
125.673	126.110
128.187	108.890
130.700	128.229
133.214	108.859
133.214	126.063
133.842	119.608
138.241	138.936
139.497	132.476
141.382	132.465
142.639	143.210
143.896	102.342
143.896	128.148
145.781	186.201
148.294	136.723
148.294	145.325
148.294	177.583
149.551	186.178
152.693	156.051
155.206	190.444
155.206	171.089
157.092	156.024
157.720	229.138
158.977	186.120
162.118	207.606
162.118	226.961
163.375	218.351
164.632	192.537
164.632	231.247
164.632	224.795
165.889	160.271
166.517	188.224
166.517	218.332
167.774	241.980
168.402	231.223
172.172	280.663
177.199	259.126
177.199	272.029
178.456	287.076
179.084	278.470
179.084	261.265
180.969	248.350
180.969	315.017
182.855	276.296
183.483	306.399
185.996	291.330
187.882	396.695
188.510	276.261
188.510	398.842
189.138	340.773
189.138	383.784
189.767	287.006
190.395	407.432
191.023	368.719
192.908	368.707
192.908	381.610
194.165	302.033
194.165	323.538
197.307	415.992
197.307	400.938
198.564	422.436
198.564	441.791
199.820	366.514
200.449	377.263
200.449	504.145
201.077	372.958
201.077	392.313
201.077	407.367
201.077	433.173
201.077	486.937
202.334	398.757
203.591	504.125
204.219	450.358
204.847	377.236
204.847	437.451
206.732	450.343
207.361	409.479
208.618	418.073
209.246	435.273
210.503	482.578
211.131	456.767
211.131	491.176
213.645	450.300
215.530	607.278
216.158	430.930
216.158	488.994
217.415	400.815
218.671	512.635
219.928	557.788
220.557	424.451
221.813	609.390
221.813	648.099
223.698	527.658
225.583	538.399
225.583	630.872
228.725	546.982
229.354	579.236
231.239	555.568
237.522	546.928
240.036	688.848
241.921	802.815
245.691	564.082
251.975	598.452
256.373	843.586
260.144	925.283
260.144	1237.111
263.914	746.766
269.569	899.419
270.826	1120.917
275.853	998.305
277.738	770.336
280.251	935.912
289.048	884.245
293.447	1101.423
296.589	1101.403];
data.LW(:,1) = data.LW(:,1)/10; % convert mm to cm
units.LW  = {'cm', 'g'};  label.LW = {'standard length', 'wet weight'};  
bibkey.LW = 'ChunWoo1999';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.tLW = 10 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: W = 0.03280 * TL^2.716';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; non-migratory; depth range 1 - 100 m. Tropical, preferred';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4LQ6M'; % Cat of Life
metaData.links.id_ITIS = '169635'; % ITIS
metaData.links.id_EoL = '46581139'; % Ency of Life
metaData.links.id_Wiki = 'Pomacanthus_imperator'; % Wikipedia
metaData.links.id_ADW = 'Pomacanthus_imperator'; % ADW
metaData.links.id_Taxo = '45410'; % Taxonomicon
metaData.links.id_WoRMS = '220001'; % WoRMS
metaData.links.id_fishbase = 'Pomacanthus-imperator'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacanthus_imperator}}';
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
bibkey = 'ChunWoo1999'; type = 'Article'; bib = [ ... 
'author = {K. Chung and N. Y. S. Woo}, ' ... 
'year = {1999}, ' ...
'title = {Age and growth by scale analysis of Pomacanthus imperator (Teleostei: Pomacanthidae) from Dongsha Islands, southern China}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {55}, ' ...
'pages = {399-412}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThreBrot1985'; type = 'Article'; bib = [ ... 
'author = {Thresher, R. E. and Brothers, E. B.}, ' ... 
'year = {1985}, ' ...
'title = {Reproductive ecology and biogeography of Indo-West Pacific angelfishes (Pisces: Pomacanthidae)}, ' ...
'journal = {Evolution}, ' ...
'volume = {39}, ' ...
'pages = {878--887}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArelCeba2007'; type = 'Article'; bib = [ ... 
'author = {M. Arellano-Mart\''{i}nez and B. P. Ceballos-Vazquez and F. Galvan-Magana}, ' ... 
'year = {2007}, ' ...
'title = {Reproductive cycle of the Cortez angelfish Pomacanthus zonipectus (Gill, 1863) (Pomacanthidae) from the Gulf of California, Mexico}, ' ...
'journal = {Hidrobiologica}, ' ...
'volume = {17}, ' ...
'pages = {241--248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArelCeba2006'; type = 'Article'; bib = [ ... 
'author = {M. Arellano-Mart\''{i}nez and B. P. Ceballos-Vazquez and L. Hernandez-Olalde and F. Galvan-Magana}, ' ... 
'year = {2006}, ' ...
'title = {Fecundity  of  Cortez  angelfish Pomacanthus  zonipectus (Gill,  1863)  (Teleostei:  Pomacanthidae)  off Espiritu  Santo  Island,  Gulf  of  California,  Mexico}, ' ...
'journal = {Ciencias  Marinas}, ' ...
'volume = {32(1A)}, ' ...
'pages = {1--7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/SpeciesSummary.php?ID=6504&genusname=Pomacanthus&speciesname=imperator&AT=Pomacanthus+imperator&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reefbuilders'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reefbuilders.com/2015/04/03/bali-aquarichs-angelfish-accolades-part-1-pomacanthus-imperator-annularis-hybrid/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
