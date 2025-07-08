function [data, auxData, metaData, txtData, weights] = mydata_Indicator_minor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Piciformes'; 
metaData.family     = 'Indicatoridae';
metaData.species    = 'Indicator_minor'; 
metaData.species_en = 'Lesser honeyguide'; 

metaData.ecoCode.climate = {'Aw','BSh','BWh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tnwo'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.8); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 14;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ShorHorn2022';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-16 d'; 
data.tx = 38;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ShorHorn2022';   
  temp.tx = C2K(41.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 114;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 354;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.8);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4.9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 4.0;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'guess';
data.Wwb = 2.9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'McCl2020';
data.Wwi = 27; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'ShorHorn2022';
data.Wwim = 30; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';    bibkey.Wwim = 'ShorHorn2022';

data.Ri  = 20/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ShorHorn2022';   
  temp.Ri = C2K(41.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20 eggs per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	2.886
2.305	6.838
4.288	10.598
6.595	14.936
8.659	19.080
10.723	22.936
13.353	27.949
15.418	31.420
18.292	35.184
21.086	38.467
23.880	41.461
26.473	43.300
29.228	44.564
31.902	44.961
35.348	43.824
38.470	41.723
41.836	38.374];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'McCl2020'; 
comment.tW = 'Data digitized from drawn curve';

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Bood parasite for barbets, kingfishers, and other cavity-nesters';
metaData.bibkey.F1 = 'ShorHorn2022'; 
F2 = 'Neonate has hooks on bill to kill brood-mates';
metaData.bibkey.F2 = 'ShorHorn2022'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3PLPJ'; % Cat of Life
metaData.links.id_ITIS = '553934'; % ITIS
metaData.links.id_EoL = '45514143'; % Ency of Life
metaData.links.id_Wiki = 'Indicator_minor'; % Wikipedia
metaData.links.id_ADW = 'Indicator_minor'; % ADW
metaData.links.id_Taxo = '55535'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '50F3668CF1F8A515'; % avibase
metaData.links.id_birdlife = 'lesser-honeyguide-indicator-minor'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Indicator_minor}}';
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
bibkey = 'McCl2020'; type = 'phdthesis'; bib = [ ... 
'howpublished = {\url{https://open.uct.ac.za/bitstream/handle/11427/32856/thesis_sci_2020_mcclean%%20luke%%20alexander.pdf?sequence=1}}, ' ...
'author = {Luke Alexander McClean}, ' ... 
'year = {2020}, ' ...
'title = {Coevolution between brood-parasitic honeyguides and their hosts}, ' ...
'school = {Department of Biological Sciences, Faculty of Science, University of Cape Town}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=50F3668CF1F8A515&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShorHorn2022'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.y00400.01}, ' ...
'author = {Short, L.L. and J. F. M. Horne  and G. M. Kirwan and N. Moura and P. F. D. Boesman}, ' ...
'year = {2022}, ' ...
'title = {Lesser Honeyguide (\emph{Indicator minor}), version 1.0. In Birds of the World (B. K. Keeney and S. M. Billerman, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}}'];
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

