function [data, auxData, metaData, txtData, weights] = mydata_Geocrinia_rosea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Myobatrachidae';
metaData.species    = 'Geocrinia_rosea'; 
metaData.species_en = 'Karri frog'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bFp', 'biTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 87;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'MuelAugu2012';   
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'va;lue for G. vitellina';
data.tp = 2.5*365;   units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'MuelAugu2012';
  temp.tp = C2K(17); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'va;lue for G. vitellina';
data.am = 6*365;     units.am = 'd';  label.am = 'life span';              bibkey.am = 'global';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data for G. alba';

data.Wwb = 0.015;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MantGaik2013';
data.Wwi = 1.6;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'MantGaik2013';

data.Ri  = 30/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since hatch (d), weight (g)
3.445	0.027
4.143	0.011
6.195	0.061
6.886	0.061
10.347	0.049
10.357	0.026
25.552	0.057
26.253	0.034
31.078	0.064
35.219	0.079
38.670	0.091
40.069	0.053
42.133	0.075
44.890	0.094
44.908	0.052
55.953	0.087
57.324	0.113
59.395	0.121
65.611	0.132
68.383	0.117
69.058	0.155
78.040	0.162
78.740	0.143
82.897	0.120
87.741	0.109
90.490	0.147
92.557	0.162
95.997	0.200
98.770	0.181
100.832	0.208
101.553	0.139
105.681	0.185
105.692	0.158
111.211	0.185
115.356	0.188
120.195	0.188
121.606	0.123
129.167	0.222
133.984	0.272
135.350	0.310
136.071	0.241
136.110	0.150
145.049	0.260
147.078	0.363
147.789	0.317
150.534	0.363
151.267	0.268
154.022	0.290
158.123	0.397
160.841	0.507
162.269	0.401
163.667	0.366
164.368	0.344
165.051	0.363
166.468	0.283
167.144	0.317
174.687	0.458
175.441	0.313
176.086	0.420
179.555	0.389
179.587	0.317
183.036	0.332
189.249	0.351
191.262	0.492
191.274	0.465
196.789	0.499
198.219	0.389
198.882	0.453
205.033	0.617
205.754	0.548
206.503	0.415
209.197	0.579
211.309	0.491
214.016	0.625
214.696	0.651
216.070	0.670
216.848	0.468
218.865	0.602
222.339	0.560
223.723	0.556
231.305	0.605
232.643	0.708
232.653	0.685
232.662	0.666
235.254	1.066
241.615	0.742
242.272	0.822
243.728	0.651
245.081	0.719
245.762	0.742
250.544	0.875
256.087	0.845
257.570	0.612
258.903	0.727
259.582	0.753
260.246	0.818
262.968	0.917
264.375	0.860
268.498	0.917
268.521	0.863
268.542	0.814
270.667	0.696
271.253	0.940
271.255	0.936
271.324	0.776
271.335	0.749
273.360	0.863
274.798	0.734
277.405	1.099
277.553	0.757
279.607	0.802
286.548	0.737
287.107	1.042
287.186	0.859
290.503	1.183
291.276	0.993
292.632	1.053
292.708	0.878
294.810	0.813
298.980	0.760
305.180	0.809
305.751	1.088
306.329	1.350
309.267	0.950
309.917	1.046
312.745	0.901
316.138	1.045
319.458	1.362
323.790	0.935
324.506	0.878
324.540	0.798
327.167	1.118
327.259	0.904
327.262	0.897
328.633	0.923
332.863	0.733
334.242	0.740
334.916	0.782
337.649	0.855
338.992	0.946
340.355	0.992
340.423	0.835
342.485	0.862
344.399	1.232
344.468	1.072
348.752	0.755
350.780	0.862
351.425	0.969
352.880	0.801
355.539	1.045
356.208	1.098
357.496	1.315
359.009	1.014
361.214	0.709
361.841	0.858
363.862	0.980
365.963	0.919
370.090	0.964
373.545	0.968
373.611	0.816
374.908	1.014
375.653	0.888
378.344	1.059
379.077	0.964
383.303	0.781
386.740	0.827
394.371	0.762
395.704	0.876
396.361	0.956
396.437	0.781
401.218	0.914
404.661	0.945
405.395	0.846
411.574	0.945
416.378	1.024
416.478	0.792
417.768	1.005
417.829	0.864
417.854	0.807
430.901	1.009
435.711	1.074
436.447	0.971
436.450	0.963
436.470	0.917
436.482	0.891
436.503	0.841
454.398	1.020
457.260	0.795
459.192	1.123
459.288	0.902
461.316	1.008
481.321	1.103
486.762	1.309
487.555	1.073
488.911	1.134
491.693	1.095
513.704	1.346
514.436	1.251
520.039	1.083
520.078	0.992
521.374	1.194
522.700	1.323
526.237	1.137];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since hatch', 'weight', 'females'};  
bibkey.tW_f = 'MantGaik2013';
comment.tW_f = 'Data for females; temp 15-23 C in summer and 10-19 C in winter';
% 
data.tW_m = [ ... % time since hatch (d), weight (g)
1.392	0.015
1.393	0.030
6.265	0.030
6.961	0.061
21.578	0.072
24.362	0.087
32.019	0.061
34.107	0.087
43.155	0.084
43.156	0.114
51.508	0.099
54.988	0.099
56.381	0.144
67.517	0.129
69.606	0.152
82.831	0.141
84.919	0.141
85.615	0.190
87.703	0.137
96.056	0.205
96.752	0.160
105.104	0.236
106.497	0.194
112.065	0.198
115.545	0.224
119.026	0.183
122.506	0.194
122.507	0.224
123.898	0.270
124.594	0.293
128.074	0.232
129.466	0.274
134.339	0.304
136.427	0.327
137.819	0.274
141.995	0.285
143.387	0.338
148.956	0.448
149.652	0.388
151.044	0.422
152.436	0.384
157.309	0.460
162.877	0.467
162.878	0.422
164.269	0.566
168.445	0.441
168.446	0.380
180.278	0.509
180.974	0.399
182.367	0.433
185.151	0.471
193.503	0.566
193.504	0.657
196.288	0.502
205.336	0.737
206.729	0.532
208.121	0.669
212.993	0.616
215.777	0.688
215.778	0.775
222.042	0.578
226.914	0.737
229.002	0.669
241.531	0.779
242.923	0.836
246.404	0.737
256.148	0.836
257.541	0.764
261.021	0.821
261.022	0.851
263.109	0.794
267.285	0.805
270.766	0.836
270.767	0.866
279.814	0.821
293.735	0.961
296.520	0.878
298.608	0.806
299.304	0.821
301.392	0.866
302.784	0.965
304.176	0.813
304.872	0.851
313.921	0.813
315.313	0.855
322.970	0.885
325.754	0.851
325.755	0.798
337.587	0.821
337.588	0.863
337.589	0.927
339.675	0.905
342.459	0.867
347.332	0.802
352.204	0.855
352.205	0.931
352.900	0.836
358.469	0.783
364.037	1.018
364.038	0.882
366.125	0.905
374.478	0.890
375.174	1.064
377.262	0.821
377.263	0.946
393.271	0.977
393.272	0.916
398.840	0.757
399.536	0.901
405.800	0.905
407.193	0.973
416.241	0.928
418.329	0.780
419.722	0.878
420.418	0.985
434.339	1.042
437.123	0.913
437.124	0.966
439.211	1.042
457.309	0.890
458.701	1.038
458.702	1.083
458.703	1.102
487.935	1.080
487.936	1.315
488.631	1.050
494.200	1.087
518.561	1.095
519.954	1.171
522.042	1.232
524.826	1.368];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since hatch', 'weight', 'males'};  
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
bibkey.tW_m = 'MantGaik2013';
comment.tW_m = 'Data for males; temp 15-23 C in summer and 10-19 C in winter';
%
temp.tW_f = [...
      0 22
    230 22
    260 15
    456 15
    500 22
    600 22];
