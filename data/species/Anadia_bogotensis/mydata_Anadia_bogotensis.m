function [data, auxData, metaData, txtData, weights] = mydata_Anadia_bogotensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Gymnophthalmidae';
metaData.species    = 'Anadia_bogotensis'; 
metaData.species_en = 'Bogota anadia'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tL'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 16];

%% set data
% zero-variate data

data.am = 2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CaldRami2018';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.49;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'CaldRami2018';
data.Lp  = 3.8;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'CaldRami2018';
data.Li  = 6.12;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'CaldRami2018';  
data.Lim  = 7.67;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'CaldRami2018';  

data.Wwb = 0.31;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'CaldRami2018';
data.Wwp = 1.8;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'CaldRami2018';
data.Wwi = 3.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'CaldRami2018';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'CaldRami2018';   
  temp.Ri = C2K(14);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assumed 1 young per clutch; CaldRami2018: 3  clutches each yr';

% univariate data
% time -length data
data.tL = [ ... % time since birth (wk), SVL  (cm)
0.714	2.404
0.794	2.202
0.873	2.970
0.873	2.919
0.873	2.091
1.032	2.566
1.032	2.515
1.111	2.768
1.190	2.646
1.349	2.293
1.825	2.818
1.825	2.879
1.984	2.404
1.984	2.556
2.143	2.192
2.143	2.303
2.143	3.131
2.222	3.000
2.381	2.697
3.016	2.889
3.016	2.808
3.016	2.586
3.016	2.505
3.016	2.404
3.016	2.273
3.016	2.202
3.095	2.687
3.254	3.172
3.254	3.101
3.254	2.960
3.730	3.091
3.730	3.293
3.810	2.232
3.810	2.515
3.889	2.616
3.889	2.697
3.889	2.808
3.889	2.909
3.889	3.000
4.127	2.303
4.762	3.485
4.841	3.384
4.841	2.697
4.841	2.626
4.841	2.515
4.921	2.354
5.079	3.283
5.079	3.162
5.079	3.051
5.079	3.000
5.159	2.828
5.873	3.051
5.873	3.121
5.873	3.202
5.873	3.333
5.873	3.455
5.952	2.727
5.952	2.919
6.032	2.596
6.032	3.535
6.032	3.606
6.111	2.505
6.587	3.091
6.746	3.717
6.905	2.919
6.905	2.798
6.984	3.596
6.984	3.404
6.984	2.606
6.984	2.535
7.063	3.303
7.222	3.030
7.302	3.192
7.698	3.525
7.857	3.121
7.937	2.980
7.937	3.202
7.937	3.283
7.937	3.404
8.016	3.727
8.095	2.768
8.333	2.596
8.889	2.616
8.968	2.707
9.048	3.889
9.048	3.788
9.048	3.576
9.048	2.990
9.048	2.919
9.127	3.505
9.127	3.404
9.127	3.303
9.127	3.222
9.921	3.172
9.921	3.283
10.079	2.606
10.079	2.798
10.079	3.475
10.079	3.566
10.159	3.010
10.159	3.404
10.238	3.131
10.238	3.909
10.714	3.152
10.873	3.869
10.873	4.010
10.952	2.838
10.952	3.313
10.952	3.404
10.952	3.566
10.952	3.697
11.111	2.697
11.349	3.475
11.587	2.717
11.667	3.222
11.746	3.697
11.905	3.879
11.905	3.404
11.984	4.051
12.143	3.586
12.143	3.465
12.778	3.545
12.937	3.626
12.937	3.798
12.937	3.879
13.016	2.899
13.016	3.323
13.095	4.101
13.730	3.040
13.889	4.091
13.889	3.980
13.968	3.828
13.968	3.606
13.968	3.384
13.968	3.333
14.762	3.081
14.921	3.889
14.921	4.010
14.921	4.091
15.000	3.535
15.000	3.616
15.079	3.374
15.079	3.727
15.079	3.798
15.635	3.182
15.873	4.202
15.873	4.061
15.873	3.960
15.873	3.848
15.952	3.798
15.952	3.687
15.952	3.626
16.032	3.556
16.587	3.303
16.746	4.192
16.825	3.818
16.905	3.687
16.905	4.091
16.984	3.990
17.143	3.515
17.778	3.798
17.778	3.606
17.857	4.091
17.857	3.990
17.857	3.889
17.937	4.172
18.095	4.303
18.254	3.394
18.889	3.566
18.968	4.313
19.048	4.172
19.127	4.444
19.365	3.929
19.365	4.000
19.365	4.091
19.762	4.384
19.762	4.313
19.762	3.707
19.762	3.606
19.921	4.495
19.921	4.111
19.921	4.010
20.000	4.212
20.873	4.475
21.032	4.616
21.111	3.727
21.111	3.838
21.111	4.091
21.111	4.192
21.111	4.313
21.111	4.374
21.667	4.737
21.825	4.465
21.825	4.091
21.905	4.646
21.984	3.889
21.984	3.788
22.143	4.293
22.778	4.606
22.937	4.687
22.937	4.485
22.937	4.414
22.937	4.232
22.937	4.051
22.937	3.929
23.175	4.778
23.651	4.283
23.730	4.596
23.810	4.495
23.810	4.687
23.889	4.091
23.889	4.414
23.889	4.808
23.968	4.899
24.841	4.374
25.000	5.000
25.000	4.859
25.000	4.576
25.159	4.717
25.794	4.717
25.873	4.212
25.873	4.525
25.873	5.111
25.952	4.899
26.111	4.778
26.746	4.899
26.746	4.778
26.905	5.030
26.905	4.616
26.905	4.303
26.984	5.182
28.016	4.374
28.016	5.020
28.016	4.848
28.095	4.646
28.730	4.717
28.889	4.899
28.889	4.505
28.968	5.111
28.968	5.020
29.921	4.495
30.000	5.222
30.000	5.384
30.079	4.788
30.079	5.010
30.794	5.303
30.873	4.586
30.952	4.919
31.111	5.495
31.111	5.152
31.111	5.101
31.825	5.111
31.825	5.303
31.905	4.697
31.984	5.384
32.778	4.798
32.857	5.343
32.857	5.202
32.937	5.313
33.175	5.465
33.730	5.566
33.968	4.919
34.048	5.313
34.048	5.465
34.683	5.677
34.841	5.586
34.841	5.465
34.841	5.394
35.952	5.586
36.825	5.697
37.937	5.788
37.937	5.717
38.651	5.990
39.127	5.768
39.841	6.192
40.079	5.869
40.873	6.303
41.111	5.949];
data.tL(:,1) = 7 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CaldRami2018';

