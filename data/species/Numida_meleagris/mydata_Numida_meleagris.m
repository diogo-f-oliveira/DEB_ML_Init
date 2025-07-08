function [data, auxData, metaData, txtData, weights] = mydata_Numida_meleagris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Numididae';
metaData.species    = 'Numida_meleagris'; 
metaData.species_en = 'Helmeted guineafowl'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'Ww-JX'; 't-Wwe'}; 
metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};                 
metaData.date_mod_1    = [2022 11 04];                            
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};                  
metaData.address_mod_1 = {'VU University of Amsterdam'};  

metaData.author_mod_2  = {'Bas Kooijman','Starrlight Augustine'};                 
metaData.date_mod_2    = [2023 07 31];                            
metaData.email_mod_2   = {'bas.kooijman@vu.nl'};                  
metaData.address_mod_2 = {'VU University of Amsterdam'};  

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc  = [2023 07 31]; 

%% set data
% zero-variate data

data.ab = 28;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'KhaiDas2016';   
  temp.ab = C2K(34);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is taken as the optimal one for most birds as it was not specified in the study.';
data.tx = 4*7;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MartKirw2020';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 28*7;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MartKirw2020';
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'females capable of breeding';
data.tR = 28*7;          units.tR = 'd';    label.tR = 'time since birth at puberty'; bibkey.tR = 'MartKirw2020';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR= 'temperature';
  comment.tR = 'start of breeding';
data.am = 12*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 25.8;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KhaiDas2016';
data.Wwi = 1578;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 1597;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';   

data.Ri  = 9/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
tXW = [ ... % time since birth (wk), feed intake (g/wk), initial/final weight (g) 
 1  62.23   25.8   41.5 
 2  67.0    41.5   54.23 
 3  56.84   54.23  64.8 
 4 100.1    64.8   88.0 
 5 131.11   88.0  117.5 
 6 218.4   117.5  189.0 
 7 240.1   189    274.8 
 8 275.8   274.8  377.0 
 9 320.6   377.0  512.0  
10 371.7   512.0  640.0 
11 401.8   640.0  779.6 
12 366.0   779.6  850.71 
13 450.0   850.7 1142.42
14 462.0  1142.4 1364.8 
15 462.0  1364.8 1450.56 
16 499.94 1450.6 1492.8 
17 502.04 1492.8 1529.61 
18 508.13 1529.6 1674.79 
19 526.16 1674.8 1680.5 
20 567.00 1680.5 1695.84];
data.tW = [7*[0;tXW(:,1)], [tXW(:,3);tXW(end,4)]]; % d,g: time since birth, weight
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'KhaiDas2016';
%
data.WJX = [sum(tXW(:,3:4),2)/2, tXW(:,2)/ 7]; % g, g/d
units.WJX   = {'g', 'g/d'};  label.WJX = {'weight', 'feed intake'};  
temp.WJX    = metaData.T_typical;  units.temp.WJX = 'K'; label.temp.WJX = 'temperature';
bibkey.WJX  = 'KhaiDas2016';

% time-weight
data.tW_fm = [ ... % time (d), weight (g)
  3	  14.260   29.444
  6	  32.850   58.802
 10	 111.368  147.624
 15	 189.366  206.685
 27	 424.571  502.912
 35	 720.224  749.921
 48	1093.788 1135.257
 69	1763.091 1727.969
103	2746.810 2468.335
159	2933.838 2751.897];
units.tW_fm = {'d', 'g'};     label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm = C2K(41.2); units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'DietDren1997'; treat.tW_fm = {1, {'females','males'}};

% time-weight fro embryos
data.tWe = [ ... % age (d), yolk-free embryo weight (g)
6.877	0.222
8.870	0.385
10.961	1.246
13.051	2.195
14.941	3.930
16.927	6.801
18.909	11.418
19.802	12.810
20.991	15.773
21.782	18.214
22.773	20.479
23.768	20.997
24.651	26.931
25.847	27.011
27.040	28.140];
units.tWe = {'d', 'g'}; label.tWe = {'age', 'yolk-free embryo weight'};  
temp.tWe = C2K(37.5); units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'DietDren1997';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

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
D1 = 'Body temperature is guessed';
D2 = 'initial growth is retarded';
D3 = 'mod_1: tW_fm and tWe data added, Wwi data revised';
D4 = 'Males are assumed to differ from females by {p_Am} only';
D5 = 'Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '6SCXZ'; % Cat of Life
metaData.links.id_ITIS = '176126'; % ITIS
metaData.links.id_EoL = '45510616'; % Ency of Life
metaData.links.id_Wiki = 'Numida_meleagris'; % Wikipedia
metaData.links.id_ADW = 'Numida_meleagris'; % ADW
metaData.links.id_Taxo = '53223'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '1044B438EE7556BB'; % avibase
metaData.links.id_birdlife = 'helmeted-guineafowl-numida-meleagris'; % birdlife
metaData.links.id_AnAge = 'Numida_meleagris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Numida_meleagris}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Numida_meleagris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KhaiDas2016'; type = 'Article'; bib = [ ...  
'title = {Hatching and growth performances of guinea fowl under intensive management system}, ' ...
'journal = {Progressive Agriculture}, ' ...
'year = {2016}, ' ...
'author = {M. Khairunnesa and S. C. Das and A. Khatun}, ' ...
'volume = {27}, ' ...
'pages = {70-77}, ' ...
'issn = {1017-8139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DietDren1997'; type = 'Article'; bib = [ ... 
'author = {Maurine W. Dietz and Rudi H. Drent}, ' ... 
'year = {1997}, ' ...
'title = {Effect of Growth Rate and Body Mass on Resting Metabolic Rate in Galliform Chicks}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {70(5)}, ' ...
'pages = {493–501}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=1044B438EE7556BB&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartKirw2020'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {del Hoyo, J. and G. M. Kirwan}, ' ...
'year = {2020}, ' ...
'title  = {Helmeted Guineafowl (\empn{Numida meleagris}), version 1.0. }, ' ...
'booktitle = {Birds of the World }, ' ...
'publisher = {Cornell Lab of Ornithology}, ' ...
'address = {Ithaca, NY, USA}, ' ...
'doi = {10.2173/bow.helgui.01}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
