function [data, auxData, metaData, txtData, weights] = mydata_Chromileptes_altivelis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Chromileptes_altivelis'; 
metaData.species_en = 'Humpback grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE','MPW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 30];

%% set data
% zero-variate data

data.ab = 3.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'WillDavi2009';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 39;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 70;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 1170;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01318*Lp^3.11, see F1';
data.Wwi = 7214;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.11, see F1; max. published weight: 24.2 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'WillDavi2009';
  temp.GSI = C2K(28); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.150	4.752
1.004	15.972
2.003	21.872
2.900	47.914
2.971	42.023
2.974	48.674
3.043	37.844
3.971	49.634
4.003	38.613
4.005	42.413
4.043	44.504
4.043	46.024
4.079	43.364
4.081	47.165
4.083	52.865
4.895	52.683
4.965	44.703
5.001	42.993
5.005	50.404
5.008	56.675
5.038	41.853
5.040	46.984
5.041	48.314
5.044	54.775
5.113	45.844
5.888	45.472
5.889	46.992
5.927	50.033
5.927	50.603
5.963	47.753
5.964	49.273
6.001	50.983
6.002	51.743
6.035	43.193
6.035	44.143
6.039	52.314
6.039	53.074
6.042	58.775
6.114	54.595
6.152	56.686
6.957	43.772
6.958	45.672
6.962	52.893
6.962	53.083
6.994	44.152
6.996	47.382
6.996	48.333
6.997	50.043
6.998	52.133
6.999	54.793
7.030	42.062
7.035	51.183
7.037	57.074
7.038	57.644
7.107	48.714
7.114	62.395
7.924	60.313
7.991	44.541
7.992	47.772
7.997	57.273
8.028	45.492
8.029	46.252
8.031	51.003
8.032	52.523
8.032	54.043
8.032	54.423
8.033	54.993
8.034	58.604
8.036	61.264
8.067	49.863
8.068	51.573
8.069	53.473
8.071	58.034
8.109	60.315
8.920	59.562
8.953	50.821
8.958	60.703
8.989	49.302
9.025	46.262
9.025	47.212
9.026	47.972
9.027	49.872
9.029	55.953
9.069	62.604
9.103	55.383
9.104	57.284
9.912	48.930
9.987	51.401
9.987	52.351
9.989	56.342
9.990	59.192
10.029	62.613
10.065	60.903
10.065	61.853
10.097	49.882
10.099	55.013
10.105	67.174
10.986	58.822
11.021	52.741
11.024	60.342
11.056	48.941
11.061	59.773
11.093	49.892
11.128	45.711
11.948	64.532
11.981	54.651
11.984	61.872
12.014	46.860
12.022	63.202
12.050	43.820
12.052	49.141
12.057	59.592
12.060	65.863
12.128	52.942
12.130	57.502
12.164	51.612
12.979	59.031
13.015	56.181
13.018	62.641
14.049	58.661
14.087	60.941
14.123	59.802
15.082	57.720
15.084	62.281
15.160	66.462
15.194	60.762
16.043	60.770
16.114	54.500
16.114	56.400];
data.tL(:,1) = (0+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'WillDavi2009'; 

% length-weight
data.LW = [ ... % total  length (cm), weight (cm)
35.056	597.793
37.616	696.031
38.403	821.343
38.929	738.218
40.764	1058.391
40.963	864.026
41.947	1003.305
42.076	1211.689
42.208	1183.964
42.407	989.598
42.473	947.958
42.603	1073.009
42.668	1114.702
42.929	1253.694
43.323	1281.628
43.717	1240.118
43.976	1559.666
44.046	1198.582
44.243	1198.660
44.374	1240.379
44.504	1351.542
44.896	1518.364
44.897	1490.586
44.899	1268.365
44.964	1337.835
45.160	1393.469
45.423	1379.684
45.555	1296.403
45.685	1477.010
45.948	1435.448
46.471	1671.766
46.471	1602.322
46.732	1824.648
46.865	1602.479
46.931	1588.616
47.326	1491.550
47.456	1644.380
47.523	1491.629
47.783	1727.843
47.785	1575.066
47.911	2075.116
47.918	1436.230
48.373	1797.522
48.505	1811.463
48.769	1658.790
49.160	1908.945
49.424	1770.161
49.555	1797.991
49.751	1936.957
49.818	1853.650
49.819	1742.540
49.947	1978.702
49.948	1909.258
49.953	1492.593
50.147	1742.670
50.406	2089.995
50.475	1784.467
50.475	1756.689
50.603	2048.406
50.802	1867.930
51.062	2118.033
51.458	1993.190
51.718	2201.627
51.984	1923.954
52.178	2132.365
52.179	2076.809
52.375	2160.221
52.704	2077.018
52.837	1924.293
52.957	3021.563
53.490	2257.885
53.752	2369.100
53.816	2508.015
54.079	2438.675
54.272	2799.862
54.534	2855.522
54.539	2411.079
54.605	2452.772
54.732	2786.156
54.859	3244.539
54.867	2494.543
54.997	2605.705
55.063	2536.287
55.197	2328.007
55.390	2689.195
55.459	2383.667
55.459	2342.000
56.766	2995.296
57.022	3578.731
57.026	3217.622
57.086	3759.312
57.095	2925.982
57.096	2814.872
57.424	2815.002
57.482	3523.358
57.554	2995.609
58.008	3454.123
58.209	3106.980
58.535	3357.109
58.929	3329.488
58.930	3246.155
58.991	3648.957
58.992	3523.958
59.058	3510.095
59.191	3412.925
59.195	3010.149
59.254	3635.173
59.390	3232.449
59.649	3551.996
59.912	3538.211
59.978	3454.904
60.437	3510.642
60.630	3857.941
60.768	3330.218
60.825	4080.240
60.829	3733.020
60.952	4510.846
61.158	3622.039
61.218	4149.841
61.745	4038.939
61.751	3469.497
61.865	5052.875
61.946	3650.130
62.010	3816.822
62.140	3927.984
62.854	4692.157
63.383	4331.256
63.909	4275.909
63.959	5692.595
64.428	4831.670
65.033	3637.466
65.154	4581.958
65.807	4873.884
65.865	5568.352
66.922	5013.215
66.928	4402.107
67.186	4888.320
68.689	5541.694
69.804	5681.026
69.817	4458.809
70.068	5542.242];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'WillDavi2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.11'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZL9N'; % Cat of Life
metaData.links.id_ITIS = '643423'; % ITIS
metaData.links.id_EoL = '46579762'; % Ency of Life
metaData.links.id_Wiki = 'Chromileptes_altivelis'; % Wikipedia
metaData.links.id_ADW = 'Chromileptes_altivelis'; % ADW
metaData.links.id_Taxo = '317331'; % Taxonomicon
metaData.links.id_WoRMS = '218193'; % WoRMS
metaData.links.id_fishbase = 'Chromileptes-altivelis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chromileptes_altivelis}}';
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
bibkey = 'WillDavi2009'; type = 'article'; bib = [ ... 
'doi = {10.3354/esr00237}, ' ...
'author = {Ashley J. Williams and Campbell R. Davies and Bruce D. Mapstone and Leanne M. Currey and David J. Welch and Gavin A. Begg and Aaron C. Ballagh and J. Howard Choat and Cameron D. Murchie1 and Colin A. Simpfendorfer}, ' ... 
'year = {2009}, ' ...
'title = {Age-based demography of humpback grouper \emph{Cromileptes altivelis}: implications for fisheries management and conservation}, ' ...
'journal = {Endangered Species Research}, ' ...
'volume = {9}, '...
'pages = {67–79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chromileptes-altivelis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

