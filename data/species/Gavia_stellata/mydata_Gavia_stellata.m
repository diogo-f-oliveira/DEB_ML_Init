function [data, auxData, metaData, txtData, weights] = mydata_Gavia_stellata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Gaviiformes'; 
metaData.family     = 'Gaviidae';
metaData.species    = 'Gavia_stellata'; 
metaData.species_en = 'Red-throated diver'; 

metaData.ecoCode.climate = {'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFl', 'xiMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'EXx'; 'pX_t'}; 
metaData.data_1     = {'t-Ww'; 'Ww-pX'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 01 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 26;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'RizzSchm2015';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from FourKara2007';
data.tx = 49;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'RizzSchm2015';   
  temp.tx = C2K(39.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from Suite101';
data.tp = 147;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from Suite101';
data.tR = 2.5*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(39.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(39.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 55;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RizzSchm2015';
data.Wwi = 1614; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'RizzSchm2015';
data.Wwim = 1741; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'RizzSchm2015';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'RizzSchm2015';   
  temp.Ri = C2K(39.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pX25  = 1214; units.pX25  = 'kJ/d'; label.pX25  = 'metab energy at 25 d'; bibkey.pX25  = 'RizzSchm2015';   
  temp.pX25 = C2K(39.3);  units.temp.pX25 = 'K'; label.temp.pX25 = 'temperature';
  comment.pX25 = 'Daily metabolizable energy is ingested minus excreted energy';

data.EXx  = 58.6; units.EXx  = 'MJ'; label.EXx  = 'cumulated food energy at fledging (25 d)'; bibkey.EXx  = 'RizzSchm2015';   
  
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
6.690	143.234
7.628	255.486
7.880	344.752
7.890	176.446
8.825	344.800
8.832	240.247
8.915	275.952
8.921	189.249
9.601	304.038
9.680	418.796
9.682	377.995
9.693	196.939
9.770	344.848
10.034	245.408
10.291	263.272
10.370	365.280
10.809	222.497
10.887	344.905
10.889	304.104
11.049	497.919
11.055	403.566
11.065	248.011
11.149	270.966
11.740	449.502
11.742	418.901
11.910	475.012
11.921	299.056
12.011	220.008
12.089	360.267
12.267	250.622
12.768	495.457
12.776	355.202
12.778	324.601
12.867	283.804
12.869	243.003
13.710	546.506
13.800	477.659
13.805	393.506
14.061	421.570
14.155	288.970
15.176	454.778
15.680	630.760
15.864	436.962
16.030	538.974
16.625	633.358
16.798	612.966
16.895	437.015
17.656	638.511
17.732	804.271
18.689	597.762
18.944	651.327
19.714	697.268
19.877	845.182
19.882	755.929
19.970	722.782
19.980	559.577
20.832	687.125
20.999	763.636
21.690	702.469
21.778	669.322
21.943	768.784
21.945	740.733
22.718	753.523
22.792	947.334
22.970	847.889
22.971	830.039
22.988	549.530
23.062	735.690
23.740	896.380
23.833	773.981
24.768	939.784
24.778	784.229
25.713	937.283
25.815	679.729
26.151	794.500
26.659	927.130
26.734	1105.641
26.741	995.987
26.747	896.534
26.844	712.932
26.910	1029.147
27.005	886.347
27.609	835.376
27.701	743.577
27.765	1100.593
27.846	1174.550
27.850	1108.248
27.857	996.044
27.868	814.988
27.945	967.997
27.948	919.546
28.028	1008.803
28.717	985.887
28.727	827.782
28.800	1034.343
28.808	906.839
28.884	1062.399
28.892	932.344
28.976	968.050
29.059	1008.856
29.662	988.486
29.669	868.632
29.759	812.534
29.912	1110.903
29.913	1098.152
29.917	1034.400
29.918	1008.900
30.095	934.956
30.610	937.532
30.685	1118.593
30.686	1103.292
30.778	998.743
30.780	960.492
30.862	1026.798
30.872	866.143
31.047	825.351
31.641	942.685
31.642	914.634
31.717	1100.795
31.973	1126.308
31.978	1039.606
31.982	988.604
32.922	1070.255
32.929	945.301
33.682	1281.951
33.704	922.389
33.867	1060.103
34.046	945.358
34.820	924.997
35.685	833.237
36.808	744.041
36.965	976.108
37.046	1052.615
37.633	1297.453
37.635	1266.852
37.651	993.993
37.812	1169.958
37.821	1027.153
37.825	963.401
37.902	1101.110
37.917	871.603
38.163	1055.222
38.752	1261.809
38.753	1238.858
38.759	1149.605
38.785	713.541
38.847	1101.158
38.858	935.403
38.860	897.152
39.035	851.259
39.195	1039.974
39.197	1011.923
39.704	1147.104
39.788	1167.509
39.860	1394.470
39.866	1297.567
39.869	1261.866
39.879	1083.360
39.885	996.657
39.887	968.606
40.061	920.164
40.753	853.897
40.811	1310.366
40.846	734.047
40.904	1190.516
40.914	1032.411
40.991	1172.670
40.998	1063.016
41.006	932.962
41.348	955.930
41.603	1001.845
41.759	1261.962
41.761	1221.161
41.854	1103.862
41.866	904.955
41.945	1027.364
42.029	1060.519
42.620	1231.405
42.621	1200.804
42.709	1170.208
42.722	966.201
42.790	1256.915
42.902	825.955
43.837	994.309
44.013	925.465
44.851	1274.871
44.932	1343.727
45.033	1093.823
45.902	940.862
46.758	997.008
46.759	974.057
47.872	1030.216
49.852	966.565];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'RizzSchm2015';

% weight-daily energy expenditure
data.WpE = [ ... % weight (g), DEE (kJ/d)
199.176	280.870
213.444	390.863
251.729	525.647
251.998	346.953
254.366	371.700
266.150	533.922
280.442	627.421
283.030	506.464
306.940	602.731
307.175	446.030
357.153	803.517
367.412	380.169
381.758	437.929
383.866	635.872
405.391	718.388
405.602	578.182
415.133	638.682
427.152	644.204
431.910	679.952
453.894	457.315
458.234	770.726
585.431	966.164
725.148	834.480
806.836	900.620
818.801	941.880
832.858	1192.080
838.053	936.420
847.192	1258.087
847.746	889.703
871.767	911.744
900.220	1186.714
905.353	972.291
914.922	1008.048
917.096	1162.005
934.174	1002.588
941.791	735.936
942.973	1549.684
943.630	1112.572
953.062	1239.051
953.236	1123.588
953.451	980.633
970.421	892.694
972.480	1123.625
989.636	911.975
991.025	1588.267
991.757	1101.670
1011.158	997.241
1023.086	1063.244
1032.629	1115.496
1039.528	1327.193
1046.868	1244.734
1050.208	623.434
1051.911	1090.792
1064.438	758.170
1066.203	1184.291
1082.512	1536.213
1087.960	1112.856
1107.311	1041.416
1140.620	1286.155
1160.265	1019.527
1169.837	1052.535
1172.520	868.348
1232.008	1300.080
1282.371	1401.897
1325.756	1344.250];
units.WpE   = {'g', 'kJ/d'};  label.WpE = {'weight', 'daily energy expenditure'};  
temp.WpE    = C2K(39.3);  units.temp.WpE = 'K'; label.temp.WpE = 'temperature';
bibkey.WpE  = 'RizzSchm2015';
comment.WpE = 'daily energy expenditure DEE = DME - RE; daily metabolizable energy DME = p_X - p_P (where p_P is excretory energy; retained energy RE = d/dt E_W';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.WpE = weights.WpE * 2;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'The contribution of nitrogen waste in excreted energy is assumed to be small';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Breeds near small ponds, but food (fish) brought by parents comes from big lakes or coast upto 20 km away; fed till fledging';
metaData.bibkey.F1 = {'RizzSchm2015'}; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3FFP8'; % Cat of Life
metaData.links.id_ITIS = '174474'; % ITIS
metaData.links.id_EoL = '45508995'; % Ency of Life
metaData.links.id_Wiki = 'Gavia_stellata'; % Wikipedia
metaData.links.id_ADW = 'Gavia_stellata'; % ADW
metaData.links.id_Taxo = '51433'; % Taxonomicon
metaData.links.id_WoRMS = '137188'; % WoRMS
metaData.links.id_avibase = '6C50988A5445ED76'; % avibase
metaData.links.id_birdlife = 'red-throated-loon-gavia-stellata'; % birdlife
metaData.links.id_AnAge = 'Gavia_stellata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gavia_stellata}}';
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
bibkey = 'RizzSchm2015'; type = 'Article'; bib = [ ... 
'author = {D. J. Rizzolo and J. A. Schmutz and J. R. Speakman}, ' ... 
'year = {2015}, ' ...
'title = {Fast and efficient: {P}ostnatal growth and energy expenditure in an {A}rctic-breeding waterbird, the Red-throated Loon (\emph{Gavia stellata})}, ' ...
'journal = {Auk}, ' ...
'doi = {10.1642/AUK-14-261.1}, ' ...
'volume = {132}, ' ...
'pages = {657-670}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Gavia_stellata/}}';
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

