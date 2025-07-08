function [data, auxData, metaData, txtData, weights] = mydata_Babyrousa_babyrussa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Suidae';
metaData.species    = 'Babyrousa_babyrussa'; 
metaData.species_en = 'Buru babirusa'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd', '0iTs', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2023 08 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 22];

%% set data
% zero-variate data

data.tg = 156.5;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'ShehIndr2017';   
  temp.tg = C2K(39.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '155-158';
data.tx = 29*7;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ShehIndr2017';   
  temp.tx = C2K(39.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '25-32 wk';
data.tp = 7.5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ShehIndr2017';
  temp.tp = C2K(39.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '5-10 mnth';
data.am = 22.9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(39.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 517;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwi = 70e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'ultimateungulate';
  comment.Wwi = 'based on Babyrousa celebensis';
data.Wwim = 1005e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'ultimateungulate';
  comment.Wwim = 'based on Babyrousa celebensis';
  
data.Ri  = 2.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.3 calf per litter, 2 litters per yr';

%% set weights for all real data
weights = setweights(data, []);
weights.tg = 3 * weights.tg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k = 0.2; weights.psd.k_J = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Slow foetal development is assumed; p_M based on Sus scrofa';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'K6LZ'; % Cat of Life
metaData.links.id_ITIS = '625006'; % ITIS
metaData.links.id_EoL = '328330'; % Ency of Life
metaData.links.id_Wiki = 'Babyrousa_babyrussa'; % Wikipedia
metaData.links.id_ADW = 'Babyrousa_babyrussa'; % ADW
metaData.links.id_Taxo = '67646'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200009'; % MSW3
metaData.links.id_AnAge = 'Babyrousa_babyrussa'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Babyrousa_babyrussa}}';
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
bibkey = 'ShehIndr2017'; type = 'incollection'; bib = [ ... 
'doi = {10.1017/9781316941232.009 }, ' ...
'author = {Sheherazade, E. Hesdianti and Indrawan, M.}, ' ... 
'editor = {Mario Melletti}, ' ...
'booktitle = {Ecology, Conservation and Management of Wild Pigs and Peccaries}, ' ...
'publisher = {Cambridge Univ Press}, ' ...
'year = {2017}, ' ...
'chapter = {7}, ' ...
'title = {Moluccan \emph{Babirusa Babyrousa babyrussa} ({L}innaeus, 1758)}, ' ...
'pages = {70–75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Babyrousa_babyrussa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Babyrousa_babyrussa/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ultimateungulate'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.ultimateungulate.com/Artiodactyla/Babyrousa_celebensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

