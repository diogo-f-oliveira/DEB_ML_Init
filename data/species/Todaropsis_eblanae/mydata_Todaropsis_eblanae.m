function [data, auxData, metaData, txtData, weights] = mydata_Todaropsis_eblanae

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Todaropsis_eblanae'; 
metaData.species_en = 'Lesser flying squid'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
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

data.am = 365;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'ArkhLapt2000';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14.5;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';    bibkey.Lp  = 'ArkhLapt2000';
data.Li  = 22;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female';     bibkey.Li  = 'Wiki';
data.Lim  = 16;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for male';    bibkey.Lim  = 'Wiki';

data.Wwb  = 3e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on Ancistrocheirus_lesueurii';

data.Ni  = 29e3; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'guess';   
  temp.Ni = C2K(18);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on Ancistrocheirus_lesueurii';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
87.056	4.759
91.886	6.897
93.402	8.966
96.377	5.931
108.426	7.655
112.613	11.103
114.043	6.414
117.757	8.690
119.846	10.483
122.740	8.621
128.795	9.034
130.264	11.793
130.474	8.759
130.841	11.448
132.391	13.034
135.208	12.276
137.440	12.000
138.646	10.552
141.998	10.069
143.553	11.586
143.572	11.310
144.473	14.276
146.857	11.793
148.988	12.966
152.402	11.586
158.863	14.138
164.041	11.241
165.595	12.759
210.330	13.724];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhLapt2000';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
79.846	5.653
83.150	7.027
84.251	4.967
84.252	7.440
86.454	7.921
87.004	6.273
88.656	5.243
89.207	6.823
94.714	7.374
101.322	7.856
102.423	6.003
105.727	4.424
107.929	8.407
109.031	7.515
118.392	9.784
122.247	11.158
125.000	10.266
127.753	9.237
129.956	10.405
130.507	9.650
131.057	11.092
132.159	11.848
136.013	11.368
137.665	8.553
142.070	11.576
151.432	11.716
151.982	12.883
153.084	10.549
156.938	13.228
156.939	12.678
168.502	11.858
174.009	13.232
181.167	12.960];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhLapt2000';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
87.444	13.137
93.610	46.571
93.611	23.395
96.973	14.789
109.305	25.863
113.789	92.785
117.152	16.367
120.516	53.254
122.758	44.654
123.879	72.115
128.363	50.625
132.286	118.409
132.287	100.383
132.288	57.465
135.090	78.046
137.892	120.087
137.893	95.194
139.013	23.942
140.695	111.484
143.498	100.306
145.178	74.543
145.179	54.801
148.543	115.722
149.664	134.598
152.466	132.004
153.587	103.670
165.359	87.280
167.601	143.059
168.161	134.471
211.323	192.544];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(18);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ArkhLapt2000';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
80.663	15.193
84.037	26.609
84.531	16.084
85.726	32.755
86.709	10.829
89.527	21.365
89.565	28.382
90.601	16.105
96.266	42.441
103.401	35.449
103.847	16.152
105.183	58.262
107.521	81.954
108.891	30.205
120.718	73.229
121.357	89.020
124.155	96.048
127.849	65.359
130.647	72.386
132.235	60.111
132.385	87.305
132.458	100.463
134.176	111.872
137.420	99.603
139.410	60.136
141.235	90.844
151.851	114.566
154.441	83.873
158.101	147.044
159.766	148.804
170.034	109.367
176.376	158.512
181.280	147.125
184.103	158.539];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(18);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ArkhLapt2000';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 2 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7CFSQ'; % Cat of Life
metaData.links.id_ITIS = '205728'; % ITIS
metaData.links.id_EoL = '586269'; % Ency of Life
metaData.links.id_Wiki = 'Todaropsis_eblanae'; % Wikipedia
metaData.links.id_ADW = 'Todaropsis_eblanae'; % ADW
metaData.links.id_Taxo = '158105'; % Taxonomicon
metaData.links.id_WoRMS = '140625'; % WoRMS
metaData.links.id_molluscabase = '140625'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Todaropsis_eblanae}}';
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
bibkey = 'ArkhLapt2000'; type = 'article'; bib = [ ... 
'author = {Alexander I. Arkhipkin and Vladimir V. Laptikhovsky}, ' ... 
'year = {2000}, ' ...
'title = {Age and growth of the squid \emph{Todaropsis eblanae} ({C}elaphod: {O}mmastrephidae) on the north-west {A}frican shelf}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {80}, ' ...
'pages = {747-748}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Todaropsis-eblanae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

