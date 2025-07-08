function [data, auxData, metaData, txtData, weights] = mydata_Orius_laevigatus

%% set metaData  
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Anthocoridae';
metaData.species    = 'Orius_laevigatus'; 
metaData.species_en = 'Minute pirate bug'; 

metaData.ecoCode.climate = {'A','C'}; 
metaData.ecoCode.ecozone = {'TP'};
metaData.ecoCode.habitat = {'biTh'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHn','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp 
metaData.data_0     = {'Wwb'}; % 
metaData.data_1     = {'T-ab';'T-ap';'T-as';'T-Ni'; 'X-Wi';'X-ap';'X-am';'X-Ni';'X-R'; 't-N_T'; 't-S_T'}; % 
metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Anna Huang'};    
metaData.date_subm = [2024 12 18];              
metaData.email    = {'anna.huang@wur.nl'};            
metaData.address  = {'WUR'};     

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2025 01 06];

%% set data 

% zero-variate data

data.Wwb = 1.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'Kopp2025','Wiki','ArijPatr2001'};
  comment.Wwb = 'based on Wwi*(Lb/Lp)^3 with Lb=0.04 cm, Li=0.25 cm, Wwi=0.042 g'; 
data.Wwi = 1.2*0.042; units.Wwi = 'g';   label.Wwi = 'asymptotic wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'hypothetical: 1.2*Ww_j'; 

data.Ni = 150; units.Ni = '#';   label.Ni = 'total fecundity';   bibkey.Ni = 'SancLaca2002';

% uni-variate data  

% temperature-age at birth 
data.Tab = [ ... % temperature (C), age at birth (d)
15  NaN 11.7 11.0
20	7.4  6.4  NaN
25	4.3  4.6  4.0
30	3.0  3.3  NaN
35	2.4  NaN  3.1];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'}; title.Tab = 'SancLaca2002,AlauDarg1994,CocuCler1997';  
treat.Tab = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.Tab = 'data source';
bibkey.Tab = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-time since birth at puberty (end of instar 5)
data.Ttp = [ ... % temperature (C), time since birth at puberty (end of instar 5) (d)
15  NaN  54.7 58.9
20	34.6 26.8 NaN
25	20.5 17.7 18.0
30	15.2 NaN  NaN
35	12.3 NaN  13.2];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'}; title.Ttp = 'SancLaca2002,AlauDarg1994,CocuCler1997'; 
treat.Ttp = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.Ttp = 'data source';
bibkey.Ttp = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 1
data.Tb1 = [ ... % temperature (C), duration of instar 1
15  NaN 9.4 8.3
20	5.6 4.0 NaN
25	3.3 2.9 3.0
30	2.5 2.0 NaN
35	2.0 NaN 2.0];
units.Tb1  = {'C', 'd'};  label.Tb1 = {'temperature', 'duration of instar 1'};  title.Tb1 = 'SancLaca2002,AlauDarg1994,CocuCler1997';
treat.Tb1 = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.Tb1 = 'data source';
bibkey.Tb1 = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 2
data.T12 = [ ... % temperature (C), duration of instar 2
15  NaN 6.2 6.8
20	4.0 2.9 NaN
25	2.4 2.2 2.7
30	1.7 1.2 NaN
35	1.5 NaN 2.3];
units.T12  = {'C', 'd'};  label.T12 = {'temperature', 'duration of instar 2'}; title.T12 = 'SancLaca2002,AlauDarg1994,CocuCler1997';
treat.T12 = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.T12 = 'data source';
bibkey.T12 = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 3
data.T23 = [ ... % temperature (C), duration of instar 3
15  NaN 6.0 9.6
20	4.1 3.0 NaN
25	2.6 1.8 2.2
30	1.9 1.2 NaN
35	1.5 NaN 2.0];
units.T23 = {'C', 'd'};  label.T23 = {'temperature', 'duration of instar 3'}; title.T23 = 'SancLaca2002,AlauDarg1994,CocuCler1997'; 
treat.T23 = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.T23 = 'data source';
bibkey.T23 = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 4
data.T34 = [ ... % temperature (C), duration of instar 4
15  NaN 7.4 9.3
20	4.9 3.4 NaN
25	2.8 2.1 1.8
30	2.2 1.8 NaN
35	1.8 NaN 1.7];
units.T34 = {'C', 'd'};  label.T34 = {'temperature', 'duration of instar 4'}; title.T34 = 'SancLaca2002,AlauDarg1994,CocuCler1997'; 
treat.T34 = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.T34 = 'data source';
bibkey.T34 = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 5
data.T45 = [ ... % temperature (C), duration of instar 5
15  NaN 14.0 13.9
20	8.6  7.1  NaN
25	4.9  4.1  4.3
30	3.9  2.9  NaN
35	3.1  NaN  2.1];
units.T45 = {'C', 'd'};  label.T45 = {'temperature', 'duration of instar 5'}; title.T45 = 'SancLaca2002,AlauDarg1994,CocuCler1997'; 
treat.T45 = {1 {'SancLaca2002','AlauDarg1994','CocuCler1997'}}; label.treat.T45 = 'data source';
bibkey.T45 = {'SancLaca2002','AlauDarg1994','CocuCler1997'}; 

