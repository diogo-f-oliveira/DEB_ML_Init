  function [data, auxData, metaData, txtData, weights] = mydata_Cerberus_rynchops
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Homalopsidae';
metaData.species    = 'Cerberus_rynchops'; 
metaData.species_en = 'New Guinea bockadam'; 

metaData.ecoCode.climate = {'Aw', 'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Fv', 'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'L-dL';'Ww-dWw';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 24]; 

%% set data
% zero-variate data
data.am = 10*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 14.5;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'ChimDion2013';
  comment.Lb = 'value for Cerberus schneiderii';
data.Lp = 33.6;     units.Lp = 'cm';     label.Lp = 'SVL at puberty'; bibkey.Lp = 'ChimDion2013';
  comment.Lp = 'value for Cerberus schneiderii';
data.Li = 110;     units.Li = 'cm';     label.Li = 'ultimate SVL';  bibkey.Li = 'reptileDB';

data.Wwb = 1.96;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'ChimDion2013';

data.Ri = 39/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate at SVL 67 cm';  bibkey.Ri = 'JaynVori1988';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% length - change in length
data.LdL = [ ... % SVL (cm), increase (percent), interval (d)
32.5 1.5 20
38.0 3.9 20
43.0 1.2 25
30.5 1.6 26
38.0 1.3 27
37.0 2.7 28
42.0 1.2 28
49.0 2.0 28
38.0 3.9 29
40.0 8.8 32
40.5 6.0 42
50.0 2.0 45
44.5 3.8 65
60.0 5.0 68];
data.LdL = [data.LdL(:,1), data.LdL(:,1) .* data.LdL(:,2) ./ data.LdL(:,3)/ 100];
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'SVL', 'change in SVL'};  
temp.LdL   = C2K(27);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'JaynVori1988';

% weight - change in weight
data.WdW = [ ... % weight (g), increase (percent), interval (d)
19 15.8 20
35 28.6 20
50 14.0 25
16 18.8 26
29 20.7 27
28 14.3 28
42 21.4 28
70 17.1 28
35 17.1 29
41 17.1 32
39 25.6 42
67 23.9 45
51 13.7 65
124 8.1 68];
data.WdW = [data.WdW(:,1), data.WdW(:,1) .* data.WdW(:,2) ./ data.WdW(:,3)/ 100];
units.WdW  = {'g', 'g/d'};  label.WdW = {'weight', 'change in weight'};  
temp.WdW   = C2K(27);  units.temp.WdW = 'K'; label.temp.WdW = 'temperature';
bibkey.WdW = 'JaynVori1988';

