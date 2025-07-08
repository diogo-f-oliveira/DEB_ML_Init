function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_flavidus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_flavidus'; 
metaData.species_en = 'Yellowtail rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 22];

%% set data
% zero-variate data

data.am = 64*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 36;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 66;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 644;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 4.2e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 2e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(5.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ...
  0  8.2
  1 13.0
  2 14.2
  3 22.7
  4 25.0
  5 31.4
  6 36.3
  7 36.8
  8 37.5
  9 43.9
 10 42.6
 11 41.7
 14 51.2
 20 41.6];
data.tL(:,1) = 365*(0.8+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(5.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wilk1980'; 

% length-weight
data.LW_f = [ ... length (cm), weight (g)
31.368	441.163
32.147	535.564
33.156	587.530
33.721	563.990
35.732	733.959
36.398	837.785
36.521	724.587
36.632	738.747
37.753	786.005
38.650	833.245
39.072	1144.599
39.091	927.619
39.765	951.257
39.996	880.521
40.659	1022.082
40.889	970.213
41.113	984.382
41.337	993.834
41.436	1144.785
42.897	1173.202
43.107	1333.596
43.117	1225.106
43.238	1130.776
43.450	1281.736
44.122	1319.524
44.124	1291.223
44.229	1376.137
44.687	1295.984
44.792	1376.181
44.904	1380.906
45.029	1248.841
45.354	1390.376
45.567	1522.468
45.596	1196.999
45.687	1437.572
45.920	1347.968
45.925	1296.081
46.135	1465.909
46.356	1513.096
46.477	1418.766
46.591	1399.907
46.691	1536.707
46.903	1682.951
46.926	1428.235
47.121	1763.156
47.264	1428.262
47.362	1583.930
47.379	1399.969
47.457	1786.768
47.465	1692.429
47.469	1649.976
47.601	1433.005
48.135	1758.519
48.236	1885.885
48.483	1635.905
48.500	1447.227
48.689	1852.902
48.703	1701.960
48.707	1654.790
48.714	1579.319
48.816	1692.535
48.926	1720.845
49.033	1786.891
49.259	1777.475
49.367	1824.654
49.373	1753.899
49.573	2041.651
49.583	1928.444
49.587	1881.275
49.588	1876.558
49.615	1574.673
49.681	2084.112
49.692	1961.472
49.705	1824.680
49.717	1687.889
49.804	1975.631
49.938	1730.359
49.951	1588.850
49.955	1541.681
50.046	1782.254
50.156	1810.565
50.374	1890.771
50.505	1683.234
50.794	2230.426
50.811	2041.748
50.952	1725.722
50.953	1716.288
51.034	2070.068
51.141	2126.680
51.154	1985.171
51.265	1999.331
51.374	2037.076
51.721	1938.046
51.914	2291.835
51.941	1994.667
51.951	1881.461
51.956	1829.574
52.047	2070.147
52.135	2339.022
52.253	2282.428
52.265	2145.636
52.280	1980.543
52.604	2136.229
52.951	2032.483
52.973	1787.201
53.073	1928.718
53.148	2343.819
53.149	2334.385
53.279	2136.282
53.287	2051.377
53.389	2159.875
54.077	2027.854
54.956	2268.489
55.296	2235.497
56.193	2278.020];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'LoveMorr1990';
%
data.LW_m = [ ... length (cm), weight (g)
29.342	335.630
31.472	471.736
31.568	459.672
32.222	465.789
33.334	535.357
34.349	620.008
36.210	686.648
36.487	704.795
36.670	728.968
36.766	716.904
37.136	744.118
37.331	698.859
38.351	753.322
39.361	868.161
39.451	892.322
39.628	946.683
40.283	949.781
40.355	1073.564
40.545	1061.511
40.546	1052.455
40.634	1085.673
41.215	974.045
41.226	910.650
41.294	1058.583
41.381	1097.838
41.406	952.936
41.412	919.729
41.490	1010.304
41.572	1076.729
41.597	934.846
42.140	1040.572
42.251	943.981
42.313	1122.102
42.400	1158.339
42.423	1025.512
42.426	1010.418
42.427	1007.399
42.586	1167.418
42.691	1104.034
42.779	1134.234
43.183	968.245
43.238	1185.610
43.252	1104.102
43.263	1043.726
43.351	1076.944
43.429	1164.501
44.167	1227.986
44.183	1134.403
44.249	1291.392
44.262	1218.941
44.337	1324.611
44.361	1191.783
44.462	1146.512
44.645	1170.686
44.828	1197.877
45.112	1176.780
45.175	1351.882
45.195	1237.167
45.375	1282.472
45.395	1164.738
45.405	1110.400
45.537	1424.378
45.630	1430.427
45.764	1197.990
46.123	1288.600
46.142	1176.904
46.275	1484.845
46.387	1382.217
46.479	1394.303
46.494	1306.758
46.578	1361.108
46.589	1300.732
47.322	1391.386
47.333	1324.972
47.383	1578.563
47.600	1409.533
47.606	1370.288
48.363	1325.097];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
37.939	171000.897
39.174	152081.422
40.088	415228.283
41.426	177616.459
43.617	333099.068
44.913	385499.687
45.118	352235.371
45.250	471104.820
45.379	398214.880
46.133	399859.427
46.326	390366.001
48.336	529986.400
48.455	476113.161
48.485	613991.888
48.518	542679.168
48.571	631431.369
48.609	750293.344
48.700	558541.378
49.317	650507.871
49.390	495204.664
49.993	615696.235
50.861	576145.310
50.910	473138.070
51.008	864588.032
51.024	831308.766
51.054	767919.701
51.174	913729.521
52.025	909042.621
52.156	831398.467
52.158	826644.304
52.187	964523.006
52.391	733160.366
53.396	802970.565
53.487	609633.878];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(5.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set2};
metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7M6'; % Cat of Life
metaData.links.id_ITIS = '166720'; % ITIS
metaData.links.id_EoL = '46568141'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_flavidus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_flavidus'; % ADW
metaData.links.id_Taxo = '187275'; % Taxonomicon
metaData.links.id_WoRMS = '274795'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-flavidus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_flavidus}}';
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
bibkey = 'Wilk1980'; type = 'article'; bib = [ ... 
'author = {Wilkins, M.E.},' ...
'year = {1980}, ' ...
'title = {Size composition, age composition and growth of chilepepper, \emph{Sebastes goodei}, and bocaccio, \emph{S. paucipinis} from the 1977 rockfish survey}, ' ...
'journal = {Mar. Fish. Rev.}, ' ...
'volume = {(Mar.-Apr.)}, ' ...
'pages = {48-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-flavidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
