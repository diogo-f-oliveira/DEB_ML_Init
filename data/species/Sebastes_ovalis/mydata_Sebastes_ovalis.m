function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_ovalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_ovalis'; 
metaData.species_en = 'Speckled rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 21];

%% set data
% zero-variate data

data.am = 37*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 56;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 296.3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 2.5e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 160e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(8.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
3.302	17.980
4.341	20.287
5.306	22.155
6.264	22.052
7.079	23.482
8.190	25.023
9.223	25.468
10.479	26.463
11.073	27.781
12.037	29.321
13.363	29.112
14.105	30.650
15.138	30.986
16.029	32.854
17.143	35.380
18.249	35.498
19.214	37.694
20.173	37.920
21.060	38.693
22.163	37.825
23.124	38.599
24.084	39.372
24.897	39.926
26.150	40.044
27.185	40.928
28.213	39.731
29.175	40.833
30.060	41.058];
data.tL_f(:,1) = 365*(0.9+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(8.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMorr1990';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.933	17.758
4.267	20.067
5.305	21.936
6.266	22.928
7.079	23.372
8.039	24.036
9.221	24.811
10.330	25.695
11.215	26.030
12.249	26.585
13.136	27.468
14.095	27.475
15.198	26.716
16.156	26.723
17.046	28.263
18.152	28.490
19.187	29.483
20.221	30.147
21.036	31.248
22.143	31.694
23.171	30.497
24.062	32.474
24.945	32.043];
data.tL_m(:,1) = 365*(0.9+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(8.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMorr1990';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... length (cm), weight (g)
18.592	67.409
21.908	125.627
22.026	131.755
23.092	147.075
23.211	162.396
23.684	140.947
24.039	171.588
24.868	297.214
24.868	238.997
24.868	171.588
24.987	245.125
24.987	211.421
24.987	196.100
24.987	183.844
25.697	235.933
25.697	245.125
25.697	266.574
25.934	223.677
25.934	257.382
26.408	251.254
26.526	238.997
26.645	309.471
27.355	235.933
27.355	263.510
27.355	281.894
27.355	284.958
27.355	306.407
27.474	251.254
28.184	370.752
28.184	321.727
28.303	340.111
28.421	272.702
28.658	281.894
28.895	321.727
29.013	370.752
29.013	312.535
29.132	333.983
29.368	428.969
29.368	346.240
29.368	300.279
29.724	367.688
29.724	306.407
29.842	364.624
29.842	352.368
30.434	432.033
31.026	392.201
31.026	401.393
31.382	395.265
31.382	416.713
31.500	462.674
31.737	490.251
31.737	459.610
31.855	481.059
31.855	474.930
31.855	404.457
31.855	327.855
31.974	419.777
32.211	456.546
32.211	438.162
32.566	769.081
32.566	514.763
33.632	557.660
33.632	548.468
33.632	496.379
33.750	655.710
33.750	530.084
33.750	520.891
33.868	631.198
33.868	625.070
33.868	576.045
34.105	667.967
34.816	631.198
35.408	643.454
35.408	622.006
35.408	588.301
35.645	600.557
36.118	594.429
36.237	689.415
36.237	628.134
36.237	588.301
36.355	701.671
36.355	723.120
36.355	655.710
36.474	680.223
36.829	637.326
37.066	735.376
37.066	677.159
37.066	456.546
37.184	787.465
37.184	778.273
37.184	698.607
37.184	683.287
37.303	762.953
37.658	720.056
37.776	671.031
37.895	793.593
37.895	530.084
38.013	769.081
38.013	707.799
38.132	897.772
38.132	815.042
38.132	836.490
38.132	735.376
38.132	536.212
38.250	854.875
38.487	916.156
38.724	726.184
38.842	885.515
38.842	854.875
38.842	793.593
38.842	836.490
38.961	808.914
39.197	913.092
39.553	854.875
39.789	808.914
39.789	793.593
39.908	1032.590
39.908	833.426
40.026	940.669
40.026	989.694
40.263	894.707
40.263	903.900
40.500	1029.526
40.500	842.618
40.618	962.117
40.618	796.657
40.737	1127.577
40.737	1078.552
40.737	922.284
40.737	974.373
40.737	998.886
40.855	1066.295
40.855	1011.142
40.974	891.643
41.092	1050.975
41.329	959.053
41.566	1087.744
41.566	1011.142
41.566	989.694
41.566	910.028
41.803	1057.103
42.276	968.245
42.513	1133.705
42.513	1087.744
42.513	1063.231
42.632	1173.538
42.632	1026.462
43.816	1164.345];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'LoveMorr1990';
%
data.LW_m = [ ... length (cm), weight (g)
17.321	77.070
18.174	84.452
22.437	134.358
22.910	130.620
23.006	145.469
23.289	136.170
23.289	136.170
23.290	145.454
23.290	147.310
23.293	164.021
24.618	173.235
24.711	162.089
24.813	215.930
24.903	180.647
24.910	228.922
25.094	193.634
25.190	204.769
25.569	208.463
25.664	210.314
25.759	215.880
26.423	228.842
26.425	245.553
26.517	226.980
26.708	238.111
26.807	271.527
26.900	258.525
26.990	221.385
27.372	249.216
27.468	262.208
27.472	288.203
27.562	260.346
27.753	267.763
28.038	282.602
28.039	286.316
28.324	295.585
28.423	329.001
28.711	356.837
28.795	280.705
28.991	328.971
29.558	328.941
29.751	353.069
30.027	299.208
30.129	353.048
30.415	367.887
30.701	386.440
30.888	366.006
30.984	377.141
30.986	395.709
31.936	423.510
32.029	410.507
32.420	503.325
32.604	468.036
32.797	495.878
32.981	456.876
33.170	455.009
33.172	471.720
33.176	497.714
33.268	484.712
33.279	564.552
36.129	649.812];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7P5'; % Cat of Life
metaData.links.id_ITIS = '166757'; % ITIS
metaData.links.id_EoL = '46568175'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_ovalis'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_ovalis'; % ADW
metaData.links.id_Taxo = '187309'; % Taxonomicon
metaData.links.id_WoRMS = '274830'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-ovalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_ovalis}}';
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
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins},' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-ovalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
