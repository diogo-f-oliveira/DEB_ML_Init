function [data, auxData, metaData, txtData, weights] = mydata_Phalacrocorax_aristotelis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Phalacrocoracidae';
metaData.species    = 'Phalacrocorax_aristotelis'; 
metaData.species_en = 'European shag'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0xMc'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 09 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 30.5;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'EoL';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 47;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'OstnJens2001';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'EoL: 53 d';
data.tp = 141;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'EoL: 53 d';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'EoL';
  temp.tR = C2K(40.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 35.8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OstnJens2001';
data.Wwi = 1990; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'OstnJens2001';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0.018	29.518
0.019	61.143
0.912	61.143
0.913	87.498
1.284	45.331
1.936	34.789
1.937	50.601
2.029	82.227
2.681	45.331
2.960	76.956
2.961	108.582
3.797	45.331
3.798	66.414
3.891	103.311
4.263	55.872
4.914	87.498
4.915	119.124
5.194	45.331
5.195	87.498
5.845	103.311
6.124	61.143
6.125	87.498
6.126	134.936
6.127	161.291
6.962	103.311
6.963	129.665
6.964	161.291
6.965	187.645
7.800	187.645
7.893	150.749
7.986	119.124
7.987	235.084
8.079	287.793
8.172	256.167
8.544	224.542
8.730	282.522
9.103	219.271
9.104	145.478
9.105	124.394
9.196	198.187
9.847	134.936
9.940	324.690
10.127	361.586
10.220	219.271
10.221	293.064
10.499	240.355
10.592	298.335
10.871	361.586
10.964	171.833
11.057	229.813
11.337	240.355
11.523	150.749
11.802	409.024
11.895	266.709
11.895	224.542
11.988	335.231
11.989	192.916
12.174	382.670
12.267	472.275
12.826	414.295
12.827	192.916
12.828	530.255
12.918	287.793
12.919	540.797
13.105	361.586
13.197	329.960
13.198	345.773
13.663	509.172
13.943	219.271
13.943	319.419
13.944	387.941
13.945	430.108
14.036	640.945
14.037	677.841
14.222	535.526
14.223	572.423
14.315	467.004
14.315	503.901
14.408	340.502
14.687	651.487
14.780	493.359
14.873	614.590
14.966	387.941
14.967	440.650
14.968	467.004
14.969	556.610
15.060	256.167
15.804	498.630
15.805	467.004
15.806	440.650
15.897	614.590
15.990	735.822
16.083	646.216
16.084	561.881
16.176	340.502
16.177	662.029
16.363	920.304
16.456	683.112
16.642	567.152
16.828	735.822
16.829	514.443
16.921	851.782
17.107	604.048
17.293	640.945
17.945	614.590
17.946	978.284
18.038	509.172
18.039	482.817
18.317	677.841
18.318	730.551
18.783	994.097
18.968	967.742
18.969	930.846
19.155	672.571
19.156	709.467
19.157	846.511
19.158	804.344
19.247	477.546
19.248	640.945
19.249	799.073
19.806	1015.181
19.807	930.846
20.178	772.718
20.179	841.240
20.272	572.423
20.273	614.590
20.923	872.866
20.923	904.491
20.923	667.300
21.016	467.004
21.016	767.447
21.016	825.427
21.016	941.388
21.389	994.097
21.482	925.575
21.947	962.471
21.947	667.300
22.040	872.866
22.133	983.555
22.319	793.802
22.413	1252.372
22.692	893.949
22.692	1004.639
22.878	941.388
22.878	1052.077
22.971	841.240
22.971	957.200
23.064	762.176
23.064	878.137
23.064	1152.225
23.064	1183.850
23.157	1231.289
23.250	1199.663
23.436	888.678
23.436	925.575
23.809	867.595
23.809	962.471
23.902	1004.639
23.995	1041.535
23.995	1073.161
23.995	1278.727
24.181	698.925
24.181	1231.289
24.367	1204.934
24.832	1194.392
24.926	830.698
25.019	1331.436
25.019	1088.974
25.019	973.013
25.112	1210.205
25.112	909.762
25.205	1247.101
25.205	1125.870
25.298	1521.189
25.763	1310.352
25.763	1352.520
25.856	1283.998
25.856	1136.412
25.856	762.176
25.949	1099.515
25.949	930.846
25.949	925.575
25.949	862.324
26.042	1226.018
26.042	1052.077
26.136	1415.771
26.136	1484.293
26.787	1447.397
26.787	1057.348
26.880	1378.874
26.973	1262.914
27.066	1315.623
27.066	1057.348
27.252	1199.663
27.252	1099.515
27.345	1241.830
27.345	1231.289
27.345	1131.141
27.718	1378.874
27.718	1315.623
27.811	1099.515
27.904	1210.205
27.904	1183.850
27.904	930.846
27.997	1278.727
27.997	1262.914
27.997	967.742
27.997	1009.910
28.090	1515.918
28.090	1547.544
28.276	862.324
28.928	1505.377
29.021	1204.934
29.021	1621.337
29.114	1189.121
29.114	1563.357
29.207	1257.643
29.207	1278.727
29.207	1394.687
29.207	1415.771
29.207	1452.667
29.300	1020.451
29.859	1262.914
29.859	1494.835
29.859	1621.337
29.952	1447.397
29.952	1542.273
30.045	1220.747
30.138	920.304
30.138	999.368
30.138	1726.755
30.231	1310.352
30.324	1189.121
30.324	1394.687
30.510	1505.377
30.789	1025.722
30.789	1479.022
30.882	1062.619
30.882	1642.421
30.975	1331.436
30.975	1790.006
31.068	1199.663
31.068	1257.643
31.162	1384.145
31.441	1537.002
31.627	1262.914
31.720	1436.855
31.720	1473.751
31.906	1347.249
31.906	1336.707
31.999	1247.101
32.092	1753.110
32.092	1726.755
32.185	1558.086
32.465	920.304
32.744	1368.333
32.837	1542.273
32.837	1563.357
32.930	1310.352
32.930	1689.859
32.930	1747.839
32.930	1790.006
33.023	1231.289
33.116	1515.918
33.116	1589.711
33.209	1457.938
33.768	1668.775
33.861	1505.377
33.861	1537.002
33.954	1689.859
33.954	1305.081
33.954	1336.707
34.047	1120.599
34.047	1584.441
34.140	1262.914
34.792	1637.150
34.792	1805.819
34.792	1426.313
34.792	1363.062
34.885	1758.381
34.885	1847.987
34.885	1473.751
34.885	1210.205
35.071	1721.484
35.071	1526.460
35.071	1510.648
35.722	1747.839
35.722	1431.584
35.908	1784.736
35.908	1431.584
35.908	1273.456
36.001	1826.903
36.001	1684.588
36.001	1484.293
36.095	1948.134
36.095	1647.692
36.188	1605.524
36.188	1573.899
36.281	1700.401
36.467	1378.874
36.932	1668.775
37.025	1626.608
37.025	1310.352
37.118	1442.126
37.118	1500.106
37.211	1816.361
37.211	1790.006
37.398	1389.416
37.770	1436.855
37.770	1310.352
37.863	1373.603
38.049	1494.835
38.049	1542.273
38.049	1584.441
38.142	1737.297
38.794	1299.811
38.887	1700.401
38.980	1626.608
39.073	1552.815
39.166	1473.751
39.166	1442.126
39.259	1658.233
39.724	1753.110
39.911	1600.253
40.004	1626.608
40.004	1521.189
40.097	1531.731
40.190	1795.277
40.283	1479.022
40.283	1473.751
40.283	1457.938
40.376	1573.899
40.748	1963.947
40.841	1747.839
40.934	1790.006
40.934	1457.938
41.028	1500.106
41.028	1531.731
41.121	1689.859
41.214	1647.692
41.214	1426.313
41.307	1347.249
41.865	1668.775
41.865	1479.022
41.865	1505.377
41.865	1542.273
42.051	1753.110
42.051	1594.982
42.051	1626.608
42.144	1347.249
42.610	1558.086
42.889	1795.277
42.982	1584.441
43.075	1452.667
43.261	1616.066
43.727	1579.170
44.099	1368.333
44.099	1426.313
44.192	1500.106
44.657	1494.835
44.844	1352.520
44.937	1737.297
44.937	1689.859
45.309	1605.524
45.402	1652.962
45.961	1689.859
45.961	1589.711
46.705	1658.233
46.705	1273.456
46.798	1689.859];
n = size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-2;end;end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'OstnJens2001';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: v reduced and food availability  in tW data is variable';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4FQQ3'; % Cat of Life
metaData.links.id_ITIS = '174733'; % ITIS
metaData.links.id_EoL = '45513571'; % Ency of Life
metaData.links.id_Wiki = 'Phalacrocorax_aristotelis'; % Wikipedia
metaData.links.id_ADW = 'Phalacrocorax_aristotelis'; % ADW
metaData.links.id_Taxo = '51677'; % Taxonomicon
metaData.links.id_WoRMS = '137178'; % WoRMS
metaData.links.id_avibase = 'CECC7B264A61BD22'; % avibase
metaData.links.id_birdlife = 'european-shag-gulosus-aristotelis'; % birdlife
metaData.links.id_AnAge = 'Phalacrocorax_aristotelis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phalacrocorax_auritus}}';
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
bibkey = 'OstnJens2001'; type = 'Article'; bib = [ ... 
'author = {J. E. {\O}stnes and  B. M. Jenssen and C. Bech}, ' ... 
'year = {2001}, ' ...
'title = {GROWTH AND DEVELOPMENT OF HOMEOTHERMY IN NESTLING EUROPEAN SHAGS (\emph{Phalacrocorax aristotelis})}, ' ...
'journal = {The Auk}, ' ...
'volume = {118}, ' ...
'pages = {983-995}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Phalacrocorax_aristotelis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049403/details}}';
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

