function [data, auxData, metaData, txtData, weights] = mydata_Gonatus_fabricii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Gonatidae';
metaData.species    = 'Gonatus_fabricii'; 
metaData.species_en = 'Boreo-atlantic Armhook Squid'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MAN','MN'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lb';'Lp'; 'Li'; 'Ww_b'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 04 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 05 15];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 03 28];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 720;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'PiatZumh2015';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';     bibkey.Lp  = 'ArkhBjor2000';
  comment.Lp = 'based on Doryteuthis_pealeii: (17/27)*40';
data.Li  = 31;  units.Li  = 'cm'; label.Li  = 'mantle length at death';     bibkey.Li  = 'PiatZumh2015';
data.Lim  = 25;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for males';     bibkey.Lim  = 'ArkhBjor2000';

data.Wwb  = 0.087;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'GoliBlic2019';
  comment.Wwb = 'based on egg diameter of 5.5 mm: pi/6*0.55^3';
data.Wwi  = 570;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = {'PiatZumh2015','ArkhBjor2000'};
  comment.Wwi = 'based on 0.118*Li^2.47, see F1';
data.Wwim  = 335;  units.Wwim  = 'g'; label.Wwim  = 'wet weight at death for males'; bibkey.Wwim  = {'PiatZumh2015','ArkhBjor2000'};
  comment.Wwim = 'based on 0.118*Lim^2.47, see F1';

data.Ni  = 9900*0.77; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'GoliBlic2019';   
  temp.Ni = C2K(5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '8862 to 10000 oocytes, 23.5 percent is resorbed';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), pen length (cm)
12.825	0.756
22.437	1.038
37.388	1.413
66.210	1.785
120.671	3.098
167.671	4.697
284.007	5.520
308.703	10.540
321.452	8.734
324.671	9.303
332.085	7.498
349.271	11.193
350.376	12.426
355.584	8.251
362.096	11.853
362.365	20.674
372.640	7.677
372.778	12.230
383.828	24.652
386.636	11.752
386.671	12.890
388.912	16.399
388.944	17.442
389.719	7.862
389.805	10.708
390.806	8.526
391.913	9.853
395.190	12.319
395.198	12.603
398.353	11.085
400.473	10.610
400.762	20.095
401.581	11.938
402.558	8.997
404.646	7.479
410.493	24.266
412.248	11.840
412.364	15.634
419.897	17.718
421.875	12.596
433.023	28.243
434.645	11.454
434.821	17.240
437.016	19.231
441.016	10.409
454.983	13.536
456.224	19.226
463.652	17.896
464.774	19.698
465.951	23.302
466.061	26.907
468.930	15.998
469.945	14.290
474.164	12.677
479.598	15.900
481.905	21.591
488.105	14.949
488.279	20.640
489.519	26.331
504.424	25.189
509.467	15.607
519.131	17.597
519.357	24.995
526.540	15.603
529.868	19.775
529.935	21.957
535.120	17.023
546.068	26.126
555.747	28.590
564.225	26.690
574.769	22.514
575.865	23.462
597.472	32.183
607.932	25.256
629.146	21.076
647.269	20.502];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhBjor2000';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (d), pen length (cm)
9.642	0.193
22.490	0.579
31.069	1.061
63.153	1.446
122.020	2.893
165.926	4.339
285.691	5.496
294.588	11.185
313.571	7.039
327.588	9.063
329.608	7.135
358.592	9.256
373.454	7.617
376.813	10.124
384.276	9.835
386.879	17.452
388.704	12.342
390.547	7.521
390.612	8.581
400.890	19.380
404.517	8.774
405.503	7.424
407.261	18.705
410.108	12.824
410.811	6.846
415.899	20.152
416.555	13.402
422.850	11.474
423.521	22.466
427.354	15.234
429.344	12.824
432.998	20.152
433.437	9.835
439.181	16.391
442.134	12.245
442.599	19.862
447.589	14.077
458.800	22.658
459.345	14.077
459.445	15.716
460.143	9.642
471.548	21.405
475.505	16.198
477.872	19.959
481.988	17.355
483.919	13.981
486.954	11.185
488.624	21.019
492.628	16.584
500.303	19.766
500.474	22.562
510.919	18.609
515.047	16.198
518.200	15.331
523.093	25.455
536.568	18.609
547.037	15.041
552.286	13.499
560.032	17.837
567.448	16.777
567.772	22.080
568.129	10.413
569.768	19.766
607.350	22.658
619.768	16.006
658.371	18.127];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhBjor2000';
comment.tL_m = 'data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
326.792	38.368
331.070	19.118
350.713	52.330
357.144	27.587
361.207	275.553
374.500	24.969
374.661	74.557
385.452	388.692
388.618	27.835
388.752	69.158
388.887	110.482
397.390	55.452
400.556	27.929
400.610	44.458
411.472	47.299
412.665	80.366
414.414	284.236
420.459	141.033
434.281	52.988
436.909	526.838
444.076	61.329
462.929	185.445
464.661	383.806
465.199	215.766
466.096	157.922
468.006	78.047
474.581	97.382
478.967	111.191
485.819	215.928
487.533	75.446
490.546	667.756
508.234	100.402
518.863	364.948
519.168	125.281
526.765	125.341
551.691	447.851
557.862	343.217
568.141	500.322
578.608	381.948
579.424	299.309
580.339	246.975
600.861	883.500
627.052	261.117];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(5);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ArkhBjor2000';
comment.tWw_f = 'data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
167.041	11.002
293.721	46.318
313.876	21.870
326.688	41.632
328.787	29.352
359.639	29.568
373.509	46.879
374.515	22.296
382.014	44.480
387.287	24.845
388.450	66.656
389.479	51.909
399.024	39.681
406.436	24.979
410.715	34.845
416.110	66.850
422.446	47.223
423.969	241.496
424.673	89.042
433.497	221.891
434.143	44.846
437.520	123.558
438.439	62.089
447.025	94.117
457.030	276.154
457.031	276.154
459.663	40.107
460.884	106.509
469.593	190.177
476.952	153.344
477.034	187.770
482.661	318.138
483.097	52.567
498.282	175.625
498.444	244.478
505.490	74.856
513.036	116.712
517.239	94.610
521.913	271.692
533.354	161.117
554.613	153.889
565.188	126.914
565.403	217.899
567.141	53.157
603.806	262.431
653.603	176.716];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(5);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ArkhBjor2000';
comment.tWw_m = 'data for males';

