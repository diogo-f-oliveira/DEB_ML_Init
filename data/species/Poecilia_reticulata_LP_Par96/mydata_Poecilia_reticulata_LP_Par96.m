function [data, auxData, metaData, txtData, weights] = mydata_Poecilia_reticulata_LP_Par96

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Actinopterygii';
metaData.order      = 'Cyprinodontiformes';
metaData.family     = 'Poeciliidae';
metaData.species    = 'Poecilia_reticulata_LP_Par96';
metaData.species_en = 'Trinidadian guppy (LP Paria96)';

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical = C2K(26); % K, body temp
metaData.data_0 = {'ab_f'; 'Li'};
metaData.data_1 = {'t-Ww_f'; 't-L_f'; 't-N_f'; 'L_Ww_f'};

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author = {'Tomos Potter'};
metaData.date_subm = [2020 10 20];
metaData.email = {'tomos.potter@zoo.ox.ac.uk'};
metaData.address = {'University of Oxford, UK'};

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2020 12 09]; 

%% set data
% zero-variate data
data.ab_f1 = 23.3; units.ab_f1 = 'd'; label.ab_f1 = 'mean age at birth, high food'; bibkey.ab_f1 = 'Rezn1996';
  temp.ab_f1 = C2K(26); units.temp.ab_f1 = 'K'; label.temp.ab_f1 = 'temperature';
data.ab_f2 = 23.2; units.ab_f2 = 'd'; label.ab_f2 = 'mean age at birth, low food'; bibkey.ab_f2 = 'Rezn1996';
  temp.ab_f2 = C2K(26); units.temp.ab_f2 = 'K'; label.temp.ab_f2 = 'temperature';
data.Li = 3.78; units.Li = 'cm'; label.Li = 'maximum standard length'; bibkey.Li = 'Rezn1996';
  temp.Li = C2K(26); units.temp.Li = 'K'; label.temp.Li = 'temperature';
  
% uni-variate data
% time - wet weight data at multiple f (t-Ww_f data)
data.tWw_f1 = [ ...% time since birth (days), wet weight (g) at high food
92 118 144 71 94 118 97 120 144 95 116 139 72 96 91 114 136 73 95 117 96 120 145 71 97 121 78 100 124 90 111 133 103 125 69 92 114 91 113 136 96 117 139
0.186 0.243 0.304 0.23 0.382 0.545 0.332 0.481 0.601 0.36 0.506 0.672 0.21 0.329 0.315 0.432 0.591 0.235 0.356 0.485 0.344 0.505 0.577 0.258 0.41 0.56 0.224 0.369 0.576 0.309 0.512 0.559 0.423 0.583 0.194 0.307 0.447 0.331 0.461 0.641 0.371 0.504 0.634
]';
units.tWw_f1 = {'d', 'g'}; label.tWw_f1 = {'time since birth', 'wet weight'};
temp.tWw_f1 = C2K(26); units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature'; 
bibkey.tWw_f1 = 'Rezn1996';
comment.tWw_f1 = 'Data for high food';

data.tWw_f2 = [...% time since birth (days), wet weight (g) at low food
85 110 135 127 150 174 97 120 143 82 104 126 77 100 123 101 122 145 98 121 96 121 146 78 103 126 90 115 139 72 95 116 80 101 122 74 98 122 93 115 139 97 120 143
0.188 0.296 0.449 0.399 0.563 0.724 0.243 0.358 0.47 0.174 0.267 0.392 0.16 0.251 0.346 0.276 0.385 0.539 0.275 0.372 0.214 0.31 0.411 0.168 0.289 0.431 0.208 0.346 0.472 0.144 0.238 0.353 0.177 0.271 0.368 0.148 0.246 0.355 0.236 0.339 0.477 0.241 0.357 0.501
]';
units.tWw_f2 = {'d', 'g'}; label.tWw_f2 = {'time since birth', 'wet weight'};
temp.tWw_f2 = C2K(26); units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature'; 
bibkey.tWw_f2 = 'Rezn1996';
comment.tWw_f2 = 'Data for low food';
  
% time-standard length data at mutliple f (t-L_f data)
data.tL_f1 = [...% time since birth (days), standard length (cm) at high food
92 118 144 71 94 118 97 120 144 95 116 139 72 96 91 114 136 73 95 117 96 120 145 71 97 121 78 100 124 90 111 133 103 125 69 92 114 91 113 136 96 117 139
1.901 2.082 2.271 2.114 2.457 2.783 2.267 2.558 2.712 2.418 2.675 2.915 2.033 2.31 2.265 2.526 2.753 2.118 2.392 2.64 2.444 2.753 2.884 2.182 2.553 2.847 2.031 2.381 2.7 2.315 2.612 2.809 2.495 2.769 1.975 2.285 2.571 2.303 2.628 2.837 2.41 2.666 2.881
]';
units.tL_f1 = {'d', 'cm'}; label.tL_f1 = {'time since birth', 'standard length'};
temp.tL_f1 = C2K(26); units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature'; 
bibkey.tL_f1 = 'Rezn1996';
comment.tL_f1 = 'Data for high food';

data.tL_f2 = [...% time since birth (days), standard length (cm) at low food
85 110 135 127 150 174 97 120 143 82 104 126 77 100 123 101 122 145 98 121 96 121 146 78 103 126 90 115 139 72 95 116 80 101 122 74 98 122 93 115 139 97 120 143
1.959 2.235 2.505 2.403 2.69 2.915 2.103 2.374 2.584 1.925 2.223 2.493 1.944 2.185 2.418 2.255 2.468 2.741 2.192 2.432 2.103 2.338 2.518 1.914 2.27 2.536 1.996 2.298 2.554 1.826 2.103 2.381 1.947 2.177 2.444 1.867 2.154 2.427 2.11 2.377 2.639 2.106 2.376 2.612
]';
units.tL_f2 = {'d', 'cm'}; label.tL_f2 = {'time since birth', 'standard length'};
temp.tL_f2 = C2K(26); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature'; 
bibkey.tL_f2 = 'Rezn1996';
comment.tL_f2 = 'Data for low food';

