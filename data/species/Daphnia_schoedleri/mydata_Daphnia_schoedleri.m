function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_schoedleri
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_schoedleri'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'B','C','D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 16]; 

%% set data
% zero-variate data

data.ab = 2.5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'LeiClif1974';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3.2;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'LeiClif1974';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 120;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'LeiClif1974';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.068; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'LeiClif1974';
data.Lp  = 0.15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'LeiClif1974';
data.Li  = 0.35;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'LeiClif1974';
  
data.Wdi  = 508;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based on Daphnia magna: 600*(350/370)^3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
0.070	0.678
0.766	0.883
1.461	1.005
2.157	1.169
3.085	1.467
3.433	1.631
4.593	1.800
6.797	2.069
8.769	2.173
10.276	2.249
11.320	2.330
13.292	2.405
15.496	2.475
19.091	2.585
20.483	2.643
22.803	2.700
25.471	2.752
28.138	2.809
30.226	2.814
32.894	2.872
35.214	2.900
37.649	2.940
40.201	2.986
42.985	3.020
46.116	3.048
48.900	3.093
51.684	3.139
54.235	3.179
57.715	3.178
60.151	3.200
62.355	3.223
66.066	3.256
68.850	3.261
71.865	3.301
74.417	3.341
77.201	3.339
80.448	3.379
83.116	3.396
85.552	3.430
88.800	3.475
91.699	3.474
94.715	3.490
98.542	3.477
103.414	3.475];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeiClif1974'; 

% length-fecundity
data.LN = [ ... % length (cm), fecundity (#)
0.223	15.306
0.224	14.214
0.230	28.209
0.231	19.017
0.231	20.098
0.231	22.665
0.232	26.028
0.234	20.870
0.239	23.531
0.244	29.015
0.245	23.738
0.245	21.706
0.247	26.556
0.247	23.578
0.247	26.010
0.248	24.656
0.248	26.539
0.249	18.969
0.250	26.796
0.250	27.336
0.250	28.822
0.250	25.037
0.250	24.086
0.251	25.977
0.251	24.618
0.252	25.966
0.252	21.503
0.253	22.713
0.253	30.546
0.254	30.805
0.254	24.858
0.255	32.694
0.256	27.814
0.257	21.997
0.257	23.483
0.258	28.329
0.259	23.731
0.259	36.427
0.260	28.178
0.260	28.989
0.260	29.529
0.260	27.635
0.260	30.472
0.260	21.823
0.261	25.876
0.261	26.551
0.261	27.492
0.262	28.696
0.263	31.390
0.264	30.301
0.265	16.646
0.266	28.655
0.273	27.644
0.273	32.505
0.273	22.232
0.274	38.713
0.274	31.551
0.274	35.601
0.274	28.573
0.276	36.933
0.277	36.389
0.290	45.309
0.296	32.539
0.297	66.723
0.300	38.588
0.307	58.784
0.313	57.643
0.313	65.613
0.319	57.450
0.323	77.403
0.329	74.374];    
units.LN   = {'cm', '#'};  label.LN = {'length','fecundity'};  
temp.LN    = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LeiClif1974'; 
comment.LN = 'instar duration 2.5 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 
weights.Li = 3 * weights.Li; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '345CQ'; % Cat of Life
metaData.links.id_ITIS = '83892'; % ITIS
metaData.links.id_EoL = '1040443'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_schoedleri'; % ADW
metaData.links.id_Taxo = '347075'; % Taxonomicon
metaData.links.id_WoRMS = '148375'; % WoRMS

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
bibkey = 'LeiClif1974'; type = 'Article'; bib = [ ... 
'author = {Lei , C. H. and Clifford, H. F.}, ' ... 
'year = {1974}, ' ...
'title = {Field and laboratory studies of \emph{Daphnia schoedleri} {S}ars from a winterkill lake of {A}lberta}, ' ...
'journal = {Zoology}, ' ...
'volume = {9}, ' ...
'pages = {1-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