% length-weight
data.LWw_f = [ ... % mantle length (mm), weight (g)
    194 158
    192 130
    228 183
    232 202
    239 198
    239 145
    247 207
    249 239
    249 164
    306 166
    236 160
    238 239
    244 320
    247 264
    257 228
    225 212
    215 273
    221 209];
data.LWw_f(:,1) = data.LWw_f(:,1)/ 10; % convert mm to cm
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'GoliBlic2019';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... % mantle length (mm), weight (g)
    185  78
    160  82
    214 191
    163 119
    171 103
    172 114
    213 154
    218 141
    218 135
    219 149
    229 168
    208 134
    233 133
    261 173
    198 124
    230 233
    241 256
    249 214
    269 218
    257 228
    236 248
    178 100
    285 318
    221 188
    241 200
    232 341
    256 223
    273 362
    325 294
    224 191
    298  34];
data.LWw_m(:,1) = data.LWw_m(:,1)/ 10; % convert mm to cm
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'GoliBlic2019';
comment.LWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
%weights.tWw_f = 3 * weights.tWw_f;
%weights.tWw_m = 3 * weights.tWw_m;
weights.Ni = 3 * weights.Ni;
weights.am = 10 * weights.am;
weights.Wwb = 3 * weights.Wwb;
weights.LWw_m(end) = 0; % ignore last data point

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LWw_f','LWw_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'End of acceleration is assumed to coincide with puberty';
D3 = 'Mantle length is assumed to equal pen length in tL data';
D4 = 'mod_1: new reproduction, Ww_b, LWw data';
D5 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Acknowledgment
metaData.acknowledgment = 'I want to thank Alexey Golikov for pointing to additional data';

