function [data, auxData, metaData, txtData, weights] = mydata_Coris_auricularis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Coris_auricularis'; 
metaData.species_en = 'Western king wrasse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2025 01 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 17]; 

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LekFair2012';   
  temp.am = C2K(18.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 40; units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 96.4;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F1';
data.Wwi = 809;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.07, see F1';

data.Ri = 1.6e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';        bibkey.Ri = 'guess';
  temp.Ri = C2K(18.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Coris julis: 1e4*(40/16)^3';
  
% univariate data
data.tL_P = [ ... % time since birth (yr), total length (cm) 
0.530	2.936
0.692	5.176
0.738	6.521
0.831	7.305
0.854	10.218
0.877	8.762
0.900	7.754
0.923	9.210
1.039	6.857
1.062	8.090
1.062	9.098
1.363	9.882
1.386	11.115
1.386	9.322
1.386	8.538
1.409	12.571
1.409	7.978
1.456	11.563
1.479	7.417
1.525	10.555
1.571	13.692
1.595	14.364
1.595	8.762
1.618	13.244
1.641	9.546
1.641	12.459
1.664	12.571
1.664	9.210
1.687	10.779
1.803	13.916
1.803	10.331
1.849	9.882
1.849	11.899
1.895	15.148
1.895	9.098
1.942	15.709
1.942	17.838
1.965	16.717
1.965	17.389
1.965	12.571
1.988	10.891
1.988	10.218
1.988	10.331
2.011	13.020
2.011	11.339
2.034	12.235
2.081	13.468
2.081	11.451
2.127	13.244
2.127	16.829
2.127	18.398
2.173	11.787
2.312	19.966
2.312	17.613
2.312	12.123
2.358	15.261
2.381	13.020
2.428	13.020
2.497	21.983
2.497	19.070
2.520	17.838
2.520	15.373
2.520	14.252
2.520	15.373
2.543	19.630
2.543	17.725
2.567	20.078
2.590	16.157
2.590	13.356
2.613	20.863
2.636	19.518
2.659	16.605
2.705	18.734
2.705	14.252
2.729	23.776
2.729	15.261
2.729	12.571
2.752	17.613
2.798	20.415
2.821	18.398
2.844	15.597
2.868	22.880
2.868	25.457
2.868	19.630
2.868	16.045
2.914	20.639
2.937	22.319
2.937	24.112
2.937	18.286
2.960	16.941
2.960	13.804
2.983	21.423
2.983	17.501
3.030	24.336
3.030	16.605
3.030	15.373
3.053	25.120
3.053	18.622
3.099	25.905
3.099	16.045
3.145	14.812
3.145	20.303
3.192	21.647
3.215	22.095
3.215	16.941
3.261	15.036
3.284	22.655
3.307	28.482
3.307	19.182
3.377	27.810
3.377	27.137
3.377	21.423
3.377	19.966
3.446	23.776
3.446	22.319
3.446	19.294
3.469	29.714
3.492	25.793
3.492	21.199
3.492	18.734
3.516	26.465
3.562	22.880
3.585	23.440
3.608	27.585
3.608	24.784
3.608	20.863
3.631	25.008
3.631	19.518
3.631	18.398
3.654	26.129
3.654	23.440
3.654	15.821
3.678	29.378
3.678	22.319
3.701	25.793
3.724	21.647
3.816	20.751
3.840	24.336
3.840	24.560
3.840	23.888
3.840	23.328
3.863	25.345
3.863	30.050
3.886	26.353
3.886	22.431
3.909	28.370
3.909	21.311
3.909	18.286
3.932	29.602
3.955	17.950
3.955	18.398
3.955	27.361
3.978	19.182
4.025	23.216
4.025	24.000
4.048	30.162
4.071	24.672
4.071	21.871
4.117	27.361
4.117	28.258
4.140	20.078
4.164	24.896
4.210	26.017
4.210	27.585
4.256	21.423
4.256	23.216
4.256	27.249
4.302	18.734
4.349	25.793
4.395	23.104
4.441	25.457
4.441	22.543
4.464	28.818
4.488	26.801
4.488	23.552
4.488	21.311
4.511	29.042
4.534	19.294
4.557	27.585
4.557	24.560
4.557	23.440
4.580	28.034
4.580	24.896
4.603	31.171
4.603	26.241
4.626	28.482
4.626	22.992
4.626	19.742
4.673	29.154
4.673	27.922
4.673	21.311
4.719	27.137
4.719	22.431
4.742	25.457
4.742	24.672
4.765	20.975
4.788	24.336
4.812	20.078
4.835	29.490
4.835	24.672
4.835	18.062
4.858	30.723
4.858	27.697
4.858	26.017
4.858	23.888
4.881	28.594
4.904	26.241
4.927	25.345
4.927	23.776
4.927	22.319
4.974	29.378
4.997	26.577
5.020	26.129
5.043	27.473
5.043	22.880
5.066	30.499
5.066	24.336
5.089	28.146
5.136	32.291
5.136	31.955
5.159	29.490
5.182	31.283
5.205	28.706
5.228	23.888
5.251	23.552
5.321	22.543
5.367	29.490
5.413	27.473
5.413	30.387
5.436	28.482
5.460	33.300
5.460	22.880
5.483	27.585
5.483	30.947
5.483	24.672
5.506	33.748
5.529	23.888
5.529	25.232
5.622	31.059
5.645	26.801
5.645	29.826
5.668	27.473
5.691	31.843
5.691	24.336
5.737	28.034
5.737	26.241
5.737	24.112
5.760	29.266
5.784	29.938
5.807	35.541
5.830	25.008
5.876	28.706
5.899	30.835
5.922	33.188
5.922	27.137
5.946	32.515
5.946	31.395
5.992	24.784
6.061	28.034
6.177	26.801
6.246	30.723
6.246	24.448
6.339	33.524
6.339	35.204
6.362	30.611
6.362	26.017
6.408	25.793
6.432	32.179
6.455	34.084
6.455	29.378
6.455	28.034
6.455	26.465
6.478	36.437
6.478	28.482
6.547	29.602
6.547	28.146
6.594	27.585
6.617	34.532
6.640	31.619
6.640	28.818
6.663	24.784
6.686	29.938
6.732	28.482
6.756	34.084
6.802	30.275
6.871	29.378
6.918	31.171
7.010	34.084
7.033	35.541
7.033	30.275
7.057	32.067
7.057	29.490
7.242	34.980
7.265	33.188
7.288	33.972
7.496	30.499
7.496	29.490
7.543	34.756
7.612	35.092
7.612	32.627
7.612	31.395
7.635	33.188
7.728	30.162
7.797	31.395
7.867	34.420
8.098	32.403
8.191	31.731
8.283	34.084
8.630	34.980
8.769	33.300
9.163	33.636
9.482	28.762
9.672	33.300
10.181	35.204
10.528	35.429];
data.tL_P(:,1) = 365 * (.5 + data.tL_P(:,1)); % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1);data.tL_P(i,1)=data.tL_P(i-1,1)+1e-3; end;end
units.tL_P   = {'d', 'cm'};  label.tL_P = {'time since birth', 'total length'};  
temp.tL_P    = C2K(18.4);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'LekFair2012'; comment.tL_P = 'Perth region';
%
data.tL_J = [ ... % time since birth (yr), total length (cm) 
0.594	6.115
0.915	9.999
1.375	11.005
1.375	9.897
1.399	9.122
1.468	9.788
1.489	13.113
1.513	10.675
1.625	16.107
1.649	15.110
1.672	14.446
1.695	14.668
1.697	11.233
1.719	12.784
1.741	14.114
1.833	15.224
1.855	16.111
1.881	12.233
1.902	15.558
1.926	13.342
1.973	12.457
2.063	16.004
2.085	17.888
2.087	14.121
2.133	13.346
2.134	12.460
2.154	16.892
2.181	10.688
2.338	18.779
2.360	19.777
2.454	16.787
2.478	15.236
2.480	12.023
2.500	16.344
2.525	13.132
2.571	14.241
2.591	18.784
2.593	15.238
2.615	17.565
2.662	15.793
2.682	20.669
2.683	18.342
2.706	19.340
2.709	14.465
2.754	15.020
2.775	19.563
2.777	16.239
2.796	22.887
2.799	17.126
2.868	17.792
2.868	17.127
2.912	20.563
2.913	19.676
2.956	24.663
2.983	18.015
3.050	22.116
3.051	20.233
3.095	23.114
3.120	20.566
3.120	19.680
3.121	18.683
3.145	15.802
3.165	21.343
3.303	21.345
3.442	19.908
3.443	18.356
3.515	14.701
3.533	22.790
3.535	18.580
3.580	20.797
3.622	27.889
3.623	25.894
3.626	20.465
3.650	20.022
3.691	28.555
3.715	26.893
3.736	29.442
3.740	24.013
3.759	30.772
3.764	21.243
3.781	31.437
3.809	23.571
3.811	19.250
3.830	27.339
3.875	28.780
3.875	28.115
3.877	24.569
3.898	29.445
3.971	22.798
4.015	25.237
4.016	24.572
4.019	19.475
4.065	18.700
4.201	22.581
4.221	27.013
4.245	25.795
4.291	26.461
4.338	24.024
4.474	28.680
4.476	24.248
4.499	25.578
4.525	19.928
4.546	23.695
4.547	22.366
4.548	20.593
4.588	29.901
4.592	23.253
4.613	26.245
4.637	24.805
4.680	31.011
4.683	25.027
4.704	29.017
4.704	28.352
4.707	23.255
4.724	34.557
4.799	24.032
4.821	25.141
4.823	23.036
4.823	22.149
4.843	26.803
4.848	19.380
4.866	28.355
4.867	25.142
4.888	29.353
4.891	24.366
4.913	26.251
4.933	30.572
4.936	25.808
4.957	29.132
5.027	27.915
5.099	22.819
5.117	31.573
5.144	24.593
5.146	21.601
5.167	25.812
5.167	24.815
5.189	27.364
5.189	26.810
5.207	35.453
5.259	25.371
5.370	32.907
5.394	30.470
5.420	25.152
5.438	34.681
5.439	32.576
5.462	33.463
5.466	25.928
5.469	19.834
5.509	30.583
5.512	26.594
5.555	31.359
5.557	28.035
5.624	32.136
5.625	29.809
5.648	30.364
5.650	27.040
5.718	28.925
5.738	33.136
5.742	25.933
5.787	28.040
5.809	30.699
5.811	27.264
5.834	26.378
5.880	27.376
5.901	29.593
5.921	34.801
5.922	34.358
5.925	29.261
5.946	32.142
5.948	27.821
6.014	33.251
6.062	31.258
6.179	26.828
6.199	32.812
6.200	31.704
6.201	29.931
6.224	28.934
6.246	30.818
6.248	28.270
6.268	33.589
6.271	27.162
6.337	33.922
6.454	29.381
6.476	31.266
6.478	28.052
6.479	26.390
6.479	26.058
6.498	33.814
6.500	30.269
6.522	32.596
6.524	28.829
6.566	35.367
6.589	36.254
6.594	26.392
6.656	39.912
6.660	31.601
6.705	33.818
6.708	28.832
6.775	32.822
6.796	36.368
6.819	35.704
6.844	31.937
6.889	34.597
6.934	35.928
7.095	36.596
7.121	32.275
7.142	34.270
7.187	37.705
7.189	32.608
7.211	35.157
7.260	30.615
7.302	37.264
7.328	31.281
7.443	32.059
7.462	38.597
7.486	36.935
7.534	33.944
7.624	38.711
7.627	33.060
7.694	35.831
7.763	36.497
7.810	35.058
7.901	36.721
7.904	32.511
7.995	34.396
8.085	37.057
8.111	32.182
8.132	34.953
8.248	35.176
8.271	33.515
8.432	35.512
8.572	32.412
8.730	36.626
8.777	34.965
8.869	36.628
8.892	35.410
9.467	36.529
9.698	36.090
10.204	37.096];
data.tL_J(:,1) = 365 * (.5 + data.tL_J(:,1)); % convert yr to d
for i=2:size(data.tL_J,1); if data.tL_J(i,1)<=data.tL_J(i-1,1);data.tL_J(i,1)=data.tL_J(i-1,1)+1e-3; end;end
units.tL_J   = {'d', 'cm'};  label.tL_J = {'time since birth', 'total length'};  
temp.tL_J    = C2K(18.4);  units.temp.tL_J = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_J = 'LekFair2012'; comment.tL_J = 'Jurien Bay Marin Park';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_P = 5 * weights.tL_P;
weights.tL_J = 5 * weights.tL_J;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_P','tL_J'}; subtitle1 = {'Data from Pirth, Jurien Bay Marin Park'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length weight: Ww in g = 0.00977*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Coris julis: Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'YFBL'; % Cat of Life
metaData.links.id_ITIS = '613537'; % ITIS
metaData.links.id_EoL = '46571641'; % Ency of Life
metaData.links.id_Wiki = 'Coris'; % Wikipedia
metaData.links.id_ADW = 'Coris_auricularis'; % ADW
metaData.links.id_Taxo = '171759'; % Taxonomicon
metaData.links.id_WoRMS = '273548'; % WoRMS
metaData.links.id_fishbase = 'Coris-auricularis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coris-auricularis}}';
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
bibkey = 'LekFair2012'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2012.03446.x}, ' ...
'author = {E. Lek and D. V. Fairclough and N. G. Hall and S. A. Hesp and I. C. Potter}, ' ... 
'year = {2012}, ' ...
'title = {Do the maximum sizes, ages and patterns of growthof three reef-dwelling labrid species at two latitudes differin a manner conforming to the metabolic theoryof ecology?}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {81}, ' ...
'pages = {1936–1962}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coris-auricularis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

