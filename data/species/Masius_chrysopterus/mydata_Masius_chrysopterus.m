function [data, auxData, metaData, txtData, weights] = mydata_Masius_chrysopterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Pipridae';
metaData.species    = 'Masius_chrysopterus'; 
metaData.species_en = 'Golden-winged manakin'; 

metaData.ecoCode.climate = {'Af','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SalaLand2022';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on other Chiroxiphia species';
data.tx = 16;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SalaLand2022';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on other Chiroxiphia species';
data.tp = 48;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on other Chiroxiphia species';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.73;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'SalaLand2022';
data.Wwb = 1.4;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SalaLand2022';
data.Wwi = 11.74;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 10.4;   units.Wwim = 'g';    label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'avibase';   

data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	1.669
0.001	2.001
0.002	1.402
0.003	1.549
0.004	1.456
1.000	1.604
1.001	2.003
1.002	1.817
2.000	3.522
2.001	2.923
2.002	2.484
3.000	2.645
3.001	2.485
3.002	4.774
3.003	2.978
4.000	4.097
4.001	4.031
4.002	3.818
4.003	3.898
4.004	3.552
5.000	5.589
5.001	4.578
5.002	4.112
5.003	5.204
6.000	5.591
7.000	6.830
7.001	6.538
7.002	6.232
7.003	6.045
7.004	5.486
9.000	8.351
9.001	6.967
9.002	6.953
9.003	7.592
10.000	6.423
10.001	6.822
11.000	8.886
11.001	8.154
12.000	7.544
12.001	7.464
12.002	8.529
12.003	8.622
13.000	8.184
13.001	8.317
14.000	8.306
14.001	7.574
14.002	8.572
14.003	8.452
15.000	8.800
16.000	7.990
16.001	7.764];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'SalaLand2022'; 

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
D1 = 'Body temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only'; 
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3YBLV'; % Cat of Life
metaData.links.id_ITIS = '560999'; % ITIS
metaData.links.id_EoL = '45513314'; % Ency of Life
metaData.links.id_Wiki = 'Masius_chrysopterus'; % Wikipedia
metaData.links.id_ADW = 'Masius_chrysopterus'; % ADW
metaData.links.id_Taxo = '80049'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '2F4691A7D07CDCF8'; % avibase
metaData.links.id_birdlife = 'golden-winged-manakin-masius-chrysopterus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chiroxiphia_boliviana}}';
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
bibkey = 'SalaLand2022'; type = 'Article'; bib = [ ... 
'author = {Jhan C. Salazar and Gustavo A. Londo\~{n}o}, ' ... 
'year = {2022}, ' ...
'title = {NESTING BIOLOGY OF THE GOLDEN-WINGED MANAKIN (\emph{Masius chrysopterus}), WITH A REVIEW OF NESTING TRAITS FOR LOWLAND AND HIGHLAND SPECIES OF {P}IPRIDAE}, ' ...
'journal = {Ornothologia Neotropical}, ' ...
'volume = {33}, ' ...
'pages = {58-65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=2F4691A7D07CDCF8&sec=lifehistory}}';
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

