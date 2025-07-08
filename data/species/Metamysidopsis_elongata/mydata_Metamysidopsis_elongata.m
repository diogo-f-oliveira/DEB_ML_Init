  function [data, auxData, metaData, txtData, weights] = mydata_Metamysidopsis_elongata
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Metamysidopsis_elongata'; 
metaData.species_en = 'Opossum shrimp'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lb'; 'Lp'; 'Li'};  
metaData.data_1     = {'t-L'; 'L-Wd'; 'L-N'};                          

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 13]; 

%% set data
% zero-variate data
data.ab = 10;        units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'ClutThei1971';
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 47;        units.tp = 'd';  label.tp = 'time since birth at puberty';          bibkey.tp = 'ClutThei1971';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 213;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'ClutThei1971'; 
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';  

data.Lb = 0.124;     units.Lb = 'cm';  label.Lb = 'length at birth';  bibkey.Lb = 'ClutThei1971';  
data.Lp = 0.40;     units.Lp = 'cm';  label.Lp = 'length at puberty';  bibkey.Lp = 'ClutThei1971';
data.Lpm = 0.43;     units.Lpm = 'cm';  label.Lpm = 'length at puberty for males';  bibkey.Lpm = 'ClutThei1971';
data.Li = 0.720;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'ClutThei1971'; 

% uni-variate data
% time-length
data.tL_f = [... % time since fertilisation (d), length (mm)
10.929	0.124
10.942	0.132
10.952	0.138
18.501	0.143
19.358	0.180
20.988	0.205
22.512	0.168
24.579	0.217
25.068	0.271
28.858	0.166
28.983	0.240
29.079	0.297
30.888	0.194
32.131	0.225
33.365	0.250
36.936	0.250
42.319	0.382
46.301	0.389
47.177	0.438
52.735	0.440
52.775	0.463
57.239	0.521
57.520	0.453
60.387	0.506
61.168	0.498
61.634	0.539
62.256	0.438
62.345	0.490
69.537	0.519
69.987	0.550
70.013	0.566
72.377	0.556
73.631	0.593
75.578	0.571
77.136	0.554
78.776	0.585
81.527	0.569
83.498	0.561
83.954	0.596
88.706	0.590
89.549	0.620
90.273	0.579
92.684	0.596
96.682	0.614
101.407	0.592
102.657	0.627
104.691	0.656
105.044	0.631
111.006	0.636
111.817	0.646
116.535	0.621
118.136	0.628
118.933	0.630
118.995	0.667
121.416	0.691
122.963	0.667
126.895	0.646
130.093	0.659
130.933	0.686
132.047	0.642
136.078	0.678
138.439	0.667
141.236	0.678
141.309	0.721
148.048	0.717
148.822	0.705
153.137	0.676
153.957	0.692
155.220	0.734
156.007	0.730
160.650	0.660
163.758	0.621
163.947	0.732
170.603	0.679
170.646	0.705
173.731	0.652
180.930	0.685
184.058	0.658
184.964	0.724
195.212	0.683
195.285	0.725
200.010	0.704
202.037	0.729
206.746	0.698
213.134	0.721];
data.tL_f(:,1) = data.tL_f(:,1) - data.tL_f(1,1); % set origin at birth 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'females'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ClutThei1971';
comment.tL_f = 'Data for females';
% 
data.tL_m = [... %  since fertilisation (d), length (mm)
11.139	0.148
12.189	0.134
12.550	0.141
20.748	0.182
27.939	0.279
28.287	0.272
31.482	0.276
36.520	0.349
38.286	0.342
39.745	0.382
41.056	0.276
48.663	0.434
50.427	0.425
52.865	0.382
55.056	0.444
56.133	0.456
56.456	0.425
58.682	0.522
60.030	0.453
62.482	0.423
64.675	0.488
68.937	0.494
68.997	0.553
71.063	0.493
75.327	0.501
75.652	0.472
75.729	0.548
84.951	0.550
86.747	0.572
96.677	0.574
98.119	0.597
98.438	0.562
104.442	0.538
108.027	0.576
109.120	0.605
126.161	0.624
127.916	0.607
132.884	0.610
133.962	0.624
143.879	0.612
152.400	0.622
170.132	0.624];
data.tL_m(:,1) = data.tL_m(:,1) - data.tL_m(1,1); % set origin at birth 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'males'};  
temp.tL_m   = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ClutThei1971';
comment.tL_m = 'Data for males';

