function [data, auxData, metaData, txtData, weights] = mydata_Ardea_herodias
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Ardeidae';
metaData.species    = 'Ardea_herodias'; 
metaData.species_en = 'Great blue heron'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFe', '0iMm'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi', 'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-pX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 11 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 27;   units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 55;     units.tx = 'd';    label.tx = 'time since birth at fledging';    bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 165;     units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 669;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'AnAge';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 24.5*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 54;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'BennWhit1995';
data.Wwi = 2180;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'BennWhit1995';
data.Wwim = 2485; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'BennWhit1995';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
0.009	54.248
0.873	54.114
1.616	64.849
2.727	64.677
4.215	107.846
5.205	118.542
5.706	161.864
7.319	210.439
8.189	248.279
8.940	313.262
10.059	356.488
10.930	399.753
11.927	453.848
13.174	535.028
13.925	594.587
14.927	681.231
15.927	757.025
16.806	843.688
17.933	941.163
18.936	1038.656
20.183	1108.987
20.933	1168.546
21.933	1244.340
22.808	1309.304
24.180	1395.890
25.054	1455.429
26.175	1514.930
26.926	1574.488
28.163	1590.571
28.920	1688.103
30.040	1742.179
31.031	1763.725
31.909	1844.964
32.901	1871.935
33.888	1871.782
34.638	1925.915
35.629	1947.461
36.747	1990.688
37.615	2012.253
38.610	2055.498
39.845	2060.732
40.833	2060.579
41.827	2098.399
42.940	2109.077
43.808	2130.642
44.669	2114.234
45.904	2114.042
46.771	2135.608
47.637	2146.323
48.255	2146.228
49.984	2151.385
51.467	2162.005
52.825	2161.794
53.691	2172.510
55.420	2177.667
56.408	2177.514
58.383	2177.207
59.371	2177.054
60.114	2193.214
61.098	2171.362
61.715	2171.266
63.070	2149.356
64.303	2138.315
65.170	2159.881
67.023	2165.018
67.891	2186.584
68.878	2186.431
69.740	2170.022];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BennWhit1995';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (d), weight (g)
0.000	54.547
1.118	65.648
2.477	76.769
3.096	87.775
3.591	98.761
4.581	120.734
4.830	131.681
6.068	159.147
7.059	186.574
7.928	230.346
9.045	274.157
10.036	301.584
11.030	356.284
12.023	394.621
12.769	438.373
13.890	520.366
14.640	596.847
15.886	689.768
17.008	771.761
18.007	864.644
19.251	946.656
19.881	1044.936
21.003	1132.384
21.755	1225.228
22.753	1312.657
23.875	1394.649
24.869	1449.350
25.989	1520.433
26.620	1629.623
27.617	1706.142
28.981	1755.445
29.855	1837.400
30.973	1892.119
31.966	1935.910
32.963	2012.429
33.955	2045.311
34.948	2089.102
35.818	2132.874
36.933	2171.230
37.927	2220.476
38.424	2242.371
39.786	2280.766
40.655	2319.083
41.770	2346.529
42.389	2362.989
43.624	2368.636
44.741	2412.447
45.730	2423.510
46.840	2418.229
47.831	2440.201
48.571	2434.862
49.684	2451.399
50.550	2462.443
51.663	2478.980
52.403	2479.096
53.761	2473.853
54.501	2468.513
55.613	2479.596
56.727	2496.133
57.960	2485.416
58.702	2496.441
59.814	2502.069
60.676	2485.839
61.662	2469.629
62.651	2486.147
63.762	2480.866
64.625	2470.091
66.108	2486.686
66.849	2486.801
67.712	2476.027
68.577	2481.616
69.566	2498.134];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BennWhit1995';
comment.tW_m = 'Data for males';
  
% time-energy intake
data.tp_A = [ ... % time since birth (d), metabolizable energy intake (kJ/d)
0.114	40.710
0.790	105.817
1.689	142.410
2.813	195.276
3.713	256.299
4.953	390.591
5.970	537.112
6.763	716.219
7.775	773.163
8.675	834.186
10.022	854.466
10.815	1009.143
12.052	1090.504
12.841	1171.891
14.078	1232.894
14.985	1448.640
15.882	1436.373
16.784	1546.255
17.683	1586.919
18.804	1562.424
19.923	1501.284
20.718	1717.036
21.957	1835.042
22.852	1773.915
23.641	1851.231
24.873	1818.586
25.900	2197.191
26.788	1993.556
27.801	2074.930
28.925	2103.366
29.931	2034.090
31.055	2082.884
31.840	2082.838
32.957	1964.695
33.864	2180.441
34.867	2041.946
35.986	1980.806
36.890	2127.333
37.896	2049.913
38.904	2000.994
39.915	2033.509
40.812	2025.313
41.926	1854.239
42.822	1821.613
43.719	1801.203
44.723	1687.138
45.849	1784.792
46.855	1707.372
47.861	1625.881
48.871	1621.750
49.882	1666.480
50.890	1617.561
51.899	1609.359
53.129	1515.639
53.583	1645.906
54.710	1747.632
56.052	1662.049
56.945	1560.206
57.958	1633.437
58.966	1608.948
60.085	1543.736
60.984	1580.329
61.988	1445.906
62.998	1449.919
64.006	1409.143
65.137	1624.876
66.030	1535.247
67.043	1596.263
68.050	1551.416
68.944	1469.931
69.841	1461.736];
units.tp_A   = {'d', 'kJ/d'};  label.tp_A = {'time since birth', 'energy intake'};  
temp.tp_A    = C2K(40.6);  units.temp.tp_A = 'K'; label.temp.tp_A = 'temperature';
bibkey.tp_A = 'BennWhit1995';
comment.tp_A = 'Data for both females and males';

%% set weights for all real data
weights = setweights(data, []);
weights.tp_A = weights.tp_A * 2;
weights.tW_f = weights.tW_f * 2;
weights.tW_m = weights.tW_m * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'GCHW'; % Cat of Life
metaData.links.id_ITIS = '174773'; % ITIS
metaData.links.id_EoL = '45511351'; % Ency of Life
metaData.links.id_Wiki = 'Ardea_herodias'; % Wikipedia
metaData.links.id_ADW = 'Ardea_herodias'; % ADW
metaData.links.id_Taxo = '51741'; % Taxonomicon
metaData.links.id_WoRMS = '159382'; % WoRMS
metaData.links.id_avibase = '93694BB5492F7012'; % avibase
metaData.links.id_birdlife = 'great-blue-heron-ardea-herodias'; % birdlife
metaData.links.id_AnAge = 'Ardea_herodias'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ardea_herodias}}';
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
bibkey = 'BennWhit1995'; type = 'Article'; bib = [ ... 
'author = {D. C. Bennett and P. E. Whitehead and L. Hart}, ' ... 
'year = {1995}, ' ...
'title = {GROWTH AND ENERGY REQUIREMENTS OF HAND-REARED GREAT BLUE HERON (\emph{Ardea herodias}) CHICKS}, ' ...
'journal = {The Auk}, ' ...
'volume = {112}, ' ...
'number = {1}, ' ...
'pages = {201--209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ardea_herodias}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.arkive.org/great-blue-heron/ardea-herodias/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