% length - length
data.LL_f = [ ... % SVL (cm), SVL (cm) 1 month later
27.114	27.882
28.985	29.109
31.203	31.560
31.376	33.143
31.376	32.855
32.312	32.857
33.144	33.650
33.559	33.723
33.941	35.162
33.941	34.659
34.391	35.451
34.634	36.962
34.807	35.668
35.223	35.453
35.257	36.676
35.916	36.893
36.158	36.893
36.436	37.038
36.609	38.405
36.609	37.398
36.609	37.542
36.782	37.254
36.851	38.478
37.129	36.823
37.579	38.911
37.822	38.120
38.030	38.912
38.134	38.121
38.307	38.121
38.376	38.697
38.480	39.704
38.688	39.417
38.861	39.201
38.965	41.216
39.173	41.216
39.208	39.562
39.381	40.281
39.658	39.850
39.658	40.066
39.832	41.937
39.936	40.067
39.970	40.498
40.074	41.218
40.490	40.643
40.490	41.363
40.698	42.802
40.767	42.371
40.767	41.291
40.871	40.428
41.045	41.796
41.114	41.508
41.460	41.868
41.668	43.308
41.772	44.027
41.772	42.157
41.772	41.797
41.876	42.517
42.015	42.445
42.188	43.093
42.431	42.662
42.673	43.166
42.881	43.166
42.985	44.389
43.158	43.958
43.193	43.599
43.262	44.750
43.470	44.606
43.609	45.614
43.678	44.175
43.921	46.406
43.955	44.967
44.094	44.032
44.302	45.831
44.371	46.263
44.371	44.680
44.545	45.328
44.649	46.479
44.649	44.177
44.718	45.544
44.718	44.537
44.787	46.048
44.960	46.048
45.238	46.624
45.238	45.473
45.342	45.833
45.376	46.265
45.550	48.424
45.653	46.985
45.688	45.906
45.792	46.913
46.416	45.548
46.728	48.426
47.663	47.205
48.391	51.523
48.530	49.581
48.530	49.869
48.599	48.790
48.703	49.725
49.084	51.021
49.361	50.158
49.673	52.029
49.777	51.670
50.540	50.592
50.540	51.311
50.886	51.312
51.302	53.040
51.649	52.249
51.960	53.041
51.960	52.250
52.965	53.187
54.386	53.694
55.149	54.630
55.876	57.653
57.574	58.952];
units.LL_f  = {'cm', 'cm'};  label.LL_f = {'SVL', 'SVL, 1 month later', 'female'};  
temp.LL_f   = C2K(27);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'ChimDion2013';
comment.LL_f = 'data for females Cerberus schneiderii';
%
data.LL_m = [ ... % SVL (cm), SVL (cm) 1 month later
33.074	34.297
35.050	36.028
35.500	36.676
35.569	35.741
35.639	37.108
35.639	36.101
36.054	37.181
36.366	36.750
36.505	36.463
36.644	37.614
36.748	36.319
36.782	38.477
36.886	37.183
37.094	36.967
37.198	37.759
37.302	37.759
37.579	38.551
37.649	38.335
37.856	38.048
38.203	38.480
38.411	38.049
38.688	39.129
38.827	40.136
38.965	40.496
39.104	39.130
39.243	40.209
39.243	41.360
39.347	39.490
39.520	40.354
39.728	39.491
40.074	41.002
40.074	39.851
40.144	40.643
40.248	40.067
40.351	41.578
40.525	40.356
40.663	40.644
40.767	41.076
40.837	40.644
40.871	41.939
41.183	42.587
41.287	41.652
41.391	42.300
41.530	41.509
41.564	41.221
41.807	41.725
41.911	45.323
41.911	42.085
42.188	42.949
42.188	41.798
42.396	43.309
42.431	44.820
42.431	42.518
42.639	43.454
42.708	42.878
42.847	44.029
42.847	43.238
43.124	45.685
43.193	43.814
43.540	43.527
43.540	43.240
43.609	44.175
43.713	43.672
43.921	45.255
44.198	44.608
44.198	45.039
44.579	47.342
44.856	45.616
45.030	45.329
45.064	45.976
45.099	46.408
45.203	45.257
45.376	45.330
45.619	45.834
45.723	45.258
45.861	46.410
45.896	45.978
46.069	45.475
46.173	46.123
46.173	46.482
46.416	46.339
46.450	47.778
46.450	48.138
46.450	47.274
46.658	47.419
46.693	46.771
46.693	45.404
46.970	46.844
47.698	48.212
48.252	47.925
48.564	49.293
48.634	49.509
48.807	49.222
48.946	48.790
49.188	49.798
49.223	49.222
49.431	49.798
49.639	50.446
49.916	50.375
49.916	49.799
50.158	50.735
50.470	50.952
50.817	51.096
50.886	51.600
51.579	52.537
52.272	52.610
53.693	53.620
54.663	53.838];
units.LL_m  = {'cm', 'cm'};  label.LL_m = {'SVL', 'SVL, 1 month later', 'male'};  
temp.LL_m   = C2K(27);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'ChimDion2013';
comment.LL_m = 'data for males Cerberus schneiderii';

