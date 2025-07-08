function [data, auxData, metaData, txtData, weights] = mydata_Canis_familiaris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Canis_familiaris'; 
metaData.species_en = 'Dog';

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'T'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 10 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 10 29]; 

%% set data
% zero-variate data

data.tg = 63;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'Wiki';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '58-68 d';
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tpE = 14.7*30.5;    units.tpE = 'd';    label.tpE = 'time since birth at puberty for E'; bibkey.tpE = 'HawtBool2004';
  temp.tpE = C2K(38);  units.temp.tpE = 'K'; label.temp.tpE = 'temperature';
  comment.tpE = 'Data for English Mastiff; based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 65 kg in mnth';
data.tpSB = 14.3*30.5;    units.tpSB = 'd';    label.tpSB = 'time since birth at puberty for SB'; bibkey.tpSB = 'HawtBool2004';
  temp.tpSB = C2K(38);  units.temp.tpSB = 'K'; label.temp.tpSB = 'temperature';
  comment.tpSB = 'Data for St. Bernard; based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 68 in mnth';
data.tpI = 13.6*30.5;    units.tpI = 'd';    label.tpI = 'time since birth at puberty for I'; bibkey.tpI = 'HawtBool2004';
  temp.tpI = C2K(38);  units.temp.tpI = 'K'; label.temp.tpI = 'temperature';
  comment.tpI = 'Data for Irish Wolfhound;  based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 53 kg in mnth';
data.tpG = 13.5*30.5;    units.tpG = 'd';    label.tpG = 'time since birth at puberty for G'; bibkey.tpG = 'HawtBool2004';
  temp.tpG = C2K(38);  units.temp.tpG = 'K'; label.temp.tpG = 'temperature';
  comment.tpG = 'Data for Great Dane;  based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 52 kg in mnth';
data.tpN = 12.8*30.5;    units.tpN = 'd';    label.tpN = 'time since birth at puberty for N'; bibkey.tpN = 'HawtBool2004';
  temp.tpN = C2K(38);  units.temp.tpN = 'K'; label.temp.tpN = 'temperature';
  comment.tpN = 'Data for Newfoundland;  based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 44 kg in mnth';
data.tpL = 11.3*30.5;    units.tpL = 'd';    label.tpL = 'time since birth at puberty for L'; bibkey.tpL = 'HawtBool2004';
  temp.tpL = C2K(38);  units.temp.tpL = 'K'; label.temp.tpL = 'temperature';
  comment.tpL = 'Data for Labrador Retriever; based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 28 kg in mnth';
data.tpB = 10.3*30.5;    units.tpB = 'd';    label.tpB = 'time since birth at puberty for B'; bibkey.tpB = 'HawtBool2004';
  temp.tpB = C2K(38);  units.temp.tpB = 'K'; label.temp.tpB = 'temperature';
  comment.tpB = 'Data for Beagle; based on ((68-Wi)*9 + (Wi-2.5)*15)/(6.8-2.5) for Wi = 17 kg in mnth';
data.tpS = 10*30.5;    units.tpS = 'd';    label.tpS = 'time since birth at puberty for S'; bibkey.tpS = 'HawtBool2004';
  temp.tpS = C2K(38);  units.temp.tpS = 'K'; label.temp.tpS = 'temperature';
  comment.tpS = 'Data for English Springer Spaniel; based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 15 kg in mnth';
data.tpCS = 9.8*30.5;    units.tpCS = 'd';    label.tpCS = 'time since birth at puberty for CS'; bibkey.tpCS = 'HawtBool2004';
  temp.tpCS = C2K(38);  units.temp.tpCS = 'K'; label.temp.tpCS = 'temperature';
  comment.tpCS = 'Data for Cocker Spaniel; based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 11 kg in mnth';
data.tpM = 9.4*30.5;    units.tpM = 'd';    label.tpM = 'time since birth at puberty for M'; bibkey.tpM = 'HawtBool2004';
  temp.tpM = C2K(38);  units.temp.tpM = 'K'; label.temp.tpM = 'temperature';
  comment.tpM = 'Data for Miniature Schnauzer; based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 7 kg in mnth';
