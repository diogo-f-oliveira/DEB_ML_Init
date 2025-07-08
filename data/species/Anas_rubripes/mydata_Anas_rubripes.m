function [data, auxData, metaData, txtData, weights] = mydata_Anas_rubripes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anas_rubripes'; 
metaData.species_en = 'American black duck'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'biFp', 'biFm', 'biMm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 10 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 26.5;   units.ab = 'd';      label.ab = 'age at birth';                    bibkey.ab = 'avibase';   
  temp.ab = C2K(37.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 55.5;   units.tx = 'd';      label.tx = 'time since birth at fledging';   bibkey.tx = 'avibase';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 166.5;   units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';  label.tR = 'time since birth at 1st brood';   bibkey.tR = 'avibase';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 21.3 * 365;  units.am = 'd'; label.am = 'life span';                       bibkey.am = 'avibase';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 63; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';               bibkey.Ww0 = 'avibase';
data.Wwb = 32;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'avibase';
data.Wwi = 1111; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 1252; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'avibase';   
 temp.Ri = metaData.T_typical;    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '9 eggs per clutch, 1 clutch per jr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1.146	25.201
7.734	57.582
14.609	200.374
21.627	346.411
28.501	518.329
35.519	725.854
41.964	820.078
48.552	907.837];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical; units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Rein1979'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = 0;

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
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'Ww0 data is ignored due to inconsistency with tW data';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = 'DGPC'; % Cat of Life
metaData.links.id_ITIS = '175068'; % ITIS
metaData.links.id_EoL = '45510558'; % Ency of Life
metaData.links.id_Wiki = 'Anas_rubripes'; % Wikipedia
metaData.links.id_ADW = 'Anas_rubripes'; % ADW
metaData.links.id_Taxo = '52173'; % Taxonomicon
metaData.links.id_WoRMS = '159170'; % WoRMS
metaData.links.id_avibase = 'C732CB106EE8BAE8'; % Avibase
metaData.links.id_birdlife = 'american-black-duck-anas-rubripes'; % Birdlife
metaData.links.id_AnAge = 'Anas_rubripes'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anas_rubripes}}';
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
bibkey = 'Rein1979'; type = 'Article'; bib = [ ... 
'author = {Kenneth J. Reineck}, ' ... 
'year = {1979}, ' ...
'title = {FEEDING ECOLOGY AND DEVELOPMENT OF JUVENILE BLACK DUCKS IN {M}AINE}, ' ...
'journal = {The Auk}, ' ...
'volume = {96}, ' ...
'pages = {737-745}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anas_rubripes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=C732CB106EE8BAE8&sec=lifehistory}}';
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

