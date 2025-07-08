function [data, auxData, metaData, txtData, weights] = mydata_Aphia_minuta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Aphia_minuta'; 
metaData.species_en = 'Transparant goby'; 

metaData.ecoCode.climate = {'MC','MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jFe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 23];

%% set data
% zero-variate data

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 7.9;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 0.3249;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00525*Lp^3.09, see F1';
data.Wwi = 3.11;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00525*Li^3.09, see F1';

data.Ri  = 2648/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [... %  time since birth (d), total length (cm)
39.238	1.456
46.062	1.839
47.912	1.991
51.750	1.649
52.420	1.446
52.986	1.738
53.577	1.916
57.316	2.044
59.300	1.561
61.759	1.803
62.980	1.969
63.674	1.651
64.161	2.325
66.081	2.147
68.631	1.957
69.923	1.779
70.439	2.313
72.968	2.224
76.760	2.098
78.085	1.768
79.872	2.226
80.539	2.035
81.074	2.480
81.640	2.773
82.991	2.315
84.111	2.964
86.738	2.405
87.953	2.596
91.062	2.736
94.711	3.296
94.876	2.508
96.048	2.902
96.628	3.131
102.957	2.878
104.864	2.764
108.090	2.345
109.837	2.993
112.445	2.524
113.645	2.791
116.772	2.842
120.583	2.627
121.750	3.046
127.417	2.958
130.489	3.277
130.539	3.035
135.533	3.163
136.706	3.557
137.432	3.087
142.392	3.380
142.413	3.279
143.620	3.508
145.572	3.177
148.593	3.737
151.803	3.395
151.822	3.306
153.643	3.598
158.060	3.485
161.169	3.625
162.927	4.223
164.270	3.803
165.017	3.232
167.341	4.122
168.743	3.423
173.678	3.830
182.419	4.048
184.959	3.909
186.669	4.735
189.831	4.621
196.854	4.051
200.686	3.733
226.250	4.539
226.356	4.030
244.410	4.732
275.915	4.140];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(10.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Mesa1999';
comment.tL_f = 'Data for females';
%
data.tL_m = [... %  time since birth (d), total length (cm)
40.127	1.433
49.045	1.611
50.955	2.017
50.955	1.827
52.229	1.421
54.140	1.662
54.777	1.789
56.688	1.928
61.146	2.182
61.783	1.510
64.331	1.725
64.331	1.560
65.605	2.296
67.516	2.600
68.790	2.207
68.790	1.827
70.701	2.131
71.338	2.499
75.796	1.700
77.070	2.626
78.981	2.106
79.618	2.334
82.803	2.588
82.803	2.030
83.439	2.397
84.713	2.233
88.535	2.524
89.172	2.854
89.172	2.283
89.809	3.044
90.446	2.740
94.904	2.423
94.904	2.220
95.541	2.765
96.178	3.323
96.178	2.626
100.000	3.057
101.911	2.956
103.185	3.222
105.732	2.309
106.369	2.410
107.643	2.702
108.280	2.867
108.917	3.209
110.191	2.968
115.287	2.778
117.197	2.968
119.108	3.121
120.382	2.803
120.382	2.537
121.019	3.463
127.389	3.159
131.210	3.222
131.847	3.095
138.217	3.019
142.038	3.362
143.312	3.108
144.586	3.742
145.223	3.235
145.860	3.488
146.497	3.323
151.592	3.222
154.140	4.211
154.140	3.603
161.146	3.831
161.783	3.488
163.057	3.729
166.879	4.224
169.427	4.148
169.427	4.376
176.433	3.831
177.707	4.008
179.618	4.047
180.892	3.539
184.076	3.882
187.261	3.653
192.357	4.541
192.357	3.831
196.178	4.288
212.739	4.909
218.471	4.795
226.752	5.036
230.573	5.264
231.210	3.780
231.847	5.340
236.943	5.061
239.490	4.021
240.764	5.378
249.682	4.211
273.885	4.135];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(10.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Mesa1999';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00525*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FD6P'; % Cat of Life
metaData.links.id_ITIS = '172033'; % ITIS
metaData.links.id_EoL = '46575170'; % Ency of Life
metaData.links.id_Wiki = 'Aphia_minuta'; % Wikipedia
metaData.links.id_ADW = 'Aphia_minuta'; % ADW
metaData.links.id_Taxo = '46558'; % Taxonomicon
metaData.links.id_WoRMS = '126868'; % WoRMS
metaData.links.id_fishbase = 'Aphia-minuta'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aphia_minuta}}';
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
bibkey = 'Mesa1999'; type = 'Article'; bib = [ ... 
'author = {M. La Mesa}, ' ... 
'year = {1999}, ' ...
'title = {Age and growth of \emph{Aphia minuta} ({P}isces, {G}obiidae) from the central {A}driatic Sea}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {63(2)}, ' ...
'pages = {147-155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Aphia-minuta.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
