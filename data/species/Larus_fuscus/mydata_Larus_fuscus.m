function [data, auxData, metaData, txtData, weights] = mydata_Larus_fuscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Larus_fuscus'; 
metaData.species_en = 'Lesser black-backed gull'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFe', '0iMm', 'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCi', 'biSi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jaap van der Meer'};    
metaData.date_subm = [2019 01 17];              
metaData.email    = {'jaap.van.der.meer@nioz.nl'};            
metaData.address  = {'NIOZ'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 29;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Camp2013';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care.';
data.tx = 37.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Camp2013';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 112.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1095;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Camp2013';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12714; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Euring';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 55; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Camp2013';

data.Wwb = 55.32; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
data.Wwi = 1065; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Camp2013';

data.Ri  = 0.008219178; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Camp2013';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
tmp = [ ... % wet weight (g)    
69.59  54.55  83.48  85.93  96.62 125.26 137.73 154.98 178.70 206.89 230.66 237.30 281.75 323.45 370.00 330.20 427.56 482.00 432.00 512.78 580.00 578.00 562.00 616.00 684.00 656.00 766.00 750.00 764.00 820.00 758.00]'; 
data.tW = [ ... % time since birth (d), wet weight (g)
(1:31)' tmp];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GuptSant2016';
  
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
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3SBQ9'; % Cat of Life
metaData.links.id_ITIS = '176821'; % ITIS
metaData.links.id_EoL = '45509305'; % Ency of Life
metaData.links.id_Wiki = 'Larus_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Larus_fuscus'; % ADW
metaData.links.id_Taxo = '53805'; % Taxonomicon
metaData.links.id_WoRMS = '137142'; % WoRMS
metaData.links.id_avibase = '49025D8B171EFAD7'; % avibase
metaData.links.id_birdlife = 'lesser-black-backed-gull-larus-fuscus'; % birdlife
metaData.links.id_AnAge = 'Larus_fuscus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Larus_argentatus}}';
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
bibkey = 'GuptSant2016'; type = 'Article'; bib = [ ... 
'author = {Gupta, T. and Santos, C. S. A. and Sotillo, A. and De Neve, L. and Stienen, E. W. M. and M\"{u}ller, W. and Lens, L.}, ' ... 
'year = {2016}, ' ...
'title = {Nutritional stress causes heterogeneous relationships with multi-trait {FA} in lesser black-backed gull chicks: {A}n aviary experiment},' ...
'journal = {Symmetry}, ' ...
'volume = {8}, ' ...
'pages = {133},' ...
'howpublished = {\url{http://doi:10.3390/sym8110133}}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%    
bibkey = 'Euring'; type = 'Misc'; bib = ... 
'howpublished = {\url{https://euring.org/data-and-codes/longevity-list?page=2}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Camp2013'; type = 'Book'; bib = [ ... 
'author = {Camphuysen, C. J.}, ' ... 
'year = {2013}, ' ...
'booktitle = {A historical ecology of two closely releated gull species(Laridae): multiple adaptations to a man-made environment}, ' ...
'publisher = {University of Groningen}, '...
'pages = {1-406}, ' ...
'howpublished = {\url{http://home.planet.nl/~camphuys/home.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles}, ' ...
'editor = {Deeming, D. C. and Fergunson, M. W. J.}, ' ...
'publisher = {Cambridge University Press}, '...
'pages = {345--360}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Larus_argentatus/}}';
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

