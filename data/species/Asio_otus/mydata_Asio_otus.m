function [data, auxData, metaData, txtData, weights] = mydata_Asio_otus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Strigiformes'; 
metaData.family     = 'Strigidae';
metaData.species    = 'Asio_otus'; 
metaData.species_en = 'Long-eared owl'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 27;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 22.1;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SeidFloc2006';   
  temp.tx = C2K(40.2); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '23 to 37 d';
data.tp = 66.3;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '23 to 37 d';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'AnAge';
  temp.tR = C2K(40.2); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27.8*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 17.4;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwi = 249.7;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 178 to 435 g';

data.Ri  = 4.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), ln wet weight (ln g)
0.933	3.111
0.995	2.851
0.995	2.901
0.995	2.969
0.995	3.025
1.057	2.727
1.368	3.105
1.928	3.303
1.928	3.347
1.928	3.502
1.990	3.149
1.990	3.198
2.052	3.000
2.052	3.049
2.052	3.087
2.052	3.105
2.425	3.533
2.488	3.310
2.488	3.558
2.488	3.700
2.550	3.347
2.550	3.409
2.985	3.359
2.985	3.409
2.985	3.508
2.985	3.756
3.483	3.787
3.856	3.743
3.980	3.471
3.980	3.650
3.980	3.694
3.980	4.140
4.042	3.954
4.104	3.818
4.478	3.830
4.478	4.115
4.478	4.276
4.851	3.793
4.851	3.898
4.851	3.991
4.913	3.929
4.913	4.065
4.975	4.016
4.975	4.214
5.037	3.737
5.473	4.208
5.473	4.158
5.473	4.270
5.473	4.338
5.473	4.375
5.473	4.431
5.970	4.456
6.032	4.072
6.095	4.202
6.343	4.859
6.343	4.902
6.468	4.592
6.965	4.177
6.965	4.233
6.965	4.270
6.965	4.350
6.965	4.394
6.965	4.555
6.965	4.592
6.965	4.642
6.965	4.759
7.338	4.505
7.463	4.735
7.463	4.778
7.463	4.933
7.525	4.648
7.960	4.437
7.960	4.462
7.960	4.524
7.960	4.617
8.022	4.263
8.022	4.654
8.022	4.685
8.458	4.716
8.458	4.741
8.458	4.790
8.458	4.834
8.458	4.883
8.458	4.914
8.458	4.964
8.458	5.044
8.520	4.549
8.955	4.195
8.955	4.796
9.080	4.573
9.453	5.261
9.453	5.305
9.515	4.920
9.888	4.821
9.888	4.877
9.888	5.007
9.888	5.044
10.012	4.555
10.075	4.740
10.448	5.205
10.448	5.242
10.448	5.280
10.448	4.877
10.448	4.846
10.572	5.379
10.572	5.032
10.697	4.709
10.945	4.362
10.945	5.056
11.007	4.809
11.007	4.840
11.007	4.988
11.070	4.883
11.443	5.125
11.443	4.976
11.443	4.945
11.505	5.193
11.505	5.242
11.505	5.286
11.505	5.335
11.505	5.404
11.816	5.106
11.940	4.796
11.940	4.945
12.065	5.007
12.251	5.149
12.500	5.032
12.500	5.075
12.500	5.162
12.500	5.199
12.500	5.286
12.500	5.348
12.749	5.149
12.873	5.224
12.873	5.341
12.935	5.118
13.060	4.988
13.371	5.050
13.433	5.360
13.495	5.273
13.619	5.205
13.619	5.143
13.682	5.428
13.930	4.672
13.930	5.248
13.993	5.155
14.303	5.261
14.366	5.155
14.366	5.397
14.428	5.416
14.490	5.347
14.490	5.484
14.801	5.155
14.925	5.205
14.925	5.254
14.988	5.310
15.050	5.428
15.112	5.341
15.174	5.155
15.174	4.988
15.609	5.149
15.609	5.316
15.609	5.366
15.609	5.403
15.920	5.229
15.920	5.335
15.983	5.260
15.983	5.391
16.045	5.459
16.045	5.502
16.418	5.198
16.418	5.254
16.418	5.502
16.418	5.527
16.418	5.552
16.853	5.236
16.915	5.378
16.978	5.428
17.164	4.901
17.413	5.335
17.413	5.397
17.413	5.459
17.413	5.502
17.413	5.527
17.413	5.564
18.035	5.589
18.097	5.378
18.097	5.428
18.284	5.415
18.408	5.458
18.408	5.502
18.470	5.595
18.843	5.353
18.905	5.396
18.905	5.421
18.968	5.502
18.968	5.545
19.341	5.223
19.465	5.260
19.465	5.378
19.527	5.632
19.527	5.706
19.900	5.192
19.900	5.390
19.900	5.458
19.900	5.489
19.900	5.539
20.336	5.427
20.460	5.526
20.460	5.570
20.460	5.601
20.460	5.626
20.958	5.440
21.020	5.514
21.393	5.452
21.455	5.483
21.455	5.520
21.455	5.563
21.891	5.377
22.015	5.508
22.015	5.551
22.015	5.594
22.015	5.613
22.264	5.514
22.450	5.384
22.450	5.427
22.512	5.638
22.575	5.681
22.637	5.532
22.823	5.501
22.886	5.402
22.948	5.557
22.948	5.619
23.383	5.600
23.445	5.675
23.507	5.532
23.632	5.520
23.881	5.638
23.943	5.495
23.943	5.588
24.316	5.526
24.440	5.582
24.565	5.631
24.876	5.718
24.938	5.482
25.000	5.551
25.000	5.582
25.373	5.693
25.435	5.402
25.498	5.470
25.498	5.569
25.498	5.780
25.560	5.532
25.560	5.613
25.808	5.569
25.871	5.526
25.995	5.643
26.430	5.594
26.617	5.650
26.866	5.650
26.928	5.687
26.990	5.457
27.052	5.749
27.114	5.557
27.363	5.532
27.425	5.674
27.550	5.600
27.861	5.668
27.861	5.538
27.861	5.476
27.923	5.749
28.420	5.494
28.607	5.786
28.918	5.730
28.980	5.525
29.104	5.649
29.353	5.538
29.478	5.612
29.478	5.674
29.478	5.711
29.540	5.742
29.913	5.649
30.037	5.705
30.037	5.482
30.473	5.600
30.473	5.668
30.535	5.519
30.846	5.624
31.095	5.674
31.405	5.351
31.405	5.488
31.468	5.599
32.090	5.624
32.090	5.698
32.525	5.816
32.587	5.773
33.022	5.531
33.396	5.587
34.017	5.847
34.080	5.642
34.950	5.624
35.012	5.766
35.572	5.810
36.007	5.549
36.443	5.450
37.376	5.524
38.557	5.766
41.542	5.691];  
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8; end; end
data.tW(:,2) = exp(data.tW(:,2)); % remove log transformation
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SeidFloc2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6866L'; % Cat of Life
metaData.links.id_ITIS = '177932'; % ITIS
metaData.links.id_EoL = '45510753'; % Ency of Life
metaData.links.id_Wiki = 'Asio_otus'; % Wikipedia
metaData.links.id_ADW = 'Asio_otus'; % ADW
metaData.links.id_Taxo = '54770'; % Taxonomicon
metaData.links.id_WoRMS = '1476314'; % WoRMS
metaData.links.id_avibase = 'FC4D40D2D5CEA6BE'; % avibase
metaData.links.id_birdlife = 'northern-long-eared-owl-asio-otus'; % birdlife
metaData.links.id_AnAge = 'Asio_otus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Asio_otus}}';
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
bibkey = 'SeidFloc2006'; type = 'Article'; bib = [ ... 
'author = {M. T. Seidensticker and D. T. T. Flockhart and D. W. Holt and K. Gray}, ' ... 
'year = {2006}, ' ...
'title = {GROWTH AND PLUMAGE DEVELOPMENT OF NESTLING LONG-EARED OWLS}, ' ...
'journal = {The Condor}, ' ...
'volume = {108}, ' ...
'pages = {981-985}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Asio_otus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

