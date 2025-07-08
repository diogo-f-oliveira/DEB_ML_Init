function [data, auxData, metaData, txtData, weights] = mydata_Notolabrus_parilus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Notolabrus_parilus'; 
metaData.species_en = 'Brownspotted wrasse'; 

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
data.Li  = 41; units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';
data.Wwp = 96.4;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F1';
data.Wwi = 873;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.07, see F1';

data.Ri = 1.7e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';        bibkey.Ri = 'guess';
  temp.Ri = C2K(18.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Coris julis: 1e4*(41/16)^3';
  
% univariate data
data.tL_P = [ ... % time since birth (yr), total length (cm) 
0.503	2.692
0.687	5.375
0.755	6.381
0.778	7.052
0.823	9.064
0.869	9.958
0.870	8.170
0.986	7.724
0.987	6.830
1.032	9.289
1.033	6.384
1.333	9.068
1.424	11.862
1.450	7.617
1.470	12.422
1.495	10.299
1.518	9.182
1.539	12.981
1.565	8.624
1.586	12.423
1.608	14.099
1.610	10.970
1.631	14.769
1.634	9.630
1.679	11.194
1.725	12.871
1.770	13.877
1.815	17.118
1.816	15.888
1.816	15.442
1.818	11.866
1.819	10.414
1.863	13.766
1.911	11.197
1.912	9.632
1.955	14.661
1.977	16.896
1.978	16.225
1.980	12.315
2.000	18.125
2.027	11.086
2.049	13.656
2.050	11.757
2.071	15.444
2.094	14.550
2.118	13.210
2.162	18.462
2.187	14.998
2.188	12.540
2.209	16.898
2.232	17.457
2.256	14.664
2.278	17.234
2.323	19.804
2.326	15.335
2.347	17.905
2.348	17.011
2.371	16.229
2.373	13.100
2.392	20.251
2.396	13.994
2.438	21.369
2.443	13.436
2.511	15.671
2.511	14.778
2.532	18.800
2.552	23.940
2.554	21.035
2.556	17.683
2.581	14.220
2.601	20.477
2.624	19.583
2.627	14.890
2.672	16.455
2.697	14.444
2.717	20.031
2.720	15.115
2.744	12.433
2.761	22.936
2.765	16.121
2.788	16.456
2.810	18.244
2.856	19.027
2.857	17.686
2.858	15.563
2.878	22.044
2.879	19.697
2.879	19.474
2.880	17.351
2.882	13.776
2.899	25.731
2.899	25.619
2.902	20.703
2.924	21.821
2.997	16.458
3.019	18.246
3.038	24.838
3.084	25.844
3.085	23.722
3.090	15.230
3.112	17.353
3.179	22.270
3.198	28.639
3.228	17.689
3.229	14.896
3.297	18.807
3.317	22.942
3.337	28.193
3.340	23.054
3.359	30.205
3.362	26.070
3.384	27.411
3.409	25.289
3.435	19.256
3.455	25.736
3.479	24.172
3.480	21.379
3.528	18.586
3.545	29.536
3.548	23.949
3.573	22.162
3.576	15.793
3.597	20.263
3.617	24.732
3.619	22.721
3.640	26.185
3.642	23.168
3.644	19.481
3.662	27.861
3.667	18.587
3.689	21.269
3.733	24.845
3.734	23.169
3.756	26.298
3.759	20.041
3.760	18.476
3.805	21.717
3.826	24.511
3.846	30.209
3.849	25.628
3.870	28.980
3.872	24.623
3.873	23.282
3.894	27.193
3.897	22.388
3.897	22.388
3.897	21.941
3.897	21.271
3.898	21.048
3.969	17.696
3.985	30.099
4.011	25.294
4.033	27.418
4.035	24.177
4.038	18.479
4.060	20.937
4.084	19.597
4.102	28.312
4.103	26.301
4.197	23.732
4.199	19.710
4.218	27.866
4.265	26.638
4.268	21.274
4.268	21.163
4.313	24.068
4.316	18.705
4.358	25.745
4.383	23.398
4.430	22.282
4.449	29.544
4.449	28.986
4.450	26.639
4.453	22.729
4.475	24.070
4.478	19.377
4.497	26.305
4.500	21.500
4.519	27.981
4.543	27.422
4.547	19.489
4.591	23.289
4.592	21.166
4.611	29.546
4.614	24.741
4.633	30.999
4.640	19.937
4.658	27.312
4.661	22.731
4.681	28.094
4.681	28.094
4.682	26.530
4.684	22.731
4.729	24.631
4.732	20.497
4.752	25.525
4.755	21.167
4.802	20.162
4.819	30.218
4.823	23.849
4.824	21.838
4.826	18.151
4.841	31.447
4.843	28.431
4.843	27.760
4.867	26.531
4.889	29.437
4.916	22.621
4.935	29.102
4.939	23.180
4.961	24.409
4.982	28.544
5.007	25.415
5.028	29.550
5.030	25.974
5.050	30.667
5.051	28.768
5.142	32.791
5.143	30.333
5.189	31.339
5.216	23.741
5.236	30.445
5.350	33.016
5.351	31.229
5.355	24.413
5.375	29.553
5.377	27.207
5.379	22.290
5.399	28.212
5.442	33.911
5.469	27.543
5.470	25.755
5.471	23.967
5.472	23.185
5.537	30.672
5.540	24.415
5.608	27.097
5.653	30.114
5.675	31.790
5.676	29.444
5.678	27.098
5.700	28.103
5.749	24.752
5.766	35.702
5.768	30.897
5.770	27.881
5.771	26.205
5.841	25.088
5.861	31.345
5.863	26.988
5.883	33.357
5.885	28.552
5.906	32.798
5.909	27.323
5.930	31.346
5.954	30.452
5.957	24.866
6.049	26.654
6.071	28.107
6.142	24.867
6.234	26.432
6.255	31.014
6.368	35.707
6.372	28.333
6.393	31.909
6.394	30.791
6.394	29.786
6.397	25.875
6.414	36.602
6.415	33.585
6.438	34.256
6.489	26.547
6.511	28.446
6.556	31.575
6.557	29.117
6.606	25.319
6.627	27.889
6.627	27.665
6.647	34.481
6.649	30.235
6.742	28.895
6.765	30.460
6.809	34.147
6.812	29.231
6.880	31.690
6.902	34.148
6.950	29.903
6.973	30.797
6.993	35.825
7.111	32.362
7.156	35.380
7.203	34.374
7.250	33.146
7.483	30.578
7.506	29.684
7.550	34.601
7.575	31.473
7.576	30.467
7.597	33.037
7.642	35.384
7.667	33.261
7.760	31.475
7.898	34.493
8.130	32.484
8.222	34.160
8.223	31.926
8.615	35.170
8.686	33.494
9.126	33.722
9.476	28.809
9.589	33.391
10.214	35.296
10.515	35.411];
data.tL_P(:,1) = 365 * (0 + data.tL_P(:,1)); % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1);data.tL_P(i,1)=data.tL_P(i-1,1)+1e-3; end;end
units.tL_P   = {'d', 'cm'};  label.tL_P = {'time since birth', 'total length'};  
temp.tL_P    = C2K(18.4);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'LekFair2012'; comment.tL_P = 'Perth region';
%
data.tL_J = [ ... % time since birth (yr), total length (cm) 
0.578	7.333
0.902	10.333
1.295	9.111
1.410	11.222
1.480	13.000
1.480	10.889
1.480	10.111
1.480	9.778
1.526	14.444
1.526	15.111
1.595	11.444
1.688	15.889
1.688	12.333
1.688	13.111
1.711	15.000
1.711	11.778
1.734	13.222
1.803	14.889
1.873	16.111
1.896	15.333
1.896	12.333
1.919	13.556
1.942	17.222
1.965	16.333
1.988	15.667
2.012	13.556
2.104	12.778
2.104	18.111
2.127	17.333
2.150	14.333
2.173	12.444
2.220	10.667
2.289	18.444
2.405	19.333
2.428	15.556
2.497	14.333
2.520	13.667
2.543	17.444
2.566	15.778
2.590	19.222
2.590	12.889
2.613	16.444
2.613	12.111
2.636	19.444
2.705	20.222
2.705	18.556
2.728	23.222
2.728	15.111
2.728	14.667
2.751	20.000
2.751	18.222
2.775	17.333
2.798	18.444
2.867	16.333
2.913	20.778
2.913	17.667
2.960	24.444
2.983	22.444
2.983	23.111
2.983	17.778
3.029	20.222
3.098	19.889
3.098	15.667
3.121	21.111
3.121	18.556
3.283	21.778
3.445	18.333
3.445	20.333
3.514	18.889
3.538	23.111
3.538	20.889
3.561	15.000
3.630	25.556
3.630	29.333
3.653	28.444
3.653	20.333
3.676	21.556
3.699	27.333
3.699	31.222
3.746	23.889
3.746	19.667
3.815	28.667
3.815	21.667
3.884	23.889
3.884	28.000
3.931	24.889
3.931	23.444
3.931	29.444
3.977	25.111
3.977	22.444
4.023	25.667
4.069	18.889
4.092	19.889
4.254	27.444
4.277	22.667
4.301	26.333
4.301	27.111
4.301	23.778
4.462	20.333
4.486	24.889
4.509	21.111
4.532	22.889
4.555	28.667
4.555	25.778
4.555	26.111
4.624	29.889
4.624	23.778
4.694	29.111
4.694	31.333
4.740	34.333
4.740	25.000
4.786	22.889
4.786	25.778
4.786	24.444
4.832	28.667
4.832	19.444
4.855	29.333
4.855	28.667
4.855	22.000
4.902	24.111
4.948	26.778
4.994	30.667
4.994	29.111
4.994	25.778
5.064	22.889
5.064	22.222
5.087	26.444
5.087	25.667
5.110	24.778
5.179	31.778
5.179	27.333
5.202	25.444
5.225	35.778
5.272	26.444
5.341	33.667
5.410	34.667
5.410	30.111
5.410	20.222
5.434	25.333
5.457	28.333
5.480	31.222
5.503	34.222
5.503	26.222
5.526	30.556
5.526	26.333
5.549	27.000
5.572	32.667
5.595	29.000
5.642	30.111
5.642	33.444
5.688	27.444
5.711	28.222
5.711	27.222
5.734	29.333
5.734	30.556
5.734	29.222
5.734	26.444
5.827	31.444
5.827	26.000
5.850	29.000
5.873	27.333
5.942	27.889
5.942	29.667
5.988	32.111
6.012	34.222
6.012	34.667
6.058	32.778
6.104	31.778
6.127	31.222
6.173	33.111
6.220	28.667
6.220	30.556
6.220	27.667
6.266	26.778
6.289	31.667
6.312	29.667
6.358	33.111
6.382	28.889
6.428	33.667
6.451	30.444
6.451	26.556
6.474	26.444
6.497	32.889
6.497	29.889
6.543	28.222
6.566	34.111
6.566	26.444
6.590	34.778
6.590	35.222
6.636	36.556
6.636	31.889
6.636	28.778
6.682	40.111
6.751	34.000
6.775	35.556
6.798	36.000
6.821	33.333
6.867	34.333
6.913	35.667
6.960	31.889
7.029	36.778
7.052	32.667
7.121	33.667
7.214	33.111
7.237	30.556
7.260	34.778
7.283	38.111
7.329	37.556
7.468	38.889
7.468	31.333
7.514	32.556
7.538	37.111
7.538	34.778
7.561	37.222
7.607	39.000
7.630	36.000
7.630	33.333
7.815	35.333
7.908	36.889
7.908	32.222
8.000	34.444
8.139	37.000
8.162	32.111
8.185	35.556
8.277	33.667
8.347	35.444
8.509	35.667
8.671	32.889
8.740	36.333
8.763	35.333
8.879	35.778
8.902	36.444
9.526	36.667
9.734	36.333
10.220	37.111];
data.tL_J(:,1) = 365 * (0 + data.tL_J(:,1)); % convert yr to d
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
metaData.links.id_CoL = '6SBC4'; % Cat of Life
metaData.links.id_ITIS = '614019'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Notolabrus_parilus'; % Wikipedia
metaData.links.id_ADW = 'Notolabrus_parilus'; % ADW
metaData.links.id_Taxo = '171759'; % Taxonomicon
metaData.links.id_WoRMS = '273548'; % WoRMS
metaData.links.id_fishbase = 'Notolabrus-parilus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notolabrus_parilus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Notolabrus-parilus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

