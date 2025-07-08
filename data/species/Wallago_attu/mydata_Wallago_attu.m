  function [data, auxData, metaData, txtData, weights] = mydata_Wallago_attu

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Siluridae';
metaData.species    = 'Wallago_attu'; 
metaData.species_en = 'Wallago'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 02];

%% set data
% zero-variate data
data.ab = 7;       units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(23.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'GoswDeva1992';   
  temp.am = C2K(23.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 75.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
  comment.Lp = 'fbased on Silurus_glanis: 87.5*240/278 cm';
data.Li = 240;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'VoNguy2022';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 2.3e3;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','guess'}; 
  comment.Wwp = 'based on 0.00562*Lp^2.99, see F1';
data.Wwi = 73.5e3;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^2.99, see F1';
  
data.Ri = 453148/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';  
  temp.Ri = C2K(23.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
18.944	105.478
19.657	128.101
21.222	88.156
21.791	76.728
21.934	105.101
21.936	139.170
22.647	116.367
23.216	104.939
23.359	127.634
24.498	104.777
24.500	167.238
24.643	178.576
24.927	167.184
24.929	206.931
25.495	116.008
25.497	178.468
25.780	133.007
26.492	127.239
26.780	195.341
26.780	212.376
26.920	155.576
26.920	155.576
26.923	206.680
27.208	218.000
27.351	246.373
28.061	189.501
28.062	206.536
28.915	178.037
29.058	200.732
29.063	319.974
29.199	166.645
29.203	263.174
29.340	109.845
29.349	359.686
29.625	121.165
29.768	143.860
30.064	416.378
30.196	166.519
30.197	189.232
30.909	194.820
30.914	308.384
31.050	149.377
31.052	200.480
31.476	120.931
31.486	376.451
31.630	404.824
31.763	166.321
31.767	262.851
32.049	206.033
32.049	206.033
32.052	285.528
32.335	245.744
32.616	149.179
32.627	421.733
32.905	234.316
33.191	274.027
33.476	268.313
33.614	166.088
33.615	183.122
33.766	415.911
34.040	148.999
34.326	160.320
34.328	217.102
34.474	307.935
34.623	466.907
34.905	404.411
35.038	171.586
35.042	273.794
35.467	222.636
35.467	222.636
35.625	608.736
35.896	268.008
35.897	279.364
36.178	177.121
36.179	211.190
36.332	472.369
36.463	194.119
37.039	347.359
37.040	381.428
37.176	222.420
37.462	250.776
37.605	267.792
38.174	256.364
38.175	279.077
38.178	335.859
38.321	364.232
38.601	227.919
38.893	409.586
38.895	483.402
39.172	273.273
39.176	381.159
39.335	801.328
39.456	261.880
39.465	489.009
39.741	250.488
40.311	267.451
40.455	318.537
40.601	398.014
40.740	318.501
41.030	432.029
41.032	494.489
41.162	193.526
41.310	318.429
41.310	329.785
41.311	358.176
41.457	426.297
42.026	431.903
42.166	352.390
42.172	511.380
42.173	539.771
42.318	607.892
42.321	681.708
42.452	397.780
42.456	505.666
42.876	318.231
43.019	335.248
43.024	454.490
43.308	420.385
43.312	533.949
43.592	408.993
44.167	556.554
44.609	914.227
44.743	704.116
45.015	374.744
45.302	437.168
45.304	488.272
45.304	493.950
45.443	414.437
45.448	528.001
45.449	550.714
45.451	596.140
45.454	681.313
45.591	556.375
45.719	181.595
45.880	658.546
46.027	760.736
46.162	573.337
46.163	613.085
46.442	465.415
46.592	647.100
46.880	726.559
46.881	754.950
47.298	505.055
47.303	629.975
47.593	754.860
47.596	822.998
48.152	476.556
48.165	811.570
48.297	556.033
48.301	663.919
48.438	516.267
48.584	607.101
48.732	754.716
49.009	550.265
49.031	1118.085
49.147	448.039
49.156	658.133
49.291	470.734
49.436	544.533
49.579	567.228
49.862	504.732
49.863	550.157
49.867	652.365
50.001	442.253
50.015	782.945
50.016	822.693
50.024	1015.752
50.295	657.989
50.449	958.916
50.577	584.137
50.581	703.379
50.870	794.194
51.003	555.692
51.016	902.062
51.018	947.488
51.718	646.453
51.859	612.366
51.860	623.722
52.005	697.521
52.147	686.147
52.151	782.676
52.285	561.208
52.576	720.162
53.144	674.664
53.149	822.298
53.151	856.367
53.281	549.726
53.858	725.678
53.995	595.062
53.997	657.522
54.005	861.937
54.148	873.276
54.422	606.364
54.428	742.641
54.717	861.847
55.142	805.012
55.155	1117.313
55.288	895.845
55.568	753.854
55.571	844.705
55.705	628.915
55.708	691.375
55.716	912.825
55.855	816.278
55.990	623.201
56.143	890.059
56.155	1213.717
56.275	645.878
56.566	793.475
56.570	901.361
56.570	901.361
56.578	1100.098
56.849	748.014
56.993	793.421
57.140	906.968
57.282	895.593
57.415	657.091
57.724	1270.301
57.856	1009.086
57.988	753.548
58.127	645.645
58.133	804.634
58.564	895.432
58.571	1071.456
58.710	997.621
59.135	940.785
59.273	832.881
59.280	997.549
59.419	923.715
59.558	821.489
59.687	497.813
60.126	798.705
60.130	900.912
60.274	929.285
60.277	997.424
60.284	1196.161
60.851	1110.916
61.131	1008.672
61.133	1048.420
61.139	1196.053
61.416	1008.636
61.420	1110.844
61.555	923.445
61.559	1025.653
61.704	1071.061
62.161	1843.243
62.299	1735.339
62.413	1014.189
62.417	1110.718
62.421	1201.569
62.567	1309.438
62.571	1400.289
62.844	1104.986
62.846	1144.734
62.985	1065.221
63.132	1190.123
63.413	1076.523
63.416	1156.018
63.699	1110.556
63.853	1400.127
63.992	1320.614
64.124	1065.077
64.143	1542.046
64.260	900.391
64.270	1150.232
64.555	1161.553
64.557	1206.978
64.721	1763.424
64.854	1507.887
64.982	1155.821
65.135	1411.322
65.263	1064.933
65.404	1013.811
65.832	1030.792
66.150	1871.130
66.270	1308.970
66.426	1666.679
66.703	1445.193
66.990	1524.652
67.146	1853.970
67.393	911.352
67.542	1070.324
67.703	1541.597
67.867	2092.365
67.986	1501.814
68.121	1314.415
68.126	1433.657
68.711	1814.025
68.957	843.016
69.142	1910.501
69.158	2313.653
69.264	1399.444
69.395	1115.516
69.561	1700.353
69.676	1013.272
69.688	1319.895
69.965	1121.122
69.987	1666.230
70.097	854.229
70.106	1092.713
70.123	1507.222
70.558	1717.262
70.958	1018.789
70.976	1467.367
71.250	1206.134
71.701	1813.648
71.709	2012.385
71.846	1870.412
72.690	1603.428
73.848	2091.610
74.270	1949.601
74.992	2205.031
75.140	2341.290
75.400	1710.973
75.438	2681.946
75.835	1915.334
75.851	2312.809
75.961	1495.129
75.984	2085.662
76.413	2119.678
76.566	2403.570
76.700	2193.459
76.848	2318.361
76.871	2903.216
77.255	1818.625
77.571	2607.860
77.982	2193.297
78.700	2329.484
78.706	2499.830
78.844	2391.926
80.273	2516.667
81.689	2306.394
81.946	1596.582
82.990	2800.236
83.642	1267.030
84.121	2595.677
84.980	2697.777
85.973	2612.478
86.215	1522.226
86.970	2612.352
87.963	2515.697
87.967	2612.226
88.848	3276.468];
units.LW = {'cm', 'g'};  label.LW = {'total length','wet weight'};  
bibkey.LW = 'GoswDeva1992';

% time-length
data.tL = [ ... % time (yr), total length (cm)
    0.5 37.5
    1.0 65.0
    1.5 84.5
    2.0 99.0];
data.tL(:,1) = 365 * (0.2 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
  temp.tL = C2K(23.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GoswDeva1992';

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

% %% Group plots
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7G6PP'; % Cat of Life
metaData.links.id_ITIS = '164079'; % ITIS
metaData.links.id_EoL = '205714'; % Ency of Life
metaData.links.id_Wiki = 'Wallago_attu'; % Wikipedia
metaData.links.id_ADW = 'Wallago_attu'; % ADW
metaData.links.id_Taxo = '190022'; % Taxonomicon
metaData.links.id_WoRMS = '283161'; % WoRMS
metaData.links.id_fishbase = 'Wallago-attu'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Wallago_attu}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nlWiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Europese_meerval}}';  
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
bibkey = 'GoswDeva1992'; type = 'Article'; bib = [ ...    
'author = {Goswami, P.K. and M. Devaraj}, ' ...
'year  = {1992}, ' ...
'title = {Breeding, age and growth of the freshwater shark \emph{Wallago attu} ({B}loch and {S}chneider) from the {D}hir beel of the {B}rahmaputra basin, {A}ssam, {I}ndia}, ' ...  
'journal = {J. Indian Fish. Ass.}, ' ...
'volume = {22}, ' ...
'pages = {13-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VoNguy2022'; type = 'Article'; bib = [ ...    
'author = {Duc Nghia Vo and Van Huy Nguyen and Matthew J. Wylie and Duc Thanh Nguyen and P. Mark Lokman and Thi Thu An Le and Anh Tuan Nguyen}, ' ...
'year  = {2022}, ' ...
'title = {Reproductive development of female wallago catfish (\emph{Wallago attu}) in captivity}, ' ...  
'journal = {Animal Reproduction Science}, ' ...
'volume = {242}, ' ...
'pages = {107014}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.se/summary/Wallago-attu.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

