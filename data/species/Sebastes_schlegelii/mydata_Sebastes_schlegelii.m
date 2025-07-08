function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_schlegelii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_schlegelii'; 
metaData.species_en = 'Korean rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 10 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 03];

%% set data
% zero-variate data

data.am = 20*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 65;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 3.1e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 780000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(12);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_X = [ ... % time since birth (yr), total length (cm)
0.992	11.691
0.992	12.397
0.992	16.194
1.000	13.192
1.000	13.898
1.000	14.870
1.000	15.400
1.983	23.823
1.983	26.030
1.992	22.852
1.992	24.353
1.992	25.148
2.000	16.936
2.000	21.086
2.000	21.616
2.000	22.057
2.008	20.557
2.992	25.624
2.992	26.331
3.000	27.038
3.008	27.656
3.008	28.362
3.008	29.510
4.000	31.046
4.000	31.488
4.008	29.369
4.008	32.459
4.017	30.429
4.017	34.844
4.042	36.081];
data.tL_X(:,1) = 365*data.tL_X(:,1); % convert yr 
for i=2:size(data.tL_X,1); if data.tL_X(i,1)<=data.tL_X(i-1,1); data.tL_X(i,1)=data.tL_X(i-1,1)+1e-3; end; end
units.tL_X  = {'d', 'cm'};  label.tL_X = {'time since birth', 'total length'};  
temp.tL_X   = C2K(12);  units.temp.tL_X = 'K'; label.temp.tL_X = 'temperature';
bibkey.tL_X = 'WangRen2023';
comment.tL_X = 'Data from XiXiakou, 5-16 m deep';
%
data.tL_C = [ ... % time since birth (yr), total length (cm)
0.976	9.816
0.976	10.862
0.987	11.443
0.987	15.047
0.998	12.140
0.998	12.721
0.998	14.349
0.998	15.977
1.020	13.534
1.974	22.420
1.974	23.002
1.974	25.560
1.985	19.396
1.985	19.978
1.985	21.955
1.996	20.791
1.996	26.024
1.996	27.070
1.996	27.651
2.007	28.697
2.971	29.909
2.971	30.607
2.971	30.955
2.982	32.931
2.993	28.512
2.993	32.582];
data.tL_C(:,1) = 365*data.tL_C(:,1); % convert yr 
for i=2:size(data.tL_C,1); if data.tL_C(i,1)<=data.tL_C(i-1,1); data.tL_C(i,1)=data.tL_C(i-1,1)+1e-3; end; end
units.tL_C  = {'d', 'cm'};  label.tL_C = {'time since birth', 'total length'};  
temp.tL_C   = C2K(12.7);  units.temp.tL_C = 'K'; label.temp.tL_C = 'temperature';
bibkey.tL_C = 'WangRen2023';
comment.tL_C = 'Data from Changdao, 20-25 m deep';
%
data.tL_Q = [ ... % time since birth (yr), total length (cm)
0.999	15.839
0.999	16.977
1.000	20.600
1.007	18.116
1.008	19.048
1.016	19.876
2.011	24.431
2.026	24.741
2.027	25.466
2.029	31.988
2.035	26.915
3.023	32.712
3.023	34.679
3.024	35.714
3.031	33.954
3.032	36.749
3.032	38.095];
data.tL_Q(:,1) = 365*data.tL_Q(:,1); % convert yr 
for i=2:size(data.tL_Q,1); if data.tL_Q(i,1)<=data.tL_Q(i-1,1); data.tL_Q(i,1)=data.tL_Q(i-1,1)+1e-3; end; end
units.tL_Q  = {'d', 'cm'};  label.tL_Q = {'time since birth', 'total length'};  
temp.tL_Q   = C2K(15.4);  units.temp.tL_Q = 'K'; label.temp.tL_Q = 'temperature';
bibkey.tL_Q = 'WangRen2023';
comment.tL_Q = 'Data from Qiansandao, 20-25 m deep';

