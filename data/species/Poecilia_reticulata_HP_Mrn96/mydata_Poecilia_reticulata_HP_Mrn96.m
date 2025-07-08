function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_HP_Mrn96

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_HP_Mrn96';
metaData.species_en = 'Trinidadian guppy (HP Marianne96)';

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
data.ab_f1 = 24.3928571; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'Rezn1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 24.8571429; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'Rezn1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';

data.Li = 3.73; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'Rezn1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
82 106 133 103 131 161 75 103 97 75 97 120 83 111 135 72 95 118 83 109 137 82 108 133 81 105 129 77 101 124 119 146 173 85 112 79 103 127 83 109 136
0.265 0.442 0.652 0.416 0.521 0.629 0.243 0.41 0.582 0.189 0.315 0.4 0.25 0.393 0.524 0.206 0.339 0.496 0.287 0.428 0.538 0.217 0.37 0.498 0.19 0.309 0.425 0.211 0.335 0.485 0.368 0.482 0.627 0.277 0.471 0.25 0.399 0.53 0.173 0.267 0.378
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'Rezn1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
81 105 129 94 122 150 85 108 133 78 125 83 107 132 81 102 126 102 130 159 91 116 140 114 140 165 115 141 89 111 135 91 113 139 84 109 133 80 105 131
0.173 0.286 0.419 0.23 0.364 0.47 0.182 0.291 0.419 0.158 0.317 0.184 0.297 0.421 0.187 0.278 0.414 0.258 0.415 0.514 0.212 0.34 0.467 0.282 0.414 0.543 0.296 0.346 0.304 0.466 0.619 0.228 0.355 0.453 0.2 0.281 0.343 0.219 0.282 0.405
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'Rezn1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
82 106 133 103 131 161 75 103 97 75 97 120 83 111 135 72 95 118 83 109 137 82 108 133 81 105 129 77 101 124 119 146 173 85 112 79 103 127 83 109 136
2.192 2.575 2.847 2.418 2.669 2.829 2.126 2.458 2.76 2.044 2.382 2.61 2.211 2.581 2.797 1.989 2.319 2.597 2.262 2.581 2.797 2.141 2.47 2.705 2.018 2.391 2.614 2.018 2.364 2.66 2.511 2.727 2.946 2.273 2.685 2.194 2.501 2.739 1.892 2.185 2.404
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'Rezn1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
81 105 129 94 122 150 85 108 133 78 125 83 107 132 81 102 126 102 130 159 91 116 140 114 140 165 115 141 89 111 135 91 113 139 84 109 133 80 105 131
1.934 2.26 2.532 2.075 2.395 2.609 1.959 2.273 2.522 1.927 2.388 2.006 2.357 2.591 2.034 2.256 2.557 2.204 2.523 2.722 2.126 2.418 2.653 2.284 2.545 2.8 2.283 2.429 2.31 2.634 2.863 2.161 2.435 2.663 2.004 2.236 2.41 2.066 2.252 2.501
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'Rezn1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
25 82 106 133 26 103 131 161 25 75 103 97 27 75 97 120 26 83 111 135 25 72 95 118 31 83 109 137 27 82 108 133 28 81 105 129 28 77 101 124 24 119 146 173 24 85 112 23 79 103 127 30 83 109 136
0 4 15 36 0 10 32 60 0 4 20 39 0 6 16 40 0 5 22 44 0 8 21 46 0 3 15 37 0 5 15 37 0 2 11 31 0 3 11 30 0 7 22 50 0 4 16 0 4 18 45 0 2 10 24
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'Rezn1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
25 81 105 129 26 94 122 150 25 85 108 133 27 78 101 125 26 83 107 132 25 81 102 126 31 102 130 159 27 91 116 140 28 114 140 165 28 115 141 24 89 111 135 24 91 113 139 23 84 109 133 30 80 105 131
0 2 9 23 0 2 8 20 0 1 8 14 0 2 10 23 0 2 12 27 0 1 6 17 0 3 9 24 0 4 10 25 0 10 25 47 0 8 24 0 2 12 31 0 2 6 20 0 2 10 25 0 1 14 32
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'Rezn1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
2.192 2.575 2.847 2.418 2.669 2.829 2.126 2.458 2.76 2.044 2.382 2.61 2.211 2.581 2.797 1.989 2.319 2.597 2.262 2.581 2.797 2.141 2.47 2.705 2.018 2.391 2.614 2.018 2.364 2.66 2.511 2.727 2.946 2.273 2.685 2.194 2.501 2.739 1.892 2.185 2.404
0.265 0.442 0.652 0.416 0.521 0.629 0.243 0.41 0.582 0.189 0.315 0.4 0.25 0.393 0.524 0.206 0.339 0.496 0.287 0.428 0.538 0.217 0.37 0.498 0.19 0.309 0.425 0.211 0.335 0.485 0.368 0.482 0.627 0.277 0.471 0.25 0.399 0.53 0.173 0.267 0.378
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'Rezn1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.934 2.26 2.532 2.075 2.395 2.609 1.959 2.273 2.522 1.927 2.388 2.006 2.357 2.591 2.034 2.256 2.557 2.204 2.523 2.722 2.126 2.418 2.653 2.284 2.545 2.8 2.283 2.429 2.31 2.634 2.863 2.161 2.435 2.663 2.004 2.236 2.41 2.066 2.252 2.501
0.173 0.286 0.419 0.23 0.364 0.47 0.182 0.291 0.419 0.158 0.317 0.184 0.297 0.421 0.187 0.278 0.414 0.258 0.415 0.514 0.212 0.34 0.467 0.282 0.414 0.543 0.296 0.346 0.304 0.466 0.619 0.228 0.355 0.453 0.2 0.281 0.343 0.219 0.282 0.405
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
D1 = 'This entry is for high predation ecotype guppies, from the Marianne96 river in Trinidad. Only females considered.';
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
