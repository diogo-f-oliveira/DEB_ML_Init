function [data, auxData, metaData, txtData, weights] = mydata_Tetrao_urogallus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Tetrao_urogallus'; 
metaData.species_en = 'Western capercaillie'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                 
metaData.date_subm = [2022 08 16];                            
metaData.email     = {'bas.kooijman@vu.nl'};                  
metaData.address   = {'VU University of Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 22];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data;
data.ab = 25;      units.ab = 'd';    label.ab = 'age at birth';                          bibkey.ab = 'avibase';  
  temp.ab = C2K(35); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 7;       units.tx = 'd';    label.tx = 'time since birth at fledging';          bibkey.tx = 'guess';  
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2.5*30.5;       units.tp = 'd';    label.tp = 'time since birth at puberty';          bibkey.tp = 'guess';  
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2.5*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';         bibkey.tR = 'avibase'; 
  temp.tR = C2K(41);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18*365;     units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';                   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 37;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                    bibkey.Wwb = 'MiloLind1989'; 
data.Wwi = 1985;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'avibase';   
data.Wwim = 4240;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'avibase';   

data.Ri  = 8/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-12 eggs per clutch, probably 1 clutch per yr';
 
% uni-variate data
%  time-weight
data.tW_f = [ ... % time (d), weight (g)
1.442	36.619
4.709	37.065
6.884	46.474
8.875	64.969
10.684	87.996
12.132	101.861
16.828	184.507
19.722	221.349
24.776	322.268
26.398	363.492
26.427	258.712
28.396	359.209
32.715	491.918
36.694	542.576
40.309	597.740
44.994	721.387
49.515	781.230
53.843	882.049
56.888	1032.807
63.697	1352.644
67.932	1129.989
74.937	1399.739
80.183	1459.681
88.519	1506.379
93.213	1598.136];
units.tW_f = {'d', 'g'};     label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f = C2K(41); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MiloLind1989';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), weight (g)
1.439	45.730
6.327	91.956
7.955	110.402
9.044	110.551
9.947	128.897
10.666	151.775
12.659	165.714
12.666	138.381
18.260	257.596
20.433	276.116
20.591	362.698
23.467	463.319
23.851	385.923
27.467	436.531
32.675	642.254
38.113	665.776
43.651	989.996
49.831	954.394
56.598	1429.123
64.352	1612.415
69.556	1831.805
78.038	2006.085
84.235	1911.260
103.076	2701.990];
units.tW_m = {'d', 'g'};     label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m = C2K(41); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MiloLind1989';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Food intake is reduced just after hatch';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '55QS7'; % Cat of Life
metaData.links.id_ITIS = '553893'; % ITIS
metaData.links.id_EoL = '45515932'; % Ency of Life
metaData.links.id_Wiki = 'Tetrao_urogallus'; % Wikipedia
metaData.links.id_ADW = 'Tetrao_urogallus'; % ADW
metaData.links.id_Taxo = '52959'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'C3221EE24B948F50'; % avibase
metaData.links.id_birdlife = 'western-capercaillie-tetrao-urogallus'; % birdlife
metaData.links.id_AnAge = 'Tetrao_urogallus'; % AnAge


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tetrao_urogallus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiloLind1989'; type = 'Article'; bib = [ ... 
'author = {Markku Milonoff and Harto Lind\''{e}n}, ' ... 
'year = {1989}, ' ...
'title = {Sexual Size Dimorphism of Body Components in Capercaillie Chicks}, ' ...
'journal = {Ornis Scandinavica (Scandinavian Journal of Ornithology)}, ' ...
'volume = {20(1)}, ' ...
'pages = {29-35}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tetrao_urogallus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C3221EE24B948F50&sec=lifehistory}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Tetrao_urogallus/}}'; 
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

