function [data, auxData, metaData, txtData, weights] = mydata_Tauraco_corythaix
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Musophagiformes'; 
metaData.family     = 'Musophagidae';
metaData.species    = 'Tauraco_corythaix'; 
metaData.species_en = 'Knysna turaco'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 25];

%% set data
% zero-variate data

data.ab = 24.3;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(37.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Turacos2012';
data.tx = 32;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 96;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 12.4*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(41.3);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 26.4;   units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 20;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'JarvCurr1979';
data.Wwi = 312; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	19.996
1.253	24.355
7.214	62.141
10.092	90.865
14.174	91.947
18.218	110.361
37.584	219.082
44.597	224.889];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'JarvCurr1979';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tp = weights.tp * 2;
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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '54Z7N'; % Cat of Life
metaData.links.id_ITIS = '555330'; % ITIS
metaData.links.id_EoL = '45513990'; % Ency of Life
metaData.links.id_Wiki = 'Tauraco_corythaix'; % Wikipedia
metaData.links.id_ADW = 'Tauraco_corythaix'; % ADW
metaData.links.id_Taxo = '108043'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '45CE1202440B9385'; % avibase
metaData.links.id_birdlife = 'knysna-turaco-tauraco-corythaix'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tauraco_corythaix}}';
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
bibkey = 'JarvCurr1979'; type = 'article'; bib = [ ... 
'doi = {10.1080/00306525.1979.9633527}, ' ...
'author = {Jarvis, M. J. F. and Currie, M. H.}, ' ... 
'year = {1979}, ' ...
'title =  {BREEDING OF CAPTIVE KNYSNA AND PURPLECRESTED LOURIES}, ' ...
'journal = {Ostrich}, ' ...
'volume = {50(1)}, '...
'page = {38–44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=45CE1202440B9385&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Turacos2012'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.turacos.co.uk/}}';
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

