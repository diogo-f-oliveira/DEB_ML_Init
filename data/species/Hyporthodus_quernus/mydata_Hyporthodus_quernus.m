function [data, auxData, metaData, txtData, weights] = mydata_Hyporthodus_quernus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Hyporthodus_quernus'; 
metaData.species_en = 'Hawaiian grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPh'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 05];

%% set data
% zero-variate data

data.am = 35 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'DeMaEver2010';   
  temp.am = C2K(15.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 58;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'DeMaEver2010'; 
data.Li  = 122 ;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7.9e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'DeMaEver2010';
  comment.Wwb = 'based on egg diameter of 0.533 mm: pi/6*0.0533^3';
data.Wwp = 3.5e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'DeMaEver2010','fishbase'};
  comment.Wwp = 'based on 0.01445*Lp^3.05, see F1';
data.Wwi = 33.3e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^3.05, see F1';

data.GSI  = 0.015;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'DeMaEver2010';   
  temp.GSI = C2K(16);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 29.8
    1 34.6
    2 40.6
    3 48.0
    4 48.9
    5 52.4
    6 59.7
    7 63.8
    8 70.2
    9 72.7
   10 68.8
   11 77.0
   12 75.5
   13 73.4
   14 80.8
   15 84.7
   16 83.5
   18 73.2
   19 81.1
   20 68.2
   22 86.6
   23 82.7
   24 86.5
   25 64.3
   27 88.1
   34 90.1];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(15.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NichDeMa2008';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
23.596	248.472
25.549	317.950
27.340	421.810
28.967	456.753
31.247	629.633
31.898	629.837
32.712	802.258
33.200	802.411
33.689	802.564
34.503	871.685
35.642	906.475
36.293	906.679
36.619	1044.514
38.409	976.208
38.735	1079.610
38.736	1251.776
40.852	1286.872
41.177	1252.540
41.829	1459.344
42.154	1390.579
42.969	1563.001
43.944	1425.573
43.946	1701.040
44.923	1804.646
45.740	2286.967
45.899	1736.085
46.063	1908.302
46.712	1667.473
46.715	2080.673
48.015	1805.614
48.017	2081.080
48.993	2046.953
48.995	2287.986
48.995	2391.286
49.643	1909.423
49.647	2460.357
50.457	2047.411
50.461	2563.911
50.785	2391.847
50.949	2495.198
51.926	2702.103
51.927	2805.403
52.412	2323.489
52.579	2977.774
52.905	3081.176
53.227	2564.777
53.720	3184.731
54.039	2323.999
54.042	2771.632
54.368	2875.034
54.692	2634.103
55.020	2944.105
55.185	3322.923
55.675	3529.675
56.163	3564.262
56.485	3047.863
56.486	3220.030
56.647	2910.181
56.816	3943.232
56.823	4907.366
57.789	3392.604
58.280	3771.524
58.436	2876.308
58.439	3323.941
58.605	3668.326
58.612	4735.760
58.765	3289.610
58.771	4219.310
59.580	3496.465
59.583	3978.532
60.070	3840.951
60.072	4150.851
60.395	3806.620
60.572	5907.105
60.882	3600.172
60.886	4151.106
60.888	4392.139
60.890	4736.473
61.209	3806.874
61.703	4598.994
61.705	4943.328
61.712	5976.329
62.514	4254.915
62.517	4668.116
62.519	5012.449
63.329	4461.770
63.334	5253.737
63.334	5253.737
63.495	4943.888
63.823	5357.190
63.978	4152.074
64.142	4324.291
64.143	4565.325
64.795	4772.129
64.795	4772.129
64.798	5185.329
64.804	6046.163
64.964	5667.447
65.123	5116.564
65.289	5529.816
65.610	4978.984
65.615	5633.217
65.934	4703.619
65.938	5220.119
66.104	5805.537
66.106	6012.137
66.919	5943.525
67.083	6184.610
67.238	5013.926
67.239	5220.527
67.241	5461.560
67.243	5737.027
67.404	5496.044
67.571	6115.896
67.731	5737.180
68.054	5392.948
68.062	6494.816
68.214	4910.932
68.545	5806.301
68.712	6357.286
69.035	6116.354
69.359	5806.556
69.364	6529.656
69.366	6908.423
70.176	6323.311
70.500	6185.679
70.502	6461.146
70.506	6977.647
70.992	6771.199
71.480	6633.619
71.483	7081.252
71.649	7563.370
71.970	6943.672
71.981	8527.606
72.129	6392.789
72.624	7460.376
72.785	7150.526
72.790	7908.060
72.792	8183.527
72.944	6634.077
72.954	8114.711
73.114	7667.129
73.270	6737.479
73.436	7150.730
73.600	7391.815
73.603	7805.015
73.605	8149.349
73.925	7254.183
74.094	8183.935
74.255	7908.519
74.576	7357.687
74.577	7529.854
74.742	7770.938
74.749	8769.506
75.069	8046.507
75.072	8494.141
75.074	8735.174
75.560	8390.993
75.715	7289.177
75.882	8012.328
76.208	8012.430
76.214	8873.264
76.372	8184.648
76.383	9871.882
76.543	9458.733
76.701	8735.683
76.708	9768.684
76.878	10905.036
77.028	9011.252
77.198	10078.737
77.363	10388.688
77.509	7840.671
77.522	9837.806
77.673	8116.189
77.844	9252.540
78.002	8632.791
78.176	10251.210
78.335	9665.894
78.346	11284.261
78.495	9287.178
78.815	8598.612
79.307	9046.399
79.309	9459.599
79.805	10527.186
79.966	10355.070
80.123	9425.420
80.282	8908.971
80.780	10320.891
81.274	11147.445
81.432	10527.695
81.750	9391.496
81.754	9976.863
82.081	10252.432
82.241	9804.849
82.247	10665.683
82.249	10975.584
82.420	12284.102
82.571	10459.185
82.582	12180.853
82.735	10631.403
82.735	10700.270
83.066	11561.205
83.073	12594.206
83.074	12663.073
83.713	10941.609
83.726	12801.010
83.883	12077.960
84.199	10631.861
85.024	12319.351
85.180	11355.267
85.516	12904.870
85.676	12457.288
85.994	11355.522
85.997	11803.156
85.997	11837.589
86.320	11390.057
86.334	13490.492
86.496	13352.810
86.498	13662.710
86.831	14833.546
86.975	12113.362
87.301	12147.897
87.482	14902.617
87.766	8773.581
87.954	12389.134
87.956	12699.034
87.967	14317.402
88.114	12079.285
88.604	12286.038
88.613	13628.939
88.777	13766.723
89.106	14317.759
89.108	14696.526
89.754	13904.762
90.072	12802.997
90.075	13250.630
90.082	14283.631
90.241	13698.315
90.401	13388.466
90.570	14318.217
90.900	14903.686
91.053	13595.269
91.064	15179.204
91.219	14008.521
91.222	14490.588
91.223	14628.321
91.715	15213.841
91.866	13388.924
92.218	17383.295
92.220	17693.196
92.366	15179.611
92.371	15937.145
93.355	17108.185
93.999	16040.955
94.330	16833.024
94.332	17177.358
94.644	15180.325
95.302	16282.396
95.311	17487.563
97.608	20346.245
98.072	16799.762
99.564	20794.490
100.038	18694.208
104.620	22517.737
107.201	19144.083
110.304	20935.585];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'NichDeMa2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Change from female to male at TL 89.5 cm';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: W in g = 0.01445*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYHP'; % Cat of Life
metaData.links.id_ITIS = '167707'; % ITIS
metaData.links.id_EoL = '46579821'; % Ency of Life
metaData.links.id_Wiki = 'Hyporthodus_quernus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_quernus'; % ADW
metaData.links.id_Taxo = '1683157'; % Taxonomicon
metaData.links.id_WoRMS = '475080'; % WoRMS
metaData.links.id_fishbase = 'Hyporthodus-quernus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporthodus_quernus}}';
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
bibkey = 'NichDeMa2008'; type = 'techreport'; bib = [ ... 
'author = {Ryan S. Nichols and Edward E. DeMartini}, ' ... 
'year = {2008}, ' ...
'title = {Preliminary Estimates of Age and Growth for the Endemic {H}awai''ian Grouper (Hapu''upu''u, \emph{Epinephelus quernus}, {F}. {S}erranidae)}, ' ...
'institution = {Pacific Islands Fisheries Science Center}, ' ...
'volume = {Administrative Report H-08-06}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeMaEver2010'; type = 'article'; bib = [ ... 
'author = {DeMartini, Edward E. and Everson, Alan R. and Nichols, Ryan S.}, ' ... 
'year = {2011}, ' ...
'title = {Estimates of body sizes at maturation and at sex change, and the spawning seasonality and sex ratio of the endemic {H}awaiian grouper (\emph{Hyporthodus quernus}, {F}. {E}pinephelidae)}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {109}, ' ...
'pages = {123–134'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hyporthodus-quernus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

