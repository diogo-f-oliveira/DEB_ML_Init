function [data, auxData, metaData, txtData, weights] = mydata_Canis_latrans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Canis_latrans'; 
metaData.species_en = 'Coyote';

metaData.ecoCode.climate = {'B', 'Cfa', 'Df'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTa', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 05 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 13]; 

%% set data
% zero-variate data

data.tg = 63;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 274;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 250;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1517;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 13.25e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'ADW: ';
  
data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 pups per litter, 1 litters per yr';
  
% uni-variate data
% time-weight
data.tWw = [ % time since birth (wk), wet weight (g)
0	463.942
10	429.571
20	686.674
27	1095.419
32	1079.043
32	905.246
37	1217.314
42	1336.204
47	1551.654
52	2018.428
57	2214.612
62	2488.091
67	2607.154
72	2880.691
77	3424.586
82	3253.505
87	3952.278
110	4554.260
125	4982.444
145	6299.517]; 
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'total weight'};  
temp.tWw  = C2K(37);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'BarnGree1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; weights.psd.t_0 = 1; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend not to differ from females, but males are slightly larger';
D2 = 'Wwx is ignored, because of inconsistency of (tx,Wwx) with tWw data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'QLXJ'; % Cat of Life
metaData.links.id_ITIS = '180599'; % ITIS
metaData.links.id_EoL = '328608'; % Ency of Life
metaData.links.id_Wiki = 'Canis_latrans'; % Wikipedia
metaData.links.id_ADW = 'Canis_latrans'; % ADW
metaData.links.id_Taxo = '66414'; % Taxonomicon
metaData.links.id_WoRMS = '1506654'; % WoRMS
metaData.links.id_MSW3 = '14000718'; % MSW3
metaData.links.id_AnAge = 'Canis_latrans'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Canis_latrans}}';
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
bibkey = 'BarnGree1979'; type = 'article'; bib = [ ... 
'author = {Douglas A. Barnum and Jeffrey S. Green and Jerran T. Flinders and Norman L. Gates}, ' ... 
'year = {1979}, ' ...
'title = {NUTRITIONAL LEVELS AND GROWTH RATES OF HAND-REARED COYOTE PUPS}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {60}, '...
'pages = {820-823}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Canis_latrans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Canis_latrans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

