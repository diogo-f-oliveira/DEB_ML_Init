  function [data, auxData, metaData, txtData, weights] = mydata_Cycleptus_meridionalis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Cycleptus_meridionalis'; 
metaData.species_en = 'Southeastern blue sucker'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 03]; 

%% set data
% zero-variate data
data.am = 33*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 39;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
  comment.Lp = 'based on tp 5 yr, and tL data';
data.Li = 59.3;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 2.5e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg weight';
data.Wwi = 1.26e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00372*Li^3.12, see F1';

data.GSI  = 0.15;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'PeteNich1999';   
  temp.GSI = C2K(18);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
3.784	32.906
5.982	44.462
6.120	45.585
7.004	46.027
7.082	50.521
7.084	51.308
7.147	49.397
8.082	42.761
8.089	45.682
8.090	46.019
8.090	46.244
8.091	46.469
8.091	46.693
8.093	47.592
8.164	48.715
9.036	44.102
9.046	48.821
9.049	49.832
9.053	51.742
9.123	52.978
9.176	46.236
9.179	47.584
10.063	48.139
10.068	50.611
10.073	52.521
10.214	55.105
11.008	45.773
11.025	53.525
11.028	54.649
11.029	55.211
11.072	44.312
11.092	52.851
11.156	51.390
11.170	57.345
11.216	47.794
11.221	50.041
12.030	47.450
12.030	47.788
12.032	48.686
12.035	50.035
12.038	51.158
12.040	51.945
12.043	53.181
12.112	53.967
12.917	49.691
12.919	50.478
12.920	51.152
12.922	52.051
13.002	57.331
13.116	47.555
13.117	48.116
13.200	54.970
13.849	41.819
13.944	53.616
13.946	54.402
14.016	55.301
14.018	56.312
14.069	48.896
14.088	57.435
14.139	49.682
14.141	50.581
14.144	51.929
14.213	52.715
14.836	57.767
14.968	56.305
14.969	56.867
15.014	46.529
15.015	47.091
15.017	47.990
15.019	49.001
15.023	50.349
15.025	51.361
15.100	54.394
15.231	52.483
15.967	47.870
15.969	48.545
15.970	49.219
15.978	52.589
15.993	59.331
16.043	51.353
16.051	55.061
16.054	56.297
16.063	60.454
16.107	49.779
16.109	50.454
16.115	53.375
16.919	48.425
16.922	49.886
16.934	55.167
17.062	51.907
17.063	52.244
17.064	52.694
17.072	56.177
17.076	57.862
17.160	65.277
17.734	48.981
17.936	48.080
18.084	53.697
18.096	58.978
18.171	62.124
19.093	49.308
19.094	50.094
19.110	56.836
19.165	51.330
19.169	52.903
19.170	53.689
19.183	59.307
19.197	65.487
20.066	59.750
20.068	60.649
20.807	57.160
20.808	57.609
20.851	46.710
21.014	58.731
21.052	45.473
21.100	66.596
21.140	54.349
21.951	52.769
21.975	63.443
21.977	64.230
22.014	50.746
22.016	51.421
23.027	48.267
23.034	51.638
23.046	56.694
23.985	51.855
24.063	56.237
24.064	56.686
24.066	57.473
24.113	48.371
24.122	52.304
25.092	61.173
25.893	55.212
26.923	60.485
26.926	61.833
26.986	58.237
27.052	57.338
27.137	64.978
28.007	59.353
28.888	58.785
29.020	57.436
29.986	64.282
29.989	65.518
31.016	69.555
31.049	53.937
31.060	59.106
31.063	60.117
33.097	59.203];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PeteNich1999';

