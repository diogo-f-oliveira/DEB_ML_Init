function [data, auxData, metaData, txtData, weights] = mydata_Arrhamphus_sclerolepis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Arrhamphus_sclerolepis'; 
metaData.species_en = 'Southeastern snub-nosed garfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 9*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'StewHugh2007';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'StewHugh2007'; 
  comment.Lp = 'based on tL data at ap = 1 yr';
data.Li  = 28.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'StewHugh2007';

data.Wwb = 4.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 86;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fisfbase';
  comment.Wwi = 'based on 0.00263*Li^3.12, see F1';

data.Ri = 2e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap  0.95, reflecting reported low fecundity';
 
% uni-variate data
% time-length
data.tL_f = [... % time since birth (d), fork length (cm)
38.078	12.654
78.686	8.508
87.960	8.889
352.486	20.939
411.109	14.774
411.161	15.047
411.631	17.502
411.914	18.974
420.152	13.956
420.414	15.320
420.560	16.083
420.905	17.883
434.037	14.392
434.445	16.519
439.725	20.065
439.808	20.501
458.209	20.501
461.231	12.264
462.851	20.719
462.925	21.101
462.946	21.210
471.895	19.901
476.820	21.591
476.861	21.810
476.893	21.973
587.383	22.408
587.519	23.117
587.603	23.553
587.770	24.426
591.827	21.589
633.156	21.207
633.313	22.025
646.654	19.625
674.726	22.079
679.441	22.679
688.307	20.933
688.474	21.806
698.041	23.715
698.198	24.533
702.924	25.187
707.116	23.060
715.606	19.351
715.689	19.787
716.108	21.969
716.411	23.551
720.154	19.078
720.781	22.351
720.833	22.623
721.063	23.823
724.984	20.278
725.423	22.569
729.668	20.714
734.331	21.041
734.404	21.423
734.676	22.841
734.760	23.278
739.496	23.987
739.580	24.423
748.550	23.223
757.448	21.641
789.566	21.204
803.388	21.313
807.894	20.822
808.322	23.058
812.400	20.331
817.283	21.804
817.293	21.858
826.870	23.822
835.255	19.567
835.318	19.894
835.391	20.276
835.433	20.494
840.535	23.112
844.644	20.549
844.738	21.039
844.811	21.421
845.135	23.112
849.788	23.385
854.106	21.912
859.093	23.930
863.338	22.075
868.022	22.512
950.597	21.310
955.490	22.837
955.521	23.001
955.741	24.147
955.824	24.583
974.226	24.583
974.278	24.855
974.361	25.292
979.432	27.746
1006.166	23.218
1010.474	21.691
1010.746	23.109
1015.513	23.982
1015.649	24.691
1015.680	24.855
1019.862	22.673
1020.417	25.564
1024.609	23.436
1028.697	20.763
1029.147	23.109
1029.398	24.418
1033.862	23.709
1033.998	24.418
1038.096	21.800
1052.200	23.381
1061.181	22.236
1061.516	23.981
1066.702	27.035
1070.162	21.090
1075.014	22.399
1075.348	24.144
1075.494	24.908
1084.402	23.381
1089.003	23.381
1093.477	22.726
1093.582	23.271
1093.760	24.199
1102.406	21.308
1102.458	21.580
1102.584	22.235
1103.222	25.562
1107.634	24.580
1107.885	25.889
1107.958	26.271
1130.301	22.834
1180.454	20.488
1190.010	22.342
1194.213	20.270
1194.527	21.906
1194.841	23.542
1213.294	23.815
1217.173	20.051
1221.627	19.287
1221.993	21.196
1230.890	19.614
1324.140	26.104
1332.630	22.394
1332.807	23.322
1337.010	21.249
1342.426	25.503
1351.794	26.376
1374.513	24.903
1379.051	24.575
1379.469	26.757
1411.336	25.011
1415.696	23.756
1416.031	25.502
1434.181	24.193
1434.777	27.302
1438.865	24.629
1452.927	25.992
1461.239	21.356
1461.678	23.647
1470.440	21.356
1480.393	25.283
1480.508	25.883
1480.686	26.810
1562.947	23.972
1571.949	22.936
1695.937	21.788
1715.206	26.315
1724.752	28.115
1779.767	27.132
1788.842	26.477
1797.990	26.204
1816.402	26.258
1843.899	25.712
1880.440	24.348
2074.666	29.636
2147.685	26.580
2157.241	28.434
2211.797	25.051
2501.615	25.046
2502.325	28.755
2829.238	30.277
2866.229	31.258];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
temp.tL_f    = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StewHugh2007';
comment.tL_f = 'data for females Arrhamphus sclerolepis krefftii ';
%
data.tL_m = [... % time since birth (d), fork length (cm)
65.742	12.981
240.532	12.868
419.912	12.702
420.163	14.011
420.351	14.992
420.571	16.138
433.681	12.538
706.865	21.751
785.049	21.641
803.314	20.931
816.948	20.058
816.990	20.276
835.454	20.603
835.527	20.985
835.715	21.967
950.722	21.965
955.657	23.710
964.586	22.292
996.788	22.291
1010.651	22.618
1014.948	21.036
1024.086	20.709
1028.603	20.273
1084.099	21.799
1102.364	21.089
1139.470	22.671
1180.726	21.906
1194.380	21.142
1194.767	23.160
1226.792	22.233
1323.356	22.013
1323.555	23.049
1337.366	23.103
1378.936	23.975
1383.829	25.503
1387.728	21.848
1387.812	22.284
1429.173	22.065
1433.418	20.211
1433.585	21.083
1433.606	21.193
1447.595	22.174
1447.626	22.338
1452.279	22.610
1452.289	22.665
1456.973	23.101
1461.228	21.301
1461.992	25.283
1479.734	21.846
1479.787	22.119
1603.618	20.153
1691.462	22.442
1700.443	21.297
1714.547	22.878
1765.318	23.750
1811.174	22.986
1815.545	21.786
1816.057	24.458
1816.318	25.822
1820.072	21.404
1843.439	23.312
1843.512	23.694
1847.945	22.821
1848.290	24.621
1857.000	22.058
1948.942	21.729
2078.419	25.217
2124.287	24.507
2151.972	24.943
2152.087	25.543
2165.344	22.707
2225.210	23.033
2451.053	25.265];
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewHugh2007';
comment.tL_m = 'data for males Arrhamphus sclerolepis krefftii ';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 5 * weights.Ri;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end

%% Facts
F1 = 'wet weight (g) = 0.00263*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68589'; % Cat of Life
metaData.links.id_ITIS = '165537'; % ITIS
metaData.links.id_EoL = '356954'; % Ency of Life
metaData.links.id_Wiki = 'Arrhamphus_sclerolepis'; % Wikipedia
metaData.links.id_ADW = 'Arrhamphus_sclerolepis'; % ADW
metaData.links.id_Taxo = '161810'; % Taxonomicon
metaData.links.id_WoRMS = '293547'; % WoRMS
metaData.links.id_fishbase = 'Arrhamphus-sclerolepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporhamphus}}'];
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
bibkey = 'StewHugh2007'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2006.01256.x}, ' ...
'author = {J. Stewart and J. M. Hughes}, ' ... 
'year = {2007}, ' ...
'title = {Age validation and growth of three commercially important hemiramphids in south-eastern {A}ustralia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {70}, ' ...
'pages = {65-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hyporhamphus-australis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

