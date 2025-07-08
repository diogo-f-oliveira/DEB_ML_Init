function [data, auxData, metaData, txtData, weights] = mydata_Asterias_rubens

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Forcipulatida'; 
metaData.family     = 'Asteriidae';
metaData.species    = 'Asterias_rubens'; 
metaData.species_en = 'Common sea star'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAW'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 'L-Wd'; 'Ww-dWw'; 'Wd-JO'; 'Ww-JX'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Antonio Aguera Garcia'};    
metaData.date_subm = [2011 12 27];              
metaData.email    = {'antonio.aguera@wur.nl'};            
metaData.address  = {'IMARES, DEn Helder'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2014 03 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 02]; 


%% set data
% zero-variate data

data.ab = 4;    units.ab = 'd';      label.ab = 'age at birth';              bibkey.ab = 'BarkNich1983';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 81;   units.tj = 'd';      label.tj = 'time since birth at metam'; bibkey.tj = 'BarkNich1983';   
  temp.tj = C2K(16);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 120;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'GuilJoly2012';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1095; units.am = 'd';      label.am = 'life span';                 bibkey.am = 'NichBark1984';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.027; units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'SaraFlya2001';
data.Lj  = 0.4;   units.Lj  = 'cm';  label.Lj  = 'diameter at metam';        bibkey.Lj  = 'LariWest2011';
  comment.Lj = 'dimeter without feed is 2 mm, with feet about 4 mm';
data.Lp  = 2;     units.Lp  = 'cm';  label.Lp  = 'diameter st puberty';      bibkey.Lp  = 'GuilJoly2012';
data.Li  = 52;    units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';
  comment.Li = 'Brig1983 gives 40 cm';

data.Ri  = 2.5e6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Smit1940';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% note by Bas Kooijman: units of length cannot be correct
data.LWd = [... % diameter (cm),  dry weight (g) (pre-reproduction season, my own data)
128	16.79
86	3.06
112	2.84
74	1.97
116	4.91
56	0.53
96	2.87
78	1.32
130	10
74	1.51
102	3.11
60	1.04
104	4.75
84	3.13
72	2.23
78	3.31
120	8.893
80	3.023
80	2.183
100	4.926
110	5.41
64	1.458
84	2.508
78	1.95
110	4.74
118	5.312
90	3.743
124	7.31
96	4.59
86	3.353
60	1.246
76	2.059
136	10.847
86	2.234
108	4.736
106	5.088
88	3.364
90	3.803
78	3.052
68	2.205
150	11.88
106	4.505
124	4.83
86	2.449
120	7.617
76	1.816
108	4.973
86	2.913
130	8.871
96	3.293
92	3.078
82	2.091
110	5.773
80	1.46
104	3.313
54	0.832
142	10.981
104	7.324
124	6.193
54	0.624
104	3.856
84	2.553
100	3.247
60	0.881
164	17.547
176	16.324
86	2.558
68	1.777
136	16.63
116	5.467
78	2.247
96	3.008
118	5.749
50	0.697
144	12.852
96	3.509
140	10.338
84	3.125
100	4.548
90	4.619
64	1.537
122	11.341
80	2.249
116	7.335
84	2.913
86	3.252
94	2.839
70	1.302
126	9.954
100	4.178
78	1.714
98	4.232
84	2.978
76	2.253
60	1.104
62	0.832
120	7.86
98	3.819
74	1.739
122	7.314
96	3.41
46	0.399
100	3.25
80	2.355
146	9.459
106	3.99
78	1.362
100	4.291
90	2.672
58	0.761
88	2.743
86	3.589
146	8.023
116	4.861
96	2.319
84	2.46
78	1.62
104	3.446
158	15.398
152	12.624
126	8.586
92	3.379
122	11.758
80	3.05
116	7.26
84	2.853
144	17.202
74	2.204
148	12.573
98	5.177
78	2.044
144	9.909
122	9.364
108	2.721
126	14.32
120	9.9
114	5.693
82	7.107
84	3.23
126	8.601
136	11.857
168	19.849
102	6.054
44	0.65
110	6.11
104	4.948
120	7.656
154	13.487
116	5.475
90	4.187
64	0.492
108	7.977
86	2.378
114	5.472
170	13.02
134	8.642
100	4.666
84	3.347
66	1.756
64	0.958];    
data.LWd(:,1) = data.LWd(:,1)/10; % convert mm to cm (assuming that mm is correct)
units.LWd   = {'cm', 'g'};  label.LWd = {'diameter', 'dry weight'};  
bibkey.LWd = 'Brig1983'; % Bas Kooijman: guess, 