% time - cumulative # of offspring data at multiple f (t-N_f data)
data.tN_f1 = [...% time since birth (days), cumulative number of offspring (#), at high food
26 92 118 144 26 71 94 118 23 97 120 144 28 95 116 139 27 72 96 24 91 114 136 20 73 95 117 26 96 120 145 21 71 97 121 26 78 100 124 22 90 111 133 22 74 103 125 23 69 92 114 20 91 113 136 24 96 117 139
0 3 13 30 0 5 12 35 0 16 43 80 0 6 20 50 0 5 20 0 11 25 52 0 3 12 32 0 13 38 73 0 3 20 34 0 2 12 35 0 9 22 45 0 6 15 31 0 3 15 36 0 14 40 77 0 9 28 58
]';
units.tN_f1 = {'d', '#'}; label.tN_f1 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f1 = C2K(26); units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature'; 
bibkey.tN_f1 = 'Rezn1996';
comment.tN_f1 = 'Data for high food';

data.tN_f2 = [...% time since birth (days), cumulative number of offspring (#), at low food
26 85 110 135 26 127 150 174 23 97 120 143 28 82 104 126 27 77 100 123 24 101 122 145 20 98 121 26 96 121 146 21 78 103 126 26 90 115 139 22 72 95 116 22 80 101 122 23 74 98 122 20 93 115 139 24 97 120 143
0 1 9 24 0 10 15 43 0 9 25 49 0 1 6 17 0 1 8 23 0 4 11 26 0 7 23 0 2 12 31 0 1 3 17 0 2 6 16 0 2 8 15 0 2 6 20 0 2 11 25 0 9 16 35 0 10 27 48
]';
units.tN_f2 = {'d', '#'}; label.tN_f2 = {'time since birth', 'cumulative number of offspring'};
temp.tN_f2 = C2K(26); units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature'; 
bibkey.tN_f2 = 'Rezn1996';
comment.tN_f2 = 'Data for low food';

% Standard length - wet weight data at multiple f (L-Ww_f data)
data.LWw_f1 = [...% standard length (cm), wet weight (g), at high food
1.901 2.082 2.271 2.114 2.457 2.783 2.267 2.558 2.712 2.418 2.675 2.915 2.033 2.31 2.265 2.526 2.753 2.118 2.392 2.64 2.444 2.753 2.884 2.182 2.553 2.847 2.031 2.381 2.7 2.315 2.612 2.809 2.495 2.769 1.975 2.285 2.571 2.303 2.628 2.837 2.41 2.666 2.881
0.186 0.243 0.304 0.23 0.382 0.545 0.332 0.481 0.601 0.36 0.506 0.672 0.21 0.329 0.315 0.432 0.591 0.235 0.356 0.485 0.344 0.505 0.577 0.258 0.41 0.56 0.224 0.369 0.576 0.309 0.512 0.559 0.423 0.583 0.194 0.307 0.447 0.331 0.461 0.641 0.371 0.504 0.634
]';
units.LWw_f1 = {'cm', 'g'}; label.LWw_f1 = {'standard length', 'wet weight'};
temp.LWw_f1 = C2K(26); units.temp.LWw_f1 = 'K'; label.temp.LWw_f1 = 'temperature'; 
bibkey.LWw_f1 = 'Rezn1996';
comment.LWw_f1 = 'Data for high food';

data.LWw_f2 = [...% standard length (cm), wet weight (g), at low food
1.959 2.235 2.505 2.403 2.69 2.915 2.103 2.374 2.584 1.925 2.223 2.493 1.944 2.185 2.418 2.255 2.468 2.741 2.192 2.432 2.103 2.338 2.518 1.914 2.27 2.536 1.996 2.298 2.554 1.826 2.103 2.381 1.947 2.177 2.444 1.867 2.154 2.427 2.11 2.377 2.639 2.106 2.376 2.612
0.188 0.296 0.449 0.399 0.563 0.724 0.243 0.358 0.47 0.174 0.267 0.392 0.16 0.251 0.346 0.276 0.385 0.539 0.275 0.372 0.214 0.31 0.411 0.168 0.289 0.431 0.208 0.346 0.472 0.144 0.238 0.353 0.177 0.271 0.368 0.148 0.246 0.355 0.236 0.339 0.477 0.241 0.357 0.501
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
set1 = {'tL_f1','tL_f2'};   subtitle1 = {'Rezn1996 data age/length for high and low food'};
set2 = {'tWw_f1','tWw_f2'}; subtitle2 = {'Rezn1996 data age/wet weight for high and low food'};
set3 = {'LWw_f1','LWw_f2'}; subtitle3 = {'Rezn1996 data length/wet weight for high and low food'};
set4 = {'tN_f1', 'tN_f2'}; subtitle4 = {'Rezn1996 data time/number of offspring for high and low food'}; metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'This entry is for low predation ecotype guppies, from the Paria96 river in Trinidad. Only females considered.';
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
bibkey = 'Rezn1996'; type = 'misc'; bib = [ ...
'author = {Reznick, D. N. },'...
'year = {1996}, '...
'note = {Unpublished dataset}'];
metaData.biblist.(bibkey) = ['''@', type,'{', bibkey,', ' bib,'}'';'];
