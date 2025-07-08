function [data, auxData, metaData, txtData, weights] = mydata_Benthosema_suborbitale
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Benthosema_suborbitale'; 
metaData.species_en = 'Smallfin lanternfish'; 
metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(8.8); % in K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

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
data.tj = 40; units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'Gart1991';  
  temp.tj = C2K(8.8); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 0.8*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Gart1991';  
  temp.am = C2K(8.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.3;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'Gart1993';
data.Li = 3.2;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'Gart1991';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Gart1993';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 0.16; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'Gart1993','fishbase'};  
  comment.Wwp = 'based on 0.01023*Lp^3.10, see F3';
data.Wwi = 0.38;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = {'Gart1993','fishbase'};     
  comment.Wwi = 'based on 0.01023*Li^3.10, see F3';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (d), standard length (cm) 
55.892	1.189
57.434	1.189
57.819	1.189
59.361	1.189
60.518	1.297
62.059	1.194
67.841	1.199
68.998	1.199
68.998	1.302
70.925	1.096
71.696	1.189
71.696	1.302
73.623	1.199
73.623	1.395
74.009	1.287
74.394	1.287
75.551	1.204
75.551	1.204
75.936	1.498
76.322	1.395
78.634	1.199
82.874	1.484
83.260	1.401
86.344	1.484
90.198	1.484
94.053	1.597
94.438	1.484
95.595	1.803
98.293	1.494
98.293	1.597
99.835	1.891
101.762	1.896
102.533	1.696
103.689	1.696
104.460	1.598
106.002	1.598
106.002	1.691
106.388	1.789
107.544	1.691
107.930	1.789
108.315	1.892
109.471	1.789
109.471	1.995
111.013	1.789
111.013	1.892
111.784	2.299
112.170	1.789
112.555	1.892
112.941	1.892
114.482	1.882
114.868	1.887
114.868	2.098
115.639	1.995
117.181	1.882
117.566	1.794
119.493	2.191
120.264	1.892
121.035	2.088
121.806	2.304
122.192	1.990
123.733	1.991
124.504	2.089
127.203	2.089
129.515	2.089
129.515	2.187
130.286	2.089
131.057	2.187
131.443	1.991
131.828	2.192
132.214	2.089
133.370	1.996
133.756	2.192
135.683	2.099
135.683	2.192
135.683	2.285
137.225	2.285
139.152	2.285
140.308	2.285
140.694	1.898
141.079	2.285
141.850	2.285
143.007	2.403
143.392	2.285
144.548	2.286
144.934	2.187
144.934	2.286
146.476	2.286
148.403	2.286
149.559	2.286
155.727	2.502
157.269	2.502
158.040	2.291
158.040	2.502
159.967	2.502
161.894	2.600
163.436	2.698
165.749	2.502
165.749	2.502
165.749	2.713
166.520	2.286
167.291	2.713
167.676	2.492
168.062	2.600
169.604	2.713
170.760	2.600
172.687	2.713
173.844	2.395
175.000	2.601
175.000	2.708
178.084	2.601
178.084	2.503
179.240	2.601
185.022	2.699
192.731	2.493
192.731	2.297
194.659	2.601
195.430	2.498
196.200	2.601
196.971	2.503
197.357	2.601
198.513	2.704
198.899	2.798
199.670	2.602
200.826	2.709
201.982	2.906
205.452	2.602
206.608	2.602
207.379	2.705
208.921	3.004
209.692	2.700
210.077	3.004
210.848	2.597
212.775	2.597
213.932	2.813
216.245	2.901
219.328	2.602
221.641	2.602
222.026	2.911
227.037	2.701
227.423	2.902
228.194	2.809
231.278	3.005
232.819	3.010
235.132	3.005
242.070	2.804
244.383	2.819
245.154	2.907
245.540	2.702
247.081	2.599
249.780	2.800
251.322	3.015
252.093	2.908
252.863	3.016
255.947	3.016
257.104	3.016
258.645	3.114
258.645	3.212
259.031	3.011
259.031	3.016
259.802	3.114
260.187	3.011
262.500	3.011
264.813	2.702
265.584	2.702
266.355	3.217
273.293	3.110
277.533	2.703
282.159	3.115
282.930	2.811
284.086	3.115
289.482	3.213
292.952	3.012
294.108	3.115
295.264	2.807
300.661	3.116
303.359	2.905
304.515	3.111
311.454	3.008
312.225	3.003
325.330	3.215];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(8.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gart1991';

% length-fecundity
data.LN = [ ... % standard length (cm), number of oocytes (#)
2.405	 97.360
2.494	202.970
2.499	153.465
2.604	161.716
2.694	202.970
2.702	221.122
2.799	277.228
2.881	259.076
2.987	211.221
3.007	224.422
3.105	229.373
3.196	409.005
3.198	399.576];
units.LN = {'cm', '#'}; label.LN = {'standard length', 'fecundity'};  
temp.LN = C2K(8.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Gart1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;
weights.LN = 5*weights.LN;

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
F1 = 'Preferred temperature 8.8 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Length-Weight relationship: W in g =  0.01023*(SL in cm)^3.10';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'LHZW'; % Cat of Life
metaData.links.id_ITIS = '162682'; % ITIS
metaData.links.id_EoL = '46564029'; % Ency of Life
metaData.links.id_Wiki = 'Benthosema_suborbitale'; % Wikipedia
metaData.links.id_ADW = 'Benthosema_suborbitale'; % ADW
metaData.links.id_Taxo = '164102'; % Taxonomicon
metaData.links.id_WoRMS = '126581'; % WoRMS
metaData.links.id_fishbase = 'Benthosema-suborbitale'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Benthosema}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Benthosema-suborbitale.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

