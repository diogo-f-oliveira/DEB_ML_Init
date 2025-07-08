function [data, auxData, metaData, txtData, weights] = mydata_Phyllostomus_hastatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Phyllostomidae';
metaData.species    = 'Phyllostomus_hastatus'; 
metaData.species_en = 'Greater spear-nosed bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 24]; 

%% set data
% zero-variate data

data.tg = 120;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 100;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15.9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'AnAge';
data.Wwi = 81;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.595	17.059
1.016	15.325
1.606	20.774
3.304	17.554
4.582	16.192
5.016	18.050
6.174	23.003
7.308	21.146
7.605	24.489
8.872	20.279
9.877	22.136
10.177	26.471
10.310	23.746
12.024	24.861
12.581	21.146
13.174	27.585
15.027	27.585
16.900	33.282
17.604	31.053
18.028	29.938
18.038	32.663
18.192	36.130
19.903	36.130
21.048	37.492
22.038	35.387
23.330	38.111
23.340	40.960
25.311	34.149
25.497	46.285
25.625	42.074
26.646	48.762
27.345	44.923
27.352	46.780
28.099	56.440
28.647	50.372
28.920	46.904
28.923	47.771
29.071	49.257
29.638	48.638
30.077	51.858
30.771	46.656
30.920	48.390
31.335	44.923
31.924	50.000
32.503	52.724
34.233	58.173
36.498	53.963
37.652	57.678
37.656	58.793
38.827	67.585
39.372	60.526
39.385	64.118
40.079	59.040
40.801	61.641
41.523	64.118
41.650	59.783
42.081	60.774
42.257	70.310
43.251	69.319
43.362	60.402
43.372	63.127
43.924	58.173
43.951	65.604
44.364	61.517
44.680	70.433
45.787	61.022
46.797	64.489
46.933	62.632
47.231	66.347
47.353	60.526
47.950	68.080
49.657	67.090
49.966	74.025
50.362	65.108
51.515	68.700
52.224	67.585
52.361	66.099
52.376	70.433
53.237	72.043
54.229	70.433
55.801	71.548
56.220	69.319
56.944	72.539
57.068	67.214
57.650	70.681
58.083	72.043
58.359	69.567
60.778	68.452
60.928	70.557
61.078	72.663
61.920	68.947
62.356	71.300
62.635	69.567
63.353	71.300
68.624	70.681
73.764	73.158
73.899	71.053
74.624	74.644
76.040	72.043
76.190	74.025
78.175	71.300
78.178	72.167
78.466	73.034
79.181	73.529
79.333	76.130
80.039	74.520
81.331	76.997
82.911	80.464
82.917	82.198
84.485	82.322
85.331	79.598
85.339	81.827
87.041	79.598
88.036	78.978
88.618	82.322
88.874	74.025
88.878	75.263
88.890	78.483
90.024	76.749
90.171	78.111
90.888	79.474
92.044	83.932
93.443	76.502
93.738	79.350
94.729	77.492
95.162	78.978
96.870	78.235
97.591	80.588
98.739	82.941
98.900	88.142
99.873	81.207
101.162	82.817
103.436	81.084
107.871	85.913];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(34.8);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'KoehBarc2000';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
1.022	17.059
1.029	18.793
1.302	15.573
1.580	13.591
2.445	16.316
2.599	19.536
4.581	15.944
5.308	20.031
5.441	17.183
7.022	21.022
7.315	23.127
7.712	14.582
9.023	22.508
9.868	19.659
11.029	25.728
11.309	24.118
12.014	22.012
13.282	17.802
17.036	31.672
18.594	28.947
18.601	30.805
19.170	30.433
19.180	33.282
19.286	23.003
20.884	31.548
21.599	32.291
21.612	35.882
23.613	37.368
24.435	28.204
25.889	36.254
25.925	46.285
26.896	38.854
27.613	40.093
28.336	43.065
29.013	33.034
29.161	34.768
29.197	44.799
29.492	47.647
29.605	39.350
30.183	41.579
30.476	43.684
30.910	45.542
32.043	43.437
32.484	47.276
32.616	44.427
32.638	50.495
33.305	37.864
34.331	45.789
34.766	47.895
36.631	51.238
37.910	50.248
38.189	48.514
38.918	52.972
39.351	54.582
39.909	51.238
40.033	46.161
41.040	48.762
41.057	53.467
41.209	56.192
42.343	54.458
43.316	47.399
43.336	52.972
43.488	55.820
44.481	54.334
44.923	58.421
46.482	55.944
47.212	60.898
47.344	57.926
48.194	56.687
48.203	59.164
49.482	58.050
49.902	55.944
50.202	60.279
50.214	63.498
52.334	58.669
53.911	61.269
53.918	63.127
54.334	59.783
54.609	57.183
55.184	58.545
55.746	56.192
56.475	60.898
57.041	59.659
57.050	62.136
57.059	64.613
58.195	63.498
58.602	57.802
58.610	59.907
59.046	62.260
60.475	63.375
60.745	59.164
62.463	61.517
62.476	65.108
63.610	63.375
64.172	61.146
68.175	64.613
68.466	66.223
73.444	63.498
74.150	61.517
74.309	66.099
75.293	62.384
75.443	64.365
77.293	63.746
77.300	65.604
78.732	67.585
78.999	62.508
79.010	65.480
81.142	63.870
82.436	67.214
83.305	71.053
84.022	72.415
84.427	65.975
85.013	70.310
86.148	69.071
87.417	65.232
88.864	71.176
88.992	67.090
89.141	68.947
89.694	64.365
90.137	68.576
90.273	66.842
90.858	70.929
91.841	66.842
92.417	68.576
94.395	63.622
94.819	62.632
95.117	66.347
95.125	68.576
95.273	70.186
96.977	68.452
98.985	72.043
99.820	66.347
99.829	68.700
99.846	73.529
100.829	69.567
102.694	73.034];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(34.8);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'KoehBarc2000';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'scaled function response during lactation is assume to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4HCX3'; % Cat of Life
metaData.links.id_ITIS = '631781'; % ITIS
metaData.links.id_EoL = '327398'; % Ency of Life
metaData.links.id_Wiki = 'Phyllostomus_hastatus'; % Wikipedia
metaData.links.id_ADW = 'Phyllostomus_hastatus'; % ADW
metaData.links.id_Taxo = '64341'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801276'; % MSW3
metaData.links.id_AnAge = 'Phyllostomus_hastatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phyllostomus_hastatus}}';
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
bibkey = 'SterKunz1998'; type = 'Article'; bib = [ ... 
'author = {April A. Stern and Thomas H. Kunz}, ' ... 
'year = {1998}, ' ...
'title = {Intraspecific Variation in Postnatal Growth in the Greater Spear-Nosed Bat}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {79(3)}, ' ...
'pages = {755-763}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Phyllostomus_hastatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