units.temp.tW_f   = {'d', 'C'};  label.temp.tW_f = {'time since hatch', 'temperature'};  

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Direct development';
metaData.bibkey.F1 = 'MantGaik2013'; 
F2 = 'Lives in karri forest (Eucalyptus diversicolor),  Warren region SW Australia';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3FP6L'; % Cat of Life
metaData.links.id_ITIS = '664680'; % ITIS
metaData.links.id_EoL = '333364'; % Ency of Life
metaData.links.id_Wiki = 'Geocrinia_rosea'; % Wikipedia
metaData.links.id_ADW = 'Geocrinia_rosea'; % ADW
metaData.links.id_Taxo = '79112'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Geocrinia+rosea'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geocrinia_vitellina}}';
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
bibkey = 'MantGaik2013'; type = 'Article'; bib = [ ... 
'author = {L. Mantellato and G. Gaikhorst and R. Kruger and S. Vitali and H. Robertso}, ' ... 
'year = {2013}, ' ...
'title = {Growth and Development of Captive \emph{Geocrinia rosea} ({M}yobatrachidae): {A} Rare Species Analogue}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {32}, ' ...
'pages = {374--380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'global'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.globalspecies.org/ntaxa/964213}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuelAugu2012'; type = 'Article'; bib = [ ... 
'author = {Mueller, C. and Augustine, S. and Kooijman, S. A. L. M. and Kearney, M. and Seymour, R.}, ' ... 
'year = {2012}, ' ...
'title = {The tradeoff between maturation and growth during accelerated development of frogs}, ' ...
'journal = {Comp. Physiol. Biochem. A}, ' ...
'howpublished = {\url{https://www.zotero.org/groups/500643/deb_library/items/4ZMA4WX3/item-details}}, '...
'volume = {163}, ' ...
'pages = {103--110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
