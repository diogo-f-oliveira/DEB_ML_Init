function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_HP_Yar91

%% set metaData
metaData.phylum = 'Chordata';
metaData.class = 'Actinopterygii';
metaData.order = 'Cyprinodontiformes';
metaData.family = 'Poeciliidae';
metaData.species = 'Poecilia_reticulata_HP_Yar91';
metaData.species_en = 'Trinidadian guppy (HP Yarra91)';

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
data.ab_f1 = 22.0333333; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'ReznBrya1996';
temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 22.2; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'ReznBrya1996';
temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';

data.Li = 3.85; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'ReznBrya1996';
temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';

% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
71 93 118 66 90 113 70 93 116 95 118 141 67 92 115 68 88 109 67 91 113 93 114 137 85 103 123 68 89 111 68 90 112 66 87 108 62 81 101 87 110 133 65 86 109
0.129 0.181 0.25 0.125 0.192 0.272 0.111 0.191 0.259 0.184 0.253 0.377 0.131 0.217 0.313 0.114 0.16 0.241 0.113 0.175 0.25 0.151 0.206 0.305 0.173 0.214 0.275 0.118 0.162 0.234 0.12 0.173 0.25 0.117 0.17 0.234 0.117 0.162 0.205 0.164 0.227 0.338 0.107 0.162 0.24
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
bibkey.tWw_f1 = 'ReznBrya1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
93 114 134 99 122 145 87 111 134 89 111 134 106 130 156 89 113 136 146 168 96 119 142 87 108 131 102 122 141 75 97 119 65 87 110 94 116 136 90 111 132 101 145
0.105 0.156 0.206 0.129 0.185 0.247 0.112 0.164 0.227 0.107 0.161 0.224 0.143 0.197 0.221 0.115 0.176 0.235 0.214 0.274 0.109 0.15 0.207 0.097 0.149 0.202 0.112 0.164 0.214 0.073 0.111 0.155 0.054 0.086 0.147 0.106 0.143 0.178 0.101 0.148 0.2 0.112 0.157
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
bibkey.tWw_f2 = 'ReznBrya1996';
comment.tWw_f2 = 'Data for low food';

% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
71 93 118 66 90 113 70 93 116 95 118 141 67 92 115 68 88 109 67 91 113 93 114 137 85 103 123 68 89 111 68 90 112 66 87 108 62 81 101 87 110 133 65 86 109
1.81 2.065 2.315 1.822 2.096 2.319 1.761 2.111 2.321 2.147 2.422 2.667 1.84 2.157 2.396 1.752 2.031 2.258 1.764 2.044 2.39 1.947 2.119 2.37 2.07 2.26 2.455 1.72 1.982 2.172 1.759 2.041 2.256 1.823 2.13 2.321 1.793 2.01 2.183 2.033 2.33 2.576 1.698 1.954 2.174
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'ReznBrya1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
93 114 134 99 122 145 87 111 134 89 111 134 106 130 156 89 113 136 146 168 96 119 142 87 108 131 102 122 141 75 97 119 65 87 110 94 116 136 90 111 132 101 145
1.772 1.978 2.184 1.98 2.171 2.387 1.795 2.089 2.287 1.688 1.999 2.213 1.984 2.169 2.266 2.157 2.012 2.229 2.311 2.412 1.826 1.991 2.232 1.758 1.975 2.194 1.846 2.016 2.214 1.569 1.784 2.045 1.45 1.77 1.958 1.797 1.984 2.159 1.772 1.972 2.182 1.758 1.964
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'ReznBrya1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
22 23 71 93 118 22 66 90 113 22 70 93 116 20 95 118 141 21 67 92 115 20 68 88 109 22 67 91 113 23 93 114 137 23 85 103 123 23 68 89 111 22 68 90 112 22 66 87 108 21 62 81 101 22 87 110 133 22 65 86 109
0 0 2 10 24 0 2 9 18 0 2 12 30 0 8 25 47 0 5 14 28 0 1 6 20 0 3 14 29 0 6 12 22 0 4 17 36 0 1 7 16 0 3 10 21 0 3 9 20 0 3 11 29 0 10 21 41 0 3 6 15
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'ReznBrya1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
22 93 114 134 23 99 122 145 22 87 111 134 22 89 111 134 20 106 130 156 21 89 113 136 20 146 168 22 96 119 142 23 87 108 131 23 102 122 141 23 22 75 97 119 22 65 87 110 21 94 116 136 22 90 111 132 22 101 120 145
0 5 13 25 0 2 7 15 0 2 7 16 0 2 8 19 0 5 14 27 0 3 8 19 0 24 49 0 6 18 34 0 2 6 15 0 4 10 20 0 0 1 4 11 0 2 6 16 0 4 14 28 0 1 5 15 0 1 5 9
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'ReznBrya1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
1.81 2.065 2.315 1.822 2.096 2.319 1.761 2.111 2.321 2.147 2.422 2.667 1.84 2.157 2.396 1.752 2.031 2.258 1.764 2.044 2.39 1.947 2.119 2.37 2.07 2.26 2.455 1.72 1.982 2.172 1.759 2.041 2.256 1.823 2.13 2.321 1.793 2.01 2.183 2.033 2.33 2.576 1.698 1.954 2.174
0.129 0.181 0.25 0.125 0.192 0.272 0.111 0.191 0.259 0.184 0.253 0.377 0.131 0.217 0.313 0.114 0.16 0.241 0.113 0.175 0.25 0.151 0.206 0.305 0.173 0.214 0.275 0.118 0.162 0.234 0.12 0.173 0.25 0.117 0.17 0.234 0.117 0.162 0.205 0.164 0.227 0.338 0.107 0.162 0.24
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature';
bibkey.LWw_f1 = 'ReznBrya1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.772 1.978 2.184 1.98 2.171 2.387 1.795 2.089 2.287 1.688 1.999 2.213 1.984 2.169 2.266 2.157 2.012 2.229 2.311 2.412 1.826 1.991 2.232 1.758 1.975 2.194 1.846 2.016 2.214 1.569 1.784 2.045 1.45 1.77 1.958 1.797 1.984 2.159 1.772 1.972 2.182 1.758 1.964
0.105 0.156 0.206 0.129 0.185 0.247 0.112 0.164 0.227 0.107 0.161 0.224 0.143 0.197 0.221 0.115 0.176 0.235 0.214 0.274 0.109 0.15 0.207 0.097 0.149 0.202 0.112 0.164 0.214 0.073 0.111 0.155 0.054 0.086 0.147 0.106 0.143 0.178 0.101 0.148 0.2 0.112 0.157
]';
units.LWw_f2 = {'cm', 'g'}; label.LWw_f2 = {'standard length', 'wet weight'};
temp.LWw_f2 = C2K(26); units.temp.LWw_f2 = 'K'; label.temp.LWw_f2 = 'temperature';
bibkey.LWw_f2 = 'ReznBrya1996';
comment.LWw_f2 = 'Data for low food';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'This entry is for high predation ecotype guppies, from the Yarra91 river in Trinidad. Only females considered.';
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
'pages = {Table 4.2 (page 150), 8.1 (page 300)},' ...
'howpublished = {}'];
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
