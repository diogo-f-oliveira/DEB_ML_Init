function [data, auxData, metaData, txtData, weights] = mydata_Eleutheronema_tetradactylum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Polynemiformes'; 
metaData.family     = 'Polynemidae';
metaData.species    = 'Eleutheronema_tetradactylum'; 
metaData.species_en = 'Fourfinger threadfin'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MINE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 01 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 10]; 

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 29; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 200;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.775 mm: pi/6*0.0775^3'; 
data.Wwi  = 145e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight'; bibkey.Wwi  = 'fishbase';

data.Ri = 5e7/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.8';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (yr), fork length (cm)
0.262	5.547
0.524	9.531
0.758	13.170
1.213	21.315
1.791	29.630
2.246	35.866
2.618	40.195
3.059	45.738
3.541	51.279
3.982	56.300
4.506	61.146
5.016	65.472
5.498	69.452
6.008	73.083
6.518	76.715
7.028	79.652];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length', 'Capricorn'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BallWelc2012';
comment.tL = 'these are back-calculated estimates, not measured data, for QLD East Coast  Capricorn; sex change at FL 46.7';
%
data.tL1 = [ ... % time since birth (yr), fork length (cm)
0.262	9.712
0.551	15.257
0.744	19.244
1.020	22.708
1.295	25.651
1.516	28.075
2.026	31.186
2.549	33.256
3.004	34.633
3.514	35.661
4.010	35.996
4.520	36.504
5.030	36.665
5.498	37.000
6.035	36.987
6.518	37.149
7.028	37.136];
data.tL1(:,1) = 365 * data.tL1(:,1);  % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'fork length', 'Blue Mud Bay'};  
temp.tL1    = C2K(38);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BallWelc2012';
comment.tL1 = 'these are back-calculated estimates, not measured data, for NT Western GoC  Blue Mud Bay; sex change at FL 46.7 and 3.4 yr';

