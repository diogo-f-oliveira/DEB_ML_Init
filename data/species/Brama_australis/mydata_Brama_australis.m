function [data, auxData, metaData, txtData, weights] = mydata_Brama_australis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Bramidae';
metaData.species    = 'Brama_australis'; 
metaData.species_en = 'Southern rays bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 28];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'OyarCort2013';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 36.9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'guess'; 
data.Li  = 59;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'OyarCort2013';

data.Wwb = 2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1.575 mm of Brama brama: pi/6*.1575^3';
data.Wwp = 653;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01820*Lp^2.96, see F1';
data.Wwi = 2.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'OyarCort2013';

data.Ri  = 2.4e4/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97, as found for  Trichiurus nanhaiensis';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.997	38.095
1.998	36.103
2.017	30.924
2.018	29.131
2.020	23.155
2.034	34.311
2.035	33.315
2.036	32.319
2.037	27.139
2.038	26.343
2.039	24.948
2.075	21.563
3.011	37.119
3.028	42.099
3.032	29.351
3.035	22.976
3.046	40.506
3.047	39.311
3.048	38.116
3.049	33.534
3.067	34.530
3.068	31.941
3.069	31.144
3.086	30.348
3.968	45.505
3.969	43.313
3.970	42.118
3.986	46.103
3.987	44.310
3.988	40.724
3.989	38.334
4.004	48.095
4.007	39.529
4.008	37.537
4.009	36.541
4.949	39.548
4.965	46.520
4.966	44.329
4.967	42.536
4.981	50.306
4.982	47.915
4.983	45.126
4.984	41.541
4.985	40.545
5.905	50.125
5.958	51.720
5.959	51.122
5.961	47.337
5.978	48.533
5.995	53.513
6.937	52.536
6.973	54.130
6.974	50.744
6.990	55.923
7.011	49.549
7.970	50.166
7.972	45.385
7.986	57.736];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OyarCort2013';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.945	34.127
1.947	32.738
1.962	35.516
1.964	21.032
1.970	29.365
1.977	24.802
1.979	23.611
1.981	22.024
1.985	31.746
1.990	28.373
1.991	27.976
2.916	40.675
2.932	41.865
2.940	36.310
2.942	34.921
2.943	34.524
2.954	39.484
2.955	38.690
2.956	37.897
2.963	33.135
2.964	32.341
2.967	30.754
2.986	29.563
3.885	48.016
3.887	46.627
3.889	45.635
3.900	37.698
3.909	44.444
3.911	42.659
3.920	36.508
3.939	36.111
3.946	43.452
3.951	40.079
3.968	40.873
3.971	38.889
4.866	47.817
4.867	46.627
4.905	46.032
4.906	44.841
4.908	43.452
4.909	42.857
4.932	39.484
4.947	42.063
4.948	41.468
4.952	50.595
4.967	40.675
5.873	53.770
5.876	51.984
5.897	50.198
5.918	48.016
5.931	51.190
5.935	49.008
5.956	47.024
6.869	55.556
6.889	54.167
6.891	53.175
6.953	47.817
6.969	49.405
7.907	53.373];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OyarCort2013';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
27.121	301.805
27.656	306.618
28.435	449.550
29.322	382.967
29.559	368.704
29.739	402.055
29.914	330.643
30.156	440.190
30.214	406.862
30.628	378.330
30.751	464.056
31.405	473.642
31.644	497.474
31.761	478.438
31.939	464.169
32.066	640.372
32.119	507.043
32.775	569.011
33.131	554.759
33.188	507.145
33.609	621.471
34.083	602.469
34.500	626.318
34.617	583.472
34.675	564.430
35.575	759.753
35.985	640.745
35.988	697.888
36.052	788.370
36.167	716.953
36.170	774.096
36.526	774.130
36.533	916.988
36.580	664.611
36.587	802.707
36.645	783.665
36.701	707.480
36.707	840.814
36.822	759.872
37.001	764.651
37.003	807.508
37.064	850.371
37.066	893.229
37.079	1169.420
37.081	1207.516
37.117	721.805
37.181	817.049
37.301	831.346
37.415	740.881
37.476	769.458
37.538	831.369
37.542	907.560
37.592	712.326
37.613	1155.186
37.658	855.190
38.010	755.223
38.072	807.610
38.073	831.420
38.073	840.944
38.075	874.277
38.083	1055.230
38.137	940.950
38.138	950.474
38.139	983.807
38.141	1017.141
38.195	912.384
38.370	836.210
38.434	936.216
38.487	807.650
38.551	893.370
38.612	940.995
38.727	850.530
38.734	1002.911
38.789	902.917
38.904	831.499
38.907	902.928
38.968	926.743
38.973	1031.506
38.974	1045.791
38.975	1074.363
38.976	1093.411
39.089	974.374
39.090	998.183
39.390	1050.593
39.444	955.360
39.448	1026.789
39.505	979.175
39.506	1007.747
39.558	855.371
39.627	1055.377
39.862	998.257
39.920	960.167
39.920	969.691
39.975	883.982
40.041	1012.560
40.042	1041.131
40.043	1055.417
40.044	1079.227
40.045	1088.751
40.046	1112.560
40.107	1145.899
40.108	1179.233
40.336	979.254
40.469	1269.743
40.529	1293.559
40.819	1145.967
40.822	1198.348
40.926	884.073
40.931	998.359
40.934	1055.502
40.934	1069.788
40.935	1084.073
40.941	1207.883
40.943	1255.503
40.992	1036.460
40.996	1117.413
40.999	1174.556
41.120	1217.424
41.162	865.047
41.413	1150.786
41.417	1236.500
41.470	1103.172
41.475	1193.649
41.530	1112.702
41.890	1179.402
41.952	1236.551
41.953	1269.885
42.001	1022.270
42.002	1036.556
42.008	1169.890
42.010	1207.985
42.010	1207.985
42.015	1322.271
42.019	1393.700
42.123	1088.948
42.124	1112.758
42.125	1122.282
42.125	1136.568
42.132	1288.949
42.422	1141.358
42.440	1508.026
42.481	1117.554
42.546	1250.894
42.549	1312.799
42.551	1346.132
42.597	1074.708
42.601	1150.899
42.604	1217.566
42.607	1279.471
42.612	1384.233
42.664	1236.619
42.902	1231.880
42.964	1289.028
42.966	1331.886
43.016	1127.129
43.017	1155.700
43.027	1369.987
43.072	1060.467
43.077	1174.754
43.079	1203.325
43.079	1222.373
43.140	1255.712
43.152	1493.808
43.320	1279.539
43.382	1331.925
43.553	1198.608
43.618	1308.138
43.676	1270.049
43.726	1074.815
43.742	1422.436
43.852	1236.732
43.970	1227.220
43.987	1574.840
44.032	1279.607
44.035	1331.988
44.035	1336.750
44.038	1403.417
44.039	1422.464
44.107	1612.947
44.145	1155.808
44.215	1379.624
44.221	1498.672
44.514	1427.271
44.522	1579.653
44.579	1532.039
45.056	1584.466
45.057	1603.514
45.172	1513.048
45.174	1560.668
45.474	1622.601
45.529	1536.892
45.536	1674.988
45.647	1522.617
45.890	1627.402
46.002	1498.842
46.006	1575.033
46.007	1594.080
46.075	1784.563
46.076	1808.373
46.123	1541.710
46.133	1751.235
46.486	1689.364
46.554	1870.323
46.597	1517.946
46.966	1775.124
47.016	1584.653
47.136	1622.759
47.192	1537.050
47.320	1732.301
47.432	1603.740
47.496	1689.460
47.500	1779.937
47.561	1808.514
47.969	1646.648
48.275	1837.153
49.156	1637.237
49.232	1984.864
50.125	2032.568
51.022	2161.225];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'OyarCort2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};


%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01820*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '693BQ'; % Cat of Life
metaData.links.id_ITIS = '645591'; % ITIS
metaData.links.id_EoL = '46577911'; % Ency of Life
metaData.links.id_Wiki = 'Brama_australis'; % Wikipedia
metaData.links.id_ADW = 'Brama_australis'; % ADW
metaData.links.id_Taxo = '164579'; % Taxonomicon
metaData.links.id_WoRMS = '273146'; % WoRMS
metaData.links.id_fishbase = 'Brama-australis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brama_australis}}';
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
bibkey = 'OyarCort2013'; type = 'Article'; bib = [ ... 
'doi = {10.4067/S0718-19572013000300014}, ' ...
'author = {Ciro Oyarz\''{u}n and Nelson Cort\''{e}és and Elson Leal}, ' ... 
'year = {2013}, ' ...
'title = {Age, growth and mortality of southern rays bream \emph{Brama australis} ({B}ramidae) off the southeastern {P}acific coast}, ' ...
'journal = {Revista de Biología Marina y Oceanograf\''{i}a}, ' ...
'volume = {48(3)}, ' ...
'pages = {585-590}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Brama-australis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
