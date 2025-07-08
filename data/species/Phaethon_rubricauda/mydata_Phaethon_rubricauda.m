function [data, auxData, metaData, txtData, weights] = mydata_Phaethon_rubricauda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Phaethontiformes'; 
metaData.family     = 'Phaethontidae';
metaData.species    = 'Phaethon_rubricauda'; 
metaData.species_en = 'Red-tailed tropicbird'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP', 'MI'};
metaData.ecoCode.habitat = {'xiMpe', '0xTd'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
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

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 30];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 45;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'TacuCrai2013';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 79;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ARKive';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 237;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 274;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'TacuCrai2013';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11936; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MagaCost2009';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 54;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TacuCrai2013';
data.Wwi = 840;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ARKive';

data.Ri = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ARKive';   
temp.Ri = C2K(40.9);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % weight^1/3 (g^1/3) at age (d)
0.87671032 4.19561225;
10.09726659 5.82415556;
20.71052631 7.07459281;
30.76988692 8.06734428;
41.07477395 8.80220454;
50.87422804 9.18942654;
60.82127761 9.43870254;
70.6199328 9.77795672;
75.11100946 9.43503049];
data.tW(:,2) = data.tW(:,2).^3; % convert weight^1/3 to weight
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Diam1975';
  
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
%txtData.comment = comment;

%% Discussion points
D1 = 'mod_2: v is reduced';
D2 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4FPZW'; % Cat of Life
metaData.links.id_ITIS = '174679'; % ITIS
metaData.links.id_EoL = '45509041'; % Ency of Life
metaData.links.id_Wiki = 'Phaethon_rubricauda'; % Wikipedia
metaData.links.id_ADW = 'Phaethon_rubricauda'; % ADW
metaData.links.id_Taxo = '51639'; % Taxonomicon
metaData.links.id_WoRMS = '212595'; % WoRMS
metaData.links.id_avibase = 'C412CD623EDA1B28'; % avibase
metaData.links.id_birdlife = 'red-tailed-tropicbird-phaethon-rubricauda'; % birdlife
metaData.links.id_AnAge = 'Phaethon_rubricauda'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phaethon_rubricauda}}';
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
bibkey = 'Diam1975'; type = 'Article'; bib = [ ... 
'author = {Diamond, A. W.}, ' ... 
'year = {1975}, ' ...
'title = {The biology of tropicbirds (\emph{Phaethon spp.}) at {A}ldabra {A}toll, {I}ndian {O}cean}, ' ...
'journal = {Auk, , }, ' ...
'volume = {92}, ' ...
'pages = {16-39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MagaCost2009'; type = 'Article'; bib = [ ... 
'author = {de Magalh\~{a}es, J. P. and Costa, J.}, ' ... 
'year = {2009}, ' ...
'title = {A database of vertebrate longevity records and their relation to other life-history traits}, ' ...
'journal = {Journal of Evolutionary Biology}, ' ...
'volume = {22}, ' ...
'pages = {1770--1774}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoweBart1962'; type = 'Article'; bib = [ ... 
'author = {Howell, T. R. and Bartholomew, G. A.}, ' ... 
'year = {1962}, ' ...
'title = {Temperature regulation in the Red-tailed Tropic Bird and the Red-foorted Booby}, ' ...
'journal = {The Condor}, ' ...
'volume = {64}, ' ...
'number = {1}, '...
'pages = {6--18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MahoJehl1984'; type = 'Article'; bib = [ ... 
'author = {Mahoney, S. A. and Jehl, J. R.}, ' ... 
'year = {1984}, ' ...
'title = {Body water content in marine birds}, ' ...
'journal = {The Condor}, ' ...
'volume = {86}, ' ...
'pages = {208--209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/red-tailed-tropicbird/phaethon-rubricauda/}}';
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

