function [data, auxData, metaData, txtData, weights] = mydata_Chelidonichthys_capensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Chelidonichthys_capensis'; 
metaData.species_en = 'Cape gurnard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW','MISE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.3); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 30];

%% set data
% zero-variate data
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';    
  temp.ab = C2K(13.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(13.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34.3;  units.Lp = 'cm';   label.Lp = 'total length at puberty for females';    bibkey.Lp = 'McPhShip2001';
data.Lpm = 29.9; units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';    bibkey.Lpm = 'McPhShip2001';
data.Li = 75;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 8.0e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Yusc1985';
  comment.Wwb = 'based on egg diameter of 1.05-1.25 mm of Prionotus evolans: pi/6*0.115^3';
data.Wwp = 383;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00912*Lp^3.05, see F1';
data.Wwi = 4775; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';     bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00912*Li^3.05, see F1';

data.GSI = 0.07; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'McPhShip2001';
  temp.GSI = C2K(13.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (years), total length (cm)
    1 17.63 17.50
    2 26.09 25.59
    3 31.67 28.40
    4 33.94 31.89
    5 40.19 35.61
    6 45.15 38.49
    7 47.11 40.85
    8 50.40 45.60
    9 53.99 45.47
   10 56.30 49.23
   11 59.53 51.30
   12 61.73 55.05
   13 60.00 NaN
   14 64.00 NaN
   16 67.50 NaN];
data.tL_fm(:,1) = 365 * (0.5+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'}; 
treat.tL_fm = {1, {'females','males'}};
temp.tL_fm = C2K(13.3); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'McPhShip2001';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
9.571	42.856
10.316	111.360
11.514	70.579
13.460	29.943
14.655	71.192
15.703	44.053
16.599	85.244
18.095	85.536
19.290	113.113
19.440	99.471
20.935	127.106
21.535	86.208
23.028	154.859
23.177	168.560
24.076	114.048
24.523	168.823
24.824	127.866
26.164	251.175
26.320	114.486
27.213	224.036
27.218	100.990
27.963	155.823
28.710	196.984
28.858	224.357
29.759	142.502
30.201	292.979
30.354	224.649
30.646	375.097
30.950	279.453
31.837	525.720
31.844	361.659
32.445	279.745
32.445	279.745
33.027	676.343
33.338	389.295
33.937	375.740
33.945	184.335
34.537	334.841
34.682	444.244
35.577	499.107
35.728	458.121
36.036	266.775
36.629	376.265
37.369	567.816
37.379	335.396
37.814	649.934
38.267	554.320
39.306	732.257
39.316	513.509
39.318	458.822
39.326	281.089
39.450	869.004
39.610	622.941
40.204	718.760
40.217	431.654
40.950	773.594
41.108	568.546
41.109	554.875
41.394	869.384
42.142	883.201
42.148	746.484
42.151	664.453
43.042	815.018
43.346	692.030
43.483	992.839
44.089	828.894
44.987	801.726
45.125	1075.190
45.571	1129.965
45.581	897.545
45.588	747.156
45.876	993.306
46.331	856.676
46.468	1157.484
46.625	979.780
47.061	1280.647
47.227	884.195
47.518	1075.658
48.109	1239.836
48.271	952.758
48.401	1417.627
48.413	1144.192
49.150	1390.430
49.314	1048.665
49.457	1212.755
49.462	1089.709
49.909	1130.812
50.194	1458.993
50.799	1308.720
50.808	1089.972
51.244	1390.839
51.680	1678.033
51.835	1555.017
52.139	1445.701
52.450	1158.652
52.594	1295.399
52.739	1418.474
52.864	1992.717
52.868	1883.343
53.326	1664.683
53.471	1774.086
53.482	1527.995
54.229	1541.812
54.514	1869.993
54.819	1747.005
54.960	1938.439
54.963	1870.080
55.104	2075.186
55.123	1610.346
55.257	1993.185
55.271	1665.062
55.859	1897.599
56.017	1706.224
56.319	1637.923
56.460	1843.029
56.751	2020.820
57.059	1815.802
57.065	1679.085
57.344	2157.655
57.502	1952.608
57.796	2075.712
57.806	1843.292
57.951	1939.024
58.388	2212.546
58.686	2253.620
58.842	2103.260
58.848	1952.871
58.863	1611.077
59.123	2527.143
59.143	2048.631
60.176	2376.958
60.321	2486.361
60.640	2035.252
60.766	2568.480
61.229	2240.445
61.814	2541.341
61.973	2322.622
62.250	2842.207
62.852	2760.293
63.132	3211.520
64.496	2787.958
67.481	2952.603
67.763	3335.471];
units.LW_f = {'d', 'cm'}; label.LW_f = {'total length','weight','females'}; 
bibkey.LW_f = 'McPhShip2001';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
2.383	255.418
8.993	33.390
10.033	126.240
11.059	67.930
12.384	56.082
12.823	21.125
14.003	32.558
14.594	44.087
16.070	67.098
17.250	78.530
18.280	66.731
18.574	55.054
19.015	43.353
19.613	136.277
19.758	112.997
19.780	333.923
20.790	112.825
21.525	89.447
21.678	147.562
23.144	77.551
23.741	147.219
24.048	275.075
24.773	158.675
24.773	158.675
25.366	193.460
26.396	170.034
27.278	146.632
27.435	251.257
28.472	309.224
28.628	390.593
28.757	204.526
29.487	134.637
29.501	274.169
30.385	274.023
30.396	390.300
30.541	367.020
30.964	169.275
31.420	308.734
31.869	378.427
32.443	227.169
32.607	389.932
32.737	215.492
33.042	320.093
33.174	168.908
33.493	413.041
33.778	308.343
34.237	482.685
34.816	377.938
35.263	424.375
35.265	447.631
35.271	505.769
35.396	284.818
35.872	621.948
36.436	366.040
36.596	493.921
36.602	552.060
37.344	610.076
37.624	458.866
38.223	551.790
38.378	633.160
38.391	761.065
39.109	574.899
39.412	656.244
39.692	505.034
39.851	621.288
40.451	737.467
40.758	853.695
41.026	586.209
41.474	644.273
41.482	725.668
42.079	806.964
42.082	830.219
42.205	586.013
42.655	667.333
43.257	795.140
43.270	923.045
43.859	922.947
44.129	667.088
44.436	794.944
44.758	1073.961
45.031	852.985
45.062	1166.933
45.188	945.982
45.634	992.419
46.364	922.531
46.376	1038.808
46.654	875.971
47.416	1131.658
47.701	1026.960
47.744	1468.813
47.864	1189.724
48.606	1236.112
48.742	1119.811
49.170	980.204
49.205	1340.664
49.935	1270.775
50.064	1084.707
50.242	1387.003
51.269	1340.321
51.407	1247.275
51.436	1549.595
51.727	1503.036
51.748	1723.962
52.306	1398.288
56.975	2420.769
57.356	1804.426];
units.LW_m = {'d', 'cm'}; label.LW_m = {'total length','weight','males'}; 
bibkey.LW_m = 'McPhShip2001';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00912*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XQWC'; % Cat of Life
metaData.links.id_ITIS = '643887'; % ITIS
metaData.links.id_EoL = '46568653'; % Ency of Life
metaData.links.id_Wiki = 'Chelidonichthys_capensis'; % Wikipedia
metaData.links.id_ADW = 'Chelidonichthys_capensis'; % ADW
metaData.links.id_Taxo = '170730'; % Taxonomicon
metaData.links.id_WoRMS = '218120'; % WoRMS
metaData.links.id_fishbase = 'Chelidonichthys-capensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelidonichthys_capensis}}';
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
bibkey = 'McPhShip2001'; type = 'article'; bib = [ ...
'author = {A.S. McPhail, T.A. Shipton and W.H.H. Sauer and R.W. Leslie}, ' ... 
'year   = {2001}, ' ...
'title  = {ASPECTS OF THE BIOLOGY OF THE {C}APE GURNARD, \emph{Chelidonichthys capensis} ({S}CORPAENIFORMES: {T}RIGLIDAE) ON THE {A}GULHAS {B}ANK, {S}OUTH {A}FRICA}, ' ...
'journal = {Vie Milieu}, ' ...
'page = {217-227}, ' ...
'volume = {51(4)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Yusc1985'; type = 'article'; bib = [ ...
'author = {Paul Yuschak}, ' ... 
'year   = {1985}, ' ...
'title  = {Fecundity, Eggs, Larvae and Osteological Development of the Striped Searobin, (\emph{Prionotus evolans}) ({P}isces, {T}riglidae))}, ' ...
'journal = {J Northw Atl Fish. Sci}, ' ...
'page = {65-85}, ' ...
'volume = {6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chelidonichthys-capensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

