function [data, auxData, metaData, txtData, weights] = mydata_Tetraogallus_himalayensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Tetraogallus_himalayensis'; 
metaData.species_en = 'Himalayan snowcock'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THp'};
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
metaData.date_mod_1     = [2023 06 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data

data.ab = 30;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Chri2020';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 3;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on time to reach full time';
data.tR = 365;          units.tR = 'd';    label.tR = 'time since birth at first reproduction'; bibkey.tR = 'guess';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5.2*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 77.3; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';          bibkey.Ww0 = 'avibase';
data.Wwb = 47.9;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Chri2020';
data.Wwi = 2326;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 2529;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 12/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Chri2020';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8-12 eggs per clutch, 1 clutch per yr; Captive females can lay 120-150 eggs per year';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0   47.9
    7   66.7
   31   391
   66   970
   94  1262];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Chri2020';
comment.tW = 'temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 3 * weights.ab;
weights.Ww0 = 0 * weights.Ww0;

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
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '55QX3'; % Cat of Life
metaData.links.id_ITIS = '175953'; % ITIS
metaData.links.id_EoL = '45510639'; % Ency of Life
metaData.links.id_Wiki = 'Tetraogallus_himalayensis'; % Wikipedia
metaData.links.id_ADW = 'Tetraogallus_himalayensis'; % ADW
metaData.links.id_Taxo = '53088'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'AC2DD69D25CC9211'; % avibase
metaData.links.id_birdlife = 'himalayan-snowcock-tetraogallus-himalayensis'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tetraogallus_himalayensis}}';
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
bibkey = 'Chri2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.himsno.01}, ' ...
'author = {Christensen, G. C.}, ' ...
'year = {2020}, ' ...
'title = {Himalayan Snowcock (\emph{Tetraogallus himalayensis}), version 1.0. In Birds of the World (S. M. Billerman, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}, ' ... 
'howpublished = {\url{https://birdsoftheworld.org/bow/species/himsno/cur/breeding}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=AC2DD69D25CC9211&sec=lifehistory}}';
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

