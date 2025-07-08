function [data, auxData, metaData, txtData, weights] = mydata_Phaethon_lepturus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Phaethontiformes'; 
metaData.family     = 'Phaethontidae';
metaData.species    = 'Phaethon_lepturus'; 
metaData.species_en = 'White-tailed tropicbird'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
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

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 41;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LealSera2016';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 71;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'LealSera2016';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp from P. rubricauda';
data.tp = 213;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp from P. rubricauda';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 11936; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MagaCost2009';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'data from P. rubricauda';
  
data.Wwb = 35;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LealSera2016';
data.Wwi = 410;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LealSera2016';

data.Ri = 1/305; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(40.9);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'One clutch of 1 one per clutch each 10 month';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d) at  (d)
2.382	46.598
7.529	58.870
12.579	81.117
17.535	137.731
22.395	226.495
27.541	272.026
32.402	368.550
37.548	384.147
42.503	366.482
47.363	392.053
52.510	404.324
57.274	419.915
62.516	405.580
67.471	370.177
72.236	400.181];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LealSera2016';
  
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
metaData.links.id_CoL = '777D9'; % Cat of Life
metaData.links.id_ITIS = '1000288'; % ITIS
metaData.links.id_EoL = '45509042'; % Ency of Life
metaData.links.id_Wiki = 'Phaethon_lepturus'; % Wikipedia
metaData.links.id_ADW = 'Phaethon_lepturus'; % ADW
metaData.links.id_Taxo = '51638'; % Taxonomicon
metaData.links.id_WoRMS = '212594'; % WoRMS
metaData.links.id_avibase = '1D07B501FEAF0840'; % avibase
metaData.links.id_birdlife = 'white-tailed-tropicbird-phaethon-lepturus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phaethon_lepturus}}';
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
bibkey = 'LealSera2016'; type = 'Article'; bib = [ ... 
'author = {G. R. Leal and P. P. Serafini and I. Sim\~{a}o-Neto and R. J. Ladle and M. A. Efe}, ' ... 
'year = {2016}, ' ...
'title = {Breeding of White-tailed Tropicbirds (\emph{Phaethon lepturus}) in the western {S}outh {A}tlantic}, ' ...
'journal = {Braz. J. Biol.}, ' ...
'volume = {76}, ' ...
'pages = {559-567}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/white-tailed-tropicbird/Phaethon-lepturus/}}';
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
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

