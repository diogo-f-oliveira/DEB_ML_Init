  function [data, auxData, metaData, txtData, weights] = mydata_Turcinoemacheilus_bahaii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Turcinoemacheilus_bahaii'; 
metaData.species_en = 'Zayandeh Roud River loach'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 12 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 21];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.5;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'BorhSoof2017';
data.Li = 8;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'BorhSoof2017';

data.Wwb = 2.1e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'BorhSoof2017';
  comment.Wwb = 'based on egg diameter of 1.58 mm: pi/6*0.158^3'; 
data.Wwp = 0.6;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'BorhSoof2017';
data.Wwi = 3.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BorhSoof2017';

data.GSI = 0.18; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'BorhSoof2017';
  temp.GSI = C2K(12); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'corresponds to peak value in the year';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 4.272 4.454
    2 5.274 5.174
    3 6.093 5.556
    4 6.810 6.063
    5 7.376 NaN];
data.tL_fm(:,1) = (0.2 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(12);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BorhSoof2017'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'temp ranged 2-22 C';

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    1 0.57 0.60
    2 0.93 0.88
    3 1.39 1.08
    4 2.09 1.42
    5 2.67 NaN];
data.tW_fm(:,1) = (0.2 + data.tW_fm(:,1)) * 365; % set origin at birth
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(12);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'BorhSoof2017'; treat.tW_fm = {1 {'females','males'}};
comment.tW_fm = 'temp ranged 2-22 C';

