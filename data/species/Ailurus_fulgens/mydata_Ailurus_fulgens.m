function [data, auxData, metaData, txtData, weights] = mydata_Ailurus_fulgens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Ailuridae';
metaData.species    = 'Ailurus_fulgens'; 
metaData.species_en = 'Red panda'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb', 'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 29]; 

%% set data
% zero-variate data

data.tg = 116;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 137;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 550;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(37.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 100;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1140;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 4325;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: one clutch per yr';
  
% uni-variate data
% t-W data
data.tW1 = [ ... % time birth (d), weight (g), 
 20  354
 27  285
 34  430
 41  485
 48  635
 62  680
 69  690
 76  680
 83  823
 90  980
 97 1050
111 1275
132 1620
139 1795];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'weight'};  
temp.tW1    = C2K(37.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Robe1974';
comment.tW1 = 'In the same litter as tW2 in 1972';
%
data.tW2 = [ ... % time birth (d), weight (g), 
 20  400
 27  420
 34  460
 41  520
 48  605
 62  815
 69  840
 76  895
 83  965
 90 1105
 97 1442
111 1705
132 2045
139 2325
];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'weight'};  
temp.tW2    = C2K(37.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Robe1974';
comment.tW2 = 'In the same litter as tW1 in 1972';
%
data.tW3 = [ ... % time birth (d), weight (g), 
   7  205
  14  241
  21  291
  28  368
  35  443
  42  513
  49  569
  56  631
  70  758
  77  842
  84  896
  98 1027
 150 1860];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'weight'};  
temp.tW3    = C2K(37.6);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Robe1974';
comment.tW3 = 'In the same litter as tW4 in 1973';
%
data.tW4 = [ ... % time birth (d), weight (g), 
   7  204
  14  245
  21  302
  28  368
  35  461
  42  521
  49  577
  56  647
  70  768
  77  822
  84  920
  98 1125
 150 1810];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'weight'};  
temp.tW4    = C2K(37.6);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'Robe1974';
comment.tW4 = 'In the same litter as tW3 in 1974';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3','tW4'}; subtitle1 = {'From 1972 (2) and 1973 (2) litters'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '65V3W'; % Cat of Life
metaData.links.id_ITIS = '621846'; % ITIS
metaData.links.id_EoL = '327984'; % Ency of Life
metaData.links.id_Wiki = 'Ailurus_fulgens'; % Wikipedia
metaData.links.id_ADW = 'Ailurus_fulgens'; % ADW
metaData.links.id_Taxo = '66628'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001690'; % MSW3
metaData.links.id_AnAge = 'Ailurus_fulgens'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ailurus_fulgens}}';
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
bibkey = 'Robe1974'; type = 'Article'; bib = [ ... 
'author = {M. S. Roberts}, ' ... 
'year = {1974}, ' ...
'title = {Growth and development of mother-reared red pandas, \emph{Ailurus fulgens}}, ' ...
'journal = {Small Mammals in Captivity}, ' ...
'volume = {xx}, ' ...
'pages = {57--63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ailurus_fulgens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

