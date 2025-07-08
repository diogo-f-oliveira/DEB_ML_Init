function [data, auxData, metaData, txtData, weights] = mydata_Megaptera_novaeangliae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Balaenopteridae';
metaData.species    = 'Megaptera_novaeangliae'; 
metaData.species_en = 'Humpback whale'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp usually 37 or so for a mammal
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Le'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 08 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 07];  

%% set data
% zero-variate data

data.tg = 342;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 5*30.5;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '4-6 months';
data.tp = 4.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 95 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 4.5e2;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'ADW';
data.Lp  = 12.5e2;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Li  = 17e2;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'Wiki';
  comment.Li = '14-17 m';
  
data.Wwb = 0.68e6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 40e6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 1/2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one calve each 2 yrs';

% univariate data

% time-length for foetus
data.tLe = [ ...
 14.484	  6.007
 30.624	 10.537
 35.590	  9.077
 39.729	  6.130
 45.522	 13.577
 60.421	 13.649
 67.042	 16.649
 74.905	 21.138
 96.011	 30.143
100.563	 27.197
106.357	 39.095
114.634	 40.619
122.497	 61.429
151.465	 74.923
182.503	109.198
213.541	143.474
243.752	171.811
350.936	449.780];
units.tLe = {'d', 'cm'}; label.tLe = {'gestation time', 'total length'};  
temp.tLe = C2K(37);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'BertLanz2016'; 
comment.tLe = 'BertLanz2016 reconstructed some ages from L(t) = 0.0354*t^2-0.0303*t';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'sFemales are larger than males';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3YWY2'; % Cat of Life
metaData.links.id_ITIS = '180530'; % ITIS
metaData.links.id_EoL = '46559444'; % Ency of Life
metaData.links.id_Wiki = 'Megaptera_novaeangliae'; % Wikipedia
metaData.links.id_ADW = 'Megaptera_novaeangliae'; % ADW
metaData.links.id_Taxo = '68895'; % Taxonomicon
metaData.links.id_WoRMS = '137092'; % WoRMS
metaData.links.id_MSW3 = '14300027'; % MSW3
metaData.links.id_AnAge = 'Megaptera_novaeangliae'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Megaptera_novaeangliae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Megaptera_novaeangliae}}';
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
bibkey = 'JeffLeat1993'; type = 'Book'; bib = [ ...
'author = {Jefferson, T.A. and Leatherwood, S. and Webber, M.A.}, ' ...
'year = {1993}, ' ...
'title  = {Marine Mammals of the World: {F}{A}{O} Species Identification Guide}, ' ...
'publisher = {FAO}, ' ...
'pages = {587}, ' ...
'url = {http://www.fao.org/docrep/009/t0725e/t0725e00.htm}, ' ...
'volume = {320}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BertLanz2016'; type = 'Article'; bib = [ ... 
'doi = {10.1093/icb/icw128}, ' ...
'author = {Annalisa Berta and Agnese Lanzetti and Eric G. Ekdale and Thomas A. Dem\''{e}r\''{e}}, ' ... 
'year = {2016}, ' ...
'title = {From Teeth to Baleen and Raptorial to Bulk Filter Feeding in Mysticete Cetaceans: The Role of Paleontological, Genetic, and Geochemical Data in Feeding Evolution and Ecology}, ' ...
'journal = {Integrative and Comparative Biology}, ' ...
'volume = {56(6)}, ' ...
'pages = {1271–1284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Megaptera_novaeangliae/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

