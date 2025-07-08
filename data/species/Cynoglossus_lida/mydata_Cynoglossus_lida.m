function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_lida
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_lida'; 
metaData.species_en = 'Roughscale tongue sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 17];

%% set data
% zero-variate data
data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(28.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(28.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16;   units.Lp = 'cm';  label.Lp = 'total length at puberty';      bibkey.Lp = 'Raja1992';
data.Lpm = 15.8;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'Raja1992';
data.Li = 21.3;  units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'Raja1992';

data.Wwb = 3.35e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Raja1992';
  comment.Wwb = 'based on egg diameter of 0.4 mm: pi/6*0.04^3';
data.Wwp = 22;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'guess';  
  comment.Wwp = 'based on LW and Li data; 0.00389*Lp^3.07, see F1 gives 19.3 g';
data.Wwi = 65; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'Raja1992';     
  comment.Wwi = 'based on LW and Li data; 0.00389*Li^3.07, see F1, gives 46.5 g';

% uni-variate data
% time-length        
data.tL_fm = [ ... % age (yrs), total length (cm) 
1	15.234 14.952
2	18.617 18.571
3	21.489 21.746];
data.tL_fm(:,1) = 365 * (0.2+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(28.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Raja1992'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % log10 total length (mm), log10 weight (g)
2.011	0.742
2.017	0.723
2.024	0.747
2.035	0.811
2.041	0.791
2.043	0.811
2.048	0.840
2.061	0.933
2.061	0.875
2.063	0.816
2.069	0.914
2.071	0.982
2.072	0.968
2.072	0.836
2.076	0.953
2.078	0.943
2.079	0.885
2.084	0.919
2.094	0.958
2.095	1.085
2.103	1.056
2.104	0.992
2.104	0.973
2.108	0.988
2.115	1.154
2.115	1.134
2.115	1.017
2.117	1.090
2.119	1.120
2.119	1.100
2.119	1.163
2.122	1.124
2.123	1.129
2.125	1.178
2.125	1.090
2.125	1.037
2.128	1.203
2.128	1.120
2.128	1.061
2.129	1.046
2.132	1.120
2.132	1.120
2.135	1.212
2.137	1.154
2.139	1.256
2.139	1.139
2.141	1.115
2.143	1.217
2.144	1.125
2.145	1.164
2.148	1.198
2.150	1.164
2.151	1.135
2.152	1.281
2.154	1.198
2.158	1.286
2.158	1.193
2.159	1.227
2.161	1.179
2.163	1.315
2.163	1.237
2.164	1.247
2.166	1.281
2.166	1.144
2.170	1.242
2.172	1.262
2.172	1.306
2.174	1.242
2.174	1.330
2.177	1.262
2.178	1.291
2.179	1.291
2.181	1.262
2.181	1.335
2.182	1.233
2.184	1.252
2.186	1.320
2.188	1.360
2.188	1.306
2.189	1.350
2.189	1.291
2.190	1.330
2.192	1.311
2.192	1.291
2.192	1.311
2.194	1.521
2.194	1.399
2.195	1.394
2.196	1.423
2.198	1.340
2.202	1.404
2.203	1.423
2.203	1.316
2.203	1.306
2.204	1.379
2.204	1.453
2.204	1.335
2.205	1.291
2.206	1.238
2.209	1.379
2.211	1.414
2.212	1.423
2.212	1.340
2.214	1.394
2.216	1.365
2.217	1.472
2.219	1.482
2.221	1.502
2.221	1.394
2.223	1.380
2.225	1.536
2.225	1.428
2.225	1.458
2.226	1.345
2.228	1.438
2.228	1.394
2.230	1.516
2.231	1.467
2.234	1.516
2.235	1.424
2.237	1.487
2.238	1.419
2.239	1.609
2.239	1.482
2.239	1.546
2.239	1.526
2.241	1.448
2.243	1.512
2.246	1.604
2.246	1.502
2.249	1.570
2.250	1.507
2.250	1.512
2.250	1.463
2.251	1.541
2.254	1.585
2.254	1.590
2.255	1.512
2.255	1.453
2.258	1.497
2.258	1.653
2.259	1.458
2.262	1.512
2.263	1.609
2.263	1.531
2.263	1.551
2.263	1.600
2.264	1.580
2.268	1.502
2.269	1.487
2.270	1.600
2.271	1.546
2.274	1.663
2.274	1.566
2.274	1.512
2.277	1.766
2.278	1.575
2.279	1.683
2.281	1.619
2.283	1.654
2.283	1.702
2.283	1.585
2.289	1.624
2.294	1.722
2.294	1.673
2.296	1.693
2.297	1.644
2.299	1.693
2.301	1.673
2.301	1.732
2.302	1.654
2.303	1.615
2.306	1.732
2.306	1.576
2.308	1.634
2.308	1.595
2.309	1.727
2.314	1.566
2.315	1.678
2.317	1.713
2.318	1.722
2.321	1.683
2.330	1.630
2.331	1.771
2.342	1.806
2.356	1.830];
data.LW_f = 10.^data.LW_f; data.LW_f(:,1) = data.LW_f(:,1)/ 10; % remove log transform, convert mm to cm
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'Raja1992';
%
data.LW_m = [ ... % log10 total length (mm), log10 weight (g)
2.009	0.751
2.012	0.736
2.017	0.853
2.019	0.722
2.019	0.867
2.028	0.790
2.060	0.887
2.061	1.013
2.065	0.858
2.065	0.877
2.067	0.892
2.068	0.979
2.072	0.931
2.073	0.955
2.077	1.008
2.079	0.916
2.080	0.921
2.085	0.872
2.086	0.926
2.086	0.989
2.086	1.004
2.087	0.916
2.090	0.940
2.091	1.077
2.094	0.965
2.097	0.974
2.100	1.028
2.100	1.072
2.103	0.984
2.106	1.004
2.107	1.086
2.109	1.028
2.109	1.047
2.110	0.970
2.112	1.077
2.113	1.145
2.115	1.067
2.116	0.979
2.116	1.047
2.119	1.038
2.121	1.086
2.122	1.047
2.122	1.135
2.124	1.057
2.124	1.096
2.129	1.077
2.129	1.091
2.131	1.111
2.131	1.169
2.132	1.081
2.132	1.159
2.134	1.120
2.135	1.135
2.136	1.067
2.138	1.091
2.140	1.218
2.141	1.106
2.143	1.154
2.146	1.188
2.146	1.193
2.149	1.125
2.149	1.159
2.151	1.184
2.152	1.237
2.153	1.101
2.153	1.252
2.154	1.193
2.157	1.164
2.157	1.198
2.157	1.198
2.157	1.242
2.159	1.252
2.160	1.256
2.160	1.329
2.161	1.149
2.163	1.145
2.166	1.305
2.168	1.218
2.168	1.252
2.169	1.198
2.169	1.237
2.169	1.349
2.173	1.286
2.175	1.271
2.178	1.232
2.181	1.193
2.181	1.295
2.184	1.286
2.186	1.286
2.187	1.218
2.187	1.232
2.188	1.247
2.190	1.315
2.190	1.344
2.191	1.295
2.193	1.393
2.194	1.373
2.196	1.320
2.197	1.334
2.198	1.266
2.198	1.383
2.199	1.349
2.203	1.349
2.204	1.320
2.204	1.422
2.205	1.373
2.205	1.373
2.209	1.325
2.210	1.300
2.210	1.441
2.211	1.373
2.211	1.466
2.212	1.349
2.212	1.417
2.212	1.441
2.215	1.383
2.216	1.334
2.216	1.402
2.216	1.461
2.220	1.359
2.221	1.412
2.222	1.368
2.224	1.475
2.225	1.315
2.225	1.354
2.225	1.378
2.226	1.393
2.226	1.441
2.229	1.495
2.230	1.397
2.230	1.432
2.234	1.388
2.237	1.422
2.237	1.441
2.237	1.470
2.237	1.509
2.241	1.475
2.241	1.490
2.242	1.417
2.243	1.519
2.244	1.393
2.244	1.412
2.247	1.582
2.248	1.446
2.249	1.461
2.250	1.504
2.251	1.490
2.254	1.514
2.255	1.451
2.256	1.470
2.256	1.568
2.256	1.597
2.257	1.558
2.259	1.524
2.260	1.461
2.262	1.553
2.263	1.480
2.265	1.495
2.265	1.500
2.265	1.543
2.266	1.553
2.267	1.582
2.269	1.607
2.269	1.641
2.269	1.660
2.272	1.519
2.274	1.577
2.274	1.616
2.276	1.563
2.279	1.597
2.279	1.621
2.282	1.577
2.282	1.665
2.284	1.543
2.284	1.660
2.287	1.548
2.287	1.616
2.287	1.626
2.291	1.592
2.291	1.631
2.293	1.602
2.293	1.665
2.296	1.660
2.298	1.660
2.300	1.577
2.301	1.636
2.303	1.602
2.304	1.611
2.306	1.680
2.306	1.684
2.307	1.728
2.311	1.670
2.311	1.699
2.315	1.718
2.321	1.757
2.323	1.723
2.326	1.641
2.329	1.680
2.331	1.592
2.331	1.782
2.334	1.718
2.336	1.655];
data.LW_m = 10.^data.LW_m; data.LW_m(:,1) = data.LW_m(:,1)/ 10; % remove log transform, convert mm to cm
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'Raja1992';

% length-fecundity
data.LN = [ ... log10 total length (mm), log10 fecundity (#)
2.207	4.507
2.217	4.317
2.243	4.611
2.243	4.555
2.263	4.335
2.265	4.375
2.265	4.645
2.265	4.348
2.270	4.519
2.270	4.312
2.274	4.049
2.276	4.759
2.278	4.499
2.279	4.599
2.279	4.179
2.281	4.716
2.291	4.506
2.301	4.913
2.304	4.676];
data.LN = 10.^data.LN; data.LN(:,1) = data.LN(:,1)/ 10; % remove log transform, convert mm to cm
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(28.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Raja1992';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00389*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C5ZQ'; % Cat of Life
metaData.links.id_ITIS = '173090'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus_lida'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_lida'; % ADW
metaData.links.id_Taxo = '172559'; % Taxonomicon
metaData.links.id_WoRMS = '219857'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-lida'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus_lida}}';
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
bibkey = 'Raja1992'; type = 'article'; bib = [ ...
'doi = {10.33997/j.afs.2012.25.2.009}, ' ...
'author = {Arjuna Rajaguru}, ' ...
'year = {1992}, ' ...
'title = {Biology of two co-occurring tongueflishes, \emph{Cynoglossus arel} and \emph{C. Lida} ({P}leuronectiformes: {C}ynoglossidae), from {I}ndian waters}, ' ... 
'journal = {Fishery Bulletin, U.S.}, ' ...
'volume = {90}, ' ...
'pages = {328-367}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-lida.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