% temperature-duration of instar 6
data.T56 = [ ... % temperature (C), duration of instar 6 (= adult)
15  NaN
20	7.5
25	4.4
30	3.0
35	2.4];
units.T56 = {'C', 'd'};  label.T56 = {'temperature', 'duration of instar 6'}; title.T56 = 'SancLaca2002'; 
bibkey.T56 = 'SancLaca2002'; 

% temperature-duration of imago (female,male)
data.Tji_fm = [ ... % temperature (C), duration of female, male imago
15   NaN 59.5   NaN 43.8
20	70.3  NaN  33.7  NaN
25	32.8 22.2  16.1 18.0
30	21.2  NaN   9.4  NaN
35	 7.7  9.5   4.9  8.5];
units.Tji_fm = {'C', 'd'};  label.Tji_fm = {'temperature', 'duration of imago'}; title.Tji_fm = '(fe)male SancLaca2002,CocuCler1997';
treat.Tji_fm = {1 {'female SancLaca2002','female CocuCler1997','male SancLaca2002','male CocuCler1997'}}; label.treat.Tji_fm = 'gender/data source';
bibkey.Tji_fm = {'SancLaca2002','CocuCler1997'}; 

% temperature-total fecundity
data.TN = [ ... % temperature (C), viable eggs per female (#)
15 NaN     113.1  
20 112.50  174.5  % tN20 158
25 115.70  144.4  % tN25 154
30 70.55   118.44 % tN30  92
35  5.89   NaN];  % tN35  12
units.TN   = {'C', '#'};  label.TN = {'temperature', 'total fecundity'}; title.TN = 'SancLaca2002,AlauDarg1994'; 
treat.TN = {0 {'SancLaca2002','AlauDarg1994'}}; label.treat.TN = 'data source';
bibkey.TN = {'SancLaca2002','AlauDarg1994'}; 

% diet-imago wet weight
data.XWi_fm = [ ... diet (-), imago wet weight (g)
    0 0.042 0.035
    1 0.042 0.031
    2 0.036 0.033
    3 0.040 0.036
    4 0.035 0.032];
units.XWi_fm   = {'-', 'g'};  label.XWi_fm = {'diet', 'imago wet weight'}; title.XWi_fm = 'different diets';
bibkey.XWi_fm = 'ArijPatr2001'; treat.XWi_fm = {0 {'females','males'}}; label.treat.XWi_fm = 'imago wet weight';
comment.XWi_fm = 'Control diet 0 is Ephestia kuehniella';

% diet-duration of stage
data.Xt_ji = [ ... diet (-), duration of nymphs, female imago stages (d)
    0 13.9 39.4
    1 14.4 27.2
    2 13.4 36.7
    3 13.3 36.4
    4 14.3 42.0];
units.Xt_ji   = {'-', 'd'};  label.Xt_ji = {'diet', 'time since birth at puberty'}; 
temp.Xt_ji = C2K(23);  units.temp.Xt_ji = 'K'; label.temp.Xt_ji = 'temperature'; title.Xt_ji = 'different diets';
bibkey.Xt_ji = 'ArijPatr2001'; treat.Xt_ji = {0 {'nymphs 1-6','female imago'}}; label.treat.Xt_ji = 'duration';
comment.Xt_ji = 'Control diet 0 is Ephestia kuehniella';

% diet-total fecundity
data.XN = [ ... diet (-), duration of nymphs, cumulative # of eggs (#)
    0 115.9
    1  55.9
    2  49.1
    3 104.4
    4  76.1];
units.XN   = {'-', '#'};  label.XN = {'diet', 'total fecundity'}; title.XN = 'different diets';
temp.XN = C2K(23);  units.temp.XN = 'K'; label.temp.XN = 'temperature';
bibkey.XN = 'ArijPatr2001'; treat.XN = {0}; label.treat.XN = 'duration';
comment.XN = 'Control diet 0 is Ephestia kuehniella';

% % diet-mean reproduction rate
% data.XR = [ ... diet (-), mean reproduction rate (#/d)
%     0  2.9
%     1  2.1
%     2  1.3
%     3  2.9
%     4  1.8];
% units.XR   = {'-', '#/d'};  label.XR = {'diet', 'mean reproduction rate'}; title.XR = 'different diets';
% temp.XR = C2K(23);  units.temp.XR = 'K'; label.temp.XR = 'temperature';
% bibkey.XR = 'ArijPatr2001'; treat.XR = {0}; label.treat.XN = 'duration';
% comment.XR = 'Control diet 0 is Ephestia kuehniella';

% time-cum reproduction rate
data.tN20 = [ ... % time since start imago (d), number of eggs (#/d)
 0	0.000
 5	0.000
 6	0.411
 7	0.909
 8	1.364
 9	1.198
10	1.405
11	1.695
12	1.445
13	1.570
14	2.232
15	2.771
16	1.402
17	2.562
18	2.189
19	2.935
20	3.307
21	3.307
22	2.850
23	3.555
24	2.518
25	3.098
26	3.346
27	1.522
28	3.138
29	3.179
30	2.515
31	3.219
32	3.219
33	1.934
34	2.638
35	1.809
36	7.743
37	2.886
38	2.786
39.	2.636
40	1.931
41	2.469
42	3.422
43	2.179
44	2.427
45	2.509
46	2.302
47	3.006
48	2.757
49	2.342
50	2.424
51	2.258
52	3.667
53	3.086
54	2.216
55	2.381
56	2.629
57	2.380
58	1.882
59	1.798
60	1.550
61	1.761
62	1.135
63	2.295
64	1.672
65	1.506
66	1.532
67	0.966
68	1.057
69	1.712
70	1.380
72	0.799
73	0.882
74	0.632
75	0.134
76	0.963
77	0.092
78	0.340
79	0.340
80	0.033
81	0.173
82	0.587
83	0.546
84	0.338
85	0.130
86	0.000];
data.tN20(:,2) = cumsum(data.tN20(:,2)); % convert reprod rate to cum reprod rate
units.tN20   = {'d', '#'};  label.tN20 = {'time since start imago', 'cumulative reproduction rate', '20 C'}; 
temp.tN20 = C2K(20);  units.temp.tN20 = 'K'; label.temp.tN20 = 'temperature';
bibkey.tN20 = 'SancLaca2002'; % Figure 1
%
data.tN25 = [ ... % time since start imago (d), number of eggs (#/d)
 0  0.000
 2	0.000
 3	0.416
 4	0.960
 5	2.216
 6	3.304
 7	3.136
 8	4.308
 9	3.846
10	3.720
11	4.807
12	4.346
13	5.224
14	4.051
15	4.972
16	4.845
17	5.263
18	4.844
19	5.639
20	4.968
21	5.177
22	4.882
23	4.630
24	5.466
25	5.298
26	5.483
27	5.632
28	5.128
29	5.462
30	4.290
31	3.912
32	2.445
33	2.109
34	1.898
35	2.274
36	1.771
37	1.310
38	0.722
39	1.601
40	1.475
41	0.510
42	0.257
43	0.508
44	1.513
45	1.722
46	1.302
47	0.967
48	0.630
49	0.336
50	0.502
51	0.000];
data.tN25(:,2) = cumsum(data.tN25(:,2)); % convert reprod rate to cum reprod rate
units.tN25   = {'d', '#'};  label.tN25 = {'time since start imago', 'cumulative reproduction rate', '25 C'}; 
temp.tN25 = C2K(25);  units.temp.tN25 = 'K'; label.temp.tN25 = 'temperature';
bibkey.tN25 = 'SancLaca2002'; % Figure 1
%
data.tN30 = [ ... % time since start imago (d), number of eggs (#/d)
0   0.000 
1	0.419
2	3.365
3	2.102
4	2.985
5	2.942
6	3.616
7	3.319
8	4.498
9	2.981
10	3.738
11	4.622
12	5.716
13	6.136
14	6.557
15	6.177
16	5.670
17	5.206
18	4.026
19	4.657
20	4.108
21	2.297
22	1.707
23	1.285
24	1.790
25	1.577
26	0.230
27	0.143
28	0.000];
data.tN30(:,2) = cumsum(data.tN30(:,2)); % convert reprod rate to cum reprod rate
units.tN30   = {'d', '#'};  label.tN30 = {'time since start imago', 'cumulative reproduction rate', '30 C'}; 
temp.tN30 = C2K(30);  units.temp.tN30 = 'K'; label.temp.tN30 = 'temperature';
bibkey.tN30 = 'SancLaca2002'; % Figure 1
%
data.tN35 = [ ... % time since start imago (d), number of eggs (#/d)
0	0.000
1	0.206
2	0.498
3	0.610
4	0.912
5	1.321
6	1.786
7	1.283
8	1.323
9	1.446
10	1.243
11	1.110
12	0.000];
data.tN35(:,2) = cumsum(data.tN35(:,2)); % convert reprod rate to cum reprod rate
units.tN35   = {'d', '#'};  label.tN35 = {'time since start imago', 'cumulative reproduction rate', '35 C'}; 
temp.tN35 = C2K(35);  units.temp.tN35 = 'K'; label.temp.tN35 = 'temperature'; 
bibkey.tN35 = 'SancLaca2002'; % Figure 1

% time-survival
data.tS20 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
6.874	1.000
46.771	0.935
46.987	0.908
48.761	0.908
49.197	0.873
50.748	0.869
51.407	0.842
51.844	0.814
56.276	0.803
56.486	0.748
60.021	0.692
60.034	0.751
62.896	0.657
62.902	0.654
68.660	0.654
69.318	0.619
72.866	0.619
73.303	0.591
74.403	0.553
75.513	0.553
76.172	0.532
77.502	0.532
78.161	0.504
79.040	0.466
80.142	0.435
80.799	0.400
82.340	0.351
83.433	0.278
84.543	0.278
84.972	0.222
86.747	0.222
87.396	0.153
94.049	0.153
95.150	0.125
96.481	0.125
97.139	0.094
98.456	0.035
99.787	0.035
100.223	0.000];
units.tS20   = {'d', '-'};  label.tS20 = {'time since start imago', 'surviving fraction', '20 C'}; 
temp.tS20 = C2K(20);  units.temp.tS20 = 'K'; label.temp.tS20 = 'temperature'; 
bibkey.tS20 = 'SancLaca2002'; 
%
data.tS25 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
3.116	1.000
8.927	0.972
9.171	0.941
10.751	0.910
11.224	0.868
15.449	0.868
15.920	0.840
25.048	0.840
26.206	0.778
27.568	0.740
30.902	0.740
31.591	0.719
32.489	0.708
33.642	0.649
34.645	0.482
35.573	0.426
36.735	0.353
37.710	0.228
38.624	0.190
40.185	0.190
40.870	0.165
44.208	0.165
44.897	0.137
45.586	0.106
48.702	0.106
48.952	0.068
56.079	0.068
56.550	0.030
59.666	0.030
60.578	0.000];
units.tS25   = {'d', '-'};  label.tS25 = {'time since start imago', 'surviving fraction', '25 C'}; 
temp.tS25 = C2K(25);  units.temp.tS25 = 'K'; label.temp.tS25 = 'temperature'; 
bibkey.tS25 = 'SancLaca2002'; 
%
data.tS30 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
3.763	1.000
4.419	0.972
5.737	0.927
7.729	0.937
8.608	0.902
9.263	0.864
10.803	0.826
15.450	0.829
16.768	0.788
17.637	0.715
18.285	0.645
19.383	0.607
20.031	0.538
20.909	0.506
22.448	0.461
23.320	0.402
23.965	0.319
25.064	0.287
25.949	0.287
27.269	0.253
28.146	0.214
29.246	0.187
30.793	0.183
32.556	0.152
32.990	0.110
35.203	0.113
35.858	0.075
36.507	0.000];
units.tS30   = {'d', '-'};  label.tS30 = {'time since start imago', 'surviving fraction', '30 C'}; 
temp.tS30 = C2K(30);  units.temp.tS30 = 'K'; label.temp.tS30 = 'temperature'; 
bibkey.tS30 = 'SancLaca2002'; 
%
data.tS35 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
0.674	0.965
1.561	0.962
2.699	0.829
3.385	0.735
5.166	0.704
5.853	0.606
6.986	0.498
8.323	0.467
8.996	0.432
10.332	0.404
11.454	0.345
11.707	0.206
13.043	0.178
14.167	0.111
15.292	0.038
15.521	0.000];
units.tS35   = {'d', '-'};  label.tS35 = {'time since start imago', 'surviving fraction', '35 C'}; 
temp.tS35 = C2K(35);  units.temp.tS35 = 'K'; label.temp.tS35 = 'temperature'; 
bibkey.tS35 = 'SancLaca2002'; 

%% set weights for all real data
weights = setweights(data, []);
weights.XWi_fm = 2 * weights.XWi_fm;
weights.Xt_ji = 3 * weights.Xt_ji;
weights.Wwb = 5 * weights.Wwb;
weights.Ni = 10 * weights.Ni;
%weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.title = title;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tN35','tN30','tN25','tN20'}; subtitle1 = {'Data for 35, 30, 25, 20 C'};
set2 = {'tS35','tS30','tS25','tS20'}; subtitle2 = {'Data for 35, 30, 25, 20 C'};
metaData.grp.sets = {set1,set2}; txtData.label.sets = {'temperature','temperature'};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points 
D1 = 'males are supposed to differ from females by {p_Am} only';
D2 = 'model hep is applied: period bp acceleration, pj isomorphic growth, allocation to reprod, ei no growth or allocation to reprod';
D3 = 'growth data suggests a 3 parameter Arrhenius model, but survival a 1 paprater one';
D4 = 'reproduction efficiency depends on temperature different from growth and survival';
D5 = 'SancLaca2002 means with "egg to adult" bj, but adult period pj was not given by CocuCler1997 or ArijPatr2001';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Neonates count as instar 1, moult into instar 2 till 5, followed by the imago; so the period from birth to imago has 6 instar periods';
metaData.bibkey.F1 = 'Kopp2025'; 
metaData.facts = struct('F1',F1);

%% Links 
metaData.links.id_CoL = 'BY3DJ'; % Cat of Life, no data, it has data for Orius Wolff, 1811 
metaData.links.id_ITIS = '93980'; % ITIS Life, no data, it has data for Orius Wolff, 1811 
metaData.links.id_EoL = '3688421'; % Ency of Life
metaData.links.id_Wiki = 'Orius'; % Wikipedia
metaData.links.id_ADW = 'Orius'; % ADW, no data 
metaData.links.id_Taxo = '2729348'; % Taxonomicon, no data, has data for Orius niger (Wolff, 1811)
metaData.links.id_WoRMS = 'Orius'; % WoRMS, no data

%% References
bibkey = 'Kopp2025'; type = 'Misc'; bib = [ ...
'author = {Koppert}, ' ...
'year = {2025}, ' ...
'howpublished = {\url{https://www.koppert.com/crop-protection/biological-pest-control/predatory-insects/orius-laevigatus/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://https://nl.wikipedia.org/wiki/Orius_laevigatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SancLaca2002'; type = 'Article'; bib = [ ...
'author = {Sanchez, J.A. and Lacasa, A.}, ' ...
'year = {2002}, ' ...
'title  = {Modelling population dynamics of \emph{Orius laevigatus} and \emph{O. albidipennis} ({H}emiptera: {A}nthocoridae) to optimize their use as biological control agents of \emph{Frankliniella occidentalis} ({T}hysanoptera: {T}hripidae)}, ' ...
'journal = {Bulletin of Entomological Research}, ' ...
'volume = {92}, ' ...
'pages = {77--88}, ' ...
'doi = {10.1079/BER2001136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArijPatr2001'; type = 'Article'; bib = [ ...
'author = {Arijs, Yves and Patrick De Clercq}, ' ...
'year = {2001}, ' ...
'title  = {Rearing \emph{Orius laevigatus} on cysts of the brine shrimp \emph{Artemia franciscana}}, ' ...
'journal = {Biological Control}, ' ...
'volume = {21,1}, ' ...
'pages = {79--83}, ' ...
'doi = {10.1006/bcon.2000.0910}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlauDarg1994'; type = 'Article'; bib = [ ...
'author = {Alauzet, C. and Dargagnon, D. and Malausa, J.}, ' ...
'year = {1994}, ' ...
'title  = {Bionomics of a polyphagous predator: \emph{Orius laevigatus} ({H}et.: {A}nthocoridae).}, ' ...
'journal = {Entomophaga}, ' ...
'volume = {39(1)}, ' ...
'pages = {33--40}, ' ...
'doi = {10.1007/BF02373492}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CocuCler1997'; type = 'Article'; bib = [ ...
'author = {G. E. Cocuzza and P. De Clercq and S. Lizzioa and M. Van de Veire and L. Tirry and D. Degheele and V. Vacante}, ' ...
'year = {1997}, ' ...
'title  = {Life tables and predation activity of \emph{Orius laevigatus} and \emph{O. albidipennis} at three constant temperatures}, ' ...
'journal = {Entomologia Experimentalis Et Applicata}, ' ...
'volume = {85}, ' ...
'pages = {189--198}, ' ...
'doi = {10.1046/j.1570-7458.1997.00249.x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
