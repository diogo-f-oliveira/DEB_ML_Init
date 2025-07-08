function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_arel
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_arel'; 
metaData.species_en = 'Largescale tongue sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % in K, body temp
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
data.ab = 2.9;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(27.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21.2;   units.Lp = 'cm';  label.Lp = 'total length at puberty';      bibkey.Lp = 'Raja1992';
data.Lpm = 19.5;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males';  bibkey.Lpm = 'Raja1992';
data.Li = 40;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 9.2e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Raja1992';
  comment.Wwb = 'based on egg diameter of 0.56 mm: pi/6*0.056^3';
data.Wwp = 47;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00398*Lp^3.07, see F1';
data.Wwi = 329; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00398*Li^3.07, see F1';

% uni-variate data
% time-length        
data.tL_fm = [ ... % age (yrs), total length (cm) 
1	19.817 19.651
2	31.324 27.523
3	39.155 33.602];
data.tL_fm(:,1) = 365 * (0.2+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(27.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Raja1992'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % log10 total length (mm), log10 weight (g)
2.029	0.659
2.040	0.697
2.062	0.791
2.064	0.810
2.069	0.839
2.077	0.839
2.084	0.810
2.101	0.990
2.119	0.933
2.121	1.104
2.135	0.952
2.137	1.075
2.139	1.008
2.148	1.008
2.154	1.027
2.159	1.037
2.161	1.112
2.163	1.065
2.168	1.112
2.170	1.131
2.174	1.112
2.174	1.131
2.178	1.169
2.181	1.141
2.181	1.159
2.185	1.207
2.185	1.283
2.189	1.302
2.190	1.178
2.192	1.254
2.200	1.216
2.205	1.263
2.209	1.254
2.209	1.377
2.211	1.349
2.214	1.282
2.216	1.292
2.220	1.273
2.220	1.330
2.226	1.377
2.233	1.358
2.244	1.358
2.244	1.396
2.246	1.481
2.250	1.547
2.251	1.386
2.253	1.367
2.255	1.433
2.262	1.462
2.267	1.395
2.271	1.462
2.273	1.481
2.279	1.518
2.282	1.442
2.284	1.499
2.286	1.604
2.288	1.471
2.288	1.490
2.290	1.509
2.295	1.537
2.295	1.556
2.297	1.641
2.299	1.594
2.304	1.490
2.306	1.518
2.306	1.565
2.310	1.632
2.312	1.594
2.315	1.603
2.315	1.641
2.317	1.565
2.317	1.708
2.330	1.603
2.334	1.603
2.334	1.622
2.334	1.669
2.334	1.707
2.338	1.736
2.341	1.669
2.343	1.764
2.345	1.698
2.350	1.735
2.352	1.641
2.352	1.830
2.358	1.707
2.358	1.773
2.361	1.754
2.365	1.792
2.369	1.821
2.369	1.849
2.372	1.773
2.373	1.877
2.373	1.963
2.376	1.716
2.380	1.839
2.383	1.820
2.387	1.953
2.389	1.877
2.391	1.811
2.393	1.839
2.393	1.849
2.396	1.877
2.396	1.981
2.398	1.896
2.406	1.962
2.407	1.848
2.411	1.810
2.411	1.962
2.411	2.048
2.413	1.924
2.422	1.981
2.424	1.915
2.426	1.933
2.427	1.981
2.431	1.952
2.435	2.028
2.435	2.095
2.438	2.000
2.444	2.000
2.446	2.056
2.455	2.037
2.457	1.999
2.459	2.075
2.460	2.037
2.464	2.028
2.464	2.113
2.470	2.047
2.479	1.999
2.484	2.046
2.486	2.056
2.486	2.198
2.492	2.160
2.497	2.122
2.501	2.084
2.504	2.131
2.510	2.103
2.514	2.245
2.518	2.321
2.519	2.255
2.523	2.179
2.523	2.283
2.527	2.292
2.530	2.292
2.532	2.188
2.536	2.273
2.540	2.321
2.545	2.396
2.550	2.339
2.556	2.368
2.558	2.339
2.560	2.415
2.574	2.396
2.574	2.424
2.582	2.481
2.586	2.557
2.587	2.548
2.598	2.490
2.615	2.519
2.617	2.613
2.617	2.689];
data.LW_f = 10.^data.LW_f; data.LW_f(:,1) = data.LW_f(:,1)/ 10; % remove log transform, convert mm to cm
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'Raja1992';
%
data.LW_m = [ ... % log10 total length (mm), log10 weight (g)
2.045	0.726
2.079	0.877
2.088	0.877
2.091	0.834
2.098	0.921
2.098	1.000
2.115	0.971
2.124	0.942
2.131	1.043
2.139	1.014
2.141	1.108
2.145	1.043
2.148	1.093
2.153	1.065
2.155	1.173
2.170	1.194
2.175	1.122
2.177	1.158
2.177	1.173
2.187	1.158
2.189	1.093
2.189	1.216
2.189	1.252
2.194	1.166
2.196	1.238
2.198	1.302
2.199	1.245
2.203	1.166
2.206	1.259
2.206	1.288
2.210	1.230
2.210	1.317
2.212	1.389
2.213	1.281
2.217	1.374
2.220	1.317
2.220	1.346
2.222	1.252
2.223	1.266
2.227	1.353
2.227	1.410
2.230	1.360
2.234	1.403
2.241	1.367
2.241	1.382
2.244	1.403
2.249	1.331
2.251	1.374
2.253	1.475
2.256	1.446
2.256	1.540
2.258	1.360
2.259	1.439
2.265	1.468
2.266	1.497
2.268	1.598
2.270	1.367
2.273	1.526
2.275	1.432
2.275	1.475
2.277	1.526
2.283	1.461
2.283	1.497
2.283	1.526
2.285	1.612
2.287	1.583
2.287	1.583
2.289	1.598
2.290	1.562
2.294	1.519
2.294	1.533
2.297	1.619
2.299	1.483
2.301	1.583
2.302	1.540
2.306	1.483
2.306	1.619
2.306	1.627
2.311	1.677
2.314	1.605
2.316	1.727
2.323	1.619
2.325	1.663
2.328	1.619
2.330	1.655
2.333	1.684
2.333	1.706
2.335	1.627
2.336	1.569
2.338	1.691
2.338	1.735
2.342	1.749
2.342	1.749
2.344	1.764
2.345	1.612
2.347	1.684
2.350	1.720
2.352	1.756
2.352	1.814
2.355	1.706
2.357	1.634
2.361	1.792
2.366	1.720
2.366	1.785
2.366	1.864
2.369	1.742
2.369	1.771
2.371	1.706
2.371	1.800
2.371	1.814
2.373	1.850
2.378	1.857
2.381	1.771
2.383	1.828
2.383	1.836
2.385	1.807
2.386	1.850
2.391	1.857
2.393	1.814
2.395	1.908
2.397	1.857
2.402	1.893
2.403	1.857
2.405	1.936
2.405	1.972
2.414	1.944
2.415	1.857
2.415	1.900
2.424	1.965
2.426	1.879
2.426	1.958
2.428	2.001
2.436	1.915
2.441	2.073
2.443	1.972
2.443	1.994
2.446	2.023
2.469	2.109
2.477	2.109
2.496	2.138
2.498	2.210
2.503	2.167
2.506	2.153
2.522	2.217
2.527	2.282
2.530	2.253
2.530	2.354
2.539	2.297
2.549	2.405];
data.LW_m = 10.^data.LW_m; data.LW_m(:,1) = data.LW_m(:,1)/ 10; % remove log transform, convert mm to cm
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'Raja1992';

% length-fecundity
data.LN = [ ... % log10 total length (mm), log10 fecundity (#)
2.318	4.486
2.320	4.412
2.320	4.170
2.324	4.339
2.326	4.361
2.342	4.431
2.363	4.423
2.370	4.625
2.373	4.666
2.383	4.283
2.393	4.507
2.399	4.680
2.416	4.323
2.419	4.514
2.421	4.654
2.432	4.437
2.441	4.658
2.444	4.683
2.456	4.790
2.464	4.599
2.531	4.377
2.532	4.866
2.541	4.539
2.548	5.090
2.643	4.832];
data.LN = 10.^data.LN; data.LN(:,1) = data.LN(:,1)/ 10; % remove log transform, convert mm to cm
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(27.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
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
F1 = 'Length-Weight relationship: W in g = 0.00398*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C5YG'; % Cat of Life
metaData.links.id_ITIS = '173085'; % ITIS
metaData.links.id_EoL = '46570041'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus_arel'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_arel'; % ADW
metaData.links.id_Taxo = '172536'; % Taxonomicon
metaData.links.id_WoRMS = '274193'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-arel'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus_arel}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-arel.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
