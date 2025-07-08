function [data, auxData, metaData, txtData, weights] = mydata_Eublepharis_macularius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Eublepharidae';
metaData.species    = 'Eublepharis_macularius'; 
metaData.species_en = 'Common leopard gecko'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 16];

%% set data
% zero-variate data

data.ab = 55;  units.ab = 'd';    label.ab = 'time at birth'; bibkey.ab = 'AnAge';   
  temp.ab = C2K(32); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 400;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(32); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 28.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(32); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 6;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Wiki';
  comment.Lb = '5 to 7 cm';
data.Li  = 19;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'Wiki';  
  comment.Li = '18 to 20 cm';
data.Lim  = 24;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'Wiki';  
  comment.Lim = '20 to 28 cm';

data.Wwb = 2.8;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = '2 to 5 g';
data.Wwi = 60;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '50 to 70 g';
data.Wwim = 70;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';
  comment.Wwim = '60 to 80 g';

data.Ri  = 7*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(32);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 young per clutch, 6 to 8  clutch each yr';

% univariate data
% time -  length data
data.tW = [ ... % time since birth (d),  wet weight (g) - weight (0)
1.020	0.027
3.926	0.267
6.259	1.363
8.438	1.550
11.486	1.523
13.374	1.603
15.986	1.603
18.310	1.737
21.069	1.870
23.688	2.511
26.010	2.485
28.336	2.805
30.803	2.805
33.416	2.859
35.594	2.912
38.211	3.313
40.969	3.366
42.856	3.366
45.616	3.634
48.084	3.634
50.407	3.767
52.585	3.847
55.495	4.489
57.672	4.489
60.285	4.569
62.609	4.676
65.087	5.718
67.992	5.985
70.175	6.492
72.645	6.733
75.402	6.733
77.584	7.134
80.053	7.267
82.375	7.267
84.848	7.802
87.606	7.882
89.789	8.443
92.404	8.683
94.584	8.924
97.056	9.431
99.380	9.511
102.141	9.832
104.610	10.046
106.932	10.046
109.545	10.046
112.015	10.286
114.340	10.553
116.955	10.821
119.431	11.649
121.900	11.809];
data.tW(:,2) = data.tW(:,2) + 2;
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'cricket'};  
temp.tW   = C2K(32);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GautLesb2012';
comment.tW = 'Diet: House Cricket, Acheta domestica';
%
data.tW1 = [ ... % time since birth (d), wet weight (g) - weight (0)
1.602	0.134
4.215	0.187
6.687	0.641
8.575	0.748
11.190	0.908
13.367	0.962
15.397	0.775
16.561	1.069
19.174	1.069
21.353	1.229
23.388	1.496
26.145	1.469
28.179	1.683
30.647	1.683
32.970	1.763
35.001	1.710
37.760	1.817
40.227	1.817
42.694	1.763
45.162	1.817
47.630	1.870
50.097	1.870
52.565	1.897
55.180	2.164
57.213	2.218
60.264	2.485
62.153	2.698
65.060	3.099
67.675	3.340
69.710	3.607
72.324	3.794
74.648	3.927
77.263	4.168
79.441	4.302
82.055	4.408
84.670	4.702
86.995	4.916
89.319	5.076
91.642	5.156
94.256	5.317
96.871	5.557
99.194	5.611
101.808	5.798
103.988	6.011
106.600	6.011
109.068	6.038
111.391	6.118
114.006	6.305
116.183	6.332
118.946	6.866
121.273	7.267];
data.tW1(:,2) = data.tW1(:,2) + 2;
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'mealworm'};  
temp.tW1   = C2K(32);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'GautLesb2012';
comment.tW1 = 'Diet: Beetle Mealworm, Tenebrio molitor';

data.tW2 = [ ... % time since birth (d), weight (g)
0.040	3.857
31.096	14.412
61.126	25.374
91.111	32.276
123.169	39.989
153.192	50.342
182.177	60.085
247.219	65.972
306.031	68.002
367.937	70.032
425.746	74.701
487.665	77.949
547.513	80.385
600.121	80.994
669.236	82.009
753.826	83.429
853.892	85.256];
units.tW2  = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2   = C2K(32);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'thepetenthusiast';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 2 * weights.tW;
weights.tW2 = 10 * weights.tW2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for diet on house cricket, mealworm'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'females can be produced at  cool (26-29 C) and very warm  (34-35 C) temperatures; males at intermediate temperatures (31-33 C).';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BNV5'; % Cat of Life
metaData.links.id_ITIS = '818506'; % ITIS
metaData.links.id_EoL = '790141'; % Ency of Life
metaData.links.id_Wiki = 'Eublepharis_macularius'; % Wikipedia
metaData.links.id_ADW = 'Eublepharis_macularius'; % ADW
metaData.links.id_Taxo = '48868'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Eublepharis&species=macularius'; % ReptileDB
metaData.links.id_AnAge = 'Eublepharis_macularius'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eublepharis_macularius}}';
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
bibkey = 'GautLesb2012'; type = 'Article'; bib = [ ... 
'author = {Christopher Gauthier and David Lesbarr\`{e}res}, ' ... 
'year = {2012}, ' ...
'title = {GROWTH RATE VARIATION IN CAPTIVE SPECIES: THE CASE OF LEOPARD GECKOS, \emph{Eublepharis macularius}}, ' ...
'pages = {449-455}, ' ...
'volume = {5(3)}, ' ...
'journal = {Herpetological Conservation and Biology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eublepharis_macularius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'thepetenthusiast'; type = 'Misc'; bib = ...
'howpublished = {\url{https://thepetenthusiast.com/leopard-gecko-growth-chart/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
