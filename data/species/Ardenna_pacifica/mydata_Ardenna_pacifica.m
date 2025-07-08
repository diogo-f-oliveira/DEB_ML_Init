function [data, auxData, metaData, txtData, weights] = mydata_Ardenna_pacifica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Ardenna_pacifica'; 
metaData.species_en = 'Wedge-tailed shearwater'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2022 08 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 53;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 109; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Wiki: 103 to 115 d';
data.tp = 327; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 103 to 115 d';
data.tR = 4*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 29*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 60; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Ande2020';
data.Wwi = 474.6; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 457; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.547	61.962
1.275	61.982
2.459	75.642
3.188	81.857
4.463	95.520
5.648	98.030
6.467	117.875
7.014	115.412
7.743	121.627
8.563	127.844
9.382	136.539
10.384	146.477
11.477	148.985
12.479	165.119
13.390	176.294
13.846	183.740
14.757	197.393
15.759	203.615
16.305	204.869
17.216	217.283
17.672	227.207
18.309	217.313
18.856	221.044
20.040	233.466
20.678	248.351
21.680	244.661
22.591	265.748
23.228	275.677
24.321	285.618
24.686	286.867
25.506	286.889
26.143	312.924
26.234	301.776
27.418	305.525
27.601	321.637
28.694	340.250
29.422	330.359
31.153	378.724
31.335	363.862
33.430	412.238
33.795	394.903
34.341	414.740
35.252	404.854
35.434	428.398
37.165	430.923
37.712	473.062
38.349	452.018
40.900	483.061
40.901	459.521
41.902	481.849
41.993	454.595
43.997	490.579
44.088	510.404
46.182	495.594
46.183	514.178
46.821	529.063
47.276	511.730
48.187	534.055
48.916	543.987
49.371	519.220
50.100	539.063
52.013	568.850
52.560	540.369
53.106	558.968
54.837	545.387
54.928	563.974
57.570	573.957
57.934	565.294
59.118	547.981
60.211	561.640
61.851	544.339
63.673	561.734
63.764	580.320
65.950	555.601
66.952	570.496
67.043	550.675
68.045	574.242
69.503	563.131
71.324	587.960
72.509	550.824
72.782	564.460
76.881	537.315
77.610	554.680
77.883	543.537
80.980	510.170
81.618	530.010
84.259	535.038
84.533	544.957
86.537	538.817
86.628	515.279
88.449	521.523
89.178	543.844
89.907	515.368
91.547	510.457
91.638	503.026];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Ande2020';
  
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
D2 = 'Males are assumed to differ from females by {p_Am} only';     
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4QFY2'; % Cat of Life
metaData.links.id_ITIS = '174550'; % ITIS
metaData.links.id_EoL = '1047354'; % Ency of Life
metaData.links.id_Wiki = 'Ardenna_pacifica'; % Wikipedia
metaData.links.id_ADW = 'Puffinus_pacificus'; % ADW
metaData.links.id_Taxo = '6506429'; % Taxonomicon
metaData.links.id_WoRMS = '212634'; % WoRMS
metaData.links.id_avibase = 'E94A7272C71031C6'; % Avibase
metaData.links.id_birdlife = 'wedge-tailed-shearwater-ardenna-pacifica'; % Birdlife
metaData.links.id_AnAge = 'Puffinus_pacificus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ardenna_grisea}}';
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
bibkey = 'Ande2020'; type = 'Incollection'; bib = [ ... 
'doi = {10.1002/9781119167792}, ' ...
'author = {Tracy Anderson}, ' ... 
'year = {2020}, ' ...
'title = {Shearwaters and Petrels}, ' ...
'booktitle = {Hand-Rearing Birds}, ' ...
'editor = {Duerr, R. S. and Gage, L. J. }, ' ...
'pages = {237-250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Puffinus_griseus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=E94A7272C71031C6&sec=lifehistory}}';
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

