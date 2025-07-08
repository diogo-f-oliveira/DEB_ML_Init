function [data, auxData, metaData, txtData, weights] = mydata_Perna_perna

%% set metaData

metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Perna_perna'; 
metaData.species_en = 'Brown mussel'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'T-JO'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author  = {'Cristian Monaco';'Morgana Tagliarolo'; 'Valeria Montalto'; 'Gianluca Sara'; 'Christopher D. McQuaid'};    
metaData.date_subm = [2017 08 27];              
metaData.email    = {'cristianmonaco@gmail.com'};            
metaData.address  = {'Rhodes University, South Africa'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.nuiva.no'}; 
metaData.date_acc    = [2018 10 03]; 


%% set data

% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Aara2013';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 12;      units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Aara2013';   
  temp.tj = C2K(21);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 100;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Berr1978';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'estimated from the Berr1987 subtidal growth curve, assuming Lp = 29 mm';
data.am = 9 * 365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Lind1998';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'lifespan on exposed (2-3years) and sheltered (5-9 years) in south Africa';

data.Lb  = 0.008822; units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'Aara2013';
  comment.Lb = '48 h after fertilisation the D-larvae has an initial size of 88.22 x 66.54 um';
data.Lj  = 0.0255; units.Lj  = 'cm';  label.Lj  = 'shell length at metam';   bibkey.Lj  = 'Aara2013';
  comment.Lj = 'pediveliger stage 250.14 x 222.45 or 278.83 X 259.52 um - Primary settlers 200-400 um';
  
data.Lp  = 2.9;  units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Phil1995';
  comment.Lp = 'Intertidal South Africa 25-30mm';
    
data.Li  = 12;    units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Acos2009';
  comment.Li = '120mm subtidal, 90mm intertidal, 99 intertidal low';
data.Li  = 12;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li_fsubt  = 'Acos2009';
data.GSI_f  = 0.6; units.GSI_f  = '-'; label.GSI_f  = 'gonado somatic index';    bibkey.GSI_f  = 'Acos2009';   
  temp.GSI_f = C2K(26); units.temp.GSI_f = 'K'; label.temp.GSI_f = 'temperature';
   
data.Wwb = 2.69e-8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on .03693*Lb^3 from HareKooy1993';
  
  
% uni-variate data

% t-L data Subtidal South Africa
data.tL =   [ ...    % time settlement (months), shell length (mm)
    1.116188276	7.521696341
    2.106273435	22.92744028
    3.615411519	31.42345889
    4.664253703	35.66341594
    5.586211945	46.47400913
    6.440043271	52.68945155
    7.289580063	51.68113089
    8.343692811	64.78661537
    9.385702782	57.53422206
    10.37051738	64.07443858
    11.28798588	67.33291581
    12.27123883	71.24630939
    13.2554678	76.8014673
    14.23891596	81.04321374
    15.28580608	81.99964212
    16.72779328	87.54227431
    17.7135839	95.72425517
    18.49772666	94.7177239
    19.48156523	99.61617608];
data.tL(:,1)  = data.tL(:,1) * 30;  % convert time to d
data.tL(:,2)  = data.tL(:,2) / 10;  % convert shell length to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Berr1978';
comment.tL = 'Subtidal population Durban, South Africa';

% L-W data
data.LW = [ ...
    3.053	0.1186
    3.174	0.1157
    3.279	0.1146
    3.557	0.1863
    3.57	0.1936
    3.506	0.1612
    4.485	0.2852
    4.826	0.402
    4.226	0.3541
    4.932	0.3437
    4.274	0.2675
    4.503	0.3748
    4.257	0.4155
    4.007	0.3076
    6.565	0.7526
    5.646	0.6164
    6.202	0.6893
    4.258	0.2319
    6.987	0.7737
    4.207	0.3068
    4.767	0.381
    7.879	1.1784
    3.814	0.2632
    5.661	0.6005
    4.639	0.4199
    6.172	0.5919
    4.069	0.2826
    5.33	0.4077
    4.239	0.2791
    5.405	0.43
    3.364	0.1072
    7.211	0.8519
    4.392	0.3775
    4.411	0.3032
    8.55	1.1946
    5.123	0.4586
    3.798	0.2221
    4.76	0.3059
    4.354	0.2736
    7.759	1.0202
    3.529	0.1366
    8.832	1.8617
    3.592	0.1809
    7.577	1.3975
    3.625	0.2066
    2.969	0.137
    5.951	0.6745
    4.207	0.3669
    6.798	0.7952
    6.219	0.9602
    3.757	0.2133
    5.267	0.5482
    9.619	3.0815
    7.163	0.7696
    4.303	0.2419
    6.832	0.7619
    9.527	1.8703
    2.984	0.0982
    4.418	0.3156
    4.411	0.3776
    4.225	0.2129
    3.83	0.2052
    3.705	0.224
    4.578	0.2306
    4.571	0.3384
    5.88	0.4458
    6.412	0.6304
    5.052	0.3141
    5.368	0.4104
    4.138	0.2601
    5.7	0.4405
    4.741	0.3071
    7.229	0.6369
    8.434	1.0839
    8.105	0.872
    5.694	0.4321
    7.412	0.9781
    6.299	0.6438
    2.824	0.0845
    3.091	0.0669
    4.049	0.2063
    3.988	0.1488
    3.52	0.2069
    3.279	0.1544
    3.532	0.1988
    3.127	0.1724
    6.294	0.4873
    3.352	0.1238
    2.948	0.1045
    3.465	0.1389
    3.404	0.1457
    4.239	0.2396
    3.922	0.2181
    4.763	0.3391
    6.647	0.3913
    8.84	1.3221
    4.049	0.3251
    3.702	0.158
    4.153	0.216
    4.512	0.3
    4.85	0.4535
    8.795	1.2347
    8.327	1.2968
    4.779	0.3905
    7.484	0.9002
    5.848	0.6646
    6.412	0.4798
    7.016	0.7434
    6.927	1.0491
    6.86	0.4699
    8.808	1.2475
    9.542	3.0577
    9.582	1.4057
    7.489	0.8126
    10.106	3.3411
    8.22	1.1673
    9.696	1.1688
    8.214	0.8005
    8.408	1.3346
    11.165	2.8257
    3.149	0.1616
    3.437	0.2626
    3.554	0.2338
    3.561	0.2049
    3.312	0.1942
    3.602	0.2545
    3.676	0.2051
    3.789	0.2738
    3.822	0.2391
    3.51	0.2027
    3.391	0.2443
    3.953	0.3264
    3.803	0.3174
    7.942	1.0939
    7.933	1.1917
    4.212	0.3181
    4.488	0.4474
    4.263	0.3926
    4.093	0.3458
    4.879	0.5511
    4.522	0.3815
    4.656	0.4926
    5.421	0.6092
    6.217	0.8299
    6.075	0.7181
    5.478	0.4644
    4.858	0.4974
    6.654	0.9147
    7.61	0.4904
    7.817	1.4704
    4.475	0.3006
    5.271	0.5506
    10.539	1.7657
    6.805	1.0489
    5.471	0.6474
    6.412	0.9995
    9.056	1.3859
    5.696	0.5526
    5.954	0.723
    4.656	0.4943
    5.957	0.4182
    4.977	0.5203
    6.025	0.7857
    5.919	0.6401
    9.879	1.5451
    3.408	0.1913
    4.086	0.2889
    3.677	0.2437
    3.599	0.1928
    7.073	0.8789
    5.03	0.5441
    4.037	0.267
    4.433	0.2848
    4.798	0.5107
    3.931	0.2294
    4.471	0.3868
    3.821	0.2743
    4.052	0.3127
    4.039	0.228
    8.607	1.7874
    4.108	0.2421
    4.066	0.23
    4.105	0.3313
    4.56	0.2875
    4.033	0.2111
    5.172	0.4505
    5.196	0.463
    5.006	0.471
    5.914	0.689
    5.896	0.5644
    5.465	0.089
    5.817	0.4273
    6.78	0.6648
    5.698	0.4813
    3.959	0.1976
    3.054	0.1359
    3.209	0.1492
    3.335	0.1382
    3.699	0.1643
    3.779	0.2028
    3.743	0.1731
    3.384	0.145
    3.744	0.1808
    3.719	0.0397
    3.576	0.1592
    3.541	0.1638
    3.404	0.1532
    6.873	0.8299
    7.882	0.5439
    9.029	1.9456
    4.542	0.2853
    4.645	0.3567
    3.549	0.1306
    3.871	0.1789
    4.05	0.1768
    5.022	0.3343
    3.549	0.1293
    4.956	0.4327
    4.13	0.2147
    4.19	0.2371
    4.659	0.268
    3.358	0.1267
    4.526	0.2638
    4.545	0.2939
    6.173	0.6693
    4.884	0.3357
    3.063	0.1214
    5.271	0.3862
    3.874	0.1765
    5.905	0.6683
    7.121	0.9608
    7.345	0.8848
    4.31	0.269
    3.688	0.1669
    7.574	0.9842
    4.008	0.2054
    3.083	0.0875
    3.091	0.1213
    4.641	0.279
    8.812	1.573
    4.439	0.247
    4.162	0.1993
    4.695	0.2802
    5.446	0.4457
    5.337	0.3355
    5.903	0.5193
    9.083	1.3856
    7.671	1.1699
    8.566	1.2659
    10.498	2.2408
    3.497	0.1307
    3.295	0.0926
    4.364	0.2387
    4.024	0.2066
    3.444	0.1332
    2.99	0.0683
    3.358	0.0993
    4.551	0.2309
    8.966	1.5619
    7.71	0.7639
    8.802	1.0733
    6.199	0.4199
    6.92	0.6924
    4.57	0.2808
    6.257	0.4355
    3.049	0.1189
    3.96	0.1594
    4.424	0.1903
    4.951	0.2928
    5.723	0.443
    8.328	1.1244
    6.311	0.6389
    7.951	1.2109
    5.961	0.7553
    4.3	0.3795
    3.666	0.2343
    4.872	0.4457
    4.575	0.366
    4.097	0.2674
    5.195	0.648
    3.933	0.2399
    4.184	0.2813
    4.069	0.2678
    4.232	0.253
    5.834	0.69
    8.335	1.3016
    6.519	0.8443
    5.909	0.7738
    5.522	0.7547
    4.987	0.3551
    5.903	0.5372
    2.977	0.1122
    3.495	0.2464
    3.205	0.1183
    6.485	0.8085
    4.353	0.2951
    3.232	0.127
    3.943	0.2461
    3.434	0.1503
    3.241	0.1421
    5.943	0.7148
    6.741	0.919
    5.469	0.5726
    3.4	0.1527
    4.061	0.2817
    8.456	1.6967
    6.364	0.9132
    5.04	0.6502
    4.434	0.3138
    8.343	1.4336
    7.761	1.4912
    4.932	0.4081
    3.991	0.237
    4.077	0.2685
    5.151	0.5691
    4.418	0.2335
    3.623	0.202
    3.375	0.1298
    5.055	0.4001
    6.529	0.9304
    6.088	0.6471
    4.932	0.4716
    5.61	0.4665
    5.33	0.4537
    8.051	1.4966
    10.673	2.4208
    9.915	2.0794
    3.277	0.0976
    3.812	0.2118
    4.81	0.4263
    7.147	0.9927
    5.466	0.713
    4.042	0.2907
    3.317	0.1804
    5.423	0.9428
    3.385	0.2302
    5.71	0.7972
    5.525	0.988
    6.223	0.6187
    4.119	0.3487
    6.446	0.9249
    5.681	0.8393
    5.127	0.5691
    5.294	0.5842
    4.538	0.448
    4.274	0.3062
    3.686	0.2574
    5.029	0.4088
    7.329	1.082
    6.381	0.813
    4.622	0.3179
    3.441	0.2203
    3.694	0.2557
    3.714	0.1855
    3.737	0.2836
    3.238	0.1828
    3.314	0.2022
    2.995	0.1486
    7.743	1.4236
    9.363	2.3118
    5.75	0.7682
    3.953	0.2514
    5.007	0.45
    4.137	0.2595
    7.535	1.2265
    3.686	0.203
    3.342	0.1747
    3.488	0.1963
    6.419	0.6793
    3.758	0.2097
    7.09	0.6258
    4.112	0.2783
    4.03	0.2512
    5.733	0.5108
    6.97	0.8585
    3.006	0.1785
    4.904	0.4316
    2.975	0.1116
    8.295	1.4175
    3.345	0.171
    5.075	0.5737
    4.289	0.3097
    5.981	0.9405
    5.145	0.6074
    3.011	0.1016
    3.175	0.1419
    5.62	0.4595
    7.634	1.2659
    10.095	1.6645
    5.086	0.5915
    4.011	0.372
    5.887	0.8322
    4.732	0.5033
    4.739	0.4077
    3.593	0.2334
    6.045	0.7314
    4.263	0.3801
    6.229	0.837
    4.077	0.3639
    6.31	0.8246
    4.641	0.3771
    5.315	0.613
    3.505	0.3106
    3.546	0.1789
    3.407	0.2873
    5.541	0.8211
    3.891	0.3474
    4.809	0.5387
    6.905	1.1814
    3.843	0.2386
    4.448	0.5372
    8.527	2.9991
    3.173	0.2044
    3.458	0.1973
    7.864	2.1445
    6.336	0.9654
    3.713	0.3184
    4.971	0.5696
    4.887	0.5435
    4.176	0.3064
    5.126	0.5417
    11.281	3.6033
    5.806	0.9068
    6.293	0.7561
    3.847	0.3448
    4.352	0.3596
    4.107	0.4056
    3.941	0.2349
    4.173	0.345
    4.881	0.5771
    3.437	0.1623
    7.293	1.3569
    6.809	1.0992
    9.99	2.8545
    4.955	0.6753
    6.008	0.9449
    9.573	2.0072
    9.046	1.9238
    7.111	1.597
    3.768	0.1917
    4.622	0.3456
    3.399	0.2472
    5.932	0.8766
    5.666	0.5619
    5.361	0.5824
    3.997	0.2387
    3.647	0.2149
    5.803	0.73
    9.903	2.8483];
units.LW   = {'cm', 'g'};  label.LW = {'shell length', 'soma dry weight'};  
comment.LW = 'data collected from individuals at different shore levels. South coast of South Africa';
bibkey.LW = 'Mona2016';
%
% temperature - specific respiration data
data.TjO = [ ... % temperature (C), specific O_2 consumption (ml/h.g)
9	0.401452371
9	0.895359762
9	0.221495725
18	0.097899514
18	0.219559326
18	0.449895437
18	0.149966084
27	0.918963958
27	0.943714949
27	0.994432723
36	1.400862918
36	1.639532299
36	1.134160013
9	0.262593466
9	0.285894165
9	0.290240482
18	0.101138295
18	0.437655907
18	0.093908079
27	0.88544071
27	0.942857021
27	0.934854184
27	0.831789504
36	0.63253389
36	0.854616489
36	0.378131715
36	0.530480273];
units.TjO  = {'C', 'ml/h.g'};  label.TjO = {'temperature', 'specific O_2 consumption'};  
bibkey.TjO = 'TaglMcQu2016';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Facts
F1 = 'An eariler version of this entry was by TaglMcQu2016';
metaData.bibkey.F1 = 'TaglMcQu2016'; 
metaData.facts = struct('F1',F1);

%% Discussion
D1 = 'This version assumes that metamorphosis coincides with settlement';
D2 = 'Weight zero is given to Lb because the shape is probably different from that of post-settlement individuals.';
metaData.discussion = struct('D1',D1,'D2',D2);

%% Links
metaData.links.id_CoL = '6V5KY'; % Cat of Life
metaData.links.id_ITIS = '568077'; % ITIS
metaData.links.id_EoL = '46466849'; % Ency of Life
metaData.links.id_Wiki = 'Perna_perna'; % Wikipedia
metaData.links.id_ADW = 'Perna_perna'; % ADW
metaData.links.id_Taxo = '517077'; % Taxonomicon
metaData.links.id_WoRMS = '140483'; % WoRMS
metaData.links.id_molluscabase = '140483'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Perna_perna}}';
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
bibkey = 'Acos2009'; type = 'Article'; bib = [ ...  
'author = {Vanessa Acosta and Mar\''{i}a E. Glem and Yolimar Natera and Trinidad Urbano and John H. Himmelman and Manuel Rey-M\''{e}ndez and C\''{e}sar Lodeiros}, ' ...
'year = {2009}, ' ...
'title  = {Differential growth of the mussels \emph{Perna perna} and \emph{Perna viridis} (Bivalvia: Mytilidae) in suspended culture in the {G}olfo de {C}ariaco, {V}enezuela}, ' ...
'journal = {Journal of the World Aquaculture Society}, ' ...
'volume = {40}, ' ...
'pages = {226--235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aara2013'; type = 'Article'; bib = [ ...  
'author = {Lahoussine Aarab and Alejandro Prez-Camacho and Mara del Pino Viera-Toledo and Gercende Courtois de Viose and Hiplito Fernndez-Palacios and Lucia Molina}, ' ...
'year = {2013}, ' ...
'title  = {Embryonic development and influence of egg density on early veliger larvae and effects of dietary microalgae on growth of brown mussel \emph{Perna perna} (L. 1758) larvae under laboratory conditions}, ' ...
'journal = {Aquaculture International}, ' ...
'volume = {21}, ' ...
'pages = {1065-1076}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Berr1978'; type = 'techreport'; bib = [ ...  
'author = {Patrick F Berry}, ' ...
'year = {1978}, ' ...
'title  = {Reproduction, growth and production in the mussel, \emph{Perna perna} ({L}innaeus), on the east coast of {S}outh {A}frica}, ' ...
'institution = {Oceanographic Research Institute}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lind1998'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Tracey Lynn Lindsay}, ' ...
'year = {1998}, ' ...
'title  = {Population dynamics and growth rate of the brown mussel (\emph{Perna perna}) on wave exposed and wave sheltered shores of {S}outh {A}frica}, ' ...
'publisher = {Rhodes University}, ' ...
'pages = {195}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TaglMcQu2016'; type = 'Article'; bib = [ ...
'author = {Morgana Tagliarolo, Christopher D. McQuaid}, ' ... 
'year = {2015}, ' ...
'title = {Sub-lethal and sub-specific temperature effects are better predictors of mussel distribution than thermal tolerance.}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {535}, ' ...
'pages = {145--159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mona2016'; type = 'unpublished'; bib = [ ...
'author = {Cristian Monaco}, ' ... 
'year = {2016}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Phil1995'; type = 'Book'; bib = [ ...  
'author = {Tracey Elizabeth Phillips}, ' ...
'year = {1995}, ' ...
'title  = {Dispersal, settlement and recruitment: their influence on the population dynamics of intertidal mussels}, ' ...
'publisher = {Rhodes University}, ' ...
'pages = {261}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HareKooy1993'; type = 'Article'; bib = [ ... 
'author = {Haren, R. van and Kooijman, S. A. L. M.}, ' ... 
'year = {1993}, ' ...
'title = {Application of a {D}ynamic {E}nergy {B}udget model to \emph{Mytilus edulis} ({L}.)}, ' ...
'journal = {Neth. J. Sea Res.}, ' ...
'volume = {31}, ' ...
'doi  = {10.1016/0077-7579(93)90002-a}, '...
'pages = {119-133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