% length-weight
data.LW = [data.LdL(:,1), data.WdW(:,1)];
units.LW  = {'cm', 'g'};  label.LW = {'SVL', 'weight'};  
bibkey.LW = 'JaynVori1988';
%
data.LW_f = [ ... % log10 SVL (mm), log10 weight (g)
2.2217	0.4792
2.2700	0.5104
2.2905	0.6406
2.3100	0.7031
2.3118	0.7344
2.3499	0.7865
2.3546	0.8229
2.3611	0.7917
2.3936	0.8958
2.4029	0.9375
2.4122	0.9792
2.4122	0.9271
2.4187	0.9792
2.4308	1.0625
2.4382	1.0625
2.4438	1.1198
2.4438	1.0885
2.4456	1.0469
2.4596	1.1406
2.4596	1.1198
2.4624	1.1562
2.4670	1.1667
2.4670	1.1146
2.4754	1.1615
2.4800	1.1875
2.4847	1.1615
2.4865	1.1875
2.4912	1.1302
2.4958	1.2656
2.4958	1.2240
2.4958	1.1615
2.5051	1.2031
2.5135	1.2292
2.5144	1.2865
2.5190	1.2656
2.5218	1.2812
2.5228	1.3542
2.5246	1.2917
2.5256	1.5208
2.5256	1.2344
2.5293	1.3125
2.5330	1.2500
2.5339	1.2135
2.5404	1.3385
2.5404	1.3125
2.5423	1.4167
2.5423	1.3750
2.5441	1.3542
2.5497	1.4219
2.5506	1.3698
2.5516	1.4167
2.5516	1.4688
2.5553	1.5417
2.5571	1.4792
2.5581	1.3802
2.5590	1.4323
2.5609	1.5156
2.5627	1.4635
2.5627	1.3906
2.5646	1.4323
2.5655	1.5156
2.5664	1.5625
2.5692	1.4479
2.5692	1.3906
2.5702	1.3594
2.5702	1.5208
2.5739	1.4427
2.5739	1.4479
2.5767	1.4219
2.5804	1.4792
2.5813	1.4948
2.5813	1.4948
2.5832	1.4583
2.5859	1.5208
2.5925	1.4792
2.5934	1.5208
2.5943	1.5625
2.5952	1.6198
2.5952	1.6458
2.5962	1.5000
2.5999	1.5833
2.6017	1.3906
2.6027	1.5208
2.6036	1.5573
2.6055	1.5833
2.6092	1.5573
2.6101	1.5885
2.6185	1.4792
2.6194	1.5833
2.6213	1.5990
2.6222	1.6250
2.6222	1.6615
2.6259	1.6719
2.6278	1.6354
2.6278	1.6094
2.6296	1.6667
2.6324	1.4896
2.6333	1.5573
2.6352	1.6667
2.6352	1.5625
2.6361	1.5833
2.6380	1.5260
2.6389	1.8125
2.6408	1.6302
2.6417	1.6354
2.6436	1.5729
2.6445	1.6458
2.6463	1.7135
2.6473	1.6875
2.6482	1.7448
2.6528	1.4948
2.6538	1.6250
2.6538	1.6875
2.6556	1.7292
2.6566	1.7604
2.6575	1.8125
2.6612	1.6927
2.6621	1.6927
2.6621	1.7396
2.6631	1.6250
2.6631	1.7448
2.6668	1.8958
2.6677	1.7917
2.6724	1.6406
2.6751	1.5625
2.6770	1.7604
2.6779	1.8073
2.6807	1.6510
2.6807	1.5937
2.6844	1.8542
2.6891	1.7500
2.6891	1.7917
2.6891	1.8385
2.6909	1.9583
2.6947	1.6615
2.7030	1.9167
2.7132	1.7135
2.7160	1.9062
2.7262	1.9219
2.7458	2.0312
2.7662	2.1146
2.7690	2.0260
2.7727	1.4479
2.7997	2.2969
2.8006	2.1927
2.8043	2.0833
2.8573	2.3542];
data.LW_f = 10.^data.LW_f; % remove log transformation
data.LW_f(:,1) = data.LW_f(:,1)/ 10; % convert mm to cm
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight', 'female'};  
bibkey.LW_f = 'ChimDion2013';
comment.LW_f = 'data for females Cerberus schneiderii';
%
data.LW_m = [ ... % log10 SVL (mm), log10 weight (g)
2.1613	0.2917
2.2552	0.5000
2.2793	0.6458
2.3072	0.6667
2.3453	0.7448
2.4252	1.0000
2.4336	1.0208
2.4373	1.0573
2.4373	1.0000
2.4447	1.1562
2.4475	1.0885
2.4475	1.0469
2.4559	1.0990
2.4642	1.1406
2.4661	1.0990
2.4717	1.1667
2.4735	1.1562
2.4810	1.1927
2.4856	1.1406
2.4940	1.1615
2.5042	1.1979
2.5088	1.2500
2.5135	1.2344
2.5144	1.3125
2.5190	1.2604
2.5209	1.3750
2.5237	1.2917
2.5237	1.3229
2.5256	1.2917
2.5283	1.2917
2.5311	1.4323
2.5311	1.3125
2.5348	1.4635
2.5348	1.3490
2.5386	1.4896
2.5395	1.3229
2.5404	1.3646
2.5423	1.4010
2.5423	1.3594
2.5451	1.3958
2.5451	1.3437
2.5451	1.3021
2.5479	1.3854
2.5506	1.3073
2.5525	1.4271
2.5562	1.3281
2.5571	1.3594
2.5581	1.3906
2.5590	1.4219
2.5618	1.4583
2.5627	1.3750
2.5627	1.3542
2.5636	1.5625
2.5655	1.4688
2.5655	1.3854
2.5702	1.4740
2.5720	1.4167
2.5748	1.5000
2.5785	1.4375
2.5785	1.5052
2.5813	1.4010
2.5813	1.5208
2.5841	1.6250
2.5869	1.4948
2.5878	1.5521
2.5887	1.5000
2.5887	1.4375
2.5906	1.4635
2.5915	1.5104
2.5962	1.6563
2.5962	1.5469
2.5990	1.5625
2.6017	1.5937
2.6027	1.5729
2.6036	1.4948
2.6045	1.5417
2.6055	1.6302
2.6055	1.4688
2.6064	1.5833
2.6110	1.6354
2.6138	1.5312
2.6148	1.6667
2.6157	1.4740
2.6157	1.7865
2.6166	1.4167
2.6166	1.6667
2.6175	1.6094
2.6185	1.5677
2.6203	1.4948
2.6222	1.6667
2.6231	1.7500
2.6240	1.4583
2.6250	1.6719
2.6250	1.6146
2.6259	1.6771
2.6296	1.5833
2.6315	1.6094
2.6315	1.7135
2.6324	1.6615
2.6333	1.6406
2.6333	1.5365
2.6343	1.4531
2.6361	1.6771
2.6370	1.5000
2.6380	1.6094
2.6417	1.7135
2.6445	1.5781
2.6445	1.6406
2.6445	1.7708
2.6454	1.6458
2.6473	1.5521
2.6482	1.7552
2.6482	1.6354
2.6482	1.6302
2.6491	1.7760
2.6501	1.6615
2.6519	1.7240
2.6547	1.7760
2.6566	1.6615
2.6575	1.7031
2.6584	1.6979
2.6584	1.7187
2.6612	1.6927
2.6631	1.7500
2.6659	1.8177
2.6677	1.7292
2.6696	1.6458
2.6714	1.7604
2.6733	1.6250
2.6742	1.8333
2.6742	1.6719
2.6751	1.8281
2.6751	1.6979
2.6779	1.8542
2.6779	1.7604
2.6779	1.7031
2.6789	1.7917
2.6835	1.7865
2.6835	1.9323
2.6854	1.8437
2.6854	1.6250
2.6863	1.8698
2.6872	1.7292
2.6891	1.6823
2.6891	1.8177
2.6891	1.8958
2.6928	1.9219
2.6937	1.6927
2.6956	1.7448
2.6956	1.7135
2.6974	1.8646
2.6993	1.7813
2.7002	1.8125
2.7012	1.7656
2.7086	1.8646
2.7114	1.8333
2.7142	1.7917
2.7151	1.8542
2.7179	1.8958
2.7253	1.9479
2.7290	1.7344
2.7337	1.8750
2.7365	1.7865
2.7383	1.8906
2.7541	2.0469
2.7708	2.0677
2.7820	2.0573];
data.LW_m = 10.^data.LW_m; % remove log transformation
data.LW_m(:,1) = data.LW_m(:,1)/ 10; % convert mm to cm
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight', 'male'};  
bibkey.LW_m = 'ChimDion2013';
comment.LW_m = 'data for males Cerberus schneiderii';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;
weights.WdW = 3 * weights.WdW;
weights.LW = 3 * weights.LW;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};
                  
