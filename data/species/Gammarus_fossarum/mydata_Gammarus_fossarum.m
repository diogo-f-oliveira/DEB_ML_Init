function [data, auxData, metaData, txtData, weights] = mydata_Gammarus_fossarum

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Gammaridae';
metaData.species    = 'Gammarus_fossarum'; 
metaData.species_en = 'Freshwater shrimp'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'T-ap'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs'};    
metaData.date_subm = [2011 04 12];              
metaData.email    = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data

data.ab = 40.3;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Poeckl1990';   
  temp.ab = C2K(10.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 96;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Poeckl2003';
  temp.tp = C2K(20.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 630;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Poeckl2003';   
  temp.am = C2K(10.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 comment.am = 'computed maximum life span for river Fischa';

data.Lb  = 0.12;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Poeckl1995';
data.Lp  = 0.81;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Poeckl1992';
data.Li  = 1.47;units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Poeckl1995';
 comment.Li = 'value for females calculated from wet weight and empirical regression'; 
 comment.Lp = 'value for females calculated from wet weight and empirical regression';

data.Wwb = 0.078;units.Wwb = 'mg';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Poeckl1995';
data.Wwp = 9;    units.Wwp = 'mg';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Poeckl1992';
data.Wwi = 40.9;   units.Wwi = 'mg';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Poeckl1992';  
 
data.Ri  = 59/62; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Poeckl1993';   
  temp.Ri = C2K(7.9);   
  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mean egg number per clutch for 58 mg wet weight animals / brood development time at 7.9 C ';
% uni-variate data

% t-W data
data.tW_f = [ ... % time since birth (d), wet weight (mg)
0	0.00
30	0.75
61	1.32
91	2.83
121	4.53
153	8.11
181	15.09
212	22.08
243	29.43
272	36.23
302	39.81
332	41.51
361	42.08
392	42.83
420	43.21
451	43.77    ];
units.tW_f   = {'d', 'mg'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(16.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Poeckl1995';
%
data.tW_m = [ ... % time since birth (d), wet weight (mg)
0	0.00
31	0.94
61	1.70
91	3.02
121	4.91
138	4.34
152	11.13
182	22.26
212	34.34
242	44.53
273	52.83
302	55.85
332	58.68
361	60.00
392	61.13
420	62.26   ];
units.tW_m   = {'d', 'mg'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(16.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Poeckl1995';


% t-W data
data.tW_f2 = [ ... % time since birth (d), wet weight (mg)
0	0.20
28	1.00
59	2.81
91	5.02
120	10.44
151	20.28
179	31.73
210	35.54
241	37.75
271	39.16
301	40.36
329	40.96
360	41.37
390	41.16
420	41.57
450	42.17
];
units.tW_f2   = {'d', 'mg'};  label.tW_f2 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f2    = C2K(20.2);  units.temp.tW_f2 = 'K'; label.temp.tW_f2 = 'temperature';
bibkey.tW_f2 = 'Poeckl1995';

%
data.tW_m2 = [ ... % time since birth (d), wet weight (mg)
0	0.20
29	1.21
59	3.01
90	6.43
121	19.08
152	35.74
179	46.99
210	54.62
241	57.43
272	59.64
301	61.85
331	63.05
360	63.45
391	65.06
419	65.66
449	65.66
];
units.tW_m2   = {'d', 'mg'};  label.tW_m2 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m2    = C2K(20.2);  units.temp.tW_m2 = 'K'; label.temp.tW_m2 = 'temperature';
bibkey.tW_m2 = 'Poeckl1995';


data.tW_f3 = [ ... % time since birth (d), wet weight (mg)
0	0.00
61	0.19
123	0.97
184	1.17
243	1.95
303	3.70
363	8.17
420	19.07
];
units.tW_f3   = {'d', 'mg'};  label.tW_f3 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f3    = C2K(7.9);  units.temp.tW_f3 = 'K'; label.temp.tW_f3 = 'temperature';
bibkey.tW_f3 = 'Poeckl1995';

%
data.tW_m3 = [ ... % time since birth (d), wet weight (mg)
0	0.00
61	0.19
123	0.97
184	1.17
243	1.95
303	3.70
362	16.34
421	35.02
];
units.tW_m3   = {'d', 'mg'};  label.tW_m3 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m3    = C2K(7.9);  units.temp.tW_m3 = 'K'; label.temp.tW_m3 = 'temperature';
bibkey.tW_m3 = 'Poeckl1995';

% t-W data
data.tW_f = [ ... % time since birth (d), wet weight (mg)
0	0.00
30	0.75
61	1.32
91	2.83
121	4.53
153	8.11
181	15.09
212	22.08
243	29.43
272	36.23
302	39.81
332	41.51
361	42.08
392	42.83
420	43.21
451	43.77    ];
units.tW_f   = {'d', 'mg'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(16.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Poeckl1995';
%
data.tW_m = [ ... % time since birth (d), wet weight (mg)
0	0.00
31	0.94
61	1.70
91	3.02
121	4.91
138	4.34
152	11.13
182	22.26
212	34.34
242	44.53
273	52.83
302	55.85
332	58.68
361	60.00
392	61.13
420	62.26   ];
units.tW_m   = {'d', 'mg'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(16.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Poeckl1995';


% t-W data
data.tW_f4 = [ ... % time since birth (d), wet weight (mg)
0	0.00
30	0.00
61	0.59
92	0.79
121	0.98
152	1.97
182	2.95
212	4.13
242	7.68
273	12.01
302	21.06
331	25.20
361	29.72
392	31.89
421	34.84
452	36.81
];
units.tW_f4   = {'d', 'mg'};  label.tW_f4 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f4    = C2K(12.1);  units.temp.tW_f4 = 'K'; label.temp.tW_f4 = 'temperature';
bibkey.tW_f4 = 'Poeckl1995';

%
data.tW_m4 = [ ... % time since birth (d), wet weight (mg)
0	0.00
30	0.00
61	0.59
91	0.98
121	1.38
152	1.97
182	3.54
212	6.30
243	12.99
272	20.47
302	29.13
332	37.60
362	45.08
392	50.39
421	53.15
451	55.71
];
units.tW_m4   = {'d', 'mg'};  label.tW_m4 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m4    = C2K(12.1);  units.temp.tW_m4 = 'K'; label.temp.tW_m4 = 'temperature';
bibkey.tW_m4 = 'Poeckl1995';


data.Tap = [ ... % temperature (C), time (d)
7.9 335
12 214
16.1 127
20.2 96];
units.Tap   = {'C', 'd'};  label.Tap = {'temperature', 'maturation time'};  
bibkey.Tap = 'Poeckl1992';

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

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for 16 C'};
set2 = {'tW_f2','tW_m2'}; subtitle2 = {'Data for 20 C'};
set3 = {'tW_f3','tW_m3'}; subtitle3 = {'Data for 8 C'};
set4 = {'tW_f4','tW_m4'}; subtitle4 = {'Data for 12 C'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3F8C6'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4248761'; % Ency of Life
metaData.links.id_Wiki = 'Gammarus'; % Wikipedia
metaData.links.id_ADW = 'Gammarus'; % ADW
metaData.links.id_Taxo = '660976'; % Taxonomicon
metaData.links.id_WoRMS = '478934'; % WoRMS

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
'author = {Poeckl, M}, ' ... 
'year = {1992}, ' ...
'title = {Effects of temperature, age and body size on moulting and growth in the freshwater amphipods \emph{Gammarus fossarum} and \emph{G. roeseli}}, ' ...
'journal = {Freshwater Biology}, ' ...
'doi = {10.1111/j.1365-2427.1992.tb00534.x}, ' ...
'volume = {27}, ' ...
'pages = {211-225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poeckl1990'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M. and Humpesch, U. H.}, ' ... 
'year = {1990}, ' ...
'title = {Intra- and inter-specific variations in egg survival and brood development time for {A}ustrian populations of \emph{Gammarus fossarum} and \emph{G. roeseli} ({C}rustacea: {A}mphipoda}, ' ...
'journal = {Freshwater Biology}, ' ...
'volume = {23}, ' ...
'pages = {441-455}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poeckl1993'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M}, ' ... 
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
'volume = {48}, ' ...
'pages = {53-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poeckl1995'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M.}, ' ... 
'year = {1995}, ' ...
'title = {Laboratory studies on growth, feeding, moulting and mortality in the freshwater amphipods \emph{Gammarus fossarum} and \emph{G. roeseli}}, ' ...
'journal = {Archiv fuer Hydrobiologie}, ' ...
'volume = {134}, ' ...
'pages = {223-253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


