  function [data, auxData, metaData, txtData, weights] = mydata_Maccullochella_ikei
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Maccullochella_ikei'; 
metaData.species_en = 'Clarence river cod'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 12];

%% set data
% zero-variate data
data.ab = 15.5;      units.ab = 'd';  label.ab = 'age at puberty for females';  bibkey.ab = 'guess';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'ButlRowl2008';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 39;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'ButlRowl2008';
data.Li = 100;    units.Li = 'cm'; label.Li = 'ultimate total length for females';  bibkey.Li = 'ButlRowl2008';

data.Wwb = 1.8e-2;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 3.25 mm of Maccullochella_peelii: pi/6*0.325^3';
data.Wwi = 15e3;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';          bibkey.Wwi = 'ButlRowl2008';
  comment.Wwi = 'based on LW data; fishbase: based on 0.01072*Li^3.01, see F1, gives 11 kg';
 
data.Ri = 12e3/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'guess';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Maccullochella_peelii: 9e4*15e3/113.5e3';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.580	6.032
0.817	12.884
1.225	17.252
1.267	15.386
1.288	12.896
1.482	21.200
1.654	22.035
1.739	21.207
1.742	32.618
1.890	22.871
1.911	20.589
2.211	23.086
2.254	21.428
2.665	42.185
2.705	26.834
2.836	41.775
2.900	37.420
3.049	35.349
3.051	44.477
3.284	33.073
3.391	30.171
3.458	42.206
3.518	26.025
3.543	40.963
3.565	42.209
3.606	34.948
3.672	45.946
3.777	35.575
3.930	48.650
4.036	43.881
4.078	39.732
4.121	38.489
4.207	43.263
4.270	37.870
4.292	40.153
4.295	54.468
4.313	36.004
4.570	37.878
4.614	43.481
4.807	43.901
4.808	44.938
4.811	60.083
4.828	42.241
4.830	49.088
4.849	40.790
4.852	54.483
4.915	47.638
4.938	53.655
4.939	55.937
5.087	48.057
5.130	50.133
5.192	38.101
5.213	39.969
5.235	38.932
5.236	43.704
5.278	41.423
5.514	41.429
5.515	48.898
5.836	46.209
5.923	52.643
6.008	48.496
6.010	57.417
6.011	61.982
6.052	56.588
6.200	44.767
6.241	39.996
6.242	42.900
6.500	47.679
6.630	52.454
6.777	41.255
6.800	46.027
6.825	65.737
7.015	50.804
7.184	41.680
7.185	43.547
7.252	59.109
7.270	42.720
7.292	44.795
7.293	49.982
7.620	76.754
7.768	67.006
7.808	52.900
7.809	58.916
7.937	57.467
7.984	77.385
8.236	52.496
8.579	51.260
8.753	63.298
8.836	51.266
9.012	74.923
9.095	64.344
9.800	53.366
10.145	64.371
10.549	49.236
11.620	52.169
13.020	87.060
13.207	58.019
13.828	57.413
14.212	51.406
14.646	77.351
15.139	82.343
15.178	63.672];
data.tL (:,1) = (0 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ButlRowl2008';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
12.791	4.080
14.729	90.045
17.183	152.428
18.475	120.441
20.413	151.408
21.835	245.696
22.222	150.837
24.806	181.600
25.323	118.279
25.581	86.618
26.357	181.110
26.486	244.227
27.003	244.064
27.649	275.439
27.778	433.293
28.036	306.895
28.295	212.077
28.811	180.335
29.328	306.487
29.457	306.447
29.845	401.061
30.362	306.161
30.879	274.419
30.879	432.314
31.525	463.689
32.429	558.140
33.204	463.158
33.979	494.492
33.979	462.913
34.496	399.592
35.013	588.903
35.271	588.821
35.659	557.120
36.434	462.138
36.822	588.332
37.080	777.724
37.726	682.783
38.114	808.976
38.760	903.509
39.018	713.954
39.535	998.001
39.922	808.405
40.956	871.237
41.085	1029.090
41.214	713.260
42.119	965.606
42.506	807.589
42.636	870.706
42.894	1028.519
43.411	1249.409
43.540	1154.631
44.315	1407.018
44.444	1028.030
44.832	1280.539
45.349	1343.534
45.349	1280.376
45.349	1090.902
45.736	1438.148
45.866	1153.897
46.382	1185.312
46.770	1532.558
47.158	1342.962
47.545	1879.682
47.545	1437.577
47.804	1311.179
48.062	1342.677
48.320	1500.490
48.837	1689.800
49.096	1342.350
49.354	1468.585
49.612	1721.135
49.871	1563.158
50.646	1436.598
50.775	1815.504
51.163	1341.698
51.292	1910.078
51.421	1878.458
51.421	1625.827
51.680	1657.324
52.196	1783.476
52.455	2004.447
52.713	1909.629
53.230	2477.887
53.747	2004.039
53.747	1814.566
54.393	2761.730
54.522	2035.374
54.780	2130.029
54.910	2666.830
54.910	1814.199
55.556	2256.100
55.685	2066.585
56.072	2698.042
56.718	1971.522
56.848	2539.902
57.106	2602.979
57.235	2097.675
57.623	2697.552
57.752	1876.459
58.269	2476.296
58.786	2886.659
59.173	2602.326
59.173	2476.010
59.432	2728.560
61.240	2791.147
61.499	3675.276
62.145	3643.493
62.403	3517.095
63.566	3106.202
63.695	3800.898
65.245	3484.619
65.633	3863.444
66.021	4115.953
66.667	3736.802
67.700	4115.423
70.801	5219.707
73.643	6766.177
78.811	6764.545
83.204	8847.369
86.563	9793.676
90.310	11308.283
91.214	9697.471
95.607	14053.978];
units.LW = {'cm', 'g'}; label.LW  = {'total length', 'wet weight'};  
bibkey.LW = 'ButlRowl2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd. k_J = 0; weights.psd.k = .1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-weight: Ww in g = 0.01072*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WXQD'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '994389'; % Ency of Life
metaData.links.id_Wiki = 'Maccullochella_ikei'; % Wikipedia
metaData.links.id_ADW = 'Maccullochella_ikei'; % ADW
metaData.links.id_Taxo = '78937'; % Taxonomicon
metaData.links.id_WoRMS = '991271'; % WoRMS
metaData.links.id_fishbase = 'Maccullochella-ikei'; % fishbase

%% References
bibkey = 'ButlRowl2008'; type = 'Article'; bib = [ ... 
'doi = {10.1071/mf07188}, ' ...
'author = {Butler, G. L. and Rowland, S. J.}, ' ...
'year = {2008}, ' ...
'title = {Using traditional age and growth techniques in endangered species management: eastern freshwater cod, \emph{Maccullochella ikei}}, ' ... 
'journal = {Marine and Freshwater Research, ), . doi: }, ' ...
'volume = {59(8}, '...
'pages = {684–693}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Maccullochella-ikei}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

