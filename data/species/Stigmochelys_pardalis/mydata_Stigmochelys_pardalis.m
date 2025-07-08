function [data, auxData, metaData, txtData, weights] = mydata_Stigmochelys_pardalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Stigmochelys_pardalis'; 
metaData.species_en = 'Leopard tortoise'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 11];

%% set data
% zero-variate data

data.ab = 320;     units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'ADW';
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '9 till 12 mnth';
data.tp = 13*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female';      bibkey.tp = 'iucn';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '12 till 15 yr';
data.am = 75*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'iucn';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li = 70;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';   bibkey.Li = 'ADW';

data.Wwb = 99.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on egg diameter of 57.5 mm: pi/6*5.75^3';
data.Wwi = 54000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';    bibkey.Wwi = 'ADW';

data.Ri  = 20/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
3.095	127.884
15.475	127.571
46.424	155.225
61.898	154.834
77.373	154.442
102.132	153.817
114.512	167.722
126.891	195.845
151.651	252.091
160.935	194.984
185.695	237.012
210.454	179.515
229.023	321.225
229.023	250.135
244.498	178.654
266.162	206.543
284.732	248.727
290.922	191.699
297.111	362.158
309.491	191.229
318.776	361.611
328.061	233.414
359.010	246.850
365.199	346.219
420.908	202.631
430.193	301.922
445.667	301.531
445.667	514.801
445.667	557.455
470.426	613.702
470.426	684.792
476.616	841.033
495.186	485.114
504.470	300.045
513.755	385.118
532.325	526.829
553.989	597.372
563.274	497.611
566.369	412.224
566.369	369.570
566.369	326.916
566.369	270.044
569.464	198.876
584.938	639.243
600.413	738.378
600.413	894.776
628.267	510.186
634.457	353.631
637.552	637.913
640.646	751.579
646.836	467.063
649.931	651.818
662.311	893.212
662.311	1035.392
677.785	693.768
745.873	407.687
745.873	692.047
758.253	1075.621
758.253	1274.673
764.443	805.322
767.538	1430.836
767.538	1644.106
770.633	975.782
783.012	477.839
792.297	634.002
792.297	833.054
832.531	1159.051
906.809	1583.714
912.999	830.003
916.094	915.233
916.094	1128.503
919.188	701.885
928.473	914.920
928.473	1057.100
1008.941	799.142
1008.941	1083.502
1012.036	884.372
1012.036	969.680
1061.554	2105.869
1061.554	2205.395
1064.649	1992.047
1067.744	1394.812
1070.839	2333.123
1077.029	1167.089
1083.219	1394.421
1148.212	1037.328
1148.212	1364.342
1148.212	1478.086
1148.212	1662.920
1228.680	2215.389
1228.680	3295.958
1228.680	3566.100
1228.680	3622.972
1228.680	3708.280
1237.964	1930.794
1241.059	2442.564
1247.249	4162.787
1250.344	3224.320
1265.818	2214.450
1281.293	1787.519
1281.293	2000.789
1281.293	2142.969
1281.293	2285.149
1432.944	3290.794
1436.039	2650.906
1442.228	2963.546
1445.323	3830.766
1445.323	4015.600
1596.974	3983.331
1600.069	4537.755
1603.164	4324.407
1603.164	5746.208];
units.tW   = {'d', 'cm'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RitzHamm2010';

% length-weight
WL = [ ... wet weight (g), carapace length (cm)
27.810	4.175
27.949	5.193
34.871	6.008
35.037	7.230
48.852	8.656
62.348	7.739
69.533	10.489
82.835	8.147
89.784	9.165
103.419	9.267
117.109	9.776
117.276	10.998
117.400	11.914
144.448	10.489
144.684	12.220
192.440	12.831
205.908	11.711
213.024	13.951
219.613	12.322
233.525	14.460
233.663	15.479
246.993	13.340
281.115	13.849
281.434	16.191
288.189	15.784
322.074	14.562
369.997	16.395
383.507	15.580
411.137	18.432
417.795	17.312
444.856	15.988
458.547	16.497
506.497	18.534
513.113	17.108
581.370	18.228
581.495	19.145
636.118	20.163
649.794	20.570
656.396	19.043
697.606	21.589
731.505	20.468
731.589	21.079
792.966	21.690
800.026	23.523
826.935	21.079
874.844	22.811
888.381	22.200
908.924	23.014
997.695	24.745
1024.715	23.116
1038.655	25.458
1045.202	23.523
1045.327	24.440
1290.766	26.375
1345.375	27.291
1427.225	28.208
1529.409	28.411
1569.980	26.273
1570.161	27.597
1590.689	28.310
1617.875	27.902
1726.856	28.004
1876.686	28.004
1917.674	28.921
1992.963	31.670
2094.981	30.652
2156.317	30.957
2204.017	31.161
2204.239	32.790
2292.622	31.670
2449.332	32.179
2571.962	32.485
2926.382	34.521
2926.535	35.642
3165.039	36.660
3192.183	35.947
3239.995	36.965
3273.937	36.151
3321.776	37.373
3621.380	36.965
3689.443	36.660
3853.102	38.187
3996.121	38.187
4043.933	39.206
4125.422	37.475
4152.733	37.984
4377.783	40.224
4643.585	41.650
5821.944	42.770];
data.LW = WL(:,[2 1]);
units.LW   = {'cm', 'g'};  label.LW = {'carapace length','wet weight'};  
bibkey.LW = 'RitzHamm2010';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'grazes extensively upon mixed grasses and favors succulents and thistles';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'females often larger than males';
metaData.bibkey.F2 = 'ADW'; 
F3 = 'females develop from eggs incubated above 30 C, males below 30 C';
metaData.bibkey.F3 = 'ADW'; 
metaData.bibkey.F2 = 'ADW'; metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '52MQ5'; % Cat of Life
metaData.links.id_ITIS = '949470'; % ITIS
metaData.links.id_EoL = '794299'; % Ency of Life
metaData.links.id_Wiki = 'Stigmochelys_pardalis'; % Wikipedia
metaData.links.id_ADW = 'Stigmochelys_pardalis'; % ADW
metaData.links.id_Taxo = '3818344'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Stigmochelys&species=pardalis'; % ReptileDB
metaData.links.id_AnAge = 'Stigmochelys_pardalis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stigmochelys_pardalis}}';
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
bibkey = 'RitzHamm2010'; type = 'Article'; bib = [ ... 
'author = {J. Ritz and C. Hammer and M. Clauss}, ' ... 
'year = {2010}, ' ...
'title = {Body Size Development of Captive and Free-Ranging Leopard Tortoises (\emph{Geochelone pardalis})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {29}, ' ...
'pages = {517-525}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Geochelone_pardalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Psammobates_pardalis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/163449/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

