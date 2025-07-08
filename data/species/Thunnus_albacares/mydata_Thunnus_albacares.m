function [data, auxData, metaData, txtData, weights] = mydata_Thunnus_albacares
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Thunnus_albacares'; 
metaData.species_en = 'Yellowfin tuna'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 17];


%% set data
% zero-variate data

data.ab = 1.43;    units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'fishbase';
  temp.ab = C2K(30.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11 * 365;   units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 103.3;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase';
  comment.Lp = '100 to 125 cm, not clear if this is TL or FL';
data.Li  = 239;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb  = 4.63e-4;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.96 mm: pi/6*0.096^3';
data.Wwi  = 200e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'fishbase';

data.Ri = 30.3e6/365;    units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.569	53.619
0.573	34.251
0.626	44.968
0.642	33.431
0.711	37.143
0.711	33.434
0.753	30.964
0.765	42.915
0.820	42.094
0.860	53.222
0.874	51.575
0.875	45.805
0.918	37.978
0.944	43.336
0.987	37.157
1.013	46.637
1.038	61.885
1.067	53.233
1.096	42.108
1.122	51.999
1.151	44.583
1.164	48.705
1.165	42.524
1.166	40.875
1.203	62.718
1.206	45.822
1.260	55.715
1.289	45.827
1.302	51.185
1.303	47.888
1.303	44.591
1.304	40.470
1.329	54.483
1.342	58.192
1.371	51.188
1.386	45.008
1.399	47.893
1.438	61.906
1.442	41.714
1.496	50.370
1.535	60.675
1.538	46.664
1.538	45.840
1.563	58.203
1.591	55.320
1.606	52.024
1.620	49.140
1.634	48.317
1.645	63.153
1.672	68.923
1.675	52.440
1.701	62.331
1.701	58.623
1.730	54.503
1.731	49.970
1.742	63.158
1.770	63.159
1.783	67.693
1.786	50.797
1.812	56.568
1.840	54.921
1.841	49.152
1.854	54.922
1.867	58.219
1.895	58.221
1.908	62.342
1.947	77.591
1.949	62.756
1.950	57.399
1.951	51.630
1.989	71.000
1.990	64.819
1.991	61.110
2.005	59.875
2.020	53.694
2.048	50.811
2.060	63.174
2.063	46.279
2.074	58.230
2.114	66.474
2.115	64.825
2.116	57.820
2.157	61.943
2.172	53.702
2.196	72.247
2.210	72.248
2.226	63.183
2.226	61.122
2.268	57.416
2.280	69.367
2.323	61.951
2.336	63.188
2.350	61.953
2.352	51.651
2.362	74.316
2.377	67.723
2.391	63.191
2.406	59.895
2.435	51.655
2.474	64.844
2.528	71.440
2.528	70.204
2.556	71.854
2.559	54.958
2.582	78.448
2.583	74.740
2.598	66.499
2.607	94.109
2.635	88.753
2.636	82.984
2.638	75.979
2.654	61.556
2.655	59.496
2.661	100.705
2.662	92.051
2.667	68.150
2.692	81.751
2.706	78.867
2.731	97.000
2.732	87.110
2.746	87.111
2.749	69.803
2.750	66.094
2.771	102.771
2.775	80.107
2.784	104.420
2.785	101.124
2.788	82.580
2.801	91.234
2.829	88.351
2.842	90.000
2.871	86.293
2.871	83.408
2.883	96.184
2.897	93.300
2.903	59.921
2.909	106.075
2.913	80.114
2.927	78.054
2.939	91.653
2.965	99.484
2.979	97.013
2.990	113.497
2.993	97.013
3.008	88.772
3.014	60.339
3.021	97.839
3.030	120.504
3.034	102.373
3.035	96.191
3.046	112.263
3.047	104.434
3.047	104.022
3.076	97.842
3.088	105.260
3.091	92.898
3.100	118.035
3.106	86.305
3.129	108.147
3.142	115.977
3.144	101.142
3.145	98.257
3.155	120.511
3.174	91.666
3.184	109.386
3.199	106.502
3.199	102.793
3.200	97.024
3.211	114.332
3.214	97.849
3.215	90.019
3.225	114.745
3.237	122.575
3.267	110.214
3.267	108.154
3.268	106.093
3.269	101.148
3.271	90.846
3.295	110.216
3.295	108.979
3.295	108.155
3.309	105.271
3.320	124.228
3.336	112.690
3.377	113.517
3.379	104.451
3.392	108.984
3.394	98.270
3.396	82.611
3.418	117.640
3.421	97.448
3.430	125.882
3.431	120.525
3.432	112.283
3.433	110.635
3.448	104.866
3.455	139.894
3.462	99.098
3.473	119.291
3.481	148.962
3.484	132.478
3.486	119.704
3.491	91.682
3.515	111.463
3.529	113.937
3.529	112.700
3.540	130.009
3.564	147.730
3.568	127.125
3.572	104.461
3.583	117.648
3.593	140.314
3.599	105.698
3.600	101.578
3.607	138.666
3.623	125.068
3.633	149.794
3.652	118.888
3.664	129.191
3.678	127.131
3.681	111.884
3.694	118.890
3.704	136.198
3.719	133.727
3.724	104.881
3.730	148.974
3.735	120.953
3.736	115.596
3.749	121.366
3.770	152.273
3.774	134.966
3.777	115.186
3.778	109.829
3.780	101.175
3.781	96.642
3.787	137.027
3.789	125.901
3.792	109.417
3.803	123.017
3.814	140.325
3.827	146.507
3.873	122.608
3.874	113.954
3.877	99.531
3.885	131.263
3.887	117.664
3.903	106.538
3.922	153.929
3.927	128.792
3.928	122.611
3.928	121.787
3.942	122.612
3.956	122.612
3.966	140.333
3.972	109.839
3.974	97.888
3.982	128.383
3.983	124.262
3.983	120.966
3.984	116.021
3.994	136.625
4.021	144.456
4.024	125.913
4.028	106.133
4.054	110.667
4.080	121.795
4.093	127.977
4.094	120.147
4.095	115.614
4.098	97.070
4.139	104.078
4.146	139.106
4.147	132.925
4.148	127.155
4.152	108.612
4.154	94.601
4.162	126.744
4.167	102.019
4.177	120.563
4.178	113.558
4.207	107.790
4.209	97.488
4.227	149.000
4.232	121.802
4.234	112.325
4.237	94.193
4.242	140.759
4.244	130.457
4.249	107.380
4.257	135.403
4.263	102.848
4.269	144.469
4.278	95.843
4.286	129.223
4.302	117.685
4.305	99.966
4.315	120.571
4.356	124.693
4.358	112.331
4.366	144.062
4.369	128.815
4.371	118.925
4.371	116.040
4.382	132.525
4.398	122.635
4.401	104.504
4.410	129.229
4.419	84.312
4.428	107.390
4.431	90.494
4.434	149.011
4.436	137.060
4.437	132.939
4.444	97.500
4.455	113.572
4.478	137.062
4.480	125.524
4.495	118.931
4.505	141.185
4.511	106.158
4.517	151.900
4.518	145.306
4.521	130.471
4.526	101.213
4.534	131.296
4.534	130.884
4.538	112.340
4.541	96.681
4.563	122.644
4.596	93.799
4.602	141.190
4.604	125.530
4.606	117.701
4.614	146.960
4.618	125.943
4.619	120.998
4.622	106.163
4.631	128.829
4.643	139.131
4.644	136.247
4.648	113.994
4.648	111.934
4.659	130.478
4.663	104.929
4.666	91.742
4.678	99.161
4.686	131.716
4.704	111.937
4.744	115.648
4.752	147.379
4.753	144.082
4.757	124.302
4.758	118.945
4.773	109.880
4.782	138.726
4.782	135.018
4.811	127.602
4.812	121.420
4.824	132.959
4.826	124.306
4.836	142.850
4.852	130.900
4.853	124.307
4.854	118.538
4.855	114.417
4.857	105.351
4.863	70.736
4.880	132.138
4.880	130.902
4.892	138.320
4.893	131.315
4.922	127.607
4.924	116.069
4.926	105.355
4.941	99.586
4.945	149.449
4.951	121.840
4.973	147.802
4.976	135.852
4.976	133.379
4.976	130.907
4.977	129.671
4.989	136.265
5.034	117.723
5.047	125.141
5.086	134.209
5.087	132.973
5.092	106.187
5.101	130.089
5.103	119.787
5.113	137.507
5.115	129.266
5.132	114.019
5.139	146.987
5.143	124.322
5.148	101.657
5.173	116.082
5.173	111.549
5.175	102.895
5.180	149.049
5.183	135.862
5.189	102.896
5.211	132.979
5.248	155.234
5.251	142.459
5.253	128.036
5.265	140.812
5.266	132.158
5.271	105.373
5.278	144.933
5.283	117.324
5.287	97.956
5.290	151.939
5.307	135.045
5.327	102.491
5.351	123.096
5.397	100.434
5.407	119.390
5.409	109.088
5.417	141.232
5.430	146.589
5.486	138.763
5.489	124.340
5.491	110.329
5.493	104.148
5.501	134.643
5.515	131.347
5.515	130.935
5.569	140.827
5.578	165.553
5.580	153.191
5.598	134.648
5.603	106.214
5.643	115.282
5.655	120.227
5.678	149.899
5.681	134.240
5.705	75.312
5.736	131.770
5.761	145.370
5.765	124.766
5.773	155.673
5.791	135.482
5.815	152.379
5.819	131.774
5.832	137.132
5.861	132.189
5.885	147.025
5.900	140.432
5.952	158.567
5.957	133.018
5.995	150.739
5.997	142.086
6.009	149.092
6.026	132.609
6.039	137.143
6.106	151.157
6.109	133.438
6.136	137.972
6.156	102.946
6.164	132.616
6.258	148.281
6.258	147.456
6.262	127.676
6.280	102.540
6.344	130.977
6.357	136.335
6.382	149.935
6.387	121.914
6.413	133.041
6.433	100.487
6.437	151.174
6.442	128.098
6.470	123.566
6.522	143.761
6.527	114.091
6.536	140.877
6.576	149.945
6.576	149.533
6.577	145.412
6.591	140.880
6.617	149.123
6.658	152.422
6.673	146.654
6.686	154.072
6.728	148.717
6.783	148.720
6.950	145.844
7.021	134.309
7.081	109.587
7.147	122.777
7.156	148.739
7.237	158.633
7.239	150.804
7.242	133.496
7.432	152.462
7.514	154.527
7.629	132.692
7.639	154.121
7.648	106.319
7.667	149.177
7.804	155.778
7.902	151.662
7.997	157.436
8.088	116.644
8.164	152.087
8.591	160.351];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EvesMilli2015';
comment.tL = 'Otolith and capture-recapture measurements combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'birth is assumed to occur at hatch';
D2 = 'specific density of reserve and structure is taken 0.3 g/cm^3';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Measured from photo: FL = 0.933 * TL';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56P6S'; % Cat of Life
metaData.links.id_ITIS = '172426'; % ITIS
metaData.links.id_EoL = '46577334'; % Ency of Life
metaData.links.id_Wiki = 'Thunnus_albacares'; % Wikipedia
metaData.links.id_ADW = 'Thunnus_albacares'; % ADW
metaData.links.id_Taxo = '189034'; % Taxonomicon
metaData.links.id_WoRMS = '127027'; % WoRMS
metaData.links.id_fishbase = 'Thunnus-albacares'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thunnus_albacares}}';
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
bibkey = 'EvesMilli2015'; type = 'Article'; bib = [ ... 
'author = {J. P. Eveson and J. Million and F. Sardenne and G. Le Croizier}, ' ... 
'year = {2015}, ' ...
'title = {Estimating growth of tropical tunas in the {I}ndian {O}cean usingtag-recapture data and otolith-based age estimates}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {163}, ' ...
'pages = {58-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Thunnus-albacares.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

