  function [data, auxData, metaData, txtData, weights] = mydata_Schizothorax_oconnori
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Schizothorax_oconnori'; 
metaData.species_en = 'Snowtrout'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 16];

%% set data
% zero-variate data
data.am = 50*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'MaXie2010';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 38.9;    units.Lp = 'cm'; label.Lp = 'std length at puberty for females'; bibkey.Lp = 'MaXie2012'; 
data.Lpm = 30.4;    units.Lpm = 'cm'; label.Lpm = 'std length at puberty for males'; bibkey.Lpm = 'MaXie2012'; 
data.Li = 57;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'MaXie2010';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Shodhganga';
  comment.Wwb = 'value for Schizothorax richardsonii: based egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwi = 2350;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^2.97, see F1';
    
data.Ri  = 39343/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MaXie2012';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
    3 17.90 17.80
    4 19.68 21.88
    5 24.30 24.43
    6 27.44 27.24 
    7 30.42 29.24
    8 33.62 32.24
    9 36.66 34.06
   10 39.60 35.34
   11 41.72 36.04
   12 42.56 37.54
   13 44.22 38.03
   14 43.86 39.46
   15 43.03 39.18
   16 44.68 39.93
   17 46.10 39.95
   18 46.55 40.17
   19 45.16 41.10
   20 46.41 40.50
   21 45.30 40.58
   22 47.13 40.60
   23 45.60 40.95
   24 46.35 39.94
   25 45.49 38.65
   26 45.43 39.80
   27 47.42 41.13
   28 47.75 39.93
   29 44.94 NaN
   30 46.72 44.40
   31 46.00 NaN
   32 46.40 45.40 
   33 46.35 43.10
   34 46.37 NaN 
   35 46.66 NaN 
   36 47.65 NaN
   37 44.75 NaN
   38 45.70 NaN
   39 NaN   40.20
   40 44.80 42.20
   42 45.70 NaN
   49 47.90 NaN
   50 48.00 NaN];
