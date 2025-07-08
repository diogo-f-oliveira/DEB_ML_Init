  function [data, auxData, metaData, txtData, weights] = mydata_Nemadactylus_macropterus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Latridae';
metaData.species    = 'Nemadactylus_macropterus'; 
metaData.species_en = 'Tarakihi'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 16];

%% set data

% zero-variate data

data.am = 41*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'Jord2001';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '30 yrs for females';

data.Lp = 30;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 70;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  1.3 mm: pi/6*0.13^3';
data.Wwi = 2.9e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
    
data.Ri  = 1e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    1 14.47 14.61
    2 21.73 21.73
    3 28.10 27.58
    4 30.81 31.92
    5 32.48 32.01
    6 33.76 33.42
    7 33.79 32.51
    8 34.30 32.20
    9 35.68 33.78
   10 36.03 33.80
   11 37.15 33.80
   12 35.53 35.95
   13 36.20 NaN
   14 35.70 33.35
   15 39.93 35.30
   16 37.06 NaN
   17 37.67 32.70
   18 37.75 37.30
   19 36.00 35.20
   20 NaN   38.20
   21 39.10 NaN
   22 40.30 NaN
   23 NaN   37.45
   26 42.60 36.80];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.9) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(15);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'Jord2001';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
6.493	0.885
6.967	7.761
7.677	7.858
7.724	35.112
8.057	7.910
8.198	35.177
8.483	21.592
8.672	42.053
8.672	21.617
8.909	62.522
8.957	8.032
9.099	1.240
9.242	12.59
9.288	42.137
9.526	12.326
9.715	8.136
9.999	21.798
10.094	42.247
10.237	1.395
10.425	55.916
10.521	1.433
10.663	21.889
10.995	21.934
11.136	69.637
11.327	1.543
11.753	42.473
11.800	62.915
11.990	-5.178
12.180	-5.152
12.369	22.121
12.605	56.213
12.891	8.568
12.985	56.265
12.985	22.205
13.363	76.752
13.506	35.900
13.743	63.180
13.981	15.529
14.075	56.413
14.407	22.399
14.454	56.465
14.690	76.933
15.117	90.615
15.117	63.367
15.354	90.648
15.450	-4.707
15.497	42.983
15.781	70.270
16.064	97.557
16.160	56.698
16.491	118.050
16.681	56.769
16.824	49.976
16.871	70.418
17.249	97.718
17.392	70.489
17.628	125.017
17.818	84.171
18.102	97.834
18.149	111.464
18.340	77.430
18.386	152.369
18.482	70.638
18.529	91.080
18.623	145.589
18.812	138.803
18.813	104.743
19.002	159.264
19.143	179.720
19.239	145.673
19.240	104.801
19.617	179.784
19.665	145.731
19.760	159.368
20.091	207.097
20.139	138.984
20.185	213.922
20.707	173.121
20.992	139.100
21.040	139.106
21.087	179.985
21.324	173.205
21.370	234.519
21.562	111.929
21.655	193.686
21.845	193.712
21.845	193.712
22.270	234.642
22.272	139.274
22.509	166.554
22.697	248.324
22.697	207.452
22.887	200.666
23.265	282.461
23.550	234.816
23.787	228.037
24.072	221.263
24.118	262.141
24.259	309.845
24.449	316.683
24.734	275.849
25.113	296.337
25.254	350.852
25.824	289.622
25.964	385.009
26.108	289.661
26.438	378.261
26.959	385.144
27.007	371.527
27.243	405.619
27.432	446.517
27.482	330.720
27.764	466.998
27.811	487.440
27.861	344.395
28.002	364.851
28.238	453.439
28.474	507.967
28.523	426.229
28.666	344.505
28.855	399.027
28.899	576.144
29.044	419.488
29.090	508.050
29.091	460.367
29.422	474.036
29.563	562.611
29.563	521.739
30.037	528.615
30.131	596.748
30.133	460.509
30.273	569.520
30.605	603.625
30.653	521.887
30.749	460.593
30.796	528.719
30.936	637.730
30.936	603.670
31.127	535.576
31.222	508.341
31.456	699.108
31.457	617.365
31.600	617.384
31.884	610.611
31.976	760.487
31.981	508.444
32.262	658.346
32.403	712.862
32.405	603.870
32.544	781.001
32.879	631.182
32.879	631.182
32.879	617.558
32.924	726.557
33.063	903.687
33.113	794.702
33.254	869.653
33.255	787.910
33.256	712.978
33.305	631.241
33.587	767.519
33.633	869.705
33.635	740.277
33.637	617.662
33.679	924.207
33.731	665.359
33.780	617.681
33.918	822.060
34.063	672.216
34.153	897.024
34.346	753.998
34.395	645.013
34.534	835.768
34.586	604.167
34.769	903.920
34.915	713.204
35.051	1040.198
35.103	835.845
35.148	944.843
35.198	774.550
35.291	876.743
35.573	1019.833
35.626	740.549
35.669	958.538
35.714	1074.348
35.766	849.560
35.857	1047.120
35.956	829.149
36.049	931.342
36.141	1053.970
36.336	754.269
36.383	808.772
36.472	1074.451
36.523	883.723
36.569	972.285
36.757	1040.430
36.854	924.640
36.950	870.157
37.134	1169.909
37.183	1088.172
37.232	999.623
37.281	924.698
37.281	904.262
37.562	1088.224
37.655	1169.980
37.802	917.957
37.895	1020.149
37.987	1170.026
38.032	1292.648
38.226	1081.502
38.318	1224.567
38.322	1013.395
38.323	938.464
38.362	1381.248
38.364	1299.505
38.605	1074.742
38.648	1299.544
38.745	1197.377
39.024	1469.894
39.027	1306.407
39.079	1095.243
39.127	1027.129
39.219	1170.194
39.263	1354.123
39.312	1279.198
39.457	1129.354
39.506	1068.053
39.596	1326.921
39.879	1354.207
40.165	1286.126
40.304	1483.693
40.451	1224.857
40.689	1163.582
40.729	1545.059
41.018	1293.054
41.020	1211.311
41.208	1279.456
41.772	1538.389
41.969	1150.132
42.061	1272.761
42.201	1415.831
42.582	1313.703
42.859	1702.025
44.188	1586.402
44.514	1865.738
45.034	1967.988];
units.LW = {'cm', 'g'}; label.LW = {'fork length', 'weight'};  
bibkey.LW = 'Jord2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4668M'; % Cat of Life
metaData.links.id_ITIS = '170262'; % ITIS
metaData.links.id_EoL = '46581352'; % Ency of Life
metaData.links.id_Wiki = 'Nemadactylus_macropterus'; % Wikipedia
metaData.links.id_ADW = 'Nemadactylus_macropterus'; % ADW
metaData.links.id_Taxo = '180921'; % Taxonomicon46581352
metaData.links.id_WoRMS = '281653'; % WoRMS
metaData.links.id_fishbase = 'Nemadactylus-macropterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemadactylus_macropterus}}';  
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
bibkey = 'Jord2001'; type = 'article'; bib = [ ...  
'author = {Alan R. Jordan}, ' ...
'year = {2001}, ' ...
'title = {Age, growth and spatial and interannual trends in age composition of jackass morwong, \emph{Nemadactylus macropterus}, in {T}asmania}, ' ... 
 'journal = {Mar. Freshwater Res.}, ' ...
'volume = {52}, '...
'pages = {651–60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemadactylus-macropterus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
