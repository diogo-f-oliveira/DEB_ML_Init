  function [data, auxData, metaData, txtData, weights] = mydata_Tachysurus_fulvidraco
  
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Tachysurus_fulvidraco'; 
metaData.species_en = 'Yellow catfish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biC'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 25];

%% set data
% zero-variate data
data.ab = 16; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'NaziKhan2020';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.4;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'JabeHoss2020';
data.Li = 34.5;     units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 12.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'JabeHoss2020','fishbase'};
  comment.Wwp = 'based on 0.00955*Lp^2.94, see F1';
data.Wwi = 317;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^2.94, see F1';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 10.63
    2 14.66
    3 15.12
    4 16.90];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time', 'total length'};  
  temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CaoSong2008'; 

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
9.109	16.716
9.110	13.373
9.874	18.806
9.926	15.881
10.065	18.388
10.186	21.313
10.273	21.313
10.273	20.060
10.378	19.224
10.394	24.239
10.482	20.896
10.516	24.657
10.725	20.896
10.742	22.149
10.794	24.239
10.828	27.164
10.845	30.090
10.933	25.075
10.984	27.582
11.055	25.493
11.071	29.672
11.125	22.985
11.176	24.657
11.194	24.239
11.228	26.328
11.229	24.239
11.262	30.090
11.298	24.657
11.331	30.925
11.332	27.582
11.401	29.672
11.402	25.075
11.418	33.433
11.435	34.269
11.575	32.179
11.577	23.821
11.594	25.910
11.610	29.254
11.697	27.582
11.768	23.821
11.783	34.687
11.785	24.239
11.817	36.776
11.837	28.000
11.837	26.746
11.872	25.910
11.887	33.015
12.010	31.343
12.114	30.925
12.129	39.701
12.131	33.433
12.147	36.776
12.148	33.433
12.148	33.433
12.153	13.791
12.234	39.284
12.269	35.940
12.271	29.672
12.323	31.761
12.339	36.776
12.392	33.851
12.408	39.284
12.477	40.119
12.494	43.045
12.600	35.522
12.600	34.269
12.651	40.537
12.670	32.179
12.671	29.672
12.739	37.194
12.756	35.522
12.807	41.373
12.823	47.224
12.825	39.701
13.032	45.134
13.083	49.313
13.085	42.627
13.103	40.119
13.137	45.552
13.189	43.045
13.260	37.612
13.292	50.149
13.295	36.358
13.311	43.463
13.312	40.537
13.348	34.687
13.362	47.224
13.369	20.060
13.381	42.209
13.414	50.149
13.485	44.716
13.503	40.537
13.509	15.881
13.571	47.642
13.590	40.537
13.622	50.149
13.629	22.149
13.659	43.463
13.693	47.224
13.694	43.463
13.712	40.119
13.735	15.045
13.744	51.821
13.780	44.299
13.813	53.910
13.816	41.791
13.831	50.567
13.867	45.970
13.898	62.269
13.902	45.970
13.905	33.015
13.918	49.731
13.920	40.537
14.005	51.821
14.042	42.209
14.049	14.627
14.057	48.896
14.094	42.627
14.159	61.851
14.170	16.716
14.178	52.657
14.179	48.896
14.232	45.552
14.264	56.418
14.302	42.627
14.318	48.478
14.387	53.493
14.388	46.806
14.389	43.463
14.401	66.030
14.455	58.507
14.510	48.896
14.524	59.343
14.527	48.478
14.543	53.075
14.629	56.418
14.643	70.627
14.666	50.567
14.667	46.806
14.685	43.463
14.698	60.597
14.702	45.970
14.716	57.672
14.752	52.657
14.768	60.179
14.805	48.478
14.904	71.045
14.907	59.761
14.942	58.507
14.976	63.522
15.148	69.373
15.151	55.582
15.170	50.567
15.183	66.448
15.223	48.060
15.237	62.687
15.237	59.761
15.268	76.478
15.320	75.224
15.326	53.493
15.378	53.910
15.392	65.194
15.394	60.179
15.395	56.000
15.408	74.806
15.429	57.672
15.446	61.015
15.497	63.104
15.533	60.179
15.620	59.761
15.670	68.955
15.718	86.925
15.720	78.567
15.738	75.224
15.777	57.672
15.846	61.433
15.880	63.940
16.068	76.896
16.071	63.104
16.100	86.090
16.141	61.015
16.365	69.791
16.383	67.701
16.458	45.970
16.504	73.134
16.815	78.149
16.837	59.343
17.135	119.940
18.030	90.269
19.104	106.985
19.155	109.493];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight'};  
bibkey.LW_f = 'CaoSong2008'; 
%
data.LW_m = [ ... % total length (cm), weight (g)
9.539	20.011
9.707	16.334
9.748	19.494
10.227	17.409
10.331	18.993
10.477	19.526
10.643	23.743
10.727	19.537
10.914	21.124
10.997	25.864
11.183	37.978
11.206	24.821
11.497	26.413
11.580	26.416
11.581	22.206
11.685	21.684
11.726	28.528
11.955	29.064
11.976	29.591
12.059	32.753
12.081	19.596
12.161	50.126
12.184	28.022
12.225	35.392
12.455	30.139
12.496	31.720
12.598	58.566
12.600	34.356
12.766	43.837
12.913	36.475
13.141	38.590
13.142	35.432
13.204	35.435
13.307	44.387
13.329	37.546
13.371	39.653
13.390	49.653
13.412	40.181
13.557	44.398
13.558	37.029
13.578	47.030
13.621	37.558
13.662	44.402
13.807	44.409
13.890	52.307
13.953	43.362
13.954	42.836
14.141	47.055
14.162	41.793
14.224	43.901
14.265	51.271
14.369	52.854
14.369	49.170
14.620	47.076
14.641	43.919
14.661	49.183
14.786	50.767
14.828	45.506
14.890	54.456
14.911	46.036
15.077	53.412
15.118	60.782
15.202	58.680
15.203	49.207
15.347	59.739
15.431	57.111
15.577	53.434
15.636	81.857
15.639	60.805
15.681	56.596
15.888	69.763
15.889	63.447
15.931	61.344
15.971	67.661
15.973	58.188
16.139	60.827
16.159	66.617
16.180	67.671
16.241	78.726
16.243	60.831
16.284	69.780
16.429	71.366
16.491	75.053
16.492	66.105
16.493	61.368
16.513	68.211
16.575	72.951
16.617	66.637
16.722	66.115
16.804	72.961
16.867	70.332
16.887	77.702
16.887	75.070
16.951	68.757
16.991	78.759
17.096	73.500
17.157	81.924
17.178	85.083
17.179	76.135
17.282	88.245
17.346	75.090
17.386	82.987
17.408	79.830
17.409	71.409
17.511	89.834
17.552	89.310
17.553	84.047
17.573	93.521
17.654	108.262
17.759	101.950
17.760	90.898
17.783	79.320
17.803	81.426
17.825	68.795
17.844	87.744
17.947	95.643
17.950	76.169
17.989	93.013
18.053	87.226
18.093	98.281
18.116	78.808
18.136	86.177
18.177	93.548
18.217	101.970
18.240	89.866
18.281	96.710
18.345	79.344
18.406	89.873
18.426	103.032
18.429	76.717
18.449	84.612
18.468	98.297
18.487	113.035
18.511	86.194
18.614	100.409
18.676	96.727
18.760	96.731
18.778	123.048
18.967	109.372
18.990	91.478
19.010	96.742
19.051	102.007
19.259	102.016
19.322	102.545
19.404	107.812
19.467	105.183
19.529	111.502
19.633	115.717
19.634	105.190
19.675	106.771
19.697	103.088
19.758	113.617
19.778	116.249
19.839	132.042
19.863	102.043
19.883	110.465
19.945	118.888
19.947	100.994
19.962	147.836
19.966	114.679
19.986	125.732
20.029	107.839
20.110	130.474
20.111	119.948
20.153	122.582
20.154	114.161
20.237	109.954
20.256	129.428
20.278	116.798
20.296	145.746
20.320	113.642
20.401	133.119
20.508	112.071
20.716	116.291
20.758	112.608
20.797	131.557
20.819	126.821
20.821	106.821
20.881	128.403
20.922	133.142
21.027	129.988
21.132	122.098
21.193	130.522
21.236	122.629
21.255	139.998
21.256	126.841
21.257	119.472
21.401	135.268
21.505	140.009
21.922	132.659
22.149	152.669
22.194	127.934
22.319	127.940
22.481	162.157];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight'};  
bibkey.LW_m = 'CaoSong2008'; 

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
22.778	2384.671
22.963	729.296
24.630	1514.282
25.278	1177.382
26.667	1317.175
27.222	1878.103
27.963	923.935
28.611	1456.775
28.611	1120.100
29.074	1905.511
29.815	2382.203
30.463	1989.191
30.648	1736.621
31.296	2016.955
34.444	3334.488
35.278	1201.931
36.481	1846.800
36.944	3361.668
38.241	1425.342
40.278	2967.713
41.389	2153.696
42.407	2265.563
43.148	2714.201
43.426	3387.450
45.370	2292.581
46.944	2151.748
47.222	2824.997
47.500	6275.801
47.593	3442.102
49.074	3132.965
49.815	3834.108
50.463	3384.982
51.481	3524.906
52.593	3356.180
56.389	3074.287
57.315	2512.840
58.426	3466.358
58.889	6552.369
59.815	4616.172
59.815	3465.871
62.870	5877.626
63.519	6045.735
63.611	3464.540
64.167	8205.828
65.093	4277.648
66.204	5988.681
68.241	6885.762
69.722	6576.626
70.370	5538.322
73.796	9717.482
73.796	6098.243
74.352	9380.613
77.037	4834.581
77.315	7948.712
85.648	6346.592
119.259	11665.466];
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
  temp.WN = C2K(20);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'CaoSong2008'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.ab = weights.ab * 0;
weights.WN = weights.WN * 5;
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^2.94'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54F32'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '613220'; % Ency of Life
metaData.links.id_Wiki = 'Tachysurus_fulvidraco'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1683252'; % Taxonomicon
metaData.links.id_WoRMS = '1022007'; % WoRMS
metaData.links.id_fishbase = 'Tachysurus-fulvidraco'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Tachysurus_fulvidraco}}';  
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
bibkey = 'CaoSong2008'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-008-9342-x}, ' ...
'author = {Cao, L. and Song, B. and Zha, J. and Yang, C. and Gong, X. and Li, J. and Wang, W.}, ' ...
'year = {2008}, ' ...
'title = {Age composition, growth, and reproductive biology of yellow catfish (Peltobagrus fulvidraco, Bagridae) in Ce Lake of Hubei Province, Central China}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {86(1)}, '...
'pages = {75–88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tachysurus-fulvidraco.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