% time-weight
data.tW = [ ... % time since birth (wk),  wet weight (0.1 g)
0.755	2.615
1.090	7.103
1.342	6.311
1.342	4.550
1.426	3.582
1.929	2.569
2.096	3.581
2.180	4.550
3.019	4.549
3.019	2.524
3.690	3.624
3.690	2.523
3.857	5.560
4.109	4.547
4.109	3.623
4.780	3.622
4.864	5.603
4.948	4.546
4.948	2.610
5.870	2.609
5.954	3.621
6.122	4.545
6.205	5.513
7.044	2.608
7.128	5.468
7.212	6.436
7.212	3.620
7.966	4.587
8.134	5.423
8.134	3.575
8.134	2.607
8.889	5.422
8.889	2.474
8.973	4.630
9.140	6.434
9.140	3.574
9.811	4.629
9.979	3.573
10.147	7.445
10.147	6.477
10.147	2.472
10.231	5.421
10.985	3.616
11.153	7.400
11.153	6.476
11.153	4.628
11.405	5.420
11.908	7.399
11.992	6.475
11.992	4.627
12.159	5.419
12.243	3.658
12.914	6.474
12.998	5.506
12.998	4.626
13.166	7.354
13.836	6.473
13.836	5.505
13.836	4.625
13.836	3.701
14.004	8.409
14.004	7.485
14.759	6.472
14.843	7.484
14.843	5.504
14.843	3.699
15.010	9.332
15.010	8.408
15.010	4.623
15.849	3.654
15.933	9.419
15.933	7.395
16.017	5.547
16.017	4.534
16.101	8.407
16.184	10.299
16.855	4.533
16.855	3.609
16.939	10.299
16.939	9.462
17.023	7.394
17.023	6.514
17.107	5.501
17.191	8.406
17.778	5.457
17.778	3.564
17.862	4.620
17.945	9.461
18.197	8.361
18.281	10.297
18.952	6.467
19.036	8.360
19.036	3.563
19.119	9.416
19.203	11.308
19.203	10.252
19.287	5.455
19.958	9.371
20.042	6.466
20.042	4.486
20.126	12.187
20.126	7.434
20.294	11.307
20.294	8.402
20.377	10.251
20.881	7.434
20.881	5.541
20.964	11.306
21.048	13.199
21.048	9.326
21.132	6.465
21.216	10.206
21.887	11.305
21.887	6.464
22.138	13.197
22.138	10.205
22.138	8.400
22.138	7.476
22.138	5.540
22.138	4.704
22.222	12.185
22.222	9.193
22.809	6.463
22.977	11.216
22.977	10.248
23.061	8.399
23.145	14.077
23.145	7.387
23.229	12.184
23.899	11.259
23.899	13.284
23.899	10.247
23.899	7.430
24.151	9.366
24.151	8.354
24.151	6.418
24.906	7.429
24.990	13.238
25.157	9.277
25.241	8.309
25.325	11.258
25.744	7.428
25.996	9.188
25.996	10.465
26.164	12.181
26.247	8.396
26.834	12.312
26.834	11.212
26.834	9.451
26.918	7.427
27.170	13.148
27.925	12.179
28.008	10.374
28.260	8.394
28.428	13.279
28.931	11.166
29.099	14.158
29.182	9.317
29.266	12.309
29.769	8.436
29.937	13.101
29.937	14.113
29.937	15.081
30.189	11.340
30.273	12.220
30.776	12.308
30.943	13.100
30.943	14.112
30.943	15.036
31.027	10.239
31.111	16.048
31.950	12.218
31.950	13.319
31.950	15.035
32.034	10.370
32.453	16.091
32.872	13.934
33.040	11.293
33.124	16.222
33.459	10.368
34.046	11.292
34.130	15.253
34.214	17.057
34.298	14.152
34.298	10.367
34.801	11.291
34.969	16.132
35.052	17.936
35.220	13.227
36.059	11.290
36.143	17.935
36.813	18.683
36.897	12.345
37.987	19.914
38.239	13.136
38.994	14.015
39.245	19.780
40.335	19.999
40.419	13.926
41.006	20.834
41.006	15.157];
data.tW(:,1) = 7 * data.tW(:,1);
data.tW(:,2) = data.tW(:,2)/ 10;
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(14);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'CaldRami2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'females can be produced at  cool (26-29 C) and very warm  (34-35 C) temperatures; males at intermediate temperatures (31-33 C).';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DCR3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '453204'; % Ency of Life
metaData.links.id_Wiki = 'Anadia_bogotensis'; % Wikipedia
metaData.links.id_ADW = 'Anadia_bogotensis'; % ADW
metaData.links.id_Taxo = '642314'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anadia&species=bogotensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anadia_(genus)}}';
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
bibkey = 'CaldRami2018'; type = 'Article'; bib = [ ... 
'author = {Marta Lucia Calder\''{o}n-Espinosa and Ang\''{e}lica Ram\''{i}rez and Adriana Jerez}, ' ... 
'year = {2018}, ' ...
'title = {GROWTH PATTERN OF THE TROPICAL HIGHLAND GYMNOPTHALMID LIZARD \emph{Anadia bogotensis} IN CAPTIVITY CONDITIONS}, ' ...
'pages = {307-310}, ' ...
'volume = {23(3)}, ' ...
'journal = {Acta biol. Colomb.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