% Growth in wet weight/day
data.WdW = [... % wet weight (g), growth (g wet weight per day) at f=1, T = 288 K my own data
27	1.081081081
41	0.378378378
14	0.806451613
10	0.540540541
18	0.486486486
5	0.72972973
15	1.027027027
12	0.918918919
4	0.540540541
69	1.351351351
34	0.483870968
28	0.918918919
11	0.027027027
53	1.162162162
7	0.189189189
17	1.189189189
4	0.405405405
20	1.027027027
26	0.783783784
30	2.178571429
26	0.580645161
61	1.567567568
37	0.918918919
14	0.810810811
3	0.027027027
29	0.783783784
20	0.129032258
63	1.405405405
24	1.081081081
46	0.054054054
19	0.864864865
12	0.621621622
7	0.675675676
46	1.675675676
9	0.72972973
56	1.513513514
25	1.054054054
3	0.378378378
7	0.675675676
12	0.891891892
7	0.432432432
24	1
71	0.928571429
42	1.459459459
5	0.162162162
47	0.714285714
40	0.857142857
16	0.548387097
20	0.540540541
21	0.27027027
10	0.351351351
7	0.513513514
76	1.805555556
22	0.513513514
22	1.162162162
13	0.513513514
79	0.297297297
39	0.837837838
8	0.513513514
13	0.918918919
12	0.810810811
6	0.594594595
8	0.648648649
67	1.648648649
14	0.594594595
7	0.054054054
77	1.513513514
56	0.945945946
15	0.567567568
6	0.405405405
9	0.243243243
13	0.810810811
22	0.945945946];
units.WdW   = {'g', 'g/d'};  label.WdW = {'wet weight', 'change in wet weight'};  
temp.WdW   = C2K(15);  units.temp.WdW = 'K'; label.temp.WdW = 'temperature';
bibkey.WdW = 'Ague2011';

% growth in length
data.LdL = [... %length (cm diameter), growth in length(cm diameter per day) f=1, T = 288 K my own data
9.8 0.102702703
12.2	-0.005405405
8	0.070967742
7	0.07027027
8.6	0.048648649
6.2	0.097297297
7	0.113513514
6.2	0.156756757
4.6	0.108108108
14.4	0.102702703
12.2	0.006451613
9.6	0.081081081
6.6	0.037837838
12.2	0.075675676
5.8	0.048648649
8.2	0.140540541
4.6	0.113513514
8.4	0.097297297
10.2	0.081081081
9	0.164285714
9	0.083870968
12.2	0.12972973
11	0.081081081
8	0.081081081
4.6	0.005405405
8.8	0.194594595
10	0.038709677
13	0.108108108
10.6	0.075675676
12	0.043243243
9	0.081081081
7.4	0.07027027
5.8	0.086486486
12.2	0.102702703
6.6	0.091891892
11	0.075675676
13	0.086486486
9.6	0.091891892
4.6	0.102702703
6.2	0.075675676
7.4	0.075675676
6.6	0.037837838
8.6	0.102702703
15	0.035714286
11.8	0.075675676
6	0.048648649
12	0.078571429
11	0.057142857
7.6	0.096774194
8.6	0.059459459
10.4	-0.021621622
6.6	0.054054054
5.8	0.102702703
13	0.127777778
9.2	0.059459459
8.4	0.108108108
8.6	0.043243243
14	0.097297297
11.6	0.054054054
6.4	0.108108108
8.2	0.048648649
8	0.059459459
6.6	0.064864865
6.2	0.091891892
14.4	0.054054054
8.6	0.108108108
5.2	0.102702703
13.6	0.108108108
12.2	0.064864865
6.8	0.140540541
6.2	0.145945946
6	0.097297297
7.6	0.108108108
8.8	0.054054054];
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'diameter', 'change in diameter'};  
temp.LdL   = C2K(15);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Ague2011';

