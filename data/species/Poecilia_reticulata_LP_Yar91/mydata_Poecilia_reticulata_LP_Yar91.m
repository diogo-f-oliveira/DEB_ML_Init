function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_LP_Yar91

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_LP_Yar91';
metaData.species_en = 'Trinidadian guppy (LP Yarra91)';

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
data.ab_f1 = 26.75; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'ReznBrya1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 27.5909091; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'ReznBrya1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';

data.Li = 3.65; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'ReznBrya1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
90 135 157 106 131 154 100 125 149 121 147 76 99 122 78 71 95 117 124 153 177 85 109 134 63 113 141 86 115 143 86 110 136 78 101 125
0.222 0.414 0.543 0.188 0.294 0.406 0.165 0.223 0.288 0.189 0.201 0.127 0.172 0.199 0.131 0.106 0.149 0.208 0.21 0.203 0.305 0.145 0.222 0.315 0.121 0.16 0.23 0.133 0.202 0.251 0.135 0.204 0.283 0.094 0.122 0.164
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'ReznBrya1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
88 114 140 112 135 160 93 120 149 100 126 185 122 148 172 99 125 149 113 141 171 97 121 147 98 128 154 112 139 165 106 130 155
0.13 0.197 0.276 0.129 0.195 0.221 0.102 0.158 0.215 0.103 0.145 0.227 0.148 0.215 0.276 0.115 0.192 0.248 0.109 0.157 0.214 0.112 0.167 0.237 0.087 0.134 0.204 0.141 0.189 0.287 0.112 0.151 0.207
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'ReznBrya1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
90 135 157 106 131 154 100 125 149 121 147 76 99 122 78 71 95 117 124 153 177 85 109 134 63 113 141 86 115 143 86 110 136 78 101 125
2.115 2.583 2.78 2.075 2.39 2.491 1.96 2.184 2.311 2.01 2.03 1.842 2.014 2.165 1.817 1.681 1.938 2.132 2.083 2.12 2.358 1.925 2.182 2.443 1.821 2.015 2.226 1.89 2.119 2.327 1.95 2.151 2.352 1.682 1.832 2.047
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'ReznBrya1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
88 114 140 112 135 160 93 120 149 100 126 185 122 148 172 99 125 149 113 141 171 97 121 147 98 128 154 112 139 165 106 130 155
1.768 2.098 2.371 1.815 2.039 2.148 1.723 1.932 2.153 1.739 1.917 2.26 1.95 2.146 2.28 1.791 2.11 2.33 1.736 1.961 2.096 1.736 1.991 2.216 1.651 1.886 2.11 1.929 2.052 2.381 1.777 1.97 2.167
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'ReznBrya1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
22 90 135 157 26 106 131 154 21 100 125 149 23 121 147 26 76 99 122 22 22 78 22 71 95 117 25 124 153 177 25 85 109 134 25 63 113 141 23 27 86 115 143 22 86 110 136 30 78 101 125
0 1 10 22 0 4 6 20 0 3 9 20 0 8 18 0 3 8 13 0 0 3 0 2 6 14 0 6 9 20 0 2 7 16 0 1 7 15 0 0 2 8 16 0 1 7 16 0 2 6 12
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'ReznBrya1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
22 88 114 140 26 112 135 160 21 23 26 22 93 120 149 22 100 126 185 22 25 122 148 172 25 99 125 149 25 113 141 171 23 97 121 147 27 98 128 154 22 112 139 165 30 106 130 155
0 1 3 8 0 2 5 14 0 0 0 0 2 5 10 0 1 4 9 0 0 3 6 15 0 1 4 12 0 2 6 12 0 1 4 11 0 2 5 9 0 1 7 13 0 3 11 20
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'ReznBrya1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
2.115 2.583 2.78 2.075 2.39 2.491 1.96 2.184 2.311 2.01 2.03 1.842 2.014 2.165 1.817 1.681 1.938 2.132 2.083 2.12 2.358 1.925 2.182 2.443 1.821 2.015 2.226 1.89 2.119 2.327 1.95 2.151 2.352 1.682 1.832 2.047
0.222 0.414 0.543 0.188 0.294 0.406 0.165 0.223 0.288 0.189 0.201 0.127 0.172 0.199 0.131 0.106 0.149 0.208 0.21 0.203 0.305 0.145 0.222 0.315 0.121 0.16 0.23 0.133 0.202 0.251 0.135 0.204 0.283 0.094 0.122 0.164
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'ReznBrya1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.768 2.098 2.371 1.815 2.039 2.148 1.723 1.932 2.153 1.739 1.917 2.26 1.95 2.146 2.28 1.791 2.11 2.33 1.736 1.961 2.096 1.736 1.991 2.216 1.651 1.886 2.11 1.929 2.052 2.381 1.777 1.97 2.167
0.13 0.197 0.276 0.129 0.195 0.221 0.102 0.158 0.215 0.103 0.145 0.227 0.148 0.215 0.276 0.115 0.192 0.248 0.109 0.157 0.214 0.112 0.167 0.237 0.087 0.134 0.204 0.141 0.189 0.287 0.112 0.151 0.207
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
D1 = 'This entry is for low predation ecotype guppies, from the Yarra91 river in Trinidad. Only females considered.';
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
'title = {Life-history evolution in guppies (\emph{Poecilia reticulata}: {P}oeciliidae). {V}. {G}enetic basis of parallelism in life histories},'...
'journal = {The American Naturalist},'...
'volume = {147},'...
'number = {3},'...
'pages = {339-359}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,', ' bib,'}'';'];
