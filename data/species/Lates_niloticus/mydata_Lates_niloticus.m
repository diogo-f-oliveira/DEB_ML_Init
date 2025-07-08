function [data, auxData, metaData, txtData, weights] = mydata_Lates_niloticus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centropomiformes'; 
metaData.family     = 'Latidae';
metaData.species    = 'Lates_niloticus'; 
metaData.species_en = 'Nile perch'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 10];

%% set data
% zero-variate data

data.ab = 2.2;   units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = 'SchiBosm2007';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-15 h till hatch, then 36-40 h till start feeding';
data.am =  35* 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'fishbase';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 75.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.44e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.87 mm of Lates calcarifer: pi/6*0.087^3';
data.Wwi = 200e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri  = 159e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lates calcarifer: 47.7e6*200/60';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1  36.38
    2  59.41
    3  76.61
    4  95.33
    5 105.17
    6 114.86
    7 124.53
    8 134.95
    9 144.67
   10 153.90
   11 163.20
   12 172.50
   13 184.50];
data.tL(:,1) = 365*data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fao';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.983	66.476
4.142	43.282
4.805	49.941
6.626	45.963
8.781	78.500
9.609	46.719
10.438	59.062
10.769	10.872
12.095	09.415
12.426	12.519
12.923	13.014
13.917	35.603
15.243	15.320
15.409	54.120
16.733	86.408
18.555	157.825
19.714	298.188
20.212	229.077
21.538	91.185
23.028	231.878
23.856	302.307
24.519	233.361
26.176	304.613
27.501	305.931
29.157	516.394
29.985	586.825
30.811	935.673
31.972	797.617
34.127	660.548
34.953	1009.397
35.449	1218.706
36.444	1010.880
36.778	593.579
38.269	664.667
38.431	1291.277
39.920	1710.391
39.925	805.524
40.754	527.926
41.245	1642.104
42.406	1434.443
42.575	808.160
43.563	1992.436
44.224	2271.517
44.228	1575.465
44.232	879.413
44.560	1366.979
46.047	2134.119
46.217	1507.837
47.049	812.608
48.202	1927.444
48.205	1370.604
48.531	2484.615
49.696	1511.296
50.858	1094.817
51.019	1930.244
51.511	2905.213
52.343	2140.380
52.502	3463.041
52.844	1514.427
54.007	889.133
54.161	3047.059
54.328	2768.801
54.667	1377.029
55.328	1656.108
55.817	3048.706
55.988	2213.609
57.143	2980.419
57.977	1937.164
57.981	1241.111
58.466	3468.972
58.969	2425.389
59.140	1381.477
59.795	2843.843
60.463	1939.635
60.786	3471.279
61.280	3959.010
61.286	2775.721
61.459	1522.993
61.621	2219.210
62.608	3542.696
63.108	2916.745
63.609	2221.187
64.111	1386.419
64.263	3892.370
64.597	3335.858
65.254	4450.201
65.263	2710.070
65.598	2014.347
66.253	3407.110
66.414	4242.537
67.087	2433.462
67.742	3826.225
67.746	3060.568
67.904	4522.442
68.730	5010.501
68.909	2504.879
69.066	4036.358
69.567	3340.800
70.555	4594.683
70.895	2994.093
71.055	4038.335
71.379	5221.954
72.370	5779.782
72.875	4388.172
73.198	5850.211
73.203	4945.344
73.210	3831.662
73.870	4319.556
74.189	6408.041
74.691	5573.274
74.694	5016.431
75.028	4529.526
75.180	7035.477
75.522	5086.860
75.681	6270.314
76.520	4461.404
76.836	7245.939
76.838	6758.702
77.176	5645.350
78.009	4810.911
78.167	6133.575
78.824	7247.916
78.995	6343.214
79.499	5090.814
79.661	5717.426
80.148	7527.654
80.484	6623.117
81.150	6066.936
81.468	8503.447
81.805	7459.697
82.128	8921.736
82.473	6416.279
82.635	7182.101
83.128	7878.647
83.291	8296.442
83.617	9410.455
83.797	6696.017
84.283	8715.062
84.287	8088.615
84.622	7462.497
84.784	8089.109
85.108	9411.938
85.452	7045.691
85.945	7811.843
86.103	9134.507
86.274	8299.407
86.595	10179.078
87.260	9692.500
87.264	8996.448
87.433	8439.773
87.435	7952.535
87.771	7117.603
88.260	8649.411
88.588	9276.188
88.746	10598.850
89.257	8093.557
89.414	9694.641
89.914	9138.296
90.406	10043.657
90.746	8582.277
90.901	10392.176
91.070	9905.106
91.903	8931.456
92.231	9627.837
92.389	10950.501
92.392	10463.264
92.565	9071.324
92.890	10185.338
93.544	11926.126
93.881	10882.379
93.887	9699.090
94.222	9003.367
94.878	10396.130
95.038	11370.767
95.370	11162.282
96.017	14086.359
96.205	9979.818
96.850	13251.921
97.186	12416.988
97.202	9423.965
97.355	11790.706
97.845	13044.094
97.852	11791.200
97.855	11303.963
98.344	12766.166
99.341	12140.707
99.512	11305.610
99.824	14716.595
100.976	16109.852
101.485	14022.191
102.140	15275.742
102.152	13117.983
102.978	13536.436
102.980	13188.411
103.132	15763.967
104.309	12702.492
104.794	14791.143
105.283	16322.950
105.453	15487.854
105.957	14165.849
106.924	19108.805
107.448	14306.541
108.918	18066.705
109.100	15143.451
110.072	19181.540
110.574	18277.167
111.419	15145.757
111.562	19252.629
112.075	16329.705
113.396	17305.496
115.031	21205.034
115.716	17168.591
116.697	19536.156
117.202	18005.336
118.189	19328.824
121.665	20028.335
128.595	25186.038
128.756	26021.465];
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'YongOuta2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight relationship: W = 0.0069 * TL^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; freshwater; brackish; reef-associated; amphidromous; depth range ? - 22 m. Tropical; 25 C - 31 C, preferred 27 C';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'protandric hermaphrodite';
metaData.bibkey.F3 = 'iucn'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6P2X8'; % Cat of Life
metaData.links.id_ITIS = '167670'; % ITIS
metaData.links.id_EoL = '204767'; % Ency of Life
metaData.links.id_Wiki = 'Lates_niloticus'; % Wikipedia
metaData.links.id_ADW = 'Lates_niloticus'; % ADW
metaData.links.id_Taxo = '45059'; % Taxonomicon
metaData.links.id_WoRMS = '218165'; % WoRMS
metaData.links.id_fishbase = 'Lates-niloticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lates_niloticus}}';
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
bibkey = 'YongOuta2017'; type = 'article'; bib = [ ...
'author = {Edwine Yongo and Nicholas Outa and Keiko Kito and Yoshiki Matsushita}, ' ... 
'title = {Some aspects of the biology of {N}ile perch, \emph{Lates niloticus}, in the open waters of {L}ake {V}ictoria, {K}enya}, ' ...
'year = {2017}, ' ...
'journal = {Lakes and Reservoirs: Research and Management}, ' ...
'volume = {20}, ' ...
'pages = {1–6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Lates-niloticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fao.org/fishery/docs/CDrom/aquaculture/a0844t/docrep/008/AD864E/AD864E04.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

