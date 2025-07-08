function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_ambigua
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_ambigua'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH','TN'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-N'; 'T-ab'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 13]; 

%% set data
% zero-variate data

data.tp = 14;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'LeiArmi1980';   
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 147;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'LeiArmi1980';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.041; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb = 'LeiArmi1980';
data.Lp  = 0.083; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp = 'LeiArmi1980';
data.Li  = 0.136;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li = 'LeiArmi1980';

data.Wdi  = 16.1;  units.Wdi = 'mug'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Ceriodaphnia_pulchella: (0.136/0.09)^3*4.668';
  
% uni-variate data
% time-length
data.tL10_f = [ ... % time since birth (d), length (mm), 
0.644	0.404
3.436	0.518
6.442	0.649
10.521	0.769
16.104	0.824
22.331	0.851
27.914	0.908
34.141	0.961
39.509	0.988
45.736	1.041
52.607	1.060
59.908	1.102
67.209	1.106
73.650	1.135
81.166	1.169
87.607	1.219
94.049	1.251
100.920	1.278
107.577	1.308
114.877	1.331
123.466	1.322
133.344	1.282
140.215	1.354
146.442	1.358];
data.tL10_f(:,2) = data.tL10_f(:,2)/10; % convert mm to cm
units.tL10_f  = {'d', 'cm'};  label.tL10_f = {'time since birth', 'length', 'female at 10 C'};  
temp.tL10_f   = C2K(10); units.temp.tL10_f = 'K'; label.temp.tL10_f = 'temperature';
bibkey.tL10_f = 'LeiArmi1980'; comment.tL10_f = 'Data for female';
%
data.tL10_m = [ ...
0.429	0.411
3.436	0.497
6.656	0.564
10.521	0.619
16.319	0.663
22.117	0.684
27.270	0.697
34.785	0.724
42.301	0.728
47.883	0.743
54.540	0.751
62.270	0.764
72.362	0.751
79.233	0.768
87.178	0.795
91.902	0.799
99.847	0.799
107.577	0.801];
data.tL10_m(:,2) = data.tL10_m(:,2)/10; % convert mm to cm
units.tL10_m  = {'d', 'cm'};  label.tL10_m = {'time since birth', 'length', 'male at 10 C'};  
temp.tL10_m   = C2K(10); units.temp.tL10_m = 'K'; label.temp.tL10_m = 'temperature';
bibkey.tL10_m = 'LeiArmi1980'; comment.tL10_m = 'Data for male';
%
data.tL5_f = [ ... % time since birth (d), length (mm) 
0.644	0.337
6.656	0.423
12.883	0.524
19.325	0.663
28.344	0.767
39.080	0.840
50.675	0.925
62.485	0.973
75.798	1.055
88.252	1.086
101.135	1.103
114.018	1.168
127.761	1.179
141.503	1.197
];
data.tL5_f(:,2) = data.tL5_f(:,2)/10; % convert mm to cm
units.tL5_f  = {'d', 'cm'};  label.tL5_f = {'time since birth', 'length', 'female at 5 C'};  
temp.tL5_f   = C2K(5); units.temp.tL5_f = 'K'; label.temp.tL5_f = 'temperature';
bibkey.tL5_f = 'LeiArmi1980'; comment.tL5_f = 'Data for female';

% time-reprod
data.tN10 = [ ...  % time since birth (d), young per brood (#)
16.357	5.281
21.964	6.727
27.802	7.657
34.284	8.236
39.250	9.930
45.889	11.789
52.555	12.988
59.205	9.579
66.518	10.384
73.685	9.661
80.262	7.967
87.169	8.442
93.759	11.459
99.815	12.202
107.113	13.360
114.076	12.471
122.492	11.996
132.022	4.992
139.534	6.025
146.209	12.037
156.663	7.988];
data.tN10(:,2) = cumsum(data.tN10(:,2));
units.tN10  = {'d', '#'};  label.tN10 = {'time since birth', 'length', '10 C'};  
temp.tN10   = C2K(10); units.temp.tN10 = 'K'; label.temp.tN10 = 'temperature';
bibkey.tN10 = 'LeiArmi1980'; 
%
data.tN5 = [ ...  % time since birth (d), young per brood (#)
27.746	3.979
39.218	5.694
49.985	9.227
62.065	11.459
75.601	14.021
88.258	7.492
100.788	14.021
113.951	10.467
127.417	14.682
141.297	9.041
152.967	6.045];
data.tN5(:,2) = cumsum(data.tN5(:,2));
units.tN5  = {'d', '#'};  label.tN5 = {'time since birth', 'length', '5 C'};  
temp.tN5   = C2K(5); units.temp.tN5 = 'K'; label.temp.tN5 = 'temperature';
bibkey.tN5 = 'LeiArmi1980'; 

% temperature-brood interval
data.Tab = [ ... % temperature (C), brood interval (d)
     2 21.43
     5 12.67
    10  5.97
    15  3.25
    20  2.37
    25  1.56
    30  1.35];
units.Tab  = {'C', 'd'};  label.Tab = {'temperature', 'brood interval'};  
bibkey.Tab = 'LeiArmi1980'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL10_f = 3 * weights.tL10_f;
weights.tL10_m = 3 * weights.tL10_m;
weights.tL5_f = 3 * weights.tL5_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL10_f','tL5_f','tL10_m'}; subtitle1 = {'Data for female (10,5 C), male (10 C)'};
set2 = {'tN10','tN5'}; subtitle2 = {'Data for 10, 5 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed ti differ from females by {p_Am} and only';
D2 = 'ab is ignored in estimation because of inconsistency with tL data; a delay in the onset of development might be present';
metaData.discussion = struct('D1',D1, 'D2',D2);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6CCT2'; % Cat of Life
metaData.links.id_ITIS = '83888'; % ITIS
metaData.links.id_EoL = '46498269'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_ambigua'; % ADW
metaData.links.id_Taxo = '156178'; % Taxonomicon
metaData.links.id_WoRMS = '157608'; % WoRMS

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
bibkey = 'LeiArmi1980'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3544724}, ' ...
'author = {Chi-Hsiang Lei and Kenneth B. Armitage}, ' ... 
'year = {1980}, ' ...
'title = {Growth, Development and Body Size of Field and Laboratory Populations of \emph{Daphnia ambigua}}, ' ...
'journal = {Oikos}, ' ...
'volume = {35(1)}, ' ...
'pages = {31–48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
