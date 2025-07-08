function [data, auxData, metaData, txtData, weights] = mydata_Stenella_longirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Stenella_longirostris'; 
metaData.species_en = 'Spinner dolphin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 11.2*30.5;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'KasuMiya1977';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'value for S. attenuata';
data.tx = 29*30.5;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'KasuMiya1977';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'value for S. attenuata';
data.am = 46*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'KasuMiya1977';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for S. attenuata';

data.Lb = 75.9; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'PerrHend1979';
data.Lp = 157; units.Lp = 'cm';   label.Lp = 'length at puberty for females'; bibkey.Lp = 'PerrHend1979';
  comment.Lp = '157 to 188 cm for whitebelly spinners, 152 to 182 for eastern spinners';
data.Lpm = 170; units.Lpm = 'cm';   label.Lpm = 'length at puberty for males'; bibkey.Lpm = 'PerrHend1979';
  comment.Lpm = '170 cm for whitebelly spinners, 175 for eastern spinners';
data.Li = 168; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'PerrHend1979';
data.Lim = 178; units.Lim = 'cm'; label.Lim = 'ultimate length for males'; bibkey.Lim = 'PerrHend1979';

data.Ri  = 1/365/3;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calves per litter, 1 litter per 3 yr';
  
% uni-variate data
% time-length
data.tL_f = [ % time since birth (yr), length (cm)
0.060	75.809
0.080	100.185
0.120	80.745
0.179	88.874
0.182	82.200
0.200	110.058
0.208	93.809
0.210	90.327
0.299	100.198
0.301	96.135
0.304	90.332
0.335	92.075
0.413	125.740
0.430	89.759
0.608	111.823
0.677	97.898
0.701	114.150
0.769	103.127
0.909	137.666
1.068	133.033
1.226	132.461
1.288	133.916
1.384	130.149
1.444	135.086
1.574	127.258
1.761	128.430
1.788	138.007
1.790	134.525
1.923	118.283
1.978	135.117
2.003	147.886
2.005	143.243
2.038	141.794
2.070	140.345
2.286	147.902
2.290	138.617
2.291	136.296
2.409	153.713
2.509	140.951
2.570	144.437
2.596	156.335
2.691	154.890
2.945	149.101
3.035	157.812
3.042	143.303
3.441	161.898
3.447	149.130
3.692	160.752
3.796	142.186
3.850	159.020
3.852	154.667
3.856	147.993
3.950	147.709
4.037	162.803
4.224	164.555
4.255	166.008
4.292	154.403
4.294	149.470
4.350	165.143
4.618	129.466
4.632	165.449
4.641	147.459
4.642	145.718
4.699	156.167
5.169	159.387
5.171	153.873
5.208	143.429
5.240	141.110
5.325	160.556
5.356	162.299
5.416	166.655
5.826	164.068
5.831	153.621
5.859	161.168
6.142	159.733
6.357	168.741
6.358	167.000
6.458	154.819
6.581	160.339
6.676	158.894
6.737	161.799
6.796	170.218
7.019	162.976
7.234	173.145
7.362	168.800
7.363	166.768
7.427	164.451
7.525	156.622
7.525	155.751
7.552	166.199
7.553	163.297
7.582	168.522
7.680	161.273
7.834	165.635
7.927	169.993
7.928	167.962
7.928	166.801
7.960	165.642
7.992	164.484
8.118	164.491
8.459	172.636
8.557	165.097
8.558	162.485
8.648	170.906
8.675	179.612
8.681	167.425
8.809	163.080
8.811	159.888
8.900	169.179
8.942	147.708
8.993	172.667
9.187	161.071
9.217	162.523
9.310	166.881
9.311	163.980
9.312	161.078
9.439	159.344
9.555	179.083
9.558	172.409
9.559	170.088
9.563	162.253
9.595	161.094
9.682	176.189
9.748	168.648
9.812	166.330
9.840	174.167
9.872	172.718
9.905	168.657
9.939	164.306
10.057	179.693
10.255	159.972
10.278	177.384
10.315	164.909
10.442	163.465
10.442	161.434
10.539	156.216
10.596	169.277
10.721	170.445
10.722	168.124
10.724	164.062
10.757	160.291
10.880	165.812
10.937	177.422
11.010	157.114
11.037	165.241
11.068	165.823
11.315	175.703
11.438	180.063
11.476	167.007
11.530	184.711
11.572	162.950
11.634	164.695
11.669	157.733
11.690	177.756
11.696	167.310
11.757	170.796
11.790	165.865
11.820	170.509
11.823	162.965
11.973	177.773
11.974	175.741
12.070	172.845
12.073	166.461
12.352	172.281
12.443	179.831
12.449	166.483
12.538	178.096
12.702	162.726
12.829	161.572
12.859	163.895
12.951	167.673
13.204	164.786
13.452	170.024
13.454	167.412
13.853	185.717
13.897	160.764
14.009	187.757
14.021	163.673
14.025	154.968
14.274	160.205
14.365	165.434
14.557	159.061
14.709	168.936
14.802	170.972
14.838	162.559
14.839	159.077
14.864	173.588
15.055	168.085
15.399	169.556
15.495	167.240
15.497	163.178
15.624	159.413
16.689	164.698
16.779	172.538
16.877	164.709
17.098	162.691
17.503	170.259
18.351	168.567
18.732	159.303]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PerrHend1979';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.117	87.384
0.204	100.193
0.269	94.397
0.304	87.076
0.487	95.309
0.510	113.304
0.636	110.862
0.640	101.407
0.784	128.551
0.786	122.450
0.795	103.235
0.879	123.669
0.913	118.483
0.917	109.333
0.920	102.928
1.034	125.802
1.050	89.810
1.154	136.780
1.164	114.819
1.251	129.459
1.345	128.237
1.474	118.475
1.525	144.095
1.528	135.860
1.646	150.193
1.679	147.753
1.748	132.196
1.780	129.450
1.842	130.670
1.870	138.904
1.930	142.869
2.058	136.156
2.149	140.120
2.242	141.644
2.275	138.288
2.305	139.813
2.369	136.762
2.484	158.721
2.491	142.250
2.544	164.210
2.640	157.193
2.674	150.483
2.709	143.467
2.859	154.445
3.111	149.561
3.262	159.929
3.383	167.857
3.705	143.757
3.756	169.377
4.257	164.184
4.509	158.690
4.820	158.685
4.915	155.024
4.950	146.788
5.222	164.779
5.314	169.658
5.409	164.776
5.471	167.216
5.528	177.280
5.687	170.872
5.715	177.277
6.092	169.951
6.123	172.391
6.151	178.186
6.157	165.375
6.162	153.785
6.371	174.827
6.592	167.198
6.654	169.028
6.867	179.395
7.252	154.988
7.398	176.031
7.439	153.155
7.617	173.588
7.624	158.642
7.645	180.603
7.712	171.146
7.801	181.821
7.867	173.279
7.870	165.959
8.179	170.834
8.329	184.863
8.496	159.849
8.708	173.876
8.766	183.026
9.207	171.734
9.354	190.337
9.385	191.862
9.424	174.475
9.460	163.800
9.477	194.910
9.544	184.539
9.613	170.202
10.236	170.193
10.604	182.998
10.613	163.172
10.667	181.472
10.879	193.974
10.881	189.094
11.069	187.566
11.074	176.280
11.077	170.485
11.203	167.128
11.224	190.309
11.226	185.428
11.326	169.871
11.353	179.936
11.355	174.751
11.508	180.239
11.539	182.069
11.573	174.443
11.574	172.308
11.606	170.782
11.633	180.542
11.725	184.506
11.823	173.219
11.848	188.164
11.971	191.212
12.105	170.164
12.379	183.276
12.475	178.394
12.595	189.068
12.660	183.576
12.693	177.476
12.695	175.036
12.843	191.199
12.849	178.083
13.466	191.189
13.467	188.444
13.505	173.193
13.692	173.190
13.694	169.530
14.001	179.591
14.412	165.249
14.843	177.443
14.871	184.153
14.969	175.001
15.436	174.994
15.654	174.380
16.119	179.559
16.676	189.005
16.684	171.620
18.301	176.780
18.515	186.537
18.797	183.483
19.517	175.847]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PerrHend1979';
comment.tL_m = 'Data for males';