data.LW = [ ... % fork length (cm), weight (g)
17.954	91.740
24.787	216.983
25.879	286.295
25.880	258.614
25.971	251.702
26.516	314.040
26.791	279.465
27.154	348.705
27.155	272.581
27.699	397.202
27.883	341.857
28.246	397.256
28.339	314.220
29.157	411.187
29.250	355.833
29.885	466.622
29.887	376.657
30.252	397.454
30.341	473.588
30.978	529.014
31.163	404.465
31.799	480.652
32.071	549.883
32.346	466.865
32.799	605.319
33.255	577.682
33.256	529.239
33.527	646.913
33.532	453.142
33.891	674.631
34.077	494.718
34.257	626.224
34.349	557.029
34.622	612.419
34.894	674.730
35.076	674.748
35.260	591.721
35.347	778.581
35.353	508.685
35.713	716.333
35.897	626.386
35.986	730.201
35.987	688.679
35.990	557.191
36.439	854.813
36.440	813.291
36.444	619.520
36.532	764.857
36.805	785.645
36.896	778.734
36.899	674.928
37.168	841.045
37.265	591.919
37.537	688.832
37.716	806.497
37.718	723.452
37.896	896.480
37.993	675.036
38.076	1000.304
38.079	875.737
38.260	944.959
38.352	917.286
38.446	771.967
38.895	1090.350
38.988	979.633
38.990	924.270
39.078	1021.164
39.085	723.587
39.355	875.863
39.445	924.315
39.447	848.190
39.716	1055.829
40.083	945.139
40.171	1062.795
40.174	938.228
40.264	1014.361
40.267	862.112
40.442	1201.230
40.626	1118.203
40.720	959.043
40.807	1180.505
40.902	1014.424
41.174	1035.212
41.265	1083.664
41.266	1007.540
41.269	896.813
41.358	1000.628
41.537	1139.054
41.626	1229.029
41.807	1256.728
41.903	1069.886
42.084	1118.347
42.088	966.098
42.261	1339.818
42.270	973.037
42.359	1035.330
42.538	1215.278
42.630	1139.162
42.718	1312.182
42.721	1180.694
42.997	1069.994
43.080	1395.262
43.084	1243.014
43.086	1139.208
43.445	1388.378
43.629	1319.192
43.722	1243.077
43.813	1243.086
43.899	1450.707
43.907	1118.527
43.988	1582.203
44.087	1201.590
44.176	1298.485
44.537	1457.690
44.540	1319.282
44.541	1305.441
44.543	1194.715
44.722	1367.743
45.176	1436.992
45.176	1409.310
45.179	1284.743
45.267	1430.080
45.268	1381.638
45.355	1561.577
45.538	1520.073
45.721	1492.409
45.725	1312.479
45.900	1651.596
45.901	1610.074
45.903	1506.268
46.084	1568.570
46.089	1367.878
46.182	1271.001
46.269	1478.623
46.537	1693.182
46.541	1540.933
46.897	1900.830
46.899	1810.865
46.903	1644.775
46.908	1395.641
46.984	2060.008
47.002	1271.083
47.089	1451.022
47.172	1817.812
47.174	1755.529
47.177	1596.359
47.361	1527.173
47.721	1741.742
47.815	1631.024
47.905	1658.715
48.089	1596.449
48.175	1831.752
48.269	1679.512
48.272	1548.025
48.449	1776.416
48.451	1700.292
48.455	1534.202
48.719	1956.373
48.814	1748.770
48.903	1859.506
48.908	1658.814
49.178	1776.488
49.179	1734.966
49.182	1624.239
49.639	1555.080
49.905	1887.287
49.906	1838.844
49.908	1776.560
50.629	2115.732
50.637	1755.871
51.078	2392.593
51.088	1970.449
51.179	1963.537
51.355	2240.371
51.450	2088.131
51.635	1977.423
51.636	1935.901
51.724	2074.318
51.899	2399.594
51.899	2364.992
51.997	2081.265
52.456	1949.822
52.723	2198.984
52.725	2143.621
52.817	2115.948
53.088	2199.020
53.537	2489.722
53.544	2205.985
53.630	2399.766
53.820	2095.286
54.272	2240.660
54.274	2143.774
54.453	2316.802
54.539	2524.423
54.540	2475.980
54.540	2469.060
54.541	2427.537
55.086	2503.716
55.359	2559.106
55.724	2538.381
55.911	2310.026
55.912	2261.583
56.007	2088.582
56.089	2489.974
56.438	3195.891
56.816	2580.011
56.901	2863.757
57.002	2448.542
57.257	3244.415
58.359	2898.503
58.456	2628.616
59.081	3216.913
59.719	3196.215
61.173	3383.210
61.542	3175.634
61.905	3244.874];
units.LW   = {'cm', 'g'};  label.LW = {'fork length', 'wet weight'};  
bibkey.LW = 'BallWelc2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.tL1 = 5 * weights.tL1;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for Capricorn, Blue Mud Bay'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'In view of tL1 versus tL data, the mean temperature at Blue Mud Bay is assumed to be higher than at Capricorn';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Marine; freshwater; brackish; pelagic-neritic; amphidromous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protandrous hermaphrodite (first male, then female)';
metaData.bibkey.F2 = 'BallWelc2012'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '399W4'; % Cat of Life
metaData.links.id_ITIS = '645505'; % ITIS
metaData.links.id_EoL = '46578865'; % Ency of Life
metaData.links.id_Wiki = 'Eleutheronema_tetradactylum'; % Wikipedia
metaData.links.id_ADW = 'Eleutheronema_tetradactylum'; % ADW
metaData.links.id_Taxo = '153679'; % Taxonomicon
metaData.links.id_WoRMS = '280639'; % WoRMS
metaData.links.id_fishbase = 'Eleutheronema-tetradactylum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eleutheronema_tetradactylum}}';
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
bibkey = 'BallWelc2012'; type = 'Article'; bib = [ ... 
'author = {Aaron C. Ballagh and David J. Welch and  Stephen J. Newman and Quentin Allsop and Jason M. Stapley}, ' ... 
'year = {2012}, ' ...
'title = {Stock structure of the blue threadfin (\emph{Eleutheronema tetradactylum}) across northern {A}ustralia derived from life-history characteristics}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {121-122}, ' ...
'pages = {63-72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Eleutheronema-tetradactylum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

