function [data, auxData, metaData, txtData, weights] = mydata_Pitta_iris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Pittidae';
metaData.species    = 'Pitta_iris'; 
metaData.species_en = 'Rainbow pitta';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTht', '0iThh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 14;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'ZimmNosk2003';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14;        units.tx = 'd';    label.tx = 'time since birth at fledging';  bibkey.tx = 'ZimmNosk2003';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42;        units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.9*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 6.7;     units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';      bibkey.Ww0 = 'avibase';
data.Wwb = 4.2;      units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on tW data';
data.Wwi = 67;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 62.3;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';
 
data.Ri  = 2*4/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'ZimmNosk2003';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-5 egg per clutch; 2 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.000	6.494
1.001	9.534
1.002	7.305
3.000	18.062
3.001	18.873
3.002	14.515
5.000	27.097
5.001	28.820
7.000	41.503
7.001	40.591
7.002	37.956
7.003	39.578
9.000	45.471
9.001	50.234
9.002	49.525
9.043	43.748
11.000	47.107
11.001	57.242
12.000	50.662];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'ZimmNosk2003';

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
D1 = 'Males are supposed to differ fro females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4JBYC'; % Cat of Life
metaData.links.id_ITIS = '562233'; % ITIS
metaData.links.id_EoL = '45518042'; % Ency of Life
metaData.links.id_Wiki = 'Pitta_iris'; % Wikipedia
metaData.links.id_ADW = 'Pitta_iris'; % ADW
metaData.links.id_Taxo = '56224'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '91D7118729751991'; % avibase
metaData.links.id_birdlife = 'rainbow-pitta-pitta-iris'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pitta_iris}}';
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
bibkey = 'ZimmNosk2003'; type = 'article'; bib = [ ... 
'doi = {10.1071/mu02005}, ' ...
'author = {Zimmermann, U. M. and Noske, R. A.}, ' ...
'title = {Breeding biology of the Rainbow Pitta, \emph{Pitta iris}, a species endemic to {A}ustralian monsoon-tropical rainforests}, ' ...
'journal = {Emu}, ' ...
'year = {2003}, ' ...
'volume = {103(3)}, ' ...
'pages = {245–254}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=91D7118729751991&sec=lifehistory}}';
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

