function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_melanostomus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_melanostomus'; 
metaData.species_en = 'Blackgill rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 22];

%% set data
% zero-variate data

data.am = 90*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(7.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 35;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 590;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 5e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 769000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(7.8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
2.108	10.792
3.045	15.312
4.557	16.625
7.736	42.583
10.275	32.521
10.282	36.750
10.497	26.542
10.962	26.542
11.309	25.813
12.709	29.458
13.405	29.021
13.764	35.583
14.814	38.354
14.921	32.812
15.140	25.083
15.142	25.958
15.492	26.979
16.081	32.083
17.361	33.396
17.458	21.729
17.472	30.187
18.288	32.229
18.635	31.062
18.993	37.188
19.563	30.625
19.920	35.875
20.377	31.208
20.615	34.708
21.884	29.604
21.986	21.146
22.019	40.979
22.481	39.375
22.952	43.312
23.394	29.312
24.348	44.333
25.264	36.312
25.498	37.625
26.174	25.229
26.320	42.875
26.437	43.458
26.888	35.437
27.128	39.812
27.699	34.271
27.701	35.437
28.161	32.521
28.528	43.750
28.640	41.417
28.766	47.542
29.222	42.146
29.568	40.542
30.040	45.062
30.147	39.667
30.620	44.917
31.655	38.500
32.243	42.875
32.365	46.521
33.051	39.667
33.280	37.771
33.401	40.979
34.442	37.917
34.453	44.917
35.722	39.667
35.953	39.083
35.971	50.021
36.072	40.396
36.316	47.687
36.655	42.000
37.119	41.708
37.700	42.000
37.944	48.562
38.049	42.292
38.178	50.021
38.399	43.021
38.752	45.937
38.870	46.958
38.981	43.896
39.337	48.125
40.142	43.312
40.609	45.208
41.189	44.625
41.540	46.083
41.771	45.646
41.870	35.292
42.006	46.958
42.583	44.917
42.937	48.271
43.286	48.708
43.746	45.500
43.753	49.729
44.687	52.792
45.268	52.792
45.379	50.021
46.656	49.729
47.003	49.000
47.581	46.958
48.043	45.354
48.279	47.979
48.623	44.917
48.760	57.896
48.857	46.375
48.975	47.250
50.255	48.708
50.256	48.708
50.360	41.708
50.368	46.667
50.847	55.271
51.420	51.042
53.738	47.979
53.863	53.083
55.241	44.042
55.479	46.958
56.180	49.583
56.192	57.021
56.540	56.583
56.650	53.229
56.762	50.750
56.880	51.625
57.116	53.958
57.688	48.708
58.165	56.000
58.727	44.479
60.024	56.292
60.248	51.625
60.357	47.104
60.950	54.687
62.682	48.562
65.351	47.104
66.408	53.812
67.098	49.875
69.650	47.979
70.232	48.708
70.576	46.375
74.541	55.708
76.032	44.479
76.056	59.062
78.842	58.187
79.071	56.292
87.315	54.542];
data.tL_f(:,1) = 365*(0.8+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(7.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StevAndr2004';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.363	8.750
1.410	9.771
1.989	8.896
1.993	11.375
2.814	15.750
3.154	10.937
3.984	21.292
4.089	14.292
7.004	21.583
7.010	24.646
7.018	29.458
7.472	23.187
7.578	17.500
7.818	21.729
7.945	28.292
8.979	21.437
8.992	29.312
9.004	36.604
10.835	20.417
10.958	24.646
11.066	19.250
11.219	41.854
12.927	21.000
13.063	33.250
13.873	31.500
13.974	22.021
13.992	32.958
14.447	26.979
14.571	31.937
14.689	33.250
14.925	35.437
15.156	34.271
15.267	31.208
16.092	38.354
16.542	30.042
17.002	27.271
17.242	31.646
18.052	29.750
18.053	30.042
18.162	26.396
19.110	37.771
19.211	28.583
19.219	33.396
19.569	34.417
19.700	43.312
20.043	39.958
20.158	39.083
20.855	39.083
21.080	34.708
21.542	33.542
22.243	35.875
22.483	40.396
22.837	43.896
22.940	36.167
23.284	33.396
23.752	35.292
23.874	39.083
24.802	38.208
25.500	38.792
25.624	43.604
25.850	39.521
26.072	33.396
26.310	37.042
26.894	38.937
27.362	41.271
27.702	36.167
29.100	38.792
29.683	39.958
29.795	37.333
29.917	40.688
30.153	43.167
30.256	35.292
30.369	33.250
30.949	33.104
31.067	34.271
31.773	39.667
32.470	39.521
32.588	40.833
33.516	39.958
34.217	42.583
36.189	41.125
36.773	43.312
37.811	38.646
38.031	31.062
39.787	39.812
41.652	43.750
41.898	52.208
43.388	40.104
43.852	39.667
44.666	39.958
44.896	38.937
45.139	45.062
45.946	41.562
46.528	42.437
47.806	42.729
48.848	40.542
48.969	43.604
49.083	42.437
50.247	43.604
51.525	44.042
51.639	42.583
52.224	45.208
52.342	46.812
52.798	41.271
53.154	45.937
53.386	45.500
53.497	42.583
55.240	43.021
56.997	52.354
57.676	41.417
58.037	49.146
59.777	47.833
60.934	45.062
61.158	39.667
62.908	44.771
63.616	51.187
63.955	45.792
65.000	45.646
66.388	42.292
90.318	44.917];
data.tL_m(:,1) = 365*(0.8+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(7.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StevAndr2004';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... length (cm), weight (g)
22.750	150.738
24.117	175.017
24.665	194.620
24.842	154.994
26.677	273.091
27.674	257.924
29.060	415.736
29.778	346.257
30.794	459.678
30.967	400.270
31.437	503.979
31.780	360.434
32.274	637.243
32.807	552.986
33.988	542.705
34.177	597.048
34.277	661.311
34.900	567.134
35.463	690.596
35.634	616.351
36.190	685.410
36.255	507.336
36.562	749.584
36.650	724.826
36.744	744.578
37.295	783.964
37.303	843.312
37.488	867.981
37.650	724.496
37.824	670.034
37.834	739.273
37.997	610.626
38.414	981.431
38.667	847.808
38.853	872.477
38.962	1001.034
39.020	768.558
39.020	773.503
39.113	788.310
39.223	916.868
39.779	995.819
39.845	817.745
39.857	901.821
39.878	1050.191
40.692	1020.247
40.771	941.086
40.799	1133.968
41.218	881.589
41.272	624.384
41.335	1069.494
41.413	980.442
41.455	1272.237
41.545	1905.283
41.616	1128.752
42.227	950.498
42.415	994.949
42.425	1059.243
42.432	1113.646
42.535	1197.692
42.635	1257.010
42.682	950.348
42.774	960.210
42.785	1039.341
42.894	1162.952
43.339	1093.563
43.536	1202.308
43.649	1355.594
43.818	1271.458
43.840	1424.773
43.890	1137.894
44.096	1305.987
44.463	1330.596
44.729	1281.049
44.746	1399.745
44.816	1256.291
44.825	1320.584
44.839	1419.498
44.997	1251.285
45.645	1330.206
45.762	1513.166
46.018	1399.326
46.122	1488.318
46.144	1003.612
46.164	1147.036
46.219	1532.799
46.298	1448.692
46.469	1369.502
46.919	1339.678
47.018	1398.996
47.208	1453.338
47.225	1576.980
47.231	1616.546
47.489	1512.596
47.493	1542.271
48.149	1680.540
48.339	1734.882
48.409	1586.482
48.525	1764.496
48.535	1833.735
48.621	1804.032
48.653	2026.587
48.881	1714.919
49.162	1769.232
49.289	2026.377
49.373	1976.890
49.445	1843.327
49.600	1655.332
49.705	1754.215
49.947	2179.483
49.988	1823.365
50.175	1862.870
50.699	1709.374
50.725	1892.364
50.830	1996.193
50.839	2055.541
50.852	2149.509
51.057	1669.689
51.100	1976.321
51.274	1921.858
51.462	1961.364
51.811	1862.331
51.890	1773.278
51.988	1827.651
52.009	1971.075
52.081	1837.512
52.117	2094.687
52.212	2119.386
52.479	2084.676
52.706	1763.117
52.719	2490.161
53.108	2668.085
53.128	2173.488
53.200	2034.980
53.317	2222.885
53.474	2049.727
53.891	2425.478
54.372	2608.318
54.415	2271.982
54.572	2098.824
54.612	2380.727
54.695	2321.349
54.726	2543.904
54.774	2237.242
55.508	2929.427
56.105	2647.314
56.608	2993.361
56.993	2503.589
58.081	3121.469
58.133	2844.481
58.243	2977.984];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XZRY'; % Cat of Life
metaData.links.id_ITIS = '166728'; % ITIS
metaData.links.id_EoL = '46568164'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_melanostomus'; % ADW
metaData.links.id_Taxo = '187297'; % Taxonomicon
metaData.links.id_WoRMS = '274819'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-melanostomus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins},' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StevAndr2004'; type = 'article'; bib = [ ... 
'author = {Stevens, M.M. and A.H. Andrews and G.M. Cailliet and K.H. Coale},' ...
'year = {2004}, ' ...
'title = {Radiometric validation of age, growth, and longevity for the blackgill rockfish (Sebastes melanostomus)}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {102}, ' ...
'pages = {711-722}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-melanostomus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
