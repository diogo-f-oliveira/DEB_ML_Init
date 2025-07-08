function [data, auxData, metaData, txtData, weights] = mydata_Opisthocomus_hoazin

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Opisthocomiformes'; 
metaData.family     = 'Opisthocomidae';
metaData.species    = 'Opisthocomus_hoazin'; 
metaData.species_en = 'Hoatzin'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxHlf', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 32;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature from the Greater Roadrunner (Geococcyx californianus), KuehGood1990';
data.tx = 17.5;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(41.3);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from GodoLey2008';
data.tp = 200;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from GodoLey2008';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'ADW';
  temp.tR = C2K(41.3);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10950;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ALR';   
  temp.am = C2K(41.3);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 66;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ALR';

data.Wwb = 20.9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Mull2004';
data.Wwi = 750;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
temp.Ri = C2K(41.3);     units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % weight^1/3 (g^1/3) at age (d)
0 2.79220753290021;
1 2.99572039363353;
3 3.36197540679896;
5 3.59499145220399;
8 3.50339806038672;
9 4.54807587733265;
10 4.42581769927096;
11 4.57763365811799;
12 4.76615706854841]; 
data.tW(:,2) = data.tW(:,2).^3; % convert weight^1/3 to weight
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mull2004';
  
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
F1 = 'Smells like cows due to digestion of leaves';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6T376'; % Cat of Life
metaData.links.id_ITIS = '176146'; % ITIS
metaData.links.id_EoL = '45512185'; % Ency of Life
metaData.links.id_Wiki = 'Opisthocomus_hoazin'; % Wikipedia
metaData.links.id_ADW = 'Opisthocomus_hoazin'; % ADW
metaData.links.id_Taxo = '54479'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '7E83A1B3DC1F8644'; % avibase
metaData.links.id_birdlife = 'hoatzin-opisthocomus-hoazin'; % birdlife
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Opisthocomus_hoazin}}';
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
bibkey = 'GodoLey2008'; type = 'Article'; bib = [ ... 
'author = {Godoy-Vitorino, F. and Ley, R.E. and Gao, Z. and Pei, Z. and Ortiz-Zuazaga, H. and Pericchi, L.R. and Garcia-Amado, M. A. and Michelangeli, F. and Blaser, M. J. and Gordon, J. I. and Dom\''{i}nguez-Bello, M. G.}, ' ... 
'year = {2008}, ' ...
'title = {Bacterial Community in the Crop of the Hoatzin, a Neotropical Folivorous Flying Bird.}, ' ...
'journal = {Applied and Environmental Microbiology}, ' ...
'volume = {74}, ' ...
'number = {19}, '...
'pages = {5905--5912}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuehGood1990'; type = 'Article'; bib = [ ... 
'author = {Kuehler, C. and Good, J.}, ' ... 
'year = {1990}, ' ...
'title = {Artificial incubation of bird eggs at the Zoological Society of San Diego}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {29}, ' ...
'pages = {118--136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mull2004'; type = 'Techreport'; bib = [ ... 
'author = {Mullner, A.}, ' ... 
'year = {2004}, ' ...
'title = {Breeding Ecology and Related Life-History Traits of the Hoatzin, \emph{Opisthocomus hoazin}, in a Primary Rainforest Habitat}, ' ...
'institution = {Bayerischen Julius-Maximilians-Universitat}, ' ...
'address = {Wurzburg}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ALR'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animals.jrank.org/pages/582/Hoatzin-Opisthocomiformes.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Opisthocomus_hoazin/}}';
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