data.tpCT = 9.3*30.5;    units.tpCT = 'd';    label.tpCT = 'time since birth at puberty for CT'; bibkey.tpCT = 'HawtBool2004';
  temp.tpCT = C2K(38);  units.temp.tpCT = 'K'; label.temp.tpCT = 'temperature';
  comment.tpCT = 'Data for Cain Terrier; based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 6.4 in mnth';
data.tpP = 9*30.5;    units.tpP = 'd';    label.tpP = 'time since birth at puberty for P'; bibkey.tpP = 'HawtBool2004';
  temp.tpP = C2K(38);  units.temp.tpP = 'K'; label.temp.tpP = 'temperature';
  comment.tpP = 'Data for Papillon; based on ((68-Wi)*9 + (Wi-2.5)*15)/(68-2.5) for Wi = 2.5 kg in mnth';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '10-13 yr; large breeds shorter';
  
data.Wwb = 450;      units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'AnAge';
data.WwiE = 65.8e3;  units.WwiE = 'g';   label.WwiE = 'ultimate wet weight of race E';     bibkey.WwiE = 'HawtBool2004';
data.WwiSB = 68.0e3; units.WwiSB = 'g';  label.WwiSB = 'ultimate wet weight of race SB';   bibkey.WwiSB = 'HawtBool2004';
data.WwiI = 52.5e3;  units.WwiI = 'g';   label.WwiI = 'ultimate wet weight of race I';     bibkey.WwiI = 'HawtBool2004';
data.WwiG = 51.8e3;  units.WwiG = 'g';   label.WwiG = 'ultimate wet weight of race G';     bibkey.WwiG = 'HawtBool2004';
data.WwiN = 43.6e3;  units.WwiN = 'g';   label.WwiN = 'ultimate wet weight of race N';     bibkey.WwiN = 'HawtBool2004';
data.WwiL = 28.5e3;  units.WwiL = 'g';   label.WwiL = 'ultimate wet weight of race L';     bibkey.WwiL = 'HawtBool2004';
data.WwiB = 17.3e3;  units.WwiB = 'g';   label.WwiB = 'ultimate wet weight of race B';     bibkey.WwiB = 'HawtBool2004';
data.WwiS = 14.7e3;  units.WwiS = 'g';   label.WwiS = 'ultimate wet weight of race S';     bibkey.WwiS = 'HawtBool2004';
data.WwiCS = 10.6e3; units.WwiCS = 'g';  label.WwiCS = 'ultimate wet weight of race CS';   bibkey.WwiCS = 'HawtBool2004';
data.WwiM = 7.0e3;   units.WwiM = 'g';   label.WwiM = 'ultimate wet weight of race M';     bibkey.WwiM = 'HawtBool2004';
data.WwiCT = 6.1e3;  units.WwiCT = 'g';  label.WwiCT = 'ultimate wet weight of race CT';   bibkey.WwiCT = 'HawtBool2004';
data.WwiP = 2.4e3;   units.WwiP = 'g';   label.WwiP = 'ultimate wet weight of race P';     bibkey.WwiP = 'HawtBool2004';
  
data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 pups per litter, 1 litters per yr';
  
% uni-variate data

