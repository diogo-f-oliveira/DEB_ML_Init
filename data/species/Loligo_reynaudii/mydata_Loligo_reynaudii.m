function [data, auxData, metaData, txtData, weights] = mydata_Loligo_reynaudii
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Loligo_reynaudii'; 
metaData.species_en = 'Chokka squid'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 09 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 500;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'MwanDurh2021';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.31;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'guess';
  comment.Lb = 'based on Loligo vulgaris';
data.Lp  = 17;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'guess';
  comment.Lp = 'based on Loligo vulgaris';
data.Lpm  = 10;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';       bibkey.Lpm  = 'guess';
  comment.Lpm = 'based on Loligo vulgaris';
data.Li  = 22.5;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'MwanDurh2021';
data.Lim = 45; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'MwanDurh2021';

data.Wwim = 8300; units.Wwim  = 'g'; label.Wwim  = 'wet weight at death for males'; bibkey.Wwim  = 'guess';
  comment.Wwim = 'based on Loligo vulgaris';

data.Ni  = 1e5; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'guess';   
  temp.Ni = C2K(18); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
176.289	8.285
188.660	8.462
210.309	8.908
211.340	10.349
216.495	10.348
226.804	13.138
235.052	12.326
258.763	18.131
259.794	17.680
261.856	18.626
261.856	11.464
262.887	18.130
263.918	17.544
265.979	12.769
268.041	17.363
272.165	13.083
277.320	11.190
278.350	15.199
280.412	19.658
280.412	17.676
284.536	17.224
286.598	16.098
288.660	13.214
290.722	11.322
292.783	17.268
292.783	14.790
294.845	18.033
294.845	9.925
295.876	18.393
295.876	16.321
296.907	18.798
296.907	19.474
296.907	15.014
296.907	14.068
297.938	16.456
301.031	18.392
301.031	17.581
302.062	19.473
302.062	16.320
305.155	16.949
305.155	14.292
306.186	12.535
307.217	21.318
307.217	18.616
308.247	18.390
308.247	13.525
309.278	19.066
310.309	17.219
313.402	20.957
313.402	16.182
313.402	16.948
313.402	18.254
313.402	18.749
313.402	19.155
313.402	19.335
313.402	10.191
314.433	21.452
315.464	16.317
316.495	17.037
316.495	17.668
316.495	12.803
317.526	19.920
317.526	18.388
318.557	22.397
318.557	20.775
318.557	14.514
319.588	20.054
319.588	16.586
319.588	15.009
320.619	17.396
323.711	21.270
323.711	19.693
324.742	22.260
324.742	21.630
324.742	17.531
325.773	20.503
325.773	20.684
325.773	16.179
326.804	20.728
326.804	21.224
326.804	17.800
327.835	17.125
329.897	18.881
329.897	19.466
329.897	13.070
330.928	19.872
331.959	16.043
332.990	22.709
332.990	20.817
332.990	20.457
332.990	17.934
334.021	17.484
334.021	12.799
335.052	21.492
335.052	20.636
335.052	19.961
335.052	17.483
335.052	17.573
337.113	21.717
337.113	21.131
338.144	19.059
338.144	12.438
339.175	20.185
339.175	18.383
339.175	17.933
339.175	16.401
340.206	19.464
341.237	20.545
342.268	21.446
342.268	18.563
342.268	16.896
342.268	16.761
343.299	19.148
343.299	17.211
344.330	21.130
345.361	19.733
345.361	17.661
345.361	15.499
346.392	19.778
346.392	17.481
348.454	20.138
348.454	18.291
350.515	17.210
350.515	16.444
350.515	16.173
351.546	18.831
351.546	18.380
353.608	21.128
354.639	23.064
354.639	21.263
354.639	20.091
354.639	18.605
355.670	22.344
355.670	19.641
356.701	21.803
356.701	20.722
356.701	19.055
356.701	15.902
358.763	17.478
358.763	18.334
359.794	18.108
361.856	17.207
361.856	17.477
361.856	19.955
362.887	16.486
364.948	16.936
364.948	19.323
365.979	18.422
367.010	23.602
367.010	16.215
367.010	16.530
367.010	20.629
367.010	20.945
367.010	20.945
368.041	14.773
368.041	20.224
370.103	21.439
371.134	17.340
371.134	19.727
371.134	20.223
372.165	19.097
374.227	24.006
374.227	22.745
375.258	15.627
375.258	20.943
377.320	19.906
378.351	19.275
382.474	21.977
383.505	24.004
385.567	17.427
389.691	23.012
390.722	22.020
394.845	19.227
395.876	18.010
397.938	17.334
398.969	23.235
401.031	21.703
404.124	22.648
404.124	17.873
409.278	22.016
409.278	17.286
417.526	22.194
418.557	17.915
434.021	26.245
434.021	21.155
434.021	20.524
441.237	21.604
445.361	19.485
465.979	18.490
478.350	22.721];
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MwanDurh2021';
comment.tL_f = 'data for females'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
167.914	9.924
176.471	9.437
177.540	11.563
178.610	9.765
182.888	9.604
194.652	8.382
195.722	10.671
198.930	11.081
207.487	10.268
209.626	11.658
220.321	31.853
220.321	12.235
241.711	28.592
248.128	11.592
249.198	9.467
250.267	33.746
255.615	28.353
256.684	12.413
267.380	11.028
270.588	15.852
277.005	8.988
280.214	28.690
280.214	15.611
284.492	33.433
284.492	27.547
285.561	13.079
286.631	11.199
288.770	23.216
288.770	19.783
288.770	16.595
288.770	9.892
290.909	27.304
291.979	30.166
291.979	18.149
291.979	14.144
293.048	29.676
293.048	26.324
294.118	12.265
295.187	23.791
295.187	9.976
297.326	17.416
297.326	13.574
298.396	28.370
299.465	29.270
301.604	26.655
301.604	22.649
303.743	29.925
303.743	26.901
305.882	30.907
306.952	23.305
306.952	12.760
309.091	32.298
309.091	29.928
310.160	32.871
310.160	31.563
310.160	30.092
310.160	29.274
310.160	28.947
310.160	20.773
311.230	16.768
312.300	25.678
314.439	26.742
314.439	20.039
315.508	28.622
316.578	30.585
317.647	26.089
318.717	33.365
318.717	29.441
318.717	22.820
318.717	17.670
318.717	12.438
318.717	9.496
319.786	32.384
319.786	29.115
319.786	28.052
319.786	13.583
320.856	27.480
321.925	20.778
322.995	35.492
322.995	24.538
322.995	18.816
324.064	32.141
324.064	31.814
324.064	27.236
325.134	27.564
325.134	16.446
327.273	21.761
328.342	33.859
328.342	28.791
328.342	27.892
328.342	27.810
328.342	25.113
329.412	26.911
330.481	31.898
330.481	29.855
330.481	23.070
330.481	17.511
331.551	23.479
331.551	19.801
332.620	37.785
332.620	25.114
332.620	24.215
333.690	35.823
333.690	25.523
334.759	26.178
334.759	22.336
335.829	28.467
335.829	22.745
335.829	15.797
336.898	28.141
336.898	18.822
337.968	34.190
337.968	20.130
339.038	29.531
339.038	24.218
340.107	32.474
340.107	29.123
340.107	22.420
340.107	17.760
340.107	16.207
341.177	35.172
341.177	35.418
341.177	32.638
342.246	26.508
342.246	27.080
343.316	28.388
343.316	21.277
344.385	32.313
344.385	29.125
344.385	19.642
345.455	32.885
346.524	33.540
346.524	34.275
346.524	27.899
346.524	28.635
348.663	21.279
349.733	34.195
349.733	27.737
349.733	24.386
350.802	37.383
350.802	14.904
350.802	7.056
351.872	32.152
351.872	29.700
351.872	22.016
352.941	29.700
352.941	29.210
352.941	26.349
354.011	36.077
354.011	33.216
355.080	32.644
355.080	33.788
356.150	23.162
358.289	33.217
358.289	29.866
358.289	25.370
358.289	18.095
359.358	31.174
359.358	31.501
359.358	24.717
361.497	31.339
361.497	32.074
361.497	26.271
362.567	35.099
362.567	30.276
363.636	33.138
363.636	24.473
364.706	37.144
365.775	34.528
365.775	30.605
366.845	32.730
367.914	28.153
367.914	23.412
368.984	28.399
370.054	33.713
370.054	32.323
370.054	25.702
371.123	30.689
373.262	28.646
373.262	27.665
374.332	23.415
375.401	29.791
375.401	26.358
377.540	27.176
378.610	33.553
378.610	28.648
378.610	29.302
378.610	23.580
379.679	31.264
380.749	42.791
382.888	32.492
390.374	37.236
390.374	31.023
391.444	33.149
391.444	32.250
391.444	29.634
394.652	33.314
394.652	28.818
395.722	27.838
395.722	28.410
401.070	37.159
402.139	34.380
402.139	36.178
404.278	30.784
408.556	37.816
413.904	29.970
414.973	38.799
416.043	37.328
416.043	33.568
422.460	38.475
426.738	34.308
426.738	32.265
432.086	37.498
434.225	33.412
434.225	32.022
434.225	29.734
445.989	34.561
451.337	40.776
451.337	37.915
451.337	36.525
459.893	33.014
468.449	36.369
479.144	21.005
482.353	36.701];
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MwanDurh2021';
comment.tL_m = 'data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f; 
weights.tL_m = 3 * weights.tL_m; 
weights.am = 5 * weights.am; 
weights.Lb = 5 * weights.Lb; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VVTH'; % Cat of Life
metaData.links.id_ITIS = '556102'; % ITIS
metaData.links.id_EoL = '1247527'; % Ency of Life
metaData.links.id_Wiki = 'Loligo_reynaudii'; % Wikipedia
metaData.links.id_ADW = 'Loligo_reynaudii'; % ADW
metaData.links.id_Taxo = '3964520'; % Taxonomicon
metaData.links.id_WoRMS = '220316'; % WoRMS
metaData.links.id_molluscabase = '220316'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Loligo_reynaudii}}';
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
bibkey = 'MwanDurh2021'; type = 'article'; bib = [ ... 
'author = {Collette H. Mwanangombe and Deon Durholtz and Dawit YeMane and Jean Githaiga-Mwicigi and WarwiCk H. H. Sauer and Marek r. Lipi\''{n}ski}, ' ... 
'year = {2015}, ' ...
'title = {GROWTH RATES OF THE CHOKKA SQUID \emph{Loligo reynaudii} {D}’{O}RBIGNY, 1845 ({C}EPHALOPODA: {M}YOPSIDA: {L}OLIGINIDAE) OFF  {S}OUTH {A}FRICA, INVESTIGATED OVER TWO YEARS}, ' ...
'journal = {Folia Malacol.}, ' ...
'volume = {29(1)}, ' ...
'pages = {153–162}, ' ...
'doi = {10.12657/folmal.029.017}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

