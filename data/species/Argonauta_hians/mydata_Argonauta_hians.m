function [data, auxData, metaData, txtData, weights] = mydata_Argonauta_hians

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Argonautidae';
metaData.species    = 'Argonauta_hians'; 
metaData.species_en = 'Brown paper nautilus'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 06]; 

%% set data
% zero-variate data

data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'octolab gives 1 yr';
  
data.Lp  = 2.01;      units.Lp  = 'cm';  label.Lp  = 'mantle length at puberty';  bibkey.Lp  = 'SukhMeks2009';
data.Lpm  = 1.2;      units.Lpm  = 'cm';  label.Lpm  = 'mantle length at puberty for males';  bibkey.Lpm  = 'guess';
data.Li  = 5.3;      units.Li  = 'cm';  label.Li  = 'ultimate mantle length';  bibkey.Li  = 'SukhMeks2009';
data.Lim  = 2.0;      units.Lim  = 'cm';  label.Lim  = 'ultimate mantle length for males';  bibkey.Lim  = 'SukhMeks2009';

data.Wwb = 1.3e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SukhMeks2009';
  comment.Wwb = 'based on egg length 0.77-1.46 mm, width 0.05 mm from photo: pi/6*0.1*0.05^2';
data.Wwi = 18.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SukhMeks2009';
 
