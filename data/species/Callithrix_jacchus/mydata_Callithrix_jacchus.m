function [data, auxData, metaData, txtData, weights] = mydata_Callithrix_jacchus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Callitrichidae';
metaData.species    = 'Callithrix_jacchus'; 
metaData.species_en = 'Common marmoset'; 

metaData.ecoCode.climate = {'Af', 'BSh'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHe', 'xiCii', 'xiCvbe'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2018 08 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 28]; 


%% set data
% zero-variate data

data.tg = 144;    units.tg = 'd';    label.tg = 'gestation time';            bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 62;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 477;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for female, 382 d for male';
data.am = 22.8*365; units.am = 'd';  label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 13.5;  units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'ADW';

data.Wwb = 26.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnAge';
data.Wwx = 86.67; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'guess';
data.Wwi = 255.2; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'AnAge';

data.Ri  = 2/159; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	30.118
0.000	40.156
32.662	63.113
32.662	70.284
57.159	78.898
40.828	84.627
57.159	96.106
81.655	96.116
89.821	113.327
57.159	113.314
57.159	120.484
65.324	126.224
97.987	131.973
81.655	137.703
97.987	139.143
106.152	143.448
220.470	142.059
179.642	154.949
122.483	154.927
81.655	152.043
81.655	162.081
81.655	172.119
106.152	176.431
130.649	167.837
171.477	187.929
122.483	200.816
318.456	192.289
424.609	200.935
342.953	206.639
318.456	210.931
244.966	197.996
228.635	202.292
212.304	205.153
187.808	209.446
195.973	215.185
236.801	210.899
155.145	223.773
212.304	225.230
130.649	233.802
130.649	243.840
97.987	259.602
114.318	272.515
179.642	251.030
179.642	248.162
179.642	240.992
236.801	255.354
212.304	263.949
293.960	243.904
318.456	256.820
351.119	259.701
400.112	256.853
465.436	242.538
416.443	265.463
449.105	269.778
489.933	262.624
498.098	279.836
587.919	269.833
645.078	271.289
702.237	255.537
963.535	259.942
195.973	276.849
195.973	282.585
195.973	288.321
220.470	294.067
228.635	298.372
212.304	298.366
212.304	309.838
212.304	318.442
244.966	274.000
253.132	279.739
253.132	286.909
277.629	286.919
261.298	292.649
302.125	291.231
351.119	272.608
383.781	282.659
367.450	285.520
367.450	299.861
416.443	298.446
538.926	289.890
293.960	301.266
326.622	311.317
293.960	311.304
293.960	318.474
326.622	322.789
359.284	322.802
383.781	318.510
400.112	327.120
400.112	335.724
236.801	357.171
277.629	354.319
400.112	354.367
375.615	384.472
285.794	383.003
391.946	417.461
457.271	314.236
473.602	317.111
465.436	309.937
473.602	302.770
514.430	302.787
547.092	307.101
547.092	312.838
530.761	322.869
563.423	322.882
792.058	314.368
751.230	317.220
751.230	325.824
873.714	324.438
971.700	300.098
955.369	318.734
979.866	330.216
685.906	340.139
653.244	335.824
628.747	340.116
571.588	345.830
604.251	350.145
563.423	351.563
563.423	358.733
612.416	355.884
645.078	363.067
596.085	371.652
685.906	373.122
636.913	391.745
661.409	398.925
612.416	411.812
628.747	424.724
710.403	354.489
710.403	365.961
767.562	351.643
841.051	373.183
783.893	398.973
792.058	414.750
792.058	419.052
792.058	430.525
792.058	430.525
726.734	419.027
890.045	358.861
906.376	371.774
939.038	374.655
971.700	383.272
1053.356	383.304
1053.356	397.645
1020.694	410.538
979.866	420.560
947.204	399.037
1290.157	291.619
1306.488	308.834
1281.991	314.560
1257.494	311.683
1281.991	321.731
1175.839	320.255
1175.839	325.991
1175.839	328.859
1151.342	337.454
1069.687	331.685
1086.018	350.334
1135.011	361.826
1208.501	356.118
1102.349	370.417
1314.653	353.292
1273.826	369.050
1265.660	373.349
1298.322	377.664
1192.170	399.133
1208.501	404.876
1290.157	412.078
1216.667	430.691
1273.826	436.450
1306.488	452.237
1167.673	446.447
1175.839	476.565
1388.143	442.231
1437.136	422.174
1535.123	426.515
1420.805	403.525
1420.805	380.580
1494.295	370.571
1551.454	360.555
1584.116	367.738
1592.282	347.665
1510.626	336.161
1371.812	328.936
1437.136	317.489
1584.116	317.547
1731.096	324.775
1780.089	310.454
1763.758	349.166
1690.268	357.742
1698.434	372.085
1665.772	367.770
1641.275	377.799
1575.951	379.207
1559.620	386.371
1649.441	390.709
1698.434	395.030
1673.937	400.756
1706.600	410.807
1698.434	436.617
1673.937	459.552
1780.089	483.972
1935.235	456.786
1959.732	436.720
1886.242	426.652
1771.924	409.399
1788.255	395.065
1820.917	407.984
1878.076	402.271
1829.083	379.307
1853.579	385.053
1886.242	383.631
2025.056	403.762
1951.566	330.598
2074.049	339.250
2065.884	363.626
2106.711	300.544
2245.526	320.675
2376.174	310.688
2514.989	320.781
2368.009	352.272
2237.360	365.127
2163.870	373.702
2180.201	399.521
2245.526	402.415
2327.181	401.013
2359.843	416.800
2408.837	413.951
2523.154	396.788
2482.327	436.925
2441.499	441.211
2474.161	446.960
2188.367	426.771
2106.711	422.437
2090.380	435.337
2090.380	441.073
2139.374	441.092
2139.374	445.394
2123.043	466.898
2229.195	464.072];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BlomKowa2013';
 
