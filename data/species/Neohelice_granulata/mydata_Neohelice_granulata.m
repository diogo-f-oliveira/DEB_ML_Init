function [data, auxData, metaData, txtData, weights] = mydata_Neohelice_granulata

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Varunidae';
metaData.species    = 'Neohelice_granulata'; 
metaData.species_en = 'Crab'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0bMr', 'bjMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wdb'}; 
metaData.data_1     = {'t-L';'t-Wd';'L-N';'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 07]; 

%% set data
% zero-variate data

data.ab = 28.9;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'GrecRodr1999';   
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'geuss';   
  temp.am = C2K(21);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'carapace width at puberty for females'; bibkey.Lp  = 'AngeIsma1997';
data.Li  = 3.1;     units.Li  = 'cm';  label.Li  = 'ultimate carapace width for females'; bibkey.Li  = 'LuppSpiv2004';

data.Wdb = 8.4e-6;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';       bibkey.Wdb = 'AngeIsma1997';

 
% uni-variate data
% time-length data
data.tL_f = [ ... % time (d), carapace width (cm)
0.000	0.131
4.878	0.161
9.756	0.202
17.073	0.232
26.829	0.286
29.268	0.327
29.268	0.315
29.268	0.256
41.463	0.405
48.780	0.333
53.659	0.357
68.293	0.434
68.293	0.410
80.488	0.470
107.317	0.458
109.756	0.494
119.512	0.517
129.268	0.511
134.146	0.499
143.902	0.577
146.341	0.642
148.780	0.535
151.220	0.696
160.976	0.696
163.415	0.612
165.854	0.791
165.854	0.827
165.854	0.642
178.049	0.720
185.366	0.761
195.122	0.660
204.878	0.886
204.878	0.922
204.878	0.981
214.634	0.821
221.951	1.023
221.951	1.088
231.707	0.856
243.902	1.118
246.341	1.118
263.415	1.082
263.415	0.928
268.293	1.136
270.732	1.201
273.171	1.255
282.927	1.029
287.805	1.320
302.439	1.201
321.951	1.499
321.951	1.320
326.829	1.463
343.902	1.528
373.171	1.487
373.171	1.397
407.317	1.689
448.780	1.760
448.780	1.695
504.878	1.825
526.829	2.057
543.902	1.748
580.488	1.772
600.000	2.129
609.756	2.218
612.195	1.843
663.415	2.069
731.707	2.158
765.854	2.342
792.683	2.390
809.756	2.318
809.756	2.402
875.610	2.342
878.049	2.502
946.341	2.597
980.488	2.550
987.805	2.460
1082.927	2.579
1160.976	2.799
1239.024	2.697
1351.220	2.786
1492.683	2.994]; 
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'carapace width', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LuppSpiv2004';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time (d), carapace width (cm)
2.439	0.137
7.317	0.161
9.756	0.232
9.756	0.208
9.756	0.196
31.707	0.297
31.707	0.274
46.341	0.321
48.780	0.422
48.780	0.381
70.732	0.410
73.171	0.464
87.805	0.470
92.683	0.607
92.683	0.506
117.073	0.571
119.512	0.511
134.146	0.624
134.146	0.571
136.585	0.547
146.341	0.672
146.341	0.577
158.537	0.720
158.537	0.612
163.415	0.672
173.171	0.714
175.610	0.791
182.927	0.880
182.927	0.761
185.366	0.630
187.805	0.969
190.244	1.047
192.683	0.785
195.122	0.868
197.561	0.725
204.878	0.773
207.317	0.922
209.756	0.886
214.634	0.963
219.512	0.940
231.707	1.071
231.707	1.029
231.707	0.856
243.902	1.100
248.780	1.172
253.659	1.076
256.098	1.142
258.537	1.219
270.732	1.308
270.732	1.279
270.732	1.142
275.610	1.052
280.488	1.368
282.927	1.296
282.927	1.261
292.683	1.308
302.439	1.421
304.878	1.463
309.756	1.487
309.756	1.534
312.195	1.421
314.634	1.314
319.512	1.344
321.951	1.374
321.951	1.356
324.390	1.314
336.585	1.463
341.463	1.499
341.463	1.469
341.463	1.427
346.341	1.540
358.537	1.433
365.854	1.546
368.293	1.504
380.488	1.606
380.488	1.451
387.805	1.409
392.683	1.582
392.683	1.617
397.561	1.671
397.561	1.451
407.317	1.486
409.756	1.635
409.756	1.546
419.512	1.725
421.951	1.689
429.268	1.552
456.098	1.653
460.976	1.712
460.976	1.677
480.488	1.546
480.488	1.647
480.488	1.760
480.488	1.796
492.683	1.558
514.634	1.849
514.634	1.891
526.829	1.724
536.585	2.004
536.585	1.676
539.024	1.819
543.902	1.849
546.341	1.920
563.415	1.855
573.171	1.998
575.610	1.938
585.366	1.736
587.805	1.652
592.683	1.843
604.878	1.867
604.878	1.962
607.317	1.593
612.195	1.920
621.951	2.021
629.268	2.105
629.268	2.027
634.146	2.081
634.146	1.950
643.902	2.027
651.220	1.974
651.220	1.962
653.659	2.033
653.659	2.069
682.927	2.104
682.927	2.212
719.512	1.961
739.024	2.217
751.220	2.295
751.220	2.259
763.415	2.354
763.415	2.164
763.415	2.110
770.732	2.336
770.732	2.247
770.732	2.164
778.049	2.378
778.049	2.199
782.927	2.223
834.146	2.336
834.146	2.104
836.585	2.163
839.024	2.294
841.463	2.497
846.341	2.128
875.610	2.366
890.244	2.467
890.244	2.395
897.561	2.336
917.073	2.598
924.390	2.562
934.146	2.556
936.585	2.520
936.585	2.413
946.341	2.609
951.220	2.461
951.220	2.365
978.049	2.347
995.122	2.431
995.122	2.460
1000.000	2.538
1051.220	2.335
1073.171	2.537
1073.171	2.496
1075.610	2.716
1082.927	2.603
1090.244	2.531
1131.707	2.466
1134.146	2.745
1143.902	2.626
1148.780	2.698
1151.220	2.591
1165.854	2.412
1175.610	2.674
1185.366	2.644
1190.244	2.751
1212.195	2.674
1256.098	2.632]; 
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'carapace width', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LuppSpiv2004';
comment.tL_m = 'Data for males';

