function [data, auxData, metaData, txtData, weights] = mydata_Maurolicus_muelleri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Phosichthyidae';
metaData.species    = 'Vinciguerria_nimbaria'; 
metaData.species_en = 'Oceanic lightfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % in K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2018 12 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 21]; 

%% set data
% zero-variate data
data.tp = 85; units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'SteqMena2003';  
  temp.tp = C2K(24.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*30.5; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SteqMena2003';  
  temp.am = C2K(24.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.06;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'SteqMena2003';
data.Li = 5.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.44e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'SteqMena2003';
  comment.Wwb = 'based on egg diameter of 0.65 mm: pi/6*0.065^3';
data.Wwi = 1.38;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00813*Li^3.08, see F3';  

% uni-variate data
% tL data
data.tL = [ ... % time since birth (d),  standard length (cm) 
12.446	0.773
15.422	0.933
20.833	1.267
21.645	1.387
22.727	1.199
60.335	2.006
68.994	2.285
69.535	2.258
69.535	2.392
69.535	2.472
73.052	2.552
73.052	2.405
74.675	2.458
75.758	2.631
77.652	2.631
78.463	2.443
80.628	2.697
83.604	2.629
85.498	2.843
86.310	3.071
87.933	3.003
90.909	3.444
91.450	3.150
91.450	3.217
92.262	3.484
92.532	2.627
92.803	2.828
93.615	2.305
93.885	2.573
94.426	2.774
95.238	2.372
97.673	3.094
97.673	2.733
104.167	3.294
107.684	3.480
109.037	3.145
109.037	3.332
109.848	3.520
110.660	3.935
111.742	2.957
111.742	3.050
112.554	3.211
112.825	3.278
112.825	3.827
113.366	2.943
113.636	3.037
113.907	3.144
114.448	3.318
114.448	3.465
115.260	2.969
116.342	3.063
116.613	3.491
117.424	3.759
117.695	3.946
117.965	3.638
118.777	4.294
119.048	3.263
119.318	3.544
120.400	3.329
120.671	3.597
121.212	3.851
121.753	2.927
121.753	4.106
121.753	4.400
122.024	4.280
122.835	4.226
123.377	3.904
123.377	4.306
124.459	4.440
124.729	3.569
125.000	3.743
125.271	4.185
125.541	4.373
126.353	3.676
126.623	4.104
126.623	4.064
126.623	4.560
127.435	4.439
128.517	4.225
129.600	4.479
129.870	4.278
130.141	3.528
131.764	4.384
131.764	4.304
131.764	4.009
132.035	3.902
132.305	5.027
132.305	4.170
133.387	3.982
133.929	4.196
133.929	4.076
134.470	4.276
135.011	4.705
135.552	4.370
136.364	4.584
136.364	4.517
136.905	3.901
137.446	4.383
137.446	4.008
138.528	4.222
138.799	4.289
138.799	4.423
139.069	4.048
139.069	4.704
139.610	4.797
140.693	4.610
140.693	4.824
141.234	4.529
141.504	4.623
142.587	4.917
143.939	3.671
144.210	3.939
145.292	4.394
145.292	4.675
145.563	4.193
146.374	4.742
146.916	4.193
148.268	4.353
148.810	4.273
149.892	4.554
150.433	4.299
151.245	4.701
151.515	4.406
152.327	4.593
152.327	4.807
154.491	4.405
154.491	4.619
154.762	4.753
155.844	4.619
156.115	4.431
159.361	4.645
160.173	5.020
160.173	4.886
160.985	4.443
161.255	4.162
162.338	4.590
163.690	4.858
163.690	4.751
165.314	4.349
165.855	4.643
166.126	4.831
167.208	4.589
167.749	4.281
168.019	5.004
168.019	4.642
169.372	4.696
170.725	4.602
170.996	5.070
170.996	4.682
170.996	4.816
172.078	4.963
172.078	4.548
173.972	5.458
175.054	4.748
178.571	4.479
179.383	4.479
179.654	4.653
180.736	4.465
180.736	4.586
181.006	4.974
183.442	4.746
183.983	4.598
185.335	4.959
187.771	4.476
188.041	4.651
188.582	4.597
189.935	4.797
212.662	5.006
222.673	5.271];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TomaPanf2000';

% length-batch fecundity
data.LN = [ ... % standard length (cm), batch fecundity (#)
3.644	521.350
4.079	484.721
4.084	614.939
4.166	576.958
4.454	1389.877
4.481	746.655
4.503	991.815
4.535	2508.351
4.549	1581.707
4.579	900.203
4.601	1038.141
4.622	1405.840
4.625	808.476
4.628	1091.856
4.655	440.975
4.666	1237.516
4.666	762.680
4.693	1498.014
4.717	1559.377
4.745	1046.352
4.761	510.309
4.766	1168.973
4.769	2019.093
4.785	855.042
4.834	2448.227
4.837	1414.320
4.889	1230.711
4.905	2402.545
4.905	932.086
4.929	1644.433
4.938	411.423
4.957	1629.220
4.978	687.290
4.981	840.474
4.986	1882.070
5.068	2150.435
5.068	2502.732
5.073	1438.202
5.090	886.842
5.103	2862.824
5.109	687.790
5.171	741.640];
units.LN = {'cm', '#'}; label.LN = {'standard length', 'batch fecundity'};  
temp.LN = C2K(24.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'SteqMena2003';
comment.LN = 'Assumed batch interval is 16 d, based on lifetime reproductive output of 9000 eggs and reproductive period of 120 d';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 24.5 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Epi- to abyssopelagic but usually mesopelagic, mainly found at 200-400 m by day and upper 100 m by night';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-wight: Ww in g = 0.00813 * (SL in cm)^3.08';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '5BG55'; % Cat of Life
metaData.links.id_ITIS = '162194'; % ITIS
metaData.links.id_EoL = '46563253'; % Ency of Life
metaData.links.id_Wiki = 'Vinciguerria_nimbaria'; % Wikipedia
metaData.links.id_ADW = 'Vinciguerria_nimbaria'; % ADW
metaData.links.id_Taxo = '190017'; % Taxonomicon
metaData.links.id_WoRMS = '127303'; % WoRMS
metaData.links.id_fishbase = 'Vinciguerria-nimbaria'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vinciguerria_nimbaria}}';
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
bibkey = 'TomaPanf2000'; type = 'article'; bib = [ ...
'author = {Javier Tom\''{a}s, Jacques Panfili}, ' ... 
'year   = {2000}, ' ...
'title  = {Otolith microstructure examination and growth patterns of \emph{Vinciguerria nimbaria} ({P}hotichthyidae) in the tropical {A}tlantic {O}cean}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {131-145}, ' ...
'volume = {46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SteqMena2003'; type = 'article'; bib = [ ...
'doi = {10.1046/j.1095-8649.2003.00104.x}, ' ...
'author = {B. Stequert and F. Menard and E. Marchal}, ' ... 
'year   = {2003}, ' ...
'title  = {Reproductive biology of \emph{Vinciguerria nimbaria} in the equatorial waters of the eastern {A}tlantic {O}cean}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {1116-1136}, ' ...
'volume = {62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Vinciguerria-nimbaria.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

