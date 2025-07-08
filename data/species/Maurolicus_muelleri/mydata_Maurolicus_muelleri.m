function [data, auxData, metaData, txtData, weights] = mydata_Maurolicus_muelleri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Sternoptychidae';
metaData.species    = 'Maurolicus_muelleri'; 
metaData.species_en = 'Mueller''s pearlside'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC', 'MAm'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'t-Ww';'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 04 02]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 02]; 

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'GoodGisk1995';  
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 1;   units.Lj = 'cm';   label.Lj = 'total length at postflexion stage';  bibkey.Lj = 'MunkNiel2005';
data.Lp = 4;   units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'GoodGisk1995';
  comment.Lp = 'Pros1991 gives 2.4 cm for males, 2.6 cm for females';
data.Li = 8;   units.Li = 'cm';   label.Li = 'ultimate total length';    bibkey.Li = 'GoodGisk1995';

data.Wwb = 2.68e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'GoodGisk1995';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwp = 0.6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'GoodGisk1995';  
data.Wwi = 1.5;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'GoodGisk1995';     
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (yr) ~ total length (cm) 
0     2.64
0.167 3.22
0.333 3.87
1     4.69
1.167 5.12
1.333 5.18
1.417 5.12];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GoodGisk1995';
% tW data
data.tW = [ ... % time since birth (yr) ~ total length (cm) 
0     0.104
0.167 0.171
0.333 0.348
1     0.605
1.167 0.779
1.333 1.008
1.417 0.940];
data.tW(:,1) = 365 * (.5 + data.tW(:,1)); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GoodGisk1995';

