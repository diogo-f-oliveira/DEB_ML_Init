function [data, auxData, metaData, txtData, weights] = mydata_Nezara_viridula

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Pentatomidae';
metaData.species    = 'Nezara_viridula'; 
metaData.species_en = 'Southern green stink bug'; 

metaData.ecoCode.climate = {'A','C'};
metaData.ecoCode.ecozone = {'TH','TN','TP','TA','TO'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHe'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'tp'; 'am'; 'astar'; 'Lhb'; 'Wwb'; 'Wwp'; 'Ri'}; 
metaData.data_1     = {'T-astar'; 'T-ab'; 'T-dL'; 't-L_f'; 't-Ww_f'; 't-N_f'; 't-S'};

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Evridiki Klagkou','Andre Gergs','Christian Baden','Dina Lika'};    
metaData.date_subm = [2024 01 18];              
metaData.email_mod_1    = {'lika@uoc.gr'};            
metaData.address_mod_1  = {'University of Crete, UoC'};    

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 01 26];

%% set data
% zero-variate data
data.ab = 6;  units.ab = 'd'; label.ab = 'age at birth';  bibkey.ab ='Kari1961';
    temp.ab = C2K(25); units.temp.ab = 'K';  label.temp.ab = 'temperature';
data.tp = 34;    units.tp = 'd';    label.tp = 'time at puberty';  bibkey.tp = 'Kari1961';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 75;    units.am = 'd';    label.am = 'life span as imago'; bibkey.am = 'FortMarg2006';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lhb  = 0.060; units.Lhb  = 'cm';  label.Lhb  = 'head length at birth';   bibkey.Lhb  = 'KlagGerg2024';
  comment.Lhb = 'head length of first instar';

data.Wwb = 0.47/1000; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'KlagGerg2024';
  comment.Wwb = ' wet weight at instar 1';
data.Wwp = 187/1000;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'FortMarg2006';

data.Ri = 470/37.2; units.Ri = '#/d'; label.Ri = 'reproduction rate'; bibkey.Ri = 'FortMarg2006';
    temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'Number of eggs/female/oviposition period';
    
data.t1 = 5.5; units.t1 = 'd'; label.t1 = 'duration of instar 1'; bibkey.t1 = 'AliEwie1977';   
  temp.t1 = C2K(25); units.temp.t1 = 'K'; label.temp.t1 = 'temperature'; 
data.t2 = 6.5; units.t2 = 'd'; label.t2 = 'duration of instar 2'; bibkey.t2 = 'AliEwie1977';   
  temp.t2 = C2K(25); units.temp.t2 = 'K'; label.temp.t2 = 'temperature'; 
data.t3 = 7.5; units.t3 = 'd'; label.t3 = 'duration of instar 3'; bibkey.t3 = 'AliEwie1977';   
  temp.t3 = C2K(25); units.temp.t3 = 'K'; label.temp.t3 = 'temperature'; 
data.t4 = 7.8; units.t4 = 'd'; label.t4 = 'duration of instar 4'; bibkey.t4 = 'AliEwie1977';   
  temp.t4 = C2K(25); units.temp.t4 = 'K'; label.temp.t4 = 'temperature'; 
data.t5 = 8.8; units.t5 = 'd'; label.t5 = 'duration of instar 5'; bibkey.t5 = 'AliEwie1977';   
  temp.t5 = C2K(25); units.temp.t5 = 'K'; label.temp.t5 = 'temperature'; 
  
% uni variate data
% temperature-instat duration
data.Ttins = [ ... % temperature (C), duration of larval stage (d)
    20    58.4
    22.5  42.1
    25    34.2
    27.5  30.5
    30    23.2];
units.Ttins = {'C','d'}; label.Ttins = {'temperature', 'duration of larva'};
bibkey.Ttins = 'Kari1961';

% temperature-age at birth
data.Tab = [ ... % temperature (C), age at birth (d)
   18  16.7
   20  14.2
   22  10.5
   24  8.12
   26  7.1
   28  6.5];
