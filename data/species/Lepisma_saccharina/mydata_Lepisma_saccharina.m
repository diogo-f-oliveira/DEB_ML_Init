function [data, auxData, metaData, txtData, weights] = mydata_Lepisma_saccharina

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Thysanura'; 
metaData.family     = 'Lepismatidae';
metaData.species    = 'Lepisma_saccharina'; 
metaData.species_en = 'Silverfish'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TA', 'TP'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'Ww-JO'; 'T-JO'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 10 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 17];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 17]; 

%% set data
% zero-variate data

data.ab = 43;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'urban';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2.5*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.08;   units.L0  = 'cm';  label.Lb  = 'length of oval egg';   bibkey.Lb  = '';
data.Lb  = 0.2;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.6;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki';
data.Li  = 1.2;      units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 0.28;     units.Wwb = 'mg';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'DeVrAppe2013';
data.Wwp = 7;        units.Wwp = 'mg';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'DeVrAppe2013';
data.Wwi = 48.09;    units.Wwi = 'mg';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'DeVrAppe2013';

data.Ni  = 100;      units.Ni  = '#/d'; label.Ni  = 'total # of eggs';         bibkey.Ni  = 'Wiki';   
  temp.Ni = C2K(20); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% W-J_O data from DeVrAppe2013, fig 2 for adults
