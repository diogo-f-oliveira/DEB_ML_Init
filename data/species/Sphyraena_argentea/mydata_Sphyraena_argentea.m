function [data, auxData, metaData, txtData, weights] = mydata_Sphyraena_argentea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sphyraeniformes'; 
metaData.family     = 'Sphyraenidae';
metaData.species    = 'Sphyraena_argentea'; 
metaData.species_en = 'Pacific barracuda'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMm', 'jiMr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.4); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 07];

%% set data
% zero-variate data

data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(12.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 41; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty of females'; bibkey.Lp  = 'BottAlle2007'; 
data.Li  = 145;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BottAlle2007';
  comment.Wwb = 'based egg diameter of 1.24-1.6 mm: pi/6*0.145^3'; 
data.Wwp = 370; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'BottAlle2007';
  comment.Wwp = 'based on W = 0.00724*Lp^2.92, see F1';
data.Wwi = 14.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on W = 0.00724*Li^2.92, see F1';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), std length (cm)
0.653	39.691
1.733	47.543
2.683	55.080
3.711	62.303
4.706	64.350
5.703	68.437
6.724	70.484
7.694	73.629
8.789	72.069
9.729	72.547
10.751	74.751
11.690	74.444
12.762	75.865
13.676	76.029
14.729	81.998
15.715	77.456
17.696	75.119
18.696	80.931];
data.tL_f(:,1) = 365 * (2.1 + data.tL_f(:,1));  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'std length', 'female'};  
temp.tL_f    = C2K(12.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BottAlle2007';
comment.tL_f = 'data for females';
% 
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.494	38.592
1.469	44.874
2.552	54.765
3.526	60.420
4.467	61.211
5.520	68.435
6.513	68.443
7.529	66.726
8.523	68.616
9.541	67.996
10.485	71.141
11.536	76.796
12.550	73.196
13.492	74.929
15.714	77.143
17.492	78.568];
data.tL_m(:,1) = 365 * (2.1 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'std length', 'male'};  
temp.tL_m    = C2K(12.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BottAlle2007';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... % std lenth (cm), wet weight (g)
31.168	219.858
32.532	184.397
32.702	198.582
33.893	226.950
34.743	290.780
35.595	269.503
36.786	326.241
37.298	283.688
38.149	326.241
39.168	404.255
39.511	340.425
40.364	312.056
40.700	439.716
41.549	524.823
41.554	397.163
42.572	496.454
42.916	418.439
43.422	560.283
44.106	496.454
45.130	425.532
45.466	560.283
45.810	475.177
46.316	624.113
46.653	716.312
46.998	595.744
48.016	730.496
48.022	546.099
48.189	659.574
48.702	602.837
49.206	808.510
49.550	695.035
49.893	638.298
50.400	765.957
50.735	914.893
50.741	730.496
51.589	843.971
51.769	574.468
52.784	787.234
53.119	943.262
53.292	879.432
54.142	929.078
54.310	985.815
55.499	1106.383
55.671	1042.553
56.172	1347.517
56.526	950.354
56.857	1234.042
57.376	992.908
57.543	1092.198
57.720	900.709
58.389	1276.595
58.390	1234.042
58.735	1106.383
59.410	1312.057
59.586	1156.028
59.762	992.908
60.433	1276.595
60.439	1120.567
61.107	1489.362
61.283	1333.333
61.967	1255.319
62.475	1347.517
62.638	1560.284
62.650	1226.950
62.814	1397.163
63.824	1744.681
63.839	1312.057
64.178	1368.794
64.341	1574.468
64.509	1645.390
65.035	1226.950
65.193	1574.468
66.206	1851.064
66.213	1645.390
66.217	1517.730
67.568	1886.525
67.747	1609.929
67.751	1510.638
67.915	1695.035
68.068	2205.674
68.942	1553.191
69.287	1425.532
69.435	2085.106
69.599	2262.411
69.782	1893.617
69.795	1503.546
69.960	1666.666
70.287	2063.830
70.459	2021.276
70.468	1744.681
70.625	2156.028
70.633	1914.893
70.801	1978.723
71.478	2099.291
71.816	2191.489
71.827	1865.248
72.171	1787.234
72.326	2234.043
72.860	1546.099
73.003	2340.425
73.522	2127.660
73.678	2553.192
73.874	1801.418
74.029	2255.319
74.865	2695.035
74.874	2432.624
75.057	2078.014
75.207	2659.574
75.570	2014.184
75.891	2588.652
75.909	2078.014
76.050	2914.893
76.068	2390.071
76.234	2510.638
77.598	2503.546
77.925	2886.525
77.935	2595.745
77.959	1900.709
78.609	2815.603
79.809	2595.745
79.990	2297.872
81.334	2851.064
82.013	2900.709
82.191	2687.943];
units.LW_f   = {'d', 'cm'};  label.LW_f = {'std length', 'wet weight', 'females'};  
bibkey.LW_f = 'BottAlle2007';
%
data.LW_m = [ ... % std lenth (cm), wet weight (g)
33.894	212.766
35.935	304.964
39.170	347.517
40.531	404.255
40.867	560.283
43.253	517.730
43.597	411.347
44.448	439.716
46.487	602.837
46.490	524.823
49.039	709.220
50.234	624.113
50.738	843.971
51.764	723.404
52.271	836.879
52.610	900.709
53.632	900.709
54.820	1014.184
55.157	1134.752
55.844	985.815
55.848	843.971
56.684	1326.241
56.689	1177.305
56.869	879.432
58.215	1390.071
58.740	978.723
59.922	1283.688
60.259	1397.163
60.424	1560.284
60.612	1035.461
60.617	893.617
61.102	1645.390
61.794	1347.517
62.297	1588.652
62.813	1418.440
63.321	1531.915
63.327	1347.517
63.330	1262.411
64.686	1446.808
64.839	1964.539
64.866	1177.305
65.194	1560.284
65.696	1815.603
66.729	1482.269
67.053	1992.908
67.744	1695.035
67.894	2297.872
68.067	2226.950
68.250	1843.971
68.593	1794.326
68.943	1503.546
69.255	2347.518
70.126	1808.511
70.957	2404.255
71.488	1808.511
71.640	2361.702
72.315	2560.284
73.853	2418.440
76.234	2531.915
76.567	2744.681
78.779	2815.603
81.671	2950.355];
units.LW_m   = {'d', 'cm'};  label.LW_m = {'std length', 'wet weight', 'males'};  
bibkey.LW_m = 'BottAlle2007';

