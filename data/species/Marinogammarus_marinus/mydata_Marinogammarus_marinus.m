function [data, auxData, metaData, txtData, weights] = mydata_Marinogammarus_marinus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Gammaridae';
metaData.species    = 'Marinogammarus_marinus'; 
metaData.species_en = 'Gammarid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMi', '0iMc'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab_T'; 'ap_T'; 'am_T'; 'Li'; 'Wwp'; 'Wwi'; 'Ni_T'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 10 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 10];

%% set data
% zero-variate data 
data.ab10 = 33;  units.ab10 = 'd';    label.ab10 = 'age at birth';             bibkey.ab10 = 'MaraMarg2003';   
  temp.ab10 = C2K(10);  units.temp.ab10 = 'K'; label.temp.ab10 = 'temperature';
data.ab15 = 32;  units.ab15 = 'd';    label.ab15 = 'age at birth';             bibkey.ab15 = 'MaraMarg2003';   
  temp.ab15 = C2K(15);  units.temp.ab15 = 'K'; label.temp.ab15 = 'temperature';
data.ab20 = 17;  units.ab20 = 'd';    label.ab20 = 'age at birth';             bibkey.ab20 = 'MaraMarg2003';   
  temp.ab20 = C2K(20);  units.temp.ab20 = 'K'; label.temp.ab20 = 'temperature';
data.tp10 = 80;   units.tp10 = 'd';    label.tp10 = 'time since birth at puberty'; bibkey.tp10 = 'MaraMarg2003';
  temp.tp10 = C2K(10);  units.temp.tp10 = 'K'; label.temp.tp10 = 'temperature';
  comment.tp10 = '76-83 d (sexual differentiation)';
data.tp15 = 58;   units.tp15 = 'd';    label.tp15 = 'time since birth at puberty'; bibkey.tp15 = 'MaraMarg2003';
  temp.tp15 = C2K(15);  units.temp.tp15 = 'K'; label.temp.tp15 = 'temperature';
  comment.tp15 = '56-61 d (sexual differentiation)';
data.tp20 = 45.5;   units.tp20 = 'd';    label.tp20 = 'time since birth at puberty'; bibkey.tp20 = 'MaraMarg2003';
  temp.tp20 = C2K(20);  units.temp.tp20 = 'K'; label.temp.tp20 = 'temperature';
  comment.tp20 = '45-46 d (sexual differentiation)';
data.am10 = 410;   units.am10 = 'd';    label.am10 = 'life span';                bibkey.am10 = 'MaraMarg2003';   
  temp.am10 = C2K(10);  units.temp.am10 = 'K'; label.temp.am10 = 'temperature'; 
 comment.am10 = '380-440 d';
data.am20 = 210;   units.am20 = 'd';    label.am20 = 'life span';                bibkey.am20 = 'MaraMarg2003';   
  temp.am20 = C2K(10);  units.temp.am20 = 'K'; label.temp.am20 = 'temperature'; 
 comment.am20 = '190-230 d';

data.Li  = 2.247;units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MaraMarg2003';
 comment.Li = 'largerst females found under field conditions (2.22 mm head length)'; 
 data.Lim  = 2.5; units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Gule2012';

data.Wwb = 1.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MaraBeng2001';
  comment.Wwb = 'based on egg volume of 1.1 mm^3';
data.Wwi = 0.384;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Gammarus_roeselii Wwi and Li: 59.1 * (2.247/1.204)^3 in mg';
  
data.Ni10  = 90;units.Ni10  = '#/d'; label.Ni10  = 'total # of eggs';     bibkey.Ni10  = 'MaraMarg2003';   
  temp.Ni10 = C2K(10);  units.temp.Ni10 = 'K'; label.temp.Ni10 = 'temperature';
  comment.Ni = '4 broods per life span, mean([15 24 33 18])';  
data.Ni15  = 75;units.Ni15  = '#/d'; label.Ni15  = 'total # of eggs';     bibkey.Ni15  = 'MaraMarg2003';   
  temp.Ni15 = C2K(15);  units.temp.Ni15 = 'K'; label.temp.Ni15 = 'temperature';
  comment.Ni15 = '4 broods per life span, mean([20 16 22 17])';  
