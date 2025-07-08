function [data, auxData, metaData, txtData, weights] = mydata_Onychoteuthis_banksi
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Onychoteuthidae';
metaData.species    = 'Onychoteuthis_banksi'; 
metaData.species_en = 'Common clubhook squid'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MA','MAg'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L';'L-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 09 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 250;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'ArkhRoa2005';   
  temp.am = C2K(14.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'guess';
data.Lpm  = 7;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';       bibkey.Lpm  = 'ArkhRoa2005';
data.Li  = 15;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'ArkhRoa2005';
data.Lim = 11; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'ArkhRoa2005';

data.Wwb  = 6.5e-5;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'ArkhNigm1997';
  comment.Wwb = 'based on egg diameter of 0.2 - 0.5 mm: pi/6*0.05^3';

data.Ni  = 1.6e5; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'ArkhNigm1997';   
  temp.Ni = C2K(14.3); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'potential fecundity: 51000 - 205000';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
28.402	0.645
31.953	0.716
35.503	0.933
41.420	1.655
44.379	1.654
60.947	2.736
61.538	2.085
64.497	2.084
67.456	3.242
68.639	1.214
76.923	2.805
80.473	3.238
85.799	3.310
94.083	3.525
97.633	3.886
97.634	3.669
101.775	3.885
103.550	4.536
105.917	4.753
114.793	3.809
125.444	5.689
131.953	5.543
131.954	5.326
133.728	9.452
134.911	5.832
134.912	7.062
137.870	4.673
142.012	5.323
143.787	7.205
147.929	5.249
149.112	7.204
151.479	7.927
152.071	5.755
153.846	7.347
155.621	9.447
158.580	5.536
158.581	8.432
158.582	9.229
166.864	7.779
172.781	5.533
176.923	9.514
176.924	6.328
177.515	11.396
177.516	7.197
184.024	6.109
184.615	10.308
185.207	6.833
185.799	11.684
187.574	7.629
187.575	5.819
188.166	10.742
189.941	6.325
198.225	10.522
212.426	10.591
215.976	10.301
215.977	11.894
228.402	8.705
259.172	12.969];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(14.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhRoa2005';
comment.tL_f = 'data for females'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
26.658	0.614
31.103	0.675
34.050	1.167
59.709	2.088
62.151	2.886
62.181	2.026
64.151	2.211
64.611	3.193
65.174	1.228
77.966	2.763
80.913	3.254
83.377	3.439
85.862	3.009
95.724	3.561
97.690	3.868
102.130	4.053
105.558	4.912
105.582	4.237
108.557	3.930
109.573	3.132
130.240	5.526
136.108	7.246
138.180	4.544
139.129	5.649
142.531	7.246
146.984	7.061
148.533	5.158
148.988	6.263
151.897	7.860
151.923	7.123
153.351	8.658
153.884	7.553
154.904	6.632
155.381	7.123
160.341	6.570
160.796	7.675
162.300	7.061
163.761	7.675
163.798	6.632
166.773	6.325
168.704	7.614
172.726	5.649
173.098	9.088
173.142	7.860
177.510	10.070
183.966	9.149
192.384	8.596
193.869	8.535
195.815	9.395
198.339	7.860
206.210	8.842
210.076	11.298
222.061	7.675];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(14.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhRoa2005';
comment.tL_m = 'data for males'; 

% length-weight
data.LWw = [ ... % mantle length (cm), wet weight (g)
1.290	0.853
2.258	1.702
2.339	0.868
2.661	2.542
3.105	0.600
3.226	3.106
3.468	1.440
3.750	1.722
3.911	4.229
4.315	2.008
4.476	3.958
4.597	3.125
4.919	2.017
5.040	5.079
5.323	5.083
5.565	6.200
5.605	9.261
5.685	8.706
5.726	12.045
5.847	8.708
6.048	7.320
6.290	10.105
6.573	11.779
6.935	10.393
6.935	11.506
7.097	11.786
7.177	15.683
7.460	13.183
7.540	17.079
7.581	15.967
7.742	16.526
7.742	12.908
7.863	18.197
8.065	19.869
8.387	24.048
8.468	19.040
8.831	27.671
8.911	25.446
8.911	23.220
9.355	24.339
9.476	29.350
9.516	26.846
9.960	38.261
10.040	32.140
10.040	29.914
10.040	28.801
10.363	39.936
10.726	37.158
10.766	41.055
11.169	37.999
11.573	53.031
11.573	48.022
11.734	43.294
12.016	48.029
12.137	60.830
12.742	64.456
13.710	71.983
14.677	89.248
14.839	83.685];
units.LWw  = {'cm', 'g'};  label.LWw = {'mantle length','wet weight'};  
bibkey.LWw = 'ArkhNigm1997';
comment.LWw = 'sexes combined'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.Li = 2 * weights.Li; 
weights.Lim = 2 * weights.Lim; 
weights.Lp = 2 * weights.Li; 
weights.Lpm = 2 * weights.Lim; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Tempertures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Frequently seen flying above the surface';
metaData.bibkey.F1 = 'sealifebase'; 
F2 = 'mean preferred temperature: 14.3 C';
metaData.bibkey.F2 = 'sealifebase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '49RJW'; % Cat of Life
metaData.links.id_ITIS = '82440'; % ITIS
metaData.links.id_EoL = '49115932'; % Ency of Life
metaData.links.id_Wiki = 'Onychoteuthi_banksii'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '40258'; % Taxonomicon
metaData.links.id_WoRMS = '140649'; % WoRMS
metaData.links.id_molluscabase = '140649'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onychoteuthi_banksii}}';
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
bibkey = 'ArkhRoa2005'; type = 'article'; bib = [ ... 
'author = {Alexander I. Arkhipkin and Rub\''{e}n Roa-Ureta}, ' ... 
'year = {2005}, ' ...
'title = {Identification of ontogenetic growth models for squid}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {56}, ' ...
'pages = {371–386}, ' ...
'doi = {10.1071/MF04274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArkhNigm1997'; type = 'article'; bib = [ ... 
'author = {Alexander I. Arkhipkin and Chingiz M. Nigmatullin}, ' ... 
'year = {1997}, ' ...
'title = {Ecology of the Oceanic Squid \emph{Onychoteuthis Banksi} and The Relationship Between the Genera \emph{Onychoteuthis} and \emph{Chaunoteuthis} ({C}ephalopoda: {O}nychoteuthidae)}, ' ...
'journal = {Journal of the Marine Biological Association of the UK}, ' ...
'volume = {56}, ' ...
'pages = {371–386}, ' ...
'doi = {10.1017/S0025315400036}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Onychoteuthis-banksii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

