function [data, auxData, metaData, txtData, weights] = mydata_Luidia_sarsii
%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Paxillosida'; 
metaData.family     = 'Luidiidae';
metaData.species    = 'Luidia_sarsii'; 
metaData.species_en = 'Sea star'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Ri'; 'dWw_W'; 'JX_W'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 21]; 


%% set data
% zero-variate data

data.tj = 1.5*30.5;   units.tj = 'd';      label.tj = 'time since birth at metam'; bibkey.tj = 'marlin';   
  temp.tj = C2K(14);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 365;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'Fenc1965';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365; units.am = 'd';      label.am = 'life span';                 bibkey.am = 'marlin';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.5;   units.Lj  = 'cm';  label.Lj  = 'diameter at metam';          bibkey.Lj  = 'guess';
  comment.Lj = 'guess based on Astropecten irregularis; bipinnaria larve reaches length of 3.5 cm, Wiki';
data.Li  = 15;    units.Li  = 'cm';  label.Li  = 'ultimate radius';            bibkey.Li  = 'Fenc1965';

data.Wwb  = 2.68e-4; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';    bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter 0f 0.8 mm: pi/6*0.08^3';

data.Ri  = 1.5e5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.85';
   
data.dWw  = 3.8/24; units.dWw  = 'g/d';  label.dWw  = 'gain wet weight at 8.9 g';    bibkey.dWw  = 'Fenc1965';
  temp.dWw = C2K(13.5);  units.temp.dWw = 'K'; label.temp.dWw = 'temperature';
data.JX  = 28.4*0.434/21; units.JX  = 'g/d';  label.JX  = 'feeding rate at 8.9 g';   bibkey.JX  = 'Fenc1965';
  comment.JX = 'Sea stars of 8.93 g ate 28.4 brittle stars of 0.434 g in 21 d and gained 3.8 g (mean of 10 individuals)';
  temp.JX = C2K(13.5);  units.temp.JX = 'K'; label.temp.JX = 'temperature';

% univariate data

% time-length
data.tL = [... % time (d), radius(cm) 
18.246	1.057
18.249	1.011
18.254	0.940
18.261	0.847
18.904	1.713
18.924	1.432
18.937	1.245
18.942	1.175
19.579	2.135
19.594	1.924
19.601	1.830
19.619	1.573
78.080	1.912
78.679	3.411
79.398	3.200
83.655	2.780
83.688	2.311
85.725	3.412
85.751	3.038
104.134	2.151
106.159	3.416
106.192	2.948
106.205	2.760
106.210	2.690
106.228	2.433
109.680	3.440
109.692	3.276
110.413	3.042
111.057	3.909
111.065	3.792
111.147	2.621
114.677	2.528
114.687	2.387
116.708	3.699
116.718	3.559
180.103	4.016
180.108	3.946
180.151	3.337
180.158	3.243
180.207	2.541
180.219	2.377
180.229	2.236
180.654	6.194
180.755	4.765
180.763	4.648
180.783	4.367
180.798	4.157
181.433	5.140
181.455	4.836
181.526	3.829
181.534	3.712
181.539	3.642
182.113	5.492
182.128	5.281
202.521	5.870
202.541	5.589
202.554	5.402
204.620	6.082
215.443	2.477
215.976	4.913
215.988	4.749
215.998	4.608
216.044	3.953
216.059	3.742
216.107	3.063
216.668	5.100
216.725	4.281
216.737	4.117
217.359	5.288
217.501	3.274
227.265	4.704
227.275	4.564
227.382	3.041
227.392	2.901
230.762	5.080
231.404	5.970
231.440	5.454
231.503	4.564
231.514	4.401
232.828	5.759
232.834	5.665
232.841	5.572
233.716	3.160
234.225	5.923
234.250	5.572
234.265	5.361
234.277	5.197
234.324	4.518
234.338	4.331
234.348	4.190
234.460	2.598
234.999	4.940
235.008	4.823
235.013	4.752
235.019	4.659
235.070	3.933
242.788	4.403
242.801	4.215
242.805	4.169
242.820	3.958
243.395	5.785
243.400	5.714
243.420	5.433
243.428	5.316
243.452	4.988
243.457	4.918
243.461	4.848
244.077	6.113
244.094	5.878
257.501	5.600
257.514	5.413
258.839	6.607
259.749	3.703
261.018	5.694
261.066	5.015
261.070	4.945
261.074	4.898
261.108	4.406
261.117	4.289
261.118	4.266
261.742	5.413
262.453	5.320
262.467	5.132
272.259	6.165
272.269	6.024
273.003	5.603
276.559	5.135
277.232	5.580
277.840	6.962
277.929	5.698
278.097	3.309
278.104	3.215
278.615	5.955
280.755	5.581
280.886	3.731
281.501	4.996
282.183	5.324
282.193	5.183
286.343	6.285
286.378	5.793
286.415	5.254
286.467	4.528
286.590	2.772
324.500	4.770
325.143	5.636
325.769	6.761
326.487	6.573
326.518	6.128
327.233	5.988
337.226	4.163
365.276	6.089
365.360	4.895
365.391	4.450
366.020	5.527
366.619	7.026
377.226	6.489
377.238	6.326
377.254	6.091
377.320	5.155
377.327	5.061
391.299	6.773
391.312	6.586
391.329	6.352
391.380	5.626
391.465	4.408
391.474	4.291
418.046	7.176
418.056	7.036
418.149	5.725
418.698	7.926
418.723	7.575
430.071	6.523
432.084	7.952
432.144	7.109
432.149	7.039
432.155	6.945
432.162	6.851
432.809	7.671
432.820	7.507
432.824	7.460
432.829	7.390
432.926	6.008
433.650	5.728
443.700	3.106
444.023	8.516
444.035	8.352
444.052	8.118
444.075	7.790
444.081	7.697
444.121	7.135
444.151	6.713
444.154	6.666
444.164	6.526
444.198	6.034
444.226	5.636
444.231	5.566
444.791	7.627
457.746	3.765
458.533	2.594
458.872	7.793
458.913	7.208
458.925	7.044
458.984	6.201
459.566	7.934
459.693	6.131
459.707	5.943
460.938	8.473
461.070	6.599
464.481	8.192
464.527	7.537
464.581	6.764
468.184	5.640
468.870	5.898
469.421	8.076
469.441	7.795
469.466	7.444
469.471	7.374
469.486	7.163
469.545	6.320
469.552	6.226
470.215	6.812
483.393	9.789
483.408	9.578
483.438	9.156
483.448	9.016
483.453	8.946
484.369	5.948
484.378	5.808
484.454	4.730
484.890	8.548
484.903	8.360
484.915	8.196
484.939	7.845
491.232	8.549
491.268	8.034
491.639	2.764
491.984	7.870
493.497	6.395
494.258	5.599
494.920	6.208
503.581	3.282
505.377	7.802
505.976	9.301
505.996	9.020
506.024	8.622
506.755	8.247
506.826	7.240
530.029	7.947
530.078	7.245
530.375	3.029
530.748	7.737
530.816	6.777
531.347	9.236
531.400	8.486];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'radius'};  
temp.tL   = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fenc1965';