data.tL_fm(:,1) = 365 * (0.9+data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm = C2K(12);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'MaXie2010';

% length-weight
data.LW_f = [ ... % std length (cm), weight (g)
35.179	22.761
41.023	17.334
41.754	17.347
62.953	28.808
67.325	1.214
72.465	51.124
75.375	23.502
78.298	23.556
82.680	18.102
85.606	23.691
88.527	18.210
90.727	34.856
93.642	18.304
100.959	35.044
107.531	24.095
112.655	40.795
115.583	51.919
117.781	63.030
121.419	29.887
127.268	35.530
133.120	46.708
136.049	57.832
141.901	69.010
145.547	52.472
149.220	91.286
155.053	63.718
164.554	63.893
164.578	113.709
169.678	80.593
172.604	86.182
179.912	86.317
183.577	108.524
190.877	92.054
193.814	119.784
197.479	141.991
198.948	158.623
201.861	136.537
206.259	164.294
210.636	147.769
212.125	203.147
213.554	136.753
221.612	175.647
223.818	203.363
227.453	164.685
234.036	175.876
236.973	203.606
243.539	181.587
245.033	248.035
245.740	198.232
250.157	264.735
252.350	264.775
255.246	209.478
256.748	292.531
261.125	276.007
263.369	381.214
265.496	248.412
266.998	331.466
269.161	270.620
275.021	298.404
275.795	386.979
280.838	237.625
280.887	337.257
283.055	287.482
283.780	276.425
291.145	392.797
293.389	498.004
294.090	437.132
294.090	437.132
298.448	381.862
302.156	492.631
302.846	409.618
304.286	365.364
307.237	420.769
310.168	437.428
310.915	470.652
312.336	387.653
316.047	503.957
317.482	448.633
320.416	470.828
324.868	609.286
325.518	443.247
326.966	415.598
331.389	493.170
332.133	520.859
336.551	587.362
338.042	648.275
338.692	482.235
339.541	725.793
341.645	543.175
341.683	620.667
345.377	703.761
347.553	670.590
349.686	548.859
349.727	631.885
353.362	593.207
354.166	742.668
357.043	648.625
358.524	687.398
360.002	720.636
362.963	798.181
363.596	598.931
363.621	648.747
368.022	682.038
370.953	698.697
371.004	803.864
371.021	837.075
372.434	737.470
373.960	870.340
376.821	743.086
378.369	920.237
379.046	809.548
381.951	770.856
381.994	859.418
383.369	682.321
383.399	743.208
388.587	892.750
388.628	975.776
390.726	782.088
391.414	693.540
392.314	1042.265
392.945	837.480
394.455	937.138
396.621	881.828
400.226	782.263
400.310	953.852
401.092	1059.032
402.530	1009.243
403.980	987.130
405.361	821.103
407.608	931.846
407.656	1031.478
409.153	1103.461
411.370	1153.318
411.949	843.365
411.971	887.646
412.019	987.278
414.252	1070.345
414.287	1142.301
417.165	1048.259
418.734	1269.690
422.415	1325.108
423.224	1485.640
423.726	1015.169
424.497	1098.209
424.689	1491.202
425.940	1059.491
427.367	987.561
427.475	1208.965
428.187	1170.233
430.339	1087.247
430.446	1308.651
431.234	1424.902
431.895	1281.003
433.289	1142.652
433.974	1048.569
434.775	1192.495
434.850	1347.478
435.597	1380.702
436.876	1004.342
439.912	1236.870
439.936	1286.686
442.914	1397.442
442.922	1414.048
443.078	1735.084
443.690	1491.552
444.971	1120.727
444.990	1159.473
445.734	1187.162
446.495	1248.062
446.570	1403.045
447.369	1541.436
448.005	1347.720
448.828	1535.928
450.092	1131.892
450.235	1425.253
451.541	1104.243
452.358	1281.380
452.571	1718.653
453.091	1286.929
453.684	1004.652
453.887	1419.785
454.086	1829.383
454.671	1530.500
455.308	1336.785
455.429	1585.865
455.518	1768.523
455.974	1203.956
457.730	1807.310
458.307	1491.822
459.116	1652.354
459.674	1298.120
461.136	1298.147
461.910	1386.722
463.463	1574.943
464.097	1375.693
464.811	1342.495
464.981	1691.207
465.850	1973.511
466.405	1613.743
468.560	1536.292
468.651	1724.485
469.140	1226.339
469.229	1408.998
470.733	1497.586
471.359	1281.731
472.262	1635.991
472.840	1320.503
473.808	1807.606
475.054	1364.825
476.696	1735.704
477.354	1586.269
479.476	1442.397
481.070	1713.644
481.693	1492.254
481.725	1558.675
483.149	1481.210
483.174	1531.026
484.082	1896.357
486.342	2034.775
488.346	1647.358
488.462	1885.367
489.114	1724.863
489.697	1420.446
489.864	1763.622
489.878	1791.298
492.682	1547.807
492.917	2029.361
493.440	1603.171
494.295	1857.800
495.082	1974.050
498.596	1686.292
499.389	1813.613
500.204	1985.215
502.321	1830.272
504.354	1503.742
507.444	1846.972
508.235	1968.758
509.739	2057.347
511.347	2356.269
513.304	1874.756
513.806	2904.285
514.753	1847.107
516.999	1957.850
520.057	2234.659
524.019	2865.728
525.828	2079.784
528.139	2323.369
531.171	2544.827
538.454	2495.146
554.783	3010.207
563.370	2633.982];
data.LW_f(:,1) = data.LW_f(:,1)/10; % convert mm to cm
units.LW_f = {'cm', 'g'}; label.LW_f = {'std length', 'wet weight', 'females'};  
bibkey.LW_f = 'MaXie2010';
%
data.LW_m = [ ... % std length (mm), weight (g)
230.387	186.879
237.738	275.576
242.080	187.095
254.531	242.675
257.473	281.474
261.090	204.051
267.735	342.549
277.958	326.133
278.012	436.835
280.846	254.231
288.179	304.182
293.311	337.486
296.269	409.497
305.098	531.431
311.608	393.174
317.493	470.774
325.526	459.852
327.036	559.511
328.509	581.678
332.864	520.873
336.499	482.194
345.377	703.761
346.734	487.919
357.092	748.257
360.770	798.141
362.135	598.904
365.206	903.388
366.485	527.028
366.566	693.081
373.227	864.791
373.895	737.497
376.252	1075.179
376.953	1014.306
379.755	765.280
381.177	682.281
387.945	1075.395
389.264	782.061
391.381	627.119
392.905	754.453
393.824	1141.924
395.165	892.871
395.936	975.911
400.191	710.307
401.823	1059.046
406.861	898.622
408.387	1031.491
414.366	1302.819
415.639	915.389
421.582	1114.761
422.359	1208.871
424.457	1015.183
430.463	1341.862
435.479	1137.157
437.703	1203.619
439.197	1270.067
439.963	1342.037
445.883	1491.593
448.040	1419.677
448.892	1668.770
450.187	1325.621
452.363	1292.450
459.698	1347.936
460.499	1491.863
470.062	1619.345
470.701	1431.165
471.497	1564.021
482.486	1619.574];
data.LW_m(:,1) = data.LW_m(:,1)/10; % convert mm to cm
units.LW_m = {'cm', 'g'}; label.LW_m = {'std length', 'wet weight', 'males'};  
bibkey.LW_m = 'MaXie2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 2 * weights.tL_fm;
weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79WNC'; % Cat of Life
metaData.links.id_ITIS = '690075'; % ITIS
metaData.links.id_EoL = '46581731'; % Ency of Life
metaData.links.id_Wiki = 'Schizothorax_oconnori'; % Wikipedia
metaData.links.id_ADW = 'Schizothorax_oconnori'; % ADW
metaData.links.id_Taxo = '186968'; % Taxonomicon
metaData.links.id_WoRMS = '1017625'; % WoRMS
metaData.links.id_fishbase = 'Schizothorax-oconnori'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Schizothorax_oconnori}}';  
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
bibkey = 'MaXie2012'; type = 'article'; bib = [ ...  
'author = {Bao-Shan Ma and Cong-Xin Xie and Bin Huo and Xue-Feng Yang and Shui-Song Chen}, ' ...
'year = {2012}, ' ...
'title = {Reproductive Biology of \emph{Schizothorax o''connori} ({C}yprinidae: {S}chizothoracinae) in the {Y}arlung {Z}angbo {R}iver, {T}ibet}, ' ... 
'journal = {Zoological Studies}, ' ...
'volume = {51(7)}, '...
'pages = {1066-1076}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaXie2010'; type = 'article'; bib = [ ...  
'author = {Bao-Shan Ma and Cong-Xin Xie and Bin Huo and Xue-Feng Yang and Hai-Ping Huang}, ' ...
'year = {2010}, ' ...
'title = {Age and Growth of a Long-Lived Fish \emph{Schizothorax o''connori} in the {Y}arlung {T}sangpo {R}iver, {T}ibet}, ' ... 
'journal = {Zoological Studies}, ' ...
'volume = {49(6)}, '...
'pages = {749-759}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Schizothorax-oconnori.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shodhganga'; type = 'Misc'; bib = ...
'howpublished = {\url{http://shodhganga.inflibnet.ac.in/bitstream/10603/68389/14/14_chapter 7.pdf}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

