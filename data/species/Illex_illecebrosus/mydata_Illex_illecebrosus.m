function [data, auxData, metaData, txtData, weights] = mydata_Illex_illecebrosus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Illex_illecebrosus'; 
metaData.species_en = 'Northern shortfin squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 250;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'DaweBeck1997';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.6;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'Wiki';
  comment.Lp = '195 to 330 mm';
data.Li  = 30; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Wiki';
data.Lim = 27; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'Wiki';

data.Wwb  = 5.2e-4; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'wiki';
  comment.Wwb = 'based on egg diameter of 0.8-1.3mm for Illex_coindetii: pi/6*0.1^3';

data.Ni  = 8e5; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'Wiki';   
  temp.Ni = C2K(14); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'value for Illex_coindetii';
  
% uni-variate data
% time-length data
data.tL_f = [ ... % time since birth (d), mantle length (cm)
108.613	18.953
109.761	16.618
110.504	19.519
125.355	17.325
137.527	18.104
137.789	16.901
141.577	18.175
143.765	18.387
144.035	17.396
147.491	18.175
149.779	20.792
149.797	21.217
154.369	18.882
155.188	16.123
156.630	20.863
158.316	23.976
159.394	19.943
159.790	21.995
163.182	21.217
170.095	22.774
172.241	21.995
176.335	23.127
176.984	23.764
177.219	21.925
177.245	22.561
181.007	23.198
181.342	23.764
206.450	28.717
208.585	27.656
228.833	28.009];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(14);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DaweBeck1997';
comment.tL_f = 'Data for females from Newfoundland waters hatched in April samples)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm
114.469	17.774
115.713	18.830
119.256	15.585
121.023	22.151
126.150	18.755
126.175	17.472
130.278	17.849
131.192	19.585
133.364	21.698
133.700	20.717
140.069	18.453
141.690	16.415
142.276	18.755
142.543	21.245
144.193	17.774
147.312	19.962
150.881	15.358
158.139	16.113
160.877	21.547
164.109	18.000
164.143	16.264
172.599	20.415
174.444	23.057
176.037	22.453
176.365	21.849
178.579	21.849
179.866	20.717
181.371	24.566
184.900	22.000
185.898	19.509
186.785	22.604
187.425	22.226
197.508	24.038
215.519	24.642];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(14);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DaweBeck1997';
comment.tL_m = 'Data for males from Newfoundland waters hatched in April samples)'; 

% time-weight data
data.tWw_f = [ ... % log10 time since birth (d), log10 wet weight (g)
2.032	2.148
2.037	1.854
2.038	2.140
2.098	1.920
2.137	2.033
2.140	1.842
2.152	1.922
2.156	2.026
2.163	1.962
2.168	1.994
2.174	2.249
2.175	2.154
2.187	2.011
2.190	1.812
2.195	2.202
2.197	2.449
2.201	2.322
2.202	2.107
2.212	2.171
2.231	2.395
2.236	2.347
2.241	2.403
2.246	2.459
2.250	2.332
2.251	2.404
2.257	2.420
2.312	2.717
2.319	2.677
2.358	2.655];
data.tWw_f = 10.^data.tWw_f; % remove log transform
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(14);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'DaweBeck1997';
comment.tWw_f = 'Data for females from Newfoundland waters hatched in April samples)'; 
%
data.tWw_m = [ ... % log10 time since birth (d), log10 wet weight (g)
2.061	1.995
2.069	2.058
2.075	1.753
2.081	2.332
2.101	2.019
2.104	1.879
2.112	1.926
2.119	2.145
2.126	2.223
2.127	2.302
2.146	2.012
2.152	1.786
2.153	2.247
2.154	2.013
2.160	1.934
2.167	2.075
2.179	1.778
2.199	1.810
2.208	2.233
2.216	1.990
2.217	1.912
2.236	2.202
2.243	2.413
2.244	2.304
2.247	2.327
2.250	2.398
2.255	2.273
2.261	2.453
2.265	2.250
2.268	2.179
2.271	2.336
2.296	2.461
2.333	2.548];
data.tWw_m = 10.^data.tWw_m; % remove log transform
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(14);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'DaweBeck1997';
comment.tWw_m = 'Data for males from Newfoundland waters hatched in April samples)'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.am = 5 * weights.am;
%weights.Lp = 10 * weights.Lp;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3PGGZ'; % Cat of Life
metaData.links.id_ITIS = '82521'; % ITIS
metaData.links.id_EoL = '451352'; % Ency of Life
metaData.links.id_Wiki = 'Illex_illecebrosus'; % Wikipedia
metaData.links.id_ADW = 'Illex_illecebrosus'; % ADW
metaData.links.id_Taxo = '40276'; % Taxonomicon
metaData.links.id_WoRMS = '140621'; % WoRMS
metaData.links.id_molluscabase = '153087'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Illex_illecebrosus}}';
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
bibkey = 'DaweBeck1997'; type = 'Article'; bib = [ ... 
'author = {Earl G. Dawe and Paul C. Beck}, ' ... 
'year = {1997}, ' ...
'title = {Population structure, growth, and sexual maturation of short-finned squid (\emph{Illex illecebrosus}) at {N}ewfoundland}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {54}, ' ...
'pages = {137-146}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Illex-illecebrosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

