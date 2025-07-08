function [data, auxData, metaData, txtData, weights] = mydata_Clangula_hyemalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Clangula_hyemalis'; 
metaData.species_en = 'Long-tailed duck'; 

metaData.ecoCode.climate = {'Dfc','ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'biFp', 'biFm', 'xiMc'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 25;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AnAge';   
  temp.ab = C2K(34); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 35;      units.tx = 'd';     label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;      units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 22.7*365;  units.am = 'd';   label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 43;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';   bibkey.Ww0 = 'avibase';
data.Wwb = 27.75;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'avibase';
data.Wwi = 636;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight female';  bibkey.Wwi = 'avibase';
data.Wwim = 661;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';  bibkey.Wwim = 'avibase';

data.Ri  = 7.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 4-11 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), percent of length of mother (percent)
1.378	38.254
5.160	47.937
8.173	55.556
11.122	62.698
13.141	65.238
15.064	72.857
18.974	83.968];
data.tW(:,2) =  636 * (0.01 * data.tW(:,2)).^3; % convert fraction of length to weight
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'PehrNyst1988';
comment.tW = 'Data converted from fraction of length of mother to weight, using mother weight of 636 g for chick CYN 1974';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
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
D2 = 'Ww0 data was ignorned due to inconsistency with Wwb and tW data';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5YVVD'; % Cat of Life
metaData.links.id_ITIS = '175147'; % ITIS
metaData.links.id_EoL = '45510598'; % Ency of Life
metaData.links.id_Wiki = 'Clangula_hyemalis'; % Wikipedia
metaData.links.id_ADW = 'Clangula_hyemalis'; % ADW
metaData.links.id_Taxo = '52265'; % Taxonomicon
metaData.links.id_WoRMS = '137071'; % WoRMS
metaData.links.id_avibase = 'AF0C7BDEC7CEBAAC'; % avibase
metaData.links.id_birdlife = 'long-tailed-duck-clangula-hyemalis'; % birdlife
metaData.links.id_AnAge = 'Clangula_hyemalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Clangula_hyemalis}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Clangula_hyemalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PehrNyst1988'; type = 'Article'; bib = [ ...  
'title = {Growth and Movements of Oldsquaw Ducklings in Relation to Food}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'year = {1988}, ' ...
'author = {Olof Pehrsson and K. G. Kenneth Nystr\"{o}m}, ' ...
'volume = {52(2)}, ' ...
'pages = {185-191}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=AF0C7BDEC7CEBAAC&sec=lifehistory}}';
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

