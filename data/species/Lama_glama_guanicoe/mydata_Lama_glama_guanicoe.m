function [data, auxData, metaData, txtData, weights] = mydata_Lama_glama_guanicoe

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Camelidae';
metaData.species    = 'Lama_glama_guanicoe'; 
metaData.species_en = 'Guanaco'; 

metaData.ecoCode.climate = {'BWk', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTs', '0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 05]; 

%% set data
% zero-variate data

data.tg = 335;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx =  345;  units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 33.7*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 11.5e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 127.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'BasGonz2000: between 93 and 135 kg';
  
data.Ri  = 1/2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ % time since birth (d), weight (kg)
1.708	15.873
20.501	16.508
41.002	20.317
64.920	25.079
92.255	31.111
121.298	37.460
150.342	42.540
167.426	43.810
187.927	44.762
222.096	47.619
264.806	53.016
290.433	59.048
317.768	60.317
365.604	62.857
392.939	64.444
413.440	66.667
430.524	68.571
522.779	79.365
563.781	83.492
707.289	86.667
914.009	95.873
956.720	89.841
994.305	92.381
1021.640	92.063
1086.560	94.286
1151.481	98.095
1187.358	103.810
1223.235	106.032
1253.986	105.714
1312.073	106.032
1351.367	103.492
1378.702	102.857
1417.995	105.714
1436.788	103.175
1465.831	106.032]; 
units.tW  = {'d', 'kg'};  label.tW = {'time since capture', 'total weight'};  
temp.tW  = C2K(38);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BasGonz2000';

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

%% Links
metaData.links.id_CoL = '5J8TW'; % Cat of Life
metaData.links.id_ITIS = '898356'; % ITIS
metaData.links.id_EoL = '309018'; % Ency of Life
metaData.links.id_Wiki = 'Lama_guanicoe'; % Wikipedia
metaData.links.id_ADW = 'Lama_guanicoe'; % ADW
metaData.links.id_Taxo = '154238'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200117'; % MSW3
metaData.links.id_AnAge = 'Lama_glama_guanicoe'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lama_guanicoe}}';
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
bibkey = 'BasGonz2000'; type = 'Article'; bib = [ ... 
'author = {F. Bas and B. Gonz\''{a}lez}, ' ... 
'year = {2000}, ' ...
'title = {CURRENT ADVANCES IN RESEARCH AND MANAGEMENT OF THE GUANACO (\emph{Lama guanicoe}) IN CHILE}, ' ...
'journal = {Ciencia e investigaci\''{o}n agraria}, ' ...
'doi = {DOI: 10.7764/rcia.v27i1.997}, ' ...
'volume = {27}, ' ...
'pages = {51--65}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lama_guanicoe}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Lama_guanicoe/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

