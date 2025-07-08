function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_HP_Cur96

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_HP_Cur96';
metaData.species_en = 'Trinidadian guppy (HP Curaguate)';

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food = {'biCi'};
metaData.ecoCode.gender = {'D'};
metaData.ecoCode.reprod = {'O'};

metaData.T_typical = C2K(26); % K, body temp
metaData.data_0 = {'ab_f', 'L_i'};
metaData.data_1 = {'t-Ww_f'; 't-L_f'; 't-N_f'; 'L_Ww_f'};
metaData.COMPLETE = 2.8; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author = {'Tomos Potter'};
metaData.date_subm = [2020 10 20];
metaData.email = {'tomos.potter@zoo.ox.ac.uk'};
metaData.address = {'University of Oxford, UK'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 12 29]; 

%% set data
% zero-variate data
data.ab_f1 = 22.15625; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'Rezn1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 22.65625; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'Rezn1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';
data.Li = 3.77; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'Rezn1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
72 93 114 72 95 116 65 86 106 92 115 139 71 91 113 72 96 120 67 90 114 68 89 111 69 93 115 69 91 112 69 90 113 69 90 112 71 92 113 108 130 151 71 93 117 77 101 125
0.193 0.3 0.368 0.161 0.27 0.409 0.167 0.269 0.384 0.3 0.444 0.611 0.162 0.232 0.317 0.205 0.339 0.48 0.178 0.279 0.484 0.176 0.303 0.456 0.146 0.277 0.417 0.196 0.289 0.412 0.148 0.217 0.337 0.174 0.268 0.391 0.167 0.249 0.367 0.351 0.476 0.596 0.189 0.311 0.483 0.176 0.287 0.422
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'Rezn1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
100 121 143 74 96 118 64 86 108 94 116 140 71 95 117 94 116 139 73 98 121 96 117 138 74 97 118 102 124 147 75 100 123 70 93 115 121 144 167 94 117 139 98 120 142 76 101 126
0.231 0.346 0.464 0.139 0.232 0.345 0.115 0.196 0.295 0.212 0.303 0.417 0.123 0.212 0.313 0.218 0.326 0.461 0.145 0.237 0.36 0.213 0.304 0.419 0.111 0.195 0.271 0.235 0.364 0.471 0.139 0.236 0.344 0.105 0.192 0.302 0.333 0.437 0.564 0.22 0.304 0.417 0.227 0.306 0.404 0.131 0.226 0.344
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'Rezn1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
72 93 114 72 95 116 65 86 106 92 115 139 71 91 113 72 96 120 67 90 114 68 89 111 69 93 115 69 91 112 69 90 113 69 90 112 71 92 113 108 130 151 71 93 117 77 101 125
2.073 2.391 2.576 1.988 2.318 2.62 2.004 2.328 2.619 2.375 2.659 2.934 2.042 2.283 2.466 2.161 2.512 2.835 2.087 2.411 2.732 2.017 2.35 2.675 1.934 2.308 2.636 2.125 2.337 2.675 1.941 2.235 2.525 2.03 2.345 2.628 1.962 2.281 2.508 2.54 2.757 2.963 2.131 2.493 2.855 2.03 2.378 2.671
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'Rezn1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
100 121 143 74 96 118 64 86 108 94 116 140 71 95 117 94 116 139 73 98 121 96 117 138 74 97 118 102 124 147 75 100 123 70 93 115 121 144 167 94 117 139 98 120 142 76 101 126
2.203 2.499 2.697 1.927 2.222 2.517 1.841 2.138 2.43 2.159 2.41 2.634 1.806 2.155 2.422 2.233 2.52 2.781 1.935 2.254 2.551 2.132 2.363 2.6 1.784 2.124 2.337 2.254 2.542 2.789 1.919 2.251 2.517 1.74 2.056 2.33 2.438 2.683 2.859 2.12 2.38 2.596 2.252 2.524 2.677 1.866 2.201 2.533
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'Rezn1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
28 72 93 114 27 72 95 116 22 65 86 106 28 92 115 139 26 71 91 113 23 72 96 120 28 67 90 114 25 68 89 111 27 69 93 115 30 69 91 112 24 69 90 113 29 69 90 112 30 71 92 113 22 108 130 151 28 71 93 117 31 77 101 125
0 5 17 38 0 5 13 33 0 4 12 29 0 11 30 58 0 6 19 32 0 6 21 43 0 4 21 35 0 1 12 31 0 4 13 34 0 5 21 45 0 2 12 31 0 6 18 47 0 2 14 35 0 24 52 82 0 3 16 29 0 5 17 40
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'Rezn1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
28 100 121 143 27 74 96 118 22 64 86 108 28 94 116 140 26 71 95 117 23 94 116 139 28 73 98 121 25 96 117 138 27 74 97 118 30 102 124 147 24 75 100 123 29 70 93 115 30 121 144 167 22 94 117 139 28 98 120 142 31 76 101 126
0 4 19 48 0 4 13 29 0 4 10 22 0 6 19 40 0 2 9 25 0 11 26 50 0 2 9 22 0 6 21 44 0 2 10 23 0 8 25 53 0 3 11 26 0 5 13 31 0 7 33 68 0 10 21 42 0 8 23 44 0 2 10 28
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'Rezn1996';
comment.tL_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
2.073 2.391 2.576 1.988 2.318 2.62 2.004 2.328 2.619 2.375 2.659 2.934 2.042 2.283 2.466 2.161 2.512 2.835 2.087 2.411 2.732 2.017 2.35 2.675 1.934 2.308 2.636 2.125 2.337 2.675 1.941 2.235 2.525 2.03 2.345 2.628 1.962 2.281 2.508 2.54 2.757 2.963 2.131 2.493 2.855 2.03 2.378 2.671
0.193 0.3 0.368 0.161 0.27 0.409 0.167 0.269 0.384 0.3 0.444 0.611 0.162 0.232 0.317 0.205 0.339 0.48 0.178 0.279 0.484 0.176 0.303 0.456 0.146 0.277 0.417 0.196 0.289 0.412 0.148 0.217 0.337 0.174 0.268 0.391 0.167 0.249 0.367 0.351 0.476 0.596 0.189 0.311 0.483 0.176 0.287 0.422
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'Rezn1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
2.203 2.499 2.697 1.927 2.222 2.517 1.841 2.138 2.43 2.159 2.41 2.634 1.806 2.155 2.422 2.233 2.52 2.781 1.935 2.254 2.551 2.132 2.363 2.6 1.784 2.124 2.337 2.254 2.542 2.789 1.919 2.251 2.517 1.74 2.056 2.33 2.438 2.683 2.859 2.12 2.38 2.596 2.252 2.524 2.677 1.866 2.201 2.533
0.231 0.346 0.464 0.139 0.232 0.345 0.115 0.196 0.295 0.212 0.303 0.417 0.123 0.212 0.313 0.218 0.326 0.461 0.145 0.237 0.36 0.213 0.304 0.419 0.111 0.195 0.271 0.235 0.364 0.471 0.139 0.236 0.344 0.105 0.192 0.302 0.333 0.437 0.564 0.22 0.304 0.417 0.227 0.306 0.404 0.131 0.226 0.344
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
D1 = 'This entry is for high predation ecotype guppies, from the Curaguate river in Trinidad. Only females considered';
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
