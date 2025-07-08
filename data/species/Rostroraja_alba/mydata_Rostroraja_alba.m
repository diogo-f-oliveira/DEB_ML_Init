function [data, auxData, metaData, txtData, weights] = mydata_Rostroraja_alba

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Rostroraja_alba'; 
metaData.species_en = 'Bottlenose skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 14*30.5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(13.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 35*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'KadrMaro2014';   
  temp.am = C2K(13.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 16;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'KadrMaro2015';
data.Lp  = 129.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'KadrMaro2015';
data.Lpm  = 119.3;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'KadrMaro2015';
data.Li  = 230; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'LicaCern2007';

data.Ri  = 100/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(13.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '55-153 eggs per yr';
  
% uni-variate data at f
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.226	17.184
1.220	24.977
1.938	31.128
3.152	38.517
4.202	47.947
5.141	56.557
6.301	65.581
7.128	68.462
7.902	75.432
9.170	79.958
10.275	87.344
10.992	91.041
12.095	95.154
13.144	100.494
14.468	107.066
15.296	111.174
16.179	117.738
17.172	121.440
18.165	126.369
19.268	129.256
20.316	131.731
21.254	136.660
22.081	138.313
23.074	142.015
24.010	142.034
25.113	145.330
26.105	144.941
27.207	144.554
28.089	146.618
28.971	148.681
30.349	148.709
31.065	149.951
32.112	149.973];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','female'};  
temp.tL_f = C2K(13.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KadrMaro2014';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.226	17.593
1.164	23.340
2.213	30.725
3.153	39.744
3.981	47.534
5.197	56.968
6.190	63.124
7.074	69.279
8.288	76.258
9.391	82.008
10.275	87.753
11.212	90.227
12.316	95.159
13.198	102.131
13.199	102.131
14.302	105.018
15.350	107.084
16.398	111.197
17.225	114.077
18.329	120.236
19.101	123.116
20.259	126.821
21.252	130.932
22.301	135.863
23.183	139.154
24.121	143.264
25.169	146.558
26.217	149.443
27.099	151.916
28.091	153.981
28.973	155.227
30.186	158.524
31.068	158.542
32.060	158.563
33.162	158.994
34.099	159.832
35.145	160.262];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','male'};  
temp.tL_m = C2K(13.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KadrMaro2014';
comment.tL_m = 'data for males';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
55.051	1461.156
58.333	1722.462
66.667	3930.886
68.939	4450.717
72.980	2639.080
77.778	3419.726
95.707	14057.694
97.475	15095.556
104.293	17950.946
110.859	22102.068
115.657	26511.225
120.455	30531.612
125.505	34552.163
130.808	35462.727
133.081	38574.350
135.354	40519.668
135.859	38705.740
138.889	45446.364
140.657	48557.661
142.677	46744.715
144.949	48819.622
150.505	47397.735
153.283	49472.969
155.808	48437.889
160.354	55049.905];
units.LWw_f = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f = 'KadrMaro2014';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
39.141	673.310
41.162	415.439
42.677	416.421
43.939	546.829
46.212	807.481
48.737	1068.296
50.253	550.920
50.505	1069.442
52.273	1459.356
53.030	941.488
55.051	1461.156
56.313	1850.743
56.313	1850.743
58.333	1981.641
59.091	1204.595
59.848	1853.034
60.606	1335.166
61.364	2501.963
63.131	2114.340
63.131	3151.057
64.899	2633.844
66.667	2246.220
67.677	3413.181
69.697	2507.363
70.202	4062.766
70.707	4581.452
70.960	5747.922
71.970	1860.887
72.222	2897.768
73.990	4065.220
75.505	3547.843
75.758	6010.210
77.525	4197.101
77.778	2771.778
77.778	6011.519
79.040	7049.054
79.293	9381.831
79.545	4068.820
79.798	4846.521
80.051	8345.605
81.061	6791.184
81.313	5625.041
81.818	9513.057
82.323	8087.898
82.576	9124.779
82.576	6014.628
83.586	9514.203
83.838	6404.215
84.343	7311.670
85.354	9774.527
85.859	10681.982
86.364	6924.210
86.869	9645.919
87.374	8739.119
88.384	10813.208
89.899	10295.831
92.172	11463.610
94.444	10817.135
94.949	10169.514
95.960	12632.371
97.475	13022.122
103.788	16265.953
109.091	18472.413
110.606	19898.881
115.404	20938.707
120.202	23663.198
125.505	23925.813
129.798	32092.742
132.071	32871.752
135.101	32355.357
135.354	34428.955
138.131	35208.292
140.657	35987.466
142.424	40135.480
145.202	41173.997
149.747	42602.428];
units.LWw_m = {'cm', 'g'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m = 'KadrMaro2014';
comment.LWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00295  *(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4TFRS'; % Cat of Life
metaData.links.id_ITIS = '564123'; % ITIS
metaData.links.id_EoL = '46560594'; % Ency of Life
metaData.links.id_Wiki = 'Rostroraja_alba'; % Wikipedia
metaData.links.id_ADW = 'Rostroraja_alba'; % ADW
metaData.links.id_Taxo = '108298'; % Taxonomicon
metaData.links.id_WoRMS = '105896'; % WoRMS
metaData.links.id_fishbase = 'Rostroraja-alba'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rostroraja_alba}}'; 
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
bibkey = 'KadrMaro2014'; type = 'Article'; bib = [ ... 
'doi = {10.4194/1303-2712-v14_1_21}, ' ...
'author = {Hasna Kadri and Sondes Marouani and Mahamed Nejmeddine Bradai and Abderrahmen Boua\"{i}n and Eric Morize}, ' ...
'year = {2014}, ' ...
'title  = {Age, Growth, Mortality, Longevity and Reproductive Biology of the White Skate, \emph{Rostroraja alba} ({C}hondrichthyes: {R}ajidae) of the {G}ulf of {G}ab\`{e}s ({S}outhern {T}unisia, Central {M}editerranean)}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {14}, ' ...
'pages = {193-204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rostroraja-alba.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

