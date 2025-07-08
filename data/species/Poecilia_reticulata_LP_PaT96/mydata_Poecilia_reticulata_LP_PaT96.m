function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_LP_PaT96

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_LP_PaT96';
metaData.species_en = 'Trinidadian guppy (LP Paria_Trib96)';

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food = {'biCi'};
metaData.ecoCode.gender = {'D'};
metaData.ecoCode.reprod = {'O'};

metaData.T_typical = C2K(26); % K, body temp
metaData.data_0 = {'ab_f'; 'Li'};
metaData.data_1 = {'t-Ww_f'; 't-L_f'; 't-N_f'; 'L_Ww_f'};
metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author = {'Tomos Potter'};
metaData.date_subm = [2020 10 20];
metaData.email = {'tomos.potter@zoo.ox.ac.uk'};
metaData.address = {'University of Oxford, UK'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 12 29]; 

%% set data
% zero-variate data
data.ab_f1 = 24.125; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'Rezn1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 24.5769231; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'Rezn1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';

data.Li = 3.62; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'Rezn1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
75 97 120 75 99 122 85 108 130 126 150 176 96 119 143 83 103 127 80 104 131 79 103 129 76 99 125 80 106 134 73 97 122 82 105 130
0.194 0.308 0.44 0.176 0.291 0.424 0.188 0.319 0.446 0.542 0.703 0.859 0.332 0.459 0.608 0.202 0.316 0.431 0.188 0.305 0.436 0.228 0.374 0.567 0.173 0.275 0.4 0.18 0.248 0.312 0.198 0.323 0.447 0.166 0.24 0.346
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'Rezn1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
100 126 153 81 106 130 81 106 131 84 108 130 80 104 128 76 99 122 79 101 124 85 107 133 78 105 133 77 102 127 109 134 160 100 125 150 84 107 132
0.263 0.393 0.558 0.157 0.261 0.366 0.134 0.19 0.274 0.154 0.255 0.356 0.161 0.262 0.376 0.155 0.238 0.343 0.144 0.231 0.34 0.154 0.235 0.344 0.149 0.264 0.406 0.145 0.235 0.35 0.283 0.394 0.524 0.254 0.359 0.503 0.151 0.232 0.331
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'Rezn1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
75 97 120 75 99 122 85 108 130 126 150 176 96 119 143 83 103 127 80 104 131 79 103 129 76 99 125 80 106 134 73 97 122 82 105 130
2.026 2.385 2.657 1.948 2.273 2.577 2.008 2.35 2.64 2.722 2.971 3.13 2.397 2.66 2.897 2.043 2.337 2.558 2.001 2.319 2.576 2.118 2.472 2.734 1.96 2.257 2.554 2.015 2.231 2.363 2.077 2.413 2.63 1.864 2.16 2.361
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'Rezn1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
100 126 153 81 106 130 81 106 131 84 108 130 80 104 128 76 99 122 79 101 124 85 107 133 78 105 133 77 102 127 109 134 160 100 125 150 84 107 132
2.224 2.535 2.747 1.927 2.245 2.471 1.79 2.009 2.242 1.896 2.215 2.447 1.91 2.244 2.508 1.878 2.119 2.39 1.859 2.134 2.371 1.91 2.178 2.447 1.903 2.293 2.56 1.863 2.179 2.416 2.325 2.547 2.748 2.214 2.442 2.662 1.87 2.143 2.364
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'Rezn1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
23 28 75 97 120 28 75 99 122 30 85 108 130 26 126 150 176 25 96 119 143 28 83 103 127 23 80 104 131 30 79 103 129 29 76 99 125 26 80 106 134 26 73 97 122 24 30 82 105 130
0 0 5 16 38 0 6 17 36 0 2 9 27 0 12 47 90 0 14 41 77 0 1 6 18 0 5 18 42 0 6 23 53 0 6 20 42 0 5 18 34 0 3 17 42 0 0 3 13 28
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'Rezn1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
23 100 126 153 28 81 106 130 28 81 106 131 30 84 108 130 26 80 104 128 25 76 99 122 28 79 101 124 23 85 107 133 30 78 105 133 29 77 102 127 26 109 134 160 26 100 125 150 24 30 84 107 132
0 8 22 39 0 3 12 27 0 3 12 26 0 3 13 28 0 2 13 29 0 2 11 26 0 1 11 28 0 1 9 24 0 3 11 27 0 3 11 24 0 13 32 59 0 10 22 43 0 0 2 11 22
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'Rezn1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
2.026 2.385 2.657 1.948 2.273 2.577 2.008 2.35 2.64 2.722 2.971 3.13 2.397 2.66 2.897 2.043 2.337 2.558 2.001 2.319 2.576 2.118 2.472 2.734 1.96 2.257 2.554 2.015 2.231 2.363 2.077 2.413 2.63 1.864 2.16 2.361
0.194 0.308 0.44 0.176 0.291 0.424 0.188 0.319 0.446 0.542 0.703 0.859 0.332 0.459 0.608 0.202 0.316 0.431 0.188 0.305 0.436 0.228 0.374 0.567 0.173 0.275 0.4 0.18 0.248 0.312 0.198 0.323 0.447 0.166 0.24 0.346
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'Rezn1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
2.224 2.535 2.747 1.927 2.245 2.471 1.79 2.009 2.242 1.896 2.215 2.447 1.91 2.244 2.508 1.878 2.119 2.39 1.859 2.134 2.371 1.91 2.178 2.447 1.903 2.293 2.56 1.863 2.179 2.416 2.325 2.547 2.748 2.214 2.442 2.662 1.87 2.143 2.364
0.263 0.393 0.558 0.157 0.261 0.366 0.134 0.19 0.274 0.154 0.255 0.356 0.161 0.262 0.376 0.155 0.238 0.343 0.144 0.231 0.34 0.154 0.235 0.344 0.149 0.264 0.406 0.145 0.235 0.35 0.283 0.394 0.524 0.254 0.359 0.503 0.151 0.232 0.331
]';
units.LWw_f2 = {'cm', 'g'}; label.LWw_f2 = {'standard length', 'wet weight'};
temp.LWw_f2 = C2K(26); units.temp.LWw_f2 = 'K'; label.temp.LWw_f2 = 'temperature';
bibkey.LWw_f2 = 'Rezn1996';
comment.LWw_f2 = 'Data for low food';