units.Tab = {'C','d'}; label.Tab = {'temperature', 'age at birth'};
bibkey.Tab = 'KlagGerg2024';

% temperature-spec growth rate for embryo
data.Tr_embryo = [ ... % temperature(C), embryo growth rate (1/d)
    20   0.08
    22.5 0.13
    25   0.16
    27.5 0.16
    30   0.24];
units.Tr_embryo = {'C','1/d'}; label.Tr_embryo = {'temperature', 'embryo growth rate'};
bibkey.Tr_embryo = 'Kari1961';

% temperature-spec growth rate for larva
data.Tr_larva = [ ... % temperature(C), larva growth rate (1/d)
    20   0.018
    22.5 0.025
    25   0.029
    27.5 0.033
    30   0.043];
units.Tr_larva = {'C','1/d'}; label.Tr_larva = {'temperature', 'larva growth rate'};
bibkey.Tr_larva = 'Kari1961';

% time-length
tL_fB = [... % time since birth (d), headlength (mm) for different feeding schedules ad libitum: 100% (i.e. 24h/7days), diet1: 63%, diet2: 49%, diet3: 35% of the experiment time
    0  0.68  0.68  0.68  0.68
    1  0.68  0.68  0.68  0.68
    3  0.67  0.68  0.69  0.68
    6  0.95  0.95  0.95  0.98
    8  0.97  0.97  0.97  0.98
    10 1.40  0.95  0.98  1.15
    13 1.41  1.35  1.24  1.35
    16 1.97  1.55  1.26  1.37
    21 2.44  1.81  1.64  1.83
    23 2.70  2.18  1.77  1.91
    28 2.65  2.25  2.24  2.21
    30 2.68  2.32  2.32  2.30
    35 2.72  2.52  2.45  2.51 
    37 2.67  2.54  2.58  2.54
    42 NaN   2.33  NaN   2.61]; 
