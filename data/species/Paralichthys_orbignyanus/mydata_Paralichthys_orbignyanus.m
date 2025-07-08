function [data, auxData, metaData, txtData, weights] = mydata_Paralichthys_orbignyanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Paralichthys_orbignyanus'; 
metaData.species_en = 'Linguado'; 

metaData.ecoCode.climate = {'MB','Cfa'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd','0iFe','0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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

data.am = 11*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(16.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 39;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'fishbase'; 
data.Li  = 83;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on egg diameter of 0.7 to 0.8 mm of Paralichthys_californicus: pi/6*0.075^3';
data.Wwp = 578.4;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00676*Lp^3.10, see F1';
data.Wwi = 6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.10, see F1';

data.Ri  = 4e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(16.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [... % time since birth (yr), total length (cm)
0	28.390 26.834
1	37.120 38.336
2	45.849 40.401
3	50.882 44.447
4	56.528 47.999
5	62.168 52.043
6	67.196 48.146
7	77.163 NaN]; 
data.tL_fm(:,1) = (1.9+data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'age', 'total length'};  
temp.tL_fm = C2K(16.1); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'CazoCeci2005';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
21.803	140.225
24.712	126.293
25.824	245.562
26.385	212.375
26.493	279.995
27.951	213.961
28.842	282.374
30.072	300.497
30.519	300.950
31.077	318.393
31.636	335.836
31.636	335.836
32.197	302.649
32.864	370.835
34.205	389.071
35.319	474.587
36.770	543.566
36.995	510.039
37.996	612.319
38.665	646.752
39.444	731.928
39.774	816.651
40.003	732.494
40.550	952.458
41.017	598.500
41.572	683.450
41.792	734.307
42.238	768.513
42.447	1021.890
42.583	600.086
42.681	853.350
42.779	1089.736
43.355	803.399
43.462	887.896
43.691	786.862
44.247	838.059
44.575	990.289
45.572	1160.075
45.584	940.678
45.804	1008.411
46.474	1025.967
46.796	1262.581
47.131	1279.797
47.366	1077.504
47.958	487.386
48.135	1331.447
48.373	1078.523
48.803	1382.756
49.150	1180.576
49.255	1298.826
49.508	775.875
49.929	1248.876
50.030	1451.509
50.055	995.839
50.697	1519.695
50.721	1097.778
51.272	1233.358
51.362	1638.512
51.369	1503.498
51.374	1419.115
52.358	1825.175
52.492	1420.247
52.602	1454.114
53.045	1538.951
53.253	1826.081
53.612	1404.503
53.824	1607.250
54.056	1455.587
54.500	1523.546
54.806	2047.063
54.812	1945.803
54.930	1827.780
55.058	1540.989
55.165	1625.486
55.383	1743.849
55.420	3077.220
56.032	2132.693
56.270	1879.769
56.291	1508.482
56.510	1576.215
57.256	2252.075
57.274	1931.418
57.289	1661.391
58.242	2624.382
58.368	2354.468
58.402	1763.784
58.499	2017.048
58.603	2169.051
58.695	2523.575
59.468	2693.134
59.836	2119.667
59.849	1883.393
60.023	2778.084
60.224	1174.913
61.023	2897.240
61.261	2644.317
61.284	2222.400
61.388	2374.403
62.273	2544.076
62.487	2713.069
62.613	2460.032
62.970	2072.208
63.143	2983.776
63.249	3085.149
63.494	2714.089
63.626	2342.915
64.399	2529.351
64.604	2867.111
64.703	3086.622
65.816	3189.014
66.276	2970.070
66.520	2599.010
67.375	3325.613
67.434	2262.383
67.500	3089.453
67.631	2735.156
68.337	4119.837
68.379	3360.386
68.933	3462.213
69.034	3647.969
69.901	4155.176
70.165	3429.705
70.355	4037.492
70.588	3868.952
71.164	3565.738
71.396	3430.951
71.819	3853.321
71.960	3347.134
72.564	4546.058
73.051	3837.690
73.509	3635.623
74.164	3923.207
74.470	4463.600
75.397	3890.699
75.699	4481.723
76.492	4313.749
77.003	5175.026
77.795	5007.052
78.795	5126.208
79.811	4958.461
82.190	6429.224
84.521	6752.259
85.707	7546.709
86.507	7243.722
86.861	6906.528];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','females'}; 
bibkey.LW_f = 'CazoCeci2005';
%
data.LW_m = [ ...
25.491	211.469
26.168	94.012
26.277	144.755
27.054	263.685
27.058	179.302
27.279	230.158
27.948	281.468
28.289	180.548
28.953	299.364
29.741	215.773
30.298	250.093
31.191	284.753
31.527	285.092
32.643	319.978
32.750	421.352
33.757	405.495
33.957	827.638
34.085	540.848
34.986	440.494
35.105	305.594
35.429	508.454
35.982	627.157
35.995	390.883
36.652	644.713
36.657	560.330
36.662	459.069
37.002	391.903
37.103	577.659
37.769	679.599
38.553	646.639
38.566	427.242
39.336	647.431
39.900	563.614
40.106	884.498
40.241	479.571
40.440	918.591
42.117	937.167
42.134	633.386
42.349	785.503
42.679	887.103
43.254	600.766
43.369	550.249
43.701	601.219
43.897	1107.746
44.029	753.449
44.460	1040.805
44.689	939.772
45.127	1108.992
45.144	805.211
45.243	1041.598
45.458	1193.715
45.683	1177.065
45.697	923.914
45.925	839.758
46.037	839.871
46.128	1211.271
46.807	1076.937
47.037	959.027
47.696	1179.103
48.151	1044.543
48.360	1297.920
48.801	1416.510
49.261	1197.566
49.362	1383.323
49.715	1079.882
49.924	1333.259
50.032	1417.756
50.159	1147.842
50.574	1722.102
50.813	1452.302
51.586	1621.862
51.611	1183.068
51.718	1267.564
52.027	1740.451
52.834	1302.450
53.175	1218.407
53.180	1117.147
53.258	1724.821
57.742	1560.584
59.821	2389.694];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','males'}; 
bibkey.LW_m = 'CazoCeci2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data from South and West coast of S-Africa'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'I had to add 1 yr for tL data to arrive at a natural fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length - weight: Ww in g = 0.00676*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CYVV'; % Cat of Life
metaData.links.id_ITIS = '616608'; % ITIS
metaData.links.id_EoL = '46570513'; % Ency of Life
metaData.links.id_Wiki = 'Paralichthys_orbignyanus'; % Wikipedia
metaData.links.id_ADW = 'Paralichthys_orbignyanus'; % ADW
metaData.links.id_Taxo = '182815'; % Taxonomicon
metaData.links.id_WoRMS = '275817'; % WoRMS
metaData.links.id_fishbase = 'Paralichthys-orbignyanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralichthys_orbignyanus}}';
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
bibkey = 'CazoCeci2005'; type = 'Article'; bib = [ ... 
'author = {Lopez Cazorla and Andrea Cecilia}, ' ...
'year = {2005}, ' ...
'title = {On the age and growth of flounder \emph{Paralichthys orbignyanus} ({J}enyns, 1842) in {B}ah\''{i}a {B}lanca {E}stuary, {A}rgentina}, ' ... 
'journal = {Hydrobiologia}, ' ...
'volume = {537}, '...
'pages = {81-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Paralichthys-orbignyanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

