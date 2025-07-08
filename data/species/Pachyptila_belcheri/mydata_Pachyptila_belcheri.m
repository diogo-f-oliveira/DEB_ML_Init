function [data, auxData, metaData, txtData, weights] = mydata_Pachyptila_belcheri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pachyptila_belcheri'; 
metaData.species_en = 'Slender-billed prion'; 

metaData.ecoCode.climate = {'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MS', 'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 30.5;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'QuilMase2003';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 50; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'QuilMase2003';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 150; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 25; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'QuilMase2003';
data.Wwi = 250; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'EoL';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower. EoL 140 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.981	26.247
1.032	20.994
1.032	27.821
1.032	31.498
1.032	38.326
1.084	16.791
1.910	29.384
1.910	31.485
1.910	34.111
1.910	37.262
1.910	42.514
1.962	14.677
1.962	20.980
1.962	25.181
2.839	46.177
2.839	47.752
2.891	23.592
2.891	52.478
2.942	28.843
2.942	31.994
2.942	35.671
2.942	38.822
2.942	42.499
2.994	20.964
3.872	48.787
3.872	51.938
3.975	31.979
3.975	35.655
3.975	38.281
3.975	41.433
3.975	45.109
3.975	67.168
4.027	23.050
4.027	25.676
4.027	27.776
4.956	60.326
4.956	66.103
4.956	70.305
5.007	26.711
5.007	43.518
5.007	46.144
5.007	49.295
5.007	52.447
5.007	56.123
5.937	51.907
5.937	56.109
5.937	58.735
5.937	60.836
5.937	63.987
5.937	66.613
5.937	68.714
5.937	71.865
5.988	45.604
5.988	48.755
6.040	34.049
6.040	41.927
6.866	56.620
6.866	58.721
6.917	51.368
6.917	53.994
6.917	63.447
6.917	67.124
6.917	70.800
6.917	74.477
6.917	76.578
6.917	79.729
6.969	42.963
6.969	48.741
7.072	31.407
7.072	35.084
7.950	48.201
7.950	53.978
7.950	60.281
7.950	63.432
7.950	65.533
7.950	69.209
8.001	72.360
8.001	75.511
8.001	77.612
8.001	79.187
8.001	84.965
8.053	93.893
8.931	67.619
8.931	70.770
8.931	73.396
8.931	75.497
8.931	77.073
8.931	78.123
8.931	81.800
8.931	83.900
8.982	48.185
8.982	50.286
8.982	58.690
8.982	80.223
9.034	37.680
9.086	96.503
9.912	92.814
9.912	97.016
9.912	103.844
9.963	56.574
9.963	60.776
9.963	62.876
9.963	66.553
9.963	69.179
9.963	71.280
9.963	73.381
9.963	76.007
9.963	87.561
9.963	88.087
9.963	90.187
10.015	78.632
10.015	81.258
10.015	81.258
10.015	83.359
10.015	84.409
10.015	85.985
10.892	94.900
10.892	98.052
10.944	77.568
10.944	81.769
10.944	84.395
10.944	100.677
10.944	102.778
10.944	104.879
10.944	107.505
10.944	109.080
10.944	111.706
10.996	46.579
10.996	56.558
10.996	59.185
10.996	68.113
10.996	71.790
10.996	74.416
10.996	76.516
10.996	78.617
10.996	82.294
10.996	87.021
10.996	90.172
10.996	92.273
10.996	116.432
11.925	114.843
11.925	118.519
11.976	68.624
11.976	71.250
11.976	94.359
11.976	98.561
11.976	102.237
11.976	104.863
11.976	106.439
11.976	127.447
11.976	134.275
12.028	50.240
12.028	65.997
12.028	81.753
12.028	84.379
12.028	88.056
12.028	111.165
12.906	98.021
12.906	101.698
12.906	104.324
12.906	106.950
12.906	112.202
12.906	145.290
12.957	56.004
12.957	60.731
13.009	68.608
13.009	80.163
13.060	84.364
13.060	87.515
13.060	90.141
13.060	119.553
13.060	123.754
13.886	81.725
13.938	130.569
13.938	136.346
13.938	142.649
13.990	83.824
13.990	86.976
13.990	92.228
13.990	94.329
13.990	101.156
13.990	105.883
13.990	108.509
13.990	112.711
13.990	116.387
13.990	119.539
13.990	121.640
13.990	123.740
14.867	102.719
14.867	132.131
14.867	136.332
14.919	98.516
14.919	105.869
14.919	109.546
14.919	116.374
14.919	119.000
14.919	122.151
14.919	124.777
14.919	126.878
14.971	92.738
14.971	96.415
14.971	153.137
15.022	62.801
15.022	73.305
15.022	90.111
15.022	163.641
15.074	78.031
15.074	87.485
15.951	78.018
15.951	93.249
15.951	95.875
15.951	104.803
15.951	149.971
15.951	156.799
16.003	84.845
16.003	86.945
16.003	107.429
16.003	125.811
16.055	110.054
16.055	112.155
16.055	115.306
16.158	118.981
16.158	122.132
16.881	146.806
16.984	76.952
16.984	84.830
16.984	90.082
16.984	110.565
16.984	112.666
16.984	115.817
16.984	122.120
16.984	125.796
16.984	129.473
16.984	134.200
16.984	138.401
16.984	139.977
16.984	168.864
16.984	170.964
17.913	91.644
17.913	146.266
17.965	94.794
17.965	152.567
17.965	168.324
17.965	175.677
18.016	96.369
18.016	107.398
18.016	117.377
18.016	119.478
18.016	122.104
18.016	125.781
18.016	159.394
18.016	179.352
18.016	184.079
18.068	132.608
18.945	115.263
18.945	117.889
18.945	119.990
18.945	127.868
18.945	133.645
18.945	144.674
18.945	184.590
18.997	108.959
18.997	164.632
18.997	168.308
18.997	172.510
18.997	175.661
18.997	191.943
19.049	148.875
19.049	151.501
19.049	154.652
19.049	156.753
19.049	158.854
19.875	102.644
19.875	106.320
19.875	185.102
19.926	112.097
19.926	188.252
19.978	137.306
19.978	140.457
19.978	174.071
20.029	152.536
20.029	155.688
20.029	158.839
20.029	162.515
20.081	123.649
20.081	132.052
20.081	135.204
20.081	149.910
20.081	167.241
20.907	146.746
20.959	189.287
21.010	115.232
21.010	123.635
21.010	129.412
21.062	133.613
21.062	136.239
21.062	160.399
21.062	171.428
21.062	174.054
21.114	138.339
21.114	140.440
21.114	142.541
21.114	159.348
21.940	115.743
21.940	125.722
21.940	150.932
21.940	154.083
21.940	156.184
21.991	136.751
21.991	140.427
21.991	164.062
22.043	129.922
22.043	171.939
22.043	185.594
22.043	189.271
22.043	192.947
22.043	195.573
22.043	199.250
22.972	127.807
22.972	131.484
22.972	156.169
22.972	157.219
22.972	168.248
22.972	172.450
22.972	178.753
22.972	236.001
23.024	182.428
23.024	187.155
23.024	188.731
23.024	191.357
23.075	106.272
23.075	140.411
23.075	148.814
24.004	141.447
24.004	146.174
24.004	150.376
24.004	153.002
24.004	157.204
24.004	161.405
24.004	166.657
24.004	176.111
24.004	187.141
24.004	189.767
24.056	204.997
24.108	197.118
24.159	123.588
24.985	117.798
24.985	158.764
24.985	183.975
24.985	186.075
24.985	192.903
24.985	197.105
24.985	199.731
24.985	201.306
24.985	202.882
25.037	132.503
25.037	140.907
25.037	161.390
25.037	165.591
25.037	172.944
25.037	178.196
25.037	206.558
25.088	148.259
25.088	152.986
25.863	178.184
25.914	170.830
25.914	181.860
25.966	166.628
25.966	185.535
25.966	214.422
26.018	140.367
26.018	144.568
26.018	148.770
26.018	151.396
26.018	152.446
26.018	155.073
26.018	156.123
26.069	158.223
26.069	225.975
26.121	164.000
26.173	160.848
26.999	123.545
26.999	127.747
26.999	179.743
27.050	173.439
27.050	208.103
27.102	142.451
27.102	163.460
27.102	169.762
27.102	175.539
27.102	184.993
27.102	193.397
27.153	180.791
27.928	187.607
27.928	194.435
27.979	152.942
27.979	157.144
27.979	168.173
27.979	176.051
27.979	178.678
27.979	206.514
27.979	212.291
27.979	222.795
28.083	118.277
28.960	167.633
28.960	182.865
28.960	188.117
28.960	193.894
28.960	220.154
28.960	229.083
29.012	138.221
29.012	148.725
29.941	194.404
29.941	199.131
29.993	160.790
29.993	174.446
29.993	188.626
29.993	224.341
30.096	213.835
30.973	199.116
31.025	205.943
31.077	150.795
31.077	178.106
31.077	182.308
31.128	164.450
32.006	166.012
32.006	192.798
32.006	202.252
33.090	217.466
34.019	186.465];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1); data.tW(i,1)=data.tW(i-1,1)+1e-8;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'QuilMase2003';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6THKX'; % Cat of Life
metaData.links.id_ITIS = '174599'; % ITIS
metaData.links.id_EoL = '45512113'; % Ency of Life
metaData.links.id_Wiki = 'Pachyptila_belcheri'; % Wikipedia
metaData.links.id_ADW = 'Pachyptila_belcheri'; % ADW
metaData.links.id_Taxo = '51508'; % Taxonomicon
metaData.links.id_WoRMS = '212646'; % WoRMS
metaData.links.id_avibase = '0D885A80ADB81674'; % avibase
metaData.links.id_birdlife = 'slender-billed-prion-pachyptila-belcheri'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pachyptila_belcheri}}';
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
bibkey = 'QuilMase2003'; type = 'Article'; bib = [ ... 
'author = {P. Quillfeldt and J. F. Masello and I. J. Strange}, ' ... 
'doi = {10.1007/s00300-003-0544-6}, ' ...
'year = {2003}, ' ...
'title = {Breeding biology of the thin-billed prion \emph{Pachyptila belcheri} at {N}ew {I}sland, {F}alkland {I}slands: egg desertion, breeding success and chick provisioning in the poor season 2002/2003}, ' ...
'journal = {Polar Biol.}, ' ...
'volume = {26}, ' ...
'pages = {746-752}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049501/overview}}';
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