% weight-fecundity
data.WN = [ ... % log10 weight (g), fecundity (#)
2.586	4.708
2.682	4.623
2.734	4.849
2.889	5.216
3.014	5.224
3.048	5.394
3.064	5.306
3.105	5.250
3.110	5.332
3.140	5.314
3.155	5.226
3.181	5.383
3.188	5.301
3.201	5.460
3.207	5.290
3.227	5.524
3.243	5.266
3.258	5.595
3.258	5.471
3.275	5.635
3.279	5.580
3.286	5.433
3.291	5.463
3.291	5.351
3.293	5.710
3.341	5.553
3.351	5.672
3.380	5.518
3.380	5.534
3.387	5.569
3.428	5.457
3.454	5.492
3.464	5.683];
data.WN = 10.^data.WN; % remove log10 transform
units.WN   = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN    = C2K(12.4);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'BottAlle2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lp = 3 * weights.Lp;
weights.Wwp = 3 * weights.Wwp;
% weights.WN = 3 * weights.WN;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Z2L2'; % Cat of Life
metaData.links.id_ITIS = '170426'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sphyraena_argentea'; % Wikipedia
metaData.links.id_ADW = 'Sphyraena_argentea'; % ADW
metaData.links.id_Taxo = '46310'; % Taxonomicon
metaData.links.id_WoRMS = '273978'; % WoRMS
metaData.links.id_fishbase = 'Sphyraena-argentea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyraena_argentea}}';
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
bibkey = 'BottAlle2007'; type = 'Article'; bib = [ ... 
'author = {David J. Bottinelli and Larry G. Allen}, ' ... 
'year = {2007}, ' ...
'title = {A RE-EVALUATION OF AGE, GROWTH, AND BATCH FECUNDITY IN THE {C}ALIFORNIA BARRACUDA, \emph{Sphyraena argentea}, FROM SOUTHERN {C}ALIFORNIA BASED ON SPECIMENS TAKEN FROM 2000 TO 2002}, ' ...
'journal = {California Fish and Game}, ' ...
'volume = {93(4)}, ' ...
'pages = {167-199}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Sphyraena-argentea.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