%% Facts
F1 = 'length-weight: Ww (in g) = 0.118*(ML in cm)^2.47';
metaData.bibkey.F1 = 'PiatZumh2015'; 
F2 = 'Programmed death, not by ageing';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6KP7M'; % Cat of Life
metaData.links.id_ITIS = '82419'; % ITIS
metaData.links.id_EoL = '439714'; % Ency of Life
metaData.links.id_Wiki = 'Gonatus_fabricii'; % Wikipedia
metaData.links.id_ADW = 'Gonatus_fabricii'; % ADW
metaData.links.id_Taxo = '40261'; % Taxonomicon
metaData.links.id_WoRMS = '140027'; % WoRMS
metaData.links.id_molluscabase = '153097'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gonatus_fabricii}}';
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
bibkey = 'PiatZumh2015'; type = 'incollection'; bib = [ ... 
'isbn = {978-87-7482-155-7}, ' ...
'author = {Uwe Piatkowski and Karsten Zumholz and Patrizia Jereb and Sonia Seixas and Daniel Oesterwind and Evgenia Lefkaditou and A. Louise Allcock and Graham J. Pierce and Oleg Katugin}, ' ... 
'year = {2015}, ' ...
'title = {\emph{Gonatus fabricii} ({L}ichtenstein, 1818)}, ' ...
'booktitle = {Cephalopod biology and fisheries in Europe: II. Species Accounts; ICES Cooperative Research Report}, ' ...
'editor = {Jereb, P. and Allcock, A.L. and Lefkaditou, E. and Piatkowski, U. and Hastie, L.C. and Pierce, G.J.}, ' ...
'volume = {325}, ' ...
'pages = {230-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WiboGjos1982'; type = 'techreport'; bib = [ ... 
'author = {Wiborg, K. F. and Gj{\o}s{\ae}ter, J. and Beck, I. M. and Fossum, P.}, ' ... 
'year = {1982}, ' ...
'title = {THE SQUID \emph{Gonatus fabricii} ({L}ICHTENSTEIN) INVESTIGATIONS IN THE {N}ORWEGIAN {S}EA AND {W}ESTERN {B}ARENTS {S}EA 1978-1981}, ' ...
'institution = {International Council for the Exploration of the Sea}, ' ...
'volume = {C,M, 1982/K: 31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArkhBjor2000'; type = 'article'; bib = [ ... 
'author = {Alexander I. Arkhipkin and Herman Bj{\o}rke}, ' ... 
'year = {2000}, ' ...
'title = {Statolith shape and microstructure as indicators of ontogenetic shifts in the squid \emph{Gonatus fabricii} ({O}egopsida, {G}onatidae) from the {N}orwegian {S}ea}, ' ...
'journal = {Polar Biol.}, ' ...
'volume = {23}, ' ...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GoliBlic2021'; type = 'article'; bib = [ ... 
'doi = {10.1080/13235818.2021.1898732}, ' ...
'author = {Alexey V. Golikov and  Martin E. Blicher and Henk-Jan T. Hoving and Denis V. Zakharov and Rushan M. Sabirov}, ' ... 
'year = {2021}, ' ...
'title = {Actual fecundity of the {A}rctic squid \emph{Gonatus fabricii} ({C}ephalopoda) based on the examination of a rarely encountered spent female}, ' ...
'journal = {Molluscan Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GoliBlic2019'; type = 'article'; bib = [ ... 
'doi = {10.1093/mollus/eyz023}, ' ...
'author = {Alexey V. Golikov and  Martin E. Blicher and Lis L. J{\o}rgensen and Wojciech Walkusz and Denis V. Zakharov and Olga L. Zimina and Rushan M. Sabirov}, ' ... 
'year = {2019}, ' ...
'volume = {85}, ' ...
'pages = {287-299}, ' ...
'title = {Reproductive biology and ecology of the boreoatlantic armhook squid \emph{Gonatus fabricii} ({C}ephalopoda: {G}onatidae)}, ' ...
'journal = {Molluscan Studies}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Gonatus-fabricii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

