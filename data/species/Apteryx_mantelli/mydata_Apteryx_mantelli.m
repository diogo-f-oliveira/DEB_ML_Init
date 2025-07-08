function [data, auxData, metaData, txtData, weights] = mydata_Apteryx_mantelli

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apterygiformes'; 
metaData.family     = 'Apterygidae';
metaData.species    = 'Apteryx_mantelli'; 
metaData.species_en = 'North Island brown kiwi'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tntm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.17); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};                 
metaData.date_subm = [2012 07 31];                            
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};                  
metaData.address  = {'IST, Portugal'};      

metaData.author_mod_1  = {'Dina Lika'};                      
metaData.date_mod_1    = [2015 07 22];                      
metaData.email_mod_1   = {'lika@biology.uoc.grv'};          
metaData.address_mod_1 = {'University of Crete, 71003 Heraklion, Greece'}; 

metaData.author_mod_2  = {'Bas Kooijman'};                      
metaData.date_mod_2    = [2016 11 23];                      
metaData.email_mod_2   = {'bas.kooijman@vu.nl'};          
metaData.address_mod_2 = {'VU University of Amsterdam'}; 

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 20];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data;
data.ab = 82.5;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = {'McLeMcCa1991'};  
  temp.ab = C2K(31); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Age at birth obtained from average incubation time. Average egg temperature (31 C)';
data.tx = 7;       units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'ARKive';  
  temp.tx = C2K(31); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 21;       units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'HoyoColl2020';  
  temp.tp = C2K(31); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2 yrs for female, 14 mnth for male';
data.tR = 928.01;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = {'BourCast2009','McNa1996'}; 
  temp.tR = C2K(38.17);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'age at first breeding. average body temperature (38.17 C)';
data.am = 18250;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'DOC2012';                   
  temp.am = C2K(38.17); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'captivity';

data.Li  = 79.75;   units.Li  = 'cm';   label.Li  = 'ultimate physical (tail included) length';    bibkey.Li  = 'Mill1997';      
  comment.Li = 'average observed adult length (including the tail)';

data.Wwb = 239.25;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                         bibkey.Wwb = 'PrinzDiet2002'; 
  comment.Wwb = 'average observed weight at hatching';
data.Wwi = 2350;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';                         bibkey.Wwi = 'McLeDew2004';   
  comment.Wwi = 'average observed adult weight (males and females)';

data.Ri  = 6/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';                         bibkey.Ri  = 'ARKive';   
  temp.Ri = C2K(38.17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'ARKive: upto 3 clutches/yr';
 
% uni-variate data
data.tWw = [ ... % time since birth (d), weight^1/3 (g^1/3)
10 6.81128460768908;
50 7.70262461828735;
100 8.70878576945209;
200 10.3039981964427;
300 11.3986045280692;
500 12.5665780923601;
750 13.082317887661;
1000 13.2334550821697];
data.tWw(:,2) = data.tWw(:,2).^3; % undo transformation
units.tWw = {'d', 'g'};     label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(38.17); units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Sale2006';

%% set weights for all real data
weights = setweights(data, []); 
weights.tWw = weights.tWw * 2;
weights.ab = weights.ab * 5;

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
D1 = 'mod_3: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'FYYR'; % Cat of Life
metaData.links.id_ITIS = '696087'; % ITIS
metaData.links.id_EoL = '130161'; % Ency of Life
metaData.links.id_Wiki = 'Apteryx_mantelli'; % Wikipedia
metaData.links.id_ADW = 'Apteryx_australis'; % ADW
metaData.links.id_Taxo = '101419'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'DB55CB8CC8C20EA5'; % avibase
metaData.links.id_birdlife = 'north-island-brown-kiwi-apteryx-mantelli'; % birdlife
metaData.links.id_AnAge = 'Apteryx_australis'; % AnAge

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
'howpublished = {\url{http://en.wikipedia.org/wiki/Apteryx_mantelli}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/North-Island-brown-kiwi/apteryx-mantelli/}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DOC2012'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.doc.govt.nz}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BourCast2009'; type = 'Article'; bib = [ ... 
'author = {Bourdon, E. and Castanet, J. and de Ricqles, A. and  Scofield, P. and Tennyson, A. and Lamrous, H. and Cubo, J.}, ' ... 
'year = {2009}, ' ...
'title = {Bone growth marks reveal protracted growth in {N}ew {Z}ealand kiwi ({A}ves, {A}pterygidae)}, ' ...
'journal = {Biology Letters}, ' ...
'volume = {5}, ' ...
'pages = {639-642}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'McLeDew2004'; type = 'Article'; bib = [ ... 
'author = {McLennan, J.A. and Dew, L. and Miles, J. and Gillingham, N. and Waiwai, R}, ' ... 
'year = {2004}, ' ...
'title = {Size matters: predation risk and juvenile growth in {N}orth {I}sland brown kiwi (\emph{Apteryx mantelli})}, ' ...
'journal = {New Zealand Journal of Ecology}, ' ...
'volume = {28}, ' ...
'pages = {241-250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'McLeMcCa1991'; type = 'Article'; bib = [ ... 
'author = {McLennan, J.A. and McCann, A.J.}, ' ... 
'year = {1991}, ' ...
'title = {Incubation Temperatures of Great Spotted Kiwi, \emph{Apteryx haastii}}, ' ...
'journal = {New Zealand Journal of Ecology}, ' ...
'volume = {5}, ' ...
'pages = {163-166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McNa1996'; type = 'Article'; bib = [ ... 
'author = {McNab, B. K.}, ' ... 
'year = {1996}, ' ...
'title = {Metabolism and Temperature Regulation of Kiwis ({A}pterygidae)}, ' ...
'journal = {The Auk}, ' ...
'volume = {113}, ' ...
'pages = {687-692}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill1997'; type = 'Book'; bib = [ ... 
'author = {Milles, J. R. G.}, ' ... 
'year = {1997}, ' ...
'title = {Northern brown kiwi (\emph{Apteryx australis mantelli}) in Tongariro National Park and Tongariro Forest - ecology and threats}, ' ...
'publisher = {Science for conservation, 51. Department of Conservation, Wellington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinzDiet2002'; type = 'Article'; bib = [ ... 
'author = {Prinzinger, R. and Dietz, V.}, ' ... 
'year = {2002}, ' ...
'title = {Pre- and postnatal energetics of the {N}orth {I}sland brown kiwi (\emph{Apteryx mantelli})}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A}, ' ...
'volume = {131}, ' ...
'pages = {725-732}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sale2006'; type = 'Article'; bib = [ ... 
'author = {Sales, J.}, ' ... 
'year = {2006}, ' ...
'title = {Feeding of the captive Kiwi}, ' ...
'journal = {Zoo''s Print Journal}, ' ...
'volume = {21}, ' ...
'number = {11},',...
'pages = {2454-245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoyoColl2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.nibkiw1.01}, ' ...
'author = {del Hoyo, J. and N. Collar and E. F. J. Garcia and C. J. Sharpe}, ' ...
'year = {2020}, ' ...
'title = {North Island Brown Kiwi (\emph{Apteryx mantelli})}, ' ...
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

