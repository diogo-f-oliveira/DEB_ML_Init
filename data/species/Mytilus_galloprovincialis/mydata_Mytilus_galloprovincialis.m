function [data, auxData, metaData, txtData, weights] = mydata_Mytilus_galloprovincialis

%% set metaData

metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Mytilus_galloprovincialis'; 
metaData.species_en = 'Mediterranean mussel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm', 'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Da'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'T-JO'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Valeria Montalto'; 'Alessandro Rinaldi'; 'Gianluca Sara'};   
metaData.date_subm = [2014 01 05];           
metaData.email    = {'montaltovaleria@gmail.com'};  
metaData.address  = {'University of Palermo, Italy'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 12 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Cristian Monaco'; 'Starrlight Augustine'};   
metaData.date_mod_2 = [2017 04 13];           
metaData.email_mod_2    = {'cristianmonaco@gmail.com'};  
metaData.address_mod_2  = {'Rhodes university, South Africa'}; 

metaData.author_mod_3   = {'Cristian Monaco'};   
metaData.date_mod_3 = [2018 09 17];           
metaData.email_mod_3    = {'cristianmonaco@gmail.com'};  
metaData.address_mod_3  = {'Rhodes university, South Africa'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 17]; 


%% set data

% zero-variate data

data.ab = 1;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SancMart2012';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 27;      units.aj = 'd';    label.aj = 'time since birth at metam'; bibkey.aj = 'SancMart2012';   
  temp.aj = C2K(17);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 210;    units.ap = 'd';    label.ap = 'time since birth at puberty'; bibkey.ap = 'CeccRoss1984';
  temp.ap = C2K(20);  units.temp.ap = 'K'; label.temp.ap = 'temperature';  
data.am = 12 * 365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Zaik1970';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0100; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'SancMart2012';
data.Lj  = 0.0272; units.Lj  = 'cm';  label.Lj  = 'shell length at metam';   bibkey.Lj  = 'SancMart2012';
data.Lp  = 3.0;  units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'CeccRoss1984';    
data.Li  = 15;    units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Harb1997';

data.Wwb = 2.69e-8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on .03693*Lb^3 from HareKooy1993';
data.Wwp = 0.81;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Mont2014';
data.Wwi = 25.75; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Mont2014';

data.GSI_f  = 1.5; units.GSI_f  = '-'; label.GSI_f  = 'gonado somatic index';    bibkey.GSI_f  = 'ErkoGrif1991';   
  temp.GSI_f = C2K(20); units.temp.GSI_f = 'K'; label.temp.GSI_f = 'temperature';
  comment.GSI_f = 'Gonad dry weight over soma dry weight. For a 65mm mussel (Fig. 5). Mean anual temp from www.seatemperature.org';
    
% uni-variate data

% time - length Subtidal Ancona (Italy)
data.tL_subt =   [ ...    % time since settlement (years), shell length (mm)
    0.5	28.2
    0.5	20.21
    0.5	17.37
    0.5	19.99
    0.5	20
    0.5	19.28
    0.5	17.13
    0.5	16.83
    0.5	17.91
    0.5	18.27
    0.5	17.26
    0.5	18.01
    1	46.3
    1	54.37
    1	58.92
    1	47.94
    1	44.09
    1	43.79
    1	44.34
    1	49.18
    1	45.63
    1	47.2
    1	46.78
    1	43.36
    1	46.53
    1	48.54
    1	45.32
    1	34.96
    1	28.33
    1	31.98
    2	67.99
    2	67.92
    2	66.51
    2	58.24
    2	54.9
    2	56.08
    2	61.62
    2	61.64
    2	59.84
    2	56.41
    2	53.88
    2	59.86
    2	58.51
    2	58.91
    2	69.88
    2	54.16
    2	57.01
    2	52.29
    2	56.44
    2	50
    2	51.16
    2	55.36
    2	54.48
    2	56.47
    2	59.64
    2	60.27
    2	54.29
    2	55.98
    2	58.56
    2	51.1
    2	59.76
    2	56.27
    2	54.08
    2	59.95
    2	59.15
    2	51.86
    3	64.56
    3	74.88
    3	74.84
    3	68.06
    3	67.75
    3	67.28
    3	62.81
    3	66.5
    3	65.63
    3	60.54
    3	71.68
    3	66.31
    3	60.77
    3	64.07
    3	60.41
    3	63.24
    3	63.1
    3	66.54
    3	61
    3	62.59
    3	61.42
    3	71.12
    3	63.36
    3	72.23
    3	63.02
    3	69.75
    3	62.9
    3	66.19
    3	61.35
    3	70.83
    3	64.01
    3	60.64
    3	70.11
    3	67.69];
data.tL_subt(:,1)  = data.tL_subt(:,1) * 365;  % convert time to d
data.tL_subt(:,2)  = data.tL_subt(:,2) / 10;  % convert shell length to cm
units.tL_subt   = {'d', 'cm'};  label.tL_subt = {'time since settlement', 'shell length'};  
temp.tL_subt    = C2K(20);  units.temp.tL_subt = 'K'; label.temp.tL_subt = 'temperature';
bibkey.tL_subt = 'Sara2016';
comment.tL_subt = 'Subtidal population Ancona, Italy. Mean anual temp from www.seatemperature.org';

% length - weight
data.LW = [ ...     % shell length (mm), soma wet weight (g)
    28.2	0.25
    20.21	0.15
    17.37	0.1
    19.99	0.13
    20	0.13
    19.28	0.11
    17.13	0.09
    16.83	0.09
    17.91	0.1
    18.27	0.11
    17.26	0.08
    18.01	0.1
    35.61	0.68
    38.69	0.89
    40.06	0.9
    38.06	0.98
    31.97	0.49
    42.89	0.93
    33.02	0.57
    35.98	0.98
    29.74	0.62
    35.18	0.56
    30.46	0.56
    28.45	0.4
    32.74	0.53
    36.85	0.84
    33.72	0.65
    33.03	0.69
    40.4	0.92
    33.88	0.85
    33.93	0.5
    35.31	0.92
    36.14	0.65
    30.27	0.49
    37.99	0.77
    35.92	0.81
    32.89	0.73
    34.02	0.63
    32.48	0.52
    37.69	0.81
    37.81	0.87
    36.13	0.64
    37.29	1.09
    37.05	0.88
    37.55	0.82
    35.27	0.72
    29.13	0.57
    26.09	0.4
    25.14	0.34
    39.64	0.7
    36.31	0.82
    32.87	0.67
    31.41	0.71
    34.1	0.67
    28.16	0.45
    26.24	0.31
    46.3	1.14
    54.37	1.76
    58.92	3.17
    47.94	1.31
    44.09	1.07
    43.79	1.07
    44.34	0.81
    49.18	1.49
    45.63	1.25
    47.2	1.31
    46.78	1.3
    43.36	0.96
    46.53	1.04
    48.54	1.39
    45.32	0.63
    34.96	0.57
    28.33	0.41
    31.98	0.45
    37.38	0.79
    49.38	1.43
    40.68	1.28
    47.15	1.31
    48.08	1.76
    51.28	1.8
    37.02	0.95
    43.92	1.17
    45.2	1.29
    41.9	1.14
    40.09	0.83
    43.28	1.08
    52.79	2.19
    41.82	1.11
    46.44	1.37
    45.47	1.65
    49.87	1.45
    52.64	1.98
    55.02	2.06
    40.21	1.43
    41.03	0.96
    43.32	1.12
    47.14	1.48
    50.45	1.65
    32.01	0.68
    48.07	1.43
    40.46	0.85
    42.78	1.4
    42.03	0.97
    52.37	1.82
    47.86	1.87
    52.29	2.21
    48.21	1.43
    49.28	1.76
    34.69	0.85
    38.64	1.04
    39.02	1.09
    41.35	1
    43.02	0.94
    38.49	1.1
    36.19	0.78
    42.77	1.22
    34.36	0.64
    40.93	1.2
    28.23	0.39
    30.5	0.57
    41.61	1.09
    67.99	3.46
    67.92	3.75
    66.51	3.83
    58.24	2.23
    54.9	1.86
    56.08	2.25
    61.62	2.18
    61.64	2.61
    59.84	2.23
    56.41	2.83
    53.88	1.89
    59.86	2.35
    58.51	2.02
    58.91	2.49
    69.88	3.17
    54.16	1.83
    57.01	2.2
    52.29	2.2
    56.44	1.87
    50	1.55
    51.16	1.56
    55.36	2.44
    54.48	1.88
    56.47	1.71
    59.64	2.82
    60.27	2.11
    54.29	1.68
    55.98	1.66
    58.56	2.2
    51.1	1.68
    59.76	2.18
    56.27	1.88
    54.08	1.75
    59.95	2.07
    59.15	3.23
    51.86	1.6
    54.94	2.23
    55.44	2
    56.85	2.53
    53.48	2.44
    58.33	2.65
    54.27	1.8
    43.89	1.72
    59.2	2.35
    56.69	2.4
    64.56	3.1
    74.88	4.6
    74.84	4.67
    68.06	4.05
    67.75	4.1
    67.28	3.34
    62.81	2.53
    66.5	3.37
    65.63	2.43
    60.54	3.06
    71.68	6.65
    66.31	3.53
    60.77	2.57
    64.07	2.71
    60.41	2.38
    63.24	2.6
    63.1	2.44
    66.54	3.03
    61	2.89
    62.59	3.54
    61.42	2.64
    71.12	4.02
    63.36	2.69
    72.23	3.58
    63.02	2.72
    69.75	2.9
    62.9	3.5
    66.19	3.16
    61.35	1.93
    70.83	3.91
    64.01	2.84
    60.64	2.23
    70.11	3.87
    67.69	5.04];
data.LW(:,1)  = data.LW(:,1) / 10;  % convert shell length to cm
units.LW   = {'cm', 'g'};  label.LW = {'shell length (cm)', 'soma wet weight (g)'};  
comment.LW = 'data collected using individuals from Ancona both subtidal and intertidal';
bibkey.LW = 'Sara2016';

% temperature - specific respiration data water
data.TjOw = [ ... % temperature (C), specific O_2 consumption (ml/h.g dry weight)
9	1.214126051
9	1.626816259
18	0.546682103
18	1.036445771
18	1.342022008
18	0.666236881
27	2.259257701
27	1.948042009
27	2.574325257
27	2.794322729
36	2.177588214
36	0.759772023
36	2.297565896
36	1.236573233];
units.TjOw  = {'C', 'ml/h.g'};  label.TjOw = {'temperature', 'specific O_2 consumption'};  
bibkey.TjOw = 'Tagl2015';

%% set weights for all real data
weights = setweights(data, []);
weights.Lj = 0 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 0 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'An eariler version of this entry was discussed in SaraRina2012';
metaData.bibkey.F1 = 'SaraRina2012'; 
metaData.facts = struct('F1',F1);

%% Discussion
D1 = 'mod_3: The data were revised both in terms of source as well as in type. mod_3 includes growth from subtidal population Ancona, Italy as well as specific respiration data. Parameters are not very different from mod_2.';
D2 = 'mod_3: Gonado-somatic index is computed assuming 1 year accumulation in the buffer and constant food.';
D3 = 'mod_3: Separate shape coefficient for length at birth and wet weight at birth is guessed based on an estimate for the wet weight at birth of Mytilus edulis.';
metaData.discussion = struct('D1',D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '45GN2'; % Cat of Life
metaData.links.id_ITIS = '79456'; % ITIS
metaData.links.id_EoL = '46466841'; % Ency of Life
metaData.links.id_Wiki = 'Mytilus_galloprovincialis'; % Wikipedia
metaData.links.id_ADW = 'Mytilus_galloprovincialis'; % ADW
metaData.links.id_Taxo = '39227'; % Taxonomicon
metaData.links.id_WoRMS = '140481'; % WoRMS
metaData.links.id_molluscabase = '140481'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mytilus_galloprovincialis}}';
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
bibkey = 'SaraRina2012'; type = 'Article'; bib = [ ... 
'author = {Sara, G. and Reid, G. and Rinaldi, A. and Palmeri, V. and Troell, M. and Kooijman, S. A. L. M.}, ' ... 
'year = {2012}, ' ...
'title = {Growth and reproduction simulation of candidate shellfish species at fish cages in the southern mediterranean: {D}ynamic {E}nergy {B}udget ({D}{E}{B}) modelling for integrated multi-trophic aquaculture}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {324-325}, ' ...
'doi = {10.1016/j.aquaculture.2011.10.042}, ' ... 
'pages = {259--266}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sara2016'; type = 'Misc'; bib = [ ... 
'author = {Sara}, ' ... 
'year = {2106}, ' ...
'note = {Orgininal data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SancMart2012'; type = 'Article'; bib = [ ... 
'author = {C. S\''{a}nchez-Lazo and I. Mart\''{i}nez-Pita}, ' ... 
'year = {2012}, ' ...
'title = {Effect of temperature on survival, growth and development of \emph{Mytilus galloprovincialis} larvae}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {43}, ' ...
'doi = {10.1111/j.1365-2109.2011.02916.x }, ' ...
'pages = {1127--1133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CeccRoss1984'; type = 'Article'; bib = [ ...
'author = {Ceccherelli, V. U. and Rossi, R.},'...
'year = {1984}, ' ...
'title = {Settlement, growth and production of the mussel \emph{Mytilus galloprovincialis}}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {16}, ' ...
'doi = {10.3354/meps016173 }, ' ...
'pages = {173-184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harb1997'; type = 'book'; bib = [ ...  
'author = {R M Harbo}, ' ...
'year = {1997}, ' ...
'title  = {Shells and shellfish of the {P}acific {N}orthwest, a field guide}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tagl2015'; type = 'Article'; bib = [ ...
'author = {Morgana Tagliarolo, Christopher D. McQuaid}, ' ... 
'year = {2015}, ' ...
'title = {Sub-lethal and sub-specific temperature effects are better predictors of mussel distribution than thermal tolerance.}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {535}, ' ... 
'doi = {10.3354/meps11434 }, ' ... 
'pages = {145-159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErkoGrif1991'; type = 'Article'; bib = [ ...
'author = {C. Van Erkom Schurink, C.L. Griffiths},'...
'year = {1991},' ...
'title = {A comparison of reproductive cycles and reproductive output in four southern {A}frican mussel species}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {76}, ' ...
'doi = {10.3354/meps076123}, ' ...
'pages = {123-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zaik1970'; type = 'Article'; bib = [ ...
'author = {V Y Zaika},'...
'year = {1970}, ' ...
'title = {Relationship between the productivity of marine mollusks and their life span}, ' ...
'journal = {Oceanology}, ' ...
'volume = {10}, ' ...
'pages = {547-552}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HareKooy1993'; type = 'Article'; bib = [ ... 
'author = {Haren, R. van and Kooijman, S. A. L. M.}, ' ... 
'year = {1993}, ' ...
'title = {Application of a {D}ynamic {E}nergy {B}udget model to \emph{Mytilus edulis} ({L}.)}, ' ...
'journal = {Neth. J. Sea Res.}, ' ...
'volume = {31}, ' ...
'doi  = {10.1016/0077-7579(93)90002-a}, '...
'pages = {119-133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mont2014'; type = 'Misc'; bib = [ ... 
'author = {Valeria Montalto}, ' ... 
'year = {2104}, ' ...
'note = {Orgininal data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
