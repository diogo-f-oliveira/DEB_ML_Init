function [data, auxData, metaData, txtData, weights] = mydata_Euphausia_pacifica

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Euphausiacea'; 
metaData.family     = 'Euphausiidae';
metaData.species    = 'Euphausia_pacifica'; 
metaData.species_en = 'North Pacific krill'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'am'; 'WCb'; 'WNb'; 'Wwb'; 'WCp'; 'WCi'; 'Ri'}; 
metaData.data_1     = {'t-WC'; 't-WN'; 'WC-dWC'; 'WC-JX'; 'WC-JC'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 20];

%% set data
% zero-variate data

data.am = 365; units.am = 'd';    label.am = 'life span';                  bibkey.am = 'Ross1982';   
  temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 7.4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SuhSoh1993';
  comment.Wwb = 'based on egg diameter of 0.52 mm: pi/6*0.052^3';
data.WCb = 2.58; units.WCb = 'mug C'; label.WCb = 'C weight at birth';     bibkey.WCb = 'RossDaly1983';
data.WNb = 0.50; units.WNb = 'mug N'; label.WNb = 'N weight at birth';     bibkey.WNb = 'RossDaly1983';
data.WCp = 670; units.WCp = 'mug C';  label.WCp = 'C weight at puberty';   bibkey.WCp = 'Ross1982';
  comment.WCp = '655-685 mug C';
data.WCi = 6000;  units.WCi = 'mug'; label.WCi = 'ultimate dry weight';       bibkey.WCi = 'DormSyde2015';

