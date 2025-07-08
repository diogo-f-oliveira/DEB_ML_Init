function [data, auxData, metaData, txtData, weights] = mydata_Pareledone_aequipapillae
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Megaleledonidae';
metaData.species    = 'Pareledone_aequipapillae'; 
metaData.species_en = 'Antarctic octopus'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'L-Ww'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 25]; 

%% set data
% zero-variate data

data.am = 600;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'SchwHovi2019';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 0.3;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'SchwHovi2019';
  comment.Wwb = 'based on oocyte length 2-16 mm and assumed width 7 mm : pi/6*1.2*0.7^2';
data.Wwp  = 46;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'SchwHovi2019';
  comment.Wwp = 'based on first mating';
data.Wwi  = 90;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'SchwHovi2019';

data.Ni  = 40; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'SchwHovi2019';   
  temp.Ni = C2K(4);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
1.692	3.539
2.066	16.050
2.415	6.780
2.415	8.381
2.476	5.182
2.600	6.790
2.704	8.717
2.788	15.127
2.789	19.611
3.096	12.582
3.157	9.382
3.200	13.228
3.263	18.996
3.324	15.156
3.364	11.635
3.366	20.603
3.385	10.995
3.449	24.131
3.468	15.804
3.591	13.569
3.594	24.459
3.862	26.715
3.883	25.115
4.025	18.396
4.027	22.880
4.112	37.938
4.213	25.452
4.276	31.862
4.459	20.661
4.500	20.984
4.648	36.365
4.667	29.320
4.731	39.573
4.793	36.693
4.876	41.822
5.020	38.627
5.185	37.675
5.250	52.412
5.290	49.852
5.430	30.962
5.456	53.063
5.476	50.182
5.642	54.995
5.687	70.051
5.707	67.169
5.785	50.839
5.827	51.482
5.870	58.530
5.890	56.610
5.951	52.769
6.013	55.015
6.036	65.585
6.053	46.369
6.411	79.057];
units.LWw_f   = {'d', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'SchwHovi2019';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
2.126	5.483
2.126	9.007
2.270	6.772
2.661	4.551
2.703	7.116
2.827	8.083
2.828	11.927
3.139	17.388
3.157	8.421
3.262	17.715
3.345	19.321
3.367	22.845
3.446	10.038
3.490	20.610
3.491	23.492
3.591	13.569
3.593	20.295
3.616	30.225
3.675	16.456
3.675	17.737
3.717	21.262
3.757	16.460
3.882	20.951
3.883	27.677
3.924	23.515
3.985	21.597
4.028	28.005
4.150	20.645
4.150	22.567
4.152	29.293
4.256	35.704
4.274	22.573
4.316	27.700
4.358	30.265
4.381	40.515
4.398	23.861
4.441	33.472
4.460	26.747
4.484	38.919
4.506	46.927
4.545	36.360
4.546	41.485
4.605	28.356
4.734	49.181
4.752	41.175
4.772	34.771
4.791	30.928
4.793	39.576
4.810	22.922
4.811	27.726
4.833	35.094
4.836	45.664
4.836	47.585
4.874	30.933
4.896	37.019
4.959	45.350
4.977	31.579
5.017	25.816
5.080	32.545
5.103	39.593
5.124	43.757
5.190	62.978
5.203	29.028
5.206	41.520
5.288	38.001
5.309	41.525
5.313	59.141
5.352	47.613
5.431	34.165
5.432	36.087
5.437	58.827
5.556	38.015
5.558	45.702
5.582	63.319
5.708	73.895
5.759	24.254
6.035	61.742
6.356	109.802
6.385	57.277
6.991	90.939
7.868	50.310];
units.LWw_m   = {'d', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'SchwHovi2019';
comment.LWw_m = 'Data for males';

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
191.534	5.019
197.935	16.426
199.448	8.213
211.445	7.300
219.450	6.388
228.553	15.970
228.735	7.757
232.839	2.738
235.369	8.669
236.659	10.494
241.942	12.319
250.079	5.475
256.308	24.639
257.841	15.513
260.381	20.989
272.328	22.357
272.389	19.620
275.162	14.601
276.260	25.095
281.239	40.608
283.035	19.620
283.860	42.433
286.906	25.095
286.967	22.357
288.470	14.601
292.482	13.688
296.282	22.357
297.815	13.232
300.366	18.251
302.602	37.414
304.257	22.814
305.476	27.833
305.628	20.989
305.770	14.601
306.706	32.395
312.080	30.114
315.910	37.414
319.027	16.882
320.125	27.376
321.183	39.696
323.915	36.502
326.455	41.977
328.414	13.688
330.407	43.802
330.549	37.414
330.721	29.658
334.501	39.240
334.784	26.464
336.788	56.122
337.507	23.726
338.898	20.989
341.266	34.221
341.408	27.833
343.533	52.015
344.743	57.490
345.319	31.483
345.380	28.745
347.769	41.065
349.251	34.221
349.362	29.202
349.985	61.141
353.092	41.065
355.905	34.221
356.097	25.551
356.138	23.726
356.922	48.365
358.465	38.783
360.029	28.289
360.161	22.357
363.789	38.783
365.534	20.076
366.400	41.065
366.582	32.852
370.341	43.346
370.503	36.046
373.084	39.696
374.759	24.183
375.806	36.958
377.370	26.464
377.765	8.669
379.687	41.977
384.115	22.357
391.725	39.240
394.225	46.540
394.276	44.259
395.859	32.852
401.051	38.783
402.250	44.715
403.389	53.384
403.571	45.171
405.054	38.327
408.358	69.354
408.783	50.190
409.127	34.677
410.286	42.433
411.080	66.616
411.151	63.422
411.869	31.027
418.311	40.608
419.449	49.278
422.546	29.658
423.594	42.433
431.568	42.890
431.619	40.608
440.378	65.703
442.660	22.814
443.100	62.966
467.166	57.947
486.283	36.046
504.600	50.190
515.399	43.346
518.338	90.798
538.275	31.939
596.375	52.471];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(4);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'SchwHovi2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'time-weight data assumes that growth increments of beaks are daily, which is speculative for cold-water species (SchwHovi2019)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4DKK9'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3088871'; % Ency of Life
metaData.links.id_Wiki = 'Pareledone'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3974276'; % Taxonomicon
metaData.links.id_WoRMS = '325325'; % WoRMS
metaData.links.id_molluscabase = '325325'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Muusoctopus}}';
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
bibkey = 'SchwHovi2019'; type = 'article'; bib = [ ... 
'doi = {10.1371/journal.pone.0219694}, ' ...
'author = {Richard Schwarz and Henk-Jan Hoving and Christoph Noever and Uwe Piatkowski}, ' ... 
'year = {2019}, ' ...
'title = {Life histories of Antarctic incirrate octopods (Cephalopoda: Octopoda)}, ' ...
'journal = {Plos One}, ' ...
'volume = {14(7)}, ' ...
'pages = {e0219694}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Muusoctopus-rigbyae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

