  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_peronii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_peronii'; 
metaData.species_en = 'Notchedfin threadfin bream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 23];

%% set data

% zero-variate data

data.am = 6*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'SainWhit1984';   
  temp.am = C2K(27.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'WuWeng2008'; 
data.Li = 29;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 6.6e-5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'WuWeng2008';
  comment.Wwb = 'based on egg diameter of  0.5 mm: pi/6*0.05^3';
data.Wwi = 400;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on LW data, based on 0.01288*Li^2.95, see F1, gives 265.5 g';
  
data.Ri  = 192437/365; units.Ri = '#/d'; label.Ri  = 'reprod rate at FL 23.75 cm'; bibkey.Ri  = 'WuWeng2008';   
  temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.395	6.227
0.400	9.606
0.400	9.470
0.403	5.349
0.406	10.281
0.408	7.714
0.408	7.241
0.420	9.201
0.685	11.505
0.685	11.032
0.692	10.559
0.692	10.289
0.695	15.492
0.696	14.141
0.697	13.668
0.699	9.816
0.702	14.952
0.713	9.411
0.713	8.871
0.816	14.414
0.818	20.901
0.820	18.401
0.820	17.793
0.826	19.820
0.827	17.523
0.828	16.036
0.829	15.158
0.833	19.009
0.834	17.185
0.894	17.254
0.894	17.051
0.894	16.781
0.895	16.241
0.902	15.903
0.907	17.660
0.916	14.620
0.916	13.809
0.919	20.025
0.922	15.228
0.923	14.282
0.930	13.336
1.329	13.550
1.336	12.739
1.338	9.969
1.342	14.631
1.342	14.226
1.342	14.023
1.346	8.618
1.346	8.010
1.347	17.334
1.351	11.320
1.351	10.577
1.354	16.591
1.357	12.334
1.357	11.929
1.357	11.591
1.361	15.240
1.365	19.632
1.368	15.848
1.373	18.416
1.373	18.145
1.378	20.105
1.384	11.794
1.390	22.605
1.391	20.511
1.394	16.254
1.395	15.511
1.395	15.105
1.395	14.092
1.396	13.687
1.396	13.349
1.397	12.470
1.398	20.241
1.398	19.565
1.399	18.079
1.400	16.660
1.403	13.011
1.403	22.133
1.404	11.187
1.405	19.295
1.406	18.890
1.407	17.335
1.407	17.133
1.407	16.863
1.408	15.849
1.408	14.700
1.410	21.998
1.410	21.660
1.411	20.984
1.412	18.619
1.417	11.795
1.417	21.457
1.418	10.849
1.419	9.430
1.422	24.160
1.424	10.512
1.445	10.174
1.522	13.758
1.522	13.487
1.523	12.271
1.531	20.042
1.532	9.231
1.533	17.744
1.536	12.609
1.540	17.339
1.545	18.758
1.713	16.533
1.717	20.520
1.719	18.020
1.721	15.587
1.724	19.979
1.842	23.563
1.842	22.685
1.843	21.131
1.849	23.429
1.849	23.023
1.849	22.347
1.850	22.077
1.850	21.672
1.851	20.523
1.852	18.293
1.852	17.888
1.853	17.483
1.853	17.077
1.854	15.456
1.855	24.239
1.855	23.902
1.858	19.983
1.858	19.780
1.858	19.172
1.860	16.807
1.860	16.064
1.916	22.755
1.923	21.404
1.932	17.485
1.935	23.228
1.938	19.512
1.948	24.039
1.954	25.864
2.357	19.929
2.361	23.848
2.363	21.078
2.367	24.997
2.371	18.983
2.371	18.780
2.373	25.537
2.414	24.322
2.420	25.741
2.420	24.728
2.421	24.120
2.425	27.566
2.430	20.336
2.433	26.012
2.438	28.647
2.438	28.174
2.439	26.485
2.441	23.647
2.441	23.580
2.442	21.688
2.443	20.134
2.448	22.837
2.448	22.566
2.449	21.485
2.449	21.147
2.450	19.864
2.452	26.891
2.455	22.296
2.464	19.594
2.547	24.461
2.556	21.691
2.558	27.975
2.561	23.448
2.561	23.178
2.561	22.907
2.566	25.543
2.714	23.790
2.714	23.452
2.714	23.249
2.714	22.979
2.721	22.641
2.845	26.496
2.848	22.577
2.853	25.483
2.853	25.077
2.853	24.875
2.853	24.604
2.854	23.591
2.854	23.321
2.859	26.091
2.860	24.064
2.861	22.915
2.864	28.051
2.868	21.970
2.928	22.174
2.933	24.742
2.933	24.404
2.933	24.066
2.937	28.796
2.939	25.755
2.943	19.877
3.376	29.821
3.377	27.524
3.378	25.970
3.383	28.200
3.384	26.984
3.426	24.282
3.431	26.917
3.437	28.336
3.445	26.174
3.445	25.364
3.738	25.777
3.935	30.242
3.948	29.837
4.567	29.718
4.962	27.229];
data.tL_f(:,1) = 365 * (0.9 + data.tL_f(:,1));
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SainWhit1984';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.684	12.857
0.704	12.452
0.835	16.644
0.844	12.253
0.851	12.456
0.901	16.714
0.907	17.187
0.908	16.173
0.909	14.619
0.916	14.011
0.933	18.809
1.358	20.442
1.402	23.957
1.405	19.835
1.419	18.214
1.420	17.944
1.420	17.606
1.424	20.512
1.427	16.390
1.432	18.688
1.434	16.931
1.522	13.960
1.729	13.696
1.732	19.169
1.732	18.763
1.733	17.750
1.735	14.844
1.746	17.547
1.828	24.306
1.828	24.171
1.834	24.915
1.847	26.537
1.847	25.253
1.850	21.672
1.863	21.267
1.917	20.998
1.923	21.336
1.925	19.377
1.929	22.890
1.931	18.971
1.934	15.052
1.934	24.715
1.936	22.282
1.937	20.458
1.939	18.093
1.943	22.147
2.359	27.429
2.359	26.145
2.362	22.969
2.362	21.956
2.363	21.551
2.366	25.807
2.367	24.186
2.368	24.051
2.368	23.780
2.412	27.295
2.427	24.323
2.428	23.782
2.428	23.782
2.433	26.350
2.435	23.444
2.444	29.188
2.545	27.704
2.552	27.096
2.552	26.421
2.554	23.650
2.559	26.623
2.560	25.610
2.560	25.204
2.560	24.867
2.563	20.813
2.564	19.461
2.566	25.948
2.567	23.786
2.712	26.087
2.715	22.101
2.718	27.236
2.719	26.493
2.721	22.844
2.727	24.060
2.727	23.790
2.731	28.047
2.845	27.374
2.858	27.713
2.861	22.375
2.925	27.039
2.934	22.579
2.935	21.093
2.937	28.120
2.938	27.715
2.939	26.161
2.947	23.188
3.362	29.753
3.362	29.618
3.375	30.091
3.382	30.565
3.393	23.741
3.416	29.484
3.423	29.282
3.423	28.876
3.423	28.471
3.430	28.201
3.432	25.025
3.435	30.296
3.543	27.799
3.550	27.596
3.557	27.326
3.702	29.087
3.718	25.844
3.724	27.060
3.724	26.452
3.829	29.428
3.849	28.888
3.856	28.280
3.914	30.511
3.915	29.430
3.915	29.025
3.916	27.741
3.922	28.552
3.927	30.985
3.928	30.241
3.928	29.904
3.929	28.350
3.930	27.201
4.355	29.037
4.422	28.363
4.429	27.890
4.430	26.674
4.436	27.147
4.441	29.917
4.714	29.857
4.829	27.428
4.947	29.728];
data.tL_m(:,1) = 365 * (0.9 + data.tL_m(:,1));
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m = C2K(27.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SainWhit1984';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
8.117	10.858
8.459	13.352
8.915	18.332
8.991	15.024
9.143	15.029
9.333	16.691
9.561	17.526
9.675	18.357
9.789	18.361
9.942	28.295
10.017	20.023
10.283	21.687
10.284	23.341
10.702	23.355
10.853	21.705
10.968	29.156
11.119	22.542
11.234	25.855
11.276	63.091
11.505	77.992
11.576	27.521
11.614	32.487
11.615	39.934
11.804	30.011
11.957	35.808
12.074	69.736
12.147	40.779
12.298	34.165
12.413	39.960
12.494	87.126
12.794	45.765
12.794	50.730
12.831	36.665
12.942	15.155
12.945	39.978
13.249	43.298
13.365	61.505
13.401	36.683
13.478	49.097
13.552	30.069
13.555	57.374
13.629	42.483
13.744	54.071
13.821	58.210
14.010	48.287
14.125	55.738
14.390	52.437
14.391	60.711
14.431	77.261
14.580	54.098
14.620	65.684
14.732	54.103
14.809	63.208
14.884	54.936
14.886	71.484
15.076	68.181
15.305	78.118
15.341	60.743
15.341	63.225
15.456	72.331
15.607	64.061
15.723	78.131
15.724	88.061
15.760	68.204
15.875	82.274
15.990	92.206
16.102	76.489
16.217	86.422
16.254	71.530
16.329	66.568
16.370	91.392
16.372	107.113
16.407	81.464
16.410	110.424
16.482	75.674
16.522	87.260
16.560	95.535
16.711	80.646
16.787	85.613
16.865	98.027
16.940	91.410
17.053	81.485
17.055	104.653
17.091	86.451
17.132	106.310
17.168	93.073
17.206	89.764
17.207	99.694
17.359	98.871
17.360	111.283
17.475	116.251
17.511	105.496
17.586	93.914
17.626	109.636
17.667	141.907
17.738	91.437
17.777	101.367
17.816	113.780
17.966	98.064
17.967	106.338
18.083	125.373
18.116	79.865
18.158	112.136
18.311	120.416
18.347	102.214
18.347	105.523
18.576	113.805
18.577	124.562
18.616	135.319
18.767	120.431
18.843	122.088
18.844	130.362
18.959	140.295
19.034	133.678
19.108	117.132
19.111	140.300
19.184	109.688
19.262	127.894
19.302	152.718
19.335	104.729
19.340	148.582
19.490	137.003
19.605	142.799
19.644	148.592
19.756	132.047
19.871	143.635
19.872	155.219
20.099	140.333
20.100	150.262
20.366	148.616
20.367	158.545
20.484	187.509
20.596	168.482
20.633	164.346
20.670	156.900
20.748	173.451
20.823	158.560
20.825	181.728
20.976	169.322
21.203	164.365
21.242	175.950
21.356	175.954
21.548	189.199
21.815	197.482
21.852	189.209
22.004	193.351
22.538	206.608
22.691	220.679
22.880	214.893
23.565	222.363
23.988	266.230
24.598	288.591];
units.LW = {'cm', 'g'}; label.LW = {'fork length', 'weight'};  
bibkey.LW = 'WuWeng2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.01288*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '46826'; % Cat of Life
metaData.links.id_ITIS = '168998'; % ITIS
metaData.links.id_EoL = '46581017'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus_peronii'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_peronii'; % ADW
metaData.links.id_Taxo = '180980'; % Taxonomicon
metaData.links.id_WoRMS = '218520'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus-peronii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus_peronii}}';  
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
bibkey = 'WuWeng2008'; type = 'article'; bib = [ ...  
'author = {Chuen-Chi Wu and Jinn-Shing Weng and Kwang-Ming Liu and Wei-Cheng Su}, ' ...
'year = {2008}, ' ...
'title = {Reproductive Biology of the Notchedfin Threadfin Bream, \emph{Nemipterus peronii} ({N}emipteridae), in Waters of Southwestern {T}aiwan}, ' ... 
'journal = {Zoological Studies}, ' ...
'volume = {47(1)}, '...
'pages = {103-113}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SainWhit1984'; type = 'article'; bib = [ ...  
'author = {K. J. Sainsbury and A. W . Whitelaw}, ' ...
'year = {1984}, ' ...
'title = {Biology of Peron''s Threadfin Bream, \emph{Nemipterus peronii} ({V}alenciennes), from the North West Shelf of {A}ustralia}, ' ... 
'journal = {Aust. J. Mar. Freshw. Res.}, ' ...
'volume = {35}, '...
'pages = {167-185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-peronii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
