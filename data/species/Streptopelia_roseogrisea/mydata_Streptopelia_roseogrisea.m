function [data, auxData, metaData, txtData, weights] = mydata_Streptopelia_roseogrisea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Streptopelia_roseogrisea'; 
metaData.species_en = 'African collared dove'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 13.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 35;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Bris1969';   
  temp.tx = C2K(40.63); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 105;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.63); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.63); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.63); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 8.3;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 7;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Robe1988';
data.Wwi = 148;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 165;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 4.5*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.63); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch, guessed: 4.5 clutches per yr';
  
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
 0.502	 11.038
 5.384	 44.898
10.778	 68.465
16.007	 82.009
20.447	 98.262
25.514	 99.887
30.408	107.201
35.923	113.702];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', '1 chick/nest'};  
temp.tW1    = C2K(40.63);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Bris1969';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
 1.458	 11.851
 6.455	 41.106
12.127	 71.445
17.187	 86.885
21.741	100.971
26.523	108.555
31.363	111.806
36.765	117.223];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', '2 chicks/nest'};  
temp.tW2    = C2K(40.63);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'Bris1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;
weights.Wwi = 5;
weights.Ww0 = 0;
weights.Wwb = 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2'}; subtitle1 = {'Data for 1,2 chicks/nest'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are supposed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6ZXPT'; % Cat of Life
metaData.links.id_ITIS = '177145'; % ITIS
metaData.links.id_EoL = '45509393'; % Ency of Life
metaData.links.id_Wiki = 'Streptopelia_roseogrisea'; % Wikipedia
metaData.links.id_ADW = 'Streptopelia_roseogrisea'; % ADW
metaData.links.id_Taxo = '54040'; % Taxonomicon
metaData.links.id_WoRMS = '1484595'; % WoRMS
metaData.links.id_avibase = '273A4A2F793BFFA1'; % avibase
metaData.links.id_birdlife = 'african-collared-dove-streptopelia-roseogrisea'; % birdlife
metaData.links.id_AnAge = 'Streptopelia_roseogrisea'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Streptopelia_roseogrisea}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Streptopelia_roseogrisea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bris1969'; type = 'artuble'; bib = [ ...  
'doi = {10.1111/j.1474-919X.1988.tb00976.x}, ' ...
'title = {Bioenergetics of the Breeding Cycle of the Ring Dove}, ' ...
'journal = {The Auk}, ' ...
'year = {1969}, ' ...
'author = {I. Lehr Brisbin}, ' ...
'volume = {86(1)}, ' ...
'pages = {54-74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=273A4A2F793BFFA1&sec=lifehistory}}';
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

