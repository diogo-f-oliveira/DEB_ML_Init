function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_miniatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_miniatus'; 
metaData.species_en = 'Vermillion rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.9); % K, body temp
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

data.am = 60*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(6.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 37;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMorr1990'; 
data.Li  = 91;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 701;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMorr1990'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 11.3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 5.6e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(6.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ...
  0  9.6
  1 14.3 
  2 23.8
  3 26.7
  4 32.4
  5 35.4
  6 41.2
  7 43.8
  8 45.4
  9 45.7
 10 48.8
 11 50.5
 12 51.8
 13 54.2
 14 53.3
 15 54.8
 17 57.3
 19 54.2
 20 57.0
 21 56.2
 25 50.9
 29 59.7];
data.tL(:,1) = 365*(0.8+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(6.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... length (cm), weight (g)
19.754	195.477
20.535	204.362
22.765	275.444
23.773	186.591
26.449	266.559
27.451	328.756
27.896	390.953
28.565	408.724
28.788	417.609
29.008	479.806
29.904	417.609
30.124	506.462
30.235	524.233
31.349	586.430
31.463	515.347
31.687	497.577
32.246	470.921
32.463	639.742
32.578	550.889
33.021	639.742
33.801	684.168
34.697	613.086
34.808	630.856
35.695	773.021
35.917	799.677
36.029	808.562
36.495	328.756
36.590	737.480
36.917	932.956
37.366	870.759
37.552	1785.945
37.921	941.842
38.140	1048.465
38.354	1270.598
38.358	1181.745
38.475	1048.465
38.589	995.153
38.687	1323.910
38.706	844.103
38.811	1012.924
38.930	835.218
39.033	1048.465
39.373	924.071
39.595	950.727
39.699	1155.089
39.718	675.283
39.801	1386.107
39.809	1181.745
39.921	1181.745
40.035	1128.433
40.488	959.612
40.583	1377.221
40.596	1048.465
40.703	1172.859
40.925	1199.515
41.042	1075.121
41.251	1412.763
41.368	1279.483
41.483	1208.401
42.046	1075.121
42.152	1235.057
42.262	1261.712
42.368	1394.992
42.590	1430.533
42.597	1252.827
42.708	1279.483
42.824	1181.745
43.603	1243.942
43.699	1626.010
43.818	1448.304
44.120	2247.981
44.151	1474.960
44.160	1261.712
44.266	1403.877
44.371	1563.813
44.479	1652.666
44.611	1163.974
44.920	1794.830
44.927	1617.124
45.026	1919.225
45.035	1714.863
45.043	1501.616
45.592	1741.519
45.708	1634.895
46.036	1812.601
46.048	1510.501
46.276	1394.992
46.385	1457.189
46.701	1928.110
46.704	1839.257
46.901	2487.884
46.933	1697.092
47.144	2008.078
47.600	1777.060
47.614	1421.648
47.937	1723.748
47.947	1483.845
48.146	2088.045
48.161	1697.092
48.378	1874.798
48.378	1865.913
48.385	1679.321
48.488	1910.339
48.704	2088.045
48.925	2150.242
48.930	2016.963
49.126	2701.131
49.249	2399.031
49.273	1830.372
49.463	2630.048
49.471	2452.342
49.600	2016.963
49.610	1759.289
49.924	2283.522
50.036	2265.751
50.128	2763.328
50.254	2407.916
50.264	2159.128
50.389	1821.486
50.596	2239.095
50.606	1972.536
50.746	1297.254
50.803	2630.048
51.062	1741.519
51.148	2372.375
51.276	1972.536
51.357	2727.787
51.375	2292.407
51.608	2061.389
51.710	2292.407
51.717	2123.586
51.730	1803.716
51.814	2487.884
51.836	1936.995
51.919	2630.048
52.040	2416.801
52.251	2710.016
52.276	2105.816
52.287	1830.372
52.377	2354.604
52.420	1297.254
52.502	2034.733
52.701	2630.048
53.060	2025.848
53.264	2523.425
53.272	2310.178
53.279	2150.242
53.327	3705.170
53.469	2949.919
53.507	2025.848
53.606	2336.834
53.703	2692.246
53.738	1830.372
53.827	2399.031
54.156	2541.195
54.282	2176.898
54.389	2310.178
54.470	3065.428
54.496	2416.801
54.503	2230.210
54.613	2292.407
54.621	2096.931
54.713	2576.737
54.730	2159.128
54.829	2461.228
54.835	2319.063
54.913	3145.396
55.038	2825.525
55.040	2754.443
55.045	2647.819
55.045	2647.819
55.061	2247.981
55.068	2079.160
55.273	2523.425
55.278	2399.031
55.367	2949.919
55.371	2852.181
55.483	2843.296
55.583	3145.396
55.605	2594.507
55.913	3252.019
56.230	3705.170
56.297	2052.504
56.376	2861.066
56.490	2789.984
56.563	3740.711
56.706	2967.690
56.819	2932.149
56.827	2754.443
56.915	3340.872
56.918	3252.019
56.944	2612.278
57.035	3127.625
57.038	3038.772
57.141	3260.905
57.277	2656.704
57.599	2985.460
57.694	3403.069
57.744	2159.128
57.928	3127.625
57.943	2745.557
58.043	3047.658
58.047	2949.919
58.135	3527.464
58.368	3287.561
58.774	4282.714
58.950	2710.016
59.141	3500.808
59.157	3092.084
59.244	3705.170
59.271	3038.772
59.360	3598.546
59.711	3198.708
59.714	3136.511
59.819	3287.561
60.480	3509.693
60.593	3483.037
60.615	2949.919
60.699	3616.317
60.936	3278.675
61.023	3900.646
61.124	4158.320
61.219	4567.044
61.571	4131.664
61.798	4042.811
61.920	3794.023
61.927	3625.202
62.016	4176.090
62.026	3945.073
62.154	3536.349
62.388	3278.675
62.460	4256.058
62.466	4087.237
62.784	4504.847
62.805	4007.270
63.344	4460.420
63.485	3740.711
63.487	3687.399
63.905	4398.223
64.148	3927.302
64.456	4575.929
64.824	3758.481
64.904	4540.388
65.041	3918.417
65.093	5384.491
65.347	4629.241
66.233	4815.832
67.694	4575.929
67.765	5562.197];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
38.418	93285.289
42.534	279226.224
42.747	314500.241
43.948	283984.689
45.380	139061.863
45.551	539733.941
45.686	315239.675
46.653	425545.758
46.742	597266.356
48.474	685752.224
48.803	659420.021
49.479	470281.648
49.683	584798.468
49.688	540774.626
49.759	862176.229
49.911	492403.115
50.949	928513.244
51.097	593959.372
52.121	1153336.289
52.256	928841.882
52.263	862806.118
53.693	735493.056
53.793	814763.245
54.125	770821.563
55.175	1101274.386
55.183	1030836.182
55.266	1255385.362
55.330	705087.050
56.483	1088395.843
56.692	1158888.819
56.835	863956.349
57.102	1379117.719
58.205	1256124.796
59.184	1265176.014
59.299	1207972.377
59.588	1529428.754
60.561	1586906.255
60.764	1714630.256
62.056	1838225.822
62.105	1419999.037
62.301	1604954.060
62.378	1882331.823
63.109	1208930.902
63.697	1768198.414
63.992	2041228.508
67.949	2649771.176];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(6.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
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
metaData.links.id_CoL = '4W7NH'; % Cat of Life
metaData.links.id_ITIS = '166729'; % ITIS
metaData.links.id_EoL = '46568165'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_miniatus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_miniatus'; % ADW
metaData.links.id_Taxo = '187299'; % Taxonomicon
metaData.links.id_WoRMS = '274820'; % WoRMS
metaData.links.id_fishbase = 'Sebastes_miniatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_miniatus}}';
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
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-miniatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
