function [data, auxData, metaData, txtData, weights] = mydata_Chinchilla_lanigera
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Chinchillidae';
metaData.species    = 'Chinchilla_lanigera'; 
metaData.species_en = 'Long-tailed chinchilla'; 

metaData.ecoCode.climate = {'BWk', 'Csb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 19]; 

%% set data
% zero-variate data

data.tg = 111;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 54;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 240;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.2*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(34.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 35;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwi = 642.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'AnAge';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 litters of 2 pups per yr';
  
% uni-variate data
% t-W data
data.tW = [..., % time since birth (d), weight (g)
0.791	37.504
0.791	43.273
0.791	48.081
1.779	56.739
2.372	58.665
2.372	44.242
3.557	40.402
3.953	50.981
4.941	44.255
4.941	64.447
5.336	56.756
5.731	66.374
6.719	51.955
7.510	71.190
7.510	61.575
8.696	67.349
10.079	75.048
10.870	84.668
12.648	72.176
13.834	76.990
13.834	86.605
15.020	95.265
16.403	87.579
18.182	83.741
18.775	94.321
18.775	101.052
18.972	87.591
20.553	102.983
20.751	95.292
20.751	112.600
21.739	106.835
21.937	113.567
22.332	100.107
23.913	113.576
26.087	116.472
26.285	108.780
27.273	116.477
27.866	119.365
28.261	127.059
29.051	131.870
29.051	141.486
31.028	139.572
32.016	144.385
35.968	155.942
35.968	167.481
37.352	164.603
37.549	170.373
41.502	172.315
41.502	180.007
42.095	181.933
43.676	187.710
50.395	204.088
50.395	208.896
50.395	214.665
56.917	235.851
57.312	226.237
57.312	229.122
59.684	226.248
59.684	230.095
60.672	241.638
60.870	247.408
62.648	233.955
63.241	238.766
63.241	247.419
65.613	263.777
70.553	266.685
70.553	273.416
70.553	281.108
75.889	276.326
76.087	285.943
77.668	287.873
78.261	290.761
79.249	284.035
82.016	302.317
83.202	297.515
83.202	295.592
84.585	312.907
85.771	310.989
91.304	307.170
91.304	328.324
99.802	328.364
105.929	349.548
106.522	345.704
112.648	336.118
112.846	324.581
113.636	364.969
114.625	341.897
115.020	326.514
115.217	336.131
119.368	351.535
121.937	342.894
123.518	340.978
125.099	357.332
125.494	340.988
126.680	352.532
128.261	350.617
133.794	356.412
133.794	378.528
135.178	366.035
136.166	372.770
137.945	368.932
138.142	376.626
141.304	390.102
141.700	386.258
142.292	370.876
143.083	386.265
145.257	390.121
146.245	380.511
148.814	399.754
154.941	388.245
155.138	375.746
156.917	380.562
158.696	389.224
162.253	397.895
163.834	388.288
166.008	382.529
169.170	399.852
169.565	396.008
171.344	387.362
172.134	389.289
178.458	397.012
180.435	399.906
182.016	401.837
183.794	411.461
183.794	419.153
184.585	408.580
186.759	403.782
187.549	411.479
187.549	419.171
191.304	421.112
191.304	428.804];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(37.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'infolific';


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

%% Links
metaData.links.id_CoL = '5Y457'; % Cat of Life
metaData.links.id_ITIS = '584704'; % ITIS
metaData.links.id_EoL = '326926'; % Ency of Life
metaData.links.id_Wiki = 'Chinchilla_lanigera'; % Wikipedia
metaData.links.id_ADW = 'Chinchilla_lanigera'; % ADW
metaData.links.id_Taxo = '985603'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400134'; % MSW3
metaData.links.id_AnAge = 'Chinchilla_lanigera'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chinchilla_lanigera}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chinchilla_lanigera}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Chinchilla_lanigera/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'infolific'; type = 'Misc'; bib = ...
'howpublished = {\url{http://infolific.com/pets/chinchillas/breeding-chinchillas-development-of-the-young/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

