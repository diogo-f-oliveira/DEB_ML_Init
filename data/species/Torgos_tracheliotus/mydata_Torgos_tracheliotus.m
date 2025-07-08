function [data, auxData, metaData, txtData, weights] = mydata_Torgos_tracheliotus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Torgos_tracheliotus'; 
metaData.species_en = 'Lappet-faced vulture'; 

metaData.ecoCode.climate = {'BWh','BSh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTg', '0iTht'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 55;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '54-56 d';
data.tx = 129;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature'; 
  comment.tx = '124-135 d';
data.tp = 387;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '124-135 d';
data.tR = 6*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 240;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';           bibkey.Ww0 = 'NewtNewt1996';
  comment.Ww0 = '220-260 g';
data.Wwb = 180;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NewtNewt1996';
  comment.Wwb = 'based on tW data';
data.Wwi = 13600; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
  comment.Wwi = '10.5–13.6 kg';
data.Wwim = 9200; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';
  comment.Wwim = '6.5–9.2 kg';

data.Ri  = 1.25/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 or 2 eggs per clutch, 1 clutch per 1 or 2 yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.484	237.124
1.173	90.870
1.831	273.226
3.524	217.943
4.525	345.428
5.868	418.042
6.224	217.122
9.412	416.963
10.757	471.321
11.066	781.572
12.104	507.422
12.423	708.136
12.905	963.567
13.551	1273.716
15.251	1145.410
16.419	1291.099
18.613	1290.431
18.932	1491.146
19.969	1235.252
21.925	1964.880
22.125	1636.219
23.257	2165.286
23.334	1343.762
24.733	2621.227
25.269	2310.719
25.306	1909.085
26.905	2857.889
27.146	2091.081
27.161	1926.776
29.116	2674.660
29.142	2400.819
29.391	1542.731
30.946	2966.193
31.479	2673.941
31.801	2838.143
31.950	3057.165
35.434	3695.050
35.905	4078.274
35.971	3366.286
36.730	4278.834
36.778	3767.664
38.755	4278.218
38.769	4132.169
39.077	4442.420
42.179	3766.020
42.807	4258.730
43.793	4550.519
44.681	4075.604
45.400	5408.042
45.864	4056.988
47.253	5443.990
47.618	5151.789
49.001	4804.513
49.930	5698.753
50.830	5096.045
50.888	4475.338
51.526	4876.766
52.692	5040.712
54.721	5003.583
55.542	5240.656
55.934	6463.661
57.900	5294.706
60.735	5658.954
61.438	5366.651
62.776	5494.033
62.904	5932.129
63.907	4234.054
64.704	6534.015
65.452	7556.099
66.644	5638.901
67.911	6533.039
70.736	8795.871
72.761	7006.208
75.492	6676.777
75.801	6987.028
78.014	4978.240
78.458	7442.609
80.414	6383.190
83.653	7842.651
86.239	7257.685
86.291	6710.002
87.366	7841.521
87.429	7166.045
88.164	8334.179
90.461	7238.145
91.403	7986.337
92.195	6744.717
94.051	6744.152
94.296	7729.879
96.299	7966.592
98.481	6304.671
100.372	7728.030
101.264	7216.603
103.452	7288.960
108.539	7031.834
110.532	7378.083
112.464	6574.250
113.868	7796.946
114.427	7230.853
127.997	6514.757
129.075	7609.764
129.523	6441.270];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'NewtNewt1996';
  
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
D1 = 'Body temperature guessed';
D2 = 'Relative food intake reduced just before fledging';     
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '57FN8'; % Cat of Life
metaData.links.id_ITIS = '563501'; % ITIS
metaData.links.id_EoL = '47188984'; % Ency of Life
metaData.links.id_Wiki = 'Torgos_tracheliotus'; % Wikipedia
metaData.links.id_ADW = 'Torgos_tracheliotus'; % ADW
metaData.links.id_Taxo = '52453'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B559AAD829F8C5F6'; % avibase
metaData.links.id_birdlife = 'lappet-faced-vulture-torgos-tracheliotos'; % birdlife
metaData.links.id_AnAge = 'Torgos_tracheliotus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Torgos_tracheliotus}}';
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
bibkey = 'ChamMsim2013'; type = 'Article'; bib = [ ...
'doi = {10.4236/oje.2013.36049}, ' ...
'author = {Chansa Chomba and Eneya M''simuko and Vincent Nyirenda}, ' ... 
'year = {2013}, ' ...
'title = {Patterns of nest placement of lappet faced vulture (\emph{Torgos tracheliotos}) in {L}ochinvar {N}ational {P}ark, {K}afue {F}lats, {Z}ambia}, ' ...
'journal = {Open Journal of Ecology}, ' ...
'volume = {3(6)}, ' ...
'pages = {431-437}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NewtNewt1996'; type = 'Article'; bib = [ ...
'author = {Stephen F. Newton and Anne V. Newton}, ' ... 
'year = {1996}, ' ...
'title = {Breeding biology and seasonal abundance of Lappet-faced Vultures \emph{Torgos tracheliotus} in western {S}audi {A}rabia}, ' ...
'journal = {Ibis}, ' ...
'volume = {138}, ' ...
'pages = {675-683}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Torgos_tracheliotus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=B559AAD829F8C5F6&sec=lifehistory}}';
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

