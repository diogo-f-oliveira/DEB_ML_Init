function [data, auxData, metaData, txtData, weights] = mydata_Coeligena_torquata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Coeligena_torquata';
metaData.species_en = 'Collared inca'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body Temperature 
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 18];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data;
data.ab = 18;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'HoyoZuch2020';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'egg temperature'; 
data.tx = 23;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'BaldLond2016'; 
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx  = 'mean value taken from several measurements';  
data.tp = 69;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess'; 
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp  = 'mean value taken from several measurements';  
data.tR = 365;   units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Aboutanimals';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';  
  comment.tR = 'value for Archilochus_alexandri';
data.am = 3960;  units.am = 'd';   label.am = 'life span';                     bibkey.am = 'guess'; 
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.33; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'BaldLond2016';
  comment.Wwb = 'egg weight 0.75 g';
data.Wwi = 8.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'BaldLond2016';   

data.Ri  = 1.5/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'BaldLond2016';   
temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [...
0.026	0.614
1.015	0.741
2.026	0.966
3.014	1.125
3.983	1.545
4.996	2.159
5.968	3.229
6.010	3.001
6.978	3.226
9.003	4.292
10.045	6.013
11.055	6.042
13.042	8.149
14.070	7.528
15.016	7.785
16.004	7.879
16.973	8.332
18.045	7.678
19.039	8.748
20.019	7.379
21.072	7.245
22.037	7.079];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BaldLond2016';

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
D1 = 'mod_1: v is reduced; variable food availability in tW data';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Body temperature drops at night';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WQTN'; % Cat of Life
metaData.links.id_ITIS = '555227'; % ITIS
metaData.links.id_EoL = '45512372'; % Ency of Life
metaData.links.id_Wiki = 'Coeligena_torquata'; % Wikipedia
metaData.links.id_ADW = 'Coeligena_torquata'; % ADW
metaData.links.id_Taxo = '54984'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'EEC0213C766906AE'; % avibase
metaData.links.id_birdlife = 'collared-inca-coeligena-torquata'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coeligena_torquata}},'...
'note = {Accessed : 2017-03-20}'];
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
bibkey = 'BaldLond2016'; type = 'Article'; bib = [ ... 
'doi = {10.1676/1559-4491-128.3.606}, ' ...
'author = {J. W. Baldwin and G. A. Londo\~{n}o}, ' ... 
'year = {2016}, ' ...
'title = {First nesting account and breeding biology of Gould''s Inca (\emph{Coeligena torquata omissa}) in {M}anu {N}ational {P}ark, {P}eru}, ' ...
'journal = {The Wilson Journal of Ornithology}, ' ...
'volume = {128}, ' ...
'number = {3}, '...
'pages = {606-618}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aboutanimals'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2017}, ' ...
'howpublished = {\url{https://www.aboutanimals.com/bird/black-chinned-hummingbird/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vlec1981'; type = 'Article'; bib = [ ... 
'author = {C. M. Vleck}, ' ... 
'year = {1981}, ' ...
'title = {Hummingbird Incubation: Female Attentiveness Egg Temperature}, ' ...
'journal = {Oecologia}, ' ...
'volume = {51}, ' ...
'number = {Issue 2}, '...
'pages = {199--205}'];
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
%
%
bibkey = 'HoyoZuch2020'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {del Hoyo, J. and T. Z{\"u}chner and N. Collar and E. de Juana and P. F. D. Boesman and G. M. Kirwan }, ' ...
'year = {2020}, ' ...
'title  = {Collared Inca \emph{Coeligena torquata}), version 2.1.}, ' ...
'booktitle = {Birds of the World }, ' ...
'publisher = {Cornell Lab of Ornithology}, ' ...
'address = {Ithaca, NY, USA}, ' ...
'doi = {10.2173/bow.colinc1.02.1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
