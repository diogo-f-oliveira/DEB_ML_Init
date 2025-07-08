function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_HP_Yar96

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_HP_Yar96';
metaData.species_en = 'Trinidadian guppy (HP Yarra96)';

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
data.ab_f1 = 23.575; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'Rezn1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 24.175; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'Rezn1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';

data.Li = 3.85; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'Rezn1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
72 95 119 71 95 118 70 95 119 71 92 115 72 95 117 80 103 127 74 96 119 75 97 122 73 98 123 75 100 123 79 103 127 75 99 123 72 96 120 90 113 139 76 99 122 72 95 117 77 101 125 68 91 114 69 92 114 91 115 142
0.201 0.315 0.491 0.242 0.38 0.528 0.195 0.325 0.472 0.152 0.282 0.479 0.185 0.321 0.481 0.241 0.396 0.648 0.231 0.351 0.526 0.215 0.327 0.513 0.198 0.335 0.474 0.209 0.365 0.492 0.205 0.319 0.461 0.222 0.352 0.56 0.157 0.274 0.395 0.264 0.353 0.451 0.213 0.342 0.472 0.214 0.298 0.407 0.258 0.38 0.51 0.191 0.314 0.461 0.166 0.268 0.383 0.342 0.464 0.468
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'Rezn1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
74 105 130 70 117 75 99 121 79 102 127 70 95 119 96 120 142 72 97 120 104 128 152 103 128 154 72 95 119 84 110 137 77 101 126 97 120 144 72 97 123 84 106 131 75 99 122 74 100 124 96 120 144 82 104 125 73 96 119
0.1 0.209 0.312 0.129 0.304 0.146 0.254 0.343 0.155 0.244 0.349 0.127 0.229 0.342 0.201 0.316 0.456 0.12 0.212 0.319 0.265 0.373 0.515 0.275 0.415 0.558 0.18 0.251 0.362 0.146 0.249 0.373 0.149 0.241 0.363 0.248 0.347 0.513 0.14 0.244 0.351 0.17 0.265 0.39 0.158 0.307 0.456 0.147 0.234 0.349 0.23 0.33 0.469 0.156 0.248 0.333 0.17 0.279 0.372
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'Rezn1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
72 95 119 71 95 118 70 95 119 71 92 115 72 95 117 80 103 127 74 96 119 75 97 122 73 98 123 75 100 123 79 103 127 75 99 123 72 96 120 90 113 139 76 99 122 72 95 117 77 101 125 68 91 114 69 92 114 91 115 142
2.14 2.484 2.791 2.188 2.532 2.8 2.094 2.455 2.766 1.974 2.383 2.74 2.007 2.402 2.717 2.178 2.535 2.841 2.183 2.557 2.811 2.08 2.489 2.737 2.07 2.407 2.675 2.136 2.501 2.753 2.166 2.536 2.786 2.157 2.519 2.831 1.912 2.256 2.564 2.355 2.64 2.825 2.169 2.462 2.753 2.133 2.428 2.655 2.331 2.583 2.835 2.128 2.467 2.765 2.048 2.41 2.675 2.464 2.716 2.799
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'Rezn1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
74 105 130 70 92 117 75 99 121 79 102 127 70 95 119 96 120 142 72 97 120 104 128 152 103 128 154 72 95 119 84 110 137 77 101 126 97 120 144 72 97 123 84 106 131 75 99 122 74 100 124 96 120 144 82 104 125 73 96 119
1.77 2.171 2.446 1.787 2.094 2.34 1.925 2.242 2.523 1.952 2.257 2.575 1.826 2.2 2.443 2.05 2.366 2.63 1.781 2.088 2.388 2.321 2.573 2.832 2.393 2.7 2.898 2.03 2.342 2.587 1.932 2.304 2.58 1.932 2.262 2.537 2.226 2.519 2.809 1.917 2.245 2.544 2.046 2.318 2.595 1.969 2.434 2.746 1.98 2.286 2.556 2.195 2.473 2.718 2.003 2.313 2.567 2.031 2.302 2.583
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'Rezn1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
31 72 95 119 28 71 95 118 26 70 95 119 28 71 92 115 30 72 95 117 29 80 103 127 28 74 96 119 25 75 97 122 25 73 98 123 25 75 100 123 32 79 103 127 28 75 99 123 25 72 96 120 25 90 113 139 30 76 99 122 26 72 95 117 26 77 101 125 29 68 91 114 25 69 92 114 21 91 115 142
0 6 24 52 0 3 15 36 0 4 15 24 0 2 10 33 0 4 16 37 0 2 18 51 0 3 14 37 0 1 16 42 0 7 20 45 0 5 13 30 0 4 21 49 0 5 18 40 0 6 20 43 0 16 49 90 0 6 23 56 0 3 13 26 0 6 16 34 0 4 16 41 0 6 20 44 0 14 37 67
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'Rezn1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
31 74 105 130 28 70 92 117 26 75 99 121 28 79 102 127 30 70 95 119 29 96 120 142 28 72 97 120 25 104 128 152 25 103 128 154 25 72 95 119 32 84 110 137 28 77 101 126 25 97 120 144 25 72 97 123 30 84 106 131 26 75 99 122 26 74 100 124 29 96 120 144 25 82 104 125 21 73 96 119
0 2 8 18 0 1 9 24 0 2 11 26 0 2 13 34 0 2 9 21 0 2 10 27 0 2 6 21 0 8 25 50 0 10 32 60 0 2 12 26 0 3 13 31 0 4 13 27 0 9 20 36 0 3 11 25 0 2 9 25 0 3 11 28 0 4 14 26 0 5 20 47 0 2 13 32 0 3 10 22
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'Rezn1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
2.14 2.484 2.791 2.188 2.532 2.8 2.094 2.455 2.766 1.974 2.383 2.74 2.007 2.402 2.717 2.178 2.535 2.841 2.183 2.557 2.811 2.08 2.489 2.737 2.07 2.407 2.675 2.136 2.501 2.753 2.166 2.536 2.786 2.157 2.519 2.831 1.912 2.256 2.564 2.355 2.64 2.825 2.169 2.462 2.753 2.133 2.428 2.655 2.331 2.583 2.835 2.128 2.467 2.765 2.048 2.41 2.675 2.464 2.716 2.799
0.201 0.315 0.491 0.242 0.38 0.528 0.195 0.325 0.472 0.152 0.282 0.479 0.185 0.321 0.481 0.241 0.396 0.648 0.231 0.351 0.526 0.215 0.327 0.513 0.198 0.335 0.474 0.209 0.365 0.492 0.205 0.319 0.461 0.222 0.352 0.56 0.157 0.274 0.395 0.264 0.353 0.451 0.213 0.342 0.472 0.214 0.298 0.407 0.258 0.38 0.51 0.191 0.314 0.461 0.166 0.268 0.383 0.342 0.464 0.468
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'Rezn1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.77 2.171 2.446 1.787 2.34 1.925 2.242 2.523 1.952 2.257 2.575 1.826 2.2 2.443 2.05 2.366 2.63 1.781 2.088 2.388 2.321 2.573 2.832 2.393 2.7 2.898 2.03 2.342 2.587 1.932 2.304 2.58 1.932 2.262 2.537 2.226 2.519 2.809 1.917 2.245 2.544 2.046 2.318 2.595 1.969 2.434 2.746 1.98 2.286 2.556 2.195 2.473 2.718 2.003 2.313 2.567 2.031 2.302 2.583
0.1 0.209 0.312 0.129 0.304 0.146 0.254 0.343 0.155 0.244 0.349 0.127 0.229 0.342 0.201 0.316 0.456 0.12 0.212 0.319 0.265 0.373 0.515 0.275 0.415 0.558 0.18 0.251 0.362 0.146 0.249 0.373 0.149 0.241 0.363 0.248 0.347 0.513 0.14 0.244 0.351 0.17 0.265 0.39 0.158 0.307 0.456 0.147 0.234 0.349 0.23 0.33 0.469 0.156 0.248 0.333 0.17 0.279 0.372
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
D1 = 'This entry is for high predation ecotype guppies, from the Yarra96 river in Trinidad. Only females considered.';
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
