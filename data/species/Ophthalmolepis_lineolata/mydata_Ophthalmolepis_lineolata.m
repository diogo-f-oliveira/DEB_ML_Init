function [data, auxData, metaData, txtData, weights] = mydata_Ophthalmolepis_lineolata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Ophthalmolepis_lineolata'; 
metaData.species_en = 'Maori wrasse'; 

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
data.Wwp = 61.4;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00490*Lp^3.15, see F1';
data.Wwi = 545;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.15, see F1';

data.Ri = 1.6e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';        bibkey.Ri = 'guess';
  temp.Ri = C2K(18.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Coris julis: 1e4*(40/16)^3';
  
% univariate data
data.tL_P = [ ... % time since birth (yr), total length (cm) 
1.233	8.151
1.302	8.931
1.349	13.054
1.442	12.832
1.442	11.607
1.488	12.053
1.884	13.839
1.930	15.288
2.023	14.175
2.070	12.950
2.093	14.955
2.116	16.293
2.186	16.405
2.209	14.288
2.233	16.962
2.233	14.957
2.279	13.620
2.279	13.063
2.302	15.737
2.326	15.626
2.628	13.735
2.628	17.523
2.628	18.080
2.651	12.844
2.698	15.295
2.814	14.405
2.814	15.296
2.884	19.977
2.884	19.308
2.907	18.640
3.047	17.861
3.070	19.198
3.233	17.752
3.256	20.760
3.279	19.535
3.302	19.089
3.302	18.086
3.326	16.527
3.419	21.876
3.488	20.985
3.512	19.091
3.535	19.983
3.558	20.874
3.698	18.424
3.837	24.331
3.860	18.092
3.860	18.203
3.884	21.323
3.930	23.998
4.000	22.438
4.023	18.650
4.047	21.770
4.070	19.208
4.140	21.214
4.186	23.109
4.256	22.441
4.256	20.769
4.256	20.658
4.279	18.207
4.302	25.784
4.302	19.990
4.302	18.987
4.349	20.102
4.372	18.208
4.395	21.773
4.442	19.323
4.512	21.217
4.535	20.438
4.581	18.433
4.605	23.781
4.651	25.898
4.721	24.228
4.744	22.222
4.814	24.674
4.837	21.666
4.837	21.443
4.930	25.455
4.930	22.558
4.953	24.453
4.953	20.887
4.977	24.899
4.977	23.784
4.977	22.002
5.000	26.459
5.000	20.219
5.047	28.130
5.047	27.239
5.047	18.660
5.093	28.354
5.093	19.440
5.093	20.889
5.093	23.340
5.116	24.009
5.116	23.340
5.116	22.003
5.186	22.895
5.209	26.795
5.233	23.675
5.233	24.567
5.233	24.901
5.256	26.238
5.256	20.333
5.279	25.681
5.326	21.894
5.326	21.225
5.326	20.779
5.326	22.785
5.372	22.897
5.419	22.451
5.442	21.783
5.488	22.564
5.535	24.124
5.605	21.116
5.605	23.345
5.628	27.579
5.698	25.240
5.698	24.905
5.698	23.345
5.744	27.246
5.837	24.461
5.907	25.910
5.930	27.024
5.953	26.579
6.000	20.451
6.047	24.129
6.070	25.020
6.093	25.800
6.093	23.461
6.093	22.012
6.116	26.023
6.116	22.681
6.233	28.030
6.233	23.350
6.302	25.579
6.326	22.237
6.326	21.680
6.349	27.251
6.395	21.903
6.419	24.912
6.465	27.364
6.488	23.910
6.488	22.350
6.535	24.579
6.581	26.251
6.581	26.808
6.628	25.360
6.767	28.146
6.791	27.924
6.814	26.587
6.814	24.024
6.860	26.030
6.860	22.131
6.884	21.685
6.930	27.368
6.953	28.037
6.977	29.040
6.977	23.246
7.000	30.043
7.000	28.594
7.047	21.687
7.070	26.589
7.070	22.801
7.116	24.696
7.233	25.031
7.256	28.708
7.256	22.134
7.279	24.474
7.302	25.923
7.326	29.266
7.395	21.801
7.419	27.930
7.442	24.587
7.442	21.579
7.465	26.593
7.488	22.805
7.535	23.808
7.558	27.485
7.558	29.045
7.605	31.274
7.628	27.709
7.628	27.152
7.721	25.704
7.837	27.599
7.837	24.145
7.860	29.382
7.860	25.594
7.907	26.040
7.930	26.820
7.953	27.378
8.000	27.824
8.023	28.827
8.023	21.696
8.070	24.482
8.070	22.253
8.140	29.608
8.256	24.595
8.256	26.155
8.256	27.603
8.326	23.927
8.326	29.275
8.326	21.253
8.372	25.599
8.372	22.590
8.419	24.596
8.465	28.719
8.465	29.165
8.488	27.828
8.512	28.385
8.581	27.829
8.651	22.927
8.651	29.055
8.977	28.835
9.000	24.490
9.023	29.282
9.047	30.173
9.070	25.159
9.116	27.500
9.326	28.616
9.326	27.725
9.465	26.500
9.512	28.172
9.558	28.618
9.674	29.065
9.721	25.166
9.744	28.285
10.442	25.952];
data.tL_P(:,1) = 365 * (0 + data.tL_P(:,1)); % convert yr to d
for i=2:size(data.tL_P,1); if data.tL_P(i,1)<=data.tL_P(i-1,1);data.tL_P(i,1)=data.tL_P(i-1,1)+1e-3; end;end
units.tL_P   = {'d', 'cm'};  label.tL_P = {'time since birth', 'total length'};  
temp.tL_P    = C2K(18.4);  units.temp.tL_P = 'K'; label.temp.tL_P = 'temperature';
bibkey.tL_P = 'LekFair2012'; comment.tL_P = 'Perth region';
%
data.tL_J = [ ... % time since birth (yr), total length (cm) 
1.251	8.139
1.367	9.814
1.622	11.935
1.691	13.275
2.108	15.171
2.317	20.085
2.317	13.381
2.340	11.928
2.363	18.744
2.386	18.296
2.386	17.291
2.456	20.977
2.456	15.167
2.479	15.279
2.502	13.938
2.525	16.396
2.641	18.518
2.664	19.076
2.664	14.607
2.757	18.181
2.896	19.632
3.012	18.849
3.058	20.190
3.081	17.620
3.104	20.636
3.104	21.083
3.127	21.753
3.243	18.624
3.313	25.103
3.313	18.176
3.336	14.377
3.336	17.617
3.336	19.181
3.359	16.276
3.359	16.835
3.382	15.494
3.405	15.047
3.429	21.862
3.475	20.409
3.637	20.072
3.683	21.636
3.707	24.876
3.753	23.759
3.776	18.283
3.799	20.406
3.869	23.311
3.892	22.081
3.961	23.310
4.031	24.203
4.077	23.085
4.077	21.744
4.100	25.431
4.100	25.543
4.124	21.520
4.170	23.866
4.216	20.514
4.239	23.866
4.239	20.737
4.286	23.418
4.309	26.435
4.332	19.954
4.355	27.217
4.378	19.842
4.402	24.870
4.402	22.188
4.425	25.987
4.425	21.182
4.471	22.411
4.471	24.646
4.471	21.517
4.541	23.639
4.564	23.639
4.564	21.963
4.633	20.957
4.633	24.532
4.703	22.632
4.703	21.403
4.749	26.431
4.749	24.196
4.795	24.866
4.795	21.514
4.819	24.754
4.842	26.542
4.842	25.983
4.842	22.743
4.865	22.519
4.888	21.402
4.911	23.413
4.934	22.854
4.934	20.619
4.981	24.864
4.981	26.093
5.027	23.858
5.050	27.881
5.073	23.299
5.097	26.986
5.120	23.187
5.282	25.979
5.328	21.286
5.351	30.112
5.351	23.408
5.351	22.626
5.375	29.107
5.398	27.766
5.398	24.414
5.444	26.424
5.444	25.084
5.467	26.089
5.467	22.960
5.467	22.067
5.490	28.659
5.560	24.524
5.606	25.529
5.676	26.199
5.699	26.757
5.768	29.885
5.792	27.315
5.861	28.990
5.861	25.191
5.884	23.068
6.000	29.771
6.000	27.648
6.023	27.089
6.046	28.989
6.046	25.525
6.046	24.966
6.093	29.659
6.116	31.111
6.139	23.960
6.255	27.646
6.324	29.768
6.324	25.858
6.324	22.952
6.347	26.081
6.417	25.298
6.417	22.393
6.440	27.979
6.440	27.532
6.440	25.074
6.440	23.734
6.486	29.096
6.510	26.191
6.579	28.984
6.579	30.771
6.579	28.760
6.579	25.855
6.579	24.403
6.672	25.743
6.695	27.307
6.741	29.429
6.741	28.312
6.764	29.764
6.811	25.294
6.834	26.188
6.834	24.289
6.857	27.193
6.903	28.534
6.927	30.433
6.927	31.103
6.950	27.081
6.950	27.416
6.950	29.315
6.996	25.516
7.019	31.661
7.042	26.186
7.112	28.643
7.135	26.520
7.135	27.302
7.181	30.431
7.228	28.531
7.251	28.419
7.344	28.865
7.390	30.876
7.390	31.211
7.413	26.741
7.413	25.512
7.459	30.093
7.483	29.422
7.483	26.517
7.552	24.729
7.598	29.198
7.622	30.203
7.645	25.845
7.668	27.968
7.714	30.873
7.714	31.655
7.761	27.520
7.807	29.643
7.807	31.319
7.830	26.402
7.853	27.408
7.876	27.519
7.876	29.195
7.876	30.089
7.876	25.731
7.900	25.396
7.900	28.301
7.946	29.753
7.992	31.540
8.085	28.523
8.340	30.308
8.363	29.302
8.432	31.871
8.432	27.849
8.432	26.508
8.456	26.732
8.548	31.535
8.595	29.077
8.664	26.506
8.664	27.288
8.664	31.311
8.780	29.410
8.780	30.974
9.429	32.086
9.707	30.184
9.846	28.395
9.938	30.181
10.124	29.398
10.170	27.609
10.332	29.507
11.351	29.498
11.815	29.605];
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
F1 = 'length weight: Ww in g = 0.00490*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Coris julis: Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6T344'; % Cat of Life
metaData.links.id_ITIS = '647814'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Ophthalmolepis_lineolata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '181991'; % Taxonomicon
metaData.links.id_WoRMS = '281915'; % WoRMS
metaData.links.id_fishbase = 'Ophthalmolepis-lineolata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ophthalmolepis-lineolata}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Ophthalmolepis-lineolata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