% oxygen consumption as a function of dry weight.
data.WdJO = [... % dry weight (g), O2 consumption (umol/h.g), T = 288K, my own data
7.66	8.12494172
1.31	20.20960204
1.21	15.26712966
0.84	44.76992985
2.33	12.96170869
0.20	12.31699219
1.39	15.02529227
0.51	15.07789522
5.05	3.787876271
0.58	36.09249596
1.20	10.40800781
0.36	8.838758681
2.44	12.09846089
1.65	14.5601523
1.05	13.20180742
1.73	6.4485583
5.023	7.849809245
1.411	6.172551852
0.932	7.513751333
2.634	6.064958682
2.877	11.21040798
0.578	21.9959721
1.175	15.49382203
0.75	7.485080295
2.36	9.968187235
2.579	9.575750048
1.788	10.93737315
3.769	5.858331074
2.446	16.15443714
1.61	11.27292799
0.512	16.65830612
0.839	22.03269719
6.201	5.515192598
0.97	17.95601325
2.327	4.325085124
2.742	7.362239293
1.861	13.08499295
1.855	11.53277446
1.562	6.087440209
1.122	8.390141413
7.00	4.949412354
2.254	4.135788077
2.574	6.574492252
1.341	10.04062578
4.029	7.540604058
0.764	5.424862941
2.676	9.035693847
1.395	6.154579685
4.862	4.098486826
1.493	13.09975398
1.70	6.964878893
1.00	7.196302817
3.35	6.825559701
0.563	10.52146119
1.328	10.49176213
0.341	8.728566165
6.654	4.65549723
1.751	8.727115715
3.156	3.887182394
0.284	28.1645532
1.986	7.197649169
1.304	17.02866642
1.65	8.360573123
0.34	9.380744485
3.162	9.828564108
1.099	7.231574158
1.501	2.23526908
3.071	11.99966185
0.286	24.3306213
7.706	3.407799118
1.543	6.943065457
5.49	6.136156648
1.522	5.001642576
2.288	13.00671984
2.544	6.613109277
0.719	12.6507607
6.204	6.961954269
0.912	10.575
3.599	9.793220339
1.386	7.075622294
1.744	7.476347477
1.349	14.5208572
0.597	23.67964824
5.725	3.968636931
2.095	5.242200818
0.793	7.480071158
2.155	7.132465759
1.524	8.696342393
1.192	11.12530506
0.417	18.83767986
0.335	23.125
4.064	7.298843504
2.029	5.938270084
0.679	4.978939617
4.08609	5.892705496
1.587	6.255513548
0.147	15.90136054
1.60	4.628794643
1.161	11.09387423
4.88	5.608361547
1.796	5.672024789
0.484	3.603757748
2.048	7.450395064
1.278	6.516885403
0.258	0.737315011
1.182	6.468620212
1.862	3.356910946
4.334	6.097606336
2.44	8.576879593
0.931	3.972369347
1.037	8.234088717
1.716	2.540527654];
units.WdJO   = {'g', 'umol/h.g'};  label.WdJO = {'dry weight', 'O_2 consumption'};  
temp.WdJO    = C2K(15);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
bibkey.WdJO = 'Ague2011';

