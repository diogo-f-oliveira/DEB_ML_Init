function [data, auxData, metaData, txtData, weights] = mydata_Oreortyx_pictus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Odontophoridae';
metaData.species    = 'Oreortyx_pictus'; 
metaData.species_en = 'Mountain quail'; 

metaData.ecoCode.climate = {'BWh','Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 21];

%% set data
% zero-variate data

data.ab = 23;        units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'avibase';   
  temp.ab = C2K(37);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '21-24 d';
data.tx = 14;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;          units.tp = 'd';    label.tp = 'time since birth at fledging'; bibkey.tp = 'GutiDele2020';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Colinus_virginianus; GutiDele2020 states sexually mature as yearling';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';                  bibkey.am = 'guess';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 10.41;   units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 8.5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'GutiDele2020';
data.Wwi = 231.85;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'avibase';
data.Wwim = 239.85; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'avibase';

data.Ri  = 11/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'avibase';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-15 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0   8.5
   40 100];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GutiDele2020';

%% set weights for all real data
weights = setweights(data, []);

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
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '7569D'; % Cat of Life
metaData.links.id_ITIS = '175893'; % ITIS
metaData.links.id_EoL = '45508965'; % Ency of Life
metaData.links.id_Wiki = 'Oreortyx_pictus'; % Wikipedia
metaData.links.id_ADW = 'Oreortyx_pictus'; % ADW
metaData.links.id_Taxo = '105556'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '171E91FFA209EB46'; % avibase
metaData.links.id_birdlife = 'mountain-quail-oreortyx-pictus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ortalis_vetula}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=171E91FFA209EB46&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GutiDele2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.mouqua.01}, ' ...
'author = {Guti\''{e}rrez, R. J. and D. J. Delehanty}, ' ...
'year = {2020}, ' ...
'title = {Mountain Quail (\emph{Oreortyx pictus})}, ' ...
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