% time-weight
data.tW_X = [ ... % time since birth (yr), wet weight (g)
0.995	30.787
1.003	46.898
1.003	57.636
1.003	68.374
1.003	100.589
1.021	80.908
1.990	177.899
1.990	260.226
1.990	269.175
1.990	279.913
1.990	285.282
1.998	136.739
1.998	163.585
1.998	190.431
1.998	211.907
1.998	231.594
1.998	247.701
1.998	306.762
1.998	355.084
2.007	117.056
2.015	149.273
2.959	289.208
2.976	253.420
2.976	421.653
2.985	382.282
2.985	403.759
2.985	427.025
2.993	316.066
2.993	355.440
3.002	244.481
3.002	273.116
3.002	298.172
3.002	303.541
3.002	323.228
3.010	339.339
3.988	676.154
3.997	380.855
4.005	411.283
4.005	443.498
4.005	456.026
4.014	371.913
4.014	488.244
4.014	502.561];
data.tW_X(:,1) = 365*data.tW_X(:,1); % convert yr 
for i=2:size(data.tW_X,1); if data.tW_X(i,1)<=data.tW_X(i-1,1); data.tW_X(i,1)=data.tW_X(i-1,1)+1e-3; end; end
units.tW_X  = {'d', 'g'};  label.tW_X = {'time since birth', 'wet weight'};  
temp.tW_X   = C2K(17);  units.temp.tW_X = 'K'; label.temp.tW_X = 'temperature';
bibkey.tW_X = 'WangRen2023';
comment.tW_X = 'Data from XiXiakou, 5-16 m deep';
%
data.tW_C = [ ... % time since birth (yr), wet weight (g)
0.937	74.348
0.948	56.786
0.948	83.101
0.959	27.527
0.992	106.415
1.937	256.805
1.958	189.516
1.959	230.451
1.960	300.625
1.960	332.788
1.969	142.714
1.969	163.182
1.969	171.953
1.979	113.456
1.980	209.945
2.946	290.122
2.947	395.383
2.958	366.125
2.959	471.386
2.971	535.693
2.971	553.236
2.971	579.552
2.980	345.619
2.981	459.652
2.981	503.511];
data.tW_C(:,1) = 365*data.tW_C(:,1); % convert yr 
for i=2:size(data.tW_C,1); if data.tW_C(i,1)<=data.tW_C(i-1,1); data.tW_C(i,1)=data.tW_C(i-1,1)+1e-3; end; end
units.tW_C  = {'d', 'g'};  label.tW_C = {'time since birth', 'wet weight'};  
temp.tW_C   = C2K(12.7);  units.temp.tW_C = 'K'; label.temp.tW_C = 'temperature';
bibkey.tW_C = 'WangRen2023';
comment.tW_C = 'Data from Changdao, 20-25 m deep';
%
data.tW_Q = [ ... % time since birth (yr), wet weight (g)
0.965	51.852
0.989	91.358
0.989	116.049
0.997	29.630
0.997	79.012
1.005	155.556
1.013	138.272
1.986	234.568
1.986	256.790
1.986	271.605
1.986	303.704
1.986	355.556
2.002	325.926
2.002	525.926
2.991	671.605
2.998	688.889
3.006	644.444
3.006	772.840
3.006	888.889
3.014	553.086
3.022	807.407];
data.tW_Q(:,1) = 365*data.tW_Q(:,1); % convert yr 
for i=2:size(data.tW_Q,1); if data.tW_Q(i,1)<=data.tW_Q(i-1,1); data.tW_Q(i,1)=data.tW_Q(i-1,1)+1e-3; end; end
units.tW_Q  = {'d', 'g'};  label.tW_Q = {'time since birth', 'wet weight'};  
temp.tW_Q   = C2K(15.4);  units.temp.tW_Q = 'K'; label.temp.tW_Q = 'temperature';
bibkey.tW_Q = 'WangRen2023';
comment.tW_Q = 'Data from Qiansandao, 20-25 m deep';

