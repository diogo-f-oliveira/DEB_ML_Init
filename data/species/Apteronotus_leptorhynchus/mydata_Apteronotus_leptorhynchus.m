function [data, auxData, metaData, txtData, weights] = mydata_Apteronotus_leptorhynchus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gymnotiformes'; 
metaData.family     = 'Apteronotidae';
metaData.species    = 'Apteronotus_leptorhynchus'; 
metaData.species_en = 'Brown ghost knifefish'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2019 05 18];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.ab = 11; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';    
  temp.ab = C2K(26.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'IlieSirb2014';    
  temp.am = C2K(26.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;  units.Lp = 'cm';   label.Lp = 'total length at puberty for females';bibkey.Lp = 'IlieSirb2014'; 
data.Lpm = 13.5;  units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';bibkey.Lpm = 'IlieSirb2014'; 
data.Li = 20.2;   units.Li = 'cm';   label.Li = 'ultimate total length for females';  bibkey.Li = 'IlieSirb2014'; 
data.Lim = 26.8; units.Lim = 'cm';   label.Lim = 'ultimate total length for males';  bibkey.Lim = 'IlieSirb2014'; 
 
data.Wwb = 1.41e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = {'KirsSchu2002','fishbase'}; 
  comment.Wwb = 'based on egg diameter of 3 mm, which is typical for species of this group: pi/6*0.3^3';

data.GSI = 0.2/15; units.GSI = '-'; label.GSI = 'gonado domatic index';     bibkey.GSI = 'IlieSirb2014'; 
  temp.GSI = C2K(26.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % number of otolith rings (d), length (cm)
179.422	14.346
212.167	9.988
219.237	12.712
222.750	13.317
225.544	13.196
228.378	14.528
236.701	12.046
241.677	14.952
255.683	15.678
257.678	11.985
260.612	16.889
263.386	16.041
264.683	12.409
268.269	15.617
268.870	12.107
274.468	12.228
287.104	13.983
289.253	15.799
294.130	15.133
295.440	11.985
303.911	14.831
305.339	15.860
310.225	15.557
315.197	18.281
327.017	15.860
332.029	20.036
334.721	16.283
338.927	16.646
354.281	15.557
396.228	15.133];
data.tL_f(:,1) = 3 * data.tL_f(:,1); % convert otolith ring to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(26.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'IlieSirb2014'};
comment.tL_f = 'data for females; conversion of otolith rings to d on the basis of 1 ring each 3 d';
%
data.tL_m = [ ... % number of otholith rings (#), length (cm)
153.601	8.755
199.739	9.315
217.137	12.354
251.362	13.821
251.382	13.092
263.973	12.975
265.324	14.674
273.624	17.954
273.658	16.740
277.931	13.950
281.350	16.742
284.139	17.047
288.361	16.077
289.093	14.924
289.769	15.774
299.542	16.384
300.227	16.869
307.830	20.088
307.882	18.207
313.487	17.844
314.264	15.053
318.475	14.508
319.859	15.055
324.665	18.212
326.035	19.244
330.261	18.153
330.978	17.546
335.825	19.247
365.199	19.134
371.518	18.226
386.874	19.262
388.238	20.476
461.719	18.557];
data.tL_m(:,1) = 3 * data.tL_m(:,1); % convert otolith ring to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(26.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'IlieSirb2014'};
comment.tL_m = 'data for males; conversion of otolith rings to d on the basis of 1 ring each 3 d';

% length-weight
data.LW_f = [ ... % total length (cm), body weight (g)
8.013	1.071
8.013	0.942
8.566	1.136
9.033	2.727
9.266	2.175
9.470	1.948
9.499	1.364
9.674	1.981
9.790	2.435
9.848	1.558
9.907	2.338
10.023	4.578
10.023	2.013
10.023	1.688
10.140	2.468
10.198	2.240
10.198	2.532
10.256	2.857
10.286	2.695
10.315	3.019
10.315	2.792
10.315	2.208
10.315	1.981
10.402	4.318
10.490	1.916
10.490	1.786
10.519	3.669
10.548	2.727
10.548	2.435
10.606	1.753
10.693	3.214
10.693	2.500
10.781	3.377
10.781	3.961
10.810	3.799
10.839	2.760
10.839	1.883
10.868	1.526
10.927	2.403
10.956	4.708
10.985	2.857
11.014	3.182
11.014	1.656
11.043	2.500
11.043	2.208
11.072	2.240
11.101	3.442
11.101	2.500
11.131	3.799
11.131	4.253
11.218	2.792
11.247	2.532
11.305	2.987
11.334	2.403
11.364	3.442
11.364	3.506
11.422	2.662
11.451	3.409
11.451	2.922
11.480	3.149
11.509	3.247
11.509	2.013
11.509	1.721
11.597	2.857
11.655	4.253
11.713	3.506
11.742	2.597
11.801	3.279
11.830	3.766
11.830	2.792
11.830	3.571
11.888	6.526
11.888	3.182
11.888	3.149
11.917	4.318
11.917	4.058
11.946	3.831
11.946	3.084
11.946	3.019
11.976	4.286
12.005	4.578
12.005	3.377
12.034	5.487
12.034	5.714
12.034	4.058
12.034	2.597
12.063	4.968
12.063	3.669
12.121	2.857
12.150	2.792
12.179	6.396
12.209	3.701
12.209	2.532
12.238	4.903
12.267	3.344
12.296	4.221
12.296	3.766
12.354	4.838
12.354	3.929
12.413	4.773
12.413	4.448
12.413	2.597
12.442	2.792
12.471	4.545
12.471	3.766
12.500	4.156
12.529	6.071
12.529	5.779
12.529	2.760
12.558	4.545
12.558	3.247
12.617	6.494
12.617	5.065
12.646	6.851
12.646	3.052
12.675	5.065
12.704	4.091
12.762	5.942
12.762	5.032
12.762	4.351
12.762	3.799
12.791	5.260
12.791	4.610
12.821	5.942
12.850	7.500
12.850	3.539
12.879	3.442
12.908	5.877
12.908	3.279
12.937	5.260
12.937	4.513
12.995	8.994
12.995	7.175
12.995	5.714
12.995	4.968
12.995	4.058
12.995	3.766
12.995	3.539
12.995	3.019
13.024	4.870
13.024	2.857
13.112	4.448
13.141	3.799
13.170	11.331
13.170	7.532
13.199	4.805
13.228	6.136
13.228	5.617
13.228	5.032
13.228	3.929
13.258	4.481
13.287	5.357
13.374	4.708
13.374	3.961
13.462	6.136
13.462	5.844
13.549	4.610
13.549	4.188
13.578	8.084
13.578	4.318
13.607	6.721
13.607	5.325
13.607	4.123
13.607	3.766
13.636	4.903
13.636	5.000
13.666	5.130
13.695	4.578
13.695	3.929
13.840	5.877
13.840	5.097
13.869	8.766
13.869	5.325
13.869	5.552
13.899	9.903
13.899	6.039
13.928	6.266
13.928	4.610
13.928	4.578
13.957	6.136
13.957	5.065
13.986	7.370
13.986	4.838
14.015	5.649
14.015	5.714
14.044	5.422
14.044	5.909
14.044	4.870
14.103	5.065
14.190	6.526
14.219	8.734
14.277	6.006
14.277	5.519
14.277	5.649
14.277	5.357
14.307	6.851
14.307	5.747
14.336	6.331
14.336	5.227
14.365	6.234
14.452	5.130
14.452	4.545
14.481	7.597
14.481	7.403
14.481	5.779
14.510	6.526
14.510	5.455
14.569	8.117
14.627	8.604
14.627	7.695
14.656	6.266
14.714	8.214
14.714	8.214
14.714	5.747
14.744	8.312
14.744	7.175
14.773	5.227
14.860	7.695
14.860	6.688
14.860	5.747
14.860	4.740
14.889	6.948
14.977	8.506
14.977	6.266
14.977	5.519
15.006	4.740
15.122	6.039
15.181	7.305
15.181	6.006
15.210	15.390
15.210	6.234
15.239	7.630
15.443	8.019
15.443	7.435
15.443	6.396
15.530	9.675
15.559	8.117
15.618	8.474
15.618	8.214
15.618	7.305
15.734	8.377
15.793	9.903
15.909	9.545
15.909	9.448
15.909	9.091
15.997	6.753
16.055	10.682
16.055	8.117
16.055	7.987
16.084	5.519
16.259	8.474
16.375	9.805
16.492	9.351
16.492	9.513
16.696	10.260
16.754	9.481
16.783	9.058
16.900	8.117
17.045	13.994
17.075	10.162
17.308	9.903
17.657	8.506
18.211	10.130
18.269	13.052
18.386	12.273
18.473	12.890
18.765	14.253
20.105	12.955];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length', 'body weight', 'female'};  
bibkey.LW_f = {'IlieSirb2014'};
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm), body weight (g)
8.356	1.948
8.512	1.322
8.762	1.391
8.794	2.017
8.856	1.948
8.887	1.670
9.013	2.852
9.106	1.670
9.294	1.530
9.482	1.391
9.514	2.087
9.577	3.061
9.578	4.035
9.859	3.339
10.046	3.061
10.358	1.739
10.421	2.017
10.453	2.504
10.548	4.870
10.577	1.878
10.671	2.157
10.672	3.409
10.734	2.574
10.734	2.643
10.797	2.435
10.891	3.061
10.892	4.661
10.922	2.574
10.984	2.574
11.016	3.061
11.018	4.939
11.111	3.826
11.141	3.061
11.142	3.409
11.172	2.435
11.266	2.504
11.267	3.687
11.298	3.896
11.329	3.339
11.361	4.522
11.361	4.522
11.422	2.296
11.518	4.104
11.579	3.061
11.580	3.548
11.610	2.783
11.675	4.939
11.736	3.617
11.768	4.452
11.830	3.200
11.862	4.243
11.924	4.035
11.925	4.730
11.955	3.826
11.986	2.991
12.080	3.270
12.080	3.617
12.144	4.661
12.174	3.548
12.206	4.174
12.236	2.783
12.238	4.591
12.363	4.243
12.425	3.617
12.426	4.800
12.426	5.217
12.488	4.104
12.488	4.730
12.490	6.609
12.644	4.174
12.647	7.513
12.707	4.870
12.800	3.130
12.800	3.965
12.894	3.687
12.895	4.870
12.926	4.313
12.988	3.896
13.020	5.009
13.050	2.783
13.114	5.287
13.114	5.496
13.145	4.661
13.207	4.452
13.270	4.035
13.271	5.983
13.302	4.800
13.302	4.870
13.302	5.357
13.366	6.609
13.427	5.357
13.457	3.826
13.459	5.843
13.495	11.965
13.520	4.591
13.522	6.122
13.551	3.270
13.552	5.217
13.708	4.591
13.741	6.400
13.741	6.957
13.744	9.878
13.772	6.122
13.835	6.678
13.865	5.148
13.865	5.496
13.896	4.870
13.959	4.800
13.960	5.843
13.990	4.591
14.024	8.209
14.116	5.913
14.178	5.287
14.178	5.496
14.304	6.470
14.367	7.026
14.491	5.565
14.584	4.591
14.585	5.983
14.616	5.009
14.618	7.722
14.648	5.983
14.741	4.730
14.742	6.678
14.774	7.165
14.866	5.078
14.898	5.983
14.899	7.513
14.962	6.887
14.962	6.957
14.962	7.791
14.991	4.452
15.023	5.217
15.023	5.843
15.148	5.565
15.181	7.304
15.211	6.122
15.242	5.774
15.275	7.304
15.306	7.652
15.307	8.626
15.369	7.652
15.494	7.652
15.558	8.835
15.587	6.748
15.618	6.261
15.621	10.087
15.712	6.330
15.745	8.904
15.745	9.043
15.868	5.287
15.868	5.774
15.900	6.678
16.026	7.791
16.026	8.070
16.027	8.417
16.057	7.235
16.057	7.583
16.058	8.278
16.183	8.626
16.278	10.017
16.371	8.278
16.463	6.330
16.464	7.443
16.464	7.861
16.496	8.904
16.525	5.774
16.620	7.165
16.622	9.461
16.623	11.478
16.653	8.626
16.683	8.000
16.778	9.461
16.809	9.183
16.842	10.852
16.902	8.139
16.903	8.557
16.997	9.043
16.998	10.296
17.095	13.704
17.124	11.061
17.128	16.000
17.185	9.252
17.217	10.504
17.248	9.461
17.311	10.017
17.311	10.087
17.311	10.365
17.343	10.852
17.405	10.365
17.498	9.043
17.498	10.017
17.593	10.643
17.593	10.852
17.655	10.365
17.810	8.070
17.812	10.574
17.874	9.878
17.907	11.826
18.030	9.183
18.089	5.148
18.128	14.330
18.188	11.061
18.221	13.357
18.250	10.504
18.314	13.078
18.345	12.174
18.378	14.748
18.406	9.878
18.503	13.843
18.597	14.470
18.877	12.591
18.878	13.148
18.878	13.913
19.099	15.722
19.192	14.748
19.219	9.739
19.285	13.913
19.286	15.304
19.347	12.870
19.513	25.322
19.535	13.913
19.569	16.696
19.755	14.678
20.037	15.652
20.444	15.235
20.532	8.626
21.196	16.904
21.199	21.009
21.762	20.661
23.226	12.243
23.329	23.304
23.767	23.861
24.080	24.209
24.560	37.078
25.061	37.565];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length', 'body weight', 'male'};  
bibkey.LW_m = {'IlieSirb2014'};
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'FYRR'; % Cat of Life
metaData.links.id_ITIS = '640246'; % ITIS
metaData.links.id_EoL = '223831'; % Ency of Life
metaData.links.id_Wiki = 'Apteronotus_leptorhynchus'; % Wikipedia
metaData.links.id_ADW = 'Apteronotus_leptorhynchus'; % ADW
metaData.links.id_Taxo = '161544'; % Taxonomicon
metaData.links.id_WoRMS = '1525945'; % WoRMS
metaData.links.id_fishbase = 'Apteronotus-leptorhynchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Apteronotus_leptorhynchus}}';  
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
bibkey = 'IlieSirb2014'; type = 'Article'; bib = [ ...    
'author = {Iulian Ilie\c{s} and Ruxandra F. S\^{i}rbulescu and G\"{u}nther K.H. Zupanc}, ' ...
'year  = {2014}, ' ...
'title = {Indeterminate body growth and lack of gonadal decline in the brown ghost knifefish (\emph{Apteronotus leptorhynchus}), an organism exhibiting negligible brain senescence}, ' ...  
'journal = {Can. J. Zool.}, ' ...
'doi = {10.1139/cjz-2014-0109}, ' ...
'pages = {947-953}, ' ...
'volume = {92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KirsSchu2002'; type = 'Article'; bib = [ ...    
'author = {Frank Kirschbaum and Christian Schugardt}, ' ...
'year  = {2002}, ' ...
'title = {Reproductive strategies and developmental aspects in mormyrid and gymnotiform fishes}, ' ...  
'journal = {Journal of Physiology-Paris}, ' ...
'doi = {10.1016/S0928-4257(03)00011-1}, ' ...
'pages = {96}, ' ...
'volume = {557-566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Apteronotus-leptorhynchus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