% uni-variate data
% length-fecundity
data.LN = [ ... % mantle length (cm), fecundity (#)
1.934	2091.931
2.016	1960.866
2.036	1572.495
2.084	1571.471
2.111	1635.542
2.124	1118.007
2.145	2863.259
2.199	1051.744
2.206	2538.666
2.247	921.410
2.247	1632.616
2.274	1114.789
2.294	2407.454
2.301	4411.619
2.301	2859.894
2.335	2018.647
2.348	3376.112
2.376	2793.631
2.382	4539.173
2.396	1112.156
2.396	3181.122
2.403	3827.528
2.430	2727.805
2.430	788.150
2.443	2274.926
2.457	1628.082
2.464	4149.488
2.484	1110.254
2.491	3502.351
2.511	2467.429
2.532	4148.025
2.532	2660.955
2.566	1431.775
2.593	5633.777
2.600	4146.562
2.600	2400.872
2.633	3046.693
2.633	1882.899
2.674	782.884
2.681	4015.497
2.695	3045.376
2.708	4532.152
2.708	3756.290
2.715	458.731
2.722	2333.583
2.722	1751.687
2.762	5242.190
2.762	3431.844
2.769	4401.525
2.769	910.147
2.803	2784.415
2.810	6017.028
2.810	2267.027
2.810	1361.855
2.824	5370.183
2.830	3365.727
2.837	3947.476
2.851	4335.116
2.851	2072.184
2.857	520.313
2.871	1231.228
2.885	5950.763
2.898	842.711
2.905	3040.841
2.912	5238.971
2.925	2264.540
2.939	518.558
2.939	1747.006
2.946	6272.722
2.959	3427.601
2.959	6595.706
2.973	2910.069
2.973	4979.033
2.973	2716.103
2.993	969.974
3.000	3943.966
3.000	1487.069
3.007	4525.716
3.014	7758.328
3.014	5236.777
3.034	645.820
3.048	1809.321
3.054	7498.830
3.054	3296.243
3.061	7110.754
3.075	5106.149
3.081	3618.934
3.081	2649.106
3.081	1420.658
3.088	709.305
3.095	4329.850
3.109	4717.487
3.115	8208.720
3.129	7885.152
3.129	5363.601
3.149	1936.437
3.163	6785.283
3.176	1030.680
3.183	4133.982
3.197	7043.172
3.197	577.655
3.210	7560.122
3.210	5038.569
3.210	3163.569
3.238	4003.502
3.258	6007.373
3.271	3291.563
3.292	2321.296
3.292	1868.710
3.299	2838.391
3.305	4002.039
3.312	2902.755
3.319	4583.643
3.319	3743.125
3.333	5423.867
3.353	7621.704
3.353	6975.152
3.367	3871.411
3.373	9043.679
3.380	8461.636
3.380	3289.222
3.387	4646.834
3.400	2577.577
3.407	4452.431
3.421	8848.689
3.421	6391.793
3.421	3870.241
3.448	3287.759
3.462	6067.639
3.482	1864.614
3.509	2510.581
3.523	6906.841
3.523	4385.288
3.523	3221.496
3.529	5096.348
3.529	3609.280
3.536	1928.099
3.543	9298.643
3.550	7811.427
3.550	5548.497
3.557	5871.625
3.584	4125.352
3.624	3542.578
3.631	7680.362
3.645	7098.174
3.652	4964.405
3.665	8261.527
3.665	9037.389
3.672	3670.864
3.679	4252.614
3.686	5286.950
3.719	3411.218
3.740	7354.746
3.747	4509.771
3.753	6190.659
3.767	5479.161
3.781	8388.351
3.801	6512.911
3.808	3473.973
3.814	9098.826
3.814	7805.722
3.821	5154.714
3.842	4378.413
3.855	6188.465
3.855	2309.155
3.889	2825.665
3.896	8515.174
3.903	5605.545
3.930	4053.236
3.957	10000.927
3.957	6832.823
3.957	7479.375
3.984	8060.686
4.005	5215.421
4.011	3728.204
4.018	5926.334
4.018	7154.783
4.025	10128.774
4.032	8059.662
4.038	4632.791
4.038	6443.138
4.066	9287.379
4.086	9804.181
4.086	2562.803
4.100	10644.407
4.113	7023.425
4.120	8768.968
4.147	7216.659
4.174	10448.832
4.174	3336.763
4.195	5275.979
4.215	7150.541
4.229	7732.144
4.242	10059.438
4.249	4240.327
4.310	10381.251
4.324	7859.407
4.378	5401.340
4.378	4108.237
4.385	10961.538
4.425	9408.936
4.561	6367.218
4.602	7336.169
4.670	6429.534
4.738	9596.174
4.962	9591.346
5.029	9783.849
5.348	8483.870];
units.LN   = {'d', '#'};  label.LN = {'mantle length','fecundity'};  
temp.LN    = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'SukhMeks2009';

% weight-fecundity
data.WN = [ ... % wet weight (g), fecundity
2.217	2419.355
2.237	1161.290
2.238	1548.388
2.331	2612.904
2.352	1693.549
2.446	2854.838
2.534	1500.000
2.670	1016.129
2.671	1741.936
2.673	2322.581
2.676	4209.677
2.788	3193.549
2.789	3629.033
2.876	1548.388
2.900	1983.871
2.925	3193.549
2.947	2709.678
2.973	4403.226
2.997	4790.323
3.035	822.581
3.060	2322.581
3.150	1741.936
3.198	3048.388
3.223	3822.581
3.242	2032.259
3.285	774.193
3.378	1500.000
3.403	2806.452
3.425	2322.581
3.430	4645.162
3.513	774.193
3.589	4451.613
3.607	1887.097
3.629	1403.226
3.653	2419.355
3.792	3096.774
3.879	1354.838
3.883	3338.710
3.908	4258.064
3.926	2032.259
3.950	2516.129
4.017	1645.162
4.042	2854.838
4.201	2370.968
4.270	3096.774
4.298	5612.903
4.335	1258.064
4.337	1935.484
4.338	2661.290
4.342	4548.387
4.386	3725.807
4.388	5177.419
4.453	3387.097
4.516	338.710
4.523	4161.290
4.526	5322.581
4.563	822.581
4.589	2951.614
4.706	4354.839
4.707	4983.871
4.747	1645.162
4.768	1161.290
4.774	3870.968
4.864	3532.259
4.885	2467.742
4.886	2854.838
4.972	435.484
4.973	1016.129
4.981	4838.710
5.093	4161.290
5.138	3435.484
5.226	2129.033
5.269	435.484
5.278	5322.581
5.315	870.968
5.319	2709.678
5.325	5854.839
5.345	4548.387
5.365	3241.936
5.367	4209.677
5.406	435.484
5.430	1451.614
5.442	7645.162
5.460	5177.419
5.501	2419.355
5.524	2758.064
5.528	4693.549
5.535	8274.194
5.544	1209.678
5.548	3338.710
5.623	6774.194
5.680	580.645
5.681	1403.226
5.709	4258.064
5.735	6000.000
5.761	7354.839
5.799	3241.936
5.853	7983.871
5.863	1016.129
5.919	6629.032
5.956	2080.645
6.006	4548.387
6.035	7548.387
6.051	3822.581
6.054	5467.742
6.069	1451.614
6.117	2758.064
6.187	3387.097
6.227	822.581
6.249	483.871
6.274	1451.614
6.279	4209.677
6.304	5225.807
6.326	4693.549
6.328	6048.387
6.411	1451.614
6.437	2951.614
6.443	6338.710
6.556	5612.903
6.596	3000.000
6.615	1064.516
6.627	7064.516
6.631	9000.000
6.645	4693.549
6.686	1935.484
6.689	3629.033
6.716	6000.000
6.744	8758.064
6.759	4403.226
6.779	2903.226
6.798	1354.838
6.963	3919.355
7.031	3677.419
7.107	7500.000
7.168	3629.033
7.214	4161.290
7.216	4935.484
7.243	7161.290
7.280	2661.290
7.303	2806.452
7.306	4548.387
7.331	5516.129
7.336	8129.032
7.373	3870.968
7.412	387.097
7.471	7112.903
7.508	2951.614
7.602	4016.129
7.671	4500.000
7.857	6096.774
7.899	4258.064
8.107	6145.162
8.127	4548.387
8.132	6822.581
8.250	9387.097
8.265	5177.419
8.385	8370.968
8.426	5564.516
8.491	4064.516
8.497	7258.064
8.583	4161.290
8.676	5564.516
8.703	7645.162
8.720	4354.839
8.746	6290.323
8.771	7161.290
8.837	6048.387
8.858	4887.097
8.878	3677.419
8.946	3483.871
9.087	5806.451
9.153	4354.839
9.195	2274.193
9.312	4161.290
9.315	5564.516
9.540	3774.194
9.541	4306.451
9.547	7693.549
9.902	2516.129
9.927	3387.097
9.935	7935.484
9.977	6096.774
10.067	5177.419
10.133	4209.677
10.141	8322.581
10.158	5177.419
10.178	3483.871
10.188	9096.775
10.296	5564.516
10.302	8758.064
10.482	7500.000
10.487	10016.129
10.516	1500.000
10.543	3919.355
10.576	9290.323
10.595	6967.742
10.665	7790.323
10.777	7064.516
10.797	5322.581
10.883	2709.678
11.030	7838.710
11.049	6241.936
11.138	4741.936
11.195	10790.323
11.211	6967.742
11.261	9435.484
11.321	5370.968
11.756	6145.162
11.945	9290.323
12.081	9000.000
12.193	7935.484
12.240	8564.516
12.265	10064.516
12.328	7064.516
12.402	9822.581
12.669	6677.419
13.011	6629.032
13.020	10935.484
13.155	10258.065
13.170	6290.323
13.382	9435.484
13.424	7451.613
13.511	5516.129
14.432	10306.452
14.658	9241.936
14.764	4693.549
16.005	10064.516
16.028	9677.420
16.234	10306.452
16.685	7548.387
17.596	7161.290
18.283	8516.129
18.715	7693.549];
units.WN   = {'g', '#'};  label.WN = {'wet weight','fecundity'};  
temp.WN    = C2K(25);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'SukhMeks2009';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lp = 3 * weights.Lp;
weights.Li = 3 * weights.Li;
weights.am = 3 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2*weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only, while E_Hj is assumed to equal E_Hp';
D2 = 'Information about rates or times is hard to find';
D3 = 'Litter interval is assumed to be 40 d';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'iteroparous, but males die after loss of their hectocatylus at first copulation; females secretes a calcite shell with their first dorsal armes to brood eggs in surface waters';
metaData.bibkey.F1 = {'SukhMeks2009','thecephalopodpage'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '67R4R'; % Cat of Life
metaData.links.id_ITIS = '82682'; % ITIS
metaData.links.id_EoL = '401012'; % Ency of Life
metaData.links.id_Wiki = 'Argonauta_hians'; % Wikipedia
metaData.links.id_ADW = 'Argonauta_hians'; % ADW
metaData.links.id_Taxo = '40362'; % Taxonomicon
metaData.links.id_WoRMS = '215276'; % WoRMS
metaData.links.id_molluscabase = '215276'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argonauta_hians}}';
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
bibkey = 'SukhMeks2009'; type = 'Article'; bib = [ ... 
'doi = {10.2306/scienceasia1513-1874.2009.35.315}, ' ...
'author = {Charuay Sukhsangchan and Shettapong Meksumpun and Jaruwat Nabhitabhata and Susumu Segawa}, ' ... 
'year = {2009}, ' ...
'title = {Distribution, biology, and stomach contents of paper nautilus (\emph{Argonauta hians}) in the {A}ndaman {S}ea}, ' ...
'journal = {ScienceAsia}, ' ...
'volume = {35}, ' ...
'pages = {315-319}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Argonauta-hians.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'octolab'; type = 'Misc'; bib = ...
'howpublished = {\url{https://octolab.tv/species/argonaut-octopus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'thecephalopodpage'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.thecephalopodpage.org/MarineInvertebrateZoology/Argonautaargo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

