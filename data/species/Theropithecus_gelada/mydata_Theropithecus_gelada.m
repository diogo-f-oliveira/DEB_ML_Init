function [data, auxData, metaData, txtData, weights] = mydata_Theropithecus_gelada

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Theropithecus_gelada'; 
metaData.species_en = 'Gelada'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 04 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 168;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 1.4*365;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4.4*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'LuBerg2016';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 6*365;   units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'LuBerg2016';
  temp.tpm = C2K(38);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 36*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 18;   units.Lb = 'cm';   label.Lb = 'sholder-rump length at birth';    bibkey.Lb = 'LuBerg2016';
data.Lx = 28.8;   units.Lx = 'cm';   label.Lx = 'sholder-rump length at weaning';    bibkey.Lx = 'LuBerg2016';
data.Lp = 43.5;   units.Lp = 'cm';   label.Lp = 'sholder-rump length at puberty';    bibkey.Lp = 'LuBerg2016';
data.Lpm = 48.5;   units.Lpm = 'cm';   label.Lpm = 'sholder-rump length at puberty for males';    bibkey.Lpm = 'LuBerg2016';
data.Li = 49;   units.Li = 'cm';   label.Li = 'ultimate sholder-rump length';    bibkey.Li = 'LuBerg2016';
data.Lim = 56.3;   units.Lim = 'cm';   label.Lim = 'ultimate sholder-rump length form males';    bibkey.Lim = 'LuBerg2016';

data.Wwb = 464;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnAge';
data.Wwx = 3900;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'AnAge';
data.Wwi = 11000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
data.Wwim = 18500; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Wiki';

