function [data, auxData, metaData, txtData, weights] = mydata_Alectoris_rufa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Alectoris_rufa'; 
metaData.species_en = 'Red-legged partridge'; 

metaData.ecoCode.climate = {'BSk','Csa','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww';'t-JX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data

data.ab = 24;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'McGoKirw2020';   
  temp.ab = C2K(34);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '23-25 d';
data.tx = 3;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'guess';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 12*7;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'assuming it is grown at about 12 weeks';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 6.2*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 16;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'McGoKirw2020';
  comment.Ww0 = '12-19 g';
data.Wwb = 13.9;         units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GonzDiaz2016';
data.Wwi = 430;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'McGoKirw2020';
  comment.Wwi = '391–540 g';
data.Wwim = 520;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'McGoKirw2020';   
  comment.Wwim = '480–547 g';

data.Ri  = 1.5*11.5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'McGoKirw2020';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '11.5 eggs pers clutch, 1.5 clutches per yr'; 
  
% uni-variate data
% time-weight-feeding rate
data.tWJX = [ ... % time since birth (wk), wet weight (g), feeding rate (g/d)
    3  97.1 10.5
    4 136.9 14.3
    5 178.5 17.6
    6 208.7 18.4];
data.tWJX(:,1) = 7 * data.tWJX(:,1); % convert wk to d
units.tWJX   = {'d', 'g', 'g/d'};  label.tWJX = {'time since birth', 'wet weight', 'feeding rate'};  
temp.tWJX    = C2K(40.7);  units.temp.tWJX = 'K'; label.temp.tWJX = 'temperature';
bibkey.tWJX  = 'LachAgui2013'; treat.tWJX = {1,{'weight','food intake'}};
comment.tWJX = 'food is assumed to be dry';

%% set weights for all real data
weights = setweights(data, []);
weights.tWJX = weights.tWJX * 0.1;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Ww0 = 0 * weights.Ww0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Ww0 data ignored dur to inconsistency with Ww0 and tW data';     
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'BLSJ'; % Cat of Life
metaData.links.id_ITIS = '175913'; % ITIS
metaData.links.id_EoL = '45513761'; % Ency of Life
metaData.links.id_Wiki = 'Alectoris_rufa'; % Wikipedia
metaData.links.id_ADW = 'Alectoris_rufa'; % ADW
metaData.links.id_Taxo = '53022'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'F71E0BE60C5B3C98'; % avibase
metaData.links.id_birdlife = 'red-legged-partridge-alectoris-rufa'; % birdlife
metaData.links.id_AnAge = 'Alectoris_rufa'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alectoris_rufa}}';
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
bibkey = 'McGoKirw2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.relpar1.01}, ' ...
'author = {McGowan, P. J. K. and G. M. Kirwan and P. F. D. Boesman}, ' ... 
'year = {2020}, ' ...
'title = {Red-legged Partridge (\emph{Alectoris rufa}), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Alectoris_rufa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LachAgui2013'; type = 'incollection'; bib = [ ...  
'doi = {10.3920/978-90-8686-781-3_52}, ' ...
'title = {Metabolic use of a growing diet for red-legged partridge (\emph{Alectoris rufa}) chicks}, ' ...
'year = {2013}, ' ...
'author = {Lachica, M. and Aguilera, J.F. and Nieto, R. and Fernández-Fígares, I.}, ' ...
'booktitle = {Energy and protein metabolism and nutrition in sustainable animal production}, ' ...
'editor = {Oltjen, J.W. and Kebreab, E. and Lapierre, H.}, ' ...
'publisher = {Wageningen Academic Publishers, Wageningen}, ' ...
'volume = {134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GonzDiaz2016'; type = 'article'; bib = [ ...  
'doi = {10.1590/1516-635x1801057-61}, ' ...
'title = {Comparison of Three Temperatures for the Hatching Phase in the Artificial Incubation of Red-legged Partridge (\emph{Alectoris rufa}) Eggs}, ' ...
'journal = {Revista Brasileira de Ci\^{e}ncia Avícola}, ' ...
'year = {2016}, ' ...
'author = {P. Gonz\''{e}lez-Redondo and R D\''{i}az-Merino}, ' ...
'volume = {18(1)}, ' ...
'pages = {57-62}'];
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

