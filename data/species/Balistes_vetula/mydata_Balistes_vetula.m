function [data, auxData, metaData, txtData, weights] = mydata_Balistes_vetula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Balistidae';
metaData.species    = 'Balistes_vetula'; 
metaData.species_en = 'Queen triggerfish'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 01]; 

%% set data
% zero-variate data

data.am = 13 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'flmnh';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'estimate, derived from other species';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  comment.Li = 'mouth-to-tail; Kamogawa, Japan 1996, fact-sheet';

data.Wwb = 1.95e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MacK2008';
  comment.Wwb = 'based on egg diameter of 0.62 mm of B.capriscus: 4/3*pi*0.036^3';
data.Wwi = 5400;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri  = 8e5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork lenfth (cm)
 2 26.2
 3 24.2
 4 27.0
 5 30.0
 6 32.3
 7 33.0
 8 34.4
 9 35.8
10 36.7
11 37.3
12 37.9
14 40.8];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AlbuMart2011';

% length-weight
data.LW = [ ... % fork length (cm), wet weight (g)
18.789	167.173
19.031	189.506
19.393	167.077
19.877	222.928
21.931	205.821
21.932	289.714
22.175	362.382
22.415	261.672
23.019	278.354
23.342	328.638
23.583	267.078
23.624	311.815
23.866	350.926
23.951	580.219
24.147	289.360
24.470	322.865
24.511	356.416
24.832	322.807
25.036	423.446
25.037	540.895
25.116	395.469
25.155	356.313
25.358	468.137
25.558	367.434
25.600	440.134
25.840	372.982
25.922	468.047
26.203	400.888
26.205	490.373
26.285	462.396
26.648	501.488
26.648	535.045
26.686	400.811
26.768	434.355
26.889	467.892
26.971	557.365
27.012	596.508
27.130	423.111
27.210	400.727
27.212	512.583
27.372	462.222
27.454	534.916
27.454	557.287
27.694	462.171
27.775	473.344
27.816	529.265
28.017	501.269
28.059	585.155
28.059	618.712
28.097	462.107
28.259	529.195
28.379	490.026
28.418	355.791
28.583	624.221
28.626	803.185
28.662	529.130
29.065	529.066
29.067	657.701
29.227	601.747
29.428	556.972
29.510	652.037
29.548	528.989
29.711	629.634
29.791	579.286
29.874	780.614
29.915	802.979
29.954	741.452
29.989	394.690
29.992	551.289
30.033	646.361
30.034	696.696
30.157	825.312
30.158	864.462
30.234	601.586
30.275	646.322
30.515	556.798
30.518	713.398
30.562	970.661
30.677	623.887
30.679	746.929
30.719	713.365
30.798	607.089
30.921	741.297
30.922	791.633
30.923	864.339
31.000	657.392
31.003	858.734
31.241	618.204
31.323	696.490
31.324	758.011
31.399	416.836
31.405	802.741
31.485	724.429
31.645	657.289
31.645	674.068
31.807	724.377
31.970	830.615
32.005	534.189
32.051	897.716
32.129	718.733
32.130	769.068
32.131	852.961
32.410	673.945
32.411	757.838
32.412	819.359
32.453	858.502
32.455	942.395
32.457	1065.437
32.496	992.724
32.496	1031.873
32.535	897.639
32.695	852.871
32.733	729.822
32.774	780.151
32.934	713.011
32.939	981.467
33.018	919.933
33.061	1059.747
33.098	847.213
33.133	567.566
33.137	791.279
33.140	959.064
33.260	925.487
33.419	824.791
33.462	986.976
33.463	1020.533
33.542	925.442
33.702	841.524
33.782	852.697
33.865	964.540
33.906	1026.055
33.948	1109.941
33.987	1076.378
34.024	841.473
34.024	852.658
34.063	768.759
34.065	891.802
34.186	919.746
34.187	964.489
34.188	1020.417
34.306	869.392
34.390	1042.756
34.511	1104.258
34.549	942.060
34.550	986.802
34.789	846.943
34.792	1025.914
34.952	936.403
34.955	1160.116
35.035	1115.360
35.192	824.508
35.194	975.514
35.195	1064.999
35.237	1160.071
35.356	1025.823
35.357	1092.937
35.438	1132.074
35.517	997.834
35.599	1115.270
35.837	880.333
35.842	1221.495
35.878	941.847
35.921	1131.997
35.927	1489.938
35.960	992.170
35.961	1070.470
35.961	1115.212
35.964	1249.440
35.996	768.450
36.003	1204.691
36.043	1176.720
36.080	964.186
36.326	1215.825
36.327	1316.496
36.444	1042.428
36.521	829.888
36.643	941.725
36.647	1143.067
36.647	1187.810
36.809	1249.305
36.847	1053.549
36.926	952.866
36.969	1137.423
37.014	1461.800
37.052	1282.823
37.129	1064.690
37.131	1238.068
37.292	1170.928
37.493	1148.525
37.496	1377.831
37.536	1316.303
37.614	1215.619
37.814	1103.730
37.815	1148.473
37.860	1439.294
37.899	1388.952
37.977	1249.118
37.981	1495.203
38.015	1058.956
38.060	1377.740
38.098	1204.356
38.100	1338.584
38.101	1439.255
38.221	1360.936
38.260	1299.409
38.424	1455.982
38.499	1148.364
38.586	1528.663
38.624	1355.279
38.625	1422.393
38.703	1310.523
38.750	1674.051
38.786	1455.924
38.863	1215.420
38.869	1562.175
38.908	1478.276
38.947	1422.341
38.950	1623.683
39.070	1584.514
39.106	1304.866
39.148	1377.567
39.391	1461.420
39.391	1472.606
39.594	1606.802
39.711	1349.512
39.712	1405.441
39.793	1472.542
39.914	1438.965
40.033	1332.682
40.036	1539.617
40.037	1606.731
40.038	1651.474
40.039	1724.180
40.072	1276.748
40.276	1444.500
40.355	1315.852
40.522	1712.917
40.564	1780.025
40.640	1494.778
40.682	1617.814
40.758	1360.531
40.844	1679.309
40.922	1517.104
40.922	1545.068
40.961	1416.427
41.164	1528.251
41.165	1606.551
41.166	1679.257
41.167	1757.557
41.571	1824.607
41.609	1679.187
41.809	1550.519
42.012	1679.122
42.054	1785.380
42.060	2165.692
42.092	1628.774
42.095	1830.116
42.255	1757.383
42.860	1790.844
42.944	2053.694
43.103	1897.069
43.302	1740.437
43.461	1639.741
43.707	1874.601
44.030	1941.663
44.030	1964.035
44.031	1991.999
44.069	1863.357
44.075	2254.855
44.112	2036.729
44.556	2059.029
44.557	2165.293
45.564	2153.946
45.764	2053.243];
units.LW   = {'d', 'cm'};  label.LW = {'fork length', 'wet weight'};  
bibkey.LW = 'AlbuMart2011';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = ' reef-associated; depth range 2 - 275 m, usually 3 - 30 m ';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Feeds on molluscs, crustaceans and echinoderms, especially the sea urchin Diadema antillarium';
metaData.bibkey.F2 = 'arkive'; 
F3 = 'No sex difference in growth, but femlaes become older';
metaData.bibkey.F3 = 'AlbuMart2011'; 
metaData.facts = struct('F1',F1,'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'KH7G'; % Cat of Life
metaData.links.id_ITIS = '173139'; % ITIS
metaData.links.id_EoL = '46570656'; % Ency of Life
metaData.links.id_Wiki = 'Balistes_vetula'; % Wikipedia
metaData.links.id_ADW = 'Balistes_vetula'; % ADW
metaData.links.id_Taxo = '47004'; % Taxonomicon
metaData.links.id_WoRMS = '127397'; % WoRMS
metaData.links.id_fishbase = 'Balistes-vetula'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Balistes_vetula}}';
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
bibkey = 'AlbuMart2011'; type = 'Article'; bib = [ ... 
'author = {C. Q. de Albuquerque and A. S. Martins and N. de Oliveira Leite Jr and J. N. de Araujo and A. M. Ribeiro}, ' ... 
'year = {2011}, ' ...
'title = {AGE AND GROWTH OF THE QUEEN TRIGGERFISH \emph{Balistes vetula} ({T}ETRAODONTIFORMES, {B}ALISTIDAE) OF THE CENTRAL COAST OF {B}RAZIL}, ' ...
'journal = {Brazilian Journal of Oceonagraphy}, ' ...
'volume = {59}, ' ...
'pages = {231--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacK2008'; type = 'Phdthesis'; bib = [ ... 
'author = {C. MacKichan Simmons}, ' ... 
'year = {2008}, ' ...
'title = {Gray triggerfish \emph{Balistes capriscus}, reproductive behaviour, early life history, and competitive iteractions between red snapper, \emph{Lutjanus campechanus}, in the nothern {G}ulf of {M}exico}, ' ...
'school = {Auburn University}, ' ...
'volume = {59}, ' ...
'pages = {231--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/19}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/queen-triggerfish/balistes-vetula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flmnh'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.flmnh.ufl.edu/fish/discover/species-profiles/balistes-vetula/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