% length-weight
data.LW_f = [ ... % time since birth (yr), std length (cm)
3.934	0.558
4.008	0.409
4.082	0.421
4.142	0.496
4.335	0.607
4.366	0.769
4.380	0.632
4.410	0.682
4.454	0.533
4.454	0.545
4.484	0.496
4.484	0.694
4.498	0.496
4.514	0.694
4.573	0.632
4.603	0.583
4.603	0.756
4.604	0.893
4.662	0.446
4.722	0.731
4.723	0.930
4.752	0.893
4.782	0.756
4.827	1.029
4.841	0.831
4.885	0.632
4.886	0.756
4.886	0.855
4.886	0.855
4.915	0.645
4.946	0.930
4.960	0.657
4.976	1.116
5.020	0.806
5.034	0.620
5.049	0.769
5.050	0.917
5.064	0.855
5.080	0.942
5.123	0.620
5.138	0.719
5.139	0.868
5.139	1.029
5.154	1.017
5.183	0.645
5.198	0.855
5.259	1.178
5.272	0.645
5.288	1.017
5.303	1.103
5.319	1.512
5.332	0.917
5.376	0.793
5.391	0.893
5.406	0.707
5.407	1.116
5.408	1.351
5.422	1.004
5.436	0.967
5.438	1.376
5.466	0.905
5.466	1.054
5.467	1.178
5.495	0.756
5.511	1.029
5.512	1.326
5.526	1.215
5.555	0.930
5.556	1.227
5.614	0.645
5.616	1.388
5.645	1.116
5.659	1.004
5.660	1.165
5.674	0.917
5.674	1.054
5.676	1.475
5.688	0.645
5.690	1.252
5.735	1.351
5.748	0.769
5.750	1.475
5.751	1.624
5.764	1.054
5.778	1.004
5.779	1.215
5.780	1.438
5.810	1.550
5.810	1.773
5.837	0.843
5.839	1.314
5.853	1.153
5.882	1.041
5.884	1.636
5.897	0.992
5.899	1.426
5.943	1.264
5.974	1.636
5.989	1.773
6.002	1.128
6.002	1.202
6.002	1.326
6.018	1.537
6.062	1.438
6.078	1.711
6.107	1.624
6.120	1.128
6.121	1.264
6.121	1.413
6.135	1.128
6.168	1.872
6.182	1.624
6.195	1.190
6.197	1.674
6.198	1.983
6.212	1.711
6.226	1.488
6.242	1.909
6.270	1.426
6.301	1.798
6.302	2.107
6.313	1.029
6.315	1.500
6.315	1.612
6.316	1.860
6.347	2.145
6.360	1.574
6.373	1.128
6.377	2.207
6.403	1.277
6.419	1.550
6.420	1.711
6.480	1.996
6.494	1.649
6.495	1.996
6.496	2.219
6.522	1.277
6.524	1.674
6.524	1.810
6.536	1.041
6.582	1.252
6.598	1.649
6.627	1.401
6.642	1.562
6.643	1.748
6.655	1.054
6.659	2.083
6.659	2.157
6.660	2.405
6.672	1.686
6.716	1.326
6.717	1.822
6.718	1.996
6.718	2.157
6.719	2.244
6.747	1.835
6.776	1.661
6.793	2.318
6.807	1.909
6.808	2.368
6.820	1.475
6.821	1.723
6.850	1.500
6.852	1.983
6.882	2.182
6.912	2.293
6.913	2.678
6.926	2.058
6.927	2.467
6.955	1.934
6.956	2.008
6.958	2.727
7.001	2.293
7.030	2.132
7.031	2.368
7.032	2.504
7.032	2.715
7.076	2.405
7.105	2.182
7.135	2.405
7.165	2.492
7.210	2.380
7.211	2.678
7.225	2.554
7.240	2.715
7.256	2.876
7.270	2.640
7.283	2.182
7.286	3.099
7.313	2.107
7.329	2.504
7.360	2.864
7.374	2.665
7.387	2.145
7.405	3.112
7.446	2.070
7.447	2.343
7.448	2.492
7.448	2.678
7.450	3.198
7.508	2.802
7.521	2.207
7.536	2.244
7.553	2.938
7.596	2.380
7.596	2.455
7.612	2.665
7.657	2.963
7.671	2.529
7.745	2.603
7.776	3.025
7.819	2.541
7.941	3.236
7.983	2.727
8.002	3.880
8.088	2.839
8.105	3.508
8.283	3.459];
units.LW_f = {'cm','g'}; label.LW_f = {'std length', 'weight', 'females'};  
bibkey.LW_f = 'BorhSoof2017';
%
data.LW_m = [ ... % time since birth (yr), std length (cm)
4.310	0.366
4.336	0.435
4.354	0.360
4.362	0.349
4.450	0.371
4.476	0.462
4.502	0.382
4.502	0.414
4.511	0.414
4.511	0.317
4.528	0.570
4.546	0.430
4.555	0.511
4.555	0.462
4.563	0.382
4.590	0.462
4.590	0.387
4.607	0.548
4.616	0.613
4.616	0.430
4.624	0.355
4.642	0.640
4.642	0.462
4.651	0.366
4.659	0.532
4.659	0.500
4.668	0.548
4.677	0.478
4.721	0.398
4.721	0.462
4.738	0.602
4.747	0.661
4.755	0.478
4.764	0.543
4.773	0.586
4.773	0.409
4.790	0.468
4.808	0.543
4.808	0.688
4.817	0.624
4.825	0.511
4.834	0.452
4.852	0.645
4.852	0.489
4.860	0.543
4.869	0.419
4.886	0.538
4.904	0.473
4.921	0.699
4.930	0.608
4.930	0.554
4.939	0.452
4.939	0.430
4.948	0.645
4.956	0.478
4.965	0.565
4.974	0.532
4.974	0.527
4.974	0.522
5.009	0.774
5.035	0.758
5.035	0.586
5.044	0.629
5.052	0.699
5.061	0.790
5.061	0.543
5.087	0.785
5.096	0.651
5.114	0.586
5.114	0.737
5.122	0.688
5.122	0.710
5.140	0.462
5.148	0.763
5.157	0.581
5.192	0.817
5.192	0.860
5.192	0.538
5.210	0.801
5.210	0.882
5.210	0.624
5.210	0.511
5.227	0.849
5.236	0.731
5.245	0.645
5.245	0.559
5.262	0.957
5.262	0.500
5.271	0.629
5.279	0.828
5.288	0.968
5.288	0.758
5.288	0.602
5.297	0.855
5.297	0.715
5.306	0.618
5.306	0.532
5.314	0.978
5.314	0.790
5.323	0.882
5.323	0.801
5.323	0.731
5.341	0.640
5.349	0.817
5.358	0.866
5.367	0.914
5.376	1.054
5.384	0.559
5.393	1.038
5.393	0.833
5.402	0.898
5.428	0.597
5.437	0.968
5.445	0.844
5.454	0.946
5.454	0.747
5.463	0.995
5.472	0.957
5.489	0.995
5.489	0.634
5.515	1.038
5.515	0.790
5.524	0.828
5.533	0.984
5.533	0.941
5.541	0.882
5.550	0.624
5.550	0.597
5.559	0.758
5.594	0.930
5.603	1.091
5.611	1.134
5.611	0.753
5.620	1.091
5.620	1.070
5.620	0.801
5.629	0.871
5.629	0.844
5.638	1.022
5.655	1.172
5.655	0.968
5.655	0.930
5.672	1.086
5.681	1.000
5.681	0.914
5.690	0.780
5.716	1.134
5.725	0.909
5.734	0.737
5.742	1.070
5.742	1.022
5.751	0.995
5.769	1.167
5.786	1.043
5.812	1.151
5.838	1.204
5.856	1.231
5.882	1.280
5.882	0.962
5.900	1.199
5.908	1.038
5.917	1.102
5.996	1.000
6.004	1.075
6.013	0.962
6.031	1.253
6.092	1.188
6.153	1.392
6.188	1.516
6.188	1.360
6.214	1.382
6.223	1.543
6.275	1.559
6.284	1.425
6.336	1.543
6.336	1.505
6.371	1.548
6.397	1.801
6.397	1.688
6.432	1.769
6.476	1.704
6.563	1.742
6.572	1.462];
units.LW_m = {'cm','g'}; label.LW_m = {'std length', 'weight', 'males'};  
bibkey.LW_m = 'BorhSoof2017';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
5.146	163.994
5.187	168.315
5.228	237.677
5.310	252.824
5.341	261.485
5.353	92.375
5.487	118.342
5.526	289.602
5.569	200.698
5.651	241.861
5.702	270.026
5.795	285.169
5.815	304.674
5.888	285.135
5.959	343.646
6.073	321.925
6.135	306.726
6.238	352.218
6.506	388.977
6.538	343.437
6.539	278.396
6.547	406.306
6.589	384.611
6.651	404.101
6.661	419.273
6.785	380.204
6.816	369.353
6.847	382.350
6.858	354.162
6.908	482.057
6.909	347.639
6.951	304.263
6.981	384.469
6.991	412.650
7.002	399.638
7.012	434.323
7.055	260.865
7.075	289.042
7.094	414.781
7.250	393.044
7.259	458.082
7.270	438.566
7.363	403.844
7.393	473.209
7.402	577.271
7.423	542.575
7.446	410.318
7.446	382.133
7.548	486.162
7.627	746.296
7.837	475.217
7.961	492.516
7.968	709.316];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(12);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BorhSoof2017'; 
 
% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
0.812	167.829
0.934	174.417
0.988	100.533
1.002	124.454
1.015	246.200
1.069	213.621
1.076	265.799
1.110	261.469
1.137	257.136
1.252	296.329
1.272	283.297
1.293	305.047
1.475	289.929
1.503	311.682
1.591	357.382
1.591	287.817
1.604	292.172
1.624	331.314
1.631	340.013
1.658	355.245
1.712	387.884
1.834	392.298
1.922	401.041
1.929	353.219
1.970	405.415
1.997	361.951
2.003	311.955
2.064	266.336
2.071	394.600
2.098	296.789
2.132	412.025
2.159	383.778
2.186	401.184
2.254	375.134
2.261	440.355
2.267	401.229
2.281	472.975
2.294	294.722
2.301	420.812
2.328	383.870
2.403	423.041
2.457	418.723
2.464	457.857
2.477	423.082
2.484	473.085
2.504	490.488
2.504	455.705
2.599	490.539
2.673	492.754
2.673	477.536
3.080	549.496
3.195	577.819
3.222	712.617
3.343	756.161];
units.WN = {'g', '#'}; label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(12);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'BorhSoof2017'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
weights.GSI = 0 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'peak in GSI is inconsistent with fecundity, possibly due to multiple spawning';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00708*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '59PH3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '40046549'; % Ency of Life
metaData.links.id_Wiki = 'Turcinoemacheilus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5723072'; % Taxonomicon
metaData.links.id_WoRMS = '1007139'; % WoRMS
metaData.links.id_fishbase = 'Turcinoemacheilus-bahaii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Turcinoemacheilus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BorhSoof2017'; type = 'Article'; bib = [ ...  
'author = {Borhani, M. and Soofiani, N.M. and Ebrahimi, E. and Asadollah, S.}, ' ...
'year = {2017}, ' ...
'title = {First Report on Growth and Reproduction of \emph{Turcinoemacheilus Bahaii} ({E}smaeili, {S}ayyadzadeh, \"{O}zulug, {G}eiger and {F}reyhof, 2014), in {Z}ayandeh {R}oud {R}iver, {I}ran}, ' ... 
'journal = {Austin Environmental Sciences}, ' ...
'volume = {2(1)}, '...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Turcinoemacheilus-bahaii}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

