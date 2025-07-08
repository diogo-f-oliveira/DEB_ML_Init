function [data, auxData, metaData, txtData, weights] = mydata_Scomberoides_commersonnianus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Scomberoides_commersonnianus'; 
metaData.species_en = 'Talang queenfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 30];

%% set data
% zero-variate data
data.ab = 3.2;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'GrifFry2005';   
  temp.am = C2K(28.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 63.5; units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 120;   units.Li = 'cm'; label.Li = 'ultimate fork length';   bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 16e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight; based on 0.01122*Li^2.91, see F1, gives 12.6 kg';

data.GSI  = 0.03; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'GrifFry2005';   
  temp.GSI = C2K(28.1);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.961	34.274
1.038	35.748
1.144	26.345
1.160	34.456
1.160	30.032
1.236	30.400
1.251	37.404
1.328	28.555
2.091	31.679
2.091	41.265
2.152	36.471
2.167	49.374
2.182	36.840
2.197	27.807
2.258	44.581
2.304	48.820
2.319	35.732
2.319	39.050
2.319	48.082
2.350	46.238
2.518	33.886
2.518	41.259
2.548	39.784
2.609	32.410
2.701	42.179
2.991	40.332
3.082	57.658
3.082	48.441
3.128	51.390
3.159	59.316
3.204	46.597
3.204	38.302
3.296	57.102
3.327	45.858
3.418	46.410
3.479	52.123
3.494	55.625
3.510	44.749
3.525	42.169
3.662	50.093
3.662	40.508
3.723	48.249
3.769	43.825
3.800	57.649
3.922	58.569
3.998	62.071
4.059	53.038
4.059	56.356
4.135	51.931
4.135	58.567
4.227	73.681
4.227	65.202
4.242	54.326
4.288	50.454
4.288	63.357
4.318	66.675
4.318	55.799
4.349	67.965
4.349	52.850
4.379	63.172
4.395	65.384
4.440	50.268
4.440	58.379
4.486	62.065
4.532	68.700
4.578	70.358
4.578	65.750
4.593	63.354
4.593	49.713
4.669	56.717
4.700	64.274
4.761	73.306
4.776	65.748
4.776	54.872
4.791	68.513
4.822	57.452
4.852	62.798
4.914	64.456
4.914	50.262
4.959	67.220
4.990	68.510
5.051	81.228
5.112	82.149
5.112	79.937
5.173	84.729
5.173	68.877
5.234	64.083
5.264	81.041
5.264	80.857
5.264	77.723
5.463	67.583
5.524	76.430
5.677	81.221
5.677	84.539
5.738	80.667
5.814	74.767
5.829	56.887
6.058	83.612
6.119	73.289
6.134	82.690
6.363	73.470
6.394	80.106
6.409	80.106
6.516	86.556
6.623	81.209
6.653	89.503
6.867	71.621
7.157	90.603
7.447	86.729
7.523	86.175
7.584	83.040
7.675	72.717
7.737	83.592
7.813	88.568
7.813	85.434
7.859	83.590
7.904	87.460
11.017	87.238];
data.tL_f(:,1) = (data.tL_f(:,1)+0.5)*365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length'}; 
temp.tL_f = C2K(28.1); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GrifFry2005'; 
%
data.tL_m = [ ...
0.992	35.564
1.007	33.167
1.007	31.324
1.053	37.775
1.175	31.875
1.282	33.533
1.312	29.846
1.343	39.615
1.419	36.665
1.984	41.819
2.045	38.500
2.075	34.629
2.197	34.259
2.197	38.130
2.228	40.526
2.258	49.558
2.274	36.285
2.274	40.156
2.304	41.446
2.304	48.267
2.350	46.607
2.396	41.630
2.472	44.762
2.472	47.712
2.503	31.859
2.503	43.472
2.564	40.521
2.594	47.894
2.625	49.184
2.701	48.999
2.762	45.127
2.762	47.708
2.792	48.445
2.930	31.669
2.991	39.042
3.067	56.368
3.204	54.523
3.266	49.361
3.281	46.596
3.296	41.434
3.342	48.254
3.357	52.493
3.357	44.936
3.479	53.782
3.525	57.837
3.632	52.490
3.647	56.545
3.647	54.517
3.678	65.946
3.723	55.991
3.800	53.963
3.800	41.797
3.845	64.469
3.876	53.040
3.906	48.063
3.952	51.749
4.013	55.066
4.044	50.273
4.059	68.890
4.059	58.936
4.074	57.277
4.135	59.304
4.151	70.179
4.151	67.414
4.181	55.432
4.181	51.746
4.273	60.408
4.273	57.459
4.273	53.035
4.303	66.860
4.303	53.956
4.364	55.246
4.395	63.725
4.425	68.701
4.471	78.839
4.502	59.668
4.502	65.198
4.578	56.718
4.608	67.777
4.669	62.062
4.700	82.339
4.715	70.725
4.746	52.661
4.746	60.403
4.868	77.913
4.868	52.106
4.990	48.787
5.020	55.791
5.036	61.689
5.036	56.897
5.081	74.039
5.112	77.357
5.203	62.793
5.249	75.512
5.249	65.005
5.264	79.014
5.280	61.686
5.326	60.027
5.341	67.031
5.387	62.975
5.524	75.139
5.524	61.315
5.539	73.665
5.554	81.406
5.646	72.373
5.677	70.529
5.707	85.275
5.799	61.311
5.982	78.268
6.012	62.783
6.241	81.582
6.302	81.213
6.577	82.684
6.638	82.315
6.684	80.287
6.943	88.025
6.943	75.491
7.538	82.488
7.798	86.724
8.423	83.214
10.788	85.582
12.055	91.833];
data.tL_m(:,1) = (data.tL_m(:,1)+0.5)*365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length'}; 
temp.tL_m = C2K(28.1); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GrifFry2005'; 

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
23.404	172.355
27.013	237.948
27.632	264.078
28.147	264.145
29.591	329.456
30.313	355.599
30.314	381.648
31.035	368.718
31.448	394.821
32.478	355.881
32.994	381.997
33.613	447.201
34.232	473.331
34.644	434.311
35.057	512.512
36.708	564.826
36.708	603.899
37.224	656.065
37.429	525.846
38.358	669.237
38.565	747.412
39.080	656.307
39.493	747.533
40.420	656.481
40.421	786.727
41.143	825.895
41.658	760.839
42.072	852.065
43.308	800.128
43.412	878.289
43.620	982.513
43.720	735.059
44.856	904.526
44.960	1008.737
45.890	1178.178
46.816	1061.077
47.023	1100.178
47.333	1204.415
47.951	1152.397
48.056	1295.681
48.571	1256.675
48.673	1152.491
48.882	1373.937
48.982	1165.556
49.294	1334.916
49.499	1230.746
49.910	1178.701
50.325	1335.051
51.148	1257.010
51.254	1517.516
51.872	1413.400
52.080	1621.821
52.284	1374.380
52.387	1413.467
52.698	1504.680
53.112	1648.004
53.522	1465.713
53.624	1374.554
53.626	1582.948
54.041	1752.322
54.143	1726.286
54.245	1570.004
54.353	2051.928
54.761	1674.268
54.862	1491.937
54.969	1778.492
55.172	1531.051
55.279	1895.754
55.380	1700.398
55.898	1921.884
56.101	1648.393
56.106	2039.132
56.203	1544.210
56.311	1987.060
56.317	2442.922
56.412	1778.680
56.927	1739.673
57.134	1830.872
57.546	1791.852
57.748	1427.190
57.859	2117.508
57.862	2351.951
57.963	2195.669
58.580	2013.405
58.581	2104.577
58.888	1922.273
58.990	1792.040
59.511	2300.068
59.610	1948.416
59.612	2169.835
60.023	2039.642
60.025	2182.913
60.126	1974.533
60.849	2130.922
61.161	2391.455
61.263	2274.247
61.265	2430.542
61.370	2560.802
61.779	2300.363
61.984	2222.242
62.091	2560.896
62.192	2365.540
62.404	2834.453
62.708	2430.730
62.814	2665.187
62.915	2482.855
63.227	2730.364
63.536	2704.355
63.739	2391.791
64.254	2378.833
64.257	2665.375
64.261	2964.941
64.569	2899.858
64.777	2991.057
64.977	2483.124
65.185	2626.422
65.913	3238.673
66.008	2496.283
66.014	3030.292
66.015	3095.415
66.113	2678.641
66.841	3251.818
67.353	2952.319
67.559	2861.174
67.770	3291.013
67.978	3473.385
68.071	2600.748
68.179	3017.550
68.281	2900.342
68.489	3121.787
69.006	3226.051
69.624	3147.984
69.832	3369.429
69.835	3564.799
70.552	3200.203
70.661	3695.152
71.069	3304.467
71.590	3799.470
72.412	3591.184
73.028	3343.796
73.343	3812.723
73.344	3929.945
73.444	3695.515
73.554	4255.587
73.654	4021.157
73.955	3252.745
74.686	4086.415
75.618	4438.200
75.714	3826.056
75.818	3904.218
78.306	5128.854
78.398	4152.021
79.433	4464.746
79.746	4816.451
80.370	5337.517
80.782	5246.398
80.890	5728.323
81.093	5376.685
81.190	4907.812
81.192	5025.033
81.821	5936.837
82.120	5038.179
82.421	4386.988
82.538	5572.242
82.541	5832.734
83.056	5754.654
83.265	6041.222
83.265	6067.272
84.084	5546.394
85.006	5051.579
85.539	6536.453
85.837	5585.696
86.660	5416.484
86.687	7760.915
86.892	7643.721
87.083	6315.236
87.192	6823.210
87.711	7174.942
88.736	6680.140
88.949	7253.251
90.506	8217.274
92.445	6433.156
92.457	7514.200];
units.LW = {'cm', 'g'};  label.LW = {'fork length','weight'}; 
bibkey.LW = 'GrifFry2005'; 

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
47.750	263290.329
51.836	250350.118
52.808	408802.941
57.110	433892.498
64.756	788480.206
66.797	737626.128
67.974	547334.112
69.927	1111521.886
79.849	2093682.588
80.809	1839998.533
84.895	1820717.754
86.394	1611383.582
86.646	2809737.177
87.275	2308791.449
90.626	2872890.591];
units.LN = {'cm', '#'};  label.LN = {'fork length','fecundity'}; 
temp.LN = C2K(28.1); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'GrifFry2005'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.GSI = 0 * weights.GSI;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PCJ'; % Cat of Life
metaData.links.id_ITIS = '168709'; % ITIS
metaData.links.id_EoL = '46578050'; % Ency of Life
metaData.links.id_Wiki = 'Scomberoides_commersonnianus'; % Wikipedia
metaData.links.id_ADW = 'Scomberoides_commersonnianus'; % ADW
metaData.links.id_Taxo = '45252'; % Taxonomicon
metaData.links.id_WoRMS = '151169'; % WoRMS
metaData.links.id_fishbase = 'Scomberoides-commersonnianus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scomberoides_commersonnianus}}';  
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
bibkey = 'GrifFry2005'; type = 'techreport'; bib = [ ...
'author = {Griffiths, S.P. and Fry, G.C. and van der Velde, T.D. }, ' ...
'year = {2005}, ' ...
'title = {Age, growth and reproductive dynamics of the Talang queenfish (\emph{Scomberoides commersonnianus}) in northern {A}ustralia}, ' ... 
'institution = {Final report to the National Oceans Office. CSIRO Cleveland}, ' ...
'pages = {pp 39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Scomberoides-commersonnianus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