% time-weight
data.tW = [ ... % time (d), wet weight (g)
21.730	2.041
84.979	3.324
112.391	3.790
181.921	6.472
224.769	7.930
258.475	9.388
281.667	9.854
327.936	14.052
381.442	12.420
440.224	20.758
471.088	23.032
499.914	23.265
532.230	24.257];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW   = C2K(14);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Fenc1965';

% length-weight
data.LW = [ ... % radius (cm), wet weight (g)
2.576	2.844
2.857	3.868
2.908	2.523
2.951	2.284
3.132	3.900
3.196	4.310
3.367	3.064
3.677	4.944
3.764	3.719
3.783	4.807
3.997	5.956
3.999	5.468
4.138	6.308
4.139	6.131
4.234	5.096
4.245	3.647
4.311	7.704
4.529	7.820
4.623	8.340
4.727	7.338
4.787	8.896
4.820	9.219
4.960	8.712
5.345	12.719
5.501	11.682
5.509	9.777
6.071	12.208
6.106	14.484
6.722	20.706
7.160	21.628
7.728	25.685
7.984	36.426
8.456	32.297
9.253	40.037];    
units.LW   = {'cm', 'g'};  label.LW = {'radius', 'wet weight'};  
bibkey.LW = 'Fenc1965';

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

%% Discussion points
D1 = 'growth dWw is used to estimate feeding level f_dW, to obtain digestion efficiency kap_X from J_X';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'At metamorphosis, the sea star steps off its larva, which continues life for several more months. The star absobs all larval tissue in other Luidia species';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Feeds exclusively on Ophiura albida, Amphiura filiformis and Echinocardium cordatum';
metaData.bibkey.F2 = 'Fenc1965'; 
metaData.facts = struct('F1',F1,'F2',F2);  

%% Links
metaData.links.id_CoL = '6QQD4'; % Cat of Life
metaData.links.id_ITIS = '989969'; % ITIS
metaData.links.id_EoL = '45327852'; % Ency of Life
metaData.links.id_Wiki = 'Luidia_sarsii'; % Wikipedia
metaData.links.id_ADW = 'Luidia_sarsi'; % ADW
metaData.links.id_Taxo = '3907193'; % Taxonomicon
metaData.links.id_WoRMS = '123922'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Luidia_sarsi}}';
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
bibkey = 'Fenc1965'; type = 'Article'; bib = [ ... 
'author = {T. Fenchel}, ' ... 
'year = {1965}, ' ...
'title = {Feeding biology of the sea-star \emph{Luidia sarsi} {D}uben \& {K}oren}, ' ...
'journal = {Ophelia}, ' ...
'volume = {2}, ' ...
'pages = {223--236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6190}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/Summary/speciesSummary.php?ID=48683&genusname=Luidia&speciesname=sarsi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];