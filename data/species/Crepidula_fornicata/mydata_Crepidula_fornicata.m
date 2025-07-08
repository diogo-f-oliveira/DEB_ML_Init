function [data, auxData, metaData, txtData, weights] = mydata_Crepidula_fornicata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Calyptraeidae';
metaData.species    = 'Crepidula_fornicata'; 
metaData.species_en = 'Slipper limpet'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'dLj'; 'Ri'; 'JXi'}; 
metaData.data_1     = {'t-L'; 'L-Wd'; 'Wd-JC_T'; 'Wd-JO_T'; 'Wd-JN_T';}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2015 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 12 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 27]; 


%% set data
% zero-variate data

data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'FretGrah1981';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is guessed';
data.tj = 31;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'FretGrah1981';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temp is guessed';
data.tp = 60;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'FretGrah1981';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'read from tL curve for Lp';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';  comment.ab = 'temp is guessed';

%data.L0  = 1.8e-2;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'HenrColl2010';
data.Lb  = 4.6e-2;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'HenrColl2010';
data.Lj  = 9.7e-2;   units.Lj  = 'cm';  label.Lj  = 'shell length at metam';   bibkey.Lj  = 'HenrColl2010';
data.Lp  = 0.4;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'FretGrah1981';
  comment.Lp = 'for male function; Lp = 2.38 cm for female function, NelsCala1983';
data.Li  = 5.3;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HenrColl2010';

data.dLj  = 1.105e-2;   units.dLj  = 'cm/d';  label.dLj  = 'growth at Lj';   bibkey.dLj  = 'PechHilb1996';
  temp.dLj = C2K(20);  units.temp.dLj = 'K'; label.temp.dLj = 'temperature';
  comment.dLj = 'temp is guessed';

data.Ri  = 11000/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'DeslHera1986';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JXm  = 5e8;   units.JXm  = 'cells Phaeodactylum tricornutum/ d.g wet weight'; label.JXm  = 'max ingestion rate';     bibkey.JXm  = 'Thai1984';   
  temp.JXm = C2K(20);  units.temp.JXm = 'K'; label.temp.JXm = 'temperature';

