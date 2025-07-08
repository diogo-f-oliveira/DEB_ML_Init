function [data, auxData, metaData, txtData, weights] = mydata_Lagopus_muta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Lagopus_muta'; 
metaData.species_en = 'Rock ptarmigan'; 

metaData.ecoCode.climate = {'Dfc','Dwb','ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTi'};
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

data.ab = 22.2;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'avibase';   
  temp.ab = C2K(34);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '21-24 d';
data.tx = 7;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '10-12 d';
data.tp = 2*30.5;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'adult size achieved in 2-3 months';
data.tR = 365;          units.tR = 'd';    label.tR = 'time since birth at first reproduction'; bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11.7*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 20;    units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 12.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'avibase';
data.Wwi = 510.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 520;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';

data.Ri  = 7/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-16 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.915	16.619
10.715	36.645
13.215	52.398
16.532	75.738
19.348	103.231
21.267	121.174
24.899	166.954
27.738	198.107
30.777	240.148
33.713	294.225
44.089	439.657];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'SteeUnan1985'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.ab = 3 * weights.ab;

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
metaData.links.id_CoL = '3RXRB'; % Cat of Life
metaData.links.id_ITIS = '677542'; % ITIS
metaData.links.id_EoL = '45510636'; % Ency of Life
metaData.links.id_Wiki = 'Lagopus_muta'; % Wikipedia
metaData.links.id_ADW = 'Lagopus_muta'; % ADW
metaData.links.id_Taxo = '842427'; % Taxonomicon
metaData.links.id_WoRMS = '1461451'; % WoRMS
metaData.links.id_avibase = '79B161B7017DD7ED'; % avibase
metaData.links.id_birdlife = 'rock-ptarmigan-lagopus-muta'; % birdlife
metaData.links.id_AnAge = 'Lagopus_muta'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagopus_muta}}';
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
bibkey = 'SteeUnan1985'; type = 'article'; bib = [ ...
'doi = {10.2173/bow.saggro.0}, ' ...
'author = {Johan B. Steen and Sigmund Unander}, ' ...
'year = {1985}, ' ...
'volume = {16(3)}, ' ...
'pages = {191-197}, ' ...
'title = {Breeding Biology of the {S}valbard Rock Ptarmigan \emph{Lagopus mutus hyperboreus}}, ' ... 
'journal = {\url{Ornis Scandinavica (Scandinavian Journal of Ornithology)}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=79B161B7017DD7ED&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lagopus_muta}}';
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