% length-weight
data.LWd = [ ... % length (cm), dry weight (mg)
0.190	0.023
0.236	0.065
0.236	0.061
0.238	0.056
0.252	0.068
0.256	0.060
0.265	0.043
0.297	0.133
0.309	0.074
0.311	0.087
0.359	0.197
0.383	0.121
0.412	0.223
0.440	0.147
0.445	0.285
0.456	0.341
0.465	0.391
0.472	0.367
0.480	0.354
0.495	0.286
0.503	0.508
0.504	0.468
0.506	0.395
0.510	0.556
0.518	0.527
0.518	0.406
0.519	0.490
0.526	0.428
0.527	0.448
0.528	0.546
0.533	0.425
0.543	0.499
0.545	0.406
0.560	0.691
0.560	0.562
0.565	0.620
0.565	0.457
0.568	0.542
0.588	0.791
0.605	0.466
0.623	0.621
0.634	0.717];
units.LWd  = {'cm', 'mg'};  label.LWd = {'length', 'dry weight'};  
bibkey.LWd = 'ClutThei1971';

% length-fecundity
data.LN = [ ... % length (cm), fecundity (#)
0.415	8.990
0.416	13.018
0.449	9.983
0.450	6.059
0.451	12.875
0.464	7.044
0.464	7.870
0.465	9.317
0.465	8.181
0.467	6.736
0.479	11.387
0.479	7.928
0.479	9.012
0.480	11.026
0.480	12.936
0.480	8.547
0.481	7.050
0.481	12.679
0.481	13.711
0.482	5.863
0.482	10.820
0.482	8.445
0.483	11.698
0.484	7.929
0.484	13.196
0.484	9.168
0.485	6.070
0.486	12.732
0.487	11.338
0.493	10.256
0.495	10.979
0.495	15.936
0.496	12.322
0.496	14.078
0.496	9.327
0.496	9.895
0.496	9.999
0.496	11.341
0.496	6.901
0.496	8.192
0.497	7.159
0.497	10.980
0.497	11.909
0.497	5.145
0.498	12.942
0.498	16.918
0.498	14.233
0.498	16.041
0.499	7.728
0.499	8.141
0.499	11.445
0.499	7.315
0.499	12.272
0.499	4.836
0.499	10.155
0.500	8.864
0.500	10.568
0.500	11.033
0.511	8.042
0.513	9.075
0.513	11.915
0.513	10.418
0.513	12.896
0.513	13.774
0.514	15.220
0.514	7.062
0.514	8.094
0.514	8.817
0.515	9.799
0.515	11.554
0.515	14.343
0.516	8.611
0.516	9.282
0.516	12.587
0.516	13.000
0.516	15.995
0.516	13.878
0.516	15.014
0.517	6.804
0.517	10.471
0.517	9.077
0.518	10.161
0.518	12.175
0.519	9.955
0.520	10.472
0.527	13.521
0.528	14.966
0.529	14.657
0.529	15.432
0.530	14.193
0.530	9.907
0.530	11.198
0.530	13.263
0.530	14.038
0.530	10.320
0.530	12.231
0.530	12.850
0.531	7.997
0.531	16.155
0.531	14.245
0.531	15.794
0.532	9.081
0.532	10.837
0.532	11.612
0.532	13.212
0.532	15.175
0.533	10.321
0.533	14.865
0.533	6.707
0.533	10.115
0.533	11.819
0.533	12.077
0.533	13.987
0.534	11.251
0.534	16.105
0.544	11.254
0.545	10.945
0.545	16.109
0.546	8.105
0.546	10.532
0.546	12.236
0.546	9.448
0.546	13.527
0.546	15.076
0.547	8.983
0.547	11.565
0.547	13.889
0.547	14.198
0.547	14.560
0.547	15.748
0.547	17.090
0.547	7.538
0.547	10.223
0.547	12.030
0.547	12.908
0.547	13.269
0.547	6.970
0.548	14.560
0.548	14.819
0.548	15.335
0.548	17.349
0.548	18.072
0.548	11.049
0.548	13.579
0.549	9.036
0.549	10.068
0.549	16.884
0.549	12.031
0.549	14.561
0.549	15.180
0.549	8.107
0.550	10.688
0.550	13.167
0.550	15.955
0.550	9.449
0.550	14.200
0.550	16.317
0.550	10.327
0.550	15.439
0.551	11.825
0.551	17.453
0.553	14.923
0.553	11.154
0.561	7.956
0.561	17.250
0.562	15.288
0.562	16.011
0.562	7.388
0.562	11.416
0.562	11.725
0.562	12.603
0.563	15.650
0.563	7.905
0.563	10.900
0.563	12.294
0.563	9.196
0.564	13.998
0.564	11.468
0.564	16.786
0.564	17.767
0.564	19.988
0.564	9.919
0.564	14.411
0.565	21.847
0.565	6.253
0.565	12.398
0.565	15.651
0.565	18.904
0.565	16.064
0.565	17.251
0.566	6.976
0.566	11.830
0.566	12.656
0.566	14.308
0.566	20.608
0.566	15.186
0.566	10.901
0.567	13.999
0.567	11.417
0.569	12.399
0.569	12.864
0.579	12.196
0.579	16.275
0.580	8.943
0.580	16.017
0.581	22.885
0.581	13.229
0.581	18.031
0.583	15.863
0.583	14.263
0.583	12.249
0.584	16.225
0.595	12.253
0.596	17.830
0.596	13.183
0.596	18.346
0.597	10.188
0.597	15.248
0.597	11.014
0.598	20.206
0.598	18.244
0.598	12.357
0.598	22.168
0.599	17.005
0.600	13.443
0.610	17.164
0.610	18.971
0.612	20.159
0.612	18.145
0.613	9.264
0.613	16.855
0.613	26.407
0.613	11.278
0.613	12.363
0.613	24.032
0.614	8.335
0.614	15.151
0.615	19.127
0.615	14.274
0.615	17.217
0.615	9.214
0.616	18.147
0.616	20.161
0.626	17.995
0.627	16.601
0.628	9.270
0.628	12.419
0.628	20.061
0.629	17.273
0.629	4.106
0.629	7.153
0.629	10.251
0.629	13.194
0.629	14.227
0.630	19.029
0.631	11.904
0.631	27.033
0.631	16.913
0.631	12.885
0.631	14.176
0.632	17.997
0.632	17.171
0.633	12.473
0.634	13.402
0.644	21.099
0.645	16.298
0.645	15.059
0.647	29.827
0.648	14.285
0.662	23.687
0.662	27.044
0.663	8.249
0.664	24.256
0.679	12.282
0.697	28.863];    
units.LN  = {'d', 'cm'};  label.LN = {'length', 'fecundity'};  
temp.LN   = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ClutThei1971';

%% grouped plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1}; metaData.grp.subtitle = {subtitle1};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'Accumulation period in LN data is assumed to equal ab';   
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '42BCH'; % Cat of Life
metaData.links.id_ITIS = '90704'; % ITIS
metaData.links.id_EoL = '1021513'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Metamysidopsis_elongata'; % ADW
metaData.links.id_Taxo = '463689'; % Taxonomicon
metaData.links.id_WoRMS = '226436'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ClutThei1971'; type = 'Article'; bib = [ ...  
'author = {Robert I. Clutter and Gail H. Theilacke}, ' ...
'year = {1971}, ' ...
'title = {ECOLOGICAL EFFICIENCY OF A PELAGIC MYSID SHRIMP; ESTIMATES FROM GROWTH, ENERGY BUDGET, AND MORTALITY STUDIES}, ' ... 
'journal = {Fishery Bulletin}, ' ...
'volume = {69(1)}, '...
'pages = {135-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