% uni-variate data
% t-L data from Thai1984, Fig 5
data.tL = [ ... % time since birth (d), shell length (% increase from 0)
0.000	0.000
14.894	1.688
28.298	2.561
42.894	9.478
56.894	5.337
71.489	9.210
85.043	13.255
98.894	14.770
112.298	13.714];
data.tL(:,2) = data.tL(:,2)/ 100; % convert % to fraction
units.tL   = {'d', '-'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Thai1984';

% L-Wd data from MartThou2006
data.LWd = [ ... length (mm), soft body AFDW (g)
14.716	0.018
14.946	0.018
16.096	0.019
17.359	0.016
18.164	0.016
18.166	0.023
19.201	0.027
19.429	0.019
20.006	0.029
20.809	0.019
21.505	0.047
21.737	0.056
33.713	0.156
34.979	0.160
35.906	0.193
36.940	0.191
40.526	0.288
40.642	0.296
41.219	0.304
41.336	0.313
41.684	0.327
42.261	0.339
42.600	0.313
43.190	0.377
43.542	0.409
43.646	0.360
43.983	0.327
44.338	0.374
44.676	0.342
44.797	0.370
46.181	0.389
46.305	0.428
47.105	0.407
47.455	0.430
48.031	0.436];
data.LWd(:,1) = data.LWd(:,1)/ 10; % convert mm to cm
units.LWd   = {'d', '-'};  label.LWd = {'shell length', 'ashfree dry weight'};  
bibkey.LWd = 'MartThou2006';
%
% L-Ws Data from MartThou2006
data.LWs = [ ... % length (mm), shell weight (g)
14.812	0.285
16.191	0.285
17.456	0.332
18.031	0.379
18.607	0.474
19.526	0.427
20.447	0.569
21.828	0.711
22.060	0.949
33.913	2.372
34.032	2.846
34.372	2.372
34.608	2.988
35.648	3.557
35.760	3.273
36.450	3.320
37.374	3.747
37.487	3.510
41.428	6.972
41.544	7.115
42.006	7.352
42.231	6.783
42.809	7.162
43.042	7.494
43.615	7.352
44.077	7.494
44.540	7.921
44.878	7.115
45.226	7.494
45.240	8.917
45.691	8.016
46.842	8.253
47.295	7.542
47.648	8.348
48.106	8.158
48.113	8.870
48.570	8.632
49.502	9.866
49.846	9.866
50.538	10.055
51.692	10.530
51.927	11.099];
data.LWs(:,1) = data.LWs(:,1)/10; % convert mm to cm
units.LWs   = {'d', '-'};  label.LWs = {'shell length', 'shell weight'};  
bibkey.LWs = 'MartThou2006';

% Wd-CO2 - data from MartThou2006 for summer T = 273 + 17.44 K
data.WdJC_sum = [ ... % AFDW (g), CO2 prod (mumol/h.g AFDW)
0.015	19.662
0.017	29.868
0.019	16.095
0.179	21.147
0.190	12.487
0.191	17.845
0.309	15.445
0.325	8.322
0.334	17.517
0.337	21.349
0.364	17.301
0.376	19.868
0.403	18.116
0.425	19.164
0.431	12.794];
units.WdJC_sum   = {'g', 'mumol/h.g AFDW'};  label.WdJC_sum = {'AFDW', 'CO2 production'};  
temp.WdJC_sum    = C2K(17.44);  units.temp.WdJC_sum = 'K'; label.temp.WdJC_sum = 'temperature';
bibkey.WdJC_sum = 'MartThou2006';
%
% Wd-O2 - data from MartThou2006 for summer T = 273 + 17.44 K
data.WdJO_sum = [ ... % AFDW (g), O2 cons (mumol/h.g AFDW)
0.015	-44.879
0.016	-36.971
0.026	-44.355
0.177	-24.264
0.190	-18.380
0.193	-23.224
0.307	-17.720
0.328	-17.949
0.334	-21.513
0.337	-23.549
0.364	-19.944
0.375	-19.164
0.402	-17.599
0.423	-21.400
0.428	-12.720];
units.WdJO_sum   = {'g', 'mumol/h.g AFDW'};  label.WdJO_sum = {'AFDW', 'O2 consumption'};  
temp.WdJO_sum    = C2K(17.44);  units.temp.WdJO_sum = 'K'; label.temp.WdJO_sum = 'temperature';
bibkey.WdJO_sum = 'MartThou2006';
%
% Wd-NH3 - data from MartThou2006 for summer T = 273 + 17.44 K
data.WdJN_sum = [ ... % AFDW (g), NH3 prod (mumol/h.g AFDW)
0.016	1.434
0.018	1.903
0.019	1.616
0.179	1.436
0.190	1.866
0.194	1.279
0.310	0.945
0.327	1.114
0.334	1.139
0.338	1.074
0.366	1.072
0.376	0.771
0.406	0.821
0.426	0.807
0.431	0.872];
units.WdJN_sum   = {'g', 'mumol/h.g AFDW'};  label.WdJN_sum = {'AFDW', 'NH3 production'};  
temp.WdJN_sum    = C2K(17.44);  units.temp.WdJN_sum = 'K'; label.temp.WdJN_sum = 'temperature';
bibkey.WdJN_sum = 'MartThou2006';
%
% Wd-CO2 - data from MartThou2006 for autumn: T = 273 + 13.11 K
data.WdJC_aut = [ ... % AFDW (g), CO2 prod (mumol/h.g AFWT)
0.017	33.697
0.143	9.879
0.148	13.967
0.154	10.914
0.158	15.255
0.348	12.436
0.354	15.505
0.372	9.916];
units.WdJC_aut   = {'g', 'mumol/h.g AFDW'};  label.WdJC_aut = {'AFDW', 'CO2 production'};  
temp.WdJC_aut    = C2K(13.11);  units.temp.WdJC_aut = 'K'; label.temp.WdJC_aut = 'temperature';
bibkey.WdJC_aut = 'MartThou2006';
%
% Wd-O2 - data from MartThou2006 for autumn: T = 273 + 13.11 K
data.WdJO_aut = [ ... % AFDW (g), O2 cons (mumol/h.g AFWT)
0.015	-42.071
0.017	-36.200
0.021	-50.481
0.143	-17.673
0.149	-26.339
0.155	-13.320
0.348	-13.329
0.354	-14.852
0.372	-13.809
0.378	-10.740];
units.WdJO_aut   = {'g', 'mumol/h.g AFDW'};  label.WdJO_aut = {'AFDW', 'O2 consumption'};  
temp.WdJO_aut    = C2K(13.11);  units.temp.WdJO_aut = 'K'; label.temp.WdJO_aut = 'temperature';
bibkey.WdJO_aut = 'MartThou2006';
%
% Wd-NH3 - data from MartThou2006 for autumn: T = 273 + 13.11 K
data.WdJN_aut = [ ... % AFDW (g), NH3 prod (mumol/h.g AFWT)
0.0209	2.667
0.0215	2.158
0.0304	2.615
0.1437	1.080
0.1498	1.250
0.1508	1.028
0.3489	0.943
0.3749	0.905
0.3818	0.709];
units.WdJN_aut   = {'g', 'mumol/h.g AFDW'};  label.WdJN_aut = {'AFDW', 'NH3 production'};  
temp.WdJN_aut    = C2K(13.11);  units.temp.WdJN_aut = 'K'; label.temp.WdJN_aut = 'temperature';
bibkey.WdJN_aut = 'MartThou2006';
%
% Wd-CO2 - data from MartThou2006 for winter: T = 273 + 9.99 K
data.WdJC_win = [... % AFDW (g), CO2 prod (mumol/h.g AFWT)
0.015	7.035
0.017	9.548
0.022	6.030
0.025	7.538
0.129	4.774
0.132	6.281
0.142	5.528
0.146	2.010
0.241	5.276
0.256	6.030
0.261	8.291
0.283	5.025];
units.WdJC_win   = {'g', 'mumol/h.g AFDW'};  label.WdJC_win = {'AFDW', 'CO2 production'};  
temp.WdJC_win    = C2K(9.99);  units.temp.WdJC_win = 'K'; label.temp.WdJC_win = 'temperature';
bibkey.WdJC_win = 'MartThou2006';
%
% Wd-O2 - data from MartThou2006 for winter: T = 273 + 9.99 K
data.WdJO_win = [... % AFDW (g), O2 cons (mumol/h.g AFWT)
0.013	-13.065
0.015	-14.573
0.016	-18.090
0.132	-5.276
0.135	-11.055
0.138	-8.794
0.145	-7.538
0.243	-9.045
0.256	-10.050
0.263	-9.045
0.281	-7.035];
units.WdJO_win   = {'g', 'mumol/h.g AFDW'};  label.WdJO_win = {'AFDW', 'O2 consumption'};  
temp.WdJO_win    = C2K(9.99);  units.temp.WdJO_win = 'K'; label.temp.WdJO_win = 'temperature';
bibkey.WdJO_win = 'MartThou2006';
%
% Wd-NH3 - data  from MartThou2006 for winter: T = 273 + 9.99 K
data.WdJN_win = [ ... % AFDW (g), NH3 prod (mumol/h.g AFWT)
0.013	2.224
0.014	1.974
0.015	2.605
0.017	2.092
0.133	0.776
0.138	1.000
0.142	0.882
0.148	0.974
0.242	0.868
0.255	1.013
0.264	0.947
0.282	0.895];
units.WdJN_win   = {'g', 'mumol/h.g AFDW'};  label.WdJN_win = {'AFDW', 'NH3 production'};  
temp.WdJN_win    = C2K(9.99);  units.temp.WdJN_win = 'K'; label.temp.WdJN_win = 'temperature';
bibkey.WdJN_win = 'MartThou2006';
%
% Wd-CO2 - data from MartThou2006 for spring: T = 273 + 13.18 K
data.WdJC_spr = [ ... % AFDW (g), CO2 prod (mumol/h.g AFWT)
0.010	14.994
0.013	11.191
0.014	45.203
0.015	30.232
0.090	10.069
0.100	18.464
0.102	13.646
0.267	18.021
0.276	23.114
0.282	15.257
0.295	11.475
0.296	15.029
0.297	6.909
0.307	9.214
0.310	15.564
0.354	14.125
0.371	15.427
0.405	19.553
0.468	19.926
0.469	14.852];
units.WdJC_spr   = {'g', 'mumol/h.g AFDW'};  label.WdJC_spr = {'AFDW', 'CO2 production'};  
temp.WdJC_spr    = C2K(13.18);  units.temp.WdJC_spr = 'K'; label.temp.WdJC_spr = 'temperature';
bibkey.WdJC_spr = 'MartThou2006';
%
% Wd-O2 - data from MartThou2006 for spring: T = 273 + 13.18 K
data.WdJO_spr = [ ... % AFDW (g), O2 cons (mumol/h.g AFWT)
0.008	-56.837
0.013	-57.843
0.014	-36.776
0.015	-63.424
0.094	-23.426
0.096	-34.843
0.101	-29.250
0.264	-22.848
0.276	-25.363
0.281	-20.278
0.290	-15.439
0.291	-13.660
0.293	-16.701
0.297	-13.394
0.309	-17.940
0.318	-15.131
0.352	-15.828
0.368	-18.589
0.388	-21.342
0.406	-15.979
0.464	-18.152
0.469	-16.365];
units.WdJO_spr   = {'g', 'mumol/h.g AFDW'};  label.WdJO_spr = {'AFDW', 'O2 consumption'};  
temp.WdJO_spr    = C2K(13.18);  units.temp.WdJO_spr = 'K'; label.temp.WdJO_spr = 'temperature';
bibkey.WdJO_spr = 'MartThou2006';
%
% Wd- NH3 - data from MartThou2006 for spring: T = 273 + 13.18 K
data.WdJN_spr = [... % AFDW (g), NH3 prod (mumol/h.g AFWT)
0.014	2.909
0.017	3.130
0.018	2.325
0.020	3.039
0.093	1.831
0.100	1.662
0.102	2.532
0.266	1.987
0.279	2.000
0.281	1.870
0.295	1.286
0.296	1.039
0.300	1.455
0.307	2.117
0.308	0.961
0.311	1.156
0.324	1.286
0.391	1.364
0.406	1.416
0.464	1.610
0.472	1.481];
units.WdJN_spr   = {'g', 'mumol/h.g AFDW'};  label.WdJN_spr = {'AFDW', 'NH3 production'};  
temp.WdJN_spr    = C2K(13.18);  units.temp.WdJN_spr = 'K'; label.temp.WdJN_spr = 'temperature';
bibkey.WdJN_spr = 'MartThou2006';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.Lb = 50 * weights.Lb;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'WdJC_sum','WdJC_aut','WdJC_win','WdJC_spr'}; subtitle1 = {'Data for summer, autumn, winter, spring'};
% set2 = {'WdJO_sum','WdJO_aut','WdJO_win','WdJO_spr'}; subtitle2 = {'Data for summer, autumn, winter, spring'};
% set3 = {'WdJN_sum','WdJN_aut','WdJN_win','WdJN_spr'}; subtitle3 = {'Data for summer, autumn, winter, spring'};
% metaData.grp.sets = {set1,set2,set3};
% metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};
% 
%% Facts
F1 = 'protandrous hermaphroditic; first male, then female';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'most females spawn twice per year';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'planktontic as larva, settle in stacks';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'If a juvenile settles on an established stack it develops and may remain as a male for an extended period (up to 6 years), apparently maintained by pheromones released by females lower in the stack';
metaData.bibkey.F4 = 'FretGrah1981'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '6BG8L'; % Cat of Life
metaData.links.id_ITIS = '72623'; % ITIS
metaData.links.id_EoL = '593855'; % Ency of Life
metaData.links.id_Wiki = 'Crepidula_fornicata'; % Wikipedia
metaData.links.id_ADW = 'Crepidula_fornicata'; % ADW
metaData.links.id_Taxo = '35525'; % Taxonomicon
metaData.links.id_WoRMS = '138963'; % WoRMS
metaData.links.id_molluscabase = '138963'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crepidula_fornicata}}';
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
bibkey = 'FretGrah1981'; type = 'Article'; bib = [ ... 
'author = {Fretter, V. and Graham, A.}, ' ... 
'year = {1981}, ' ...
'title = {Molluscs of {B}ritain and {D}enmark: {P}art 6. {T}he Prosobranch Molluscs of {B}ritain and {D}enmark}, ' ...
'journal = {Journal of Molluscan Studies}, ' ...
'number = {supplement 9}, '...
'pages = {309--313}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PechHilb1996'; type = 'Article'; bib = [ ... 
'author = {Pechenik, J. A. and Hilbish, T. J. and Eyster, L. S. and Marshall, D.}, ' ... 
'year = {1996}, ' ...
'title = {Relationship between larval and juvenile growth rates in two marine gastropods, \emph{Crepidula plana} and \emph{C. fornicata}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {125}, ' ...
'pages = {119--127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thai1984'; type = 'Article'; bib = [ ... 
'author = {Thain, J. E.}, ' ... 
'year = {1984}, ' ...
'title = {Effects of mercury on the prosobranch mollusc \emph{Crepidula fornicata}: acute lethal toxicity and effects on growth and reproduction of chronic exposure}, ' ...
'journal = {Marine Environmental Research}, ' ...
'volume = {12}, ' ...
'pages = {285--309}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeslHera1986'; type = 'Article'; bib = [ ... 
'author = {Deslou-Paoli, J. M. and Heral, M.}, ' ... 
'year = {1986}, ' ...
'title = {\emph{Crepidula fornicata} ({L}.) ({G}astropoda, {C}alyptraeidae) in the {B}ay of {M}arennes-{O}leron: {B}iochemical composition and energy value of individuals and spawning}, ' ...
'journal = {Oceanologica Acta}, ' ...
'volume = {9}, ' ...
'pages = {305--311}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HenrColl2010'; type = 'Article'; bib = [ ... 
'author = {Henry, J. J. and Collin, R. and Perry, K. J.}, ' ... 
'year = {2010}, ' ...
'title = {The Slipper Snail, \emph{Crepidula}: {A}n Emerging Lophotrochozoan Model System}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {218}, ' ...
'pages = {211--229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartThou2006'; type = 'Article'; bib = [ ... 
'author = {Martin, S. and Thouzeau, G. and Chauvaud, L. and Jean, F. and Guerin, L. and Clavier, J.}, ' ... 
'year = {2006}, ' ...
'title = {Respiration, calcification, and excretion of the invasive slipper limpet, \emph{Crepidula fornicata} {L}.: {I}mplications for carbon, carbonate, and nitrogen fluxes in affected areas}, ' ...
'journal = {Limnol. Oceanogr.}, ' ...
'volume = {5}, ' ...
'pages = {1996--2007}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