data.tW_f = [ ... % time since birth (d), weight (g)
1.702	29.527
14.062	46.148
36.592	66.470
67.555	105.869
98.608	142.192
140.156	171.145
194.407	205.032
250.160	231.539
295.833	251.270
343.062	261.775
392.842	272.898
444.323	269.876
491.209	292.068
538.582	297.652
588.670	298.319];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(36);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Hear1982';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
0.267	29.525
14.098	44.918
39.270	62.782
67.609	104.024
101.503	131.123
138.925	169.299
197.211	197.039
243.880	226.612
294.837	241.427
342.138	249.472
394.506	259.983
439.003	276.021
489.019	279.148
536.356	285.963
587.674	288.476];
units.tW_m = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(36);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Hear1982';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: extra tW data';
D2 = 'Males are assumed not to differ from females';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '697NS'; % Cat of Life
metaData.links.id_ITIS = '944010'; % ITIS
metaData.links.id_EoL = '323890'; % Ency of Life
metaData.links.id_Wiki = 'Callithrix_jacchus'; % Wikipedia
metaData.links.id_ADW = 'Callithrix_jacchus'; % ADW
metaData.links.id_Taxo = '65645'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100197'; % MSW3
metaData.links.id_AnAge = 'Callithrix_jacchus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Callithrix_jacchus}}';
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
bibkey = 'BlomKowa2013'; type = 'Incollection'; bib = [ ... 
'author = {G. E. Blomquist and M. M. Kowalewski and S. R. Leigh}, ' ... 
'year = {2013}, ' ...
'title = {Demographic and Morphological Perspectives on Life History Evolution and Conservation of New World Monkeys}, ' ...
'booktitle = {South American Primates}, ' ...
'howpublished = {\url{http://publish.illinois.edu/martinkowalewski/files/2013/03/Blomquistetal2009.pdf}}, ' ...
'publisher = {Illinois Univ Press}, ' ...
'editor = {P. A. Garber}, '...
'pages = {117--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hear1982'; type = 'Article'; bib = [ ... 
'author = {J. P. Hearn}, ' ... 
'year = {1982}, ' ...
'doi = {10.1111/j.1748-1090.1982.tb02022.x}, ' ...
'title = {Reproductive physiology of the commom marmoset \emph{Callithrix jacchus} in captivity}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {22}, ' ...
'pages = {138--143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Callithrix_jacchus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Callithrix_jacchus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

