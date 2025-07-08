function [data, auxData, metaData, txtData, weights] = mydata_Aethomys_hindei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Aethomys_hindei'; 
metaData.species_en = 'Hinde''s rock rat'; 

metaData.ecoCode.climate = {'Aw', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 11 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 24.5;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Okia1976';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Okia1976';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 189;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'Okia1976';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 206;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male'; bibkey.tpm = 'Okia1976';
  temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Okia1976';
  comment.Wwb = 'based on extrapolation of tW data';
data.Wwi = 210;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Okia1976';
data.Wwim = 210;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Okia1976';

data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Okia1976';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 or 3 pups per litter; 1 litter per yr assumed';
   
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
9.722	15.462
10.487	18.341
13.427	17.975
14.196	21.214
16.447	25.530
17.861	19.766
21.576	23.359
22.363	28.398
22.377	29.838
22.392	31.278
22.417	33.799
29.116	41.346
29.928	48.906
31.342	43.141
32.922	53.940
34.975	38.453
35.101	51.055
36.598	53.572
36.624	56.093
38.186	65.091
41.017	53.923
41.093	61.484
41.713	49.961
42.594	64.362
43.258	57.159
46.187	55.712
48.467	62.909
48.655	81.632
51.382	60.022
51.638	85.586
56.811	87.736
58.045	63.969
58.254	84.852
59.654	77.648
60.512	89.888
69.488	104.272
70.924	100.668
74.744	114.703
75.285	95.258
84.228	106.401
85.184	128.363
90.459	140.594
99.243	135.895
101.602	151.012
109.549	136.233
111.169	150.992
111.739	134.428
113.474	160.709
115.610	153.503
119.145	139.093
119.192	143.774
119.369	161.417
119.434	167.898
125.267	162.484
126.869	175.443
131.872	160.670
134.188	171.467
137.712	155.977
140.826	172.893
146.075	182.604
148.820	162.794
155.653	183.664
156.215	166.379
156.468	191.583
162.048	160.966
163.124	194.810
168.225	189.758
169.382	158.430
175.378	169.219
176.403	198.022
179.703	160.209
182.639	159.482
183.401	162.001
188.931	199.796
207.113	178.154
209.854	157.984
210.846	183.547
221.344	202.968
223.057	153.636
223.498	197.563
230.962	207.989
237.721	148.204
238.104	186.370
240.482	203.288
240.802	161.879
241.755	183.481
247.422	161.505
247.447	164.026
249.879	186.345
249.915	189.945
254.034	160.411
254.853	168.691
258.010	189.928
258.191	207.931
260.351	203.246
264.460	172.631
267.411	173.345
284.362	175.830
284.391	178.710
285.419	207.873
296.220	184.086
330.959	199.135
341.378	210.635
343.474	199.469];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature'; 
bibkey.tW_f = 'Okia1976';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
18.680	28.046
18.734	33.446
23.128	31.277
31.995	34.859
42.608	65.802
51.508	72.624
52.287	76.943
54.589	86.300
59.646	76.928
60.433	81.967
63.568	101.044
70.765	84.826
71.746	109.308
73.171	104.624
83.590	116.124
84.452	128.725
89.723	140.596
91.985	145.992
94.214	148.147
103.215	165.051
108.392	167.561
109.077	162.519
111.476	181.597
119.484	172.938
123.287	185.173
128.554	196.684
129.087	176.519
136.671	198.827
137.955	180.101
141.800	196.655
143.878	183.689
149.783	185.477
152.832	195.912
155.822	200.586
157.171	188.341
165.292	190.845
166.865	200.923
171.958	195.151
179.260	189.375
181.514	194.051
194.793	197.263
205.861	200.120
255.243	207.577
314.874	209.611];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature'; 
bibkey.tW_m = 'Okia1976';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '65CM3'; % Cat of Life
metaData.links.id_ITIS = '585116'; % ITIS
metaData.links.id_EoL = '1178643'; % Ency of Life
metaData.links.id_Wiki = 'Aethomys_hindei'; % Wikipedia
metaData.links.id_ADW = 'Aethomys_hindei'; % ADW
metaData.links.id_Taxo = '89245'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001192'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aethomys_hindei}}';
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
bibkey = 'Okia1976'; type = 'Article'; bib = [ ... 
'author = {N. Okia}, ' ... 
'year = {1976}, ' ...
'title = {The biology of the Bush rat, \emph{Aethomys hindei} {T}homas in {S}outhern {U}ganda}, ' ...
'journal = {J. Zool. Lond.}, ' ...
'volume = {180}, ' ...
'number = {3}, ' ...
'pages = {41-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1178643/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