tL_fB(:,1) = tL_fB(:,1) + 1; % age of insect at day 0 of the experiment is approx 1 day.
tL_fB(:,2:5) = tL_fB(:,2:5)/ 10; % convert mm to  cm
notNaN = find(~isnan(tL_fB(:,2))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_fB1 = tL_fB(notNaN,[1,2]);
units.tL_fB1  = {'d', 'cm'};  label.tL_fB1 = {'time since birth', 'head length','1.00'};  
temp.tL_fB1 = C2K(24.5); units.temp.tL_fB1 = 'K'; label.temp.tL_fB1 = 'temperature';
bibkey.tL_fB1 = 'KlagGerg2024';
comment.tL_fB1  = 'Data for ad libitum: feeding 100 percent of the experiment duration';
%
notNaN = find(~isnan(tL_fB(:,3))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_fB2 = tL_fB(notNaN,[1,3]);
units.tL_fB2  = {'d', 'cm'};  label.tL_fB2 = {'time since birth', 'head length','0.63'};  
bibkey.tL_fB2 = 'KlagGerg2024';
comment.tL_fB2  = 'Data for diet1: feeding 63 percent of the experiment duration';
%
notNaN = find(~isnan(tL_fB(:,4))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_fB3 = tL_fB(notNaN,[1,4]);
units.tL_fB3  = {'d', 'cm'};  label.tL_fB3 = {'time since birth', 'head length','0.49'};  
bibkey.tL_fB3 = 'KlagGerg2024';
comment.tL_fB3  = 'Data for diet2: feeding 49 percent of the experiment duration';

notNaN = find(~isnan(tL_fB(:,5))); lastnotNaN = notNaN(end); % last non NaN value
data.tL_fB4 = tL_fB(notNaN,[1,5]);
units.tL_fB4  = {'d', 'cm'};  label.tL_fB4 = {'time since birth', 'head length','0.35'};  
bibkey.tL_fB4 = 'KlagGerg2024';
comment.tL_fB4  = 'Data for diet3: feeding 35 percent of the experiment duration';

% time-weight
tWw_fB = [... % time since birth (d), wet weight (mg) for different feeding
    0   0.470   0.470   0.470   0.470
    1   0.441   0.441   0.441   0.441
    3   0.812   0.760   0.777   0.781
    6   1.270   1.075   1.148   1.103
    8   2.992   2.342   2.225   2.127
    10  4.947   2.330   2.200   2.751
    13  12.056  6.385   3.548   4.672
    16  30.087  9.752   5.389   6.874
    21  58.750  23.769  18.893  19.316
    23  95.1550 29.921  23.425  17.533
    28  142.010 48.990  56.335  41.195
    30  128.130 63.832  76.740  47.573
    35  165.130 88.989  80.970  73.92
    37  149.170 96.950  102.690 77.02
    42  NaN     76.050  NaN     74.60]; 
tWw_fB(:,1) = tWw_fB(:,1) + 1; % age of insect at day 0 of the experiment is approx 1 day.
tWw_fB(:,2:5) = tWw_fB(:,2:5)/ 1000; % convert mg to  g
notNaN = find(~isnan(tWw_fB(:,2))); 
data.tWw_fB1 = tWw_fB(notNaN,[1,2]);
units.tWw_fB1  = {'d', 'g'};  label.tWw_fB1 = {'time since birth', 'wet weight','1.00'};  
bibkey.tWw_fB1 = 'KlagGerg2024';
comment.tWw_fB1  = 'Data for ad libitum: feeding 100 percent of the experiment duration';
%
notNaN = find(~isnan(tWw_fB(:,3))); 
data.tWw_fB2 = tWw_fB(notNaN,[1,3]);
units.tWw_fB2  = {'d', 'g'};  label.tWw_fB2 = {'time since birth', 'wet weight','0.63'};  
bibkey.tWw_fB2 = 'KlagGerg2024';
comment.tWw_fB2  = 'Data for diet1: feeding 63 percent of the experiment duration';
%
notNaN = find(~isnan(tWw_fB(:,4))); 
data.tWw_fB3 = tWw_fB(notNaN,[1,4]);
units.tWw_fB3  = {'d', 'g'};  label.tWw_fB3 = {'time since birth', 'wet weight','0.49'};  
bibkey.tWw_fB3 = 'KlagGerg2024';
comment.tWw_fB3  = 'Data for diet2: feeding 49 percent of the experiment duration';

notNaN = find(~isnan(tWw_fB(:,5))); 
data.tWw_fB4 = tWw_fB(notNaN,[1,5]);
units.tWw_fB4  = {'d', 'g'};  label.tWw_fB4 = {'time since birth', 'wet weight','0.35'};  
bibkey.tWw_fB4 = 'KlagGerg2024';
comment.tWw_fB4  = 'Data for diet3: feeding 35 percent of the experiment duration';

% time-cum no of eggs
data.tN_fB1 = [ % time since birth(d), cummulative # of eggs
    49 65
    51 80
    55 94
    56 133
    58 155
    59 162
    62 185
    64 220
    65 227
    70 286
    72 305
    73 326
    76 368
    77 377
    79 397
    80 409
    83 442
    85 448
    86 475
    90 518
    92 557
    93 587
    94 604];
units.tN_fB1  = {'d', '#'};  label.tN_fB1 = {'time since birth', '# of eggs','1.00'}; 
bibkey.tN_fB1 = 'KlagGerg2024';
comment.tN_fB1  = 'Data for ad libitum: feeding 100% of the experiment duration';
%
data.tN_fB2 = [ % time since birth(d), cummulative # of eggs
    49  6
    51  12
    55  23
    56  26
    58  39
    62  61
    65  75
    70  103
    72  110
    73  116
    76  140
    77  147
    79  148
    83  190
    85  203
    90  225
    92  262
    97  275
    99  286
    100 302];
units.tN_fB2  = {'d', '#'};  label.tN_fB2 = {'time since birth', '# of eggs','0.63'}; 
bibkey.tN_fB2 = 'KlagGerg2024';
comment.tN_fB2  = 'Data for diet1: feeding 63% of the experiment duration';
%
data.tN_fB3 = [ % time since birth(d), cummulative # of eggs
     51 30
     55 51
     58 103
     59 126
     65 144
     70 161
     72 207
     76 235
     79 272
     80 295
     86 331
     90 350
     93 382
     97 399];
units.tN_fB3  = {'d', '#'};  label.tN_fB3 = {'time since birth', '# of eggs','0.49'}; 
bibkey.tN_fB3 = 'KlagGerg2024';
comment.tN_fB3  = 'Data for diet2: feeding 49% of the experiment duration';
%
data.tN_fB4 = [ % time since birth(d), cummulative # of eggs
     58 55
     76 196
     87 204];
units.tN_fB4  = {'d', '#'};  label.tN_fB4 = {'time since birth', '# of eggs','0.35'}; 
bibkey.tN_fB4 = 'KlagGerg2024';
comment.tN_fB4  = 'Data for diet3: feeding 35% of the experiment duration';

% time-survival
data.tSN  = [ ... %time (C), nyphal survival rate(%)
    0.356 99.115
    4.184 90.689
    8.101 87.548
    10.148 85.755
    15.134 81.277
    17.181 78.604
    24.926 72.763];
data.tSN(:,2) = data.tSN(:,2)/100;
units.tSN = {'d', '-'};  label.tSN = {'time', 'nymphal survival rate'};
temp.tSN = C2K(23); units.temp.tSN = 'K'; label.temp.tSN = 'temperature';
bibkey.tSN = 'MediRoss2022';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;
weights.tN_fB1 = 3 * weights.tN_fB1;
weights.tN_fB2 = 3 * weights.tN_fB2;
weights.tN_fB3 = 3 * weights.tN_fB3;
weights.tN_fB4 = 3 * weights.tN_fB4;
weights.Ri = 3 * weights.Ri;
weights.Tab = 3 * weights.Tab;
weights.t1 = 3 * weights.t1;
weights.t2 = 3 * weights.t2;
weights.t3 = 3 * weights.t3;
weights.t4 = 3 * weights.t4;
weights.t5 = 3 * weights.t5;
weights.tSN = 3 * weights.tSN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.99; weights.psd.k = 0.1; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.kap_G = 5;
weights.psd.k_J = 0 * weights.psd.k_J;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fB1', 'tL_fB2', 'tL_fB3', 'tL_fB4'}; subtitle1 ={'KlagGerg2024 different diets'};
set2 = {'tWw_fB1', 'tWw_fB2', 'tWw_fB3', 'tWw_fB4'}; subtitle2 ={'KlagGerg2024 different diets'};
set3 = {'tN_fB1', 'tN_fB2', 'tN_fB3', 'tN_fB4'}; subtitle3 = {'KlagGerg2024 different diets'};
metaData.grp.sets = {set1,set2,set3};  
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};
txtData.label.sets = {'feeding as fraction of time','feeding as fraction of time','feeding as fraction of time'};

%% Discussion points
D1 = 'abp model also works well for this species';
D2 = 'Biological observations show that length at which stage transitions occur does not change much across different levels of food availability for many insect species.';
D3 = 'The selection of the mainenance ratio k=0.99 as pseudo-data, is based on the implied property of the model that when k=1, stage transitions occur at fixed structural length. This property aligns with observationsin D2';
D4 = 'First instar nymphs do not eat, they are modeled as non-feeding juvenile instead of embryo. This makes sbp model more general as not all insects have a non-feeding first instar.';
metaData.bibkey.D2 = {'JuckErba2017','BawaSong2020'};
metaData.bibkey.D4 = {'KlagGerg2024'};
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'During the first instar the nymph does not feed';
metaData.bibkey.F1 = {'PaniMene1989', 'PaniOliv1998'}; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'Version 2024/01/18 of this entry was financially supported by Bayer.';

%% Links
metaData.links.id_CoL = '63VD'; % Cat of Life
metaData.links.id_ITIS = '108925'; % ITIS
metaData.links.id_EoL = '608956'; % Ency of Life
metaData.links.id_Wiki = 'Nezara_viridula'; % Wikipedia
metaData.links.id_ADW = 'Nezara_viridula'; % ADW
metaData.links.id_Taxo = '18723'; % Taxonomicon

%% References
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KlagGerg2024'; type = 'Article'; bib = [ ... 
'author = {Klagkou, E. and Gergs, A. and Baden, C.U. and Lika, K.}, ' ... 
'year = {2024}, ' ...
'title = {Dynamic Energy Budget approach for modeling growth and reproduction of Neotropical stink bugs}, ' ...
'journal = {Ecol. Model.}, '...
'volume = { }, ' ...
'pages = { }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AliEwie1977'; type = 'Article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Ali, M. and Ewie, M.A.}, ' ...
'year = {1977}, ' ...
'title  = {Photoperiodic and  temperature effects on rate of development and  diapause in the green stink bug, \emph{Nezara viridula} L. ({H}eteroptera: {P}entatomidae)}, ' ...
'journal = {Z. Ang. Ent.}, ' ...
'volume = {84}, ' ...
'pages = {256-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FortMarg2006'; type = 'Article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Fortes, P. and Margo, S.R. and Panizzi, A.R. and Parra, J.R.P.}, ' ...
'year = {2006}, ' ...
'title  = {Development of a Dry Artificial Diet for \emph{Nezara viridula} ({L}.) and \emph{Euschistus heros} (Fabricius) ({H}eteroptera: {P}entatomidae)}, ' ...
'journal = {Neotropical Entomology}, ' ...
'volume = {35}, ' ...
'pages = {567-572}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kari1961'; type = 'Article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Hiromitu, Kariya, H.}, ' ...
'year = {1961}, ' ...
'title  = {Effect of Temperature on the Development and the Mortality of the Southern Green Stink Bug, \emph{Nezara viridula} and the Oriental Green Stink Bug, \emph{N. antennata}}, ' ...
'journal = {Japanese Journal of Applied Entomology and Zoology}, ' ...
'volume = {5}, ' ...
'pages = {191-196}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MediRoss2022'; type = 'Article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Medina, V. and Rosso, B.E. and Soria, M. and Gutkind, G.O. and Pagano, E.A. and Zavala, J.A.}, ' ...
'year = {2022}, ' ...
'title  = {Feeding on soybean crops changed gutbacteria diversity of the southern greenstinkbug (\emph{Nezara viridula}) and reducednegative effects of some associated bacteria}, ' ...
'journal = {Pest Mang Sci}, '...
'volume = {78}, ' ...
'pages = {4608-4617}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BawaSong2020'; type = 'Article'; bib = [ ... 
'author = {Bawa, M. and Songsermpong, S. and Kaewtapee, C. and Chanput W.},'...
'title = {Effect of Diet on the Growth Performance, Feed Conversion, and Nutrient Content of the House Cricket},'...
'journal = {J. Insect Sci.},'...
'year = {2020},'...
'volume = {20},'...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JuckErba2017'; type = 'Article'; bib = [ ... 
'author = {Jucker, C. and Erba, D. and Leonardi, M. G. and Lupi, D. and Savoldelli, S.},'...
'title = {Assessment of Vegetable and Fruit Substrates as Potential Rearing Media for \emph{Hermetia illucens} ({D}iptera: {S}tratiomyidae) Larvae},'...
'journal = {Environ. Entomol.},'...
'year = {2017},'...
'volume = {46},'...
'pages = {1415–1423}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaniMene1989'; type = 'Article'; bib = [ ... 
'author = {Panizzi, A. and Meneguim, M.},'...
'title = {Performance of nymphal and adult \emph{Nezara viridula} on selected alternate host plants},'...
'journal = {Entomol. exp. appl.}, '...
'year = {1989}, '...
'volume = {50}, '...
'pages = {215-223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaniOliv1998'; type = 'Article'; bib = [ ... 
'author = {Panizzi, A. and Oliveira, E.},'...
'title = {Performance and seasonal abundance of the {N}eotropical brown stink bug, \textit{Euschistus heros} nymphs and adults on a novel food plant (pigeonpea) and soybean},'...
'journal = {Entomol. Exp. Appl.}, '...
'year = {1998}, '...
'volume = {88}, '...
'pages = {169-175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
