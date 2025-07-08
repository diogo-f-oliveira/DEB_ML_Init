function [data, auxData, metaData, txtData, weights] = mydata_Pterodroma_hypoleuca
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pterodroma_hypoleuca'; 
metaData.species_en = 'Bonin petrel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 50;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 80; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 240; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30.8*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 39; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PettGran1982';
  comment.Wwb = 'Data derived from tW';
data.Wwi = 360; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'PettGran1982';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower. AnAge: 168.6 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.231	32.201
2.000	34.488
3.231	39.068
4.000	44.425
5.077	61.284
5.846	71.243
6.923	75.826
8.000	78.875
9.077	78.854
9.846	84.977
10.923	90.328
12.000	96.445
12.769	107.939
14.000	111.752
14.923	114.803
16.000	120.153
17.231	121.664
18.000	128.555
19.077	128.534
19.846	130.054
20.923	139.241
21.846	140.757
22.923	143.806
23.538	149.932
24.923	166.785
25.538	169.075
26.615	166.753
27.846	181.307
28.462	178.226
29.692	182.039
30.769	185.088
32.154	200.406
33.231	201.153
33.538	205.751
34.615	208.032
35.846	199.568
37.231	217.189
38.308	217.168
39.077	217.921
39.692	215.607
40.923	223.256
42.154	214.025
43.077	232.422
43.538	218.602
44.462	217.050
46.308	233.894
46.923	224.675
47.692	233.868
48.462	226.948
50.000	253.772
50.769	256.827
51.692	234.558
52.615	239.911
53.538	242.963
54.923	258.282
55.692	245.991
56.923	254.407
57.692	245.952
58.615	247.469
59.692	235.939
60.923	249.727
61.692	252.014
62.923	242.783
63.538	240.469
64.769	243.515
65.692	235.824
66.615	235.807
67.846	213.532
68.923	234.228
69.692	208.126
71.077	239.557
71.385	224.206
72.769	204.231
73.692	245.645
74.615	264.042
75.846	227.190
76.923	231.005
77.692	223.318
78.923	200.276
79.846	209.466
80.923	200.238
81.692	193.318
82.615	180.257];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'PettGran1982';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'Body temperature is guessed';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4PWKM'; % Cat of Life
metaData.links.id_ITIS = '174579'; % ITIS
metaData.links.id_EoL = '45518716'; % Ency of Life
metaData.links.id_Wiki = 'Pterodroma_hypoleuca'; % Wikipedia
metaData.links.id_ADW = 'Pterodroma_hypoleuca'; % ADW
metaData.links.id_Taxo = '51538'; % Taxonomicon
metaData.links.id_WoRMS = '343976'; % WoRMS
metaData.links.id_avibase = 'C69447E20ECD6C61'; % avibase
metaData.links.id_birdlife = 'bonin-petrel-pterodroma-hypoleuca'; % birdlife
metaData.links.id_AnAge = 'Pterodroma_hypoleuca'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterodroma_hypoleuca}}';
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
bibkey = 'PettGran1982'; type = 'Book'; bib = [ ... 
'author = {Pettit, T. N. and G. S. Grant and G. C. Whittow}, ' ... 
'year = {1982}, ' ...
'title = {Body temperature and growth of {B}onin Petrel chicks}, ' ...
'journal = {Wilson Bull} , ' ... 
'volume = {94}, ' ...
'pages = {358-361}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pterodroma_hypoleuca}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

