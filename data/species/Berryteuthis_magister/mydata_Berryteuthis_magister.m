function [data, auxData, metaData, txtData, weights] = mydata_Berryteuthis_magister

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Gonatidae';
metaData.species    = 'Berryteuthis_magister'; 
metaData.species_en = 'Magister armhook squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb';  'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 500;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'ArkhBizi1996';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.32;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';  bibkey.Lb  = 'KatuShev2013';
data.Lp  = 22;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'ArkhBizi1996';
data.Lpm  = 15;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male';  bibkey.Lpm  = 'ArkhBizi1996';
data.Li  = 28; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'ArkhBizi1996';
data.Lim = 26; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'ArkhBizi1996';

data.Ni  = 95e3; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'KatuShev2013';   
  temp.Ni = C2K(14); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'value for Illex_coindetii';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
42.098	1.919
67.341	3.838
68.581	2.657
74.601	2.804
87.850	2.952
93.838	4.133
97.457	3.985
103.472	4.280
108.283	4.576
114.293	5.018
117.890	5.609
122.687	6.347
125.114	5.756
125.132	5.166
131.134	5.904
132.277	7.970
134.722	6.790
137.180	5.166
139.537	6.937
139.563	6.052
143.049	10.332
145.543	7.528
145.570	6.642
146.730	8.118
146.770	6.790
150.402	6.199
152.759	7.970
156.409	6.790
157.485	11.070
162.442	6.494
164.829	7.232
168.399	8.708
168.412	8.266
169.573	9.742
169.679	6.199
170.755	10.480
170.924	4.871
173.205	9.151
175.624	8.856
176.793	10.037
178.064	7.823
178.082	7.232
182.666	15.055
183.995	10.923
192.438	10.627
196.021	11.661
197.248	10.923
198.511	9.004
199.738	8.266
204.441	12.103
206.918	9.889
222.487	12.989
228.596	10.185
230.899	13.727
230.921	12.989
235.562	18.893
235.616	17.122
235.740	12.989
240.439	16.974
242.889	15.646
242.907	15.055
244.214	11.661
248.900	16.089
257.333	16.089
258.605	13.875
259.579	21.550
260.872	18.598
260.975	15.203
264.527	17.269
268.088	19.041
268.168	16.384
269.257	20.221
270.360	23.616
270.529	18.007
270.578	16.384
271.591	22.731
272.969	16.974
277.793	16.827
282.452	22.140
282.568	18.303
284.889	21.255
286.138	19.779
287.249	22.878
287.272	22.140
290.975	19.188
292.042	23.764
292.153	20.074
292.278	15.941
298.151	20.959
303.899	30.111
306.482	24.354
309.150	15.793
309.936	29.668
310.052	25.830
313.969	15.793
314.920	24.207
315.031	20.517
317.245	27.011
317.365	23.026
319.606	28.635
323.123	31.882
323.292	26.273
324.354	30.996
325.679	27.011
325.799	23.026
327.884	33.801
330.525	26.125
330.547	25.387
332.859	28.635
332.992	24.207
336.594	24.649
336.647	22.878
338.923	27.306
338.954	26.273
345.001	25.535
345.023	24.797
345.045	24.059
345.063	23.469
347.268	30.258
349.758	27.601
349.838	24.945
352.127	28.930
352.216	25.978
353.372	27.601
354.670	24.502
357.031	26.125
357.124	23.026
358.267	25.092
359.392	27.749
360.423	33.506
360.441	32.915
361.606	34.244
363.051	26.273
364.095	31.587
366.665	26.273
367.777	29.373
370.244	27.454
372.738	24.649
376.095	33.210
376.210	29.373
376.250	28.044
376.282	27.011
376.339	25.092
378.771	24.354
378.807	23.173
379.594	37.048
379.843	28.782
380.963	31.587
381.163	24.945
387.040	29.815
388.343	26.568
389.486	28.635
390.766	26.125
391.793	32.030
395.252	37.196
395.594	25.830
397.942	27.897
400.142	34.834
400.200	32.915
402.823	25.830
403.952	28.339
405.322	22.878
407.407	33.653
408.896	24.207
414.596	34.982
418.192	35.572
418.477	26.125
418.486	25.830
419.486	32.620
429.382	24.059
436.554	25.978
439.875	35.720
442.338	33.948
479.585	37.343];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(14);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhBizi1996';
comment.tL_f = 'Data for females from western Bering Sea)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm
42.331	2.676
62.943	2.987
64.086	4.160
65.335	3.575
84.751	3.592
88.339	4.474
95.611	4.627
110.102	5.812
113.743	5.815
122.193	6.555
127.100	5.681
129.261	10.078
129.376	8.173
130.732	5.830
131.866	7.150
131.901	6.564
133.204	5.100
136.746	6.715
137.942	7.009
142.592	10.383
142.805	6.867
142.814	6.720
146.357	8.335
147.597	7.896
148.890	6.579
151.220	8.193
151.264	7.460
154.674	11.273
156.118	7.464
162.213	7.030
164.337	12.014
165.782	8.205
165.951	5.422
167.040	7.474
169.245	11.139
171.930	6.892
174.295	7.920
175.321	10.998
175.375	10.119
184.896	13.204
188.635	11.595
195.720	14.825
195.916	11.602
197.254	9.552
198.316	12.044
201.930	12.486
202.081	9.996
202.152	8.823
206.553	16.300
215.119	15.135
217.679	12.940
217.848	10.156
221.231	14.408
223.889	10.601
225.076	11.041
228.512	14.414
229.592	16.613
232.153	14.418
232.224	13.245
237.954	18.818
241.692	17.210
241.745	16.331
242.817	18.676
243.101	13.988
243.208	12.230
245.261	18.385
248.858	19.121
248.866	18.974
252.605	17.366
252.685	16.047
257.388	18.542
260.046	14.735
262.322	17.228
264.616	19.428
264.820	16.058
267.345	14.449
269.425	20.165
271.888	19.581
278.027	18.414
278.053	17.974
278.062	17.828
280.134	23.691
284.219	16.368
288.091	12.562
288.646	23.405
300.817	22.830
306.814	24.007
310.525	22.838
311.650	24.304
313.166	19.324
316.504	24.309
317.682	24.896
317.860	21.965
320.393	20.209
321.536	21.383
323.794	24.168
323.856	23.143
323.865	22.996
327.541	22.414
329.924	23.148
331.271	20.952
332.511	20.513
334.556	26.815
334.716	24.178
337.427	19.492
338.143	27.698
338.374	23.888
339.623	23.303
340.783	24.183
340.970	21.107
342.121	22.133
344.593	21.403
349.331	23.312
349.367	22.726
352.794	26.245
354.337	20.825
355.435	22.731
357.711	25.224
357.791	23.905
360.022	27.131
360.289	22.735
362.556	25.375
366.348	22.887
368.775	22.889
368.881	21.131
370.033	22.158
370.068	21.572
373.549	24.212
376.047	23.042
379.732	22.313
383.132	26.272
383.319	23.195
384.470	24.222
386.720	27.154
388.191	22.906
391.814	23.203
392.947	24.522
398.775	28.483
407.492	24.828
420.743	26.452
473.943	29.722];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(14);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhBizi1996';
comment.tL_m = 'Data for males from western Bering Sea)'; 

