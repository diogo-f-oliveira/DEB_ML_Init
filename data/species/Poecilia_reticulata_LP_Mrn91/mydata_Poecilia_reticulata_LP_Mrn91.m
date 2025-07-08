function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_LP_Mrn91

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_LP_Mrn91';
metaData.species_en = 'Trinidadian guppy (LP Marianne91)';

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
data.ab_f1 = 22.82; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'ReznBrya1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 24.82; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'ReznBrya1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';

data.Li = 3.62; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'ReznBrya1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
67 84 104 93 117 141 98 122 147 92 92 115 136 75 96 119 89 111 136 90 113 134 67 88 111 66 88 111 93 118 148 90 114 137 95 116 138 93 114 136 103 126 152
0.1 0.133 0.179 0.208 0.281 0.348 0.174 0.25 0.355 0.187 0.202 0.298 0.382 0.147 0.217 0.295 0.157 0.217 0.231 0.155 0.212 0.262 0.122 0.173 0.232 0.106 0.166 0.217 0.188 0.218 0.185 0.153 0.23 0.333 0.163 0.223 0.301 0.155 0.232 0.342 0.183 0.257 0.233
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'ReznBrya1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
116 155 89 111 134 106 130 155 87 112 134 91 114 138 128 151 179 115 141 87 155 75 97 167 103 128 178 113 139 162 89 114 139 106 128 154 79 103 127
0.137 0.229 0.114 0.165 0.229 0.118 0.168 0.213 0.101 0.159 0.223 0.12 0.19 0.223 0.153 0.214 0.202 0.138 0.158 0.093 0.171 0.076 0.102 0.209 0.135 0.134 0.31 0.148 0.158 0.244 0.099 0.155 0.207 0.122 0.183 0.22 0.084 0.13 0.188
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'ReznBrya1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
67 84 104 93 117 141 98 122 147 92 92 115 136 75 96 119 89 111 136 90 113 134 67 88 111 66 88 111 93 118 148 90 114 137 95 116 138 93 114 136 103 126 152
1.619 1.833 2 2.043 2.28 2.42 1.96 2.183 2.43 1.986 2.042 2.225 2.495 1.851 2.117 2.32 1.881 2.095 2.217 1.852 2.042 2.185 1.715 1.994 2.179 1.64 1.891 2.122 1.985 2.124 2.09 1.945 2.121 2.433 1.892 2.067 2.32 1.876 2.139 2.392 1.965 2.217 2.188
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'ReznBrya1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
116 155 89 111 134 106 130 155 87 112 134 91 114 138 128 151 179 115 141 87 155 75 97 167 103 128 178 113 139 162 89 114 139 106 128 154 79 103 127
1.836 2.136 1.696 1.934 2.152 1.753 1.968 2.182 1.692 1.948 2.134 1.77 2.019 2.22 1.86 2.16 2.094 1.822 1.928 1.651 1.977 1.55 1.719 2.078 1.842 1.899 2.421 1.877 1.956 2.23 1.648 1.9 2.07 1.823 2.07 2.139 1.537 1.762 1.987
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'ReznBrya1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
26 67 84 104 21 93 117 141 29 98 122 147 21 92 22 92 115 136 22 75 96 119 23 89 111 136 24 90 113 134 24 67 88 111 24 24 66 88 111 22 93 118 148 25 90 114 137 25 95 116 138 29 93 114 136 28 103 126 152
0 1 3 9 0 5 15 35 0 2 6 14 0 3 0 6 16 38 0 2 8 22 0 5 13 27 0 4 14 33 0 1 8 24 0 0 2 8 21 0 6 17 21 0 4 15 28 0 6 15 32 0 5 12 18 0 5 14 21
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'ReznBrya1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
26 116 155 21 89 111 134 29 106 130 155 22 87 112 134 22 91 114 138 23 128 151 179 24 115 141 24 87 155 24 75 97 167 24 103 128 178 22 113 139 162 25 89 114 139 25 29 106 128 154 28 79 103 127
0 1 5 0 2 7 16 0 2 10 18 0 2 7 17 0 2 6 13 0 6 14 25 0 5 11 0 6 17 0 1 4 14 0 1 2 4 0 1 7 21 0 1 5 12 0 0 2 10 19 0 1 4 12
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'ReznBrya1996';
comment.tN_f2 = 'Data for low food';

% Total length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
1.619 1.833 2 2.043 2.28 2.42 1.96 2.183 2.43 1.986 2.042 2.225 2.495 1.851 2.117 2.32 1.881 2.095 2.217 1.852 2.042 2.185 1.715 1.994 2.179 1.64 1.891 2.122 1.985 2.124 2.09 1.945 2.121 2.433 1.892 2.067 2.32 1.876 2.139 2.392 1.965 2.217 2.188
0.1 0.133 0.179 0.208 0.281 0.348 0.174 0.25 0.355 0.187 0.202 0.298 0.382 0.147 0.217 0.295 0.157 0.217 0.231 0.155 0.212 0.262 0.122 0.173 0.232 0.106 0.166 0.217 0.188 0.218 0.185 0.153 0.23 0.333 0.163 0.223 0.301 0.155 0.232 0.342 0.183 0.257 0.233
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'ReznBrya1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.836 2.136 1.696 1.934 2.152 1.753 1.968 2.182 1.692 1.948 2.134 1.77 2.019 2.22 1.86 2.16 2.094 1.822 1.928 1.651 1.977 1.55 1.719 2.078 1.842 1.899 2.421 1.877 1.956 2.23 1.648 1.9 2.07 1.823 2.07 2.139 1.537 1.762 1.987
0.137 0.229 0.114 0.165 0.229 0.118 0.168 0.213 0.101 0.159 0.223 0.12 0.19 0.223 0.153 0.214 0.202 0.138 0.158 0.093 0.171 0.076 0.102 0.209 0.135 0.134 0.31 0.148 0.158 0.244 0.099 0.155 0.207 0.122 0.183 0.22 0.084 0.13 0.188
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
D1 = 'This entry is for low predation ecotype guppies, from the Marianne91 river in Trinidad. Only females considered.';
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
