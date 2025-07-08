  function [data, auxData, metaData, txtData, weights] = mydata_Macquaria_ambigua
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Macquaria_ambigua'; 
metaData.species_en = 'Golden Perch'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 13];

%% set data
% zero-variate data
data.ab = 1.3;      units.ab = 'd';  label.ab = 'age at puberty for females';  bibkey.ab = 'fishbase';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 45;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 76;    units.Li = 'cm'; label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';

data.Wwb = 1.4e-2;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'mdb';
  comment.Wwb = 'based on egg diameter of 3-4 mm: pi/6*0.3^3';
data.Wwi = 24e3;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';               bibkey.Wwi = 'fishbase';
 
data.Ri = 5e5/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'mdb';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length-weight
data.tL = [ ... % time since birth (yr), total length (cm)
 1	19.720
 2	30.288
 3	36.944
 4	42.400
 5	43.046
 6	46.099
 7	50.352
 8	50.549
 9	51.496
10	50.794
11	55.798
16	56.032];
data.tL (:,1) = (0.3 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AdeMori1992';

% length-weight
data.LWw = [ ... % total length (cm), wet weight (g)
8.245	1.716
10.000	12.333
10.614	-2.203
11.931	69.572
12.632	40.609
13.071	40.519
13.685	69.211
14.211	40.284
14.650	69.012
15.266	155.341
15.792	155.232
16.668	97.415
17.018	39.706
17.721	97.198
18.159	68.290
18.686	111.409
19.388	111.265
19.653	240.893
20.265	111.084
20.617	197.467
20.966	82.121
21.757	182.823
22.109	240.388
22.458	96.223
22.721	139.397
23.250	283.380
23.951	225.599
24.389	182.281
24.390	268.736
25.093	311.819
25.530	239.683
25.883	326.066
26.410	398.004
26.933	210.576
27.463	383.378
28.074	253.569
28.428	397.589
28.781	512.789
28.865	339.861
29.571	570.264
29.832	426.118
30.182	368.409
30.536	555.656
30.881	224.173
30.973	483.519
31.241	742.830
31.765	641.858
31.857	886.796
32.026	483.303
32.463	382.349
32.730	627.250
33.166	497.477
33.522	771.180
33.688	238.004
33.782	598.215
33.788	915.217
34.218	439.624
34.745	482.743
34.750	756.517
34.752	886.200
34.844	1131.138
34.924	655.617
35.110	1289.585
35.624	554.608
35.717	886.002
36.239	640.937
36.676	568.801
36.945	900.158
36.948	1029.840
37.031	784.866
37.644	741.512
37.821	813.522
37.827	1159.342
37.916	1202.552
37.997	856.713
38.264	1072.797
38.618	1216.816
38.883	1346.445
38.959	683.605
39.141	1058.207
39.229	1058.189
39.233	1274.327
39.239	1620.147
39.323	1418.400
39.401	870.834
39.404	1043.744
39.845	1158.927
40.281	1043.563
40.550	1374.920
40.718	928.199
40.728	1533.385
40.811	1216.365
41.335	1129.802
41.429	1461.194
42.126	1187.276
42.134	1648.369
42.301	1158.421
42.390	1244.858
42.396	1576.269
42.563	1129.549
42.655	1374.487
42.825	1028.631
43.103	1878.717
43.359	1504.025
43.539	1748.944
43.614	999.650
43.717	1893.000
43.971	1374.216
43.975	1561.535
43.984	2109.083
44.489	898.605
44.592	1777.546
44.677	1590.209
44.938	1489.291
44.944	1849.520
45.212	2094.421
45.374	1359.518
45.557	1777.348
45.643	1662.056
45.726	1417.082
45.829	2267.205
46.620	2339.088
46.696	1690.658
46.701	1964.432
47.145	2266.934
47.410	2396.563
47.589	2598.255
47.669	2165.962
47.766	2684.674
47.828	1186.102
48.026	2511.710
48.030	2699.029
48.194	2079.398
48.199	2367.582
48.909	2828.531
49.016	3938.019
49.164	2381.792
49.335	2093.573
49.525	2958.087
49.622	3447.981
49.871	2684.241
50.129	2367.185
50.132	2540.095
50.341	4427.660
50.398	2712.950
50.569	2424.731
50.756	3101.926
50.905	1574.518
51.110	3289.173
51.116	3649.402
51.802	2741.480
52.050	1848.057
52.163	3303.365
52.176	4038.233
52.255	3562.713
53.128	3331.985
53.205	2683.554
53.210	2957.329
53.315	3994.771
53.825	3043.657
53.846	4225.209
54.005	3274.168
54.709	3446.934
54.990	4426.703
55.851	3504.336
57.805	4901.628
59.895	4036.644
60.319	3172.004];
units.LWw = {'cm', 'g'}; label.LWw  = {'total length', 'wet weight'};  
bibkey.LWw = 'AdeMori1992';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 2 * weights.tL;
weights.Wwi = 0 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Data ab and Wwi is ignored due to inconsistency with tL and LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3X24T'; % Cat of Life
metaData.links.id_ITIS = '641895'; % ITIS
metaData.links.id_EoL = '211386'; % Ency of Life
metaData.links.id_Wiki = 'Macquaria_ambigua'; % Wikipedia
metaData.links.id_ADW = 'Macquaria_ambigua'; % ADW
metaData.links.id_Taxo = '179429'; % Taxonomicon
metaData.links.id_WoRMS = '1020364'; % WoRMS
metaData.links.id_fishbase = 'Macquaria-ambigua'; % fishbase

%% References
bibkey = 'AdeMori1992'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12439}, ' ...
'author = {John R. Anderson and A. K. Morison and D. J. Ray}, ' ...
'year = {1992}, ' ...
'title = {Validation of the Use of Thin-sectioned Otoliths for Determining the Age and Growth of Golden Perch, \emph{Macquaria ambigua} ({P}erciformes: {P}ercichthyidae), in the Lower {M}urray-{D}arling Basin, {A}ustralia}, ' ... 
'journal = {Aust. J. Mar. Freshwater Res.}, ' ...
'volume = {43}, '...
'pages = {1103-1128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Macquaria-ambigua}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'mdb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.mdb.fish/fish-fact-sheets/golden-perch}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
