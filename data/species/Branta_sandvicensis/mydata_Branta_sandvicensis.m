function [data, auxData, metaData, txtData, weights] = mydata_Branta_sandvicensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Branta_sandvicensis'; 
metaData.species_en = 'Nene'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TOh'};
metaData.ecoCode.habitat = {'biFp', 'biFm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 10 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 30;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 63;     units.tx = 'd';    label.tx = 'time since birth at fledging';    bibkey.tx = 'avibase';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 189;     units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.tRm = 2*365;    units.tRm = 'd';    label.tRm = 'time since birth at 1st brood';  bibkey.tRm = 'AnAge';
  temp.tRm = metaData.T_typical;  units.temp.tRm = 'K'; label.temp.tRm = 'temperature';
data.am = 42 * 365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 131; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';                 bibkey.Ww0 = 'avibase';
data.Wwb = 90.8;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'AnAge';
data.Wwi = 1930; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
data.Wwim = 2010; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
 temp.Ri = metaData.T_typical;    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '4 eggs per clutch, 1 clutch per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
0.583	73.797
3.467	69.830
6.499	115.050
7.507	86.407
10.397	168.506
12.269	115.313
13.866	267.025
15.459	357.261
17.904	263.110
20.803	459.964
22.530	410.862
25.140	603.604
27.452	652.889
29.771	821.028
31.905	407.190
33.815	890.884
34.820	825.356
37.289	1067.272
39.882	1022.308
41.909	1124.859
42.886	674.084
43.779	1067.567
47.678	1125.122
48.560	1362.867
51.602	1543.333
52.597	1330.264
54.904	1322.172
56.939	1543.576
61.857	1740.522
62.851	1519.255
63.563	1392.239
65.737	1543.977
67.049	1732.561
69.048	1453.964
71.068	1466.351
74.947	1253.413
75.701	1708.365
76.845	1581.368
77.700	1433.866
87.221	1462.988];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'females'};  
temp.tW_f    = metaData.T_typical;  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BankBlac2020';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
0.007	81.967
2.460	98.473
5.486	61.725
7.507	82.309
8.087	135.614
9.528	115.188
12.709	230.087
13.858	160.467
14.733	287.556
15.889	320.396
17.899	197.536
18.927	443.485
20.933	263.248
21.383	496.875
22.829	558.417
24.687	320.796
26.571	447.931
28.170	611.938
28.909	866.070
29.773	837.421
31.912	509.650
34.683	936.005
35.847	1071.304
36.536	624.615
38.749	1317.338
39.600	1116.557
42.036	887.160
44.935	1088.112
47.836	1313.654
50.733	1494.113
51.749	1572.029
54.626	1469.701
57.082	1531.288
61.569	1744.607
62.857	1613.518
65.894	1716.115
66.487	1945.650
67.616	1601.440
69.068	1740.850
71.084	1683.565
71.673	1855.723
72.951	1577.092
75.573	1933.769
76.981	1466.620
78.310	1888.812
92.272	1496.005
94.460	1836.269];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'males'};  
temp.tW_m    = metaData.T_typical;  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BankBlac2020';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = 'N74G'; % Cat of Life
metaData.links.id_ITIS = '175016'; % ITIS
metaData.links.id_EoL = '45510539'; % Ency of Life
metaData.links.id_Wiki = 'Branta_sandvicensis'; % Wikipedia
metaData.links.id_ADW = 'Branta_sandvicensis'; % ADW
metaData.links.id_Taxo = '52030'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'EDB18078B9A2C905'; % avibase
metaData.links.id_birdlife = 'hawaiian-goose-branta-sandvicensis'; % birdlife
metaData.links.id_AnAge = 'Branta_sandvicensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Branta_sandvicensis}}';
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
bibkey = 'BankBlac2020'; type = 'misc'; bib = [ ... 
'doi = {10.2173/bow.hawgoo.01}, ' ...
'author = {Banko, P. C. and J. M. Black and W. E. Banko}, ' ... 
'year = {2020}, ' ...
'title = {Hawaiian Goose (\emph{Branta sandvicensis}), version 1.0. In Birds of the World (A. F. Poole and F. B. Gill, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Branta_sandvicensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9A60617EE376ABE9&sec=lifehistory}}';
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

