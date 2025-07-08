function [data, auxData, metaData, txtData, weights] = mydata_Ostorhinchus_doederleini
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Kurtiformes'; 
metaData.family     = 'Apogonidae';
metaData.species    = 'Ostorhinchus_doederleini'; 
metaData.species_en = 'Doederlein''s cardinalfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2018 01 31];                           
metaData.email       = {'bas.kooijman@vu.nl'};                 
metaData.address     = {'VU University Amsterdam'}; 
  
metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 31]; 


%% set data
% zero-variate data

data.ab = 5;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 22;   units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'KingFinn2014';
  temp.tj = C2K(28.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 70;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KingFinn2014';
  temp.tp = C2K(28.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL data for Lp';
data.am = 368; units.am = 'd';    label.am = 'life span';                bibkey.am = 'KingFinn2014';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Japanese populations live 7 yrs (KingFinn2014,Wiki)';

data.Lj  = 1.10;  units.Lj  = 'cm';  label.Lj  = 'standard length at metam'; bibkey.Lj  = 'KingFinn2014';  
data.Lp  = 4.3;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 8.6;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'KingFinn2014';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter  0.9 mm: pi/6*0.09^3';
data.Wwj = 0.0124;  units.Wwj = 'g';   label.Wwj = 'wet weight at puberty';   bibkey.Wwj = {'KingFinn2014','fishbase'};
  comment.Wwj = 'based on Wwp = 0.00895 * Lj^3.46, see F1, F2';
data.Wwp = 1.39;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwp = 0.00895 * Lp^3.46, see F1, F2';
data.Wwi = 15.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'KingFinn2014','fishbase'};
  comment.Wwi = 'based on Wwi =  0.00895 * Li^3.46, see F1, F2';

data.Ri  = 1e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-L data
data.tL = [ ... % time (d), standard length (cm)
13.683	1.372
16.420	1.592
18.244	1.482
18.700	1.249
20.068	1.537
20.525	1.249
21.893	1.372
21.893	1.715
21.893	1.798
23.717	1.331
23.717	1.427
25.542	1.688
27.366	1.756
29.190	1.866
32.839	2.099
33.751	1.976
33.751	2.058
34.208	1.921
34.664	2.003
34.664	1.674
36.488	1.798
38.312	2.072
38.769	1.647
40.137	1.825
40.137	1.962
40.137	2.072
40.137	2.141
40.137	2.237
41.505	1.866
42.873	1.935
44.698	1.811
44.698	1.907
46.522	1.907
46.978	2.017
47.434	2.511
47.891	2.196
49.259	2.099
50.627	2.278
51.083	2.690
51.995	1.921
51.995	3.238
52.908	2.456
53.820	3.074
54.732	2.127
54.732	2.635
54.732	2.991
55.188	2.031
56.100	2.525
56.556	2.580
56.556	3.087
57.013	2.690
57.469	2.250
57.469	2.429
57.925	2.991
58.837	2.923
58.837	3.211
59.293	3.431
59.749	2.607
60.205	2.854
61.117	2.813
61.574	3.513
62.030	2.305
62.030	2.593
62.030	2.991
62.486	2.456
62.486	2.868
62.942	3.101
62.942	3.376
62.942	3.581
63.854	2.772
63.854	3.019
65.222	2.662
65.222	3.129
65.222	3.060
65.222	3.184
65.678	3.417
66.135	2.278
66.135	2.868
66.135	3.705
66.591	2.950
67.047	3.101
67.503	2.607
67.503	2.580
67.503	2.978
68.415	2.278
68.415	2.141
68.415	3.238
68.415	3.623
68.415	4.007
68.871	3.774
68.871	3.870
69.327	2.868
69.327	2.827
69.327	3.019
69.327	3.540
69.783	3.307
70.239	2.744
71.152	2.964
71.152	3.129
71.608	3.129
72.520	3.238
72.520	3.348
72.976	3.129
72.976	4.034
73.432	3.348
73.432	3.403
73.432	3.389
73.888	3.774
73.888	3.993
73.888	4.226
74.344	2.744
74.344	3.787
74.800	2.909
74.800	2.923
74.800	3.238
74.800	3.499
74.800	3.019
75.257	4.515
75.713	2.552
76.169	3.101
76.625	4.336
77.081	2.964
77.537	2.991
77.537	3.129
78.449	3.334
78.905	3.115
78.905	3.513
79.361	3.897
79.818	3.472
79.818	3.897
80.274	2.882
80.730	3.595
81.186	3.979
81.186	4.075
81.642	3.678
81.642	3.856
82.098	3.060
82.098	3.925
82.098	4.021
82.098	2.758
82.554	2.882
82.554	3.774
83.466	3.005
83.466	3.321
83.466	4.473
83.922	3.389
83.922	3.705
83.922	4.322
85.291	3.925
85.291	4.226
85.747	4.117
86.203	3.787
86.659	3.513
86.659	4.199
87.571	3.636
87.571	3.403
87.571	4.240
88.027	3.897
89.396	3.293
89.396	4.432
89.852	4.103
89.852	4.185
90.308	3.979
90.764	4.226
91.220	3.650
91.220	3.266
91.220	3.966
91.220	4.172
91.676	3.129
91.676	4.089
92.132	3.925
92.588	3.787
93.044	4.295
93.957	4.021
94.413	3.636
94.413	4.515
94.413	4.666
94.869	3.019
94.869	3.911
94.869	4.322
94.869	4.226
94.869	4.501
96.237	4.007
96.237	4.336
96.237	4.144
97.149	4.789
97.149	5.063
97.605	3.101
97.605	3.527
97.605	3.897
97.605	4.130
97.605	5.338
98.062	5.214
98.518	4.021
99.430	3.787
99.430	4.240
99.430	4.268
99.886	3.321
99.886	4.446
100.342	4.062
100.798	3.389
101.254	3.925
101.254	4.199
101.254	4.995
102.166	4.405
102.623	4.281
102.623	4.350
102.623	5.105
104.447	4.226
105.359	4.048
105.359	4.597
105.815	4.089
107.184	4.624
109.008	4.117
109.464	3.787
109.464	5.009
110.832	4.254
111.288	5.407
111.745	5.173
113.113	3.787
113.113	5.352
114.481	4.062
114.481	4.295
114.937	4.199
114.937	4.473
115.393	4.501
116.306	4.775
116.306	5.955
116.762	4.638
117.674	3.513
117.674	5.489
120.410	4.775
121.323	4.391
121.323	5.214
122.691	5.310
123.603	4.597
123.603	4.707
123.603	5.365
124.059	3.979
124.515	5.612
124.515	5.434
124.971	3.513
127.708	4.501
127.708	4.528
127.708	5.434
129.076	5.242
129.532	5.407
131.357	4.281
131.357	5.434
131.357	5.105
131.813	4.501
131.813	4.830
132.725	5.599
132.725	5.461
133.181	5.228
136.374	5.530
136.830	4.789
137.742	5.516
138.655	4.556
139.567	5.050
140.023	5.434
140.935	5.818
142.303	4.693
143.672	5.105
145.040	5.626
145.040	5.667
145.040	5.763
145.952	5.063
145.952	4.775
147.320	5.557
147.777	5.324
149.601	5.283
150.057	5.681
150.057	5.777
151.425	5.873
151.881	4.926
152.338	4.336
153.706	5.214
154.618	4.720
155.074	5.777
155.530	5.503
155.986	5.379
156.442	5.187
156.899	5.612
156.899	5.544
157.355	5.324
158.723	4.487
159.635	5.667
159.635	5.585
160.091	5.050
160.547	4.226
160.547	5.708
160.547	6.065
160.547	5.928
161.460	4.720
162.372	5.283
162.372	5.612
163.740	5.763
164.196	5.681
164.196	5.846
164.196	5.914
164.652	6.065
165.108	6.024
165.564	5.489
165.564	5.969
166.933	5.324
167.845	4.117
167.845	5.654
168.301	5.695
168.301	4.720
169.213	5.530
171.038	5.530
171.494	4.679
171.950	4.748
172.862	6.408
173.318	5.681
173.318	5.777
173.774	5.818
175.599	5.763
175.599	4.995
176.055	5.599
176.967	5.544
176.967	5.352
176.967	5.201
176.967	5.105
176.967	4.995
177.879	5.201
178.791	5.914
178.791	5.269
178.791	5.036
180.160	4.995
180.160	4.885
180.160	4.624
180.616	5.612
181.072	5.160
183.352	5.708
183.352	5.434
185.177	6.710
185.633	4.899
186.089	5.914
186.089	5.612
186.089	4.419
187.001	5.873
187.913	5.434
187.913	5.077
188.369	5.228
188.826	6.710
188.826	6.038
188.826	5.928
191.562	4.693
191.562	4.816
191.562	5.228
192.930	5.379
193.387	4.885
193.843	5.544
194.299	5.407
194.755	5.297
197.035	5.118
197.491	5.599
197.948	6.477
197.948	5.324
198.860	4.707
198.860	5.407
198.860	5.599
199.772	5.708
200.228	5.544
200.684	4.789
200.684	5.846
202.052	5.461
202.965	6.642
203.421	5.187
205.701	5.791
205.701	5.324
206.157	5.997
207.982	5.091
210.262	5.091
210.718	6.010
212.543	5.297
213.455	6.024
215.735	5.873
215.735	5.983
216.192	5.654
218.472	6.010
218.928	5.269
220.296	6.834
220.753	5.983
222.121	5.503
222.121	5.269
224.401	5.173
225.770	5.036
226.682	5.983
229.875	5.777
229.875	5.393
230.787	5.681
235.804	6.161
241.277	5.434
241.733	5.791
242.645	5.983
246.294	6.916
247.206	6.051
247.662	5.105
249.487	6.024
252.223	5.544
253.592	6.134
255.416	6.024
257.241	5.818
264.082	6.230
275.941	6.148
282.782	6.696
283.694	5.914
367.617	7.383];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KingFinn2014';


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

%% Facts
F1 = 'Length-weight:  (W in g) = 0.00895 * (standard length in cm)^3.46; Error in  fishbase: FL must be SL!';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Male tends the eggs by storing them in his mouth; males'' mouths get larger during the breeding season and the male quite often eats his eggs';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'This fish is host to the parasitic chondracanthid copepod Pseudacanthocanthopsis apogonis';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '75D2Q'; % Cat of Life
metaData.links.id_ITIS = '168248'; % ITIS
metaData.links.id_EoL = '45522432'; % Ency of Life
metaData.links.id_Wiki = 'Ostorhinchus_doederleini'; % Wikipedia
metaData.links.id_ADW = 'Apogon_doederleini'; % ADW
metaData.links.id_Taxo = '3418339'; % Taxonomicon
metaData.links.id_WoRMS = '713303'; % WoRMS
metaData.links.id_fishbase = 'Ostorhinchus-doederleini'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ostorhinchus_doederleini}}';
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
bibkey = 'KingFinn2014'; type = 'Article'; bib = [ ... 
'author = {M. J. Kingsford and M. D. Finn and M. D. O''Callaghan and J. Atema and G. Gerlach}, ' ... 
'year = {2014}, ' ...
'title = {Planktonic Larval Duration, age and growth of \emph{Ostorhinchus doederleini} ({P}isces: {A}pogonidae) on the southern {G}reat {B}arrier {R}eef, {A}ustralia}, ' ...
'journal = {Mar. Biol.}, ' ...
'doi = {10.1007/s00227-013-2331-4}, ' ...
'volume = {161}, ' ...
'pages = {245--259}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/8587}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