% time-weight
data.tWZI = [ ... % time since birth (d), dry weight (mug)
0.015	8.382
1.010	11.591
2.017	13.093
2.992	14.413
4.006	16.005];
units.tWZI   = {'d', 'mug'};  label.tWZI = {'time since birth', 'dry weight', 'Zoea I'};  
temp.tWZI    = C2K(18);  units.temp.tWZI = 'K'; label.temp.tWZI = 'temperature';
bibkey.tWZI = 'AngeIsma1997';
comment.tWZI = 'Zoea I';
%
data.tWZII = [ ... % time since zoea I (d), dry weight (mug)
0.000	21.622
1.006	24.424
1.997	26.967
3.011	29.088
4.026	30.139];
data.tWZII(:,1) = data.tWZII(:,1) + 5;
units.tWZII   = {'d', 'mug'};  label.tWZII = {'time since birth', 'dry weight', 'Zoea II'};  
temp.tWZII    = C2K(18);  units.temp.tWZII = 'K'; label.temp.tWZII = 'temperature';
bibkey.tWZII = 'AngeIsma1997';
comment.tWZII = 'Zoea II';
%
data.tWZIII = [ ... % time since zoea II (d), dry weight (mug)
0.000	33.267
1.003	42.838
2.026	49.045
3.000	50.594
4.013	56.800
5.026	63.995];
data.tWZIII(:,1) = data.tWZIII(:,1) + 10;
units.tWZIII   = {'d', 'mug'};  label.tWZIII = {'time since birth', 'dry weight', 'Zoea III'};  
temp.tWZIII    = C2K(18);  units.temp.tWZIII = 'K'; label.temp.tWZIII = 'temperature';
bibkey.tWZIII = 'AngeIsma1997';
comment.tWZIII = 'Zoea III';
%
data.tWZIV = [ ... % time since zoea III (d), dry weight (mug)
0.009	76.936
1.015	92.949
1.987	108.734
3.026	123.640
4.002	127.392
5.038	136.058
6.037	140.483];
data.tWZIV(:,1) = data.tWZIV(:,1) + 16;
units.tWZIV   = {'d', 'mug'};  label.tWZIV = {'time since birth', 'dry weight', 'Zoea IV'};  
temp.tWZIV    = C2K(18);  units.temp.tWZIV = 'K'; label.temp.tWZIV = 'temperature';
bibkey.tWZIV = 'AngeIsma1997';
comment.tWZIV = 'Zoea IV';
%
data.tWM = [ ... % time since zoea IV (d), dry weight (mug)
0.000	141.045
1.007	183.542
2.014	186.238
4.028	225.213
6.042	277.247
8.035	258.382
9.986	315.379
12.000	269.776];
data.tWM(:,1) = data.tWM(:,1) + 23;
units.tWM   = {'d', 'mug'};  label.tWM = {'time since birth', 'dry weight', 'Megalopa'};  
temp.tWM    = C2K(18);  units.temp.tWM = 'K'; label.temp.tWM = 'temperature';
bibkey.tWM = 'AngeIsma1997';
comment.tWM = 'Megalopa';
%
data.tWCI = [ ... % time since megalopa (d), dry weight (mug)
0.000	276.236
0.990	312.371
2.008	344.559
3.993	428.709
5.992	437.620
6.972	461.867];
data.tWCI(:,1) = data.tWCI(:,1) + 36;
units.tWCI   = {'d', 'mug'};  label.tWCI = {'time since birth', 'dry weight', 'Crab I'};  
temp.tWCI    = C2K(18);  units.temp.tWCI = 'K'; label.temp.tWCI = 'temperature';
bibkey.tWCI = 'AngeIsma1997';
comment.tWCI = 'Crab I';

