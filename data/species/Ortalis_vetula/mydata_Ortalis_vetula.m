function [data, auxData, metaData, txtData, weights] = mydata_Ortalis_vetula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Cracidae';
metaData.species    = 'Ortalis_vetula'; 
metaData.species_en = 'Plain chachalaca'; 

metaData.ecoCode.climate = {'Aw','Cwa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data

data.ab = 23;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(34);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 19;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '14-21 d';
data.tp = 4 * 30.5;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Mari1977';   
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'fig 2, age of adults'; 
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = metaData.T_typical; units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.8*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.Ww0 = 55;   units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 53;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Mari1977';
data.Wwi = 542;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'avibase';
data.Wwim = 584; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'avibase';
data.Ri  = 2*2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'avibase';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch, 2 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (mnth), wet weight (g)
1.000	148.954
1.493	222.472
1.962	297.629
2.948	428.308
3.934	498.474
4.967	522.838
5.460	573.458
6.446	588.017
6.915	563.407
7.408	569.869
7.901	569.788
8.418	576.246
8.958	567.980
9.427	551.548
9.944	562.912
10.413	554.658
10.883	582.385];
data.tW(:,1) = data.tW(:,1) * 30.5; % convert mnth to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = metaData.T_typical;  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mari1977';

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
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '74XH8'; % Cat of Life
metaData.links.id_ITIS = '175716'; % ITIS
metaData.links.id_EoL = '45508943'; % Ency of Life
metaData.links.id_Wiki = 'Ortalis_vetula'; % Wikipedia
metaData.links.id_ADW = 'Ortalis_vetula'; % ADW
metaData.links.id_Taxo = '52900'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'F4F49CCBEB3E6B4A'; % avibase
metaData.links.id_birdlife = 'plain-chachalaca-ortalis-vetula'; % birdlife
metaData.links.id_AnAge = 'Ortalis_vetula'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ortalis_vetula}}';
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
bibkey = 'Mari1977'; type = 'Article'; bib = [ ... 
'author = {Marion, W. R.}, ' ... 
'year = {1977}, ' ...
'title = {Growth and development of the Plain Chachalaca in South Texas}, ' ...
'journal = {Wilson Bulletin}, ' ...
'volume = {89}, ' ...
'pages = {47-56}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=F4F49CCBEB3E6B4A&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Ortalis_vetula}}';
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

