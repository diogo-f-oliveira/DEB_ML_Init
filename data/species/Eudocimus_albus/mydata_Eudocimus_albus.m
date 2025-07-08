function [data, auxData, metaData, txtData, weights] = mydata_Eudocimus_albus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Threskiornithidae';
metaData.species    = 'Eudocimus_albus'; 
metaData.species_en = 'White ibis'; 

metaData.ecoCode.climate = {'Am','Cwa'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iTs', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 22;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 35;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '28-35';
data.tp = 105;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '28-35';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27.7*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 46;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';             bibkey.Ww0 = 'avibase';
data.Wwb = 36.3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'AnAge';
data.Wwi = 764;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 1036;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
1.121	44.995
2.523	44.934
3.323	44.899
3.936	69.122
5.152	100.247
8.173	138.223
8.260	110.505
10.100	190.102
10.184	155.457
12.012	210.805
13.087	155.331
13.254	297.356
13.751	290.406
14.349	283.452
14.467	321.553
15.017	214.139
16.480	345.715
16.506	401.141
17.055	290.263
18.207	397.603
18.229	446.101
19.080	338.674
20.539	459.858
20.558	501.428
21.107	390.549
22.246	470.177
22.276	535.995
22.756	490.940
23.242	459.741
24.400	580.938
24.461	497.795
25.177	528.941
26.192	560.075
26.210	598.181
27.266	501.137
27.481	532.306
28.001	573.854
28.633	639.646
29.077	518.380
29.098	563.414
29.216	601.515
30.218	604.936
30.235	639.577
31.102	566.791
31.291	542.533
32.411	584.055
32.431	625.625
33.104	566.704
33.114	587.489
33.430	622.117
34.235	629.011
34.320	597.829
34.453	667.108
35.228	611.647
35.317	587.394
36.135	625.464
36.156	670.498
36.227	608.140
36.450	656.629
37.137	625.421
37.247	646.202
37.524	597.691
37.955	663.492
38.127	601.129
38.136	621.914
39.136	618.406
39.154	656.512
39.963	673.798
40.148	642.612
41.066	677.214
41.142	625.248
42.350	639.052
42.359	659.837
42.371	684.086
43.979	697.873
44.155	645.902
45.859	649.293
45.978	690.858
47.900	732.345
47.981	690.771
48.825	784.268
49.110	749.614
52.712	745.994
52.859	846.449
54.907	728.578
55.143	804.780
56.031	777.028
56.057	832.454
59.936	776.859
59.983	877.319
61.933	766.380
62.077	859.907
63.245	787.108
67.009	915.121
67.125	734.977
68.868	821.507
68.886	859.612
70.055	790.277
70.092	869.952
74.099	873.243
74.224	713.884
76.116	904.334
76.149	762.300];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SantMcDo1990';
comment.tW_f = 'data for female, handreared';
%
data.tW_m = [ ... % time since birth (d), weight (g)
1.319	41.522
2.024	48.420
3.227	51.832
3.837	72.591
4.328	51.784
5.334	62.133
6.154	103.668
6.164	124.453
6.833	55.140
6.860	114.030
7.146	82.840
8.204	204.041
8.291	176.324
9.363	113.922
9.371	131.243
10.022	238.605
10.132	259.385
10.352	300.946
11.004	196.992
11.094	176.202
11.266	113.839
11.285	155.409
12.135	259.298
12.146	283.547
12.264	321.648
12.277	349.361
12.406	411.711
13.008	200.369
13.032	252.331
14.179	349.279
14.186	363.136
14.207	408.169
14.218	432.418
14.326	449.735
15.167	321.523
15.182	352.700
15.240	262.628
15.833	460.062
16.266	529.327
16.272	543.184
16.971	324.909
17.092	369.938
17.412	411.495
17.435	459.993
18.288	570.810
18.299	595.059
18.451	491.126
18.465	522.304
19.009	401.033
19.216	414.881
19.231	446.058
19.445	477.226
20.103	598.445
20.125	646.943
20.195	581.120
20.318	629.614
21.169	522.187
21.185	556.828
21.348	477.144
22.139	671.105
22.152	698.818
22.220	629.531
23.011	608.712
23.094	570.602
23.100	584.459
24.229	643.301
24.247	681.407
24.264	719.512
24.284	761.082
25.132	646.726
25.203	584.368
26.070	726.362
26.086	761.004
26.154	691.717
27.128	632.783
27.141	660.496
27.166	715.922
28.103	792.094
28.116	819.807
28.271	722.803
28.278	736.659
29.240	653.477
29.272	722.759
29.353	681.186
29.981	740.050
30.009	798.940
30.028	840.510
30.794	764.264
30.960	691.508
31.175	722.677
31.995	764.212
32.136	850.811
32.147	875.060
32.412	798.836
33.188	746.839
33.213	798.801
33.904	777.986
34.023	819.551
34.343	861.108
34.358	892.285
34.923	816.048
35.388	739.816
35.411	788.313
36.019	805.608
36.061	895.676
36.244	857.561
36.906	774.392
37.034	833.278
37.124	812.489
37.747	860.961
37.922	805.526
37.970	909.450
38.833	826.272
39.456	874.743
39.634	826.237
39.890	947.473
39.965	892.042
40.049	857.397
40.665	892.012
40.935	826.181
42.054	864.238
42.067	891.951
42.308	978.546
42.880	916.166
43.805	968.089
43.863	878.017
44.073	898.793
44.086	711.725
44.134	815.649
45.906	964.533
45.943	829.428
45.982	912.567
46.064	874.457
48.118	985.223
49.244	822.356
50.130	1005.921
51.012	964.312
52.732	1002.344
52.898	929.589
52.911	957.302
52.991	1127.044
54.987	1113.101
55.876	874.032
56.971	1074.909
57.750	1026.376
59.934	988.175
59.957	1036.673
59.972	1067.850
60.135	1202.947
60.290	1105.943
61.924	1175.156
63.100	904.897
63.314	936.066
64.007	1133.495
65.199	1112.659
66.841	984.412
66.861	1025.982
66.874	1053.695
66.887	1081.408
67.058	1233.825
68.755	1223.359
69.843	980.818
71.011	1122.800
71.775	1043.090
71.838	1178.191
73.593	1077.653
73.772	1032.611
74.042	966.779
74.267	1233.513
76.279	1254.211];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SantMcDo1990';
comment.tW_m = 'data for male, handreared';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2;
weights.tW_m = weights.tW_m * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'scaled functional response turned out to vary, which has been implemented';
D2 = 'Males are assumed to differ from females by {p_Am} only';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '3C2DJ'; % Cat of Life
metaData.links.id_ITIS = '174930'; % ITIS
metaData.links.id_EoL = '45509050'; % Ency of Life
metaData.links.id_Wiki = 'Eudocimus_albus'; % Wikipedia
metaData.links.id_ADW = 'Eudocimus_albus'; % ADW
metaData.links.id_Taxo = '51901'; % Taxonomicon
metaData.links.id_WoRMS = '158975'; % WoRMS
metaData.links.id_avibase = '74EDE3CA4FD29DC6'; % avibase
metaData.links.id_birdlife = 'white-ibis-eudocimus-albus'; % birdlife
metaData.links.id_AnAge = 'Eudocimus_albus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eudocimus_albus}}';
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
bibkey = 'SantMcDo1990'; type = 'article'; bib = [ ... 
'author = {Toni L. De Santo and Susan G. McDowell and Keith L. Bildstein}, ' ... 
'year = {1990}, ' ...
'title = {Plumage and Behavioral Development of Nestling White Ibises}, ' ...
'journal = {The Wilson Bulletin}, ' ...
'volume = {102(2)}, ' ...
'pages = {226-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eudocimus_albus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=74EDE3CA4FD29DC6&sec=lifehistory}}';
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

