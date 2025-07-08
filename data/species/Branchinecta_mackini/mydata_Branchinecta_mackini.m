function [data, auxData, metaData, txtData, weights] = mydata_Branchinecta_mackini
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Branchinectidae';
metaData.species    = 'Branchinecta_mackini'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TH','TPi'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 17]; 

%% set data
% zero-variate data

data.tp = 40;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Dabo1977';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 72;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Dabo1977';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.05; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'Dabo1977';
data.Lp  = 1.77;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Dabo1977';
data.Li  = 2.3;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Dabo1977';
  
data.Wdi  = 0.0207;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.3/1)^3';

data.Ri  = 3*225/40;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Dabo1977';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '255 eggs per clutch, 3 clutches assumed in 40 d';

% uni-variate data
% time-length
data.tL_70 = [ ... % time since birth (d), length (cm), females, males
 0.528	0.092 0.074
 2.654	0.100 0.096
10.981	0.134 0.099
14.524	0.164 0.130
20.528	0.524 0.488
27.238	0.935 0.954
35.351	1.581 1.627
41.539	1.834 1.886
50.557	2.167 2.068
54.981	2.284 2.219
63.309	2.304 2.380
70.755	2.251 2.162];
units.tL_70   = {'d', 'cm'}; label.tL_70 = {'time since birth', 'length'};  
temp.tL_70 = C2K(14); units.temp.tL_70 = 'K'; label.temp.tL_70 = 'temperature'; 
bibkey.tL_70 = 'Dabo1977'; 
treat.tL_70 = {1 {'females','males'}}; label.treat.tL_70 = 'Fleeinghorse Lake, 1970';
%
data.tL_71 = [ ... % time since birth (d), length (cm), females, males
0.330	0.029 0.040
3.224	0.036 0.078
9.186	0.029 0.066
13.945	0.086 0.112
15.125	0.158 0.170
21.615	1.055 1.106
25.836	1.270 1.388
30.555	1.565 1.519
32.405	1.701 1.714
38.501	1.909 1.933
42.579	1.967 1.978
44.615	2.010 2.043
55.343	2.024 2.192
60.792	2.031 2.102
65.563	2.017 2.155
70.343	1.952 2.035];
units.tL_71   = {'d', 'cm'}; label.tL_71 = {'time since birth', 'length'};  
temp.tL_71 = C2K(14); units.temp.tL_71 = 'K'; label.temp.tL_71 = 'temperature'; 
bibkey.tL_71 = 'Dabo1977'; 
treat.tL_71 = {1 {'females','males'}}; label.treat.tL_71 = 'Fleeinghorse Lake, 1971';
%
data.tL_72 = [ ... % time since birth (d), length (cm), females, males
0.500	0.028 0.052
5.922	0.080 0.088
8.687	0.087 0.111
15.733	0.118 0.131
21.733	0.434 0.442
29.314	1.032 1.067
35.787	1.640 1.692
43.121	2.131 2.116
49.312	2.257 2.286
55.814	2.254 2.277
64.412	2.179 2.203
69.132	2.119 2.131];
units.tL_72   = {'d', 'cm'}; label.tL_72 = {'time since birth', 'length'};  
temp.tL_72 = C2K(14); units.temp.tL_72 = 'K'; label.temp.tL_72 = 'temperature'; 
bibkey.tL_72 = 'Dabo1977'; 
treat.tL_72 = {1 {'females','males'}}; label.treat.tL_72 = 'Fleeinghorse Lake, 1972';

%% set weights for all real data
weights = setweights(data, []);
weights.Wdi = weights.Wdi * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only'; 
D2 = 'temperature (in C) in tL data is assumed as T(t) = spline1(t,[0 3; 10 5; 30 20; 60 25])';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7WXPR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '1020248'; % Ency of Life
metaData.links.id_Wiki = 'Branchinecta'; % Wikipedia
metaData.links.id_ADW = 'Branchinecta_mackini'; % ADW
metaData.links.id_Taxo = '143803'; % Taxonomicon
metaData.links.id_WoRMS = '1214293'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dabo1977'; type = 'Article'; bib = [ ... 
'doi = {10.1139/277-020}, ' ...
'author = {Graham R. Daborn}, ' ... 
'year = {1977}, ' ...
'title = {The life history of \emph{Branchinecta mackini} {D}exter ({C}rustacea: {A}nostraca) in an argillotrophic lake of {A}lberta}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {55}, ' ...
'pages = {161-168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
