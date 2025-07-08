function [data, auxData, metaData, txtData, weights] = mydata_Certhia_familiaris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Certhiidae';
metaData.species    = 'Certhia_familiaris'; 
metaData.species_en = 'Eurasian treecreeper'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb','Dfc','Dwa','Dwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 15;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Polioptila caerulea of avibase';
data.tx = 11.5;       units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Polioptila caerulea of avibase';
data.tp = 34.5;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Polioptila caerulea of avibase';
data.tR = 365;      units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Polioptila caerulea of AnAge';

data.Ww0 = 1.74;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';       bibkey.Ww0 = 'GariLond2013';
data.Wwb = 1.55;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GariLond2013';
  comment.Wwb = 'based on tW data';
data.Wwi = 9.1;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'AnAge';

data.Ri  = 2*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'GariLond2013';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch, assumed: 1,2 clutches per yr as for Polioptila caerulea';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0 1
    7 7.0
    8 7.5
    9 7.8
   10 8.2
   12 9.0
   15 9.5
   17 9.0
   18 8.8];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GariLond2013';

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

%% Links
metaData.links.id_CoL = '5XN9F'; % Cat of Life
metaData.links.id_ITIS = '178795'; % ITIS
metaData.links.id_EoL = '45513691'; % Ency of Life
metaData.links.id_Wiki = 'Certhia_familiaris'; % Wikipedia
metaData.links.id_ADW = 'Certhia_familiaris'; % ADW
metaData.links.id_Taxo = '4733905'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '73BE9A87F6A32D6A'; % avibase
metaData.links.id_birdlife = 'eurasian-treecreeper-certhia-familiaris'; % birdlife
metaData.links.id_AnAge = 'Certhia_familiaris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Certhia_familiaris}}';
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
bibkey = 'Scho1983'; type = 'Article'; bib = [ ... 
'author = {Manfred Sch\"{o}nfeld}, ' ... 
'year = {1983}, ' ...
'title = {Beitr\"{e}ge zur "{O}kologie und zum intraspezifischen Verhalten der Bauml\"{a}ufer \emph{Certhia familiaris} und \emph{C. brachydactyla} in {E}ichen-{H}ainbuchen-Lindenw\"{a}ldern unter dem Aspekt der erh\"{o}hten Siedlungsdichte durch eingebrachte Nisth\"{o}hlen}, ' ...
'journal = {Hercynia N.F.}, ' ...
'volume = {20(3)}, ' ...
'pages = {290-311}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Certhia_familiaris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=0AA192503B97A59F&sec=lifehistory}}';
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

