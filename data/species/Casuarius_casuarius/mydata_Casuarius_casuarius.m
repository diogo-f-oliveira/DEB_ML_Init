function [data, auxData, metaData, txtData, weights] = mydata_Casuarius_casuarius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Casuariiformes'; 
metaData.family     = 'Casuariidae';
metaData.species    = 'Casuarius_casuarius'; 
metaData.species_en = 'Southern cassowary'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.17); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                 
metaData.date_subm = [2018 08 12];                            
metaData.email     = {'bas.kooijman@vu.nl'};                  
metaData.address   = {'VU University of Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data;
data.ab = 50;      units.ab = 'd';    label.ab = 'age at birth';                        bibkey.ab = 'EoL';  
  temp.ab = C2K(34); units.temp.ab = 'K'; label.temp.ab = 'temperature'; comment.ab = 'embryo temp taken as an optimal temperature for many birds in the absence of more detailed knowledge. ';
data.tx = 9*30.5;       units.tx = 'd';    label.tx = 'time since birth at fledging';   bibkey.tx = 'EoL';  
  temp.tx = C2K(38.17); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 16*30.5;       units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'ADW';  
  temp.tp = C2K(38.17); units.temp.tp = 'K'; label.temp.tp = 'temperature'; comment.tp = 'guess based on 16 mo range time till independance';
data.tR = 3*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';    bibkey.tR = 'EoL'; 
  temp.tR = C2K(38.17);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';                        bibkey.am = 'AnAge';                   
  temp.am = C2K(38.17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 413;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                 bibkey.Wwb = 'Reid1987'; 
  comment.Wwb = 'Rome1997: 402 till 499 g';
data.Wwi = 58.5e3;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';   
  comment.Wwi = 'max 85 kg';
data.Wwim = 31e3;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'AnAge';   
  comment.Wwim = '29 till 34 kg';

data.Ri  = 6/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';              bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(38.17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 till 8 eggs per season';
  
% uni-variate data
data.tW = [ ... % time since birth (d), weight (g)
     0  413
    10  585
    20  910
    30 1410
    40 1940
    50 2530
    60 3430
    70 4160
    80 5020
    90 6000
   102 7260];
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(38.17); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Reid1987';

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
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'RQZ2'; % Cat of Life
metaData.links.id_ITIS = '553788'; % ITIS
metaData.links.id_EoL = '45515896'; % Ency of Life
metaData.links.id_Wiki = 'Casuarius_casuarius'; % Wikipedia
metaData.links.id_ADW = 'Casuarius_casuarius'; % ADW
metaData.links.id_Taxo = '79005'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '8B9D93D84AC854E7'; % avibase
metaData.links.id_birdlife = 'southern-cassowary-casuarius-casuarius'; % birdlife
metaData.links.id_AnAge = 'Casuarius_casuarius'; % AnAge

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
'howpublished = {\url{http://en.wikipedia.org/wiki/Casuarius_casuarius}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Casuarius_bennetti/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Reid1987'; type = 'Article'; bib = [ ... 
'author = {B. Reid}, ' ... 
'year = {1987}, ' ...
'title = {Food intake and growth rate of cassowary chicks \emph{Casuarius spp} reared at {Mendi, southern Highland Papua New Guinea}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {26}, ' ...
'pages = {189--198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Casuarius_casuarius}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1178368/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rome1997'; type = 'techreport'; bib = [ ... 
'author = {L. Romer}, ' ... 
'year = {1997}, ' ...
'title = {Cassowary hunbandry manual}, ' ...
'institution = {Currumbin Sanctuary Conservation Unit}, ' ...
'volume = {26}, ' ...
'howpublished = {\url{http://www.australasianzookeeping.org/Husbandry Manuals/Cassowary Husbandry Manual _ARAZPA.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Heal2022'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.soucas1.02}, ' ...
'author = {Healy, T. P.}, ' ...
'year = {2022}, ' ...
'title = {Southern Cassowary (\emph{Casuarius casuarius})}, ' ...
'howpublished = {version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA.}'];
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

