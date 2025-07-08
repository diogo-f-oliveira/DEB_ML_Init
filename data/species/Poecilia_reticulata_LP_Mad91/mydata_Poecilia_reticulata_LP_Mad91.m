function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_LP_Mad91

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_LP_Mad91';
metaData.species_en = 'Trinidadian guppy (LP Madamas91)';

metaData.ecoCode.climate = {'Af','Am','Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm','0iMm'};
metaData.ecoCode.embryo = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food = {'biCi'};
metaData.ecoCode.gender = {'D'};
metaData.ecoCode.reprod = {'O'};

metaData.T_typical = C2K(26); % K, body temp
metaData.data_0 = {'ab_f';'Wdb_f'; 'Li'};
metaData.data_1 = {'t-Ww_f';'t-L_f';'t-N_f';'L_Ww_f'};

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
data.ab_f1 = 22.0882353; units.ab_f1 ='d'; label.ab_f1 ='mean age at birth, high food'; bibkey.ab_f1 ='ReznBrya1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 ='K'; label.temp.ab_f1 ='temperature';
data.ab_f2 = 24.6764706; units.ab_f2 ='d'; label.ab_f2 ='mean age at birth, low food'; bibkey.ab_f2 ='ReznBrya1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 ='K'; label.temp.ab_f2 ='temperature';

data.Li = 3.87; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'ReznBrya1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data

% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
73 93 114 65 84 105 94 115 135 71 93 116 76 99 123 89 114 137 109 133 157 72 92 114 87 110 132 76 96 117 88 112 133 95 116 137 107 131 154 70 91 112 82 104 127 99 123 146 66 89 111
0.144 0.195 0.264 0.107 0.133 0.2 0.184 0.218 0.285 0.156 0.2 0.278 0.154 0.218 0.318 0.226 0.292 0.412 0.328 0.452 0.638 0.154 0.2 0.286 0.213 0.286 0.362 0.142 0.192 0.266 0.184 0.246 0.284 0.192 0.248 0.294 0.251 0.361 0.463 0.137 0.175 0.237 0.159 0.246 0.345 0.191 0.273 0.371 0.126 0.179 0.248
]';
units.tWw_f1 = {'d','g'}; label.tWw_f1 = {'time since birth','wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 ='K'; label.temp.tWw_f1 ='temperature';
bibkey.tWw_f1 ='ReznBrya1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
67 147 168 82 105 128 141 163 184 95 119 143 105 129 152 88 113 136 84 107 133 135 160 186 100 126 150 120 141 164 121 141 164 95 118 142 87 113 136 94 117 138 99 120 141 122 144 113 135 156
0.057 0.285 0.371 0.083 0.128 0.209 0.259 0.331 0.449 0.132 0.199 0.264 0.145 0.209 0.29 0.139 0.212 0.282 0.124 0.176 0.244 0.269 0.327 0.337 0.137 0.196 0.26 0.176 0.243 0.33 0.171 0.253 0.361 0.103 0.153 0.228 0.101 0.14 0.251 0.149 0.209 0.267 0.124 0.187 0.265 0.201 0.287 0.149 0.216 0.298
]';
units.tWw_f2 = {'d','g'}; label.tWw_f2 = {'time since birth','wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 ='K'; label.temp.tWw_f2 ='temperature';
bibkey.tWw_f2 ='ReznBrya1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
73 93 114 65 84 105 94 115 135 71 93 116 76 99 123 89 114 137 109 133 157 72 92 114 87 110 132 76 96 117 88 112 133 95 116 137 107 131 154 70 91 112 82 104 127 99 123 146 66 89 111
1.816 2.11 2.288 1.677 1.95 2.115 2.08 2.145 2.347 1.925 2.178 2.355 1.861 2.118 2.389 2.115 2.353 2.492 2.477 2.76 2.977 1.9 2.114 2.323 2.127 2.34 2.532 1.829 2.079 2.299 2.052 2.266 2.393 2.045 2.173 2.298 2.169 2.444 2.657 1.841 2.068 2.238 1.927 2.233 2.448 2.051 2.284 2.479 1.84 2.011 2.18
]';
units.tL_f1 = {'d','cm'}; label.tL_f1 = {'time since birth','standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 ='K'; label.temp.tL_f1 ='temperature';
bibkey.tL_f1 ='ReznBrya1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
67 147 168 82 105 128 141 163 184 95 119 143 105 129 152 88 113 136 84 107 133 135 160 186 100 126 150 120 141 164 121 141 164 95 118 142 87 113 136 94 117 138 99 120 141 122 144 113 135 156
1.392 2.385 2.548 1.61 1.842 2.089 2.29 2.383 2.588 1.886 2.095 2.294 1.877 2.099 2.334 1.854 2.127 2.36 1.749 2.02 2.242 2.315 2.497 2.513 1.84 2.064 2.252 1.983 2.137 2.38 2.012 2.271 2.521 1.732 1.881 2.141 1.71 1.873 2.223 1.92 2.083 2.316 1.8 2.087 2.269 2.067 2.312 1.929 2.166 2.366
]';
units.tL_f2 = {'d','cm'}; label.tL_f2 = {'time since birth','standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 ='K'; label.temp.tL_f2 ='temperature';
bibkey.tL_f2 ='ReznBrya1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
23 73 93 114 28 65 84 105 26 94 115 135 21 71 93 116 21 76 99 123 20 89 114 137 19 109 133 157 21 72 92 114 21 87 110 132 22 76 96 117 24 88 112 133 24 95 116 137 24 107 131 154 23 70 91 112 24 82 104 127 25 99 123 146 29 66 89 111
0 3 9 19 0 1 5 14 0 2 5 11 0 2 8 19 0 2 7 12 0 8 17 28 0 7 20 40 0 1 7 17 0 4 15 23 0 3 9 19 0 1 8 17 0 2 9 14 0 5 12 27 0 1 7 15 0 1 7 19 0 5 13 24 0 2 6 13
]';
units.tN_f1 = {'d','#'}; label.tN_f1 = {'time since birth','cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 ='K'; label.temp.tN_f1 ='temperature';
bibkey.tN_f1 ='ReznBrya1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
23 67 147 168 28 82 105 128 26 141 163 184 21 95 119 143 21 105 129 152 20 88 113 136 19 84 107 133 21 135 160 186 21 100 126 150 22 120 141 164 24 121 141 164 24 95 118 142 24 87 113 136 23 94 117 138 24 99 120 141 25 122 144 29 113 135 156
0 1 8 20 0 1 4 6 0 3 4 10 0 2 7 12 0 3 9 19 0 1 3 7 0 1 4 9 0 4 12 22 0 2 7 15 0 2 6 16 0 4 10 23 0 2 4 7 0 1 5 10 0 1 5 12 0 2 7 15 0 1 3 0 2 9 20
]';
units.tN_f2 = {'d','#'}; label.tN_f2 = {'time since birth','cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 ='K'; label.temp.tN_f2 ='temperature';
bibkey.tN_f2 ='ReznBrya1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
1.816 2.11 2.288 1.677 1.95 2.115 2.08 2.145 2.347 1.925 2.178 2.355 1.861 2.118 2.389 2.115 2.353 2.492 2.477 2.76 2.977 1.9 2.114 2.323 2.127 2.34 2.532 1.829 2.079 2.299 2.052 2.266 2.393 2.045 2.173 2.298 2.169 2.444 2.657 1.841 2.068 2.238 1.927 2.233 2.448 2.051 2.284 2.479 1.84 2.011 2.18
0.144 0.195 0.264 0.107 0.133 0.2 0.184 0.218 0.285 0.156 0.2 0.278 0.154 0.218 0.318 0.226 0.292 0.412 0.328 0.452 0.638 0.154 0.2 0.286 0.213 0.286 0.362 0.142 0.192 0.266 0.184 0.246 0.284 0.192 0.248 0.294 0.251 0.361 0.463 0.137 0.175 0.237 0.159 0.246 0.345 0.191 0.273 0.371 0.126 0.179 0.248
]';
units.LWw_f1 = {'cm','g'}; label.LWw_f1 = {'standard length','wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 ='K'; label.temp.LWw_f1 ='temperature';
bibkey.LWw_f1 ='ReznBrya1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.392 2.385 2.548 1.61 1.842 2.089 2.29 2.383 2.588 1.886 2.095 2.294 1.877 2.099 2.334 1.854 2.127 2.36 1.749 2.02 2.242 2.315 2.497 2.513 1.84 2.064 2.252 1.983 2.137 2.38 2.012 2.271 2.521 1.732 1.881 2.141 1.71 1.873 2.223 1.92 2.083 2.316 1.8 2.087 2.269 2.067 2.312 1.929 2.166 2.366
0.057 0.285 0.371 0.083 0.128 0.209 0.259 0.331 0.449 0.132 0.199 0.264 0.145 0.209 0.29 0.139 0.212 0.282 0.124 0.176 0.244 0.269 0.327 0.337 0.137 0.196 0.26 0.176 0.243 0.33 0.171 0.253 0.361 0.103 0.153 0.228 0.101 0.14 0.251 0.149 0.209 0.267 0.124 0.187 0.265 0.201 0.287 0.149 0.216 0.298
]';
units.LWw_f2 = {'cm','g'}; label.LWw_f2 = {'standard length','wet weight'};
temp.LWw_f2 = C2K(26); units.temp.LWw_f2 ='K'; label.temp.LWw_f2 ='temperature';
bibkey.LWw_f2 ='ReznBrya1996';
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
set4 = {'tN_f1','tN_f2'}; subtitle4 = {'ReznBrya1996 data time/number of offspring for high and low food'}; 
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 ='This entry is for low predation ecotype guppies, from the Madamas91 river in Trinidad. Only females considered.';
metaData.discussion = struct('D1', D1);

%% Facts
F1 ='The guppy is ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 ='Wiki';
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
bibkey ='Kooy2010'; type ='Book'; bib = [ ... % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.},' ...
'year = {2010},' ...
'title = {Dynamic Energy Budget theory for metabolic organisation},' ...
'publisher = {Cambridge Univ. Press, Cambridge},' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,',' bib,'}'';'];
%
bibkey = 'ReznBrya1996'; type ='Article'; bib = [ ...
'author = {Reznick, D. N. and Bryant, M. J.},'...
'year = {1996},'...
'title = {Life-history evolution in guppies (\emph{Poecilia reticulata}: {P}oeciliidae). {V}. {G}enetic basis of parallelism in life histories.},'...
'journal = {The American Naturalist},'...
'volume = {147},'...
'number = {3},'...
'pages = {339-359}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,',' bib,'}'';'];
