function [data, auxData, metaData, txtData, weights] = mydata_Pterocles_alchata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pterocliformes'; 
metaData.family     = 'Pteroclidae';
metaData.species    = 'Pterocles_alchata'; 
metaData.species_en = 'Pin-tailed sandgrouse'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'Csa'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 09 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 25];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Cram1985';   
  temp.ab = C2K(38.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from the Black-bellied Sandgrouse (Pterocles orientalis) (AourZnar2008';
data.tx = 30;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Cram1985';   
  temp.tx = C2K(41.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from from the Spotted Sandgrouse (Pterocles senegallus) MardGavr1986';
data.tp = 90;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Cram1985';
  temp.tR = C2K(41.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9654;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(41.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'from Eurasian Collared Dove (Streptopelia decaocto)';
data.Li  = 35;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'SnowPerr1998';

data.Wwb = 13.8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'LloyDurr2000';
data.Wwi = 309.75; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'SnowPerr1998';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'Cram1985','SnowPerr1998'};   
temp.Ri = C2K(41.4);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % weight^1/3 (g^1/3) at age (d)
1 2.39861030657984;
3 2.64954305637382;
6 3.07760481688751;
8 3.28038563778295;
10 3.54101410506912;
12 3.92679337090018;
14 4.04633616728323;
16 4.13692600112491;
17 4.25487330257935;
18 4.38385959777322;
19 4.4068076436561;
20 4.492993210868;
21 4.56178164708342;
22 4.64127937372563;
23 4.60258204125794;
24 4.7816720048438;
26 4.87251023422878;
28 5.0599451112899;
30 5.16427684597681;
31 5.23212362895904;
36 5.36590312727356;
42 5.65143931796053;
53 5.98142402972088];
data.tW(:,2) = data.tW(:,2).^3; % conver weight^1/3 to weight
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LloyDurr2000';
  
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
D1 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4PW4T'; % Cat of Life
metaData.links.id_ITIS = '177045'; % ITIS
metaData.links.id_EoL = '45513970'; % Ency of Life
metaData.links.id_Wiki = 'Pterocles_alchata'; % Wikipedia
metaData.links.id_ADW = 'Pterocles_alchata'; % ADW
metaData.links.id_Taxo = '53935'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '493C4CF8D0200AB4'; % avibase
metaData.links.id_birdlife = 'pin-tailed-sandgrouse-pterocles-alchata'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterocles_alchata}}';
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
bibkey = 'AourZnar2008'; type = 'Article'; bib = [ ... 
'author = {Aourir, M. and Znari, M. and El Abbassi, A. and Radi, M. and Melin, J-M.}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive Parameters in Captive Hand-Reared Black-Bellied Sandgrouse.}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {27}, ' ...
'pages = {269--281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cram1985'; type = 'Book'; bib = [ ... 
'author = {Cramp, S.}, ' ... 
'year = {1985}, ' ...
'title = {Terns to Woodpeckers}, ' ...
'series = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {IV}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MagaCost2009'; type = 'Article'; bib = [ ... 
'author = {de Magalh\`{a}es, J. P. and Costa, J.}, ' ... 
'year = {2009}, ' ...
'title = {A database of vertebrate longevity records and their relation to other life-history traits}, ' ...
'journal = {Journal of Evolutionary Biology}, ' ...
'volume = {22}, ' ...
'pages = {1770--1774}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LloyDurr2000'; type = 'Article'; bib = [ ... 
'author = {Lloyd, P. and Durrans, L. and Gous, R. and Little, R. M. and Crowe, T. M.}, ' ... 
'year = {2000}, ' ...
'title = {The diet and nutrition of the Namaqua sandgrouse, and arid-zone granivore}, ' ...
'journal = {Journal of Arid Environments}, ' ...
'volume = {44}, ' ...
'pages = {105--122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MardGavr1986'; type = 'Article'; bib = [ ... 
'author = {Marder, J. and Gavrieli-Levin, I. and Raber, P.}, ' ... 
'year = {1986}, ' ...
'title = {Cutaneous evaporation in heat-stressed Spotted Sandgrouse}, ' ...
'journal = {The Condor}, ' ...
'volume = {88}, ' ...
'pages = {99--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition.}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
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

