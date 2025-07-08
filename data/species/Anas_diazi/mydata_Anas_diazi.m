function [data, auxData, metaData, txtData, weights] = mydata_Anas_diazi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anas_diazi'; 
metaData.species_en = 'Mexican duck'; 

metaData.ecoCode.climate = {'B'};
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

data.ab = 28;   units.ab = 'd';      label.ab = 'age at birth';                    bibkey.ab = 'DrilWill2020';   
  temp.ab = C2K(34);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; comment.ab = '23-30';
data.tx = 52;   units.tx = 'd';      label.tx = 'time since birth at fledging';   bibkey.tx = 'DrilWill2020';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 156;   units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';  label.tR = 'time since birth at 1st brood';   bibkey.tR = 'avibase';
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 21.3 * 365;  units.am = 'd'; label.am = 'life span';                       bibkey.am = 'avibase';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 43; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';                 bibkey.Ww0 = 'avibase';
data.Wwb = 31.8;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'DrilWill2020';
comment.Ww0 = '27.2-40.6, correlates with egg size';
data.Wwi = 1200; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'DrilWill2020';
comment.Wwi = 'weight of pre laying female which is the heaviest. Mass of individuals varies widely throughout year, depending on stage of annual cycle ';
data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'avibase';   
 temp.Ri = metaData.T_typical;    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = '10 eggs per clutch, 1 clutch per jr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
    1  31.8 31.8
    7  66  71.7
   14 148 196.8
   21 288 379.4
   28 388 571.9
   35 453 742.1
   42 683 871.2];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DrilWill2020'; treat.tW = {1, {'stud 1','study 2'}};

%% set weights for all real data
weights = setweights(data, []);
weights.Ww0 = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '5FL57'; % Cat of Life
metaData.links.id_ITIS = '714703'; % ITIS
metaData.links.id_EoL = '45510559'; % Ency of Life
metaData.links.id_Wiki = 'Anas_diazi'; % Wikipedia
metaData.links.id_ADW = 'Anas_platyrhynchos_diazi'; % ADW
metaData.links.id_Taxo = '52163'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '42CF45FEA3D6D52F'; % Avibase
metaData.links.id_birdlife = 'mallard-anas-platyrhynchos'; % Birdlife
metaData.links.id_AnAge = 'Anas_platyrhynchos_diazi'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mareca_americana}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anas_platyrhynchos_diazi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=42CF45FEA3D6D52F&sec=lifehistory}}';
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
bibkey = 'DrilWill2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.mexduc.01}, ' ...
'author = {Drilling, N. and S. O. Williams III and R. D. Titman and and F. McKinney}, ' ...
'year = {2020}, ' ...
'title = {Mexican Duck (\emph{Anas diazi})}, ' ...
'howpublished = {version 1.0. In Birds of the World (P. G. Rodewald and B. K. Keeney, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

