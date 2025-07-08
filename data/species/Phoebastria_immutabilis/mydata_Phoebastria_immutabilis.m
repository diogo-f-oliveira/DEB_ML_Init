function [data, auxData, metaData, txtData, weights] = mydata_Phoebastria_immutabilis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Diomedeidae';
metaData.species    = 'Phoebastria_immutabilis'; 
metaData.species_en = 'Laysan albatross'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPN'};
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

data.ab = 64;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx =65; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 195; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 8.6*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 70*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 288; units.Ww0 = 'g';    label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 167.2; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnAge';
data.Wwi = 2.75e3; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  comment.Wwi = 'adult mass 1.9 to 3.6 kg';
data.Wwim = 3.25e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';
  comment.Wwi = '2.4 to 4.1 kg';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.103	175.226
0.507	153.564
0.949	172.070
1.464	157.772
2.015	216.488
2.456	234.994
2.971	217.046
3.560	231.988
4.075	283.384
4.553	338.408
5.141	375.248
5.435	448.412
6.097	423.251
6.575	470.976
7.016	551.525
7.494	577.352
8.009	570.353
8.598	603.543
9.076	691.414
9.517	808.460
10.069	779.585
10.436	852.792
11.062	842.209
11.429	926.365
11.981	915.738
12.532	897.812
13.047	876.215
13.636	825.463
13.930	734.394
14.408	636.133
14.960	603.609
15.511	1074.734
16.063	804.983
16.504	699.401
16.982	623.038
17.497	1039.397
18.049	849.938
18.453	747.985
18.968	682.592
19.409	1193.798
19.961	1022.588
20.549	898.844
21.064	775.057
21.542	1045.409
21.947	1432.506
22.572	1407.324
23.197	1123.017
23.601	948.071
23.969	820.549
24.521	1419.411
25.072	1288.346
25.403	1113.357
25.918	1000.519
26.470	1471.644
27.021	1344.229
27.573	1176.668
27.941	1023.598
28.492	1593.263
28.970	1403.761
29.522	1290.944
30.000	1024.800
30.478	955.736
31.103	1342.963
31.581	1146.162];
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
D2 = 'Data Ww0 is ignored due to inconsistency with Wwb';
D3 = 'mod_1: v is reduced';
D4 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4GK9K'; % Cat of Life
metaData.links.id_ITIS = '554378'; % ITIS
metaData.links.id_EoL = '45511265'; % Ency of Life
metaData.links.id_Wiki = 'Phoebastria_immutabilis'; % Wikipedia
metaData.links.id_ADW = 'Phoebastria_immutabilis'; % ADW
metaData.links.id_Taxo = '523232'; % Taxonomicon
metaData.links.id_WoRMS = '344104'; % WoRMS
metaData.links.id_avibase = '98FB6D4B93E4E0BC'; % avibase
metaData.links.id_birdlife = 'laysan-albatross-phoebastria-immutabilis'; % birdlife
metaData.links.id_AnAge = 'Phoebastria_immutabilis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoebastria_immutabilis}}';
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
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=98FB6D4B93E4E0BC&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Phoebastria_immutabilis}}';
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