data.Ri  = 19;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'DormSyde2015';   
  temp.Ri = C2K(8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-weight
data.tW_8 = [ ... % time since birth (d), C-weight (mug C), N-weight (mug N)
    8    2.78   0.66
   21   11.06   2.65
   42   33.91   9.14
   84  124.29  33.64
  105  198.55  53.63
  147  417.20 112.06
  168  565.94 151.56
  252 1469.94 389.10
  336 2954.25 774.14];
units.tW_8   = {'d', '{\mu}g', '{\mu}g'};  label.tW_8 = {'age', 'C-weight', 'N-weight'};  
temp.tW_8    = C2K(8);  units.temp.tW_8 = 'K'; label.temp.tW_8 = 'temperature';
bibkey.tW_8 = 'Ross1982a'; treat.tW_8 = {1, {'C-weight','N-weight'}}; title.tW_8 = '8 C';
comment.tW_8 = 'data point 1-3 calyptopsis; 3-4 furcilia; 5-6 juvenile; 7-9 adult';
%
data.tW_12 = [ ... % time since birth (d), C-weight (mug), N-weight
    4    2.78   0.66
   14    8.83   2.10
   28   33.18   8.19
   56  136.85  34.65
   70  225.29  57.21
   98  491.74 124.88
  112  675.67 171.38
  154 1462.73 368.99
  196 2654.53 665.57];
units.tW_12   = {'d', '{\mu}g', '{\mu}g'};  label.tW_12 = {'age', 'C-weight', 'N-weight'};  
temp.tW_12    = C2K(12);  units.temp.tW_12 = 'K'; label.temp.tW_12 = 'temperature';
bibkey.tW_12 = 'Ross1982a'; treat.tW_12 = {1, {'C-weight','N-weight'}}; title.tW_12 = '12 C';
comment.tW_12 = 'data point 1-3 calyptopsis; 3-4 furcilia; 5-6 juvenile; 7-9 adult';

% weight-change in weight
data.WdW_8 = [ ... % 10log body weight (mug C), 10log change in weight (mug C/d)
0.219	-1.143
0.362	-0.518
0.481	-0.652
0.609	-0.366
0.758	-0.134
0.864	0.000
1.005	0.027
1.109	-0.268
1.110	-0.018
1.202	0.054
1.294	0.161
1.364	0.214
1.421	0.188
1.462	0.009
1.504	-0.054
1.505	0.080
1.520	0.455
1.548	0.205
1.590	0.295
1.596	-0.125
1.597	0.259
1.626	0.384
1.652	-0.170
1.716	0.054
1.753	0.536
1.795	0.402
1.865	0.464
1.866	0.554
1.950	0.500
1.978	0.563
2.020	0.330
2.063	0.580
2.133	0.518
2.190	0.732
2.273	0.313
2.295	0.482
2.331	0.571
2.367	1.045
2.452	0.991
2.457	0.563
2.463	0.259
2.499	0.509
2.556	0.536
2.599	0.723
2.719	0.795
2.747	0.741
2.875	1.071
2.895	1.000
3.108	1.268
3.143	1.375
3.269	1.018
3.278	1.571
3.356	1.661];
data.WdW_8 = 10.^data.WdW_8; % remove log transform
units.WdW_8   = {'{\mu}g C', '{\mu}g C/d'};  label.WdW_8 = {'body weight', 'change in body weight', '8 C'};  
temp.WdW_8   = C2K(8);  units.temp.WdW_8 = 'K'; label.temp.WdW_8 = 'temperature';
bibkey.WdW_8 = 'Ross1982';
%
data.WdW_12 = [ ... % 10log body weight (mug C), 10log change in weight (mug C/d)
0.394	-1.002
0.500	-0.386
0.620	-0.494
0.789	0.059
0.979	0.130
1.106	0.093
1.197	0.200
1.324	0.423
1.430	0.378
1.465	0.520
1.472	0.038
1.535	0.538
1.613	0.439
1.634	0.519
1.683	0.403
1.739	0.456
1.761	0.564
1.817	0.501
1.859	0.358
1.887	0.581
1.901	0.563
1.944	0.447
1.993	0.714
2.000	0.580
2.092	0.910
2.204	1.097
2.345	1.204
2.430	0.793
2.542	1.248
2.655	0.863
2.669	1.158
2.697	1.229
2.718	0.631
2.761	0.952
2.810	1.300
2.810	1.193
2.831	0.916
2.852	1.139
2.859	1.112
2.873	1.273
2.923	1.228
2.944	0.960
2.979	1.040
3.021	1.478
3.430	1.708];
data.WdW_12 = 10.^data.WdW_12; % remove log transform
units.WdW_12   = {'{\mu}g C', '{\mu}g C/d'};  label.WdW_12 = {'body weight', 'change in body weight', '12 C'};  
temp.WdW_12   = C2K(8);  units.temp.WdW_12 = 'K'; label.temp.WdW_12 = 'temperature';
bibkey.WdW_12 = 'Ross1982';

% weight-ingestion
data.WJX_8 = [ ... % 10log body weight (mug C), 10log ingestion (mug C/d)
0.377	-0.026
0.642	0.242
0.698	-0.173
0.969	-0.056
1.154	0.840
1.333	0.593
1.525	0.763
1.660	1.030
1.827	1.199
2.043	0.945
2.123	1.450
2.568	1.666
2.623	1.490
2.660	1.676
2.685	2.163
2.710	2.234
2.778	1.995
2.790	1.845
2.852	1.819
2.864	1.881
2.938	2.466
3.006	2.015
3.062	2.290
3.105	1.936
3.142	2.300
3.160	2.238
3.167	2.424
3.216	2.415
3.370	2.346
3.432	2.692];
data.WJX_8 = 10.^data.WJX_8; % remove log transform
units.WJX_8   = {'{\mu}g C', '{\mu}g C/d'};  label.WJX_8 = {'body weight', 'ingestion rate', '8 C'};  
temp.WJX_8   = C2K(8);  units.temp.WJX_8 = 'K'; label.temp.WJX_8 = 'temperature';
bibkey.WJX_8 = 'Ross1982';
%
data.WJX_12 = [ ... % 10log body weight (mug C), 10log ingestion (mug C/d)
0.349	-0.043
0.442	-0.052
0.751	0.316
1.042	0.265
1.307	0.502
1.423	1.210
1.578	1.027
1.781	1.413
1.831	1.474
1.857	1.116
1.862	1.430
2.461	1.817
2.647	1.905
2.671	2.185
2.696	1.914
2.720	2.185
2.721	2.054
2.813	2.186
2.838	2.090
2.881	2.221
2.882	1.976
2.899	2.369
3.190	2.493
3.276	2.720
3.282	2.764
3.393	2.773];
data.WJX_12 = 10.^data.WJX_12; % remove log transform
units.WJX_12   = {'{\mu}g C', '{\mu}g C/d'};  label.WJX_12 = {'body weight', 'ingestion rate', '12 C'};  
temp.WJX_12   = C2K(8);  units.temp.WJX_12 = 'K'; label.temp.WJX_12 = 'temperature';
bibkey.WJX_12 = 'Ross1982';

% weight-respiration
data.WJC_8 = [ ... % 10log body weight (mug C), 10log respiration (mug C/d)
0.013	-0.940
0.123	-0.751
0.198	-0.811
0.199	-0.884
0.238	-0.710
0.398	-0.314
0.634	-0.225
0.830	0.044
1.025	0.033
1.045	0.180
1.046	0.120
1.115	0.020
1.201	0.275
1.266	0.476
1.291	0.376
1.306	0.483
1.321	0.310
1.326	0.597
1.346	0.457
1.351	0.296
1.356	0.370
1.371	0.497
1.391	0.177
1.406	0.397
1.426	0.377
1.441	0.504
1.546	0.713
1.566	0.392
1.581	0.700
1.596	0.119
1.622	0.573
1.672	0.487
1.687	0.560
1.742	0.675
1.762	0.822
1.792	0.902
1.793	0.929
1.817	0.882
1.847	0.649
1.872	0.796
1.877	0.903
1.897	1.010
1.917	0.850
1.937	0.737
1.962	0.744
1.977	0.764
2.008	0.931
2.043	1.045
2.048	0.865
2.049	0.811
2.058	1.092
2.113	0.966
2.158	1.053
2.183	0.833
2.218	0.853
2.228	0.993
2.233	0.933
2.268	0.900
2.278	1.061
2.293	1.208
2.294	0.667
2.308	1.074
2.318	0.994
2.328	1.088
2.343	1.115
2.368	0.915
2.378	1.095
2.424	1.149
2.429	1.523
2.494	1.150
2.499	1.223
2.538	1.444
2.539	1.331
2.559	1.271
2.564	1.157
2.594	1.411
2.644	1.352
2.669	1.158
2.714	1.205
2.729	1.346
2.810	1.540
2.900	1.388
3.095	1.837
3.130	1.737
3.170	1.831
3.246	1.932
3.286	1.973];
%for i = 2:size(data.WJC_8,1); if data.WJC_8(i,1)<=data.WJC_8(i-1,1); data.WJC_8(i,1)=data.WJC_8(i-1,1)+1e-2;end;end
data.WJC_8 = 10.^data.WJC_8; % remove log transform
units.WJC_8   = {'{\mu}g C', '{\mu}g C/d'};  label.WJC_8 = {'body weight', 'respiration rate', '8 C'};  
temp.WJC_8   = C2K(8);  units.temp.WJC_8 = 'K'; label.temp.WJC_8 = 'temperature';
bibkey.WJC_8 = 'Ross1982';
%
data.WJC_12 = [ ... % 10log body weight (mug C), 10log respiration (mug C/d)
0.116	-0.636
0.165	-0.385
0.201	-0.563
0.390	-0.238
0.521	-0.223
0.561	-0.157
0.765	0.201
1.083	0.138
1.151	0.449
1.177	0.390
1.207	0.410
1.237	0.443
1.348	0.424
1.372	0.655
1.412	0.590
1.437	0.669
1.464	0.360
1.488	0.531
1.534	0.466
1.552	0.862
1.594	0.493
1.649	0.579
1.658	0.737
1.683	0.784
1.717	0.949
1.736	0.461
1.795	1.339
1.809	0.746
1.838	0.911
1.874	0.812
1.888	1.030
1.914	0.878
1.914	0.845
1.918	1.129
1.918	1.017
1.927	1.241
1.954	0.998
1.959	0.899
2.003	1.183
2.014	0.965
2.024	1.077
2.055	0.999
2.088	1.256
2.088	1.197
2.105	0.966
2.118	1.230
2.145	1.072
2.165	1.052
2.173	1.356
2.195	1.039
2.208	1.356
2.213	1.455
2.254	1.238
2.268	1.522
2.308	1.456
2.345	1.199
2.364	1.463
2.470	1.398
2.494	1.504
2.506	1.286
2.515	1.432
2.560	1.531
2.601	1.380
2.622	1.314
2.656	1.420
2.668	1.202
2.702	1.387
2.703	1.288
2.721	1.572
2.737	1.342
2.766	1.592
2.767	1.421
2.786	1.540
2.798	1.382
2.896	1.673
2.897	1.594
2.903	1.435
2.906	1.778
2.923	1.502
2.947	1.640
3.038	1.628
3.046	1.879
3.092	1.846
3.126	1.939
3.146	1.985
3.147	1.827
3.197	1.926
3.226	2.078
3.268	1.887
3.287	2.066
3.288	2.000
3.321	2.132];
data.WJC_12 = 10.^data.WJC_12; % remove log transform
units.WJC_12   = {'{\mu}g C', '{\mu}g C/d'};  label.WJC_12 = {'body weight', 'respiration rate', '12 C'};  
temp.WJC_12   = C2K(8);  units.temp.WJC_12 = 'K'; label.temp.WJC_12 = 'temperature';
bibkey.WJC_12 = 'Ross1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_8 = 5 * weights.tW_8;
weights.tW_12 = 5 * weights.tW_12;
weights.Wwb = 0 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.title = title;

%% Group plots
set1 = {'WdW_12','WdW_8'}; subtitle1 = {'Data at 12, 8 C'};
set2 = {'WJX_12','WJX_8'}; subtitle2 = {'Data at 12, 8 C'};
set3 = {'WJC_12','WJC_8'}; subtitle3 = {'Data at 12, 8 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Metamorphosis is assumed to affect morphology, not metabolism';     
D2 = 'Males are assumed to have the same parameters as females';     
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Feeding starts at stage Calyptopsis I';
metaData.bibkey.F1 = 'Ross1982'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3CMCV'; % Cat of Life
metaData.links.id_ITIS = '95502'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Euphausia_pacifica'; % Wikipedia
metaData.links.id_ADW = 'Euphausia_pacifica'; % ADW
metaData.links.id_Taxo = '159427'; % Taxonomicon
metaData.links.id_WoRMS = '237851'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euphausia_superba}}';
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
bibkey = 'Ross1982'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00393135}, ' ...
'author = {Ross, R. M.}, ' ... 
'year = {1982}, ' ...
'title = {Energetics of \emph{Euphausia pacifica}. {I}. {E}ffects of body carbon and nitrogen and temperature on measured and predicted production}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {68(1)}, ' ...
'pages = {1–13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ross1982a'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00393136}, ' ...
'author = {Ross, R. M.}, ' ... 
'year = {1982}, ' ...
'title = {Energetics of Euphausia pacifica. {II}. {C}omplete Carbon and Nitrogen Budgets at 8 C and 12 C Throughout the Life Span}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {68(1)}, ' ...
'pages = {15-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RossDaly1983'; type = 'Article'; bib = [ ... 
'doi = {10.4319/lo.1982.27.2.0304}, ' ...
'author = {Ross, R. M. and K. L. Daly and T. S. English}, ' ... 
'year = {1982}, ' ...
'title = {Reproductive cycle and fecundity of \emph{Euphausia pacifica} in {P}uget {S}ound, {W}ashington}, ' ...
'journal = {Limnol. Oceanogr.}, ' ...
'volume = {27(2)}, ' ...
'pages = {304-314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SuhSoh1993'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00349370}, ' ...
'author = {H.-L. Suh and H. Y. Soh and S. Y. Hong}, ' ... 
'year = {1993}, ' ...
'title = {Larval development of the euphausiid \emph{Euphausia pacifica} in the {Y}ellow {S}ea}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {115}, ' ...
'pages = {625-633}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DormSyde2015'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00349370}, ' ...
'author = {Jeffrey G. Dormana and William J. Sydeman and Steven J. Bograd and, Thomas M. Powell}, ' ... 
'year = {2015}, ' ...
'title = {An individual-based model of the krill \emph{Euphausia pacifica} in the {C}alifornia {C}urrent}, ' ...
'journal = {Progress in Oceanography}, ' ...
'volume = {138}, ' ...
'pages = {504–520}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
