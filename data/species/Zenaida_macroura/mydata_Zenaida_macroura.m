function [data, auxData, metaData, txtData, weights] = mydata_Zenaida_macroura

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Columbiformes'; 
metaData.family     = 'Columbidae';
metaData.species    = 'Zenaida_macroura'; 
metaData.species_en = 'Mourning dove'; 

metaData.ecoCode.climate = {'BSk', 'Csb', 'Df'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTg', '0iTi'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.63); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(37.85); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.63); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '11 to 15 d';
data.tp = 90;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(40.63); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at first brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40.63); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 31.3*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.63); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 110;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Mill2010';
  comment.Wwi = 'Wiki: 112 to 170 g';

data.Ri  = 5*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.63); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch, 5 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0    5 % Wwb added
13	 57.151
19	 73.262
25	 85.423
35	 97.361
90	110.334];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.63);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Mill2010';

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
D1 = 'Body temperature is guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5D2BZ'; % Cat of Life
metaData.links.id_ITIS = '177125'; % ITIS
metaData.links.id_EoL = '45509402'; % Ency of Life
metaData.links.id_Wiki = 'Zenaida_macroura'; % Wikipedia
metaData.links.id_ADW = 'Zenaida_macroura'; % ADW
metaData.links.id_Taxo = '54054'; % Taxonomicon
metaData.links.id_WoRMS = '1485214'; % WoRMS
metaData.links.id_avibase = '00124D987C95811B'; % avibase
metaData.links.id_birdlife = 'mourning-dove-zenaida-macroura'; % birdlife
metaData.links.id_AnAge = 'Zenaida_macroura'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zenaida_macroura}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Zenaida_macroura}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill2010'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1600-048X.2010.05124.x}, ' ...
'title = {Immediate and delayed effects of poor developmental conditions on growth and flight ability of juvenile mourning doves \emph{Zenaida macroura}}, ' ...
'journal = {J. Avian Biol.}, ' ...
'year = {2010}, ' ...
'author = {D. A. Miller}, ' ...
'volume = {42}, ' ...
'pages = {151--158}'];
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

