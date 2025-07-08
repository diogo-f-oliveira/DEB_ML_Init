function [data, auxData, metaData, txtData, weights] = mydata_Galea_musteloides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Caviidae';
metaData.species    = 'Galea_musteloides'; 
metaData.species_en = 'Common yellow-toothed cavy'; 

metaData.ecoCode.climate = {'BWk', 'BSk', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTa', '0iTg', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2017 12 31];              

%% set data
% zero-variate data

data.tg = 54;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 39;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 66;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 60;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.3); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 37.99;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 136.8;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 337.9;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2.63*7/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 pups per litter; 2.62 litters per yr';
   
% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1.670	39.018
3.341	29.033
4.454	38.106
6.681	47.176
7.795	30.840
9.465	41.726
10.022	59.874
10.022	54.430
12.249	64.408
12.249	46.259
13.919	66.219
16.146	75.290
18.930	82.544
23.941	87.073
25.055	72.552
31.736	115.190
31.736	126.079
32.849	121.540
32.849	94.316
36.747	106.106
40.087	158.732
43.428	166.893
43.428	161.448
43.428	147.837
43.428	115.169
47.325	144.200
47.882	136.939
48.996	165.976
49.552	127.862
50.666	116.971
52.336	155.080
54.563	147.817
60.688	236.735
61.245	223.123
61.245	176.843
64.585	218.579
64.585	171.392
64.585	132.372
65.699	183.187
69.039	194.071
70.153	206.773
70.153	188.624
71.823	224.919
72.380	217.658
74.050	228.544
74.050	195.876
74.607	246.692
75.164	157.762
76.834	151.407
79.061	230.350
87.969	231.242
91.310	213.087
91.867	192.215
92.424	253.013
93.537	273.882
95.764	216.709
98.548	246.650
101.332	221.236
101.889	267.515
103.559	257.530
106.900	221.226
108.013	194.909
109.127	210.333
109.683	246.630
117.478	218.485
118.592	162.222
120.262	224.832
122.489	330.999
123.046	298.330
124.159	260.216
129.170	314.653
130.284	278.354
131.397	232.980
132.511	265.645
133.068	250.218
133.624	214.827
138.635	289.228
139.749	208.464
140.306	267.446
141.419	245.666
145.873	291.937
146.987	249.286
150.328	299.189
151.998	331.854
152.555	306.445
153.111	246.553
155.338	246.549
160.349	298.264
161.463	274.668
162.576	266.499
163.133	274.665
167.587	274.657
168.144	335.455
170.928	274.652
172.598	262.852
177.052	252.862
183.177	423.450
183.177	297.316
183.734	292.778
184.290	321.815
194.869	329.963
195.426	294.572
198.210	309.993
198.766	377.143
199.323	206.543
200.993	231.041
206.561	253.717
212.686	303.615
213.799	329.022
213.799	313.595
224.378	292.705
225.491	358.039
225.491	319.926
227.162	387.074
230.502	331.714
236.627	252.756
242.194	311.730
242.751	318.988
243.308	326.247
244.978	332.596
255.000	384.302
255.000	296.280
255.557	348.004
261.124	412.422
272.817	317.120
272.817	303.508
275.044	341.617
285.066	317.098
285.622	459.565
293.974	355.195
302.325	368.792
305.109	343.378
315.131	322.489
315.688	429.566
317.915	420.488
336.288	346.953
336.288	340.600
346.867	325.155
351.321	313.350
364.127	406.794
367.467	326.026
374.148	434.000
374.148	446.704
374.705	318.754
394.749	385.869
427.598	387.625
460.448	383.937
485.502	392.059
517.238	408.337];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Rood1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwx = 0 * weights.Wwx;

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
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3F38C'; % Cat of Life
metaData.links.id_ITIS = '584716'; % ITIS
metaData.links.id_EoL = '1038694'; % Ency of Life
metaData.links.id_Wiki = 'Galea_musteloides'; % Wikipedia
metaData.links.id_ADW = 'Galea_musteloides'; % ADW
metaData.links.id_Taxo = '63449'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400191'; % MSW3
metaData.links.id_AnAge = 'Galea_musteloides'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galea_musteloides}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Galea_musteloides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rood1972'; type = 'Article'; bib = [ ... 
'author = {Rood, J. P.}, ' ... 
'year = {1972}, ' ...
'title = {Ecological and behavioral comparisons of three genera of {A}rgentine cavies}, ' ...
'journal = {Anim. Behav. Monogr.}, ' ...
'volume = {5}, ' ...
'pages = {1-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

