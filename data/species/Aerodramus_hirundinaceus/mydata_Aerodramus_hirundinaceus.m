function [data, auxData, metaData, txtData, weights] = mydata_Aerodramus_hirundinaceus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Apodidae';
metaData.species    = 'Aerodramus_hirundinaceus'; 
metaData.species_en = 'Mountain swiftlet'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 24;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 75;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Tarb2003';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 225;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.1;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Tarb2003';
  comment.Wwb = 'based on tW data';
data.Wwi = 10.1;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 egg per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ...  % weight (g) at age (d)
0.142	1.360
1.137	1.642
1.563	1.162
2.345	1.764
3.197	1.845
3.979	2.046
6.963	3.010
7.247	2.571
7.957	3.092
8.028	2.572
9.023	2.934
9.024	3.894
9.876	3.575
10.231	2.975
10.799	4.056
10.870	3.616
11.155	3.217
11.794	4.338
12.007	3.818
13.002	3.900
13.073	4.980
13.074	4.540
13.996	5.461
14.139	4.341
15.062	5.703
15.702	6.424
16.057	5.944
16.199	6.624
17.052	6.746
17.123	7.226
17.833	5.387
17.975	8.267
19.041	7.269
19.042	5.389
19.893	6.190
20.178	8.630
20.959	8.991
21.030	6.432
21.883	6.193
21.954	10.273
22.025	7.593
23.233	6.235
24.014	7.036
24.725	8.757
25.009	7.878
25.933	9.199
26.004	8.559
27.211	10.241
28.845	9.443
28.917	8.883
29.982	8.605
30.124	9.405
30.977	8.406
31.119	9.967
31.261	10.607
32.114	8.248
32.966	10.089
32.967	10.769
33.179	7.570
33.890	9.491
33.961	10.451
34.316	9.931
35.027	9.533
35.028	10.493
35.595	9.813
35.808	9.334
36.092	10.454
36.945	11.695
37.016	12.416
37.158	9.416
38.366	9.938
40.071	10.460
40.072	9.860
40.142	12.580
40.143	10.980
40.639	11.581
41.137	9.582
41.208	10.382
41.563	11.182
41.989	12.823
42.060	12.183
42.274	11.703
42.345	10.984
43.055	11.785
43.056	11.385
43.837	10.626
43.979	9.786
44.050	14.266
44.263	11.346
44.902	10.227
45.187	10.468
45.755	11.309
45.826	10.789
45.897	12.549
45.898	12.229
46.963	11.590
47.176	12.951
48.099	11.512
49.165	12.834
49.876	11.675
50.941	11.236
51.012	10.677
51.865	12.558
53.144	12.560
53.996	11.241
56.057	11.764
67.069	11.861
67.922	10.142
70.053	11.425
70.977	10.346
72.185	10.468
73.037	11.270
74.103	12.751];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Tarb2003';

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
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '64Z4P'; % Cat of Life
metaData.links.id_ITIS = '554952'; % ITIS
metaData.links.id_EoL = '45516385'; % Ency of Life
metaData.links.id_Wiki = 'Aerodramus_hirundinaceus'; % Wikipedia
metaData.links.id_ADW = 'Aerodramus_hirundinaceus'; % ADW
metaData.links.id_Taxo = '72155'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '942DE41C6F8573C0'; % avibase
metaData.links.id_birdlife = 'white-throated-swift-aeronautes-saxatalis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aerodramus_hirundinaceus}}';
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
bibkey = 'Tarb2003'; type = 'Article'; bib = [ ... 
'doi = {10.1071/mu00081}, ', ...
'author = {Tarburton, M. K.}, ' ... 
'year = {2003}, ' ...
'title = {The breeding biology of the Mountain Swiftlet, \emph{Aerodramus hirundinaceus}, in {I}rian {J}aya}, ' ...
'journal = {Emu - Austral Ornithology}, ' ...
'volume = {103(2)}, ' ...
'pages = {177–182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=942DE41C6F8573C0&sec=lifehistory}}';
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