%% set weights for all real data
weights = setweights(data, []);
weights.ab_f1 = 0.1 * weights.ab_f1;
weights.ab_f2 = 0.1 * weights.ab_f2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f1','tL_f2'}; subtitle1 = {'Rezn1996 data age/length for high and low food'};
set2 = {'tWw_f1','tWw_f2'}; subtitle2 = {'Rezn1996 data age/wet weight for high and low food'};
set3 = {'LWw_f1','LWw_f2'}; subtitle3 = {'Rezn1996 data length/wet weight for high and low food'};
set4 = {'tN_f1', 'tN_f2'}; subtitle4 = {'Rezn1996 data time/number of offspring for high and low food'}; 
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'This entry is for low predation ecotype guppies, from the Paria_Trib96 river in Trinidad. Only females considered.';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'The guppy is ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KSF6'; % Cat of Life
metaData.links.id_ITIS = '165903'; % ITIS
metaData.links.id_EoL = '208520'; % Ency of Life
metaData.links.id_Wiki = 'Poecilia_reticulata'; % Wikipedia
metaData.links.id_ADW = 'Poecilia_reticulata'; % ADW
metaData.links.id_Taxo = '44613'; % Taxonomicon
metaData.links.id_WoRMS = '154400'; % WoRMS
metaData.links.id_fishbase = 'Poecilia-reticulata'; % fishbase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ... % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.},' ...
'year = {2010},' ...
'title = {Dynamic Energy Budget theory for metabolic organisation},' ...
'publisher = {Cambridge Univ. Press, Cambridge},' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,', ' bib,'}'';'];
%
bibkey = 'Rezn1996'; type = 'misc'; bib = [ ...
'author = {Reznick, D. N.},'...
'year = {1996},'...
'note = {Unpublished dataset}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,', ' bib,'}'';'];
