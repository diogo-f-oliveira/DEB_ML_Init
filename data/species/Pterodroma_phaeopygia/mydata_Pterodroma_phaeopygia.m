function [data, auxData, metaData, txtData, weights] = mydata_Pterodroma_phaeopygia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pterodroma_phaeopygia'; 
metaData.species_en = 'Galapagos petrel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 18];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 55;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Warh1990';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 120; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Warh1990';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 360; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge: possibly longer than 30 yr';

data.Wwb = 60; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Warh1990';
  comment.Wwb = 'Data derived from tW';
data.Wwi = 700; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Warh1990';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower. AnAge 425 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       60     % added data point Wwb
5.016	95.653
10.163	140.060
14.515	186.225
20.240	210.548
25.090	267.742
29.695	317.592
35.167	338.230
39.720	408.212
44.306	465.382
49.310	464.010
53.715	490.042
59.052	561.926
64.027	571.535
69.064	557.351
73.952	599.904
78.874	629.645
84.237	591.692
88.987	586.635
94.283	574.305
99.603	552.824
104.220	498.326
109.334	454.858
114.304	466.297
120.437	435.737];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Warh1990';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'Body temperature is guessed';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4PWL2'; % Cat of Life
metaData.links.id_ITIS = '174578'; % ITIS
metaData.links.id_EoL = '45511498'; % Ency of Life
metaData.links.id_Wiki = 'Pterodroma_phaeopygia'; % Wikipedia
metaData.links.id_ADW = 'Pterodroma_phaeopygia'; % ADW
metaData.links.id_Taxo = '51552'; % Taxonomicon
metaData.links.id_WoRMS = '343980'; % WoRMS
metaData.links.id_avibase = '0DF68A874B9BB663'; % avibase
metaData.links.id_birdlife = 'galapagos-petrel-pterodroma-phaeopygia'; % birdlife
metaData.links.id_AnAge = 'Pterodroma_phaeopygia'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterodroma_phaeopygia}}';
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
bibkey = 'Warh1990'; type = 'Book'; bib = [ ... 
'author = {J. Warham}, ' ... 
'year = {1990}, ' ...
'title = {The petrels; thier ecology and breeding systems}, ' ...
'publisher = {Academic Press}, ' ...
'address = {London}'];
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