% length-weight
data.LW_f = [ ...  % log10 length (cm), log10 weight (kg)
1.920	0.794
1.923	0.865
1.925	0.843
1.939	0.932
1.950	0.958
1.971	1.002
1.972	0.976
1.981	1.099
1.988	1.062
2.009	0.973
2.019	1.122
2.026	1.107
2.037	1.255
2.067	1.307
2.094	1.397
2.101	1.282
2.108	1.337
2.138	1.449
2.145	1.430
2.158	1.475
2.160	1.497
2.172	1.509
2.180	1.416
2.182	1.561
2.193	1.598
2.193	1.579
2.203	1.550
2.211	1.668
2.218	1.650
2.218	1.531
2.219	1.668
2.220	1.702
2.221	1.624
2.223	1.743
2.225	1.702
2.225	1.672
2.226	1.761
2.230	1.732
2.236	1.761
2.237	1.717
2.237	1.650
2.238	1.769
2.238	1.724
2.238	1.676
2.243	1.828
2.245	1.743
2.246	1.646
2.247	1.721
2.247	1.698
2.253	1.665
2.254	1.806
2.255	1.732
2.260	1.695
2.260	1.672
2.268	1.791
2.268	1.736
2.274	1.747
2.276	1.728
2.280	1.754
2.288	1.806
2.292	1.791
2.294	1.806
2.305	1.821
2.309	1.777];
data.LW_f = 10.^data.LW_f; % remove log transformation
units.LW_f  = {'cm', 'kg'};  label.LW_f = {'length', 'weight', 'female'};  
bibkey.LW_f = 'PerrDola2005';
comment.LW_f = 'data for females';
%
data.LW_m = [ ...  % log10 length (cm), log10 weight (kg)
1.857	0.597
1.922	0.994
1.925	0.727
1.934	0.961
1.939	0.819
1.939	0.909
1.953	0.927
1.959	0.927
1.970	1.076
1.974	0.961
1.979	0.938
1.980	0.972
1.988	0.994
1.988	1.053
1.991	0.968
2.018	1.094
2.072	1.261
2.077	1.280
2.084	1.239
2.092	1.298
2.093	1.313
2.101	1.347
2.111	1.347
2.123	1.339
2.130	1.369
2.133	1.465
2.135	1.425
2.137	1.380
2.137	1.484
2.139	1.399
2.139	1.443
2.152	1.354
2.159	1.503
2.163	1.417
2.167	1.484
2.173	1.477
2.173	1.521
2.173	1.555
2.185	1.521
2.188	1.543
2.190	1.525
2.191	1.599
2.191	1.640
2.199	1.577
2.199	1.581
2.200	1.506
2.201	1.517
2.204	1.551
2.208	1.651
2.216	1.636
2.218	1.547
2.219	1.606
2.219	1.636
2.220	1.707
2.228	1.707
2.228	1.751
2.230	1.707
2.231	1.740
2.234	1.733
2.236	1.673
2.237	1.781
2.240	1.707
2.242	1.759
2.243	1.781
2.244	1.744
2.245	1.673
2.245	1.714
2.245	1.777
2.247	1.729
2.249	1.681
2.249	1.759
2.251	1.729
2.251	1.818
2.259	1.826
2.260	1.814
2.261	1.751
2.263	1.785
2.264	1.840
2.264	1.874
2.265	1.800
2.266	1.770
2.272	1.785
2.274	1.710
2.274	1.755
2.274	1.892
2.274	1.915
2.279	1.822
2.281	1.781
2.281	1.800
2.281	1.822
2.282	1.855
2.288	1.803
2.289	1.844
2.290	1.822
2.291	1.785
2.296	1.803
2.296	1.829
2.306	1.877
2.308	1.814
2.310	1.829];
data.LW_m = 10.^data.LW_m; % remove log transformation
units.LW_m  = {'cm', 'kg'};  label.LW_m = {'length', 'weight', 'male'};  
bibkey.LW_m = 'PerrDola2005';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6ZKXY'; % Cat of Life
metaData.links.id_ITIS = '180429'; % ITIS
metaData.links.id_EoL = '46559285'; % Ency of Life
metaData.links.id_Wiki = 'Stenella_longirostris'; % Wikipedia
metaData.links.id_ADW = 'Stenella_longirostris'; % ADW
metaData.links.id_Taxo = '68739'; % Taxonomicon
metaData.links.id_WoRMS = '137109'; % WoRMS
metaData.links.id_MSW3 = '14300091'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stenella_longirostris}}';
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
bibkey = 'PerrHend1979'; type = 'article'; bib = [ ... 
'author = {W. F. Perrin and J. R. Henderson}, ' ... 
'year = {1979}, ' ...
'title = {Growth and Reproductive Rates in Two Populations of Spinner Dolphins, \emph{Stenella  longirostris}, with Different Histories of Exploitation}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {special issue 6}, ' ...
'pages = {417--430}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PerrDola2005'; type = 'article'; bib = [ ... 
'author = {W. F. Perrin and M. L. Dolar and C. M. Chan and S. J. Chivers}, ' ... 
'year = {2005}, ' ...
'title = {Weight-length relationships in the Spinner Dolphins, \emph{Stenella  longirostris}}, ' ...
'journal = {Mar. Mamm. Sci}, ' ...
'volume = {21}, ' ...
'pages = {765--778}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KasuMiya1977'; type = 'article'; bib = [ ... 
'author = {T. Kasuya and N. Miyazaki}, ' ... 
'year = {1974}, ' ...
'title = {Growth and reproduction of \emph{Stenella attenuata} in the {P}acific coast of {J}apan}, ' ...
'journal = {Sci. Rep. Whales Res. Inst.}, ' ...
'volume = {29}, ' ...
'pages = {21--48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Stenella_longirostris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