%% Discussion points
D1 = 'Males are assumed not to differ; males have a longer tail';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Cerberus_rynchops and Cerberus schneiderii are recently separated ';
metaData.bibkey.F1 = 'ChimDion2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SQWD'; % Cat of Life
metaData.links.id_ITIS = '174208'; % ITIS
metaData.links.id_EoL = '46559514'; % Ency of Life
metaData.links.id_Wiki = 'Cerberus_rynchops'; % Wikipedia
metaData.links.id_ADW = 'Cerberus_rynchops'; % ADW
metaData.links.id_Taxo = '307748'; % Taxonomicon
metaData.links.id_WoRMS = '344028'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Cerberus&species=rynchops'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cerberus_rynchops}}';
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
bibkey = 'JaynVori1988'; type = 'Article'; bib = [ ... 
'author = {Jayne, Bruce C. and  Voris, Harold K. and Heang, Kiew Bong}, ' ...
'year = {1988}, ' ...
'title = {Diet, Feeding Behavior, Growth, and Numbers of a Population of \emph{Cerberus rynchops} ({S}erpentes: {H}omalopsinae) in {M}alaysia}, ' ... 
'journal = {Fieldiana}, ' ...
'volume = {50}, '...
'pages = {1-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559514}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Cerberus&species=rynchops}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChimDion2013'; type = 'Article'; bib = [ ... 
'author = {C. K. Chim and C. H. Diong}, ' ...
'year = {2013}, ' ...
'title = {A MARK-RECAPTURE STUDY OF A DOG-FACED WATER SNAKE \emph{Cerberus schneiderii} ({C}OLUBRIDAE: {H}OMALOPSIDAE) POPULATION IN {S}UNGEI {B}ULOH WETLAND RESERVE, {S}INGAPORE}, ' ... 
'journal = {The Raffles Bulletin of Zoology}, ' ...
'volume = {61(2)}, '...
'pages = {811-825}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

