function [data, auxData, metaData, txtData, weights] = mydata_Gallus_gallus_IR

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Gallus_gallus_IR'; 
metaData.species_en = 'Indian River Broiler'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'; 't-R_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Paulus Schuckink Kool','Bas Kooijman'};    
metaData.date_subm = [2012 05 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 09 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 11 17];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 11 17]; 

%% set data
% zero-variate data

data.ab = 21;     units.ab = 'd';    label.ab = 'age at birth';                       bibkey.ab = 'McGi2011';   
  temp.ab = C2K(37.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 6*7;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'besgroup';   
  temp.tx = C2K(41);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'value taken from Gallus gallus; temp from Rahn1991';
data.tp = 182;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(41);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tR minus clutch interval';
data.tR = 189;    units.tR = 'd';    label.tR = 'time since birth at 1st brood for females'; bibkey.tR = 'SchuKerj2002';
  temp.tR = C2K(41);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.tRm = 90;    units.tRm = 'd';    label.tRm = 'time since birth at 1st brood for males'; bibkey.tRm = 'SchuKerj2002';
  temp.tRm = C2K(41);   units.temp.tRm = 'K'; label.temp.tRm = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                          bibkey.am = 'SchuKerj2002';   
  temp.am = C2K(41);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 39.6;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'SchuKerj2002';
data.WwR = 2000;  units.WwR = 'g';   label.WwR = 'wet weight at 1st brood for female';  bibkey.WwR = 'SchuKerj2002';
data.WwRm = 2390;  units.WwRm = 'g';   label.WwRm = 'wet weight at 1st brood for male'; bibkey.WwRm = 'SchuKerj2002';
data.Wwi = 4200;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'SchuKerj2002';
data.Wwim = 5100;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';   bibkey.Wwim = 'SchuKerj2002';

data.Ri  = (6 * 52)/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Rahn1991';   
temp.Ri = C2K(41);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data for females
% t-W data
% Data from SchuKerj2002
% time since birth (d), (w), body weight (g), increase in body weight (g/w),
%  feed intake (g/d); energy intake (kcal/d), 
tWdWJXpX_f = [ ...
           7           1         115           0          26          73
          14           2         215         100          32          90
          21           3         340         125          37         103
          28           4         455         115          40         112
          35           5         565         110          43         120
          42           6         665         100          45         125
          49           7         765         100          47         131
          56           8         865         100          48         136
          63           9         965         100          50         141
          70          10        1065         100          52         146
          77          11        1165         100          54         151
          84          12        1265         100          56         158
          91          13        1365         100          59         165
          98          14        1465         100          62         174
         105          15        1565         100          66         186
         112          16        1670         105          71         199
         119          17        1780         110          77         216
         126          18        1905         125          84         235
         133          19        2055         150          91         255
         140          20        2205         150          98         274
         147          21        2360         155         103         289
         154          22        2515         155         112         315
         161          23        2675         160         122         340
         168          24        2830         155         131         366
         175          25        2970         140         138         387
         182          26        3105         135         148         415
         189          27        3230         125         158         443
         196          28        3320          90         169         473
         203          29        3395          75         169         473
         210          30        3435          40         169         473
         217          31        3470          35         169         473
         224          32        3495          25         169         473
         231          33        3520          25         169         473
         238          34        3540          20         169         473
         245          35        3560          20         169         473
         252          36        3580          20         168         471
         259          37        3600          20         168         470
         266          38        3620          20         167         468
         273          39        3640          20         167         466
         280          40        3660          20         166         465
         287          41        3680          20         165         463
         294          42        3700          20         165         461
         301          43        3720          20         164         460
         308          44        3740          20         164         458
         315          45        3760          20         163         456
         322          46        3780          20         162         455
         329          47        3800          20         162         453
         336          48        3820          20         161         451
         343          49        3840          20         161         450
         350          50        3860          20         160         448
         357          51        3880          20         159         446
         364          52        3900          20         159         445
         371          53        3920          20         158         443
         378          54        3940          20         158         441
         385          55        3960          20         157         440
         392          56        3980          20         156         438
         399          57        4000          20         156         436
         406          58        4020          20         155         435
         413          59        4040          20         155         433
         420          60        4060          20         154         431
         427          61        4080          20         153         430
         434          62        4100          20         153         428
         441          63        4120          20         152         426
         448          64        4140          20         152         425];
data.tW_f = tWdWJXpX_f(:,[1 3]); 
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
feed.tW_f = tWdWJXpX_f(:,[1 5]); units.feed.tW_f = {'d','g/d'}; label.feed.tW_f = {'time since birth','feed intake'};
bibkey.tW_f = 'SchuKerj2002';
%
% time since birth (d),  # of egg per week, # of egg per week, egg weight (g)
tWRW_f = [...
175	0.39	0.39	50.4
182	1.54	1.54	52.3
189	3.67	3.67	53.9
196	5.16	5.16	55.5
203	5.79	5.79	56.8
210	6.05	6.05	58
217	6.10	6.10	59
224	6.04	6.04	59.8
231	5.95	5.95	60.4
238	5.86	5.86	61
245	5.77	5.77	61.6
252	5.69	5.69	62.1
259	5.61	5.61	62.5
266	5.51	5.51	62.9
273	5.43	5.43	63.3
280	5.35	5.35	63.7
287	5.27	5.27	64
294	5.19	5.19	64.4
301	5.09	5.09	64.7
308	5.02	5.02	65.1
315	4.93	4.93	65.4
322	4.86	4.86	65.8
329	4.77	4.77	66.1
336	4.69	4.69	66.5
343	4.60	4.60	66.8
350	4.53	4.53	67.2
357	4.44	4.44	67.5
364	4.36	4.36	67.9
371	4.28	4.28	68.2
378	4.21	4.21	68.5
385	4.11	4.11	68.8
392	4.04	4.04	69.1
399	3.96	3.96	69.4
406	3.88	3.88	69.6
413	3.80	3.80	69.8
420	3.72	3.72	70
427	3.65	3.65	70.1
434	3.57	3.57	70.2
441	3.48	3.48	70.3
448	3.41	3.41	70.4];
data.tR = tWRW_f(:,[1 2]); % d, reprod rate (1/w)
data.tR(:,2) = data.tR(:,2)/ 7; % convert week to day
data.tR(:,2) = data.tR(:,2) .* tWRW_f(:,4); % g/d, egg mass production
units.tR   = {'d', 'g/d'};  label.tR = {'time since birth', 'egg mass production'};  
temp.tR    = C2K(41);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
bibkey.tR = 'SchuKerj2002';
%
data.tW0 = tWRW_f(:,[1 4]); % d, egg weight (d)
units.tW0   = {'d', 'g'};  label.tW0 = {'time since birth', 'egg wet weight'};  
temp.tW0    = C2K(41);  units.temp.tW0 = 'K'; label.temp.tW0 = 'temperature';
bibkey.tW0 = 'SchuKerj2002';

% time since birth (d), wet weight (g), daily gain (g/d), 
%   intake (g/d), cumulative intake (g), cum intake/weight (g/g)
tWdWJX_f   = [ ...
 0   42  0   0    0 0
 1   56 14  15   15 0.272
 2   71 15  18   33 0.470
 3   88 17  21   54 0.616
 4  108 20  24   78 0.725
 5  130 22  27  105 0.808
 6  155 25  30  136 0.872
 7  183 28  34  169 0.924
 8  214 31  38  207 0.967
 9  248 34  42  249 1.003
10  285 37  46  295 1.035
11  325 40  51  346 1.064
12  368 43  56  401 1.091
13  414 46  61  462 1.116
14  463 49  66  528 1.140
15  515 52  71  599 1.163
16  570 55  77  675 1.185
17  627 58  82  758 1.208
18  687 60  88  845 1.230
19  750 63  94  939 1.252
20  815 65  99 1038 1.273
21  882 67 105 1143 1.295
22  952 69 110 1253 1.317
23 1023 71 116 1369 1.338
24 1096 73 121 1491 1.360
25 1171 75 127 1618 1.382
26 1247 76 132 1750 1.403
27 1324 77 137 1887 1.425
28 1403 79 142 2030 1.447
29 1482 80 147 2177 1.469
30 1563 80 152 2329 1.490
31 1644 81 157 2485 1.512
32 1725 82 161 2647 1.534
33 1808 82 165 2812 1.556
34 1890 83 170 2982 1.578
35 1973 83 174 3155 1.599
36 2056 83 177 3333 1.621
37 2139 83 181 3514 1.643
38 2221 83 185 3699 1.665
39 2304 83 188 3887 1.687
40 2387 82 191 4078 1.709
41 2469 82 194 4273 1.731
42 2550 82 197 4470 1.753
43 2632 81 200 4670 1.775
44 2712 81 203 4873 1.797
45 2792 80 205 5078 1.819
46 2872 79 208 5286 1.841
47 2950 79 210 5496 1.863
48 3028 78 212 5708 1.885
49 3105 77 214 5921 1.907
50 3181 76 215 6137 1.929
51 3257 75 217 6353 1.951
52 3331 74 218 6571 1.973
53 3404 73 219 6791 1.995
54 3475 72 220 7011 2.017
55 3546 71 221 7231 2.039
56 3615 69 221 7453 2.062
57 3683 68 221 7674 2.084
58 3749 66 221 7895 2.106
59 3814 65 221 8117 2.128
60 3877 63 221 8337 2.150
61 3939 62 220 8557 2.172
62 3999 60 219 8776 2.195
63 4057 58 218 8994 2.217
64 4113 56 216 9210 2.239
65 4168 54 215 9425 2.261
66 4220 52 213 9638 2.284
67 4271 50 210 9848 2.306
68 4319 48 208 10056 2.328
69 4366 46 205 10261 2.351
70 4410 44 202 10464 2.373];
data.tW2_f = tWdWJX_f(:,[1 2]);
units.tW2_f  = {'d', 'g'};  label.tW2_f = {'time since birth', 'wet weight', 'female'};  
temp.tW2_f   = C2K(41);  units.temp.tW2_f = 'K'; label.temp.tW2_f = 'temperature';
feed.tW2_f = tWdWJX_f(:,[1 4]); units.feed.tW2_f = {'d','g/d'}; label.feed.tW2_f = {'time since birth','intake'};
bibkey.tW2_f = 'aviagen';
comment.tW2_f = ['about the food: ' ...
  'The physical quality of the feed should not be that of mash or include a high proportion of fines. Feed a good crumb/crumble as the starter ration. ' ...
  'The crumbsize should gradually increase to a short/longer pellet as the bird develops. ' ...
  'Warning by Bas Kooijman: scatter in weight data is too little; probably calculated with some model time since birth (d), wet weight (g), daily gain (g/d),'];

% uni-variate data for males

% Data from SchuKerj2002
% weight at age (d): restricted food
% till 7 d: ad libitum
% time since birth (d), wet weight (g), weight coeff, food intake (g/d)
tWdWJXpX_m = [ ...
           7         145         145          34
          14         310         310          42
          21         515         515          48
          28         745         745          52
          35         935         935          56
          42        1120        1120          60
          49        1270        1270          63
          56        1410        1410          66
          63        1535        1535          69
          70        1655        1655          72
          77        1780        1780          75
          84        1900        1900          78
          91        2015        2015          81
          98        2135        2135          84
         105        2260        2260          87
         112        2390        2390          91
         119        2530        2530          96
         126        2680        2680         100
         133        2835        2835         106
         140        3000        3000         111
         147        3165        3165         115
         154        3340        3340         120
         161        3520        3520         123
         168        3700        3700         126
         175        3830        3830         129
         182        3920        3920         130
         189        3990        3990         132
         196        4055        4055         133
         203        4080        4080         134
         210        4110        4110         135
         217        4140        4140         136
         224        4170        4170         137
         231        4200        4200         137
         238        4230        4230         138
         245        4260        4260         139
         252        4290        4290         139
         259        4320        4320         140
         266        4350        4350         140
         273        4380        4380         141
         280        4410        4410         141
         287        4440        4440         142
         294        4470        4470         142
         301        4500        4500         143
         308        4530        4530         143
         315        4560        4560         144
         322        4590        4590         144
         329        4620        4620         144
         336        4650        4650         145
         343        4680        4680         145
         350        4710        4710         146
         357        4740        4740         146
         364        4770        4770         147
         371        4800        4800         147
         378        4830        4830         148
         385        4860        4860         148
         392        4890        4890         149
         399        4920        4920         149
         406        4950        4950         150
         413        4980        4980         150
         420        5010        5010         150
         427        5040        5040         151
         434        5070        5070         151
         441        5100        5100         152
         448        5130        5130         152];
data.tW_m = tWdWJXpX_m(:,[1 2]); 
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
feed.tW_m = tWdWJXpX_m(:,[1 4]); units.feed.tW_m = {'d','g/d'}; label.feed.tW_m = {'time since birth','feed intake'};
bibkey.tW_m = 'SchuKerj2002';

% time since birth (d), wet weight (g), daily gain (g/d), 
%   intake (g/d), cumulative intake (g), cum intake/weight (g/g)
tWdWJX_m   = [ ...
 0  42   0  0  0 0
 1  56  14 13 13 0.225
 2  71  15 16 28 0.402
 3  88  17 19 48 0.542
 4  108 20 23 70 0.654
 5  130 22 26 97 0.744
 6  155 25 30 127 0.818
 7  184 28 34 162 0.879
 8  215 32 39 200 0.930
 9  250 35 44 244 0.974
10  289 38 48 292 1.013
11  331 42 54 346 1.047
12  376 45 59 405 1.078
13  425 49 65 470 1.106
14  477 53 71 541 1.132
15  534 56 77 618 1.157
16  593 60 83 701 1.181
17  657 63 90 791 1.204
18  723 67 96 887 1.226
19  793 70 103 990 1.248
20  866 73 110 1100 1.270
21  943 76 117 1217 1.291
22 1022 79 124 1340 1.312
23 1104 82 131 1471 1.333
24 1188 85 137 1608 1.353
25 1276 87 144 1753 1.374
26 1365 89 151 1904 1.395
27 1457 92 158 2061 1.415
28 1550 94 164 2225 1.435
29 1646 95 170 2396 1.456
30 1743 97 177 2573 1.476
31 1841 98 183 2755 1.497
32 1941 100 189 2944 1.517
33 2042 101 194 3138 1.537
34 2143 102 200 3338 1.558
35 2246 102 205 3543 1.578
36 2349 103 210 3754 1.598
37 2452 103 215 3969 1.619
38 2556 104 220 4189 1.639
39 2660 104 224 4413 1.659
40 2763 104 228 4642 1.680
41 2867 104 233 4874 1.700
42 2971 103 236 5110 1.720
43 3074 103 240 5350 1.741
44 3176 103 243 5593 1.761
45 3278 102 246 5840 1.781
46 3380 101 249 6089 1.802
47 3480 101 252 6341 1.822
48 3580 100 255 6596 1.842
49 3679 99 257 6853 1.863
50 3777 98 259 7112 1.883
51 3873 97 261 7373 1.903
52 3969 96 263 7635 1.924
53 4063 94 264 7900 1.944
54 4156 93 266 8165 1.965
55 4248 92 267 8432 1.985
56 4338 90 268 8700 2.005
57 4427 89 269 8969 2.026
58 4515 88 269 9238 2.046
59 4601 86 270 9508 2.067
60 4685 85 270 9778 2.087
61 4768 83 270 10049 2.107
62 4850 81 270 10319 2.128
63 4929 80 270 10589 2.148
64 5008 78 270 10859 2.169
65 5084 76 269 11128 2.189
66 5159 75 269 11397 2.209
67 5232 73 268 11665 2.230
68 5303 71 267 11932 2.250
69 5372 69 266 12198 2.271
70 5440 68 265 12463 2.291];
data.tW2_m = tWdWJX_m(:,[1 2]);
units.tW2_m = {'d', 'g'};  label.tW2_m = {'time since birth', 'wet weight', 'male'};  
temp.tW2_m  = C2K(41);  units.temp.tW2_m = 'K'; label.temp.tW2_m = 'temperature';
feed.tW2_m = tWdWJX_m(:,[1 4]); units.feed.tW2_m = {'d','g/d'}; label.feed.tW2_m = {'time since birth','intake'};
bibkey.tW2_m = 'aviagen';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.feed = feed;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW2_f','tW2_m'}; subtitle1 = {'Aviagen data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'SchuKerj2002 data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assume to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_3: v reduced';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'feeding propto weight^(3/4)';
metaData.bibkey.F1 = 'aviagen'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F72J'; % Cat of Life
metaData.links.id_ITIS = '176086'; % ITIS
metaData.links.id_EoL = '45513816'; % Ency of Life
metaData.links.id_Wiki = 'Gallus_gallus'; % Wikipedia
metaData.links.id_ADW = 'Gallus_gallus'; % ADW
metaData.links.id_Taxo = '53136'; % Taxonomicon
metaData.links.id_avibase = '3749777E14C923E9'; % Avibase
metaData.links.id_birdlife = 'red-junglefowl-gallus-gallus'; % Birdlife
metaData.links.id_AnAge = 'Gallus_gallus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gallus_gallus}}';
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
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles}, ' ...
'publisher = {Cambridge University Press}, ' ...
'address = {Cambridge}, '...
'pages = {345--360}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchuKerj2002'; type = 'Article'; bib = [ ... 
'author = {Sch\"{u}tz, K. and Kerje, S. and Carlborg, \"{O}. and Jacobsson, L. and Andersson, L. and Jensen, P.}, ' ... 
'year = {2002}, ' ...
'title = {QTL Analysis of a Red Junglefowl x White Leghorn Intercross Reveals Trade-Off in Resource Allocation between Behavior and Production Traits}, ' ...
'journal = {Behavior Genetics}, ' ...
'volume = {32}, ' ...
'pages = {423--433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Weis1958'; type = 'Article'; bib = [ ... 
'author = {Weiss, H.S.}, ' ... 
'year = {1958}, ' ...
'title = {Application to the fowl of the antipyrine dilution technique for the estimation of body composition}, ' ...
'journal = {Poultry Science}, ' ...
'volume = {37}, ' ...
'pages = {484--489}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WrigRubi2012'; type = 'Article'; bib = [ ... 
'author = {D. Wright and C. Rubin and K. Schutz and S. Kerje and A. Kindmark and H. Brandstrom and L. Andersson and T. Pizzari and P. Jensen }, ' ... 
'year = {2012}, ' ...
'title = {Onset of sexual maturity in female chickens is genetically linked to loci associated with fecundity and a sexual ornament}, ' ...
'journal = {Reprod Domest Anim.}, ' ...
'doi = {10.1111/j.1439-0531.2011.01963.x.}, ' ...  
'volume = {47}, ' ...
'number = {Suppl 1}, '...
'pages = {31--36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'leghornbreeders'; type = 'Misc'; bib = ...
'howpublished = {\url{http://leghornbreeders.webs.com/leghornstandards.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aviagen'; type = 'Misc'; bib = [ ...
'author = {Anonymous 2012} , '...
'title = {INDIAN RIVER MEAT Broiler Stock Performance Objectives. {L}ohmann meat Broiler Stock Nutrition Specification 2010}, ' ...
'howpublished = {\url{http://www.aviagen.com}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fass'; type = 'Misc'; bib = [ ...
'author = {D. D. Bell and D. R. Kuney}, ' ...
'title  = {Effect of fasting and post-fast diets on performance in molted flocks}, ' ...
'howpublished = {\url{http://japr.fass.org/content/1/2/200.full.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'besgroup'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.besgroup.org/2013/05/10/fledging-moments-update-on-the-red-junglefowl-chicks/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McGi2011'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.peafowlareus.com/hatching_chart.asp}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