% time-weight
data.tWw_E = [ % time since birth (d), wet weight (g)
74.593	11441.938
81.799	13399.310
89.005	15459.530
94.666	16593.419
101.872	18242.246
110.107	19171.602
122.975	20822.989
131.210	22472.282
137.387	24017.796
144.078	26077.783
151.284	28755.092
157.460	31946.176
162.608	34211.161
165.181	35446.502
172.902	39358.220
179.593	41006.815
186.284	43478.195
193.490	45641.263
199.666	47083.929
205.843	49246.532
214.078	50690.128
220.255	52235.642
227.975	53370.462
235.696	54402.433
243.416	54200.227
248.563	54305.402
255.769	55439.989
262.975	55957.487
270.181	56783.530
277.387	57095.332
283.563	57715.213
290.255	58541.023
297.460	59572.761
304.666	59987.411
312.387	60402.294
318.563	60816.479
325.769	62053.914
332.975	61645.779
340.696	61854.966
347.387	62372.231
352.019	62682.870
359.740	63303.449
366.431	64129.258
374.152	64852.686
382.387	65164.953
388.563	65373.441
396.284	65171.235
402.975	65174.260
410.181	66103.151
417.387	66106.409
424.593	66623.907
431.284	67038.324
436.946	66526.643
446.210	66016.591
452.387	65607.991
458.049	65610.550
464.740	65716.423
471.431	65822.296
479.152	65825.787
486.872	65417.884
493.563	65626.606
499.740	65835.094
506.946	64398.478
513.637	65018.592
519.299	65638.240
527.019	65538.882
536.284	65131.678]; 
units.tWw_E  = {'d', 'g'};  label.tWw_E = {'time since birth', 'total weight', 'English Mastiff'};  
temp.tWw_E  = C2K(38.3);  units.temp.tWw_E = 'K'; label.temp.tWw_E = 'temperature';
bibkey.tWw_E = 'HawtBool2004';
comment.tWw_E = 'Data for English Mastiff';
%
data.tWw_SB = [ % time since birth (d), wet weight (g)
68.416	7942.310
74.593	10002.064
80.769	11958.971
87.460	14224.654
95.696	15976.795
101.357	17522.077
108.563	19890.841
115.255	21436.587
122.460	23805.352
129.152	25659.643
137.387	28028.872
144.593	29883.396
150.255	31737.222
157.975	33386.282
164.152	35240.340
172.387	37301.025
178.563	38846.539
185.255	40906.527
194.519	41836.348
199.152	43895.405
205.843	45235.455
213.563	47193.060
219.740	48327.181
226.431	49564.383
233.122	50390.193
240.328	52450.413
248.049	53173.840
254.740	53588.258
262.975	54620.462
269.152	55034.646
275.843	56477.545
283.563	57200.972
289.740	57923.701
296.946	58646.896
303.637	59575.554
311.872	59579.277
320.108	59685.848
326.284	60100.032
330.916	61542.000
338.637	61134.098
346.358	61651.829
353.049	62580.487
359.740	63509.145
365.916	64129.026
374.666	63618.741
380.843	64135.774
387.019	65064.199
395.255	64039.441
401.946	64865.251
407.608	65999.139
415.843	65797.166
423.563	66314.897
429.740	66626.234
436.431	67760.588
444.152	67146.989
452.387	66122.231
458.049	66639.031
464.740	67259.145
470.916	68598.963
478.122	68293.676
486.358	67886.007
493.563	69123.442
499.740	69126.234
507.461	67895.547
514.152	67590.027
520.328	67489.971
534.740	67187.942
541.946	68322.529
548.637	68634.098
555.328	68328.579
563.563	68332.302]; 
units.tWw_SB  = {'d', 'g'};  label.tWw_SB = {'time since birth', 'total weight', 'St. Bernard'};  
temp.tWw_SB  = C2K(38.3);  units.temp.tWw_SB = 'K'; label.temp.tWw_SB = 'temperature';
bibkey.tWw_SB = 'HawtBool2004';
comment.tWw_SB = 'Data for St. Bernard';
%
data.tWw_I = [ % time since birth (d), wet weight (g)
73.563	10207.295
81.799	11753.740
90.034	12785.944
96.210	14434.306
102.387	16391.213
108.563	18759.512
111.652	20406.477
117.828	21643.447
122.460	22982.567
128.637	24630.929
133.269	26587.137
136.358	28234.103
143.563	29368.690
150.769	31531.758
157.460	32871.809
163.637	34828.715
172.387	36478.241
180.622	37716.141
187.828	39056.424
194.005	39882.001
199.152	40604.265
202.240	41839.838
207.387	43487.735
214.078	43387.912
221.284	44316.803
227.975	45039.764
234.152	45453.949
242.387	46280.457
249.593	46900.803
254.225	48445.619
263.490	49375.441
269.152	49686.544
277.387	50101.660
283.563	50824.389
291.799	50930.960
298.490	50933.985
304.666	52068.106
312.387	52482.989
319.593	52897.639
325.255	53003.047
332.460	53006.305
341.210	52393.172
347.387	52498.812
353.049	52604.220
361.799	52196.783
369.005	52611.433
375.696	53334.395
381.358	52411.321
389.078	52517.660
397.313	52624.231
403.490	52832.719
410.696	52938.825
416.872	52530.225
423.563	52533.250
430.255	52330.578
437.975	52231.220
445.696	51823.318
451.358	51928.726
458.049	51623.207
463.196	52139.774
471.431	52760.586
481.211	52867.855
486.872	52664.718
493.563	52667.743
501.284	52671.233
507.975	52365.714
520.843	52371.531
528.049	52991.877
536.799	52892.985
543.490	52690.314]; 
units.tWw_I  = {'d', 'g'};  label.tWw_I = {'time since birth', 'total weight', 'Irish Wolfhound'};  
temp.tWw_I  = C2K(38.3);  units.temp.tWw_I = 'K'; label.temp.tWw_I = 'temperature';
bibkey.tWw_I = 'HawtBool2004';
comment.tWw_I = 'Data for Irish Wolfhound';
%
data.tWw_G = [ % time since birth (d), wet weight (g)
59.152	7629.577
66.872	9278.637
74.593	10927.697
81.284	13193.381
87.460	14841.743
95.181	16696.499
102.902	18345.559
108.563	19993.689
114.740	21847.747
122.975	23805.584
132.755	25661.272
136.872	28234.336
143.563	29471.538
150.255	31120.133
157.975	33386.282
166.725	34830.111
172.387	35655.456
179.078	36584.114
186.799	38541.718
192.975	39367.295
199.666	40501.649
206.358	41430.307
214.078	42153.735
222.313	43083.091
228.490	43497.275
234.152	43911.227
242.387	44943.431
248.563	45563.312
254.740	45668.953
262.460	47009.469
269.666	47012.726
276.358	47838.536
284.078	47739.178
289.740	48050.282
296.946	48362.084
304.152	48879.582
310.328	49293.767
317.019	49708.184
325.769	50534.925
332.975	50538.183
339.152	50129.582
347.387	49824.761
353.049	50033.017
361.284	50036.740
367.460	50245.228
374.666	50968.423
381.358	50971.448
388.563	50563.313
396.284	50361.107
402.975	50569.828
409.152	50572.620
415.843	50884.189
422.534	50784.366
430.255	51713.490
437.460	51511.051
445.181	51308.845
451.358	51003.093
457.534	51622.974
464.740	51934.776
472.461	51321.177
478.637	51426.818
485.328	51944.083
493.563	51947.806
499.740	52156.295
506.946	52365.249
513.637	52676.818
520.843	52371.531
528.563	51860.781
535.255	51863.806]; 
units.tWw_G  = {'d', 'g'};  label.tWw_G = {'time since birth', 'total weight', 'Great Dane'};  
temp.tWw_G  = C2K(38.3);  units.temp.tWw_G = 'K'; label.temp.tWw_G = 'temperature';
bibkey.tWw_G = 'HawtBool2004';
comment.tWw_G = 'Data for Great Dane';
% 
data.tWw_N = [ % time since birth (d), wet weight (g)
3.049	404.846
11.284	922.810
17.460	1131.298
25.181	1751.877
31.357	2371.758
38.563	3403.497
46.799	4538.549
53.490	5775.751
59.666	6601.329
67.387	6090.578
73.563	7430.396
80.769	9182.072
87.975	11242.292
95.696	12582.807
101.872	14231.169
108.563	16394.005
116.284	18351.609
122.975	20205.900
129.152	21854.262
137.387	23503.555
143.049	24843.140
149.740	26491.735
157.460	27935.099
164.666	29069.686
171.872	30409.969
178.049	31235.546
185.255	33501.462
192.460	34430.353
199.666	35256.396
205.328	37110.221
213.563	37936.729
221.284	38557.308
227.975	38457.485
234.152	38563.125
241.872	39080.856
247.534	39803.353
255.255	40218.235
261.431	40735.268
268.637	40738.526
274.813	41461.255
283.049	42287.763
289.740	42702.180
296.946	43116.830
304.152	43428.632
311.358	43431.890
317.534	43228.986
324.740	44363.573
331.946	44778.223
339.152	44884.328
346.358	44681.890
352.534	44376.138
360.255	44379.628
367.975	43560.333
380.328	43565.918
394.740	43366.737
408.122	43475.635
422.534	43482.150
436.946	42665.880
450.328	43186.171
465.769	42884.607
479.152	42890.657
493.563	42382.932
507.975	43109.384
520.328	43526.360
534.740	43635.724
549.152	43539.391
563.049	43957.066]; 
units.tWw_N  = {'d', 'g'};  label.tWw_N = {'time since birth', 'total weight', 'Newfoundland'};  
temp.tWw_N  = C2K(38.3);  units.temp.tWw_N = 'K'; label.temp.tWw_N = 'temperature';
bibkey.tWw_N = 'HawtBool2004';
comment.tWw_N = 'Data for Newfoundland';
%
data.tWw_L = [ % time since birth (d), wet weight (g)
4.078	508.160
13.857	821.125
20.549	1338.391
29.299	2267.979
41.137	3096.116
49.372	3511.231
57.093	4748.899
63.784	5574.709
72.534	6401.450
80.255	7330.573
86.431	8464.694
94.666	9291.202
102.902	10014.862
111.137	11149.914
117.313	12386.884
123.490	13006.765
130.181	14141.119
137.902	15275.939
144.078	16307.212
153.858	17545.811
163.637	18475.865
171.872	19610.917
181.137	20232.194
189.887	20956.086
197.608	21679.514
204.813	22299.860
212.534	22920.439
220.769	23027.010
227.975	24058.749
240.843	24167.414
254.225	25201.945
261.431	25410.899
269.152	25928.630
277.387	25829.505
283.049	26243.457
290.255	26246.714
300.034	26868.224
310.843	27078.807
323.196	27084.391
333.490	27294.741
345.328	27917.182
359.740	27100.912
366.946	27515.562
377.240	27520.216
386.505	27421.556
398.343	27426.908
409.666	27534.875
419.960	27950.921
431.799	27647.729
443.122	28269.936
452.902	28171.509
465.255	28177.094
473.490	28695.057
485.843	28803.490
496.137	29219.536
510.034	29225.819
520.843	29642.098
531.137	29338.207
539.372	29547.626
547.608	28934.260
554.299	29348.678
559.961	29556.934]; 
units.tWw_L  = {'d', 'g'};  label.tWw_L = {'time since birth', 'total weight', 'Labrador Retriever'};  
temp.tWw_L  = C2K(38.3);  units.temp.tWw_L = 'K'; label.temp.tWw_L = 'temperature';
bibkey.tWw_L = 'HawtBool2004';
comment.tWw_L = 'Data for Labrador Retriever';
%
data.tWw_B = [ % time since birth (d), wet weight (g)
61.725	4133.905
68.416	4856.866
74.593	5579.595
81.799	6097.094
86.431	6716.276
94.152	7645.400
100.328	8470.977
109.593	8886.558
116.284	9712.368
122.460	10229.400
129.666	10746.899
135.328	11572.243
142.019	12398.053
149.740	12915.784
157.975	13433.747
164.666	13951.013
169.813	14261.884
176.505	14881.998
184.740	15194.265
192.975	15712.229
200.181	16126.879
206.358	16232.519
213.563	16338.625
220.769	16650.427
226.946	16858.915
234.152	17170.717
240.328	17379.206
248.563	17382.929
254.740	17385.721
262.975	17183.748
269.152	17597.932
275.843	17806.654
283.563	17295.903
290.255	17401.776
297.460	17096.490
303.122	17099.049
310.843	17102.539
318.563	17414.574
325.255	17520.447
331.946	17317.776
338.122	17320.568
345.843	17221.210
353.049	17121.620
360.769	17330.806
367.460	17230.983]; 
units.tWw_B  = {'d', 'g'};  label.tWw_B = {'time since birth', 'total weight', 'Beagle'};  
temp.tWw_B  = C2K(38.3);  units.temp.tWw_B = 'K'; label.temp.tWw_B = 'temperature';
bibkey.tWw_B = 'HawtBool2004';
comment.tWw_B = 'Data for Beagle';
%
data.tWw_S = [ % time since birth (d), wet weight (g)
56.063	3308.560
60.696	4339.135
68.931	4754.251
75.107	5065.587
81.799	5480.005
87.975	6202.734
94.666	7028.544
102.387	7546.275
109.593	8063.773
117.828	8890.281
125.034	9613.475
131.210	10130.508
138.931	10648.239
144.593	11267.887
150.255	11681.839
158.490	11788.410
166.210	11894.749
171.872	12205.853
179.078	12620.503
187.313	13138.466
195.034	12833.412
201.210	13350.445
208.931	13662.480
215.622	13871.201
221.799	14079.689
227.975	14288.178
235.181	14599.980
241.872	14705.853
249.593	14606.495
256.284	14712.368
263.490	14715.626
270.696	14616.035
277.387	14927.604
285.622	15137.024
289.740	15036.037
296.946	14936.446
304.666	14939.937
309.813	14942.264
318.563	14946.219
325.255	14949.244
332.460	14952.502
339.152	15058.375
345.843	15164.248
353.049	15167.506
360.255	15170.763
367.460	15174.021]; 
units.tWw_S  = {'d', 'g'};  label.tWw_S = {'time since birth', 'total weight', 'English Springer Spaniel'};  
temp.tWw_S  = C2K(38.3);  units.temp.tWw_S = 'K'; label.temp.tWw_S = 'temperature';
bibkey.tWw_S = 'HawtBool2004';
comment.tWw_S = 'Data for English Springer Spaniel';
%
data.tWw_CS = [ % time since birth (d), wet weight (g)
17.460	617.058
25.181	620.548
31.872	726.421
37.019	1037.292
45.769	1246.944
52.460	1661.361
59.666	2384.556
66.872	2696.358
73.563	2905.079
78.710	2907.406
86.431	3836.529
93.122	4353.795
100.843	4357.285
108.049	4669.087
115.255	5289.433
122.460	5395.539
129.666	5810.189
136.872	6327.687
142.019	6432.862
150.255	6847.978
156.431	7159.314
162.608	7264.955
170.843	7268.678
178.049	7991.872
185.769	8406.755
192.975	8512.861
199.666	8927.278
205.328	8929.838
212.534	9138.791
220.255	9553.674
226.431	9556.466
233.122	9353.795
240.843	9357.285
248.563	9772.168
254.740	9980.657
260.916	9880.601
267.608	9883.626
275.328	10195.660
282.019	9787.293
290.255	10202.408
299.519	10206.597
308.784	10210.785
315.990	10625.435
326.284	10218.696
333.490	10839.043
342.755	11151.775
349.960	10743.640
359.740	10850.910
366.431	10956.783]; 
units.tWw_CS  = {'d', 'g'};  label.tWw_CS = {'time since birth', 'total weight', 'Cocker Spaniel'};  
temp.tWw_CS  = C2K(38.3);  units.temp.tWw_CS = 'K'; label.temp.tWw_CS = 'temperature';
bibkey.tWw_CS = 'HawtBool2004';
comment.tWw_CS = 'Data for Cocker Spaniel';
% 
data.tWw_M = [ % time since birth (d), wet weight (g)
40.107	1038.688
47.313	1453.338
54.005	2073.452
60.181	2384.789
65.843	2695.892
73.563	2596.535
81.799	2805.954
87.975	2911.594
93.637	3428.394
99.813	3636.883
108.563	4052.231
116.799	4055.954
122.975	4367.291
129.666	4678.860
138.931	4888.744
144.078	4891.071
150.769	5305.489
156.431	5513.744
163.637	5619.850
170.328	5828.571
178.049	5934.910
185.255	6041.015
192.975	6455.898
199.152	6458.690
207.387	6565.262
213.049	6773.517
220.769	6674.160
226.431	6882.415
234.152	6885.906
240.843	6888.931
248.049	6892.188
255.255	6792.598
261.431	7309.631
269.152	7313.121
274.813	7418.528
283.563	7011.092
289.225	6910.803
297.975	6914.759
303.637	7123.015
310.843	7331.968
317.019	7540.457
324.740	7338.251
332.975	6930.581
339.152	7241.918
345.843	7244.943
353.049	7351.049
359.225	7250.993
366.431	7254.250]; 
units.tWw_M  = {'d', 'g'};  label.tWw_M = {'time since birth', 'total weight', 'Miniature Schnauzer'};  
temp.tWw_M  = C2K(38.3);  units.temp.tWw_M = 'K'; label.temp.tWw_M = 'temperature';
bibkey.tWw_M = 'HawtBool2004';
comment.tWw_M = 'Data for Miniature Schnauzer';
%
data.tWw_CT = [ % time since birth (d), wet weight (g)
35.475	625.202
41.652	833.690
46.284	835.784
51.431	1249.504
58.122	1458.225
65.843	1770.259
72.019	2184.444
80.255	2291.015
88.490	2294.738
94.666	2503.227
100.843	2711.715
107.534	2817.588
115.255	2923.927
121.431	3440.959
129.666	3547.531
136.872	3859.333
142.534	4067.588
149.225	4482.006
156.946	4794.040
165.181	4797.763
170.843	5006.019
179.078	5215.438
184.225	5217.765
191.431	5529.567
200.181	5636.371
206.358	5639.163
213.049	5642.188
220.255	5645.446
227.975	6060.328
234.152	6063.121
241.358	6169.226
247.534	6172.019
255.255	6175.509]; 
units.tWw_CT  = {'d', 'g'};  label.tWw_CT = {'time since birth', 'total weight', 'Cain Terrier'};  
temp.tWw_CT  = C2K(38.3);  units.temp.tWw_CT = 'K'; label.temp.tWw_CT = 'temperature';
bibkey.tWw_CT = 'HawtBool2004';
comment.tWw_CT = 'Data for Cain Terrier';
%
data.tWw_P = [ % time since birth (d), wet weight (g)
59.666	1356.075
67.902	1051.253
74.078	1259.742
81.799	1366.080
89.005	1369.338
94.666	1474.746
102.902	1478.469
110.107	1481.726
115.769	1484.286
122.460	1693.007
129.666	1901.961
137.387	2008.299
144.078	1908.476
151.284	1911.734
157.975	1811.910
166.210	1918.481
173.931	2127.668
180.108	2130.460
185.769	2133.020
193.490	2033.662
199.666	2139.302
207.902	2348.722
216.137	2352.445
221.799	2252.156
228.490	2358.029
236.210	2361.519
242.902	2261.696
249.078	2367.336
255.769	2267.513
262.975	2373.619
270.696	2479.957
277.902	2380.367
284.078	2383.159
291.284	2386.417
297.975	2492.290
305.181	2289.851
310.843	2395.259
319.078	2398.982
326.284	2299.391
333.490	2508.345
339.666	2408.289
347.902	2412.012
354.078	2311.956
359.225	2417.131]; 
units.tWw_P  = {'d', 'g'};  label.tWw_P = {'time since birth', 'total weight', 'Papillon'};  
temp.tWw_P  = C2K(38.3);  units.temp.tWw_P = 'K'; label.temp.tWw_P = 'temperature';
bibkey.tWw_P = 'HawtBool2004';
comment.tWw_P = 'Data for Papillon';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_E = 10 * weights.tWw_E;
weights.tWw_SB = 10 * weights.tWw_SB;
weights.tWw_I = 10 * weights.tWw_I;
weights.tWw_G = 10 * weights.tWw_G;
weights.tWw_N = 10 * weights.tWw_N;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; weights.psd.t_0 = 1; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_E','tWw_SB', 'tWw_I', 'tWw_G', 'tWw_N', 'tWw_L', 'tWw_B', 'tWw_S', 'tWw_CS', 'tWw_M', 'tWw_CT', 'tWw_P'}; 
subtitle1 = {'Data for races E, SB, I, G, N, L, B, S, CS, M, CT, P'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'The various races are assumend to differ from by {p_Am}, [p_M] and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5G6ZJ'; % Cat of Life
metaData.links.id_ITIS = '726821'; % ITIS
metaData.links.id_EoL = '328607'; % Ency of Life
metaData.links.id_Wiki = 'Canis_lupus_familiaris'; % Wikipedia
metaData.links.id_ADW = 'Canis_lupus_familiaris'; % ADW
metaData.links.id_Taxo = '66410'; % Taxonomicon
metaData.links.id_WoRMS = '1461482'; % WoRMS
metaData.links.id_MSW3 = '14000738'; % MSW3
metaData.links.id_AnAge = 'Canis_lupus_familiaris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Canis_lupus_familiaris}}';
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
bibkey = 'HawtBool2004'; type = 'article'; bib = [ ... 
'author = {Amanda J. Hawthorne and Derek Booles and Pat A. Nugent and George Gettinby and Joy Wilkinson}, ' ... 
'year = {2004}, ' ...
'title = {Body-Weight Changes during Growth in Puppies of Different Breeds}, ' ...
'journal = {J. Nutr.}, ' ...
'volume = {134}, '...
'pages = {2027S–2030S}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Canis_lupus_familiaris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Canis_lupus_familiaris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

