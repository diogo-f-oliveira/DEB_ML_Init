function [data, auxData, metaData, txtData, weights] = mydata_Gammarus_roeselii

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Gammaridae';
metaData.species    = 'Gammarus_roeselii'; 
metaData.species_en = 'Freshwater shrimp'; 

metaData.ecoCode.climate = {'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_T'; 'T-ap'; 'T-ab'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs'};    
metaData.date_subm = [2016 04 12];              
metaData.email    = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Andre Gergs'};    
metaData.date_mod_2 = [2017 08 02];              
metaData.email_mod_2    = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address_mod_2  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany'}; 

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 03 30];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data 
data.ab = 11.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'PoecHump1990';   
  temp.ab = C2K(20.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 204;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Poeckl1992';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 570;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Poeckl2003';   
  temp.am = C2K(10.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 comment.am = 'computed maximum life span for river Fischa';

data.Lb  = 0.152; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Poeckl1992';
data.Lp  = 0.68; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Poeckl1992';
 comment.Lp = 'value for females';
data.Li  = 1.204; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Poeckl1992';
 comment.Li = 'value for females'; 
 
data.Wwb = 0.123; units.Wwb = 'mg';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Poeckl1992';
data.Wwp = 10; units.Wwp = 'mg';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Poeckl1992';
data.Wwi = 59.1; units.Wwi = 'mg';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Poeckl1992';
  
data.Ri  = 62.7/11.5;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Poeckl1993';   
  temp.Ri = C2K(20.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mean egg number per clutch for 60.0 mg wet weight animals derived from regression / age at birth (PoecHump1990)';  

% uni-variate data

% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (mg)
2	0.00
32	0.54
62	1.63
92	4.53
123	9.06
151	17.57
181	26.81
211	36.05
239	45.47
270	50.91
300	53.99
331	57.61
361	57.97
391	58.70
420	58.70
450	59.60];
units.tW_f   = {'d', 'mg'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(16.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Poeckl1995';
%
data.tW_m = [ ... % time since birth (d), wet weight (mg)
2	0.00
32	0.54
62	1.81
92	4.71
123	12.14
151	24.82
181	35.14
211	48.37
239	60.87
270	71.38
301	82.25
332	85.33
361	87.32
392	88.59
420	89.13
451	89.86];
units.tW_m   = {'d', 'mg'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(16.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Poeckl1995';
%
data.tW_f2 = [ ... % time since birth (d), wet weight (mg)
2	0.18
32	1.45
62	4.35
93	12.14
122	26.63
151	40.76
181	50.00
212	54.35
241	56.70
271	57.79
301	58.88
331	59.42
362	60.14
392	58.70
421	59.24
451	60.51];
units.tW_f2   = {'d', 'mg'};  label.tW_f2 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f2    = C2K(20.2);  units.temp.tW_f2 = 'K'; label.temp.tW_f2 = 'temperature';
bibkey.tW_f2 = 'Poeckl1995';
%
data.tW_m2 = [ ... % time since birth (d), wet weight (mg)
2	0.36
31	1.81
62	5.07
93	14.86
122	33.51
153	50.00
181	66.12
212	76.63
242	81.34
272	84.24
303	85.33
332	86.23
363	86.23
392	85.87
422	86.96
452	87.32];
units.tW_m2   = {'d', 'mg'};  label.tW_m2 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m2    = C2K(20.2);  units.temp.tW_m2 = 'K'; label.temp.tW_m2 = 'temperature';
bibkey.tW_m2 = 'Poeckl1995';
%
data.tW_f3 = [ ... % time since birth (d), wet weight (mg)
0	0.00
57	0.73
119	1.28
179	2.01
239	2.93
299	4.75
358	6.40
419	15.54];
units.tW_f3   = {'d', 'mg'};  label.tW_f3 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f3    = C2K(7.9);  units.temp.tW_f3 = 'K'; label.temp.tW_f3 = 'temperature';
bibkey.tW_f3 = 'Poeckl1995';
%
data.tW_m3 = [ ... % time since birth (d), wet weight (mg)
0	0.00
58	0.91
119	1.28
179	1.83
240	3.11
298	4.57
358	5.30
419	20.66];
units.tW_m3   = {'d', 'mg'};  label.tW_m3 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m3    = C2K(7.9);  units.temp.tW_m3 = 'K'; label.temp.tW_m3 = 'temperature';
bibkey.tW_m3 = 'Poeckl1995';
% 
data.tW_f4 = [ ... % time since birth (d), wet weight (mg)
1	0.00
31	0.77
61	0.96
92	1.54
123	2.11
152	3.46
181	5.57
212	10.94
241	18.81
271	25.72
303	32.44
333	40.12
363	46.45
393	50.29
422	52.98
452	54.32];
units.tW_f4   = {'d', 'mg'};  label.tW_f4 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f4    = C2K(12.1);  units.temp.tW_f4 = 'K'; label.temp.tW_f4 = 'temperature';
bibkey.tW_f4 = 'Poeckl1995';
%
data.tW_m4 = [ ... % time since birth (d), wet weight (mg)
0	0.00
31	0.58
62	1.15
93	1.73
122	2.69
152	3.46
181	6.14
212	11.32
241	24.38
271	35.51
302	44.15
333	55.85
362	66.03
393	75.62
423	79.85
453	81.96];
units.tW_m4   = {'d', 'mg'};  label.tW_m4 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m4    = C2K(12.1);  units.temp.tW_m4 = 'K'; label.temp.tW_m4 = 'temperature';
bibkey.tW_m4 = 'Poeckl1995';

% temperature-time since birth at puberty
data.Tap = [ ... % temperature (C), time (d)
7.9 403
12 204
16.1 123
20.2 85];
units.Tap   = {'C', 'd'};  label.Tap = {'temperature', 'time since birth at puberty'};  
bibkey.Tap = 'Poeckl1992';

% temperature-age at birth
data.Tab = [ ... % temperature (C), time (d)
4.15	213.70
4.10	209.80
4.15	205.90
4.26	202.00
4.20	199.00
4.42	196.10
7.39	68.29
7.77	71.22
7.93	68.29
8.25	69.27
8.56	69.27
8.67	66.34
9.04	66.34
8.99	62.44
9.04	58.54
9.52	59.51
9.57	55.61
11.86	34.63
12.02	31.22
12.18	28.29
12.50	26.83
12.87	25.85
13.62	22.93
15.43	19.02
15.74	20.00
15.96	19.51
16.28	18.54
16.22	16.10
16.60	18.54
17.77	17.56
18.09	15.61
18.46	15.12
18.19	15.12
18.72	12.68
19.15	12.68
19.20	9.76
19.63	13.66
19.73	11.22
20.05	10.24
23.67	10.24
23.88	8.78
24.20	7.81
24.36	6.34];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'PoecHump1990';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f*3;
weights.tW_m = weights.tW_m*3;
weights.tW_f2 = weights.tW_f2*3;
weights.tW_m2 = weights.tW_m2*3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for 16 C'};
set2 = {'tW_f2','tW_m2'}; subtitle2 = {'Data for 20 C'};
set3 = {'tW_f3','tW_m3'}; subtitle3 = {'Data for 8 C'};
set4 = {'tW_f4','tW_m4'}; subtitle4 = {'Data for 12 C'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_3: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3F8K3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4248762'; % Ency of Life
metaData.links.id_Wiki = 'Gammarus_roeselii'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '660980'; % Taxonomicon
metaData.links.id_WoRMS = '478923'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poeckl1992'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M.}, ' ... 
'year = {1992}, ' ...
'title = {Effects of temperature, age and body size on moulting and growth in the freshwater amphipods \emph{Gammarus fossarum} and \emph{G. roeseli}}, ' ...
'journal = {Freshwater Biology}, ' ...
'doi = {10.1111/j.1365-2427.1992.tb00534.x}, ' ...
'volume = {27}, ' ...
'pages = {211-225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poeckl1993'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M.}, ' ... 
'year = {1993}, ' ...
'title = {Reproductive potential and lifetime potential fecundity of the freshwater amphipods \emph{Gammarus fossarum} and \emph{G.roeseli} in {A}ustrian streams and rivers}, ' ...
'journal = {Freshwater Biology}, ' ...
'doi = {10.1111/j.1365-2427.1992.tb00534.x}, ' ...
'volume = {30}, ' ...
'pages = {73-91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poeckl2003'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M. and Webb, B. W. and Sutcliffe, D. W.}, ' ... 
'year = {2003}, ' ...
'title = {Life history and reproductive capacity of \emph{Gammarus fossarum} and \emph{G. roeseli} ({C}rustacea: {A}mphipoda) under naturally fluctuating water temperatures: a simulation study}, ' ...
'journal = {Freshwater Biology}, ' ...
'doi = {}, ' ...
'volume = {48}, ' ...
'pages = {53-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poeckl1995'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M.}, ' ... 
'year = {1995}, ' ...
'title = {Laboratory studies on growth, feeding, moulting and mortality in the freshwater amphipods  \emph{Gammarus fossarum} and \emph{G. roeseli}}, ' ...
'journal = {Archiv fuer Hydrobiologie}, ' ...
'doi = {}, ' ...
'volume = {134}, ' ...
'pages = {223-253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoecHump1990'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M. and Humpesch, U. H.}, ' ... 
'year = {1990}, ' ...
'title = {Intra- and inter-specific variations in egg survival and brood development time for {A}ustrian populations of \emph{Gammarus fossarum} and \emph{G. roeseli} ({C}rustacea: {A}mphipoda)}, ' ...
'journal = {Freshwater Biology}, ' ...
'doi = {}, ' ...
'volume = {23}, ' ...
'pages = {441-455}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


