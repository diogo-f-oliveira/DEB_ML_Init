function [data, auxData, metaData, txtData, weights] = mydata_Urophycis_tenuis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Phycidae';
metaData.species    = 'Urophycis_tenuis'; 
metaData.species_en = 'White hake'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 17];

%% set data
% zero-variate data

data.ab = 8;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'hatch 3-7 d at 7-20 C';
data.am = 23*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(4.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 43; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'ChanMors1999'; 
data.Lpm  = 40; units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'ChanMors1999'; 
data.Li  = 135;  units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'fishbase';
data.Lim  = 133;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male'; bibkey.Lim  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ChanMors1999';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*0.075^3'; 
data.Wwp = 578; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00398*Lp^3.16, see F1'; 
data.Wwi = 21e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 21 kg; based on 0.00398*Li^3.16, see F1, gives 21.5 kg'; 

data.Ri  = 15e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 0	 20.838 19.789
 1	 25.255 25.604
 2	 32.293 31.596
 3	 38.287 38.988
 4	 47.077 45.153
 5	 56.042 51.320
 6	 64.309 58.886
 7	 72.397 64.177
 8	 82.064 69.295
 9	 88.404 68.637
10	 95.619 64.832
11	 97.937 71.174
12	101.655 71.393];
data.tL_fm(:,1) = 365 * (1.5+data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(4.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'ClayClay1991';
comment.tL_fm = 'Data from 1986 annual resource survey of the southern Gulf of St. Lawrence';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
17.122	114.404
18.529	151.122
19.701	79.001
19.936	79.078
20.640	115.564
21.343	115.796
22.047	188.535
22.985	116.337
23.689	116.569
24.627	153.132
25.330	117.110
26.738	81.320
27.441	117.805
28.145	81.784
29.083	263.362
30.021	263.671
30.725	263.903
31.429	227.881
32.367	336.951
33.305	409.768
34.243	337.570
34.712	301.471
35.650	193.019
35.885	338.111
36.354	410.773
37.292	483.590
37.292	483.590
38.465	375.215
39.872	556.948
40.576	629.687
40.810	484.749
41.045	557.334
42.217	521.467
43.156	630.537
43.859	667.023
44.563	558.494
45.032	812.425
45.970	776.480
46.205	595.289
46.908	740.536
47.143	1066.897
48.081	1139.714
49.019	922.500
49.019	704.977
49.488	922.655
51.130	814.435
51.365	1249.557
52.068	1068.520
52.068	1358.550
52.537	959.913
54.414	1250.562
54.648	1758.192
55.117	1105.779
55.586	1323.456
56.055	1504.880
56.759	1360.096
57.463	1722.866
57.697	1287.898
57.697	1650.436
58.870	1832.091
59.339	2158.530
59.339	1795.992
59.339	1360.947
59.574	1977.338
59.574	1506.039
59.574	1433.532
60.512	2158.916
60.746	1651.441
60.746	2267.755
61.450	1977.957
61.450	2340.494
61.919	1579.320
62.388	2232.042
62.857	1724.644
63.092	2594.812
63.326	1906.067
63.795	2051.237
64.030	2160.076
64.030	2486.360
64.030	1797.538
64.968	2812.953
65.672	2450.647
65.906	2486.978
65.906	2269.455
66.141	2052.010
67.079	2414.857
67.079	1943.558
67.313	3067.502
67.313	2596.203
68.017	1291.299
68.252	2560.259
68.486	2741.605
68.486	2197.798
68.721	3104.220
69.190	2270.538
69.659	2887.006
69.659	3648.336
69.893	2560.800
70.128	2995.922
70.362	2597.208
70.597	3322.361
71.066	2959.978
71.066	2742.455
71.301	3648.877
71.301	3213.832
72.239	2815.349
72.708	3866.863
73.177	3395.719
73.177	3033.181
73.177	2924.420
73.881	4193.534
74.115	4121.104
74.350	3541.120
74.819	4411.366
75.053	4665.219
75.053	3903.890
75.288	3722.699
75.757	4049.137
76.461	3106.771
76.695	3868.177
76.930	4375.808
77.164	3650.809
78.102	4412.448
78.337	3868.719
78.571	4013.811
78.571	3470.004
79.275	5065.402
80.448	3905.668
81.386	4703.560
81.386	4631.053
81.855	4232.416
82.090	5138.838
83.497	4921.779
85.608	4741.205
85.842	5140.074
87.015	6336.835
87.484	5539.407
88.891	5902.409
89.595	7099.015
89.829	6120.240
90.533	5612.919
90.768	6301.818
91.471	7172.141
91.471	6048.274
91.706	7353.487
93.582	6230.239
94.755	7354.492
95.224	8768.544
95.458	6085.842
95.693	8079.877
95.928	9312.583
96.397	7173.764
97.335	7971.657
97.335	7101.566
97.569	9639.408
98.507	8515.850
98.742	7174.537
100.149	9060.198
100.618	12323.192
101.322	12033.394
104.136	11019.216
104.840	12070.807
105.309	9678.212];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'ClayClay1991';
%
data.LW_m = [ ... % total length (cm), weight (g)
17.116	40.989
17.572	41.195
19.626	42.124
21.677	125.924
22.819	109.865
23.961	77.232
24.869	193.665
26.013	127.884
26.696	161.342
27.152	194.697
28.289	278.084
29.435	162.580
29.888	262.232
31.259	213.128
31.941	279.734
32.621	396.064
33.299	562.116
33.310	280.353
33.995	280.663
34.674	413.567
34.908	281.075
35.585	480.277
35.817	364.360
36.728	414.495
37.866	514.457
37.869	431.585
37.870	398.437
38.991	929.330
39.004	581.270
39.239	399.056
40.148	515.488
40.368	714.483
40.375	532.166
40.608	416.249
41.052	731.367
41.727	980.291
41.745	516.210
42.199	582.714
43.343	516.933
43.791	716.031
44.479	633.468
44.701	815.889
44.709	583.849
45.843	766.682
46.755	800.243
46.758	733.946
47.227	386.092
47.651	1248.162
47.657	1082.419
47.665	883.527
47.898	751.036
48.575	950.237
49.037	817.849
49.460	1679.919
49.474	1315.284
49.720	851.307
49.943	984.005
50.166	1133.276
50.835	1547.943
51.301	1282.961
51.517	1614.550
51.542	951.578
51.765	1084.276
52.457	885.694
52.673	1200.708
52.682	985.243
52.916	819.603
53.132	1134.618
53.357	1234.167
53.579	1400.013
54.046	1118.456
54.278	1002.539
54.488	1483.297
54.495	1317.554
54.955	1218.314
55.177	1367.586
55.854	1583.362
56.307	1683.014
56.325	1202.359
56.542	1500.800
56.545	1417.928
56.778	1285.437
57.673	1749.930
57.907	1600.864
57.921	1236.230
58.375	1302.733
58.584	1816.640
58.596	1485.154
58.597	1452.005
58.797	2214.526
59.046	1651.103
59.053	1485.360
60.190	1585.322
60.418	1585.425
60.621	2265.074
60.863	1883.969
60.867	1784.523
61.308	2182.512
61.768	2083.273
61.787	1586.044
62.897	2415.275
62.918	1868.323
63.134	2183.338
63.142	1967.872
64.051	2084.304
64.051	2084.304
64.051	2084.304
64.954	2333.332
66.089	2483.016
66.546	2483.222
66.558	2168.311
67.466	2301.318
67.668	2980.967
69.059	2418.060
69.279	2633.629
69.491	3048.090
69.726	2865.875
70.384	3578.880
72.210	3563.131
72.448	3314.620
73.334	4027.727
74.487	3696.757
76.080	3813.499
88.111	5509.545];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'ClayClay1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Lim = 0 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%eights.psd.k_J = 0; weights.psd.k = 1;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'I had to add 1 yr to age estimates to arrive at a natural fit for tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00398*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'mostly found at 180 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DY6K'; % Cat of Life
metaData.links.id_ITIS = '164732'; % ITIS
metaData.links.id_EoL = '46565100'; % Ency of Life
metaData.links.id_Wiki = 'Urophycis_tenuis'; % Wikipedia
metaData.links.id_ADW = 'Urophycis_tenuis'; % ADW
metaData.links.id_Taxo = '44363'; % Taxonomicon
metaData.links.id_WoRMS = '126504'; % WoRMS
metaData.links.id_fishbase = 'Urophycis-tenuis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urophycis_tenuis}}';
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
bibkey = 'ClayClay1991'; type = 'techreport'; bib = [ ... 
'author = {Clay, D. and H. Clay}, ' ... 
'year = {1991}, ' ...      
'title = {Determination of Age and Growth of White Hake (\emph{Urophycis tenuis} {M}itchill) from the Southern {G}ulf of {S}t. {L}aurence, {C}anada (including techniques for commercial sampling)}, ' ...
'institution = {Canadian Technical Report of Fisheries and Aquatic Sciences}, ' ...
'volume = {1828}, ' ...
'pages = {1-29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChanMors1999'; type = 'techreport'; bib = [ ... 
'author = {Sukwoo Chang and Wallace W. Morse and Peter L. Berrien,}, ' ... 
'year = {1999}, ' ...      
'title = {White Hake, \emph{Urophycis tenuis}, Life History and Habitat Characteristics}, ' ...
'institution = {NOAA Technical Memorandum NMFS-NE-136}, ' ...
'volume = {1828}, ' ...
'pages = {1-29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Urophycis-tenuis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