% length - weight
data.LW_C = [ ... % total length (cm), wet weight (g)
4.056	5.464
5.278	3.102
5.944	5.464
6.444	2.901
6.611	10.929
6.944	14.572
7.111	7.286
7.333	1.821
7.778	7.286
8.111	10.929
8.222	12.750
8.500	7.286
8.778	18.215
9.000	13.643
9.222	18.215
9.722	20.036
9.833	12.750
10.056	30.965
10.444	20.036
10.944	5.464
11.111	23.679
11.222	43.716
11.444	32.787
11.833	20.036
12.167	20.036
12.333	27.322
12.444	40.073
12.667	63.752
12.778	25.501
13.111	40.073
13.222	20.036
13.278	60.109
13.556	29.144
13.722	58.288
13.944	45.537
14.111	32.787
14.556	51.002
14.611	65.574
14.833	32.787
15.056	40.073
15.278	49.180
15.333	78.324
15.611	60.109
15.833	32.787
16.000	69.217
16.167	60.109
16.667	91.075
17.000	83.789
17.056	112.933
17.056	69.217
17.167	49.180
17.278	122.040
17.444	91.075
17.667	38.251
17.944	132.969
17.944	109.290
18.056	56.466
18.278	94.718
18.444	127.505
18.722	154.827
18.722	83.789
18.778	105.647
19.167	112.933
19.333	149.362
19.333	111.111
19.500	125.683
19.556	98.361
19.889	111.111
19.944	147.541
20.278	167.577
20.333	105.647
20.444	143.898
20.611	127.505
20.833	187.614
21.056	153.005
21.111	216.758
21.222	111.111
21.278	213.115
21.278	167.577
21.333	100.182
21.389	142.077
21.556	182.149
21.611	156.648
21.722	145.719
21.833	202.186
21.889	129.326
21.944	154.827
21.944	180.328
22.167	244.080
22.167	140.255
22.167	171.220
22.222	182.149
22.222	131.148
22.278	160.291
22.389	216.758
22.500	167.577
22.556	204.007
22.722	225.865
22.722	151.184
22.722	182.149
22.944	209.472
22.944	171.220
23.111	262.295
23.222	194.900
23.444	236.794
23.500	222.222
23.500	174.863
23.556	207.650
23.611	251.366
23.611	160.291
23.778	189.435
23.833	247.723
23.889	142.077
24.167	304.189
24.222	204.007
24.222	205.829
24.278	224.044
24.389	280.510
24.500	267.760
24.500	242.259
24.500	182.149
24.556	333.333
24.833	251.366
24.944	282.332
24.944	218.579
25.000	200.364
25.056	329.690
25.278	273.224
25.278	213.115
25.333	304.189
25.333	240.437
25.556	262.295
25.667	231.330
25.667	218.579
25.667	247.723
25.722	273.224
25.833	302.368
25.889	291.439
25.944	331.512
26.056	251.366
26.278	307.832
26.333	273.224
26.444	373.406
26.444	234.973
26.500	253.188
26.556	291.439
26.611	336.976
26.611	247.723
26.667	214.936
26.722	304.189
26.833	393.443
26.944	275.046
27.222	329.690
27.222	367.942
27.389	311.475
27.722	302.368
27.778	324.226
27.778	344.262
28.000	285.974
28.222	253.188
28.333	360.656
28.333	347.905
28.389	402.550
28.389	280.510
28.556	269.581
28.611	378.871
28.667	316.940
28.722	353.370
28.778	413.479
28.778	438.980
28.778	335.155
28.944	367.942
29.056	384.335
29.111	307.832
29.167	338.798
29.389	415.301
29.500	384.335
29.556	347.905
29.833	526.412
30.000	364.299
30.111	533.698
30.111	442.623
30.167	393.443
30.278	329.690
30.556	557.377
30.556	528.233
30.667	457.195
30.722	417.122
30.778	491.803
30.778	464.481
31.000	360.656
31.222	588.342
31.222	371.585
31.444	517.304
31.444	479.053
31.722	524.590
31.722	464.481
31.722	437.158
31.833	477.231
32.167	497.268
32.667	551.913
32.944	582.878
33.833	659.381
33.833	648.452
34.278	688.525
34.667	670.310
35.556	766.849
36.000	673.953
36.556	810.565];
units.LW_C  = {'cm', 'g'};  label.LW_C = {'total length','wet weight'};  
bibkey.LW_C = 'WangRen2023';
comment.LW_C = 'Data from Changdao';