% length-weight 
data.LWw = [ ... % mantle length (cm), wet weight (g)
12.223	87.221
13.115	75.009
13.410	118.458
13.558	118.489
13.930	112.367
14.227	106.230
14.374	143.451
14.598	112.505
14.599	106.307
14.671	149.710
14.970	112.582
15.191	149.818
15.192	125.025
15.564	112.705
15.639	87.927
15.785	149.941
16.081	156.200
16.228	187.222
16.674	193.513
16.896	199.757
17.047	156.400
17.268	193.635
17.640	175.117
17.861	212.353
17.937	168.980
18.085	187.606
18.232	212.430
18.455	212.476
18.752	206.339
18.899	231.163
19.194	274.612
19.493	249.880
19.936	293.360
20.085	274.796
20.086	268.598
20.087	243.805
20.602	330.688
20.675	355.496
20.676	336.902
20.678	305.910
20.681	243.927
20.754	268.736
20.754	262.538
21.199	287.423
21.342	399.023
21.349	256.462
21.417	374.245
21.420	318.460
21.493	337.070
21.714	380.504
22.087	349.590
22.087	337.193
22.161	349.605
22.235	349.620
22.308	380.627
22.605	386.887
22.835	231.976
22.977	374.567
23.048	430.367
23.053	331.194
23.123	411.787
23.350	331.256
23.420	424.245
23.494	424.261
23.644	399.498
23.938	442.947
23.940	411.956
24.081	554.547
24.089	399.590
24.090	380.995
24.235	461.604
24.455	511.236
24.534	412.079
24.606	461.680
24.976	480.352
25.121	554.762
25.123	511.374
25.348	468.032
25.423	449.453
25.717	517.695
25.787	610.685
25.941	499.146
26.018	430.981
26.082	635.539
26.158	610.761
26.309	548.809
26.312	505.421
26.313	480.628
26.316	418.645
26.459	530.245
26.528	635.631
26.821	710.072
26.824	648.089
26.828	573.710
27.051	561.359
27.055	486.980
27.268	691.569
27.344	660.593
27.568	623.449
27.645	567.680
27.860	735.080
27.864	654.502
27.871	499.545
27.936	691.707
27.940	604.931
28.390	524.446
28.454	735.203
28.458	654.625
28.675	760.042
28.905	623.726
28.972	772.500
29.489	822.193
29.493	747.814
30.008	828.499
30.459	729.419
31.497	754.427
31.789	866.057
36.876	1598.513];
units.LWw   = {'cm', 'g'};  label.LWw = {'mantle length', 'wet weight'};  
bibkey.LWw = 'ArkhBizi1996';
comment.LWw = 'Data for females from western Bering Sea)'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Lb = 5 * weights.Lb;
weights.am = 10 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'LMHB'; % Cat of Life
metaData.links.id_ITIS = '82430'; % ITIS
metaData.links.id_EoL = '46475752'; % Ency of Life
metaData.links.id_Wiki = 'Berryteuthis_magister'; % Wikipedia
metaData.links.id_ADW = 'Berryteuthis_magister'; % ADW
metaData.links.id_Taxo = '158029'; % Taxonomicon
metaData.links.id_WoRMS = '342286'; % WoRMS
metaData.links.id_molluscabase = '342286'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Berryteuthis_magister}}';
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
bibkey = 'ArkhBizi1996'; type = 'Article'; bib = [ ... 
'author = {Alexander I. Arkhipkin and Vyacheslav A. Bizikov and Vasily I. Krylov and Kir N. Nesis}, ' ... 
'year = {1996}, ' ...
'title = {Distribution, stock structure, and growth of the squid \emph{Berryteuthis magister} ({B}erry, 1913) ({C}ephalopoda, {G}onatidae) during summer and fall in the western {B}ering {S}ea}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {94}, ' ...
'pages = {1-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KatuShev2013'; type = 'inbook'; bib = [ ... 
'isbn = {9781628083378}, ' ...
'author = {Katugin, Oleg and Shevtsov, Gennadyi and Zuev, Mikhail and Dikenko, Vasilyi and Kulik, vladimir and Vanin, N.}, ' ... 
'year = {2013}, ' ...
'title = {Distribution, stock structure, and growth of the squid \emph{Berryteuthis magister} ({B}erry, 1913) ({C}ephalopoda, {G}onatidae) during summer and fall in the western {B}ering {S}ea}, ' ...
'journal = {Advances in Squid Biology, Ecology anf Fisheries. Part II-Oegopsid squids}, ' ...
'pages = {1-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Berryteuthis-magister.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

