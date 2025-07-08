function [data, auxData, metaData, txtData, weights] = mydata_Opsaridium_microcephalum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Opsaridium_microcephalum'; 
metaData.species_en = 'Mpasa'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 19];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'guess';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.tp = 'temperature';
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'Twed1987';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23.7;    units.Lp = 'cm'; label.Lp = 'std length at puberty';    bibkey.Lp = 'fishbase';
data.Li = 60;    units.Li = 'cm'; label.Li = 'ultimate std length';        bibkey.Li = 'Twed1983';
  comment.Li = 'fishbase gives 34 cm';

data.Wwb = 8.3e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi = 1.9e3;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';     bibkey.Wwi = {'fishbase','Twed1983'};
  comment.Wwi = 'based on 0.00708*Li^3.05, see F1';
 
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.359	4.611
0.729	9.223
0.892	10.054
2.038	21.062
3.011	32.299
4.007	43.536
4.980	53.358
5.977	58.938];
data.tL(:,1) = (0+data.tL(:,1))*365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Twed1987';
%
data.tL_S = [ ... % time since birth (yr), total length (cm)
28.571	1.459
30.204	1.784
33.469	1.914
33.741	2.043
34.558	1.686
34.830	2.141
36.190	2.141
36.735	1.881
38.639	2.465
40.000	2.854
40.272	2.335
41.905	2.270
42.177	2.595
42.721	2.562
45.170	2.659
45.986	2.984
45.986	2.919
46.259	2.465
47.347	3.568
48.435	3.114
48.980	2.984
50.068	2.822
51.156	3.308
51.701	3.114
52.245	2.822
53.061	3.049
56.599	3.146
57.959	3.762
59.048	3.146
61.497	4.119
73.741	5.059
90.068	5.935
91.973	5.546
92.517	5.935
92.517	7.589
94.150	6.681
94.694	5.838
97.143	5.578
97.959	6.065
99.864	7.914
100.680	6.681
101.769	8.400
104.218	6.292
104.762	6.876
105.578	7.427
106.122	6.584
106.939	8.011
110.748	7.849
111.020	6.292
111.837	7.589
112.653	6.195
114.014	6.422
119.184	9.632
119.728	7.395
121.905	8.270
124.354	8.108
127.347	9.762
128.707	10.573
132.245	10.151];
for i=2:size(data.tL_S,1); if data.tL_S(i,1)<=data.tL_S(i-1,1);data.tL_S(i,1)=data.tL_S(i-1,1)+1e-3;end;end
data.tL_S(:,1) = data.tL_S(:,1) - 15;
units.tL_S = {'d', 'cm'}; label.tL_S = {'time since birth', 'total length', 'summer-born'};  
temp.tL_S = C2K(27);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
comment.tL_S = 'Data for  winter-born group';
bibkey.tL_S = 'Mori2002';
%
data.tL_W = [ ... % time since birth (yr), total length (cm)
47.347	1.946
58.231	2.692
59.320	2.822
59.864	2.595
63.946	2.789
64.490	3.405
67.211	2.984
68.571	3.114
72.653	3.697
73.197	3.503
73.197	3.600
73.469	3.178
73.741	3.049
74.014	2.595
75.646	3.308
76.190	2.984
77.007	3.697
77.279	3.178
77.823	3.535
77.823	3.535
78.095	3.730
80.544	3.535
82.721	4.346
82.993	3.697
84.082	4.346
84.082	4.541
84.082	4.119
84.354	3.568
85.442	3.989
85.986	4.281
86.259	3.892
87.075	4.443
87.347	4.605
87.891	5.481
89.252	4.086
89.524	3.957
89.524	4.476
89.524	4.735
90.612	4.605
90.884	5.157
91.156	4.897
91.429	4.541
92.517	3.989
92.789	4.314
93.061	4.962
93.605	4.638
93.605	4.508
94.150	5.676
94.966	5.578
94.966	4.800
94.966	4.119
95.238	5.416
95.782	5.157
95.782	4.346
96.599	4.930
97.415	4.865
97.687	5.351
99.048	5.157
99.320	4.151
100.136	4.443
101.769	5.092
103.673	4.670
103.946	5.286
104.490	4.411
105.306	4.930
105.306	4.411
105.578	5.449
105.850	5.578
105.850	5.514
106.395	4.897
107.211	4.119
107.483	5.514
107.483	4.703
107.755	5.546
108.571	5.838
110.204	5.741
112.109	5.935
114.014	5.838
117.007	5.416
118.095	5.773
118.095	5.643
118.095	6.000
119.456	5.676
121.633	6.811
122.177	5.092
122.993	6.389
124.898	5.903
126.531	5.611
127.347	6.130
128.435	6.519
130.884	6.259
135.510	7.232
141.224	6.649];
for i=2:size(data.tL_W,1); if data.tL_W(i,1)<=data.tL_W(i-1,1);data.tL_W(i,1)=data.tL_W(i-1,1)+1e-3;end;end
data.tL_W(:,1) = data.tL_W(:,1) - 15;
units.tL_W = {'d', 'cm'}; label.tL_W = {'time since birth', 'total length', 'winter-born'};  
temp.tL_W = C2K(22);  units.temp.tL_W = 'K'; label.temp.tL_W= 'temperature';
comment.tL_W = 'Data for winter-born group';
bibkey.tL_W = 'Mori2002';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
19.487	1400.320
21.555	2114.179
22.773	2730.364
25.781	3777.247
28.493	5386.752
30.168	6709.810
31.915	4884.681
32.593	8412.057
33.572	7006.532
33.966	6350.346
34.319	7526.686
35.121	9738.813
35.181	11289.823
35.231	4899.065
37.571	14495.682
38.629	9660.044
38.648	12996.592
39.250	15677.776
39.827	15304.339
40.455	12675.485
42.236	13529.075
42.448	12543.152
48.261	15246.940
49.071	17130.152
51.771	19256.524
52.936	17992.783
55.288	18754.863];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(27);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Twed1983';
comment.LN = 'data for June-Sept';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_S = 2 * weights.tL_S;
weights.tL_W = 2 * weights.tL_W;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_S','tL_W'}; subtitle1 = {'Data for summer, winter born group'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74RXB'; % Cat of Life
metaData.links.id_ITIS = '689547'; % ITIS
metaData.links.id_EoL = '207484'; % Ency of Life
metaData.links.id_Wiki = 'Opsaridium_microcephalum'; % Wikipedia
metaData.links.id_ADW = 'Opsaridium_microcephalum'; % ADW
metaData.links.id_Taxo = '182079'; % Taxonomicon
metaData.links.id_WoRMS = '1019254'; % WoRMS
metaData.links.id_fishbase = 'Opsaridium-microcephalum'; % fishbase

