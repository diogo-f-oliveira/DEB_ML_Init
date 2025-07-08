function [data, auxData, metaData, txtData, weights] = mydata_Setophaga_discolor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Parulidae';
metaData.species    = 'Setophaga_discolor'; 
metaData.species_en = 'Prairie warbler'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh', '0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 13];

%% set data
% zero-variate data

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 9.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 28.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10.3*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'avibase';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.26; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 1.1;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Rode1986';
data.Wwi = 7.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 7.3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 1.5*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-5 eggs per clutch; 1.5 clutches per yr';

% uni-variate data
% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.046	0.998
0.063	0.913
0.067	1.255
0.068	1.340
0.229	1.284
0.230	1.426
0.350	0.899
0.371	1.170
0.377	1.726
0.391	1.355
0.428	1.441
0.444	1.256
0.465	1.569
0.520	1.698
0.951	1.642
0.966	1.399
1.027	2.055
1.189	2.099
1.352	2.256
1.383	1.728
1.385	1.942
1.405	2.142
1.438	1.843
1.458	2.028
1.491	1.729
1.496	2.228
1.963	2.214
2.003	2.599
2.090	2.343
2.185	2.828
2.186	2.942
2.202	2.728
2.241	3.113
2.331	3.056
2.346	2.771
3.049	3.072
3.051	3.229
3.128	3.743
3.196	3.358
3.217	3.672
3.236	3.771
3.274	3.914
3.320	3.187
3.321	3.315
3.322	3.358
3.326	3.743
4.122	4.344
4.124	4.486
4.125	4.600
4.147	5.014
4.212	4.344
4.250	4.501
4.290	4.943
4.342	4.758
4.345	5.029
4.356	4.344
4.361	4.843
4.413	4.658
4.450	4.758
4.926	5.629
5.037	5.914
5.038	6.014
5.087	5.601
5.139	5.373
5.155	5.202
5.158	5.473
5.164	6.029
5.195	5.615
5.236	6.129
5.320	5.544
5.342	5.929
5.357	5.644
5.376	5.772
5.771	5.716
5.805	5.545
5.829	6.087
5.850	6.429
6.064	6.216
6.138	6.459
6.168	5.903
6.170	6.059
6.175	6.573
6.208	6.231
6.227	6.330
6.296	6.060
6.351	6.231
6.811	7.230
6.826	7.002
6.841	6.717
6.891	6.275
7.100	5.720
7.102	5.905
8.151	6.549
8.278	6.720
8.322	5.694
8.323	5.851
8.329	6.364
8.333	6.834
8.610	5.752
8.614	6.151
8.649	6.037
8.721	6.108
8.754	5.766
8.791	5.909
8.847	6.151
8.851	6.522
8.862	5.852
8.864	5.980
9.139	6.508
9.140	6.680
9.154	6.266
9.155	6.394
9.198	7.050
9.479	6.395
9.557	7.051
9.572	6.752
9.609	6.852
9.657	6.253
9.727	6.082
9.750	6.538
9.751	6.681
9.770	6.781
9.829	5.569
9.833	5.869
9.835	6.068
9.836	6.196
9.839	6.482
9.858	6.567
9.895	6.667
10.001	6.525
10.071	6.382
10.114	7.053
10.128	6.611
11.025	6.499
11.092	6.043
11.131	6.342];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Nola1978'; 
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = 0 * weights.Ww0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Ww0 data is ignored due to inconsistency with Wwb and tW data';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4X3BP'; % Cat of Life
metaData.links.id_ITIS = '950052'; % ITIS
metaData.links.id_EoL = '45511111'; % Ency of Life
metaData.links.id_Wiki = 'Setophaga_discolor'; % Wikipedia
metaData.links.id_ADW = 'Dendroica_discolor'; % ADW
metaData.links.id_Taxo = '5665814'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'E36325FA08B46EEF'; % avibase
metaData.links.id_birdlife = 'prairie-warbler-setophaga-discolor'; % birdlife
metaData.links.id_AnAge = 'Setophaga_discolor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Setophaga_discolor}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Setophaga_discolor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E36325FA08B46EEF&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NolaKett2020'; type = 'misc'; bib = [ ... 
'doi = {10.2173/bow.prawar.01}, ' ...
'author = {Nolan Jr, V. and E. D. Ketterson and C. A. Buerkle}, ' ... 
'year = {2020}, ' ...
'title =  {Prairie Warbler (\emph{Setophaga discolor}), version 1.0. In Birds of the World (A. F. Poole, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nola1978'; type = 'book'; bib = [ ... 
'author = {Nolan, V.}, ' ... 
'year = {1978}, ' ...
'series = {Ornithological Monograph}, ' ...
'volume = {26}, '...
'publisher = {American Ornithologists Union, Washington, DC, USA}, ' ...
'title =  {The ecology and behavior of the Prairie Warbler \emph{Dendroica discolor}}'];
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

