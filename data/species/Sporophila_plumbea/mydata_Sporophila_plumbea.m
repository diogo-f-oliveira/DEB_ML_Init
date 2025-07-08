function [data, auxData, metaData, txtData, weights] = mydata_Sporophila_plumbea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Thraupidae';
metaData.species    = 'Sporophila_plumbea'; 
metaData.species_en = 'Plumbeous seedeater'; 

metaData.ecoCode.climate = {'A','Cf'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 12];

%% set data
% zero-variate data

data.ab = 13;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Repe2012';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 12;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Repe2012';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 36;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at first brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 1.55;  units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';      bibkey.Ww0 = 'avibase';
data.Wwb = 1.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Repe2012';
data.Wwi = 10.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'Repe2012';

data.Ri  = 3*1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch; 1.5 clutches per yr';

% uni-variate data

% time-weight
data.tW = [ % time since birth (d), wet weight  (g)
0.000	1.506
0.001	1.129
1.000	2.188
1.001	1.953
2.000	2.659
2.001	2.212
2.002	3.129
3.000	3.718
3.001	4.306
3.002	4.518
3.003	3.459
3.004	3.012
3.005	2.847
4.000	5.176
4.001	4.965
4.002	4.682
4.003	4.000
4.004	4.329
5.000	7.318
5.001	6.612
5.002	6.871
5.003	5.882
5.004	5.341
5.005	5.129
5.006	6.259
6.000	8.000
6.001	8.612
6.002	7.341
6.003	7.153
6.004	8.329
6.005	7.624
6.006	6.965
7.000	9.788
7.001	8.565
7.002	7.788
7.003	7.435
7.004	9.035
8.000	9.718
8.001	8.235
8.002	7.976
8.003	9.106
8.004	7.718
8.005	8.659
9.000	8.494
9.001	8.212
9.002	10.612
9.003	9.600
9.004	8.000
9.005	9.318
10.000	8.541
10.001	7.976
10.002	8.847
10.003	9.576
10.004	9.176
10.005	9.835
11.000	9.247
11.001	9.482
11.002	9.882
12.000	10.353
12.001	9.647];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Repe2012';
  
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
D1 = 'Body temperature is lower just after hatching and food density is varying';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4ZD48'; % Cat of Life
metaData.links.id_ITIS = '563097'; % ITIS
metaData.links.id_EoL = '917124'; % Ency of Life
metaData.links.id_Wiki = 'Sporophila_plumbea'; % Wikipedia
metaData.links.id_ADW = 'Sporophila_plumbea'; % ADW
metaData.links.id_Taxo = '86194'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '1AA93871D9935DA6'; % avibase
metaData.links.id_birdlife = 'plumbeous-seedeater-sporophila-plumbea'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sporophila_plumbea}}';
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
bibkey = 'Repe2012'; type = 'phdthesis'; bib = [ ... 
'author = {Marcia Repenning}, ' ... 
'year = {2012}, ' ...
'title = {Natural history, with emphasise on breeding biology, of a migratory population of \emph{Sporophila aff. plumbea} ({A}VES, {E}MBERIZIDAE) from southern {B}razil}, ' ...
'school = {Pontif\''{i}cia Universidade Cat\''{o}lica do Rio Grande do Sul}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=1AA93871D9935DA6&sec=lifehistory}}';
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