data.WJO_ad = [ ... % wet weight (g), O_2 consumption (ml/h)
0.00709	0.00178
0.00711	0.00128
0.00721	0.00197
0.00770	0.00134
0.00794	0.00260
0.00795	0.00305
0.00806	0.00220
0.00808	0.00169
0.00820	0.00126
0.00840	0.00183
0.00862	0.00211
0.00892	0.00117
0.00918	0.00160
0.00922	0.00245
0.00929	0.00291
0.00941	0.00137
0.00971	0.00167
0.00987	0.00188
0.00992	0.00326
0.00999	0.00285
0.01009	0.00179
0.01058	0.00345
0.01059	0.00238
0.01060	0.00194
0.01066	0.00296
0.01072	0.00138
0.01074	0.00319
0.01075	0.00144
0.01092	0.00309
0.01093	0.00241
0.01106	0.00208
0.01117	0.00234
0.01122	0.00266
0.01125	0.00185
0.01136	0.00273
0.01137	0.00248
0.01148	0.00137
0.01167	0.00220
0.01175	0.00323
0.01178	0.00206
0.01186	0.00248
0.01192	0.00276
0.01193	0.00162
0.01200	0.00404
0.01215	0.00338
0.01230	0.00240
0.01231	0.00189
0.01235	0.00413
0.01245	0.00391
0.01246	0.00234
0.01277	0.00302
0.01279	0.00287
0.01310	0.00180
0.01362	0.00253
0.01378	0.00362
0.01388	0.00375
0.01499	0.00387
0.01521	0.00452
0.01632	0.00468
0.01644	0.00322
0.01680	0.00353
0.01730	0.00394
0.01759	0.00373
0.01764	0.00340
0.01768	0.00397
0.01785	0.00417
0.01847	0.00291
0.01865	0.00320
0.01869	0.00359
0.01905	0.00439
0.01914	0.00468
0.01933	0.00352
0.01961	0.00400
0.01971	0.00339
0.01994	0.00520
0.02015	0.00359
0.02019	0.00389
0.02039	0.00378
0.02040	0.00444
0.02048	0.00522
0.02049	0.00404
0.02079	0.00336
0.02134	0.00518
0.02135	0.00413
0.02139	0.00574
0.02155	0.00459
0.02224	0.00520
0.02229	0.00473
0.02234	0.00551
0.02236	0.00308
0.02257	0.00359
0.02258	0.00319
0.02273	0.00452
0.02317	0.00516
0.02329	0.00375
0.02334	0.00501
0.02456	0.00492
0.02522	0.00478
0.02540	0.00526
0.02572	0.00413
0.02578	0.00378
0.02603	0.00494
0.02609	0.00613
0.02622	0.00512
0.02646	0.00659
0.02653	0.00565
0.02654	0.00489
0.02660	0.00454
0.02693	0.00422
0.02698	0.00490
0.02699	0.00541
0.02752	0.00389
0.02766	0.00410
0.02779	0.00474
0.02785	0.00496
0.02791	0.00722
0.02792	0.00561
0.02811	0.00791
0.02819	0.00524
0.02839	0.00561
0.02854	0.00430
0.02860	0.00516
0.02866	0.00752
0.02874	0.00474
0.02880	0.00652
0.02888	0.00490
0.02889	0.00443
0.02901	0.00717
0.02908	0.00633
0.02916	0.00545
0.02924	0.00459
0.02929	0.00679
0.02951	0.00699
0.02972	0.00593
0.02973	0.00557
0.02980	0.00574
0.02987	0.00622
0.02988	0.00611
0.03010	0.00469
0.03084	0.00424
0.03096	0.00570
0.03097	0.00629
0.03098	0.00541
0.03099	0.00606
0.03100	0.00586
0.03119	0.00725
0.03120	0.00686
0.03128	0.00518
0.03134	0.00763
0.03142	0.00851
0.03205	0.00471
0.03219	0.00806
0.03220	0.00549
0.03235	0.00572
0.03236	0.00584
0.03243	0.00613
0.03250	0.00930
0.03306	0.00725
0.03354	0.00815
0.03355	0.00531
0.03356	0.00565
0.03371	0.00638
0.03372	0.00669
0.03395	0.00757
0.03402	0.01088
0.03403	0.00714
0.03454	0.00608
0.03480	0.00478
0.03487	0.00712
0.03528	0.00933
0.03529	0.00691
0.03547	0.00574
0.03564	0.00659
0.03624	0.00886
0.03660	0.00652
0.03796	0.00547
0.03813	0.00777
0.03841	0.00824
0.03868	0.00858
0.03869	0.00909
0.03955	0.00659
0.04161	0.00671
0.04809	0.01000];
units.WJO_ad   = {'g', 'ml/h'};  label.WJO_ad = {'wet weight', 'O_2 consumption'};  
temp.WJO_ad    = C2K(25);  units.temp.WJO_ad = 'K'; label.temp.WJO_ad = 'temperature';
bibkey.WJO_ad = 'DeVrAppe2013';
comment.WJO_ad = 'adults';
%
% W-J_O data from DeVrAppe2013, fig 5 for juveniles
data.WJO_juv = [ ... % wet weight (g), O_2 consumption (ml/h)
0.0002893	0.0002443
0.0003088	0.0000623
0.0003517	0.0001907
0.0003641	0.0002959
0.0003835	0.0003139
0.0003836	0.0000575
0.0004005	0.0001908
0.0004006	0.0002755
0.0004023	0.0001216
0.0004093	0.0002934
0.0004147	0.0000447
0.0004165	0.0003473
0.0004183	0.0001550
0.0004238	0.0000063
0.0004256	0.0001037
0.0004445	0.0003474
0.0004483	0.0004474
0.0004503	0.0003192
0.0004542	0.0000551
0.0004662	0.0001884
0.0004723	0.0003115
0.0004785	0.0003423
0.0004975	0.0002937
0.0005084	0.0004091
0.0005128	0.0003091
0.0005196	0.0002373
0.0005332	0.0002219
0.0005402	0.0002578
0.0005403	0.0003040
0.0005617	0.0003579
0.0005642	0.0003912
0.0005691	0.0004066
0.0005790	0.0001143
0.0006180	0.0004298
0.0006342	0.0004478
0.0006566	0.0003273
0.0006828	0.0002017
0.0006947	0.0004966
0.0007414	0.0003582
0.0007643	0.0005454
0.0010718	0.0006432
0.0012050	0.0004767
0.0012314	0.0004665
0.0013256	0.0004332
0.0014394	0.0005410
0.0014710	0.0005667
0.0015098	0.0005359
0.0015295	0.0005898
0.0016899	0.0007104
0.0017121	0.0008207
0.0017420	0.0008643
0.0017802	0.0008515
0.0017879	0.0007540
0.0017957	0.0007925
0.0018035	0.0007182
0.0018672	0.0008720
0.0018753	0.0007285
0.0018754	0.0007644
0.0019164	0.0007952
0.0019247	0.0008541
0.0019584	0.0006952
0.0019755	0.0008772
0.0020188	0.0007593
0.0020720	0.0005414
0.0020809	0.0008286
0.0020810	0.0006106
0.0020811	0.0008850
0.0021637	0.0006543
0.0021638	0.0008722
0.0021921	0.0009722
0.0021922	0.0006312
0.0023092	0.0008107
0.0023395	0.0007492
0.0023598	0.0008415
0.0023701	0.0007108
0.0024116	0.0006339
0.0024431	0.0008518
0.0024751	0.0009313
0.0025848	0.0008237
0.0026415	0.0010365
0.0028683	0.0009751
0.0032246	0.0008060
0.0033968	0.0009317
0.0034413	0.0009035
0.0035167	0.0010522
0.0035320	0.0010061
0.0036094	0.0009215
0.0036884	0.0009805
0.0036885	0.0007933
0.0037046	0.0010241
0.0037368	0.0009267
0.0038687	0.0010318
0.0038688	0.0011677
0.0038689	0.0009805
0.0039364	0.0009216
0.0039880	0.0009549
0.0040578	0.0008909
0.0041647	0.0009088
0.0041828	0.0009883
0.0043305	0.0008653
0.0043493	0.0009268
0.0043682	0.0009756
0.0044446	0.0010935
0.0045419	0.0009474
0.0045420	0.0011269
0.0045421	0.0008166
0.0045816	0.0008987
0.0046215	0.0009910
0.0047024	0.0010192
0.0047432	0.0011013
0.0047433	0.0009654
0.0047639	0.0009064
0.0051062	0.0011937
0.0052180	0.0009655
0.0052181	0.0010527
0.0052635	0.0012527
0.0052636	0.0011886
0.0053094	0.0010322
0.0053325	0.0009937
0.0054023	0.0012707
0.0054968	0.0009835
0.0055930	0.0010399
0.0056417	0.0010092
0.0057155	0.0010682
0.0057156	0.0012194
0.0057157	0.0012605
0.0058409	0.0011066
0.0059431	0.0012169
0.0062877	0.0010862
0.0063425	0.0012580
0.0064815	0.0011068
0.0066236	0.0012273
0.0067688	0.0013042
0.0070077	0.0009838];
units.WJO_juv   = {'g', 'ml/h'};  label.WJO_juv = {'wet weight', 'O_2 consumption'};  
temp.WJO_juv    = C2K(25);  units.temp.WJO_juv = 'K'; label.temp.WJO_juv = 'temperature';
bibkey.WJO_juv = 'DeVrAppe2013';
comment.WJO_juv = 'juveniles';