data.Ri  = 0.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.106	19.066
0.265	20.106
0.265	21.143
0.370	21.899
0.423	20.768
0.503	20.014
0.556	20.770
0.582	21.525
0.582	23.317
0.661	19.450
0.661	25.677
0.714	22.564
0.714	23.130
0.899	26.434
0.952	24.643
0.952	25.303
0.952	25.869
0.979	27.001
0.979	27.473
1.058	26.436
1.058	27.851
1.138	29.551
1.190	25.117
1.190	28.231
1.270	29.552
1.296	28.232
1.323	31.062
1.349	32.289
1.376	26.535
1.561	27.669
1.561	31.443
1.561	30.971
1.561	32.575
1.587	28.235
1.614	29.085
1.614	29.745
1.640	33.519
1.667	35.595
1.693	32.388
1.772	30.785
1.772	33.049
1.825	36.069
1.852	31.824
1.878	34.088
1.878	35.598
1.905	30.504
1.905	31.070
2.037	33.335
2.063	35.883
2.116	34.469
2.143	35.412
2.222	34.753
2.302	34.754
2.328	36.169
2.354	33.528
2.407	34.284
2.434	35.510
2.460	37.303
2.540	39.474
2.566	34.097
2.619	37.022
2.646	35.041
2.672	37.494
2.672	37.872
2.910	32.780
2.989	36.083
3.016	40.329
3.016	38.536
3.016	37.687
3.042	34.952
3.069	40.801
3.069	38.631
3.122	37.028
3.122	39.293
3.201	37.029
3.254	39.483
3.280	38.445
3.413	36.466
3.466	41.938
3.492	38.071
3.571	39.015
3.677	41.469
3.677	40.432
3.704	38.545
3.757	42.602
3.757	40.621
3.783	38.923
3.862	39.679
3.915	42.510
3.915	43.453
3.968	41.096
3.995	39.492
4.127	41.003
4.153	40.343
4.259	39.967
4.312	44.591
4.392	40.158
4.418	43.082
4.471	45.913
4.577	43.179
4.683	46.388
4.683	43.274
4.683	42.237
4.762	47.992
4.815	43.182
4.815	41.955
4.868	43.560
4.921	47.617
4.921	43.938
4.974	48.184
4.974	46.014
4.974	46.203
5.000	46.958
5.026	46.675
5.026	43.939
5.053	44.506
5.132	45.827
5.159	49.035
5.159	45.073
5.159	44.696
5.317	44.320
5.370	46.962
5.397	49.227
5.397	45.076
5.423	47.529
5.450	44.605
5.529	44.323
5.582	47.720
5.608	45.739
5.661	48.004
5.767	44.892
5.847	46.497
5.873	51.214
5.926	45.271
5.926	46.875
6.032	48.669
6.032	47.348
6.058	50.462
6.085	48.292
6.111	45.368
6.111	46.311
6.190	44.142
6.243	47.445
6.270	46.596
6.323	48.106
6.323	47.163
6.481	47.825
6.614	46.601
6.667	51.035
6.693	46.036
6.746	49.621
6.799	47.735
6.852	48.396
6.852	46.509
6.931	50.756
6.984	47.266
6.984	45.190
7.063	49.814
7.116	46.890
7.143	49.815
7.169	47.928
7.222	50.382
7.275	48.307
7.354	47.082
7.487	46.800
7.566	49.443
7.593	46.236
7.619	47.745
7.619	47.368
7.751	48.219
7.857	47.843
7.884	50.107
8.069	50.676
8.095	47.280
8.122	49.450
8.228	49.262
8.254	48.697
8.307	46.811
8.413	50.586
8.519	47.945
8.598	48.607
8.651	47.098
8.704	49.646
8.757	47.005
8.783	49.930
8.968	53.517
9.021	48.518
9.153	48.236
9.153	50.595
9.259	49.275
9.286	50.596
9.365	47.673
9.365	48.239
9.392	52.673
9.497	51.260
9.524	51.260
9.550	47.487
9.630	52.865
9.788	51.641
9.868	50.415
10.000	51.360
10.000	47.304
10.132	47.966
10.556	47.216
10.582	51.273
10.608	48.915
10.688	51.086
10.688	50.048
10.767	47.879
11.111	50.053
11.243	49.772
11.376	47.981
11.640	51.569
11.720	50.344
11.852	53.365
11.878	49.591
11.905	48.460
11.958	45.630
11.984	51.196
12.037	50.254
12.143	49.878
12.407	47.994
12.566	52.713
12.698	49.979
13.095	50.927
13.122	48.758
13.201	50.080
13.201	52.910
13.545	49.141
13.624	51.500
13.624	46.311
13.757	48.483
13.942	51.032
13.995	51.410
14.286	48.584
14.312	50.754
14.471	47.643
14.577	51.323
14.577	45.569
14.762	47.363
15.317	49.635
15.317	50.389
15.767	51.055
16.138	54.079
16.349	49.270
16.429	52.290];
data.tL_f(:,1) = data.tL_f(:,1) * 365.25; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'sholder-rump length', 'female'};  
temp.tL_f    = C2K(38);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LuBerg2016';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), length (cm)
0.333	21.312
0.333	21.784
0.356	19.042
0.466	21.121
0.467	21.405
0.572	19.701
0.654	21.308
0.656	22.631
0.657	23.577
0.679	20.078
0.685	24.333
0.713	25.089
0.786	19.604
0.819	24.332
0.957	27.640
0.958	28.112
1.035	26.031
1.088	25.179
1.144	27.353
1.173	28.961
1.225	27.731
1.253	28.298
1.302	25.082
1.336	30.755
1.337	31.417
1.358	26.689
1.387	28.674
1.462	24.229
1.492	27.065
1.498	31.037
1.603	29.901
1.605	31.319
1.627	27.726
1.682	28.481
1.874	32.167
1.923	28.857
1.953	31.126
1.982	32.922
2.006	30.652
2.088	31.597
2.115	32.164
2.117	33.299
2.118	34.150
2.169	32.447
2.359	34.147
2.440	34.997
2.441	35.659
2.464	32.443
2.488	30.363
2.492	33.294
2.523	36.414
2.574	34.617
2.575	35.657
2.679	33.197
2.687	39.533
2.733	33.858
2.844	36.410
2.868	34.613
2.897	35.747
2.920	32.816
2.975	34.328
2.979	36.881
3.030	35.462
3.192	36.311
3.274	37.823
3.307	42.362
3.434	36.686
3.434	37.254
3.435	38.010
3.436	38.767
3.493	41.035
3.519	40.373
3.649	37.251
3.702	36.777
3.811	38.195
3.813	39.613
3.863	37.154
3.945	38.571
4.027	39.894
4.078	37.718
4.105	38.096
4.189	40.554
4.195	44.809
4.296	40.836
4.322	40.363
4.324	41.214
4.405	41.780
4.515	43.954
4.566	42.251
4.648	43.480
4.735	48.679
4.807	42.154
4.811	45.180
5.072	40.259
5.104	43.757
5.157	43.095
5.456	46.874
5.536	46.400
5.562	45.927
5.591	47.345
5.645	48.195
5.676	51.032
5.707	54.341
5.753	48.572
5.856	45.166
5.860	48.192
6.070	45.353
6.121	42.988
6.235	48.377
6.236	48.850
6.476	48.279
6.506	50.832
6.531	49.508
6.674	56.220
7.282	49.877
7.291	56.969
7.479	57.061
7.739	51.667
9.000	53.165
9.001	53.921
9.003	54.772
9.004	55.718
9.008	59.027
9.011	61.486
9.034	58.365
9.058	56.474
9.059	57.135
9.298	55.241
10.663	54.278
11.015	57.678
11.016	58.151
11.039	55.030
11.044	58.907
11.062	52.760
11.067	56.354
11.068	56.826
11.068	57.299
11.090	53.233
13.024	57.464
15.004	56.115
15.030	55.453
15.055	53.750
15.080	52.993];
data.tL_m(:,1) = data.tL_m(:,1) * 365.25; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'sholder-rump length', 'male'};  
temp.tL_m    = C2K(38);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LuBerg2016';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Almost exclusively graminivorous; only primate that eats grass';
metaData.bibkey.F1 = 'primate'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7C8JR'; % Cat of Life
metaData.links.id_ITIS = '573034'; % ITIS
metaData.links.id_EoL = '311178'; % Ency of Life
metaData.links.id_Wiki = 'Theropithecus_gelada'; % Wikipedia
metaData.links.id_ADW = 'Theropithecus_gelada'; % ADW
metaData.links.id_Taxo = '66054'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100593'; % MSW3
metaData.links.id_AnAge = 'Theropithecus_gelada'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Theropithecus_gelada}}';
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
bibkey = 'LuBerg2016'; type = 'Article'; bib = [ ... 
'author = {Amy Lu and Thore J. Bergman and Colleen McCann and Ashley Stinespring-Harris and Jacinta C. Beehner}, ' ...
'year = {2016}, ' ...
'title  = {Growth Trajectories in Wild Geladas (\emph{Theropithecus gelada})}, ' ...
'journal = {American Journal of Primatology}, ' ...
'pages = {707-719}, ' ...
'volume = {78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Theropithecus_gelada}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'primate'; type = 'Misc'; bib = ...
'howpublished = {\url{http://pin.primate.wisc.edu/factsheets/entry/gelada_baboon/taxon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

