function [data, auxData, metaData, txtData, weights] = mydata_Urolophus_lobatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urolophidae';
metaData.species    = 'Urolophus_lobatus'; 
metaData.species_en = 'Lobed stingaree'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 10*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'WhitPlat2001';    
  temp.ab = C2K(16.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'WhitPlat2001';   
  temp.am = C2K(16.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 9;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'WhitPlat2001';
data.Lp = 20;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty for females'; bibkey.Lp  = 'WhitPlat2001';
data.Lpm = 16;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'WhitPlat2001'; 
data.Li  = 27.7;  units.Li  = 'cm';  label.Li  = 'ultimate disc width for females';   bibkey.Li  = 'WhitPlat2001';
data.Lim  = 23.7;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'WhitPlat2001'; 

data.Wwi = 349; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = {'WhitPlat2001','WhitPott2005'}; 
  comment.Wwi = 'based on 10^-5.20 *(10*Li)^3.17, see F1';
data.Wwim = 267; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = {'WhitPlat2001','WhitPott2005'}; 
  comment.Wwim = 'based on 10^-5.03 *(10*Lim)^3.14, see F1';

data.Ri  = 3/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'WhitPlat2001';   
  temp.Ri = C2K(16.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 6 pups per litter, 1 litter per yr';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), disk width (cm)
0.051	9.692
0.097	9.492
0.100	8.223
0.124	10.829
0.126	10.027
0.181	11.965
0.271	11.297
0.276	8.892
0.301	10.829
0.302	10.362
0.305	8.758
0.354	13.970
0.359	11.765
0.364	9.026
0.387	12.099
0.445	13.035
0.447	11.765
0.449	10.696
0.473	13.837
0.529	15.240
0.530	14.839
0.534	12.634
0.540	9.628
0.561	13.971
0.566	11.231
0.592	13.236
0.614	16.777
0.619	14.505
0.706	15.374
0.791	16.778
0.798	13.437
0.823	15.976
0.854	14.907
0.882	15.910
0.975	13.438
1.003	14.106
1.029	16.244
1.032	14.507
1.035	12.837
1.057	16.979
1.178	15.510
1.179	15.042
1.232	17.849
1.265	16.112
1.292	17.448
1.325	15.577
1.350	18.183
1.351	17.382
1.352	16.780
1.557	17.716
1.560	16.247
1.585	18.318
1.618	16.982
1.823	17.718
1.824	17.183
1.825	16.782
1.855	16.248
1.857	15.179
1.886	15.780
2.056	19.188
2.122	15.714
2.321	19.457
2.323	18.789
2.354	17.853
2.355	17.252
2.356	16.851
2.357	16.116
2.440	19.190
2.590	18.122
2.650	17.454
2.766	18.390
2.794	19.258
2.882	19.526
2.911	19.927
2.913	18.992
2.914	18.457
2.915	17.923
2.916	17.455
3.059	19.460
3.087	20.462
3.267	18.659
3.292	21.064
3.355	18.927
3.383	20.129
3.384	19.394
3.529	20.865
3.530	20.130
3.533	18.593
3.586	21.734
3.680	19.195
3.824	20.799
3.854	20.599
3.971	21.335
4.090	20.934
4.176	21.870
4.325	21.536
4.325	21.403
4.352	22.405
4.412	21.871
4.534	19.934
4.590	21.671
4.647	22.807
4.856	21.606
4.886	21.071
4.972	22.475
5.003	21.606
5.089	23.277
5.296	23.077
5.297	22.610
5.327	22.142
5.352	24.280
5.501	23.546
5.622	22.344
5.857	23.080
5.858	22.345
5.916	22.746
6.092	23.281
6.241	22.547
6.328	23.750
6.476	23.082
6.505	23.350
6.534	23.951
6.651	24.486
6.741	23.685
6.800	23.484
6.801	23.017
6.802	22.482
6.805	21.146
6.917	24.220
7.037	23.352
7.038	22.817
7.039	22.082
7.065	23.953
7.214	23.486
7.358	24.957
7.360	24.021
7.479	23.755
7.480	23.086
7.596	24.290
7.625	24.691
7.806	22.754
7.832	24.357
7.834	23.288
8.039	23.891
8.186	24.292
8.245	24.560
8.277	23.157
8.392	24.961
8.482	24.093
8.627	25.430
8.628	24.762
8.629	24.361
8.779	23.159
8.864	24.696
9.012	24.563
9.014	23.828
9.098	25.833
9.132	23.895
9.218	24.898
9.249	24.163
9.277	25.165
9.341	22.292
9.390	27.638
9.396	24.631
9.454	25.166
9.516	23.830
9.628	26.837
9.808	25.435
9.810	24.032
10.044	25.369
10.045	24.901
10.103	25.503
10.194	23.966
10.250	25.637
10.252	24.501
10.369	25.303
10.427	25.771
10.489	24.302
10.575	25.304
10.664	25.037
11.134	26.442
11.225	25.307
11.226	24.906
11.340	26.978
11.462	24.907
11.668	25.309
12.021	25.978
12.228	25.578
14.502	25.053];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(23.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WhitPlat2001'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disk width (cm)
0.008	10.069
0.064	11.740
0.096	10.738
0.128	9.469
0.129	9.001
0.130	8.667
0.150	13.411
0.236	15.283
0.237	14.749
0.238	14.081
0.275	10.473
0.275	10.206
0.276	9.939
0.302	11.810
0.303	11.075
0.307	9.204
0.328	13.614
0.360	12.278
0.388	13.014
0.451	11.544
0.451	11.210
0.475	14.217
0.504	14.485
0.538	12.414
0.563	14.887
0.568	12.481
0.625	13.417
0.628	12.014
0.685	13.017
0.767	16.493
0.769	15.490
0.827	16.293
0.830	14.756
0.857	16.026
0.889	15.024
0.921	14.089
0.922	13.287
0.945	16.695
0.947	15.626
0.952	13.021
1.153	16.497
1.185	15.562
1.211	17.233
1.243	15.964
1.245	15.430
1.336	14.428
1.419	17.035
1.420	16.768
1.421	16.300
1.507	17.972
1.508	17.371
1.655	18.107
1.717	16.839
1.775	17.441
1.779	15.570
1.804	17.909
1.806	16.506
1.808	15.904
1.922	18.311
1.955	16.307
1.983	17.243
2.040	18.647
2.043	16.776
2.217	18.983
2.278	18.115
2.279	17.915
2.281	16.645
2.282	16.311
2.310	17.046
2.424	19.320
2.424	19.186
2.426	18.651
2.576	17.852
2.604	18.453
2.607	17.184
2.721	19.257
2.782	18.656
2.808	20.460
2.843	17.721
2.899	19.192
2.931	18.123
2.932	17.656
3.015	20.797
3.017	19.795
3.047	19.595
3.049	18.592
3.080	17.992
3.227	18.862
3.287	18.462
3.344	19.732
3.345	19.264
3.489	21.271
3.491	20.135
3.492	19.734
3.493	19.266
3.495	18.331
3.525	17.930
3.818	20.139
3.819	19.671
3.845	21.342
3.849	19.137
3.850	18.736
3.876	20.607
3.881	18.068
3.936	20.341
3.964	21.009
3.968	19.139
4.027	19.607
4.205	19.342
4.263	19.944
4.383	19.277
4.385	18.676
4.439	21.149
4.529	20.615
4.530	20.081
4.532	19.413
4.564	18.010
4.766	20.819
4.828	19.417
4.859	19.016
4.916	20.286
5.002	21.490
5.004	20.755
5.185	19.421
5.212	20.490
5.265	23.899
5.330	21.227
5.448	21.496
5.449	20.694
5.596	21.564
5.803	21.901
5.805	21.032
5.893	21.568
5.921	22.437
5.925	20.165
5.984	20.701
6.250	21.238
6.515	21.977
6.516	21.576
6.694	21.912
6.814	21.312
6.842	21.981
7.019	22.317
7.347	21.720
7.792	21.725
7.999	22.129
8.208	21.931
8.534	22.069
8.739	23.341
8.978	22.475
8.979	22.008
8.983	20.137
9.337	21.411
9.839	22.419
10.848	22.432
11.826	23.714
12.567	24.257];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(16.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WhitPlat2001'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight for Urolophus paucimaculatus: Ww in g  = 10^-5.20 * (DW in mm)^3.17 for females; 10^-5.03 * (DW in mm)^3.14 for males';
metaData.bibkey.F1 = 'WhitPott2005'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DW7X'; % Cat of Life
metaData.links.id_ITIS = '564429'; % ITIS
metaData.links.id_EoL = '46561056'; % Ency of Life
metaData.links.id_Wiki = 'Urolophus_lobatus'; % Wikipedia
metaData.links.id_ADW = 'Urolophus_lobatus'; % ADW
metaData.links.id_Taxo = '189796'; % Taxonomicon
metaData.links.id_WoRMS = '283103'; % WoRMS
metaData.links.id_fishbase = 'Urolophus-lobatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urolophus_lobatus}}'; 
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
bibkey = 'WhitPlat2001'; type = 'Article'; bib = [ ... 
'author = {William T. White and M. E. Platell and Ian C. Potter}, ' ...
'year = {2001}, ' ...
'title  = {Relationship between reproductive biology and age compositions and growth in \emph{Urolophus lobatus} ({B}atoidea: {U}rolophidae)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {138}, ' ...
'pages = {135-147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitPott2005'; type = 'Article'; bib = [ ... 
'author = {William T. White and Ian C. Potter}, ' ...
'year = {2005}, ' ...
'title  = {Reproductive biology, size and age compositions and growth of the batoid \emph{Urolophus paucimaculatus}, including comparisons with other species of the {U}rolophidae}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {56}, ' ...
'pages = {101-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Urolophus-lobatus.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 