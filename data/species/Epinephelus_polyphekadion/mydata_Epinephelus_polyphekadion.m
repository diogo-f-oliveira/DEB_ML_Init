  function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_polyphekadion
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_polyphekadion'; 
metaData.species_en = 'Camouflage grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 27];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 58;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 90;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.3e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.76 mm: pi/6*0.076^3';
data.Wwp = 2.76e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01202*Lp^3.04, see F1';
data.Wwi = 10491;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.04, see F1';

data.Ri  = 9.7e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_fuscoguttatus: 3287515*5000/17000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
2.097	28.052
2.870	28.045
3.091	33.526
3.201	24.533
3.532	33.960
3.642	36.372
3.642	35.494
3.863	39.001
3.974	41.193
3.974	32.641
3.974	24.746
4.084	42.947
4.084	32.201
4.084	29.350
4.084	28.254
4.305	30.883
4.857	28.905
5.077	33.070
5.077	34.605
5.077	35.920
5.077	39.210
5.077	41.841
5.188	42.498
5.188	27.147
5.298	29.339
5.408	44.251
5.740	42.274
5.740	32.844
5.850	48.852
5.850	39.642
5.850	34.598
5.850	33.282
5.850	31.308
5.960	43.588
5.960	40.956
5.960	30.211
5.960	29.114
6.071	46.438
6.181	44.463
6.181	37.884
6.291	38.541
6.402	38.979
6.733	36.344
6.843	38.975
6.843	39.194
6.843	46.431
6.843	47.747
6.954	37.220
6.954	48.185
6.954	28.886
7.064	44.456
7.064	45.333
7.064	49.280
7.064	31.517
7.174	42.262
7.174	42.700
7.174	33.270
7.837	49.931
7.837	42.037
7.837	36.335
7.947	46.422
8.057	48.394
8.057	44.885
8.057	43.131
8.057	40.938
8.168	47.077
8.168	44.007
8.168	38.525
8.168	37.648
8.168	37.428
8.278	40.059
8.609	37.205
8.830	45.756
8.940	48.606
8.940	40.272
8.940	39.395
8.940	38.079
9.051	50.798
9.051	45.096
9.051	43.342
9.382	41.365
9.603	49.477
9.603	46.846
9.713	48.599
9.713	39.169
9.823	44.431
9.934	44.430
10.155	46.402
10.155	42.893
10.155	40.262
10.155	40.262
10.265	50.349
10.265	47.717
10.375	51.883
10.596	43.109
10.817	47.493
11.038	56.044
11.038	45.956
11.038	45.079
11.038	42.228
11.038	41.131
11.038	40.693
11.038	39.377
11.148	48.367
11.258	52.752
11.258	51.656
11.258	50.340
11.258	44.638
12.031	56.473
12.031	45.289
12.031	48.798
12.031	49.237
12.141	52.086
12.141	46.385
12.362	47.479
13.024	58.658
13.135	47.692
13.135	48.788
13.135	51.201
13.245	42.428
13.576	49.662
14.018	50.754
14.018	49.219
14.901	54.913
15.121	49.867
15.121	49.429
15.894	54.904
15.894	48.545
16.336	57.532
16.887	47.878
17.108	51.824
17.219	53.138
18.102	48.525
18.212	46.331
18.212	53.788
19.316	47.638
19.868	48.510
20.199	49.604
20.309	45.874
20.971	51.132
21.192	57.270
21.302	54.199
22.075	56.166
22.296	55.068
22.296	57.699
22.958	59.009
23.289	61.419
23.289	56.594
23.400	51.549
24.172	54.832
24.172	50.007
24.283	60.533
24.283	58.998
24.945	60.088
25.055	54.166
25.166	51.314
25.166	56.139
25.166	62.718
25.276	58.112
25.938	58.983
26.159	62.051
26.159	59.858
26.159	57.665
26.159	55.911
26.380	56.786
26.380	48.014
26.821	56.344
27.152	57.437
27.152	49.104
27.263	54.366
27.263	47.129
27.373	59.409
28.146	52.823
28.366	58.742
28.366	56.330
29.360	58.514
29.470	55.882
29.801	63.554
30.243	49.515
31.015	57.842
31.126	48.192
31.347	60.032
31.788	52.133
32.119	60.902
32.119	53.666
33.113	51.683
33.113	46.859
33.223	50.366
33.333	63.085
33.885	52.334
34.106	57.596
34.106	60.885
36.093	56.043
40.066	62.806
44.150	55.753]; 
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
21.756	80.801
23.534	196.507
26.414	239.254
27.302	282.580
27.972	369.552
28.630	296.722
29.077	354.703
29.742	369.038
30.845	325.134
31.075	441.290
32.184	484.551
32.413	586.180
33.738	556.739
33.740	585.794
35.072	643.518
35.297	701.564
36.175	599.614
36.623	672.123
36.850	759.224
36.851	773.752
37.096	1093.293
37.299	846.261
37.507	671.866
37.747	918.770
37.750	962.353
38.158	497.343
38.628	860.403
38.860	1005.614
39.300	976.430
39.733	845.554
39.984	1252.261
40.419	1150.439
40.643	1193.958
40.843	903.343
40.855	1063.146
41.757	1295.329
41.951	932.076
41.954	961.131
42.192	1193.508
42.209	1425.948
42.626	1077.159
42.637	1222.434
43.312	1382.044
43.314	1411.099
43.544	1527.255
43.555	1672.531
43.965	1236.576
44.188	1265.567
44.202	1454.425
44.444	1730.384
44.648	1497.879
44.652	1555.989
44.847	1192.736
44.894	1831.948
45.320	1613.906
45.533	1497.622
45.543	1628.369
45.780	1846.218
46.433	1700.750
46.451	1947.718
46.632	1395.607
46.864	1540.819
47.326	1816.713
47.338	1976.516
47.546	1787.594
47.568	2092.672
47.758	1671.309
47.962	1438.804
48.239	2194.172
48.413	1554.896
48.426	1729.227
48.880	1888.901
49.088	1699.979
49.111	2019.584
49.561	2121.149
49.794	2280.887
49.834	2818.406
50.033	2513.263
50.230	2193.593
50.437	1990.144
50.460	2309.749
50.664	2077.245
51.579	2483.758
51.789	2323.891
52.218	2149.432
52.265	2788.644
52.447	2251.061
52.681	2425.327
53.134	2570.474
53.362	2657.574
53.370	2773.795
53.568	2454.125
53.995	2236.083
54.480	2817.056
54.492	2976.859
54.501	3107.607
54.648	2090.615
54.674	2453.803
54.705	2875.102
54.726	3151.125
54.911	2657.125
54.939	3049.368
55.806	2802.143
55.833	3165.331
56.288	3339.533
56.451	2540.454
56.478	2918.170
56.483	2976.280
56.495	3136.083
56.683	2685.665
57.388	3252.046
57.616	3339.147
58.261	3091.986
58.274	3266.317
58.284	3397.065
58.480	3062.867
58.491	3208.142
58.526	3687.551
58.951	3440.454
59.217	4050.546
59.610	3382.151
60.944	3468.931
61.829	3468.674
62.966	3889.651
63.931	4978.959]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5RF'; % Cat of Life
metaData.links.id_ITIS = '551086'; % ITIS
metaData.links.id_EoL = '46579619'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_polyphekadion'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_polyphekadion'; % ADW
metaData.links.id_Taxo = '105888'; % Taxonomicon
metaData.links.id_WoRMS = '218197'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-polyphekadion'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Epinephelus_polyphekadion}}';  
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
bibkey = 'MaplCurr2009'; type = 'techreport'; bib = [ ... 
'howpublished = {https://rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Mapleston-A-et-al-2009-Comparative-biology-of-GBR-serranid-species.pdf}, ' ...
'author = {Mapleston, A. and Currey, L.M.and Williams, A.J. and Pears, R. and Simpfendorfer, C.A. and Penny, A.L. and Tobin, A. and Welch, D}, ' ... 
'year = {2009}, ' ...
'title = {Comparative biology of key inter-reefal serranid species on the Great Barrier Reef.}, ' ...
'institution = {Reef and Rainforest Research Centre Limited, Cairns}, ' ...
'volume = {Project Milestone Report to the Marine and Tropical Sciences Research Facility}, ' ...
'pages = {55pp.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Epinephelus-polyphekadion.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

