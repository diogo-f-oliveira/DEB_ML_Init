function [data, auxData, metaData, txtData, weights] = mydata_Balaenoptera_acutorostrata 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Balaenopteridae';
metaData.species    = 'Balaenoptera_acutorostrata'; 
metaData.species_en = 'Minke whale'; 

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

metaData.author   = {'Starrlight Augustine','Ana Sofia Aniceto'};    
metaData.date_subm = [2016 12 15];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1 = [2023 08 07];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 07];  

%% set data
% zero-variate data

data.tg = 312;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 183;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '4-6 months';
data.tp = 5.8*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'OlseSund2002';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'sexually mature at around 3-8 years of age, NOAA2004';
data.am = 50 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.5e2;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'NOAA2004';
comment.Lb = '2.4-3.5 m';
data.Lp  = 7e2;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'NOAA2004'; 
data.Li  = 10e2;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'NOAA2004';

data.Wwb = 3.2e5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 9.2e6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'NOAA2004';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'NOAA2004';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'AnAges gives a litter interval of 470 d';

% univariate data
  
% time-length for foetus
data.tLe = [ ...
 37.246	  9.085
 39.729	  3.163
 60.834	  7.716
 76.147	 10.758
 79.871	 13.744
 89.389	 10.823
 94.769	 12.332
 97.666	 15.314
 99.322	 15.322
102.218	 16.820
115.875	 24.305
118.358	 24.317
133.670	 37.744
143.602	 40.760
166.364	 60.158
171.330	 64.634
189.125	 89.943
214.369	110.837
243.338	152.521
271.479	183.815
306.655	270.040];
units.tLe = {'d', 'cm'}; label.tLe = {'gestation time', 'total length'};  
temp.tLe = C2K(37);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'BertLanz2016'; 
comment.tLe = 'BertLanz2016 reconstructed some ages from L(t) = 0.0312*t^2-0.0568*t';

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

%% Discussion points
D1 = 'mod_1: tL data added';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'synonymes: Balaena minima, Balaenoptera rostrata, Balaena rostrata';
metaData.bibkey.F1 = 'AnAge'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'KF8K'; % Cat of Life
metaData.links.id_ITIS = '180524'; % ITIS
metaData.links.id_EoL = '46559426'; % Ency of Life
metaData.links.id_Wiki = 'Balaenoptera_acutorostrata'; % Wikipedia
metaData.links.id_ADW = 'Balaenoptera_acutorostrata'; % ADW
metaData.links.id_Taxo = '68885'; % Taxonomicon
metaData.links.id_WoRMS = '137087'; % WoRMS
metaData.links.id_MSW3 = '14300012'; % MSW3
metaData.links.id_AnAge = 'Balaenoptera_acutorostrata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Balaenoptera_acutorostrata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Balaenoptera_acutorostrata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NOAA2004'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nmfs.noaa.gov/pr/species/mammals/cetaceans/minkewhale.htm}}';
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
bibkey = 'OlseSund2002'; type = 'Article'; bib = [ ... 
'author = {E. Olsen and J. Sunde}, ' ... 
'year = {2002}, ' ...
'title = {Age determination of minke whales (\textit{Balaenoptera acutorostrata}) using the aspartic acid racemization technique}, ' ...
'journal = {Sarsia}, ' ...
'volume = {87}, ' ...
'url = {}, '...
'pages = {1--8}'];
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