data.Ni20  = 41;units.Ni20  = '#/d'; label.Ni20  = 'total # of eggs';     bibkey.Ni20  = 'MaraMarg2003';   
  temp.Ni20 = C2K(20);  units.temp.Ni20 = 'K'; label.temp.Ni20 = 'temperature';
  comment.Ni20 = '4 broods per life span, mean([11 7 10 13])';  

% uni-variate data

% time-length
data.tL_S10T10 = [ ... % time since birth (d), head length (mm)
0.551	0.415
5.712	0.508
9.708	0.485
15.823	0.539
22.935	0.586
32.039	0.617
37.030	0.585
46.208	0.671
58.322	0.694
68.433	0.725
81.776	0.911
87.669	0.802
97.832	0.872
112.045	0.957
117.980	0.879
129.235	1.011
142.387	1.057
150.622	1.189
158.666	1.182
167.728	1.181
179.004	1.329
192.029	1.282
199.077	1.282
209.273	1.375
221.429	1.429
231.296	1.281
244.734	1.537
250.712	1.491
261.957	1.615
273.021	1.607
283.015	1.552
293.158	1.606
302.251	1.629
311.535	1.793
323.373	1.613
333.601	1.730
345.736	1.768
352.911	1.862
358.899	1.823
371.913	1.768
385.023	1.783
392.877	1.635];
units.tL_S10T10   = {'d', 'mm'};  label.tL_S10T10 = {'time since birth', 'head length'};  
temp.tL_S10T10    = C2K(10);  units.temp.tL_S10T10 = 'K'; label.temp.tL_S10T10 = 'temperature';
bibkey.tL_S10T10 = 'MaraMarg2003';
comment.tL_S10T10 = 'Salinity 10 promille';
%
data.tL_S10T15 = [ ... % time since birth (d), head length (mm)
2.000	0.408
5.000	0.525
14.000	0.557
19.000	0.596
26.000	0.666
32.000	0.682
41.000	0.729
46.000	0.846
61.000	0.862
71.000	0.932
79.000	1.003
87.000	0.963
93.000	1.041
100.000	1.002
110.000	1.151
116.000	1.229
130.000	1.198
138.000	1.260
147.000	1.307
159.000	1.464
171.000	1.471
180.000	1.369
190.000	1.385
201.000	1.432
212.000	1.486
221.000	1.580];
units.tL_S10T15   = {'d', 'mm'};  label.tL_S10T15 = {'time since birth', 'head length'};  
temp.tL_S10T15    = C2K(15);  units.temp.tL_S10T15 = 'K'; label.temp.tL_S10T15 = 'temperature';
bibkey.tL_S10T15 = 'MaraMarg2003';
comment.tL_S10T15 = 'Salinity 10 promille';
%
data.tL_S10T20 = [ ... % time since birth (d), head length (mm)
1.781	0.341
4.697	0.364
9.514	0.488
14.351	0.574
20.182	0.620
25.997	0.698
29.873	0.752
39.584	0.845
49.257	1.016
57.058	1.023
70.664	1.132
79.414	1.194
90.097	1.295
100.862	1.225
108.576	1.411
117.376	1.372
133.008	1.326
138.820	1.411
144.697	1.364
146.595	1.473
162.190	1.504
172.899	1.550
180.734	1.488
188.452	1.667
200.163	1.659
209.942	1.612
217.720	1.667
228.433	1.705];
units.tL_S10T20   = {'d', 'mm'};  label.tL_S10T20 = {'time since birth', 'head length'};  
temp.tL_S10T20    = C2K(20);  units.temp.tL_S10T20 = 'K'; label.temp.tL_S10T20 = 'temperature';
bibkey.tL_S10T20 = 'MaraMarg2003';
comment.tL_S10T20 = 'Salinity 10 promille';
%
data.tL_S15T10 = [ ... % time since birth (d), head length (mm)
2.184	0.381
8.191	0.478
14.171	0.518
18.160	0.551
24.131	0.575
27.127	0.607
32.065	0.551
37.031	0.551
50.976	0.632
61.938	0.704
71.870	0.704
80.833	0.753
90.770	0.761
103.706	0.810
111.676	0.858
123.675	1.020
131.536	0.850
138.626	1.126
150.508	1.053
163.493	1.198
169.392	1.077
181.367	1.190
190.378	1.336
202.321	1.385
209.237	1.312
220.219	1.425
231.141	1.417
239.127	1.498
251.025	1.457
259.993	1.514
269.961	1.587
280.891	1.595
290.803	1.555
296.806	1.644
308.717	1.628
321.661	1.692
333.596	1.725
341.502	1.644
350.485	1.733
358.382	1.636
368.323	1.652
380.274	1.717
392.241	1.814
400.158	1.757
412.085	1.773
419.975	1.660
428.934	1.700
440.905	1.806];
units.tL_S15T10   = {'d', 'mm'};  label.tL_S15T10 = {'time since birth', 'head length'};  
temp.tL_S15T10    = C2K(10);  units.temp.tL_S15T10 = 'K'; label.temp.tL_S15T10 = 'temperature';
bibkey.tL_S15T10 = 'MaraMarg2003';
comment.tL_S15T10 = 'Salinity 15 promille';
%
data.tL_S15T15 = [ ... % time since birth (d), head length (mm)
5.197	0.395
13.202	0.442
14.246	0.534
25.214	0.519
27.248	0.596
32.287	0.697
43.281	0.735
54.352	0.928
63.316	0.897
73.297	0.904
79.322	0.982
88.325	1.028
104.273	0.996
108.298	1.066
119.308	1.135
130.337	1.244
139.290	1.189
151.266	1.196
159.267	1.235
172.276	1.312
183.309	1.428
189.314	1.466
197.277	1.427
212.231	1.403
219.242	1.457
230.248	1.519
243.218	1.519];
units.tL_S15T15   = {'d', 'mm'};  label.tL_S15T15 = {'time since birth', 'head length'};  
temp.tL_S15T15    = C2K(15);  units.temp.tL_S15T15 = 'K'; label.temp.tL_S15T15 = 'temperature';
bibkey.tL_S15T15 = 'MaraMarg2003';
comment.tL_S15T15 = 'Salinity 15 promille';
%
data.tL_S15T20 = [ ... % time since birth (d), head length (mm)
0.794	0.391
4.731	0.444
10.650	0.498
14.558	0.613
21.483	0.635
24.433	0.681
30.342	0.758
40.206	0.849
55.029	0.933
59.946	1.009
67.825	1.109
80.689	1.147
87.554	1.292
99.458	1.269
109.326	1.353
121.192	1.406
128.148	1.367
141.019	1.390
149.889	1.489
160.832	1.404
168.722	1.481
179.631	1.465
191.477	1.557
199.439	1.487
210.234	1.702
221.116	1.739];
units.tL_S15T20   = {'d', 'mm'};  label.tL_S15T20 = {'time since birth', 'head length'};  
temp.tL_S15T20    = C2K(20);  units.temp.tL_S15T20 = 'K'; label.temp.tL_S15T20 = 'temperature';
bibkey.tL_S15T20 = 'MaraMarg2003';
comment.tL_S15T20 = 'Salinity 15 promille';
%
data.tL_S20T10 = [ ... % time since birth (d), head length (mm)
3.405	0.405
6.468	0.468
10.500	0.500
16.500	0.500
20.563	0.563
25.571	0.571
31.524	0.524
40.563	0.563
51.683	0.683
60.651	0.651
71.706	0.706
79.754	0.754
89.802	0.802
98.754	0.754
105.881	0.881
119.897	0.897
129.802	0.802
140.937	0.937
149.127	1.127
159.175	1.175
160.071	1.071
172.103	1.103
181.159	1.159
191.294	1.294
199.381	1.381
212.278	1.278
219.317	1.317
232.254	1.254
241.310	1.310
252.246	1.246
258.381	1.381
272.333	1.333
278.246	1.246
288.310	1.310
298.341	1.341
309.302	1.302
318.429	1.429
328.254	1.254
340.421	1.421
346.556	1.556
357.468	1.468
371.389	1.389
381.484	1.484];
units.tL_S20T10   = {'d', 'mm'};  label.tL_S20T10 = {'time since birth', 'head length'};  
temp.tL_S20T10    = C2K(10);  units.temp.tL_S20T10 = 'K'; label.temp.tL_S20T10 = 'temperature';
bibkey.tL_S20T10 = 'MaraMarg2003';
comment.tL_S20T10 = 'Salinity 20 promille';
%
data.tL_S20T15 = [ ... % time since birth (d), head length (mm)
2.455	0.359
3.325	0.445
8.243	0.492
14.160	0.539
17.188	0.515
25.076	0.578
30.934	0.663
39.680	0.820
49.588	0.866
57.453	0.944
60.563	0.866
70.377	0.975
81.434	0.920
88.313	0.991
101.167	1.068
108.268	0.990
119.139	1.060
129.833	1.248
138.907	1.185
149.777	1.255
157.607	1.357
167.725	1.263
178.513	1.387
186.226	1.567
197.318	1.489
206.240	1.528
219.257	1.496
227.286	1.465
236.032	1.621
248.157	1.519
259.051	1.574
268.970	1.612];
units.tL_S20T15   = {'d', 'mm'};  label.tL_S20T15 = {'time since birth', 'head length'};  
temp.tL_S20T15    = C2K(15);  units.temp.tL_S20T15 = 'K'; label.temp.tL_S20T15 = 'temperature';
bibkey.tL_S20T15 = 'MaraMarg2003';
comment.tL_S20T15 = 'Salinity 20 promille';
%
data.tL_S20T20 = [ ... % time since birth (d), head length (mm)
2.220	0.443
6.191	0.403
9.236	0.505
13.266	0.584
19.272	0.624
25.294	0.694
29.312	0.749
41.340	0.859
50.355	0.930
58.372	1.001
69.406	1.119
78.401	1.150
91.434	1.276
100.413	1.275
107.441	1.362
119.433	1.401
128.416	1.408
138.377	1.376
151.411	1.502
162.346	1.422
169.362	1.485
182.348	1.516
192.356	1.579
201.300	1.507
211.387	1.728
221.384	1.767];
units.tL_S20T20   = {'d', 'mm'};  label.tL_S20T20 = {'time since birth', 'head length'};  
temp.tL_S20T20    = C2K(20);  units.temp.tL_S20T20 = 'K'; label.temp.tL_S20T20 = 'temperature';
bibkey.tL_S20T20 = 'MaraMarg2003';
comment.tL_S12T20 = 'Salinity 20 promille';
%
data.tL_S25T10 = [ ... % time since birth (d), head length (mm)
1.406	0.390
5.395	0.333
5.526	0.463
12.615	0.472
17.746	0.545
25.863	0.569
30.978	0.626
38.001	0.569
50.180	0.610
58.362	0.699
72.540	0.715
82.679	0.740
90.821	0.789
98.978	0.854
115.228	0.919
122.284	0.894
129.537	1.065
139.603	1.016
149.849	1.146
161.987	1.146
166.107	1.220
178.401	1.374
188.376	1.236
200.597	1.317
210.761	1.366
219.749	1.252
229.971	1.358
238.022	1.317
252.281	1.415
260.341	1.382
271.525	1.439
282.741	1.528];
units.tL_S25T10   = {'d', 'mm'};  label.tL_S25T10 = {'time since birth', 'head length'};  
temp.tL_S25T10    = C2K(10);  units.temp.tL_S25T10 = 'K'; label.temp.tL_S25T10 = 'temperature';
bibkey.tL_S25T10 = 'MaraMarg2003';
comment.tL_S25T10 = 'Salinity 25 promille';
%
data.tL_S25T15 = [ ... % time since birth (d), head length (mm)
6.230	0.383
8.271	0.438
14.356	0.524
19.374	0.492
21.400	0.516
27.528	0.688
29.510	0.625
41.648	0.735
54.729	0.720
59.822	0.837
71.921	0.868
84.027	0.916
88.082	0.970
101.183	0.994
111.370	1.229
119.440	1.260
132.573	1.346
143.598	1.245
153.686	1.284
160.699	1.214
171.802	1.269
179.849	1.253
189.013	1.456
203.074	1.386
212.191	1.496
222.193	1.363
234.397	1.606
242.369	1.442
253.461	1.473
263.549	1.512
272.643	1.575
280.764	1.708
292.835	1.685
301.889	1.669
311.918	1.591
320.044	1.732
331.159	1.811
342.184	1.709
353.279	1.748
360.355	1.803
371.375	1.694
381.456	1.718
392.598	1.851
403.646	1.796];
units.tL_S25T15   = {'d', 'mm'};  label.tL_S25T15 = {'time since birth', 'head length'};  
temp.tL_S25T15    = C2K(15);  units.temp.tL_S25T15 = 'K'; label.temp.tL_S25T15 = 'temperature';
bibkey.tL_S25T15 = 'MaraMarg2003';
comment.tL_S25T15 = 'Salinity 25 promille';
%
data.tL_S25T20 = [ ... % time since birth (d), head length (mm)
1.009	0.316
3.028	0.387
6.055	0.442
13.119	0.576
22.202	0.647
22.203	0.473
31.284	0.654
40.367	0.772
50.459	0.883
59.541	1.009
68.624	1.119
79.725	0.960
89.817	1.062
100.917	1.070
107.982	1.164
118.073	1.258
129.174	1.368
136.239	1.431
152.385	1.407
160.459	1.501
173.578	1.548
179.633	1.492
190.734	1.523];
units.tL_S25T20   = {'d', 'mm'};  label.tL_S25T20 = {'time since birth', 'head length'};  
temp.tL_S25T20    = C2K(20);  units.temp.tL_S25T20 = 'K'; label.temp.tL_S25T20 = 'temperature';
bibkey.tL_S25T20 = 'MaraMarg2003';
comment.tL_S25T20 = 'Salinity 25 promille';

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

