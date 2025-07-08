function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_jocu
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_jocu'; 
metaData.species_en = 'Dog snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 05];

%% set data
% zero-variate data

data.ab = (27+45)/24;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(25.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Lutjanus_sebae: hatch after 27 h, yolksac absorption after 45 h';
data.am = 33*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(24.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 32.4; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 128;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 464;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^2.97, see F1';
data.Wwi = 27450; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.97, see F1; max. published weight: 28.6 kg';

data.GSI  = 0.14;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(25.8);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Lutjanus_sebae';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
 0	28.159
 1	31.123
 2	37.455
 3	38.802
 4	47.156
 5	46.213
 6	49.042
 7	53.219
 8	57.395
 9	59.416
10	61.302
11	58.608
12	66.018
13	62.111
14	71.003
15	64.671
16	64.940
18	76.662
20	67.635
22	76.123
25	63.593];
data.tL(:,1) = 365 * (1.9 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FerrReze2004';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
13.507	64.417
15.661	128.835
19.967	236.196
21.142	107.362
22.904	214.723
23.687	279.141
24.861	322.086
26.232	407.975
27.210	429.448
28.581	450.920
29.755	558.282
30.930	343.558
31.321	536.810
32.104	730.061
32.300	1138.036
32.692	429.448
33.866	1202.454
33.866	837.423
34.649	644.171
34.845	493.865
35.237	1524.539
35.432	1288.343
35.824	837.423
35.824	1138.036
36.998	407.975
37.194	794.478
38.369	987.730
38.956	365.030
39.152	1567.484
39.739	1438.651
39.935	1739.264
40.131	687.116
40.326	1052.148
40.326	515.337
40.522	1266.871
40.718	1610.429
41.109	2061.349
41.305	880.368
41.305	1073.620
42.675	1223.926
42.871	2104.294
43.654	1180.981
44.046	1460.123
44.437	1782.209
44.829	1653.374
45.024	966.258
45.024	837.423
45.220	2104.294
45.220	2533.742
45.416	1438.651
45.416	1631.902
45.612	1202.454
46.395	1996.932
46.591	644.171
46.786	1374.233
46.786	1009.203
46.982	1653.374
46.982	1567.484
46.982	515.337
47.374	1331.288
47.569	2082.822
47.961	1782.209
47.961	1095.091
48.157	1309.816
49.135	1567.484
49.135	2125.767
49.135	1567.484
49.135	1846.626
49.331	1631.902
49.331	1309.816
49.527	2168.712
49.527	944.785
49.918	1996.932
50.506	1717.791
50.701	1803.681
50.701	1503.068
51.093	3027.607
51.093	1395.706
51.289	2555.215
51.485	3564.417
51.485	2877.300
51.876	1996.932
51.876	2383.436
52.072	2211.657
52.268	1953.987
52.463	2125.767
52.463	2190.184
52.659	3027.607
52.659	1524.539
52.659	1288.343
53.442	1782.209
53.638	2404.909
54.225	2469.325
54.617	3285.277
54.617	1975.461
54.617	2319.019
55.008	3092.025
55.204	2662.577
55.400	2082.822
55.400	2404.909
55.791	2898.773
55.987	3585.890
55.987	3220.859
56.378	4122.700
56.378	1653.374
56.770	4337.423
56.770	2254.601
56.966	3242.332
56.966	2726.994
56.966	2877.300
57.749	4079.755
57.749	2576.687
57.945	2039.877
58.140	3285.277
58.336	2963.190
58.532	3585.890
58.728	1696.319
58.923	1417.178
59.315	3521.473
59.511	5539.877
59.706	4015.338
59.706	2877.300
59.902	4595.093
59.902	3328.221
59.902	2512.270
59.902	3049.080
60.098	5046.013
60.098	4680.982
60.098	3757.668
60.098	3156.442
60.489	5368.099
60.881	3564.417
61.077	2877.300
61.272	4079.755
61.468	4487.731
61.468	3822.086
61.468	3285.277
61.664	5067.484
61.664	4187.116
62.055	3779.141
62.055	2555.215
62.055	2039.877
62.447	5561.350
62.643	4573.620
62.643	3972.393
62.838	3564.417
62.838	2855.829
63.034	4187.116
63.034	2469.325
63.230	6269.939
63.230	4895.706
63.426	5819.019
63.426	5475.461
63.426	4423.313
63.426	3736.196
63.817	4960.123
63.817	4380.368
63.817	3049.080
64.013	4122.700
64.013	3886.503
64.013	3371.165
64.405	4723.926
64.796	6033.742
64.992	3414.110
65.188	5561.350
65.188	4938.651
65.188	3500.000
65.383	6570.553
65.579	4530.675
65.579	3886.503
65.579	4251.534
65.971	5647.239
65.971	3092.025
66.362	4079.755
66.558	4895.706
66.558	4423.313
66.754	6377.301
66.754	4702.454
66.754	3263.804
66.949	5217.792
67.145	6098.160
67.145	4487.731
67.341	5561.350
67.341	5303.681
67.537	5432.516
67.537	4960.123
67.537	4723.926
67.732	4337.423
68.124	6570.553
68.124	5733.129
68.124	4122.700
68.320	3650.307
68.515	6205.521
68.515	5990.798
68.515	5131.902
68.711	5840.491
68.711	5582.822
68.907	4273.006
69.103	6763.804
69.103	6484.663
69.103	5776.074
69.103	4938.651
69.494	4595.093
69.690	6098.160
70.082	6269.939
70.082	4015.338
70.277	5453.987
70.277	4723.926
70.473	5840.491
70.473	5432.516
70.473	4466.258
70.669	7042.945
70.669	6849.693
70.669	5668.712
70.669	4981.596
71.060	5819.019
71.060	5024.541
71.256	5496.932
71.452	6828.221
71.452	3972.393
71.648	6184.049
71.843	5282.209
72.039	3779.141
72.235	6570.553
72.431	6463.190
72.626	7300.614
72.626	7107.362
72.626	6957.056
72.822	5604.295
73.018	6720.859
73.018	6312.884
73.018	5153.374
73.214	5411.044
73.409	5067.484
73.997	6119.632
74.192	6828.221
74.388	7536.810
74.584	7000.000
74.780	5883.436
74.976	8073.620
75.171	5582.822
75.367	6763.804
75.563	7365.031
75.759	5604.295
75.954	8095.093
75.954	7558.282
75.954	6076.687
75.954	4981.596
76.542	7279.141
76.737	7450.921
76.933	8868.098
77.129	7064.417
77.325	8266.872
77.325	6291.411
77.912	8374.233
78.108	6828.221
78.303	5003.068
78.499	8030.675
78.891	6957.056
78.891	5883.436
78.891	5561.350
79.086	7923.313
79.086	6398.773
79.478	8395.706
79.478	6720.859
79.869	7064.417
80.261	6914.111
80.653	7493.865
80.848	9061.350
80.848	7214.724
81.631	7107.362
81.827	7300.614
82.219	7493.865
82.610	8503.068
83.589	7773.006
84.176	7880.369
84.763	7064.417
84.959	8202.454
84.959	8030.675
87.113	8481.595
87.700	8739.264
89.853	10070.553
91.419	9855.829
91.811	10006.135
93.768	10521.473
96.900	11358.896
97.292	11530.675
97.488	10628.835];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'FerrReze2004';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  50 * weights.tL;
weights.Wwi =  0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01514*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72PQT'; % Cat of Life
metaData.links.id_ITIS = '168857'; % ITIS
metaData.links.id_EoL = '46580726'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_jocu'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_jocu'; % ADW
metaData.links.id_Taxo = '106200'; % Taxonomicon
metaData.links.id_WoRMS = '159798'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-jocu'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_jocu}}';
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
bibkey = 'FerrReze2004'; type = 'incollection'; bib = [ ... 
'author = {Beatrice P. Ferreira and S\''{e}rgio M. Rezende and Simone F. Teixeira and Thierry Fr\''{e}dou }, ' ... 
'editor = {R. P. Lessa and M. F. N\''{o}brega and J\''{u}nior, J. L. B.}, ' ...
'publisher = {Universidade Federal Rural de Pernambuco, Recife-Brazil, Departamento de Pesca}, ' ...
'year = {2004}, ' ...
'title = {\emph{Lutjanus jocu}. Dinâmica de popula\c{c}\~{o}es e avalia\c{c}\~{a}o de estoques dos recursos pesqueiros da regi\~{a}o nordeste}, ' ...
'booktitle = {DIMAR}, ' ...
'volume = {II}, ' ...
'pages = {151-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-jocu.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
