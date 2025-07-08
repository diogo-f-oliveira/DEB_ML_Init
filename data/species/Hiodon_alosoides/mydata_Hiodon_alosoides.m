  function [data, auxData, metaData, txtData, weights] = mydata_HHiodon_alosoides

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Hiodontiformes'; 
metaData.family     = 'Hiodontidae';
metaData.species    = 'Hiodon_alosoides'; 
metaData.species_en = 'Goldeye'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFl', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f','t-Ww_f'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 01];                           
metaData.email    = {'Bas.Kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, the Boelelaan 1085, 1081 HV Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 01]; 

%% set data
% zero-variate data
data.tp = 8*365; units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Wiki';
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6 - 9 yr';
data.am = 14*365;units.am = 'd';    label.am = 'life span';               bibkey.am = 'EoL';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 21.1;   units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'WallYeag1990';
  temp.Lp = C2K(21); units.temp.Lp = 'K'; label.temp.Lp = 'temperature';
  comment.Lp = 'based on TL 26 cm and F1';
data.Li = 45.7;   units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase'; 
  comment.Li = 'based on FL 52 cm and F1';

data.Wwb = 3.3e-2;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'WallYeag1990'; 
  comment.Wwb = 'based on egg diameter of 4 mm: pi/6*0.4^3';
data.Wwi = 1720;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL'; 
  
data.Ri = 2.5e4/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'WallYeag1990';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time - length
data.tL_0 = [ ...
35.490	1.290
48.151	1.401
57.430	2.527
62.976	3.105
69.457	3.827
76.801	4.374
78.677	4.693
84.275	5.502
98.277	7.554
104.751	8.247
111.205	8.853
117.483	8.677
127.548	9.281
148.402	9.708];
units.tL_0 = {'d', 'cm'};     label.tL_0 = {'time since 1 May 1973', 'fork length', '0 yr class 1973'};  bibkey.tL_0 = 'DonaKooy2011';
temp.tL_0 = C2K(21);  units.temp.tL_0 = 'K'; label.temp.tL_0 = 'temperature';
comment.tL_0 = 'Data for 0 yr class 1973';
%
data.tL_2 = [ ...
21.639	15.904
34.372	16.334
46.928	15.981
54.442	17.282
57.973	16.933
67.174	17.712
81.843	18.720
96.413	19.294
103.417	18.335
109.878	18.970
119.857	19.197
146.002	19.071
153.196	18.952
158.637	19.066
174.037	19.320];
units.tL_2 = {'d', 'cm'};     label.tL_2 = {'time since 1 May 1973', 'fork length', '2 yr class 1973'};  bibkey.tL_2 = 'DonaKooy2011';
temp.tL_2 = C2K(21);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
comment.tL_2 = 'Data for 2 yr class 1973';

% time - weight
data.tWw_0 = [ ...
36.266	0.029
48.038	0.000
54.404	0.058
61.719	0.234
69.087	0.556
81.050	1.053
98.626	4.532
107.282	5.906
112.195	6.959
123.146	7.164
127.100	8.070
131.558	7.865
149.140	8.860];
units.tWw_0 = {'d', 'g'};     label.tWw_0 = {'time since 1 May 1973', 'wet weight', '0 yr class 1973'};  bibkey.tWw_0 = 'DonaKooy2011';
temp.tWw_0 = C2K(21);  units.temp.tWw_0 = 'K'; label.temp.tWw_0 = 'temperature';
comment.tWw_0 = 'Data for 0 yr class 1973';
%
data.tWw_2 = [ ...
22.020	38.738
33.067	47.184
46.557	41.942
53.195	56.505
60.352	51.845
69.598	60.874
85.147	67.864
94.311	72.816
101.409	65.243
108.813	72.816
118.807	73.981
146.928	75.146
156.816	71.068
170.523	76.602];
units.tWw_2 = {'d', 'g'};     label.tWw_2 = {'time since 1 May 1973', 'wet weight', '2 yr class 1973'};  bibkey.tWw_2 = 'DonaKooy2011';
temp.tWw_2 = C2K(21);  units.temp.tWw_2 = 'K'; label.temp.tWw_2 = 'temperature';
comment.tWw_2 = 'Data for 2 yr class 1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_2','tL_0'}; subtitle1 = {'Data for yr class 2 and 0'};
set2 = {'tWw_2','tWw_0'}; subtitle2 = {'Data for yr class 2 and 0'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'tL and tWw data were fitted with seasonally varying food, but constant temperature, on the basis of the remark that "growth ceased while temperature was still favourable"';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts 
F1 = 'length-length from photo: SL=0.81*TL and SL=0.88*FL';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LYQH'; % Cat of Life
metaData.links.id_ITIS = '161905'; % ITIS
metaData.links.id_EoL = '994821'; % Ency of Life
metaData.links.id_Wiki = 'Hiodon_alosoides'; % Wikipedia
metaData.links.id_ADW = 'Hiodon_alosoides'; % ADW
metaData.links.id_Taxo = '42723'; % Taxonomicon
metaData.links.id_WoRMS = '567532'; % WoRMS
metaData.links.id_fishbase = 'Hiodon-alosoides'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hiodon_alosoides}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/994821}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hiodon-alosoides.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DonaKooy2011'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z77-132}, ' ...
'author = {D. B. Donald and A. H. Kooyman}, ' ...
'year = {2011}, ' ...
'title  = {Food, feeding habits, and growth of goldeye, \emph{Hiodon alosoides}({R}afinesque), in the waters of the {A}thabasca {D}elta }, ' ...
'journal = {Ca. J. Zool.}, ' ...
'volume = {55}, ' ...
'pages = {1038-1047}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