%feeding rate vs size
data.WwJX = [... %wet weight (g), ingestion rate (g of prey wet weight per day) f=1, T_ref=288K my own data
27	0.330210939
41	0.12780584
10	0.442744084
18	0.339843612
5	0.259246101
15	0.819779527
12	0.673799927
4	0.200311676
69	0.715260169
28	0.301566583
11	0.04823485
53	0.023856688
7	0.115102042
17	0.398592518
4	0.067488545
20	0.307484229
26	0.85386169
61	1.015295426
37	0.524773148
14	0.280274105
29	0.668942917
63	0.732524516
24	0.343655617
46	0.764942453
19	0.276021886
12	0.183119439
7	0.304807782
46	0.679859353
9	0.266052936
40	0.613517793
56	0.652171721
25	0.452505398
3	0.141299069
7	0.257850567
12	0.249806667
7	0.182757453
24	0.514704935
71	0.283266266
42	0.828327951
5	0.049553682
20	0.516698651
21	0.041149526
10	0.135154418
7	0.156890321
22	0.456027561
22	0.425553879
13	0.086445512
79	1.232369759
39	0.450382475
8	0.364627453
13	0.43890485
12	0.256384817
6	0.239434639
8	0.293459935
67	1.231355843
14	0.158657778
7	0.236484624
77	1.134178298
56	0.91409432
15	0.392067107
6	0.310665173
9	0.156344427
13	0.356525791
22	0.718176435
67	2.149390437
55	1.345292189
39	1.045696882
30	1.113552149
36	1.02174831
32	0.842214015
53	1.361079965
46	1.521414227
24	0.732291089
119	2.298924604
49	1.352516329
62	1.225339387
12	0.010633197
96	2.446956182
14	0.248700693
61	0.808485999
19	0.67835965
58	1.627001215
55	2.499535048
91	1.66852625
44	0.72462705
119	2.514177893
71	1.894306294
44	1.290919517
4	0.199548534
58	1.790613137
24	1.22019045
115	2.886491021
64	1.768891894
51	1.477745524
35	0.927442704
32	1.177722877
108	2.231197365
36	1.008589957
34	1.011536076
112	2.406339015
64	0.978350783
17	0.428441008
32	1.480558274
45	0.935225498
23	1.153390165
61	1.145234722
97	2.451818279
96	1.430523346
11	0.331993865
67	2.347168573
64	2.121176128
33	0.801439636
40	0.582234582
31	0.743462813
23	0.835336061
26	0.901783295
141	2.468788462
41	1.044452011
65	1.930888402
32	0.948176541
90	1.87109133
70	1.997972869
27	0.81756289
47	1.112478875
42	1.095323186
32	1.230778748
128	2.494618366
36	1.283504927
133	1.76630319
91	0.937649714
36	1.065856987
21	0.695752011
18	0.38921973
43	1.458252115
57	2.138107579
67	1.860301796
55	1.78421805
39	1.437633088
61	1.995878995
53	0.725655107
46	1.357292727
24	0.828148065
9	0.360746455
9	0.403493723
104	3.413325752
79	2.318911014
58	1.840363404
117	2.350603609
97	3.292170124
73	2.47271457
77	1.948958873
31	0.707886345
22	0.875594989
21	1.128745747];
units.WwJX   = {'g', 'g/d'};  label.WwJX = {'wet weight', 'prey wet weight consumption'};  
temp.WwJX    = C2K(15);  units.temp.WwJX = 'K'; label.temp.WwJX = 'temperature';
bibkey.WwJX = 'Ague2011';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lj = 10*weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'dioecious, which means that each individual is either male or female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);  % Facts
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'HRM8'; % Cat of Life
metaData.links.id_ITIS = '157220'; % ITIS
metaData.links.id_EoL = '598481'; % Ency of Life
metaData.links.id_Wiki = 'Asterias_rubens'; % Wikipedia
metaData.links.id_ADW = 'Asterias_rubens'; % ADW
metaData.links.id_Taxo = '40936'; % Taxonomicon
metaData.links.id_WoRMS = '123776'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Asterias_rubens}}';
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
bibkey = 'BarkNich1983'; type = 'Article'; bib = [ ... 
'author = {Barker, M. F. and Nichols, D.}, ' ... 
'year = {1983}, ' ...
'title = {Reproduction, recruitment and juvenile ecology of the starfish \emph{Asterias rubens} and \emph{Marthasterias glacialis}}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {63}, ' ...
'pages = {745--765}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NichBark1984'; type = 'Article'; bib = [ ... 
'author = {Nichols, D. and Barker, M. F.}, ' ... 
'year = {1984}, ' ...
'title = {A comparative study of reproductive and nutritional periodicities in two populations of \emph{Asterias rubens} ({E}chinodermata: {A}steroidea) from the {E}nglish {C}hannel}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {64}, ' ...
'number = {471--484}, '...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GuilJoly2012'; type = 'Article'; bib = [ ... 
'author = {Guillou, M. and Joly-Turquin, G. and Leyzour, S. and Pernet, P. and Dubois, P.}, ' ... 
'year = {2012}, ' ...
'title = {Factors controlling juvenile growth and population structure of the starfish \emph{Asterias rubens} in intertidal habitats: field and experimental approaches}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {92}, ' ...
'number = {2}, '...
'pages = {367--378}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brig1983'; type = 'Phdthesis'; bib = [ ... 
'author = {Briggs, C. F.}, ' ... 
'year = {1983}, ' ...
'title = {A study of some sublittoral populations of \emph{Asterias rubens} and their prey}, ' ...
'school = {University of Liverpool}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaraFlya2001'; type = 'Article'; bib = [ ... 
'author = {Saranchova, O. L. and Flyachinskaya, L. P.}, ' ... 
'year = {2001}, ' ...
'title = {The Influence of Salinity on Early Ontogeny of the Mussel \emph{Mytilus edulis} and the Starfish \emph{Asterias rubens} from the {W}hite {S}ea}, ' ...
'journal = {Biol. Morya}, ' ...
'volume = {27}, ' ...
'number = {2}, '...
'pages = {87--93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smit1940'; type = 'Article'; bib = [ ... 
'author = {Smith, G. F.}, ' ... 
'year = {1940}, ' ...
'title = {Factors limiting distribution and size of the starfish}, ' ...
'journal = {J. Fish. Res. Bd. Canada}, ' ...
'volume = {5}, ' ...
'pages = {84--103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ague2011'; type = 'Misc'; bib = ...
'note = {Own data}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LariWest2011'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Larink, O. and Westheide, W.}, ' ...
'year = {2011}, ' ...
'title  = {Coastal plankton}, ' ...
'publisher = {Dr. Friedrich Pfeil}, ' ...
'address = {Munchen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

