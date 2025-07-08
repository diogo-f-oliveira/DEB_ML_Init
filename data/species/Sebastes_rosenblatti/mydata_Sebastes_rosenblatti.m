function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_rosenblatti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_rosenblatti'; 
metaData.species_en = 'Greenblotched rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

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

data.am = 50*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 48;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 184;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 1.57e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 655e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(9.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
1.095	10.554
2.027	13.262
3.040	14.745
3.988	15.247
4.918	18.077
5.839	22.255
6.862	22.390
7.945	24.364
8.870	28.052
9.975	26.962
10.832	29.914
11.661	36.542
12.856	33.248
14.027	33.262
14.891	35.111
15.692	35.611
16.851	37.341
17.792	38.700
18.804	40.306
19.690	39.336
20.632	40.573
21.862	42.427
22.656	43.907
23.755	43.798
24.768	45.281
25.723	44.802
26.738	46.040
27.623	45.071
28.615	49.495
29.657	47.056];
data.tL_f(:,1) = 365*(0.9+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(9.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMorr1990';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.102	9.574
2.104	12.650
3.048	13.642
4.122	16.964
5.052	19.794
5.913	22.133
7.076	23.128
8.091	24.488
8.967	24.744
9.955	29.781
10.953	23.298
11.986	32.134
12.841	35.331
13.590	32.889
14.965	34.989
15.769	35.121
16.725	34.520
17.938	38.702
18.806	40.061
19.747	41.543
20.833	43.027
21.716	42.425
22.656	43.907
23.663	46.248
24.549	45.278
25.720	45.170
26.674	44.814
27.696	45.194
28.652	44.471
29.600	44.850];
data.tL_m(:,1) = 365*(0.9+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(9.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMorr1990';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... length (cm), weight (g)
15.780	78.040
15.780	85.624
17.006	93.378
18.231	85.962
18.231	192.142
18.384	139.073
18.844	70.878
19.304	139.200
19.916	222.712
20.682	154.559
21.142	215.296
22.214	192.691
22.368	147.207
22.521	238.239
22.981	170.044
23.287	276.266
23.593	230.803
24.819	208.219
24.819	238.556
25.585	337.257
25.738	276.604
25.891	231.120
25.891	215.951
26.504	299.462
27.270	314.737
28.036	314.842
28.189	428.628
28.955	421.149
29.109	352.912
29.262	383.270
29.721	360.580
30.334	383.418
30.487	519.956
30.641	626.157
30.641	466.887
30.794	436.571
30.947	542.772
30.947	307.659
31.407	482.161
31.407	482.161
32.019	565.673
32.632	512.667
32.786	588.531
32.786	641.621
33.092	717.506
33.398	649.290
34.164	581.137
34.471	687.359
34.624	740.470
34.930	748.097
35.390	687.486
35.543	763.350
35.543	793.687
35.543	824.024
35.850	725.470
36.309	824.129
36.616	862.093
36.769	755.934
36.922	930.394
37.535	922.894
37.688	839.488
37.841	938.105
37.841	801.588
38.607	968.547
38.607	938.210
38.607	900.289
38.914	1135.444
38.914	1036.848
38.914	1021.680
39.373	1090.001
39.986	1036.996
40.292	1211.476
40.292	1143.218
40.905	1082.628
41.058	1059.897
41.212	1241.940
41.365	1241.961
41.365	1143.366
41.825	1264.777
41.978	1340.641
41.978	1295.136
42.131	1317.910
42.284	1499.953
42.284	1439.279
42.897	1052.566
43.203	1348.395
43.357	1409.090
43.357	1386.337
43.510	1613.886
43.969	1659.455
43.969	1576.028
44.276	1659.498
44.276	1538.149
44.276	1507.812
44.276	1409.217
44.276	1439.554
44.582	1735.382
44.582	1287.911
45.195	1530.692
45.195	1454.849
45.195	1409.343
45.501	1636.914
45.655	1758.283
45.961	1538.382
46.114	1819.021
46.421	1728.052
46.421	1621.872
46.727	1781.184
47.033	1652.293
47.033	1599.204
47.187	1781.247
47.187	1758.494
47.340	1970.875
47.340	1826.774
47.953	1925.454
47.953	1735.847
47.953	1508.319
48.259	1879.991
48.565	2137.898
48.565	1963.460
48.719	1895.223
48.719	1849.717
48.872	2183.446
48.872	2009.008
49.178	1895.286
49.331	1887.723
49.485	2259.373
49.638	2206.304
49.638	2175.967
49.638	2062.203
49.791	2115.314
49.791	2100.146
49.791	1796.775
49.944	1948.481
50.710	2236.789
50.710	2274.711
50.710	2289.879
50.710	2039.598
50.710	1971.340
51.476	2001.783
51.936	2229.374
52.242	2441.776
52.242	2411.439
53.162	2487.408
54.540	2677.205];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
32.870	33877.139
33.789	185976.419
34.196	131160.840
34.349	157525.210
35.487	145258.968
39.362	189582.107
40.533	258472.570
41.388	252316.289
41.402	286807.895
41.699	315189.541
42.278	333403.431
42.677	260327.587
43.541	276489.364
44.147	361657.599
44.165	406293.773
44.371	211494.437
46.042	454837.076
46.408	302633.452
46.549	647549.532
46.592	402038.829
46.813	592745.562
48.290	361321.377
49.092	576328.719
49.619	468749.674
50.075	535669.181];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(9.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7PN'; % Cat of Life
metaData.links.id_ITIS = '166771'; % ITIS
metaData.links.id_EoL = '46568186'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_rosenblatti'; % ADW
metaData.links.id_Taxo = '187324'; % Taxonomicon
metaData.links.id_WoRMS = '274842'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-rosenblatti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-rosenblatti.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
