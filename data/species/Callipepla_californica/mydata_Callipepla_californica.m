function [data, auxData, metaData, txtData, weights] = mydata_Callipepla_californica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Odontophoridae';
metaData.species    = 'Callipepla_californica'; 
metaData.species_en = 'California quail'; 

metaData.ecoCode.climate = {'BWh', 'Cs'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.9); % K, body temp SwanWain1997
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data

data.ab = 22;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(37.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 10;    units.tx = 'd';    label.tx = 'time since birth at fledge'; bibkey.tx = 'avibase';
  temp.tx = C2K(38.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'CalkGee2020';
  temp.tp = C2K(38.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on young being fully independent';
data.tR = 274;    units.tR = 'd';    label.tR = 'time since birth at first breeding'; bibkey.tR = 'AnAge';
  temp.tR = C2K(38.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9.6 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Colinus virginianus';
 
data.Ww0 = 10;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 7.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Lewi1963';
data.Wwi = 1385;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 14/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = {'AnAge','avibase'};   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12-16 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [... time since birth (d), wet weight (g)
0.538	8.048
4.638	7.276
10.307	16.057
14.435	24.090
16.737	22.320
17.517	25.587
20.362	33.122
29.924	56.478
40.512	80.082
50.077	104.193
60.133	121.760
70.178	135.806
80.209	145.576
90.741	151.318
100.245	156.561
111.281	159.785
120.518	162.010];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Lewi1963';

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
D1 = 'Food density initially varies';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'PSBS'; % Cat of Life
metaData.links.id_ITIS = '175876'; % ITIS
metaData.links.id_EoL = '45508969'; % Ency of Life
metaData.links.id_Wiki = 'Callipepla_californica'; % Wikipedia
metaData.links.id_ADW = 'Callipepla_californica'; % ADW
metaData.links.id_Taxo = '69955'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'F93AC929F265F3EF'; % avibase
metaData.links.id_birdlife = 'california-quail-callipepla-californica'; % birdlife
metaData.links.id_AnAge = 'Callipepla_californica'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Callipepla_californica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=F93AC929F265F3EF&sec=lifehistory}}';
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
bibkey = 'Lewi1963'; type = 'article'; bib = [ ... 
'author = {Victor Lewin}, ' ... 
'year = {1963}, ' ...
'title = {Reproduction and Development of Young in a Population of {C}alifornia Quail}, '...
'journal = {The Condor}, ' ...
'volume = {65(4)}, ' ...
'pages = {249-278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Callipepla_californica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CalkGee2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.ostric2.01}, ' ...
'author = {Calkins, J. D. and J. M. Gee and J. C. Hagelin and D. F. Lott}, ' ...
'year = {2020}, ' ...
'title = {California Quail (\emph{Callipepla californica})}, ' ...
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

