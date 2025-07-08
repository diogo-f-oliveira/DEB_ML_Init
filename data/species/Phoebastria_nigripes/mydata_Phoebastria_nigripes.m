function [data, auxData, metaData, txtData, weights] = mydata_Phoebastria_nigripes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Diomedeidae';
metaData.species    = 'Phoebastria_nigripes'; 
metaData.species_en = 'Black-footed albatross'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC', 'ME'};
metaData.ecoCode.ecozone = {'MP','MS','MN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCic', 'biCik', 'biCit', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2022 08 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 65;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 140; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 420; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 42.1*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 286; units.Ww0 = 'g';    label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 182.5; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnAge';
data.Wwi = 2.99e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'avibase';
  comment.Wwi = 'adult mass 2.6–4.3 kg';
data.Wwim = 3.4e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
7.050	523.077
7.499	536.264
7.994	597.802
8.440	580.220
8.980	641.758
9.515	593.406
10.050	531.868
10.411	610.989
10.995	663.736
11.491	742.857
11.979	650.549
12.515	610.989
12.961	575.824
13.453	575.824
13.988	523.077
14.525	536.264
14.982	725.275
15.568	821.978
16.242	892.308
16.427	1019.780
16.966	1068.132
17.408	949.450
18.435	896.703
18.981	1094.506
19.471	1037.363
20.455	1010.989
20.900	953.846
21.548	1437.363
21.944	1279.121
22.522	1200.000
23.011	1129.671
23.459	1138.462
24.081	1032.967
24.632	1349.451
25.174	1446.154
25.631	1670.330
26.025	1459.341
26.560	1419.780
27.093	1336.264
27.545	1437.363
28.175	1512.088
28.572	1380.220
29.239	1287.912
29.602	1389.011
30.187	1450.550
30.542	1393.407
31.211	1349.451
31.642	1969.231
32.131	1894.506
32.575	1815.385
33.063	1723.077
33.551	1621.978
34.089	1643.956
34.577	1534.066
35.109	1437.363
35.641	1323.077
36.046	1358.242
36.622	1226.373
37.079	1437.363
37.566	1336.264
38.004	1120.879
38.703	1727.473];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'DaleKeny1962';
  
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: v is reduced; Ww0 ignorned due to inconsistency with Wwb';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4GK9M'; % Cat of Life
metaData.links.id_ITIS = '554379'; % ITIS
metaData.links.id_EoL = '45511266'; % Ency of Life
metaData.links.id_Wiki = 'Phoebastria_nigripes'; % Wikipedia
metaData.links.id_ADW = 'Phoebastria_nigripes'; % ADW
metaData.links.id_Taxo = '523234'; % Taxonomicon
metaData.links.id_WoRMS = '344106'; % WoRMS
metaData.links.id_avibase = 'EE8ECB1D8652F088'; % avibase
metaData.links.id_birdlife = 'black-footed-albatross-phoebastria-nigripes'; % birdlife
metaData.links.id_AnAge = 'Phoebastria_nigripes'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoebastria_nigripes}}';
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
bibkey = 'DaleKeny1962'; type = 'Article'; bib = [ ... 
'author = {Dale W. Rice and Karl W. Kenyon}, ' ... 
'year = {1962}, ' ...
'title = {BREEDING CYCLES AND BEHAVIOR OF LAYSAN AND BLACK-FOOTED ALBATROSSES}, ' ...
'journal = {The Auk}, ' ...
'volume = {79}, ' ...
'pages = {517-576}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=EE8ECB1D8652F088&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Phoebastria_nigripes}}';
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

