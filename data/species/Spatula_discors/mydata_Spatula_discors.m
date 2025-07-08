function [data, auxData, metaData, txtData, weights] = mydata_Spatula_discors
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Spatula_discors'; 
metaData.species_en = 'Blue-winged teal'; 

metaData.ecoCode.climate = {'B','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'biFp', 'biFm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
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

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 24.1;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 63;     units.tx = 'd';    label.tx = 'time since birth at fledging';    bibkey.tx = 'avibase';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 189;     units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23.2 * 365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 29; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';                 bibkey.Ww0 = 'avibase';
data.Wwb = 18.3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'avibase';
data.Wwi = 395; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'avibase';
data.Wwim = 478; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
 temp.Ri = metaData.T_typical;    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '6-15 eggs per clutch, 1 clutch per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
    0  18.5
    7  89
   14 126
   21 221
   28 277
   35 319
   42 315];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RohwJohn2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;

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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'DGNG'; % Cat of Life
metaData.links.id_ITIS = '175086'; % ITIS
metaData.links.id_EoL = '56951290'; % Ency of Life
metaData.links.id_Wiki = 'Spatula_discors'; % Wikipedia
metaData.links.id_ADW = 'Anas_discors'; % ADW
metaData.links.id_Taxo = '52147'; % Taxonomicon
metaData.links.id_WoRMS = '1469482'; % WoRMS
metaData.links.id_avibase = '90E2543E9A4ABA0A'; % avibase
metaData.links.id_birdlife = 'blue-winged-teal-spatula-discors'; % birdlife
metaData.links.id_AnAge = 'Anas_discors'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spatula_discors}}';
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
bibkey = 'RohwJohn2020'; type = 'misc'; bib = [ ... 
'doi = {10.2173/bow.buwtea.01}, ' ...
'author = {Rohwer, F. C. and W. P. Johnson and E. R. Loos}, ' ... 
'year = {2020}, ' ...
'title = {Blue-winged Teal (\emph{Spatula discors}), version 1.0. In Birds of the World (A. F. Poole and F. B. Gill, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anas_discors}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=90E2543E9A4ABA0A&sec=lifehistory}}';
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