% temperature - specific respiration data
% T-j_O data from DeVrAppe2013, fig 1 for adults
data.TjO_ad = [ ... % tmeperature (C), specific O_2 consumption (ml/h.g)
10	0.0610
20	0.1591
25	0.2163
30	0.3220
40	0.5325];
units.TjO_ad  = {'C', 'ml/h.g'};  label.TjO_ad = {'temperature', 'specific O_2 consumption'};  
bibkey.TjO_ad = 'DeVrAppe2013';
comment.TjO_ad = 'adults';
% T-j_O data from DeVrAppe2013, fig 6 for juveniles
data.TjO_juv = [ ... % tmeperature (C), specific O_2 consumption (ml/h.g)
10	0.0499
20	0.1755
25	0.3222
30	0.4616
40	0.8319];
units.TjO_juv  = {'C', 'ml/h.g'};  label.TjO_juv = {'temperature', 'specific O_2 consumption'};  
bibkey.TjO_juv = 'DeVrAppe2013';
comment.TjO_juv = 'juveniles';

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
set1 = {'WJO_ad','WJO_juv'}; subtitle1 = {'Data for adults, juveniles'};
set2 = {'TjO_ad','TjO_juv'}; subtitle2 = {'Data for adults, juveniles'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'continue to moult during their whole life, more than 50 times';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Nymphs undergo six to seven molts';
metaData.bibkey.F2 = 'urban'; 
F3 = 'Thysanurans can survive prolonged periods of starvation';
metaData.bibkey.F3 = 'DeVrAppe2013'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present  2021/08/07
metaData.links.id_ITIS = '99222'; % ITIS
metaData.links.id_EoL = '1022755'; % Ency of Life
metaData.links.id_Wiki = 'Lepisma_saccharina'; % Wikipedia
metaData.links.id_ADW = 'Lepisma_saccharina'; % ADW
metaData.links.id_Taxo = '17302'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepisma_saccharina}}';
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
bibkey = 'DeVrAppe2013'; type = 'Article'; bib = [ ... 
'author = {Z. C. DeVries and A. G. Appel}, ' ... 
'year = {2013}, ' ...
'title = {Standard metabolic rates of \emph{Lepisma saccharina} and \emph{Thermobia domestica}: {E}ffects of temperature and mass}, ' ...
'journal = {Journal of Insect Physiology}, ' ...
'volume = {59}, ' ...
'pages = {638--645}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'urban'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.extento.hawaii.edu/kbase/urban/site/silverfish.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

