function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_goodei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_goodei'; 
metaData.species_en = 'Chilipepper rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.2); % K, body temp
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

data.am = 35*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 32;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMorr1990'; 
data.Li  = 56;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 447.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMorr1990'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 2.5e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 1e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(8.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_fm = [ ...
  1.5 17.0 16.9
  2.5 21.8 21.4
  3.5 25.2 24.8
  4.5 31.8 30.3
  5.5 34.6 31.5
  6.5 37.5 33.1
  7.5 40.9 34.6
  8.5 42.9 35.4
  9.5 44.9 36.7
 10.5 46.7 36.3
 11.5 48.3 37.9
 12.5 48.2 36.5
 13.5 48.3  NaN
 14.5 49.2  NaN
 15.5 50.0  NaN];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % convert yr 
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(8.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Wilk1980'; treat.tL_fm = {1 {'females','males'}}; 

% length-weight
data.LW = [ ... length (cm), weight (g)
23.208	141.215
23.302	134.647
23.398	151.067
23.684	160.920
24.065	174.056
24.349	151.067
24.350	167.488
24.541	180.624
24.732	200.328
26.158	193.760
26.159	216.749
26.348	183.908
26.444	216.749
26.728	187.192
26.919	203.612
27.205	226.601
27.871	226.601
28.158	259.442
28.347	239.737
28.632	226.601
29.204	262.726
29.396	298.851
29.490	282.430
29.680	269.294
30.255	364.532
30.728	311.987
30.728	325.123
30.922	394.089
31.393	305.419
31.777	380.952
32.730	436.782
32.918	384.236
33.396	440.066
33.968	472.906
33.972	555.008
34.063	463.054
34.157	433.498
34.255	505.747
34.446	518.883
35.109	472.906
35.209	568.144
35.589	555.008
35.873	535.304
35.969	548.440
36.065	577.997
36.066	587.849
36.445	558.292
36.538	515.599
36.827	600.985
36.829	650.246
36.836	798.030
36.924	640.394
37.490	551.724
37.494	620.690
37.589	630.542
37.591	666.667
37.688	706.076
37.688	712.644
37.778	594.417
37.873	604.269
38.637	676.519
38.829	706.076
38.829	715.928
38.920	620.690
39.109	591.133
39.115	735.632
39.303	669.951
40.168	880.131
40.351	725.780
40.355	804.598
41.028	958.949
41.207	719.212
41.308	844.007
41.308	850.575
41.401	798.030
41.494	761.905
41.972	824.302
42.164	847.291
42.447	801.314
42.544	847.291
42.550	968.801
42.550	981.938
42.738	922.824
42.740	965.517
42.742	1011.494
42.827	804.598
42.830	870.279
42.831	876.847
43.018	811.166
43.407	1001.642
43.410	1057.471
43.596	965.517
43.792	1106.732
43.887	1090.312
43.974	932.677
43.980	1047.619
43.983	1123.153
44.163	909.688
44.741	1057.471
44.742	1080.460
44.746	1172.414
44.839	1116.585
44.843	1205.255
44.934	1110.016
44.935	1136.289
45.119	1014.778
45.120	1041.051
45.126	1155.993
45.220	1142.857
45.412	1169.130
45.510	1228.243
45.602	1162.562
46.085	1330.049
46.170	1123.153
46.177	1267.652
46.178	1287.356
46.264	1087.028
46.267	1155.993
46.274	1303.777
46.359	1096.880
46.360	1110.016
46.361	1139.573
46.364	1192.118
46.937	1257.800
47.039	1392.447
47.127	1244.663
47.213	1054.187
47.215	1096.880
47.220	1198.686
47.234	1487.685
47.314	1178.982
47.417	1349.754
47.426	1530.378
47.506	1215.107
47.513	1359.606
47.513	1372.742
47.700	1307.061
48.273	1349.754
48.373	1448.276
48.464	1376.026
48.469	1461.412
48.556	1293.924
48.558	1339.901
48.565	1490.969
48.568	1546.798
48.575	1694.581
48.751	1408.867
48.845	1376.026
48.947	1523.810
48.947	1533.662
49.229	1454.844
49.518	1527.094
49.609	1458.128
49.611	1497.537
49.695	1261.084
49.716	1697.865
49.718	1740.558
49.792	1303.777
49.793	1320.197
49.803	1533.662
49.804	1543.514
49.805	1579.639
49.807	1605.911
49.807	1612.479
49.891	1372.742
50.565	1563.218
50.653	1415.435
50.658	1517.241
50.665	1651.888
50.755	1546.798
50.758	1615.764
50.848	1500.821
50.851	1582.923
50.860	1763.547
50.949	1625.616
51.137	1586.207
51.242	1789.819
51.897	1582.923
52.002	1783.251
52.006	1868.637
52.099	1816.092
52.100	1835.796
52.184	1615.764
52.188	1694.581
52.188	1704.433
53.036	1540.230
53.130	1500.821
53.145	1822.660
53.233	1665.025
53.248	1986.864
54.373	1661.741
54.470	1694.581
54.488	2062.397
55.722	2029.557];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
30.499	18939.805
35.396	91999.741
36.500	98366.746
37.767	115631.345
38.860	138616.623
38.959	116845.813
40.303	148441.424
40.399	131827.994
40.578	117511.654
41.507	131891.485
43.657	235166.571
43.777	179586.086
43.893	131455.188
44.549	171607.407
44.801	177925.553
44.990	149283.086
45.812	195748.567
46.028	125273.793
46.047	228999.827
46.232	206660.834
47.367	163172.917
47.411	227931.876
47.432	195268.315
47.501	220487.173
48.373	189018.544
49.621	236654.519
49.653	187945.710
49.692	259008.153
49.777	260732.177
49.939	273921.979
50.820	228700.280
51.190	316400.563
53.320	316522.661
53.357	259218.162
53.411	307358.828
53.451	378994.323
54.446	289653.037];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(8.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7M9'; % Cat of Life
metaData.links.id_ITIS = '166722'; % ITIS
metaData.links.id_EoL = '46568144'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_goodei'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_goodei'; % ADW
metaData.links.id_Taxo = '187278'; % Taxonomicon
metaData.links.id_WoRMS = '274798'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-goodei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_goodei}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-goodei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