% time - weight
data.tWw = [ ... % year class (yr), wet weight (g)
3.747	413.015
5.783	868.757
5.919	999.358
6.122	593.952
6.937	1638.994
7.005	893.836
7.072	1024.496
7.072	985.281
7.887	775.420
7.955	1062.943
7.955	1141.374
8.023	840.662
8.023	932.165
8.769	1532.821
8.769	1310.599
8.905	1702.638
8.973	983.624
8.973	918.265
8.973	709.115
9.041	1061.997
9.855	956.712
9.923	1048.156
9.991	1453.325
9.991	1570.972
10.873	1831.641
10.873	1334.909
10.873	1256.478
10.873	1164.975
10.873	825.106
10.873	694.387
10.941	903.478
11.009	2236.752
11.009	1047.209
11.009	981.850
11.891	1177.159
11.891	1242.519
11.891	1307.878
11.891	1595.460
11.959	981.022
12.027	1098.610
12.706	1058.803
12.706	993.443
12.842	1908.358
12.842	1699.207
12.842	1385.482
12.842	1333.194
12.842	1267.835
13.045	1594.455
13.860	1998.974
13.928	874.731
13.928	940.091
13.928	1436.823
13.928	1567.542
13.928	1672.117
13.928	1711.333
13.928	1763.620
13.928	1855.124
13.928	1894.339
13.995	1044.607
13.995	1279.901
14.063	1109.907
14.063	1188.339
14.810	1788.995
14.810	1540.629
14.810	1540.629
14.810	1396.838
14.810	1357.623
14.810	1122.328
14.810	1017.753
15.014	2063.328
15.014	1958.752
15.014	886.857
15.014	769.210
15.624	1056.259
15.760	1448.298
15.896	1134.454
15.896	1225.957
15.896	1709.617
15.896	1971.055
15.964	2180.146
16.100	1304.211
16.100	2271.531
16.710	3225.247
16.914	1839.449
16.914	1761.018
16.914	1682.586
16.914	1643.371
16.914	1329.645
16.914	1264.286
16.914	1198.926
16.982	2336.122
16.982	1094.292
17.050	1486.390
17.050	898.154
17.796	819.072
17.796	910.576
17.796	1028.223
17.864	2139.275
17.932	3550.980
17.932	1184.967
17.932	1459.477
18.000	1315.627
18.679	3132.029
18.747	1811.708
18.747	1680.989
18.950	2465.126
18.950	1550.093
18.950	1445.518
18.950	1340.943
18.950	1144.864
18.950	1066.433
19.697	2150.750
19.968	2581.885
20.783	3548.496
20.783	973.333
20.919	2032.038
20.919	1234.652
21.054	1600.547
21.597	1364.780
21.869	2933.170
21.869	3050.818
21.869	920.099
22.005	1599.719
22.955	1520.459
22.955	1259.021
23.226	1559.438
23.769	1062.233
23.769	1114.521
23.769	2094.913
23.837	1271.324
23.837	1349.756
23.837	1964.135
23.905	1885.644
24.923	2159.267
24.991	2263.783
26.009	2014.530
26.756	1804.729
26.756	2549.827
26.891	2941.865
26.891	3255.591
26.959	1909.126
26.959	2275.140
27.842	2117.508
28.928	1985.843
28.928	2142.705
29.810	3344.551
29.946	3096.066
30.014	1448.948
30.964	4232.434
30.964	1905.637
31.032	2232.375
33.000	1930.006];
data.tWw(:,1) = data.tWw(:,1) * 365; % convert yr to d
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(18);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'PeteNich1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00372 * (TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '32T6W'; % Cat of Life
metaData.links.id_ITIS = '639711'; % ITIS
metaData.links.id_EoL = '214027'; % Ency of Life
metaData.links.id_Wiki = 'Cycleptus_elongatus'; % Wikipedia
metaData.links.id_ADW = 'Cycleptus_meridionalis'; % ADW
metaData.links.id_Taxo = '172478'; % Taxonomicon
metaData.links.id_WoRMS = '1010329'; % WoRMS
metaData.links.id_fishbase = 'Cycleptus-meridionalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cycleptus}}';  
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
bibkey = 'PeteNich1999'; type = 'Article'; bib = [ ...  
'author = {Mark S. Peterson and Larry C. Nicholson and Douglas J. Snyder and Gregory L. Fulling}, ' ...
'year = {1999}, ' ...
'title = {Growth, Spawning Preparedness, and Diet of \emph{Cycleptus meridionalis} ({C}atostomidae)}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {128}, '...
'pages = {900-908}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cycleptus-meridionalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

