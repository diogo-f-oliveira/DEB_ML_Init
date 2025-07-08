function [data, auxData, metaData, txtData, weights] = mydata_Neotoma_floridana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Neotoma_floridana'; 
metaData.species_en = 'Eastern woodrat'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iFm', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 33;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 22;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 95;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8.6*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 13.43;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 45.9;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 291;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 3.5*2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.5 pups per litter; 2.5 litters per yr';
  
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
1.109	13.173
2.699	13.866
3.609	15.476
4.745	16.168
5.654	16.859
6.790	18.240
7.926	19.162
12.247	24.684
13.385	26.524
17.250	30.898
18.161	32.967
18.616	33.657
19.980	35.038
21.346	37.797
24.302	41.479
25.462	55.259
26.380	61.461
27.524	66.286
27.985	70.650
29.131	77.082
30.969	89.257
32.106	90.867
33.252	97.070
35.083	106.029
38.284	119.356
39.185	115.684
40.098	118.901
40.554	120.280
41.926	126.024
44.868	121.900
46.688	124.890
48.281	127.420
51.916	130.185
52.827	132.025
53.733	131.338
55.323	132.491
56.006	133.870
58.730	134.796
60.091	134.800
60.533	127.913
61.666	127.457
62.578	129.756
65.529	130.682
66.437	130.915
67.342	129.769
68.026	131.378
68.934	132.070
72.117	135.523
73.474	133.460
73.934	136.905
75.294	136.220
76.204	137.600
78.931	139.904
80.294	140.826
80.518	139.449
83.690	137.162
84.607	142.216
86.423	142.680
87.329	142.224
88.466	143.375
89.829	144.756
93.236	146.603
94.599	147.754
95.494	140.869
96.864	145.924
97.316	144.548];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(37.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'McClRand1980';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.858	15.335
1.415	16.729
2.243	15.335
3.075	15.892
3.911	18.123
5.020	18.680
6.406	19.238
9.738	23.699
12.237	27.045
15.849	32.621
17.513	33.736
18.347	35.409
19.735	37.082
20.572	40.149
21.962	42.937
23.361	50.465
24.203	56.599
25.325	63.848
26.443	69.703
27.007	74.721
28.124	79.740
29.523	87.268
31.767	102.323
33.717	108.178
33.726	112.918
36.524	128.253
37.913	130.204
39.303	132.993
40.969	135.223
40.977	139.684
45.697	145.539
47.088	148.606
47.925	151.952
50.703	156.413
51.545	161.989
52.929	161.431
53.485	162.825
55.148	163.383
58.215	173.978
59.606	177.323
60.996	179.833
62.110	182.900
64.612	187.918
66.563	194.331
67.948	194.331
70.451	199.628
71.273	194.888
74.039	192.937
74.327	198.792
75.437	199.628
76.824	201.022
78.756	196.840
80.153	203.532
81.540	204.647
82.096	205.762
83.209	208.271
86.256	208.271
87.644	209.665
89.601	219.703
92.654	222.770
94.046	226.394
95.423	222.212
96.257	223.885
97.367	225.000];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(37.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'McClRand1980';
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_1: food vailability taken varying in tW data';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7W24T'; % Cat of Life
metaData.links.id_ITIS = '180372'; % ITIS
metaData.links.id_EoL = '328454'; % Ency of Life
metaData.links.id_Wiki = 'Neotoma_floridana'; % Wikipedia
metaData.links.id_ADW = 'Neotoma_floridana'; % ADW
metaData.links.id_Taxo = '62330'; % Taxonomicon
metaData.links.id_MSW3 = '13000412'; % Mammal Spec World
metaData.links.id_AnAge = 'Neotoma_floridana'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neotoma_floridana}}';
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
bibkey = 'McClRand1980'; type = 'Article'; bib = [ ... 
'author = {P. A. McClure and J. C. Randolph}, ' ... 
'year = {1980}, ' ...
'title = {Relative Allocation of Energy to Growth and Development of Homeothermy in the Eastern Wood Rat (\emph{Neotoma floridana}) and Hispid Cotton Rat (\emph{Sigmodon hispidus})}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {50}, ' ...
'pages = {199--219}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Neotoma_floridana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