%% References
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
bibkey = 'Mori2002'; type = 'Article'; bib = [ ... 
'doi = {10.1080/15627020.2002.11657172}, ' ...
'author = {Shinsuke Morioka}, ' ...
'year = {2002}, ' ...
'title = {Otolith features and growth of juvenile \emph{Opsaridium microcephalum} ({P}isces: {C}yprinidae) from the southwestern shoreline of {L}ake {M}alawi}, ' ... 
'journal = {African Zoology}, ' ...
'volume = {37(2)}, '...
'pages = {165-170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Twed1983'; type = 'Article'; bib = [ ... 
'doi = {10.1080/03779688.1983.9639407}, ' ...
'author = {Tweddle, D.}, ' ...
'year = {1983}, ' ...
'title = {BREEDING BEHAVIOUR OF THE MPASA, \emph{Opsaridium microcephalum} ({G}\"{u}NTHER) ({P}ISCES: {C}YPRINIDAE), IN {L}AKE {M}ALAWI}, ' ... 
'journal = {Journal of the Limnological Society of Southern Africa}, ' ...
'volume = {9(1)}, '...
'pages = {23-28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Twed1987'; type = 'Article'; bib = [ ... 
'doi = {10.1080/16826108.2001.9632397}, ' ...
'author = {Tweddle, D.}, ' ...
'year = {1987}, ' ...
'title = {An assessment of the growth rate of mpasa, \emph{Opsaridium microlepis} ({G}\"{u}nther, 1864) ({P}isces: {C}yprinidae) by length frequency analysis}, ' ... 
'journal = {Journal of the Limnological Society of Southern Africa}, ' ...
'volume = {13(2)}, '...
'pages = {52-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Opsaridium-microcephalum}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
