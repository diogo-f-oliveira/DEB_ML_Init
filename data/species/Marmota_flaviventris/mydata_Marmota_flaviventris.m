function [data, auxData, metaData, txtData, weights] = mydata_Marmota_flaviventris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Marmota_flaviventris'; 
metaData.species_en = 'Yellow-bellied marmot'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 21]; 

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 33;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 33.8;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 479; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 3500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: till 5 kg, ADW: 3.35 kg';

data.Ri  = 4/(.9*365);   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [..., % time since weaning (d), weight(g)
2.686	503.195
4.036	603.834
4.304	661.342
5.930	661.342
39.597	1916.933
39.600	1864.217
39.997	2070.288
40.147	1749.201
50.696	2079.872
50.701	1974.441
50.825	2228.435
66.651	2669.329
66.680	2041.534
66.927	2563.898
66.938	2324.281
71.830	1969.649
73.830	2654.952
73.845	2338.658
79.535	2300.319
79.808	2257.188
86.045	2103.834];
units.tW = {'d', 'g'};  label.tW = {'time since weaning', 'weight', 'enriched food'};  
temp.tW  = C2K(36.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'WoodArmi2003';
comment.tW = 'RData for enriched food';
%
data.tW1 = [..., % time since weaning (d), weight (g)
2.284	416.933
2.688	460.064
3.227	527.157
3.500	484.026
4.314	450.479
38.396	1519.169
38.400	1442.492
38.538	1375.399
38.936	1576.677
39.347	1466.454
39.480	1528.754
39.484	1428.115
39.891	1404.153
40.030	1327.476
40.032	1293.930
40.034	1255.591
40.036	1198.083
40.700	1495.208
47.734	1696.486
47.872	1643.770
47.872	1624.601
47.874	1600.639
47.875	1571.885
47.877	1533.546
47.878	1509.585
53.695	1653.355
53.697	1600.639
53.699	1576.677
53.700	1552.716
53.839	1461.661
64.662	1734.824
64.665	1667.732
64.668	1595.847
64.787	1960.064
64.931	1768.371
69.676	1677.316
69.805	1816.294
71.704	1749.201
71.705	1730.032
71.849	1547.923
71.960	2075.080
71.967	1921.725
83.910	1404.153];
units.tW1 = {'d', 'g'};  label.tW1 = {'time since weaning', 'weight', 'reference food'};  
temp.tW1  = C2K(36.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'WoodArmi2003';
comment.tW1 = 'Data for reference food';

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

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data at rich, reference food'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '7VSDV'; % Cat of Life
metaData.links.id_ITIS = '180140'; % ITIS
metaData.links.id_EoL = '327985'; % Ency of Life
metaData.links.id_Wiki = 'Marmota_flaviventris'; % Wikipedia
metaData.links.id_ADW = 'Marmota_flaviventris'; % ADW
metaData.links.id_Taxo = '61896'; % Taxonomicon
metaData.links.id_MSW3 = '12400944'; % Mammal Spec World
metaData.links.id_AnAge = 'Marmota_flaviventris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Marmota_flaviventris}}';
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
bibkey = 'WoodArmi2003'; type = 'Article'; bib = [ ... 
'author = {B. C. Woods and K. B. Armitage}, ' ... 
'year = {2003}, ' ...
'title = {Effect of Food Supplementation on Juvenile Growth and Survival in \emph{Marmota flaviventris}}, ' ...
'journal = {J. Mammal.}, ' ...
'volume = {84}, ' ...
'number = {3}, '...
'pages = {903--914}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Marmota_flaviventris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Marmota_flaviventris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

