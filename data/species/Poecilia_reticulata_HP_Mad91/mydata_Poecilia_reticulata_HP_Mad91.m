function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_HP_Mad91

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_HP_Mad91';
metaData.species_en = 'Trinidadian guppy (HP Madamas91)';

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food = {'biCi'};
metaData.ecoCode.gender = {'D'};
metaData.ecoCode.reprod = {'O'};

metaData.T_typical = C2K(26); % K, body temp
metaData.data_0 = {'ab_f'; 'Wdb_f'; 'Li'};
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
data.ab_f1 = 23.53125; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'ReznBrya1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 23.9411765; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'ReznBrya1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';
data.Li = 3.80; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'ReznBrya1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
67 88 107 78 100 123 91 113 137 105 128 153 69 92 114 88 112 135 75 99 122 86 109 133 93 120 149 71 113 134 72 94 116 92 112 133 77 99 122 67 89 113 66 89 112 75 98 122
0.118 0.171 0.287 0.118 0.179 0.26 0.171 0.241 0.358 0.186 0.237 0.273 0.127 0.194 0.246 0.212 0.291 0.374 0.16 0.217 0.297 0.19 0.256 0.375 0.209 0.241 0.272 0.131 0.253 0.35 0.117 0.16 0.23 0.198 0.27 0.352 0.163 0.211 0.288 0.136 0.194 0.278 0.131 0.184 0.235 0.127 0.196 0.308
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'ReznBrya1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
75 110 134 159 106 129 153 110 134 158 67 98 122 106 125 149 85 108 131 94 119 145 119 143 169 87 112 136 106 126 148 103 127 149 95 120 143 133 154 176 95 119 148 78 103 129 89 113 133 75 99 124
0.077 0.122 0.166 0.222 0.145 0.222 0.306 0.148 0.222 0.272 0.065 0.117 0.176 0.156 0.21 0.296 0.117 0.162 0.228 0.136 0.26 0.336 0.164 0.22 0.258 0.113 0.169 0.24 0.155 0.216 0.317 0.16 0.237 0.329 0.1 0.17 0.24 0.225 0.296 0.395 0.117 0.139 0.124 0.082 0.126 0.19 0.112 0.152 0.229 0.068 0.105 0.161
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'ReznBrya1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
67 88 107 78 100 123 91 113 137 105 128 153 69 92 114 88 112 135 75 99 122 86 109 133 93 120 149 71 113 134 72 94 116 92 112 133 77 99 122 67 89 113 66 89 112 75 98 122
1.743 2.015 2.282 1.776 2.023 2.213 1.961 2.218 2.476 2.07 2.262 2.341 1.759 2.059 2.226 2.082 2.391 2.485 1.884 2.176 2.372 1.988 2.26 2.42 2.113 2.281 2.276 1.833 2.248 2.532 1.76 1.939 2.167 2.095 2.369 2.54 1.876 2.12 2.359 1.823 2.125 2.49 1.765 2.012 2.148 1.845 2.098 2.395
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'ReznBrya1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
75 110 134 159 106 129 153 110 134 158 67 98 122 106 125 149 85 108 131 94 119 145 119 143 169 87 112 136 106 126 148 103 127 149 95 120 143 133 154 176 95 119 148 78 103 129 89 113 133 75 99 124
1.516 1.81 1.97 2.148 1.873 2.128 2.329 1.958 2.183 2.328 1.446 1.89 2.038 1.927 2.159 2.422 1.719 1.994 2.172 1.866 2.27 2.434 2.029 2.14 2.327 1.734 2.042 2.229 1.958 2.22 2.462 1.96 2.222 2.425 1.744 2.053 2.292 2.181 2.411 2.584 1.761 1.914 1.888 1.583 1.816 2.15 1.79 1.881 2.117 1.59 1.729 1.961
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'ReznBrya1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
26 67 88 107 30 78 100 123 28 91 113 137 29 105 128 153 24 69 92 114 21 88 112 135 20 75 99 122 20 20 86 109 133 19 93 120 149 22 71 113 134 22 24 72 94 116 27 92 112 133 24 77 99 122 24 67 89 113 22 66 89 112 28 75 98 122
0 3 7 14 0 3 10 19 0 2 8 16 0 5 12 23 0 3 10 20 0 4 14 26 0 3 10 23 0 0 3 12 23 0 7 17 23 0 2 14 31 0 0 3 6 8 0 5 13 28 0 1 10 23 0 2 8 19 0 2 8 19 0 2 7 17
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'ReznBrya1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
26 75 30 110 134 159 28 106 129 153 29 110 134 158 24 67 98 122 21 106 125 149 20 85 108 131 20 94 119 145 20 119 143 169 19 87 112 136 22 106 126 148 22 103 127 149 24 95 120 143 27 133 154 176 24 95 119 148 25 78 103 129 22 89 113 133 28 75 99 124
0 1 0 1 10 13 0 3 7 15 0 4 9 17 0 1 5 13 0 1 7 15 0 1 5 12 0 2 7 15 0 6 12 22 0 2 6 13 0 1 6 14 0 3 10 19 0 2 7 15 0 4 11 17 0 4 11 18 0 1 4 10 0 2 6 11 0 1 4 12
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'ReznBrya1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
1.743 2.015 2.282 1.776 2.023 2.213 1.961 2.218 2.476 2.07 2.262 2.341 1.759 2.059 2.226 2.082 2.391 2.485 1.884 2.176 2.372 1.988 2.26 2.42 2.113 2.281 2.276 1.833 2.248 2.532 1.76 1.939 2.167 2.095 2.369 2.54 1.876 2.12 2.359 1.823 2.125 2.49 1.765 2.012 2.148 1.845 2.098 2.395
0.118 0.171 0.287 0.118 0.179 0.26 0.171 0.241 0.358 0.186 0.237 0.273 0.127 0.194 0.246 0.212 0.291 0.374 0.16 0.217 0.297 0.19 0.256 0.375 0.209 0.241 0.272 0.131 0.253 0.35 0.117 0.16 0.23 0.198 0.27 0.352 0.163 0.211 0.288 0.136 0.194 0.278 0.131 0.184 0.235 0.127 0.196 0.308
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'ReznBrya1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.516 1.81 1.97 2.148 1.873 2.128 2.329 1.958 2.183 2.328 1.446 1.89 2.038 1.927 2.159 2.422 1.719 1.994 2.172 1.866 2.27 2.434 2.029 2.14 2.327 1.734 2.042 2.229 1.958 2.22 2.462 1.96 2.222 2.425 1.744 2.053 2.292 2.181 2.411 2.584 1.761 1.914 1.888 1.583 1.816 2.15 1.79 1.881 2.117 1.59 1.729 1.961
0.077 0.122 0.166 0.222 0.145 0.222 0.306 0.148 0.222 0.272 0.065 0.117 0.176 0.156 0.21 0.296 0.117 0.162 0.228 0.136 0.26 0.336 0.164 0.22 0.258 0.113 0.169 0.24 0.155 0.216 0.317 0.16 0.237 0.329 0.1 0.17 0.24 0.225 0.296 0.395 0.117 0.139 0.124 0.082 0.126 0.19 0.112 0.152 0.229 0.068 0.105 0.161
]';
units.LWw_f2 = {'cm', 'g'}; label.LWw_f2 = {'standard length', 'wet weight'};
temp.LWw_f2 = C2K(26); units.temp.LWw_f2 = 'K'; label.temp.LWw_f2 = 'temperature';
bibkey.LWw_f2 = 'ReznBrya1996';
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
set1 = {'tL_f1','tL_f2'}; subtitle1 = {'ReznBrya1996 data age/length for high and low food'};
set2 = {'tWw_f1','tWw_f2'}; subtitle2 = {'ReznBrya1996 data age/wet weight for high and low food'};
set3 = {'LWw_f1','LWw_f2'}; subtitle3 = {'ReznBrya1996 data length/wet weight for high and low food'};
set4 = {'tN_f1', 'tN_f2'}; subtitle4 = {'ReznBrya1996 data time/number of offspring for high and low food'}; metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'This entry is for high predation ecotype guppies, from the Madamas91 river in Trinidad. Only females considered.';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'The guppy is ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; % optional bibkey
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
bibkey = 'ReznBrya1996'; type = 'Article'; bib = [ ...
'author = {Reznick, D. N. and Bryant, M. J.},'...
'year = {1996},'...
'title = {Life-history evolution in guppies (\emph{Poecilia reticulata}: {P}oeciliidae). {V}. {G}enetic basis of parallelism in life histories},'...
'journal = {The American Naturalist},'...
'volume = {147},'...
'number = {3},'...
'pages = {339-359}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,', ' bib,'}'';'];

