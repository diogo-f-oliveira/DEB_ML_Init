function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_caurinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_caurinus'; 
metaData.species_en = 'Copper rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 23];

%% set data
% zero-variate data

data.am = 57*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 34;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 58;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 540;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 2.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 640e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(8.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
  0  8.2
  1 12.3
  2 18.1
  3 24.5
  4 28.5
  5 31.5
  6 34.8
  7 35.1
  8 39.1
  9 43.8
 10 43.1
 11 44.4
 12 46.6
 13 45.6
 14 44.0
 15 49.0
 21 49.2
 28 56.2];
data.tL(:,1) = 365*(0.9+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(8.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
7.342	13.201
7.849	8.225
8.798	12.917
9.178	12.843
9.558	12.769
10.571	17.450
10.950	12.498
10.950	12.498
11.330	7.545
11.773	12.337
12.280	31.750
12.343	31.738
12.977	46.248
13.292	16.919
13.990	46.051
14.433	50.842
14.495	26.440
14.940	70.256
15.003	50.731
15.193	60.450
15.573	55.498
15.889	60.314
16.206	70.009
16.522	65.069
16.902	69.873
17.218	60.055
17.536	79.505
17.855	128.223
18.043	103.796
18.297	118.381
18.360	108.613
18.613	98.807
18.677	108.551
18.868	132.904
19.246	113.318
19.311	132.817
19.439	162.061
19.626	118.122
19.819	166.865
20.136	181.437
20.260	127.754
20.262	161.900
20.640	142.314
20.641	152.070
20.894	152.021
20.959	176.398
21.341	229.982
21.401	156.800
21.403	200.702
21.720	205.518
21.911	239.627
22.290	220.041
22.351	176.127
22.541	176.090
22.669	205.333
22.794	171.162
22.923	224.795
22.988	244.295
23.239	219.856
23.304	244.233
23.556	229.550
23.557	249.062
23.559	278.330
23.939	278.256
24.256	287.950
24.257	312.340
24.380	244.023
24.507	258.633
24.573	307.400
25.015	287.802
25.142	297.533
25.270	312.143
25.713	312.056
25.714	336.446
25.838	292.519
25.963	258.349
26.094	336.372
26.410	341.188
26.538	365.554
26.789	316.724
26.794	414.284
26.980	331.321
26.982	380.101
26.985	438.637
27.048	438.625
27.174	414.210
27.360	350.759
27.488	370.246
27.681	423.867
27.742	389.709
27.804	360.429
27.870	418.952
27.936	457.964
28.059	399.403
28.125	443.293
28.378	443.243
28.569	462.718
28.629	404.170
28.756	418.779
28.825	521.205
28.883	423.633
28.949	467.522
29.141	521.143
29.202	467.473
29.327	447.936
29.455	472.301
29.456	477.179
29.460	564.983
29.582	467.399
29.584	516.179
29.648	521.044
29.899	491.727
29.962	486.837
30.216	496.543
30.220	579.469
30.534	525.749
30.721	467.176
30.978	550.053
31.043	574.431
31.167	525.626
31.551	598.722
32.123	657.147
32.569	710.718
32.631	676.560
32.637	798.510
32.947	681.376
32.953	788.692
33.266	730.094
33.644	690.996
33.649	783.678
34.093	798.226
34.280	754.287
35.237	900.441
35.422	807.722
35.674	773.527
35.812	988.134
35.995	856.391
36.567	905.060
36.570	958.718
36.574	1036.766
36.763	1026.973
36.955	1065.960
37.209	1090.301
37.589	1095.105
37.595	1202.420
37.775	1007.263
37.907	1119.433
38.223	1109.615
38.726	1036.346
38.987	1202.149
39.685	1231.281
40.068	1284.865
40.133	1314.120
40.381	1216.511
40.387	1333.583
41.597	1469.932
42.043	1528.382
42.291	1445.407
42.617	1625.831
42.862	1464.807
43.051	1445.258
43.446	1742.742
43.766	1796.338
43.816	1557.304
43.826	1737.790
44.202	1664.546
44.644	1644.948
44.725	1991.273
45.107	2020.467
45.474	1786.249
45.489	2064.295
45.525	1552.093
46.238	1873.905
46.370	1971.440
48.208	2024.740
49.110	2327.003
49.298	2287.942];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LeaMcAl1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

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
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7LC'; % Cat of Life
metaData.links.id_ITIS = '166713'; % ITIS
metaData.links.id_EoL = '46568126'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_caurinus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_caurinus'; % ADW
metaData.links.id_Taxo = '187259'; % Taxonomicon
metaData.links.id_WoRMS = '274780'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-caurinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_caurinus}}';
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
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-caurinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