% length-fecundity
data.LN = [ ... % carapace width (cm), log10 fecundity (#)
2.128	3.350
2.175	3.346
2.270	3.495
2.316	3.317
2.348	3.567
2.385	3.393
2.454	3.585
2.530	3.752
2.570	3.588
2.584	3.509
2.656	3.802
2.667	3.879
2.679	3.846
2.693	3.643
2.711	3.780
2.715	3.813
2.718	3.868
2.730	3.886
2.748	3.842
2.793	3.675
2.816	3.936
2.830	3.751
2.830	3.842
2.890	3.969
2.905	3.780
2.921	3.910
3.059	3.964
3.118	4.099];
data.LN(:,2) = 4* 10.^(data.LN(:,2)); % remove log transformation
units.LN   = {'cm', '#'};  label.LN = {'carapace width', 'fecundity'};  
temp.LN    = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BasSpiv2007';
comment.LN = '4 litters per yr assumed';

% length-weight
data.LW_f = [ ... % carapace width (cm), dry weight (g)
0.971	0.149
1.398	0.401
2.144	1.523
2.156	0.788
2.266	2.920
2.294	2.876
2.306	1.979
2.313	0.994
2.370	2.009
2.426	1.892
2.426	2.054
2.451	2.010
2.455	2.186
2.475	2.495
2.483	2.245
2.499	2.319
2.499	2.480
2.512	2.701
2.512	2.819
2.532	2.510
2.539	2.348
2.547	2.201
2.548	2.466
2.551	2.128
2.575	1.466
2.576	2.348
2.580	2.701
2.583	1.951
2.592	2.319
2.596	2.598
2.604	1.951
2.604	2.113
2.608	2.981
2.617	3.290
2.624	2.657
2.625	2.922
2.632	2.819
2.644	2.231
2.645	2.996
2.645	3.231
2.660	2.466
2.664	2.393
2.669	3.114
2.677	2.761
2.677	3.290
2.688	2.290
2.697	3.173
2.705	2.820
2.709	2.496
2.720	1.526
2.721	2.599
2.733	2.173
2.737	2.879
2.737	2.996
2.741	2.070
2.742	3.320
2.749	2.643
2.757	2.879
2.761	2.996
2.769	2.482
2.773	2.614
2.781	1.805
2.782	3.438
2.785	2.261
2.790	2.805
2.790	2.996
2.794	3.173
2.805	2.585
2.806	3.247
2.810	3.129
2.821	1.526
2.822	2.953
2.822	3.585
2.827	4.100
2.830	3.056
2.830	3.394
2.837	1.894
2.838	2.482
2.842	3.467
2.843	3.953
2.850	2.938
2.850	3.276
2.850	3.526
2.855	4.409
2.862	3.085
2.870	2.894
2.871	3.629
2.871	3.923
2.887	3.468
2.887	3.585
2.907	3.247
2.927	3.380
2.951	3.350
2.972	3.850
2.974	2.483
2.983	3.247
2.991	2.762
2.999	3.130
3.000	4.174
3.004	3.953
3.008	4.262
3.024	3.806
3.052	3.542
3.056	4.277
3.060	3.983
3.080	3.733
3.095	2.704
3.108	3.601
3.129	4.145
3.129	4.292
3.153	4.21];
units.LW_f   = {'cm', '#'};  label.LW_f = {'carapace width', 'dry weight', 'female'};  
bibkey.LW_f = 'CesaArme2007';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % carapace width (cm), dry weight (g)
0.962	0.150
1.063	0.150
1.832	0.922
1.871	0.648
2.473	2.942
2.511	2.568
2.516	3.341
2.560	3.540
2.602	2.618
2.679	3.042
2.728	4.114
2.757	3.391
2.800	2.817
2.805	3.266
2.814	3.715
2.829	3.366
2.839	4.089
2.843	3.316
2.863	4.712
2.863	5.061
2.877	4.238
2.883	5.659
2.897	4.637
2.921	4.313
2.921	5.061
2.945	4.512
2.955	5.186
2.974	4.911
3.022	5.235
3.036	4.837
3.061	5.884
3.070	5.136
3.075	4.737
3.124	6.507
3.142	4.413
3.152	5.884
3.175	3.964
3.181	6.432
3.225	6.332
3.273	7.280];
units.LW_m   = {'cm', '#'};  label.LW_m = {'carapace width', 'dry weight', 'male'};  
bibkey.LW_m = 'CesaArme2007';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Wdb = 5 * weights.Wdb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 8 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWCI','tWM','tWZIV','tWZIII','tWZII','tWZI'}; subtitle2 = {'Data for crab I, megalopa, zoea IV, III, II, I'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'After a short protozoea stage, 4 zoea stages occur before metamorphosing into the megalopa';
metaData.bibkey.F1 = 'AngeIsma1997'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '46J5D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46511701'; % Ency of Life
metaData.links.id_Wiki = 'Neohelice_granulata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3914350'; % Taxonomicon
metaData.links.id_WoRMS = '444742'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neohelice_granulata}}';
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
bibkey = 'LuppSpiv2002'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10152-001-0088-5}, ' ...
'author = {T. A. Luppi and E. D. Spivak and K. Anger}, ' ... 
'year = {2002}, ' ...
'title = {Postsettlement growth of two estuarine crab species, \emph{Chasmagnathus granulata} and \emph{Cyrtograpsus angulatus} ({C}rustacea, {D}ecapoda, {G}rapsidae): laboratory and field investigations}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {55}, ' ...
'pages = {293-305}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LuppSpiv2004'; type = 'Article'; bib = [ ... 
'author = {T. A. Luppi and, E. D. Spivak and C. C. Bas and K. Anger}, ' ... 
'year = {2004}, ' ...
'title = {Molt and growth of an estuarine crab, \emph{Chasmagnathus granulatus} ({B}rachyura: {V}arunidae), in {M}ar {C}hiquita coastal lagoon, {A}rgentina}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {20}, ' ...
'pages = {333-344}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GrecRodr1999'; type = 'Article'; bib = [ ... 
'author = {Laura S. L\''{o}pez Greco and Enrique M. Rodr\''{i}guez}, ' ... 
'year = {1999}, ' ...
'title = {Annual reproduction and grwoth of adult crabs \emph{Chasmagnathus granulata} ({c}rustacea, {B}rachyura, {G}rapsidae)}, ' ...
'journal = {Cah. Biol. Mar.}, ' ...
'volume = {40}, ' ...
'pages = {155-164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AngeIsma1997'; type = 'Article'; bib = [ ... 
'author = {K. Anger and D. Ismael}, ' ... 
'year = {1997}, ' ...
'title = {Growth and elemental composition ({C}, {N}, {H}) in larvae and early juveniles of a {S}outh {A}merican salt marsh crab, \emph{Chasmagnathus granulata} ({D}ecapoda: {G}rapsidae)}, ' ...
'journal = {Mangroves and Salt Marshes}, ' ...
'volume = {1}, ' ...
'pages = {219-227}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BasSpiv2007'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10152-007-0070-y}, ' ...
'author = {Claudia C. Bas and Eduardo D. Spivak and Klaus Anger}, ' ... 
'year = {2007}, ' ...
'title = {Seasonal and interpopulational variability in fecundity, egg size, and elemental composition ({C}{H}{N}) of eggs and larvae in a grapsoid crab, \emph{Chasmagnathus granulatus}}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {61}, ' ...
'pages = {225-237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CesaArme2007'; type = 'Article'; bib = [ ... 
'author = {C\''{e}sar, I. I. and Armend\''{a}riz, L. C. }, ' ... 
'year = {2007}, ' ...
'title = {Secondary production of \emph{Chasmagnathus granulatus} ({C}rustacea; {D}ecapoda) in a {R}amsar {S}ite from {A}rgentina}, ' ...
'journal = {Braz. J. Biol}, ' ...
'volume = {67}, ' ...
'pages = {235-241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
