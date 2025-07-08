function [data, auxData, metaData, txtData, weights] = mydata_Terrapene_ornata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Terrapene_ornata'; 
metaData.species_en = 'Ornate box turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 29];

%% set data
% zero-variate data

data.ab = 63;     units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'AnAge';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ADW: 50 d';
data.tp = 2.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'ADW gives 8 yr';
data.am = 40*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';         bibkey.Lb  = 'SkorAnde2021'; 
data.Li  = 12;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'ADW';
data.Lim  = 11.6;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'ADW';

data.Wwi = 340; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'ADW';
  comment.Wwi = '198 to 538 g';

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'ADW: 1-8 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
0.000	3.352
0.000	3.127
0.000	3.030
0.000	2.837
0.000	2.741
0.000	2.677
0.000	2.484
0.044	3.898
0.961	2.774
0.992	4.221
0.992	4.092
0.993	3.964
0.993	3.803
0.994	3.642
0.994	3.514
0.995	3.449
0.995	3.385
0.995	3.256
0.996	3.160
0.996	3.064
1.956	4.608
1.957	4.222
1.958	4.094
1.958	3.997
1.959	3.836
1.995	3.708
1.995	3.515
2.994	4.384
2.994	4.255
3.062	5.349
3.062	5.220
3.085	8.725
3.959	4.417
4.990	6.155
7.019	8.536
7.873	9.695
7.916	7.637
7.919	6.897
7.926	5.000
7.942	10.595
8.906	10.886
8.910	9.824
8.913	8.956
8.947	9.342
9.869	11.497
9.870	11.144
9.874	10.018
9.956	7.221
10.939	12.206
10.952	8.573
10.981	10.502
10.982	10.277
11.919	8.123
11.920	7.834
11.981	10.889
11.985	9.667
11.986	9.635
12.018	10.632
12.019	10.310
12.906	12.272
12.911	10.922
12.911	10.729
12.912	10.665
12.912	10.568
12.912	10.504
12.913	10.375
12.913	10.311
12.913	10.150
12.913	10.150
12.914	9.989
12.981	11.244
13.879	10.087
13.912	10.827
13.913	10.505
13.945	11.727
13.945	11.630
13.945	11.534
13.946	11.373
13.946	11.277
13.947	11.148
13.947	11.084
13.948	10.923
14.844	10.313
14.845	10.056
14.845	9.895
14.878	10.699
14.878	10.603
14.879	10.474
14.879	10.410
14.882	9.574
14.911	11.567
14.911	11.439
14.912	11.246
14.912	11.181
14.913	10.988
14.913	10.892
14.946	11.824
15.807	10.764
15.808	10.668
15.808	10.604
15.808	10.475
15.809	10.314
15.809	10.250
15.911	11.858
15.912	11.633
15.912	11.536
15.912	11.472
15.913	11.279
15.913	11.215
15.913	11.118
15.914	10.893
15.917	9.993
15.920	9.189
15.927	7.453
16.919	9.769
16.930	6.778
16.949	11.441
16.951	10.894
16.952	10.733
16.952	10.669
16.952	10.540
16.953	10.444
16.953	10.348
16.953	10.283
16.959	8.611
16.990	10.155
17.878	11.731
17.879	11.377
17.881	10.959
17.917	10.767
17.918	10.606
17.918	10.606
17.918	10.445
17.925	8.516
17.954	10.349
17.983	12.214
17.990	10.252
17.991	10.156
17.991	10.124
17.991	9.995
17.995	8.870
18.880	11.507
18.880	11.411
18.881	11.250
18.881	11.153
18.882	11.057
18.882	10.961
18.882	10.864
18.883	10.768
18.883	10.703
18.883	10.575
18.883	10.510
18.884	10.285
18.885	10.060
18.995	9.417
19.882	11.315
19.882	11.219
19.882	11.122
19.883	11.026
19.883	10.897
19.884	10.801
19.884	10.704
19.884	10.608
19.917	11.573
19.917	11.476
19.917	11.412
19.921	10.254
20.919	11.156
20.921	10.770
20.921	10.673
20.922	10.513
20.922	10.416
20.922	10.352
20.923	10.191
20.923	10.062
21.846	11.896
21.847	11.768
21.848	11.542
21.884	11.317
21.885	11.092
21.885	11.060
21.886	10.899
21.886	10.803
21.886	10.674
21.887	10.578
21.887	10.417
21.888	10.353
21.926	9.742
21.959	10.256
21.960	10.160
21.960	10.064
21.960	9.999
21.961	9.903
22.884	11.576
22.885	11.415
22.919	11.833
22.921	11.254
22.922	11.158
22.922	11.061
22.922	10.997
22.923	10.868
22.924	10.611
22.925	10.322
22.925	10.129
23.887	11.223
23.887	11.223
23.889	10.644
23.920	11.995
23.921	11.577
23.922	11.448
23.962	10.226
23.962	10.226
23.964	9.583
24.958	11.546
24.959	11.353
24.959	11.256
24.960	11.160
24.960	11.064
24.960	10.967
24.961	10.806
24.962	10.549
24.963	10.227
24.964	10.035
25.851	11.868
25.856	10.421
25.892	10.582
25.925	11.193
26.891	11.033
26.892	10.712
26.893	10.487
26.930	10.197
27.856	11.324
27.857	10.842
27.862	9.427
27.894	10.584
27.895	10.359
28.894	11.003];
% make sure that times are different
n = size(data.tL_f,1); for i=2:n; if data.tL_f(i,1) <= data.tL_f(i-1,1); data.tL_f(i,1) = data.tL_f(i-1,1) + 1e-3; end; end; 
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SkorAnde2021';
comment.tL_f = 'Data for females from Hawkeye Wildlife Area in eastern Iowa in 1993 and between 2013-2015';
% 
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
0.000	2.692
0.000	2.874
0.000	2.984
0.000	3.057
0.000	3.203
0.000	3.860
0.932	4.151
0.932	4.005
0.932	3.932
1.014	3.822
1.014	3.676
1.014	3.603
1.014	3.384
1.014	3.275
1.014	3.165
1.014	3.056
1.014	2.800
2.027	4.076
2.027	4.113
2.027	4.259
2.027	4.660
2.068	3.565
2.068	3.894
2.878	5.316
2.959	8.710
2.959	4.075
3.041	4.294
3.932	4.402
4.986	6.044
5.068	8.160
5.959	7.466
6.041	7.794
6.041	7.940
6.041	8.488
6.973	6.443
7.014	11.917
8.959	8.776
8.959	7.535
9.041	5.564
9.892	11.293
9.932	10.089
9.932	10.454
10.014	6.512
10.986	9.978
11.027	10.379
11.027	10.671
11.919	9.247
12.000	10.378
12.000	10.780
12.000	10.926
12.000	10.999
12.041	11.363
12.973	10.121
12.973	10.304
12.973	10.669
13.014	11.399
13.054	11.070
13.054	11.143
13.054	11.180
13.946	12.055
13.986	9.901
13.986	11.909
14.027	10.376
14.027	10.595
14.027	10.741
14.027	10.850
14.027	10.996
14.027	11.033
14.027	11.106
14.027	11.142
14.027	11.288
14.027	11.361
14.027	11.580
14.919	11.506
14.919	11.250
14.919	11.177
14.919	11.141
14.919	11.031
14.919	10.885
14.919	10.849
14.919	10.739
14.959	10.666
15.000	12.126
15.000	10.520
15.000	10.484
15.000	10.374
15.000	10.338
15.000	10.192
15.000	9.681
15.041	10.082
15.041	9.936
15.932	11.760
15.932	11.541
15.932	11.432
15.932	11.395
15.932	11.213
15.932	11.103
15.932	10.957
15.932	10.811
15.932	10.702
15.973	10.556
15.973	10.519
15.973	10.446
15.973	10.300
16.865	10.920
16.865	11.029
16.865	11.139
16.905	11.175
16.905	11.285
16.905	11.358
16.946	9.861
16.946	9.971
16.946	10.409
16.946	11.503
16.986	10.737
16.986	11.832
17.027	10.481
17.068	11.649
17.919	11.794
17.919	11.575
17.959	11.137
17.959	6.831
18.000	11.028
18.041	10.918
18.041	10.772
18.041	10.699
18.041	10.590
18.041	10.553
18.041	10.480
18.041	10.298
18.041	10.006
18.041	9.276
19.014	9.676
19.014	10.370
19.014	10.844
19.014	10.917
19.014	11.209
19.014	11.282
19.014	11.391
19.014	11.464
19.014	11.464
19.014	11.647
19.014	11.866
19.054	10.625
19.054	10.771
19.054	11.063
19.986	10.551
19.986	10.624
19.986	10.806
19.986	10.916
19.986	11.025
19.986	11.171
19.986	11.281
19.986	11.427
19.986	11.828
20.027	10.332
20.959	10.842
20.959	11.024
20.959	11.097
21.000	10.659
21.000	11.243
21.000	11.316
21.000	11.426
21.000	11.535
21.000	11.645
21.000	11.790
21.041	10.367
21.973	12.556
21.973	12.154
22.014	11.826
22.014	11.497
22.014	11.388
22.014	11.388
22.014	10.402
22.054	11.278
22.095	10.950
22.095	10.767
22.986	10.985
22.986	11.058
22.986	11.131
22.986	11.204
22.986	11.241
23.027	10.511
23.027	10.693
23.027	10.839
23.027	11.460
23.027	11.569
23.027	11.788
23.959	11.677
23.959	11.385
23.959	11.312
24.000	10.290
24.041	11.239
24.041	11.130
24.041	10.984
24.041	10.692
24.041	10.400
24.041	9.852
25.014	10.873
25.014	11.275
25.014	11.603
25.054	10.654
25.095	10.508
25.946	11.711
25.986	10.434
26.027	11.054
26.027	10.945
26.027	10.835
26.027	10.142
26.108	11.200
26.959	11.929
27.000	11.236
27.000	11.528
27.041	10.469
27.041	11.126
27.932	10.760
27.932	10.651
27.973	12.439
28.095	11.198
29.919	10.356
29.959	10.612
29.959	10.977
30.000	11.159
30.000	11.378
30.000	11.415
30.000	11.561
30.973	10.683
30.973	11.742
30.973	11.924];
% make sure that times are different
n = size(data.tL_m,1); for i=2:n; if data.tL_m(i,1) <= data.tL_m(i-1,1); data.tL_m(i,1) = data.tL_m(i-1,1) + 1e-3; end; end; 
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SkorAnde2021';
comment.tL_m = 'Data for males from Hawkeye Wildlife Area in eastern Iowa in 1993 and between 2013-2015';

