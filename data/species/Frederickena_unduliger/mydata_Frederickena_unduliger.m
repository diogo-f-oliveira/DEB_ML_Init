function [data, auxData, metaData, txtData, weights] = mydata_Frederickena_unduliger
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Thamnophilidae';
metaData.species    = 'Frederickena_unduliger'; 
metaData.species_en = 'Undulated antshrike'; 

metaData.ecoCode.climate = {'Af','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 05 22];              
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

data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 13;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SancLond2016';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 39;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 7.9;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SancLond2016';
data.Wwi = 60;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'SancLond2016';

data.Ri  = 2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SancLond2016';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2 eggs per clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.963	10.107
2.904	17.308
5.030	27.555
6.915	35.547
9.983	50.863
11.980	55.806];
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = C2K(41.6); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SancLond2016';

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
D1 = 'Body temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6JLVW'; % Cat of Life
metaData.links.id_ITIS = '915976'; % ITIS
metaData.links.id_EoL = '45512616'; % Ency of Life
metaData.links.id_Wiki = 'Frederickena_unduliger'; % Wikipedia
metaData.links.id_ADW = 'Frederickena_unduligera'; % ADW
metaData.links.id_Taxo = '1683760'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '3C42048ACFF87389'; % avibase
metaData.links.id_birdlife = 'undulated-antshrike-frederickena-unduliger'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Frederickena_unduliger}}';
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
bibkey = 'SancLond2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jofo.12137}, ' ...
'author = {Manuel A. S\''{a}nchez-Mart\''{i}nez  and Gustavo A. Londo\~{n}o}, ' ... 
'year = {2016}, ' ...
'title = {Nesting behavior of male and female Undulated Antshrikes (\emph{Frederickena unduliger}}, ' ...
'journal = {J. Field Ornithol.}, ' ...
'volume = {87}, ' ...
'pages = {21-28}'];
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