%% Group plots
set1 = {'tL_S10T20','tL_S10T15','tL_S10T10'}; subtitle1 = {'Data for 20, 15 and 10 C, salinity 10 promille'};
set2 = {'tL_S15T20','tL_S15T15','tL_S15T10'}; subtitle2 = {'Data for 20, 15 and 10 C, salinity 15 promille'};
set3 = {'tL_S20T20','tL_S20T15','tL_S20T10'}; subtitle3 = {'Data for 20, 15 and 10 C, salinity 20 promille'};
set4 = {'tL_S25T20','tL_S25T15','tL_S25T10'}; subtitle4 = {'Data for 20, 15 and 10 C, salinity 25 promille'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'B7B3K'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46527076'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Chaetogammarus_marinus'; % ADW
metaData.links.id_Taxo = '661624'; % Taxonomicon
metaData.links.id_WoRMS = '102303'; % WoRMS

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
bibkey = 'MaraBeng2001'; type = 'Article'; bib = [ ... 
'doi = {10.1016/s1146-609x(02)00003-6}, ' ... 
'author = {Paulo Maranh\~{a}o and Nuno Bengala and Miguel Pardal and Jo\~{a}o Carlos Marques}, ' ... 
'year = {2001}, ' ...
'title = {The influence of environmental factors on the population dynamics, reproductive biology and productivity of \emph{Echinogammarus marinus} {L}each ({A}mphipoda, {G}ammaridae) in the {M}ondego estuary ({P}ortugal)}, ' ...
'journal = {Acta Oecologica}, ' ...
'volume = {22}, ' ...
'pages = {139−152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaraMarg2003'; type = 'Article'; bib = [ ... 
'doi = {10.1016/s1146-609x(02)00003-6}, ' ... 
'author = {Paulo Maranh\~{a}o and Jo\~{a}o Carlos Marques}, ' ... 
'year = {2003}, ' ...
'title = {The influence of temperature and salinity on the duration of embryonic development, fecundity and growth of the amphipod \emph{Echinogammarus marinus} {L}each (Gammaridae)}, ' ...
'journal = {Acta Oecologica}, ' ...
'volume = {24(1)}, ' ...
'pages = {5–13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gule2012'; type = 'Phdthesis'; bib = [ ... 
'author = {Yasmin Zara Guler}, ' ... 
'year = {2012}, ' ...
'title = {Population dynamics and sex-determining mechanisms in the marine amphipod, \emph{Echinogammarus marinus}}, ' ...
'school = {University of Portsmouth}, ' ...
'howpublished = {\ulr{https://core.ac.uk/download/pdf/77050169.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
