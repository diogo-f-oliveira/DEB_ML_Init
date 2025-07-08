function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_serranoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_serranoides'; 
metaData.species_en = 'Olive rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 23];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(16.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 61;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 622;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 3.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 490e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(16.7);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
  0 11.5
  1 17.8
  2 22.8
  3 27.8
  4 32.8
  5 36.1
  6 37.3
  7 39.0
  8 41.1
  9 41.6
 10 42.9
 11 45.0
 12 42.8
 13 46.6
 14 52.4];
data.tL(:,1) = 365*(0.9+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(16.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
9.178	21.691
9.701	13.311
10.372	17.566
10.820	17.598
11.044	9.197
11.716	5.036
11.791	5.041
11.865	9.254
12.387	17.708
12.685	26.146
12.834	26.156
13.729	30.427
13.878	30.438
14.028	30.448
14.624	34.698
14.774	30.501
15.221	34.740
15.369	55.793
16.042	43.215
16.115	64.262
16.115	55.845
16.713	51.679
16.861	64.314
17.235	47.507
17.831	64.382
17.980	68.601
18.277	93.872
18.426	89.675
18.874	89.706
19.098	93.930
19.395	114.993
19.769	98.186
20.141	110.837
20.366	106.644
20.663	123.499
21.185	131.952
21.259	140.374
21.482	144.598
21.780	161.453
22.379	127.828
22.526	161.505
22.974	153.120
23.121	186.797
23.422	148.943
23.719	174.214
24.092	174.240
24.165	195.287
24.536	228.981
24.686	224.783
25.207	233.236
25.581	229.054
25.801	275.362
26.031	191.210
26.103	229.091
26.177	245.930
26.328	208.064
26.471	309.076
26.771	275.430
27.070	279.660
27.145	262.831
27.515	313.358
27.813	326.004
27.869	578.513
27.890	292.342
27.962	330.223
28.115	271.316
28.332	363.916
28.780	368.156
28.858	313.452
28.931	342.916
29.001	410.256
29.081	330.302
30.032	599.707
30.046	401.912
30.048	380.870
30.265	469.262
30.489	473.487
30.491	435.611
30.497	351.443
30.637	481.914
30.717	418.793
30.869	376.720
31.088	439.861
31.158	507.201
31.308	498.794
31.317	368.334
31.461	448.304
31.540	380.975
31.680	507.237
31.688	406.236
31.688	397.819
31.763	389.408
31.905	490.420
32.059	427.304
32.207	444.148
32.425	532.540
32.503	477.836
32.576	498.883
32.804	444.190
32.869	583.072
33.099	494.712
33.314	620.979
33.317	574.687
33.541	574.703
33.764	591.552
33.836	625.224
33.918	528.436
33.988	583.151
34.133	646.287
34.364	553.718
34.366	520.051
34.508	621.063
34.801	705.252
34.958	587.427
35.036	545.349
35.405	604.292
35.470	730.549
35.476	650.590
35.548	688.471
35.696	709.523
35.697	692.690
35.702	629.564
35.778	600.110
35.850	637.991
36.216	734.810
36.223	642.225
36.295	675.898
36.363	768.488
36.368	701.153
36.450	595.949
36.736	768.514
36.738	743.264
36.815	713.810
36.820	646.476
36.881	827.442
37.183	781.171
37.264	697.008
37.408	764.353
37.561	722.279
37.713	680.206
37.782	760.170
37.921	899.058
37.928	802.265
37.932	743.347
37.998	869.604
38.305	751.790
38.452	785.468
38.514	958.017
38.521	861.224
38.740	932.783
38.743	886.490
38.826	768.660
38.973	802.338
39.036	962.262
39.267	869.693
39.347	785.531
39.490	878.126
39.499	756.082
39.560	945.465
39.784	941.273
39.787	903.397
39.869	798.193
39.926	1038.076
40.088	865.543
40.091	823.459
40.164	844.506
40.230	970.763
40.380	958.148
40.463	836.110
40.533	907.658
40.597	1046.540
40.609	882.413
40.682	907.668
40.749	1012.884
40.751	983.425
40.754	941.341
40.762	823.506
40.809	1214.892
41.046	1038.155
41.341	1076.051
41.348	987.675
41.350	958.216
41.503	903.518
41.509	819.350
41.565	1084.484
41.569	1021.358
41.658	827.777
41.946	970.883
42.015	1050.848
42.082	1160.272
42.160	1113.984
42.167	1012.983
42.244	970.904
42.397	928.831
42.539	1021.426
42.606	1126.641
42.758	1097.193
43.132	1084.594
43.215	966.764
43.359	1042.525
43.422	1198.241
43.869	1206.690
44.023	1143.574
44.461	1286.691
44.832	1320.384
45.046	1446.652
45.282	1286.749
45.646	1408.818
45.728	1303.614
46.177	1295.228
47.146	1303.713
47.196	1648.807
47.211	1446.804
48.002	1859.284];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LeaMcAl1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
%D2 = 'Data Wwp and Wwi are at odds with LW data and ignored';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7Q3'; % Cat of Life
metaData.links.id_ITIS = '166763'; % ITIS
metaData.links.id_EoL = '46568195'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_serranoides'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_serranoides'; % ADW
metaData.links.id_Taxo = '187334'; % Taxonomicon
metaData.links.id_WoRMS = '274852'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-serranoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_serranoides}}';
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
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-serranoides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
