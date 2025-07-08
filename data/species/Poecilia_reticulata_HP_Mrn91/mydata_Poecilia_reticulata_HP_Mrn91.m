function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_HP_Mrn91

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_HP_Mrn91';
metaData.species_en = 'Trinidadian guppy (HP Marianne91)';

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food = {'biCi'};
metaData.ecoCode.gender = {'D'};
metaData.ecoCode.reprod = {'O'};

metaData.T_typical = C2K(26); % K, body temp
metaData.data_0 = {'ab_f'; 'Wdb_f'};
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
data.ab_f1 = 22.5; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'ReznBrya1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 23.0666667; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'ReznBrya1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';
data.Li = 3.73; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'ReznBrya1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
60 83 105 86 110 134 104 124 145 115 135 156 124 147 170 72 95 114 70 114 137 100 123 147 69 93 117 70 93 115 77 98 120 71 94 115 102 127 145 95 117 140 76 100 123
0.109 0.165 0.235 0.186 0.249 0.355 0.188 0.255 0.326 0.229 0.309 0.359 0.293 0.385 0.447 0.111 0.143 0.201 0.143 0.29 0.375 0.186 0.234 0.297 0.129 0.149 0.223 0.163 0.206 0.285 0.131 0.172 0.236 0.121 0.174 0.23 0.186 0.264 0.324 0.127 0.144 0.202 0.128 0.194 0.269
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'ReznBrya1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
86 105 126 78 102 126 84 99 124 106 91 116 139 155 179 202 78 100 123 99 120 144 111 134 161 112 135 157 77 100 120 107 128 150 115 138 162 74 95 118
0.084 0.128 0.176 0.08 0.135 0.201 0.08 0.123 0.179 0.111 0.098 0.146 0.22 0.317 0.399 0.49 0.093 0.135 0.194 0.111 0.171 0.231 0.146 0.143 0.167 0.157 0.212 0.265 0.079 0.112 0.162 0.138 0.191 0.247 0.149 0.162 0.168 0.074 0.113 0.181
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'ReznBrya1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
60 83 105 86 110 134 104 124 145 115 135 156 124 147 170 72 95 114 70 114 137 100 123 147 69 93 117 70 93 115 77 98 120 71 94 115 102 127 145 95 117 140 76 100 123
1.682 1.971 2.23 1.959 2.216 2.46 2.096 2.292 2.484 2.183 2.356 2.526 2.365 2.63 2.747 1.73 1.91 2.038 1.775 2.29 2.539 2.09 2.263 2.364 1.742 1.95 2.151 1.98 2.094 2.31 1.875 2.026 2.225 1.733 1.943 2.115 2.033 2.259 2.45 1.873 1.976 2.12 1.852 2.081 2.252
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'ReznBrya1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
86 105 126 78 102 126 84 99 124 106 91 116 139 155 179 202 78 100 123 99 120 144 111 134 161 112 135 157 77 100 120 107 128 150 115 138 162 74 95 118
1.635 1.845 2.07 1.543 1.856 2.154 1.583 1.773 2.019 1.753 1.661 1.871 2.128 2.433 2.62 2.754 1.579 1.815 2.026 1.744 1.941 2.165 1.953 2.043 2.074 1.915 2.128 2.321 1.516 1.728 1.92 1.856 2.075 2.26 1.93 1.94 1.985 1.569 1.768 1.994
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'ReznBrya1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
24 60 83 105 22 86 110 134 28 104 124 145 28 115 135 156 28 124 147 170 30 72 95 114 21 70 114 137 28 100 123 147 19 69 93 117 20 70 93 115 26 77 98 120 27 71 94 115 27 102 127 145 21 95 117 140 24 76 100 123
0 2 7 17 0 8 19 31 0 7 15 25 0 8 23 45 0 9 25 49 0 2 7 13 0 1 11 27 0 5 15 29 0 2 12 22 0 3 10 24 0 3 9 19 0 2 7 14 0 6 7 18 0 7 16 27 0 3 8 16
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'ReznBrya1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
24 86 105 126 22 78 102 126 28 84 99 124 28 106 28 91 116 139 30 155 179 202 21 78 100 123 28 99 120 144 19 20 111 134 161 26 112 135 157 27 77 100 120 27 107 128 150 21 115 138 162 24 74 95 118
0 2 5 13 0 2 5 13 0 2 5 13 0 3 0 2 7 11 0 19 46 56 0 1 4 11 0 1 5 11 0 0 1 16 27 0 4 10 23 0 1 6 12 0 5 14 29 0 6 9 14 0 1 5 12
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'ReznBrya1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
1.682 1.971 2.23 1.959 2.216 2.46 2.096 2.292 2.484 2.183 2.356 2.526 2.365 2.63 2.747 1.73 1.91 2.038 1.775 2.29 2.539 2.09 2.263 2.364 1.742 1.95 2.151 1.98 2.094 2.31 1.875 2.026 2.225 1.733 1.943 2.115 2.033 2.259 2.45 1.873 1.976 2.12 1.852 2.081 2.252
0.109 0.165 0.235 0.186 0.249 0.355 0.188 0.255 0.326 0.229 0.309 0.359 0.293 0.385 0.447 0.111 0.143 0.201 0.143 0.29 0.375 0.186 0.234 0.297 0.129 0.149 0.223 0.163 0.206 0.285 0.131 0.172 0.236 0.121 0.174 0.23 0.186 0.264 0.324 0.127 0.144 0.202 0.128 0.194 0.269
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'ReznBrya1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.635 1.845 2.07 1.543 1.856 2.154 1.583 1.773 2.019 1.753 1.661 1.871 2.128 2.433 2.62 2.754 1.579 1.815 2.026 1.744 1.941 2.165 1.953 2.043 2.074 1.915 2.128 2.321 1.516 1.728 1.92 1.856 2.075 2.26 1.93 1.94 1.985 1.569 1.768 1.994
0.084 0.128 0.176 0.08 0.135 0.201 0.08 0.123 0.179 0.111 0.098 0.146 0.22 0.317 0.399 0.49 0.093 0.135 0.194 0.111 0.171 0.231 0.146 0.143 0.167 0.157 0.212 0.265 0.079 0.112 0.162 0.138 0.191 0.247 0.149 0.162 0.168 0.074 0.113 0.181
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
set4 = {'tN_f1', 'tN_f2'}; subtitle4 = {'ReznBrya1996 data time/number of offspring for high and low food'}; 
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'This entry is for high predation ecotype guppies, from the Marianne91 river in Trinidad. Only females considered.';
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
bibkey = 'ReznBrya1996'; type = 'Article'; bib = [ ...
'author = {Reznick, D. N. and Bryant, M. J.},'...
'year = {1996},'...
'title = {Life-history evolution in guppies (\emph{Poecilia reticulata}: {P}oeciliidae). {V}. {G}enetic basis of parallelism in life histories.},'...
'journal = {The American Naturalist},'...
'volume = {147},'...
'number = {3},'...
'pages = {339-359}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,', ' bib,'}'';'];