data.LWw = [ ... % caparace length (cm), wet weight (g)
2.530	4.340
2.590	4.336
2.614	5.976
2.639	4.880
2.735	5.420
2.783	5.964
2.819	4.867
2.867	7.599
2.916	5.955
2.952	8.141
3.024	7.589
3.036	7.041
3.108	7.583
3.145	9.222
3.229	7.575
3.325	10.303
3.458	8.653
3.470	10.293
3.578	10.286
3.807	13.553
3.952	12.449
4.024	14.085
4.072	21.193
4.133	14.077
4.169	23.375
4.386	19.531
4.542	23.349
4.566	20.065
5.349	23.841
5.530	54.463
5.627	40.233
6.036	63.728
6.084	44.031
6.361	53.859
6.446	76.282
6.482	69.168
6.506	73.543
6.747	72.980
6.759	73.526
6.843	68.050
6.988	89.374
6.988	98.674
7.072	84.445
7.072	92.651
7.133	99.211
7.145	80.064
7.193	75.684
7.265	83.338
7.277	107.954
7.277	97.013
7.289	87.713
7.398	93.723
7.410	87.704
7.422	97.550
7.446	102.472
7.518	109.579
7.566	112.858
7.590	121.062
7.590	93.710
7.711	109.019
7.771	98.621
7.831	135.816
7.928	119.398
8.145	116.101
8.205	132.508
8.265	139.615
8.265	121.016
8.325	133.047
8.373	139.061
8.458	148.902
8.470	123.737
8.494	147.805
8.530	126.468
8.627	145.608
8.735	172.406
8.735	152.165
8.735	134.113
8.916	146.135
8.928	153.793
8.940	158.169
8.988	184.424
9.012	144.488
9.120	186.056
9.229	172.919
9.265	170.182
9.458	213.932
9.506	194.235
9.651	196.960
9.711	118.729
9.928	205.694
9.928	189.830
10.205	241.233
10.325	216.061
10.470	249.968
10.627	235.187];
units.LWw  = {'cm', 'g'};  label.LWw = {'carapace length','wet weight'};  
bibkey.LWw = 'SkorAnde2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'tL data suggest that food was varying, which is taken into account';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Males are born at T = < 28 C, females at T > 29 C';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7C3M7'; % Cat of Life
metaData.links.id_ITIS = '173778'; % ITIS
metaData.links.id_EoL = '1055219'; % Ency of Life
metaData.links.id_Wiki = 'Terrapene_ornata'; % Wikipedia
metaData.links.id_ADW = 'Terrapene_ornata'; % ADW
metaData.links.id_Taxo = '48642'; % Taxonomicon
metaData.links.id_WoRMS = '1287522'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Terrapene&species=ornata'; % ReptileDB
metaData.links.id_AnAge = 'Terrapene_ornata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Terrapene_ornata}}';
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
bibkey = 'SkorAnde2021'; type = 'Article'; bib = [ ... 
'author = {Tyler Skorczewski and Brandon Andersen}, ' ... 
'year = {2021}, ' ...
'title = {A Dynamic Energy Budget Model of Ornate Box Turtle Shell Growth}, ' ...
'journal = {Spora}, ' ...
'volume = {7(2)}, ' ...
'pages = {8-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Terrapene_ornata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Terrapene_ornata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1242411}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

