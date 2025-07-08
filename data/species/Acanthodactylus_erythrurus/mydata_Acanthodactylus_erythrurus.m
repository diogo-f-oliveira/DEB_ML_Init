function [data, auxData, metaData, txtData, weights] = mydata_Acanthodactylus_erythrurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Acanthodactylus_erythrurus'; 
metaData.species_en = 'Spiny-footed lizard'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.am = 2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'DrecMonr2018';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.95;  units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';          bibkey.Lb  = 'DrecMonr2018'; 
  comment.Lb = '28 to 31 mm';
data.Lp  = 5.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'DrecMonr2018';  
data.Lpm  = 6;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'DrecMonr2018';  
data.Li  = 7.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'DrecMonr2018';  
data.Lim  = 8;    units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'DrecMonr2018';  

data.Wwi = 6.14;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Larcerta agilis: 12*0.8^3 g';

data.Ri  = 7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 till 7';

% univariate data
% time-length data
data.tL_f = [ ... % time since 1 Jan (d), SVL (cm)
192.912	3.285
194.625	3.190
195.750	3.285
199.140	3.427
199.154	3.301
203.676	3.475
213.891	3.491
214.495	3.174
215.005	3.680
215.075	3.063
215.081	3.016
215.607	3.380
217.878	3.380
217.901	3.174
219.581	3.380
220.087	3.918
222.331	4.155
223.554	3.380
223.567	3.269
224.722	3.095
224.733	3.000
226.877	4.108
226.958	3.396
227.467	3.918
227.476	3.839
228.685	3.190
230.278	4.155
230.373	3.316
231.544	3.000
233.104	4.266
236.569	3.744
242.747	4.329
242.772	4.108
242.804	3.823
242.818	3.696
242.860	3.332
244.035	2.984
246.289	3.127
247.383	3.491
251.279	4.171
253.586	3.854
253.593	3.791
254.067	4.614
254.083	4.472
256.429	3.807
257.008	3.712
257.635	3.190
260.414	3.712
260.462	3.285
260.473	3.190
261.019	3.380
263.288	3.396
263.721	4.582
264.436	3.285
265.492	3.981
265.512	3.807
267.763	3.981
268.945	3.570
269.568	3.079
271.690	4.392
271.794	3.475
272.730	5.231
274.048	3.617
274.495	4.677
274.673	3.111
276.791	4.456
276.913	3.380
279.037	4.677
281.412	3.759
281.931	4.187
281.943	4.076
281.954	3.981
282.031	3.301
282.046	3.174
283.104	3.854
283.601	4.472
286.937	5.089
287.174	3.000
287.566	4.551
288.164	4.282
288.173	4.203
289.384	3.538
290.381	4.756
290.397	4.614
292.262	3.190
292.714	4.203
292.842	3.079
293.740	5.168
296.679	4.282
301.306	3.522
301.321	3.396
457.327	4.238
462.181	6.485
463.304	6.596
463.977	5.663
464.021	5.283
465.249	4.460
466.722	6.485
473.469	7.055
473.491	6.865
473.534	6.486
473.577	6.106
473.705	4.983
474.116	6.359
476.962	6.296
482.264	4.587
487.161	6.455
487.249	5.679
493.989	6.313
497.950	6.424
505.324	6.471
505.333	6.392
505.957	5.902
507.573	6.661
508.728	6.487
511.082	5.760
511.608	6.123
514.414	6.408
514.460	5.997
515.515	6.709
515.537	6.519
521.326	5.523
521.818	6.187
521.860	5.823
523.473	6.614
525.194	6.456
526.372	6.077
528.014	6.615
530.852	6.615
533.161	6.283
533.773	5.887
535.929	6.900
536.017	6.125
536.028	6.030
537.179	5.887
546.146	6.900
546.225	6.204
547.370	6.125
550.774	6.141
551.879	6.410
551.891	6.299
553.671	5.619
554.192	6.030
554.205	5.920
554.738	6.220
558.112	6.505
558.166	6.031
561.608	5.714
562.157	5.872
562.199	5.509
563.250	6.252
563.266	6.110
564.363	6.442
566.172	5.509
567.252	5.999
579.702	6.332
580.805	6.617
581.484	5.636
581.495	5.541
582.481	6.854
582.586	5.937
587.071	6.427
589.412	5.810
596.771	5.985
612.055	6.365
621.683	6.555
626.242	6.397
627.450	5.765
635.345	6.224
643.857	6.240
660.873	6.367
662.646	5.750];
data.tL_f(:,1) = data.tL_f(:,1) - 180 ; % convert time to since since birth
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DrecMonr2018';
comment.tL_f = 'Data for females in Albufera de Valencia Natural Park';
%
data.tL_m = [ ... % time since 1 Jan (d), SVL (cm)
193.713	3.304
194.257	3.208
195.410	3.304
199.379	3.337
199.404	3.449
204.512	3.513
212.938	3.240
214.023	3.032
214.128	3.497
215.177	3.128
215.808	3.417
215.884	3.753
215.993	4.234
216.900	3.240
218.191	3.946
222.780	4.218
223.734	3.433
224.779	3.048
224.797	3.128
224.833	3.288
227.263	4.026
228.373	3.929
228.413	4.106
228.776	3.208
228.827	3.433
229.574	4.234
231.558	3.000
231.624	3.288
232.995	4.346
233.691	4.923
234.196	4.651
235.222	4.186
236.249	3.721
236.271	3.817
237.863	3.353
238.447	3.433
240.917	4.346
241.904	3.705
242.557	4.090
242.880	3.016
242.956	3.353
245.172	3.144
245.426	4.266
245.767	3.272
247.712	4.362
250.592	4.587
252.203	4.202
252.681	3.817
252.700	3.897
254.524	4.458
257.074	3.224
257.756	3.737
257.774	3.817
258.460	4.346
258.507	4.554
259.454	3.737
259.472	3.817
259.926	3.321
260.470	3.224
260.695	4.218
261.075	3.401
261.319	4.474
261.783	4.026
265.019	3.321
265.048	3.449
266.078	5.500
266.288	3.929
267.917	3.625
268.000	3.994
269.499	3.112
271.018	4.827
271.058	5.003
271.853	3.513
274.026	3.112
274.211	3.929
274.276	4.218
274.454	5.003
274.708	3.625
274.726	3.705
274.875	4.362
274.900	4.474
276.148	4.987
276.917	3.385
277.076	4.090
277.120	4.282
279.369	4.218
280.269	5.692
280.388	3.721
280.421	3.865
280.820	3.128
280.976	3.817
281.571	3.946
282.561	3.321
284.712	5.324
284.825	3.321
287.821	4.058
288.148	3.000
288.289	3.625
288.467	4.410
289.530	4.106
289.551	4.202
290.469	3.256
292.323	3.946
294.964	3.112
296.153	3.369
296.574	5.228
297.877	3.481
298.207	4.939
301.254	3.401
301.852	3.545
450.090	3.417
457.124	4.490
458.789	6.846
458.862	7.167
459.279	4.010
459.323	4.202
460.440	6.638
461.746	4.907
464.347	3.897
465.185	5.099
465.504	6.510
466.617	6.429
466.694	6.766
467.187	3.946
467.292	6.910
467.328	7.071
467.640	5.949
467.996	5.019
470.187	4.699
471.359	4.875
471.798	6.814
471.816	6.894
471.899	7.263
472.138	5.821
472.574	5.244
474.148	4.699
475.741	6.734
476.034	5.532
477.366	6.413
477.496	6.990
478.570	6.734
478.755	5.051
480.119	6.077
485.669	5.596
485.763	6.013
486.054	4.795
486.743	5.340
486.841	5.772
486.917	6.109
487.142	7.103
487.621	6.718
487.824	5.115
488.136	6.494
488.295	4.699
488.908	4.907
488.977	5.212
489.028	5.436
489.101	5.756
489.884	6.718
491.339	5.644
491.531	6.494
491.607	6.830
492.594	6.189
492.739	6.830
492.873	4.923
493.051	5.708
493.338	6.974
493.933	7.103
495.703	4.923
496.066	6.526
496.087	6.622
496.153	6.910
496.174	7.006
496.472	5.821
496.994	5.628
498.053	5.308
498.300	6.397
498.598	5.212
498.637	5.388
499.098	4.923
499.127	5.051
499.272	5.692
499.951	6.189
500.295	5.212
500.593	6.526
500.658	6.814
500.774	7.327
500.883	5.308
502.624	5.500
502.784	6.205
505.207	6.910
505.998	5.404
507.329	6.285
507.347	6.365
507.594	4.955
507.996	6.734
511.802	6.045
511.954	6.718
512.041	7.103
512.466	6.478
512.592	7.038
512.857	5.708
515.197	6.045
515.277	6.397
515.647	5.532
516.289	5.869
516.452	6.590
518.487	5.580
518.513	5.692
520.490	6.926
520.849	6.013
520.870	6.109
521.959	5.917
523.225	6.510
523.254	6.638
523.569	5.532
524.520	7.231
525.963	6.109
527.734	6.429
527.755	6.526
528.205	6.013
528.408	6.910
528.818	6.221
529.605	7.199
530.150	7.103
530.204	7.343
530.966	5.708
531.829	7.022
532.326	6.718
532.370	6.910
533.229	5.708
534.517	6.397
535.116	6.542
535.856	7.311
537.488	7.022
539.023	6.301
539.247	7.295
539.657	6.606
539.683	6.718
540.318	7.022
548.142	6.590
548.196	6.830
548.643	6.301
549.187	6.205
549.999	7.295
550.496	6.990
550.982	6.638
551.407	6.013
552.560	6.109
553.155	6.237
554.352	6.526
554.378	6.638
555.390	6.109
555.433	6.301
555.640	7.215
557.182	6.526
559.021	7.151
559.079	7.407
559.605	7.231
560.418	5.821
560.443	5.933
560.457	5.997
560.530	6.317
560.559	6.446
560.603	6.638
560.940	5.628
561.074	6.221
561.999	7.808
563.305	6.077
563.893	6.173
565.710	6.702
565.743	6.846
565.772	6.974
566.225	6.478
566.254	6.606
566.396	7.231
569.037	6.397
578.722	6.686
580.496	7.022
581.555	6.702
581.765	7.631
582.636	6.478
583.155	6.269
583.227	6.590
584.341	6.510
584.432	6.910
589.024	7.199
591.288	7.199
592.383	7.038
594.552	6.622
594.571	6.702
595.089	6.494
597.966	6.702
601.956	6.830
611.533	6.638
626.235	6.590
628.031	7.022
647.293	7.119
647.772	6.734
648.951	6.942
661.418	7.022];
data.tL_m(:,1) = data.tL_m(:,1) - 180 ; % convert time to since since birth
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DrecMonr2018';
comment.tL_m = 'Data for males in Albufera de Valencia Natural Park';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D2 = 'Temeratures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'reptile-database says that this species is viviparous, but that is not true';
metaData.bibkey.F1 = 'reptileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8VSB'; % Cat of Life
metaData.links.id_ITIS = '1155199'; % ITIS
metaData.links.id_EoL = '1057273'; % Ency of Life
metaData.links.id_Wiki = 'Acanthodactylus_erythrurus'; % Wikipedia
metaData.links.id_ADW = 'Acanthodactylus_erythrurus'; % ADW
metaData.links.id_Taxo = '49547'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Acanthodactylus&species=erythrurus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthodactylus_erythrurus}}';
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
bibkey = 'DrecMonr2018'; type = 'Article'; bib = [ ... 
'doi = {10.1163/15685381-20181087 brill.com/amre}, ' ...
'author = {Robby Marcel Drechsler and Juan Salvador Monr\''{o}s}, ' ... 
'year = {2018}, ' ...
'title = {Body growth and its implications in population dynamics of \emph{Acanthodactylus erythrurus} ({S}chinz, 1834) in the {E}astern {I}berian {p}eninsula}, ' ...
'journal = {Amphibia-Reptilia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Acanthodactylus&species=erythrurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

