function [data, auxData, metaData, txtData, weights] = mydata_Tarsius_tarsier

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Tarsiidae';
metaData.species    = 'Tarsius_tarsier'; 
metaData.species_en = 'Spectral tarsier'; 
metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2014 07 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2018 08 01];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 01]; 

%% set data
% zero-variate data

data.tg = 157;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 69;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 425;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 14;   units.Li  = 'cm';  label.Li  = 'ultimate head-body length';   bibkey.Li  = 'Wiki';
  comment.Li = '9.4-14 cm';

data.Wwb = 17;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HiroHara2011';
data.Wwx = 42;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 144.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/153;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.598	19.255
1.862	18.363
2.965	19.038
4.388	17.475
5.966	17.479
6.913	17.482
7.860	17.036
8.649	17.039
9.438	17.041
10.700	17.044
11.645	17.943
12.276	18.392
13.221	19.290
14.167	19.517
14.798	19.742
16.060	20.194
17.163	20.645
18.583	20.872
19.372	21.099
20.950	21.103
22.369	21.331
23.472	22.229
24.575	23.128
25.678	24.251
27.255	24.703
27.886	24.704
28.674	25.378
29.304	25.828
30.093	25.830
31.355	26.281
32.773	27.181
34.034	27.856
34.980	28.306
36.083	29.205
36.871	29.655
37.503	29.657
38.922	30.332
39.867	31.007
40.656	31.009
41.917	31.908
42.705	32.582
43.808	33.256
44.911	34.155
46.015	34.382
46.960	35.280
48.222	35.508
49.640	37.079
50.113	37.304
51.216	37.755
52.320	38.430
53.266	38.656
54.210	40.450
54.999	40.452
55.787	40.454
56.891	41.129
57.679	41.355
58.941	41.806
60.045	42.257
61.148	42.708
62.094	43.606
63.197	44.505
63.985	44.731
64.931	45.405
65.717	46.751
66.505	47.201
67.294	47.651
68.081	48.772
69.027	49.223
70.287	50.122
71.075	50.795
72.021	51.470
72.808	52.144
73.281	52.817
74.069	53.043
74.858	53.269
75.329	54.389
76.433	54.840
77.221	55.066
78.166	56.412
78.639	56.638
79.111	57.087
79.899	57.984
81.475	59.108
82.262	60.006
82.891	61.127
84.152	62.026
85.414	62.254
86.675	63.153
87.463	63.603
88.567	63.830
89.197	64.727
90.616	65.402
91.247	65.404
91.877	65.854
92.823	66.080
93.455	65.634
94.400	66.980
95.506	65.864
96.295	66.090
97.240	66.988
98.027	68.110
99.289	68.337
99.919	68.787
101.023	69.461
101.496	69.687
101.971	68.345
102.758	69.690
104.333	71.038
105.122	71.040
106.227	71.267
107.331	71.494
107.646	71.719
108.438	70.154
109.067	71.051
110.013	71.501
110.643	71.951
111.274	72.401
112.537	72.180
113.169	71.510
114.429	72.857
115.216	73.979
116.320	74.430
117.268	73.761
118.214	73.987
119.473	75.558
120.580	74.218
121.368	75.115
122.157	75.118
122.945	75.344
124.208	75.123
124.997	75.125
125.786	75.128
126.575	75.130
127.362	76.028
128.307	76.926
129.730	75.363
130.834	75.590
131.464	76.263
132.568	76.714
133.357	76.940
133.987	77.389
135.249	77.841
136.512	77.397
137.142	77.622
137.931	77.624
139.037	76.732
140.297	78.079
141.086	78.305
141.559	78.754
142.346	79.652
142.979	78.758
144.555	79.882
145.815	80.781
146.602	81.902
147.235	81.232
148.497	81.460
149.126	82.357
149.757	82.583
150.388	82.585
151.335	82.587
152.123	83.037
152.912	83.263
154.802	85.060
155.434	84.614
157.330	83.276
157.960	83.501
158.591	83.951
160.168	84.179
161.115	84.406];
units.tW   = {'d', 'g'};  label.tW = {'time', 'weight'};  
temp.tW    = C2K(36.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HiroHara2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_3: tW data included';   
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '54XZK'; % Cat of Life
metaData.links.id_ITIS = '944115'; % ITIS
metaData.links.id_EoL = '127526'; % Ency of Life
metaData.links.id_Wiki = 'Tarsius_tarsier'; % Wikipedia
metaData.links.id_ADW = 'Tarsius_tarsier'; % ADW
metaData.links.id_Taxo = '1003327'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100176'; % MSW3
metaData.links.id_AnAge = 'Tarsius_tarsier'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tarsius_tarsier}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tarsius_tarsier}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HiroHara2011'; type = 'Article'; bib = [ ... 
'author = {A. Hirota and T. Hara and T. Hosoda and F. Hashizak}, ' ... 
'year = {2011}, ' ...
'title = {Hand-Raising a Spectral Tarsier (\emph{Tarsius tarsier}) at the {U}eno {Z}oological {G}ardens}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {30}, ' ...
'pages = {218--224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