data.WN = [ ... % time since birth (yr) ~ Length (cm) 
0.032	938.921
0.039	740.617
0.052	855.316
0.054	813.562
0.056	1230.940
0.065	636.100
0.075	938.639
0.095	1575.036
0.095	865.468
0.103	1188.891
0.103	1053.239
0.105	1627.139
0.107	1762.777
0.114	1303.604
0.120	1710.518
0.127	1700.041
0.129	1783.506
0.129	1533.071
0.136	1856.507
0.136	1324.332
0.142	1428.638
0.142	1240.811
0.142	1157.333
0.144	1376.450
0.153	1720.742
0.162	1574.598
0.164	1647.628
0.172	1950.181
0.172	1898.007
0.181	1741.428
0.183	1407.500
0.233	1615.872
0.248	2127.079
0.250	2064.456
0.256	2335.719
0.272	1918.228
0.274	2836.477
0.276	1667.764
0.300	2345.872
0.302	1918.030
0.326	1844.831
0.343	2282.981
0.365	2324.579
0.371	2408.015
0.377	2627.104
0.380	1698.392
0.391	2084.409
0.397	2533.064
0.401	2126.078
0.408	2407.775
0.423	2992.026
0.440	2720.608
0.442	2783.203
0.445	2125.796
0.447	2929.262
0.447	2866.653
0.460	2522.220
0.464	1885.668
0.492	3513.315
0.507	2939.302
0.511	2615.795
0.525	2323.535
0.527	2031.347
0.536	1833.029
0.548	2886.860
0.550	2646.845
0.552	3492.051
0.555	1592.902
0.575	1738.862
0.585	3199.664
0.585	3095.316
0.587	4243.131
0.592	2573.534
0.592	2083.098
0.604	4462.149
0.606	3449.959
0.613	2698.610
0.616	1675.985
0.617	3241.192
0.622	2458.553
0.622	2385.510
0.626	2865.482
0.635	2103.685
0.635	2009.772
0.665	2729.576
0.667	4033.913
0.667	2155.648
0.673	3908.653
0.678	3282.536
0.689	2280.725
0.692	4618.093
0.692	4492.875
0.695	2082.421
0.700	2739.786
0.706	3146.701
0.706	2864.961
0.710	2781.454
0.712	3647.529
0.717	2343.150
0.725	4951.795
0.725	4210.924
0.730	2489.153
0.732	2186.529
0.743	3167.330
0.749	2666.418
0.751	3240.318
0.766	4419.352
0.766	3240.219
0.773	2624.523
0.775	4064.512
0.777	2499.277
0.778	2363.625
0.779	3041.873
0.803	3719.980
0.803	3636.502
0.812	3855.577
0.816	4419.028
0.818	2676.401
0.823	2895.504
0.823	2791.156
0.829	3740.681
0.829	3698.942
0.829	3041.549
0.833	4283.263
0.842	4825.816
0.847	2477.957
0.852	6015.314
0.861	4971.777
0.866	4043.051
0.881	2696.862
0.892	3166.358
0.905	2738.446
0.912	2571.447
0.913	3280.999
0.924	3635.712
0.931	2832.190
0.933	2153.913
0.942	3312.120
0.943	5659.938
0.952	3792.051
0.955	2404.208
0.959	3072.007
0.961	2174.600
0.965	3854.575
0.968	2863.255
0.971	4292.795
0.976	2644.067
0.993	3259.608
0.994	2863.085
1.007	1809.085
1.010	4136.019
1.015	2633.379
1.019	2977.699
1.022	3186.381
1.029	1850.684
1.045	4000.141
1.063	2528.721
1.089	2799.856
1.097	4479.804
1.112	3237.963
1.115	2893.600
1.132	2956.096
1.142	4886.465
1.144	4051.666
1.151	2695.099
1.162	2820.246
1.183	4844.458
1.192	3957.443
1.203	4614.765
1.226	4875.480
1.229	3571.115
1.231	3988.493
1.236	3435.420
1.268	3529.122
1.277	2652.542
1.296	4353.289
1.313	3904.479
1.324	3977.452
1.341	4540.819
1.352	3831.182
1.383	2651.851
1.404	2860.406
1.447	4519.259];
data.WN = data.WN(data.WN(:,1) > 0.6,:); % discard juveniles
units.WN = {'g', '#'}; label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(18);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'GoodGisk1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 22 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'bathypelagic; depth range 271 - 1524 m, usually 300 - 400 m ';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3YG5C'; % Cat of Life
metaData.links.id_ITIS = '162187'; % ITIS
metaData.links.id_EoL = '46563277'; % Ency of Life
metaData.links.id_Wiki = 'Maurolicus_muelleri'; % Wikipedia
metaData.links.id_ADW = 'Maurolicus_muelleri'; % ADW
metaData.links.id_Taxo = '42941'; % Taxonomicon
metaData.links.id_WoRMS = '127312'; % WoRMS
metaData.links.id_fishbase = 'Maurolicus-muelleri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Maurolicus_muelleri}}';
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
bibkey = 'GoodGisk1995'; type = 'article'; bib = [ ...
'author = {M. S. Goodson and J. Giske and R. Rosland}, ' ... 
'year   = {1995}, ' ...
'title  = {Growth and ovarian development of \emph{Maurolicus muelleri} during spring}, ' ...
'journal = {Marine Biology}, ' ...
'page = {185--195}, ' ...
'volume = {124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pros1991'; type = 'article'; bib = [ ...
'author = {R. M. Prosch}, ' ... 
'year   = {1991}, ' ...
'title  = {REPRODUCTIVE BIOLOGY AND SPAWNING OF THE MYCTOPHID \emph{Lampanyctodes hectoris} AND THE STERNOPTYCHID \emph{Maurolicus muelleri} IN THE SOUTHERN {B}ENGUELA ECOSYSTEM}, ' ...
'journal = {S. Afr. J. mar. Sci.}, ' ...
'page = {241--252}, ' ...
'volume = {10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  
'author = {Munk, P. and Nielsen, J. G.}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of {N}orth {S}ea fishes}, ' ...
'publisher = {biofolia}, ' ...
'address = {Frederiksberg, DK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/754}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