% weight-fecundity
data.WN_C = [ ... % weight (g), fecundity (#)
461.538	22501.351
554.945	64880.362
568.681	69262.908
574.176	35622.873
576.923	45128.267
579.670	54633.661
587.912	32692.805
612.637	45846.471
626.374	69241.814
637.363	44374.907
640.110	37061.289
670.330	72150.788
673.077	35586.712
684.066	68489.458
684.066	39970.263
706.044	43618.534
708.791	86030.692
730.769	68472.382
730.769	45803.278
730.769	22402.912
733.516	72858.946
739.011	88213.427
747.253	97716.812
758.242	61880.985
758.242	67731.076
760.989	56029.889
780.220	52366.550
793.956	83074.508
799.451	122560.616
802.198	77952.664
810.440	83068.481
824.176	115238.961
829.670	69167.482
835.165	66240.428
851.648	91828.551
854.396	77202.318
879.121	115950.133
890.110	80114.305
895.604	58905.715
906.593	182484.878
906.593	99121.075
909.341	114476.561
912.088	180289.085
912.088	55243.381
928.571	74250.151
947.802	111537.452
953.297	88135.078
964.286	117381.517
986.264	104210.775
986.264	95435.638
989.011	46440.118
991.758	162709.680
991.758	118102.734
1000.000	102011.969
1002.747	215356.485
1008.242	142959.595
1010.989	93232.814
1019.231	118823.950
1024.725	222661.064
1024.725	109315.543
1032.967	74211.981
1035.714	95417.558
1038.462	82253.847
1043.956	117352.387
1057.692	158298.004
1065.934	267252.943
1068.681	137087.405
1074.176	197048.833
1090.659	98322.514
1090.659	109291.435
1129.121	180209.731
1129.121	93920.882
1131.868	175821.158
1142.857	256255.897
1148.352	161921.164
1156.593	153143.013
1162.088	134128.207
1173.077	101948.686
1181.319	180921.907
1186.813	99018.618
1192.308	197005.640
1192.308	158248.785
1200.549	87313.413
1217.033	188221.463
1219.780	88768.905
1225.275	207962.508
1230.769	186022.656
1233.516	245253.827
1244.505	128247.981
1250.000	188940.671
1258.242	205756.670
1296.703	171373.320
1324.176	97505.871
1329.670	259112.638
1343.407	184518.950
1346.154	264225.441
1412.088	176449.962
1420.330	183759.563
1447.802	179361.950
1513.736	217363.436
1593.407	206365.385
1697.802	273603.266
1722.527	305769.728
1760.989	230435.739
1769.231	144875.138];
units.WN_C  = {'g', '#'};  label.WN_C = {'wet weight','yearly fecundity'};  
temp.WN_C   = C2K(12.7);  units.temp.WN_C = 'K'; label.temp.WN_C = 'temperature';
bibkey.WN_C = 'WangRen2023';
comment.WN_C = 'Data from Changdao, 20-25 m deep';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Q','tL_C','tL_X'}; subtitle1 = {'Data from Qiansandao, Changdao, XiXiakou'};
set2 = {'tW_Q','tW_C','tW_X'}; subtitle2 = {'Data from Qiansandao, Changdao, XiXiakou'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperature is assumed to vary as T(t)=T_m+T_a*sin(2*pi*t/365)';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4W7PW'; % Cat of Life
metaData.links.id_ITIS = '644596'; % ITIS
metaData.links.id_EoL = '46568192'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_schlegelii'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_schlegelii'; % ADW
metaData.links.id_Taxo = '578454'; % Taxonomicon
metaData.links.id_WoRMS = '274849'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-schlegelii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_schlegelii}}';
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
bibkey = 'WangRen2023'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.ocecoaman.2023.106852}, '...
'author = {Xinmeng Wang and Jeffrey Ren and Yi Zhong and Wenguang Wu and Yi Liu and Yiqian Jiang and Jihong Zhang}, ' ... 
'year = {2023}, ' ...
'title = {A dynamic energy budget model for black rockfish \emph{Sebastes schlegelii}: {P}arameterization and application in marine ranching areas, {Y}ellow {S}ea, {C}hina}, ' ...
'journal = {Ocean and Coastel Management}, ' ...
'volume = {245}, ' ...
'pages = {106852}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-schlegelii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
