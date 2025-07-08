function [data, auxData, metaData, txtData, weights] = mydata_Diaphus_dumerilii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Diaphus_dumerilii'; 
metaData.species_en = 'Lanternfish'; 
metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(9.6); % in K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 22]; 

%% set data
% zero-variate data
data.tj = 28; units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'Gart1991';  
  temp.tj = C2K(9.6); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Gart1991';  
  temp.am = C2K(9.0); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'Gart1993';
data.Li = 6.5;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'Gart1991';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Gart1993';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 0.11; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'Gart1993','fishbase'};  
  comment.Wwp = 'based on 0.00724*Lp^3.00, see F3';
data.Wwi = 2;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = {'Gart1993','fishbase'};     
  comment.Wwi = 'based on 0.00724*Li^3.00, see F3';

data.Ri = 8e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(9.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (d), standard length (cm) 
37.216	1.521
37.634	1.321
38.471	1.392
39.725	1.321
40.143	1.521
40.562	1.392
41.816	1.321
42.234	1.392
43.070	1.522
43.907	1.522
44.743	1.192
44.743	1.687
45.579	1.392
45.998	1.498
48.507	1.581
49.761	1.687
49.761	1.746
51.852	1.699
52.270	1.593
53.943	1.687
53.943	1.817
55.615	1.711
58.961	1.912
60.633	1.594
61.888	1.912
61.888	1.971
62.306	1.711
62.724	2.065
62.724	2.101
63.560	1.877
63.560	1.983
63.560	2.030
63.560	2.230
64.397	2.171
64.397	2.254
64.815	2.313
65.233	1.877
67.742	2.065
68.578	2.219
68.996	2.007
68.996	1.959
70.669	2.431
71.505	2.278
71.924	2.101
73.596	1.995
73.596	1.889
74.432	2.431
76.523	2.302
76.941	2.113
78.614	2.420
81.123	2.491
81.541	2.338
81.959	2.691
83.632	2.456
84.050	2.538
84.050	2.585
85.305	2.927
85.305	2.892
85.723	3.045
87.395	2.503
89.068	2.574
89.068	2.303
89.068	2.703
89.068	2.798
90.323	2.503
90.741	2.810
91.577	2.586
91.577	2.409
91.995	3.010
92.832	3.222
94.504	2.692
96.595	3.010
96.595	2.963
99.104	2.916
99.522	3.129
100.358	2.704
100.777	2.492
101.195	2.916
102.031	2.693
102.449	3.023
103.704	2.905
103.704	2.693
104.540	3.141
104.958	2.822
106.631	3.117
108.303	3.223
108.722	3.223
108.722	3.318
110.394	3.200
111.231	3.530
113.321	3.012
114.158	3.200
115.830	3.507
116.249	3.306
117.085	3.307
117.085	3.024
118.339	3.307
118.339	3.024
118.757	3.130
119.176	3.307
119.594	3.036
120.430	3.307
120.430	3.036
120.430	3.531
122.103	3.201
122.103	3.625
124.612	3.295
125.030	3.720
126.284	3.390
126.703	3.519
128.793	3.237
128.793	3.814
130.466	3.390
132.557	3.508
133.393	3.732
134.648	3.414
135.066	3.732
135.066	3.732
137.575	3.001
137.575	3.732
137.993	3.732
138.411	3.862
138.829	3.591
138.829	4.133
141.338	3.509
142.174	3.332
142.174	3.921
142.593	3.591
144.265	3.910
145.938	3.615
145.938	3.308
146.774	4.311
147.611	3.521
148.029	3.816
148.447	4.028
148.865	4.193
150.538	3.898
150.956	4.311
152.210	3.615
152.628	3.816
154.301	4.417
158.483	4.005
159.319	3.628
159.319	3.804
160.573	4.300
160.992	4.524
163.919	3.710
165.591	3.911
165.591	4.324
166.846	4.512
168.100	3.534
168.100	4.135
169.355	3.970
175.209	4.006
177.718	4.148
180.645	4.607
181.063	4.808
184.409	4.808
185.663	4.407
186.499	3.806
186.918	4.195
188.172	4.408
192.772	4.703
194.026	4.102
194.026	4.868
195.281	4.785
195.281	4.880
195.699	5.127
196.535	4.432
197.790	4.597
198.626	5.422
199.881	4.196
211.171	5.022
215.352	4.527
221.625	4.221
222.461	4.622
227.479	4.717
233.751	4.611
235.006	5.106
235.842	4.434
240.860	5.189
241.697	5.720
243.369	5.331
247.551	5.284
249.642	4.919
254.241	5.638
257.168	4.813
257.587	5.214
265.114	5.214
273.477	5.427
274.313	5.616
288.530	5.817
296.057	5.405
297.730	5.712
304.421	5.806
307.348	6.313
322.820	5.996
361.708	6.294];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(9.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gart1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 9.6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Length-Weight relationship: W in g =  0.00724*(SL in cm)^3.00';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '35CGP'; % Cat of Life
metaData.links.id_ITIS = '623874'; % ITIS
metaData.links.id_EoL = '46564054'; % Ency of Life
metaData.links.id_Wiki = 'Diaphus'; % Wikipedia
metaData.links.id_ADW = 'Diaphus_dumerilii'; % ADW
metaData.links.id_Taxo = '173054'; % Taxonomicon
metaData.links.id_WoRMS = '126590'; % WoRMS
metaData.links.id_fishbase = 'Diaphus-dumerilii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diaphus}}';
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
bibkey = 'Gart1991'; type = 'article'; bib = [ ...
'author = {J.V. Gartner}, ' ... 
'year   = {1991}, ' ...
'title  = {Life histories of three species of lanternfishes ({P}isces: {M}yctophidae) from the eastern {G}ulf of {M}exico {I}{I}. {A}ge and growth patterns}, ' ...
'journal = {Marine Biology}, ' ...
'page = {21-27}, ' ...
'volume = {111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gart1993'; type = 'article'; bib = [ ...
'author = {J.V. Gartner}, ' ... 
'year   = {1993}, ' ...
'title  = {PATTERNS OF REPRODUCTION IN THE DOMINANT LANTERNFISH SPECIES ({P}ISCES: {M}YCTOPHIDAE) OF THE {E}ASTERN {G}ULF OF {M}EXICO, WITH A REVIEW OF REPRODUCTION AMONG TROPICAL-SUBTROPICAL {M}YCTOPHIDAE}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'page = {721-750}, ' ...
'volume = {52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Diaphus-dumerilii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

