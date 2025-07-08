function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_LP_Mrn96

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_LP_Mrn96';
metaData.species_en = 'Trinidadian guppy (LP Marianne96)';

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
metaData.COMPLETE = 2.9; % using criteria of LikaKear2011 

metaData.author = {'Tomos Potter'};
metaData.date_subm = [2020 10 20];
metaData.email = {'tomos.potter@zoo.ox.ac.uk'};
metaData.address = {'University of Oxford, UK'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 12 29]; 

%% set data
% zero-variate data
data.ab_f1 = 27.0333333; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'Rezn1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 26.9333333; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'Rezn1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';

data.Li = 3.77; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'Rezn1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
98 124 154 110 138 166 94 120 146 92 119 145 87 113 140 88 115 144 93 118 145 111 140 170 89 114 141 84 109 138 87 112 139 109 136 165 104 131 159 92 149 109 134 161 116 142 169
0.252 0.337 0.424 0.264 0.289 0.491 0.226 0.333 0.425 0.201 0.278 0.286 0.216 0.3 0.352 0.208 0.318 0.407 0.174 0.261 0.283 0.35 0.446 0.526 0.188 0.283 0.368 0.183 0.255 0.371 0.191 0.285 0.37 0.241 0.292 0.299 0.283 0.385 0.379 0.23 0.401 0.267 0.317 0.378 0.253 0.339 0.387
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'Rezn1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
93 119 146 85 111 138 100 126 156 91 117 145 92 119 147 93 119 146 87 116 145 108 135 166 113 142 171 93 119 145 84 108 134 89 116 143 88 114 141 86 111 137 96 120 146
0.193 0.285 0.372 0.181 0.282 0.351 0.221 0.32 0.368 0.167 0.25 0.338 0.175 0.281 0.377 0.168 0.271 0.35 0.176 0.282 0.336 0.272 0.369 0.469 0.287 0.318 0.451 0.157 0.224 0.27 0.159 0.237 0.331 0.156 0.191 0.251 0.169 0.231 0.3 0.175 0.263 0.354 0.167 0.264 0.338
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'Rezn1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
98 124 154 110 138 166 94 120 146 92 119 145 87 113 140 88 115 144 93 118 145 111 140 170 89 114 141 84 109 138 87 112 139 109 136 165 104 131 159 92 149 109 134 161 116 142 169
2.179 2.429 2.604 2.229 2.475 2.494 2.111 2.373 2.581 2.085 2.327 2.554 2.121 2.336 2.508 2.12 2.453 2.613 1.99 2.271 2.334 2.406 2.629 2.77 2.04 2.267 2.483 1.991 2.266 2.463 2.048 2.325 2.505 2.171 2.352 2.414 2.319 2.566 2.544 2.139 2.541 2.274 2.428 2.573 2.231 2.4 2.548
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'Rezn1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
93 119 146 85 111 138 100 126 156 91 117 145 92 119 147 93 119 146 87 116 145 108 135 166 113 142 171 93 119 145 84 108 134 89 116 143 88 114 141 86 111 137 96 120 146
2.015 2.278 2.478 1.987 2.277 2.413 2.118 2.376 2.476 1.954 2.237 2.435 1.984 2.296 2.485 1.996 2.312 2.481 1.98 2.269 2.416 2.24 2.435 2.659 2.298 2.459 2.649 1.888 2.096 2.264 1.95 2.201 2.451 1.916 2.08 2.249 1.959 2.194 2.392 2.02 2.303 2.502 1.952 2.244 2.419
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'Rezn1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
30 98 124 154 25 110 138 166 26 94 120 146 28 92 119 145 27 87 113 140 29 88 115 144 31 93 118 145 26 111 140 170 26 89 114 141 27 84 109 138 29 87 112 139 22 109 136 165 24 104 131 159 23 92 149 26 109 134 161 29 116 142 169
0 1 16 35 0 8 19 35 0 5 19 38 0 5 14 35 0 1 15 40 0 5 17 38 0 4 14 34 0 5 14 22 0 3 13 32 0 1 15 32 0 2 13 28 0 6 19 35 0 14 30 55 0 5 37 0 7 23 45 0 5 20 40
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'Rezn1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
30 93 119 146 25 85 111 138 26 100 126 156 28 27 91 117 145 29 92 119 147 31 93 119 146 26 87 116 145 26 108 135 166 27 113 142 171 29 93 119 145 22 84 108 134 24 89 116 143 23 88 114 141 26 86 111 137 29 96 120 146
0 2 7 19 0 3 11 28 0 1 11 29 0 0 2 13 32 0 3 11 25 0 2 10 27 0 1 7 21 0 2 9 22 0 10 29 52 0 3 10 22 0 1 7 22 0 2 10 23 0 1 10 24 0 1 9 22 0 3 13 32
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'Rezn1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
2.179 2.429 2.604 2.229 2.475 2.494 2.111 2.373 2.581 2.085 2.327 2.554 2.121 2.336 2.508 2.12 2.453 2.613 1.99 2.271 2.334 2.406 2.629 2.77 2.04 2.267 2.483 1.991 2.266 2.463 2.048 2.325 2.505 2.171 2.352 2.414 2.319 2.566 2.544 2.139 2.541 2.274 2.428 2.573 2.231 2.4 2.548
0.252 0.337 0.424 0.264 0.289 0.491 0.226 0.333 0.425 0.201 0.278 0.286 0.216 0.3 0.352 0.208 0.318 0.407 0.174 0.261 0.283 0.35 0.446 0.526 0.188 0.283 0.368 0.183 0.255 0.371 0.191 0.285 0.37 0.241 0.292 0.299 0.283 0.385 0.379 0.23 0.401 0.267 0.317 0.378 0.253 0.339 0.387
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'Rezn1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
2.015 2.278 2.478 1.987 2.277 2.413 2.118 2.376 2.476 1.954 2.237 2.435 1.984 2.296 2.485 1.996 2.312 2.481 1.98 2.269 2.416 2.24 2.435 2.659 2.298 2.459 2.649 1.888 2.096 2.264 1.95 2.201 2.451 1.916 2.08 2.249 1.959 2.194 2.392 2.02 2.303 2.502 1.952 2.244 2.419
0.193 0.285 0.372 0.181 0.282 0.351 0.221 0.32 0.368 0.167 0.25 0.338 0.175 0.281 0.377 0.168 0.271 0.35 0.176 0.282 0.336 0.272 0.369 0.469 0.287 0.318 0.451 0.157 0.224 0.27 0.159 0.237 0.331 0.156 0.191 0.251 0.169 0.231 0.3 0.175 0.263 0.354 0.167 0.264 0.338
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
D1 = 'This entry is for low predation ecotype guppies, from the Marianne96 river in Trinidad. Only females considered.';
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
'author = {Reznick, D. N. },'...
'year = {1996},'...
'note = {Unpublished dataset}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,', ' bib,'}'';'];
