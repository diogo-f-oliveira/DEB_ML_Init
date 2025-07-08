function [data, auxData, metaData, txtData, weights] = mydata_Synthliboramphus_scrippsi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Synthliboramphus_scrippsi'; 
metaData.species_en = 'Scripps''s murrelet'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 32.5;        units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'avibase';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 2;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 130;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 730;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 37.3;       units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 24.4;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Eppl1984';
data.Wwi = 166.1;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2/365;      units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'DrosLewi2020';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0	24.431
 1	21.723
 2	21.014
 3	22.306
 4	25.026
 5	26.318
 6	28.467
 7	28.615
 8	33.479
 9	37.485
10	39.491
11	43.211
12	43.503
13	44.223
14	40.657
15	40.663
17	59.675
19	61.401
20	67.264
23	76.139
24	76.574];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Eppl1984';
comment.tW = 'Data from lab rearing';

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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Nests are usually at the back of the cave or crevice';
metaData.bibkey.F1 = 'DrosLewi2020'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53YYK'; % Cat of Life
metaData.links.id_ITIS = '177011'; % ITIS
metaData.links.id_EoL = '45509356'; % Ency of Life
metaData.links.id_Wiki = 'Synthliboramphus_scrippsi'; % Wikipedia
metaData.links.id_ADW = 'Synthliboramphus_hypoleucus'; % ADW
metaData.links.id_Taxo = '158910'; % Taxonomicon
metaData.links.id_WoRMS = '1348513'; % WoRMS
metaData.links.id_avibase = '85FE327B1C501F44'; % avibase
metaData.links.id_birdlife = 'scrippss-murrelet-synthliboramphus-scrippsi'; % birdlife
metaData.links.id_AnAge = 'Synthliboramphus_hypoleucus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Synthliboramphus_scrippsi}}';
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
bibkey = 'Eppl1984'; type = 'Article'; bib = [ ...  
'title = {DEVELOPMENT OF THERMOREGULATORY ABILITIES IN {X}ANTUS'' MURRELET CHICKS \emph{Synthliboramphus hypoleucus}}, ' ...
'journal = {Physiol. Zool.}, ' ...
'volume = {57}, ' ...
'number = {3}, ' ...
'pages = {307-317}, ' ...
'year = {1984}, ' ...
'author = {Zoe A. Eppley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Synthliboramphus_scrippsi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=85FE327B1C501F44&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DrosLewi2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.xanmur2.01}, ' ...
'author = {Drost, C. A. and D. B. Lewis}, ' ... 
'year = {2020}, ' ...
'title = {Scripps''s Murrelet (\emph{Synthliboramphus scrippsi}), version 1.0. In Birds of the World (A. F. Poole and F. B. Gill, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
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

