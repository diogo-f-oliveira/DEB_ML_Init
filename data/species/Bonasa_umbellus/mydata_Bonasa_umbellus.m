function [data, auxData, metaData, txtData, weights] = mydata_Bonasa_umbellus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Bonasa_umbellus'; 
metaData.species_en = 'Ruffed grouse'; 

metaData.ecoCode.climate = {'BSk','Csa','Dsa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 13];              
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

data.ab = 24;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'RushDest2020';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '23-24 d';
data.tx = 10;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'RushDest2020';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'young remain with mother until 12-15 wk';
data.tp = 17*7;          units.tp = 'd';    label.tp = 'time since birth at fledging'; bibkey.tp = 'RushDest2020';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'at 17 wk, young behave like adults';
data.tR = 365;          units.tR = 'd';    label.tR = 'time since birth at first reproduction'; bibkey.tR = 'guess';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 18; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';          bibkey.Ww0 = 'avibase';
data.Wwb = 12;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Chri2020';
data.Wwi = 472;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 585;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 11.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'RushDest2020';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9-14 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0   11  12
   95  470 525];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'RushDest2020'; treat.tW = {1, {'females','males'}};
comment.tW = 'temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
 weights.ab = 3 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'MH5Q'; % Cat of Life
metaData.links.id_ITIS = '175790'; % ITIS
metaData.links.id_EoL = '45510621'; % Ency of Life
metaData.links.id_Wiki = 'Bonasa_umbellus'; % Wikipedia
metaData.links.id_ADW = 'Bonasa_umbellus'; % ADW
metaData.links.id_Taxo = '52964'; % Taxonomicon
metaData.links.id_WoRMS = '1508554'; % WoRMS
metaData.links.id_avibase = '6D2B5CDA60316986'; % avibase
metaData.links.id_birdlife = 'ruffed-grouse-bonasa-umbellus'; % birdlife
metaData.links.id_AnAge = 'Bonasa_umbellus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bonasa_umbellus}}';
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
bibkey = 'RushDest2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.rufgro.01}, ' ...
'author = {Rusch, D. H. and S. Destefano and M. C. Reynolds and D. Lauten}, ' ...
'year = {2020}, ' ...
'title = {Ruffed Grouse (\emph{Bonasa umbellus}), version 1.0. In Birds of the World (A. F. Poole and F. B. Gill, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}, ' ... 
'howpublished = {\url{https://birdsoftheworld.org/bow/species/rufgro/cur/breeding}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=6D2B5CDA60316986&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Bonasa_umbellus}}';
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

