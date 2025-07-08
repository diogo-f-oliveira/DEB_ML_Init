function [data, auxData, metaData, txtData, weights] = mydata_Pomacea_canaliculata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Ampullariidae';
metaData.species    = 'Pomacea_canaliculata'; 
metaData.species_en = 'Apple snail'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr', '0iFm'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 22];

%% set data
% zero-variate data

data.ab = 14; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 1000; units.am = 'd';    label.am = 'life span';                bibkey.am = 'EsteCazz1998';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'EsteCazz1998';
data.Lp  = 2.5;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'EsteCazz1998';
data.Li  = 15;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'Wiki';

data.Wwi  = 690;    units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight'; bibkey.Wwi  = 'UvaeShch2017';
  comment.Wwi = 'based on size-corrected value for viviparus viviparus: 17.4*(15/4.4)^3';

data.Ri  = 600/365; units.Ri  = '#/d'; label.Ri = 'reproduction rate for 5 cm';  bibkey.Ri  = 'PenaResp2015';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '600 eggs per clutch, 1 clutches per season assumed for snails of 5 cm';

% uni-variate data
% time-length
data.tL_f = [ ... % age (d), shell length (cm)
0.879	0.726
12.305	0.997
23.291	1.356
35.596	1.715
47.461	2.002
74.268	2.305
91.846	2.544
102.393	2.775
109.424	2.847
135.352	3.086
145.459	3.126
154.688	3.166
164.355	3.214
174.463	3.254
183.691	3.293
192.920	3.325
203.027	3.381
216.650	3.349
226.318	3.397
239.502	3.429
254.443	3.445
270.264	3.461
283.447	3.501
295.752	3.533
309.814	3.557
323.438	3.652
331.787	3.716
344.971	3.756
356.836	3.820
366.504	3.836
375.293	3.836
387.158	3.884
396.826	3.892];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time birth', 'shell length', 'female'};  
temp.tL_f    = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EsteCazz1998';
comment.tL_f = 'Data for females from Puerto Iguazii, Argentina';
%
data.tL_m = [ ... % age (d), shell length (cm)
1.318	0.750
12.305	0.997
24.170	1.396
37.793	1.738
47.900	2.026
76.025	2.440
90.967	2.648
101.953	2.839
108.984	2.903
127.881	2.990
134.912	3.022
145.898	3.046
153.809	3.078
165.234	3.086
174.463	3.086
184.131	3.094
192.920	3.094
203.906	3.094
217.090	3.086
226.318	3.094
239.502	3.102
254.443	3.094
270.264	3.118
285.205	3.110
296.191	3.094
311.133	3.118
324.316	3.126
332.666	3.126
345.850	3.174
357.715	3.190
367.383	3.190
377.490	3.190
386.719	3.214
396.826	3.230];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time birth', 'shell length', 'male'};  
temp.tL_m    = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EsteCazz1998';
comment.tL_m = 'Data for males from Puerto Iguazii, Argentina';

% time-length
data.tL_1f = [ ... % age (d), shell length (cm)
0.000	0.709
6.683	0.874
14.703	0.967
22.277	1.156
29.851	1.376
35.198	1.588
42.772	1.745
50.792	1.933
56.139	2.067
63.713	2.247
70.396	2.341
81.535	2.569
90.446	2.813
98.020	2.930
106.931	3.032
120.297	3.094
127.426	3.204
138.564	3.329
147.475	3.470
166.188	3.650
188.465	3.758
203.168	3.852
214.307	3.961
223.218	4.118
233.911	4.180
263.317	4.296
269.554	4.351
279.356	4.413
294.059	4.460
311.436	4.514
351.980	4.527
399.208	4.531];
units.tL_1f   = {'d', 'cm'};  label.tL_1f = {'time birth', 'shell length', 'female'};  
temp.tL_1f    = C2K(23);  units.temp.tL_1f = 'K'; label.temp.tL_1f = 'temperature';
bibkey.tL_1f = 'EsteCazz1998';
comment.tL_1f = 'Data for females from Laguna Los Chilenos, Argentina';
%
data.tL_1m = [ ... % age (d), shell length (cm)
0.446	0.709
6.683	0.874
14.257	0.999
20.941	1.187
28.069	1.407
35.644	1.620
43.663	1.776
50.347	1.902
58.812	2.019
65.050	2.161
71.287	2.341
82.426	2.561
89.554	2.687
92.673	2.765
99.356	2.891
106.485	2.985
120.743	2.999
128.317	3.101
139.455	3.211
148.366	3.312
166.188	3.477
188.911	3.617
203.168	3.734
216.089	3.859
223.218	4.000
235.248	4.046
263.762	4.092
269.109	4.123
278.911	4.146
294.505	4.176
312.327	4.206
351.980	4.204
398.762	4.185];
units.tL_1m   = {'d', 'cm'};  label.tL_1m = {'time birth', 'shell length', 'male'};  
temp.tL_1m    = C2K(23);  units.temp.tL_1m = 'K'; label.temp.tL_1m = 'temperature';
bibkey.tL_1m = 'EsteCazz1998';
comment.tL_1m = 'Data for males from Laguna Los Chilenos, Argentina';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tL_1f = 3 * weights.tL_1f;
weights.tL_1m = 3 * weights.tL_1m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males from Puerto Iguazii'};
set2 = {'tL_1f','tL_1m'}; subtitle2 = {'Data for females, males from Laguna Los Chilenos'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males equal to females upto b';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4LQ8R'; % Cat of Life
metaData.links.id_ITIS = '568121'; % ITIS
metaData.links.id_EoL = '51890270'; % Ency of Life
metaData.links.id_Wiki = 'Pomacea_canaliculata'; % Wikipedia
metaData.links.id_ADW = 'Pomacea_canaliculata'; % ADW
metaData.links.id_Taxo = '542424'; % Taxonomicon
metaData.links.id_WoRMS = '741113'; % WoRMS
metaData.links.id_molluscabase = '741113'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacea_canaliculata}}';
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
bibkey = 'PenaResp2015'; type = 'Article'; bib = [ ... 
'author = {Myrtle Ayn E. Penaredondo and Mae A. Responte and I-za Fe Z. Ismael and Lynde E. Quinones and Maria Rhotsyn B. Dacar and Amrosi A. Rinza and Angeli V. Mag-aso and Karyl Marie F. Dagoc}, ' ... 
'year = {2015}, ' ...
'title = {Density and Fecundity of \emph{Pomacea canaliculata} ({L}amarck, 1822) in Selected Areas of {M}indanao, {P}hilippines: {I}mplications on Pest Management Strategies}, ' ...
'journal = {Adv. Environ. Biol.}, ' ...
'volume = {9(19)}, ' ...
'pages = {154-159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EsteCazz1998'; type = 'Article'; bib = [ ... 
'author = {Alejandra L. Estebenet and Nestor J. Cazzaniga}, ' ... 
'year = {1998}, ' ...
'title = {Sex-related differential growth in \emph{Pomacea canaliculata} ({G}astropoda: {A}mpullariidae)}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {64}, ' ...
'pages = {119-123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UvaeShch2017'; type = 'Article'; bib = [ ... 
'author = {E. I. Uvaeva and G. Kh. Shcherbina}, ' ... 
'year = {2017}, ' ...
'title = {The Role of \emph{Viviparus contectus} ({M}illet) ({M}ollusca, {V}iviparidae) in the Sedimentation of Suspension and Transformation of Organic Matter in the {T}nya {R}iver ({U}kraine)}, ' ...
'journal = {Inland Water Biology}, ' ...
'number = {4}, ' ...
'volume = {10}, ' ...
'pages = {415-418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

