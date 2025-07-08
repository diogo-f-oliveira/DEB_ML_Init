function [data, auxData, metaData, txtData, weights] = mydata_Chionis_albus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Chionidae';
metaData.species    = 'Chionis_albus'; 
metaData.species_en = 'Snowy sheathbill'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAS', 'MPSE'};
metaData.ecoCode.habitat = {'0iMm', 'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCi', 'biSi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 11 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 28];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care';
data.tx = 55;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 165;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on other Larus species';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Based on other Larus species in AnAge';

data.Ww0 = 45;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';   bibkey.Ww0 = 'avibase';
data.Wwb = 32; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 838; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 735; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'WillCoop1984';

data.Ri  = 2.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.4 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0.000	 31.654
 1.073	 36.485
 2.299	 42.121
 3.181	 49.399
 4.859	 64.771
 6.274	 78.529
 7.689	 92.287
 9.101	104.419
10.092	124.700
10.884	130.355
12.226	152.246
13.109	160.337
13.906	168.431
15.337	191.944
16.252	217.920
17.306	224.377
18.480	249.527
19.807	263.289
20.523	274.639
21.772	293.283
23.035	320.055
23.907	321.642
25.126	322.401
26.077	319.919
27.112	314.995
28.262	326.325
29.203	318.153
30.350	327.858
31.157	292.049
32.183	282.247
33.474	324.466
34.505	317.916
35.654	328.434
36.477	351.974
37.783	353.542
38.845	414.470
39.897	419.301
40.941	420.067
42.166	474.484
43.238	491.509
44.334	521.541
45.267	508.491
46.525	532.012
47.515	551.480
48.606	579.074
49.491	538.383
50.922	561.084
51.801	617.142
52.726	599.214
54.113	596.713
54.954	580.415
56.061	567.358
57.278	567.303
58.225	562.383
59.152	545.268
60.148	518.394
61.093	511.848
62.414	521.545];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Jone1963';
  
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
D1 = 'Feeding is slightly reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '5XTCZ'; % Cat of Life
metaData.links.id_ITIS = '824031'; % ITIS
metaData.links.id_EoL = '45513945'; % Ency of Life
metaData.links.id_Wiki = 'Chionis_albus'; % Wikipedia
metaData.links.id_ADW = 'Chionis_albus'; % ADW
metaData.links.id_Taxo = '1122804'; % Taxonomicon
metaData.links.id_WoRMS = '225754'; % WoRMS
metaData.links.id_avibase = '62AC9C19E209962D'; % avibase
metaData.links.id_birdlife = 'snowy-sheathbill-chionis-albus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chionis_albus}}';
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
bibkey = 'Jone1963'; type = 'Article'; bib = [ ... 
'author = {Jones, N. V.}, ' ... 
'year = {1963}, ' ...
'title = {The sheathbill, \emph{Chionis alba}, at {S}igny {I}sland, {S}outh {O}rkney {I}slands}, ' ...
'journal = {British Antarctic Survey Bulletin}, ' ...
'volume = {2}, ' ...
'pages = {53-71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=62AC9C19E209962D&sec=lifehistory}}';
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

