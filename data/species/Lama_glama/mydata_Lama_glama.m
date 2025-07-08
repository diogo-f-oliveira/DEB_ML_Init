function [data, auxData, metaData, txtData, weights] = mydata_Lama_glama

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Camelidae';
metaData.species    = 'Lama_glama'; 
metaData.species_en = 'Llama'; 

metaData.ecoCode.climate = {'BWk', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTs', '0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 05]; 

%% set data
% zero-variate data

data.tg = 330;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx =  4*30.5;  units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '405 mnth';
data.tp = 800;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 28.9*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 11e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 140e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'AnAge';
  
data.Ri  = 1/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ % time since birth (d), weight (kg)
32.105	24045.778
64.211	36980.444
93.105	45252.468
126.816	52453.940
154.105	58932.277
184.605	66489.027
211.895	71175.250
244.000	75866.189
276.105	81632.396
303.395	86677.042
335.500	91367.981
367.605	94983.651
398.105	99673.018
455.895	107256.492
491.211	111592.152
518.500	115919.952
547.395	119890.901
581.105	123149.720
610.000	126403.823
638.895	128582.657
669.395	133272.024
699.895	136527.699
732.000	139784.946
762.500	143040.621
793.000	145937.873
821.895	148116.708
854.000	152090.800
881.289	154268.063
913.395	157525.310
942.289	160420.990
976.000	163321.386
1004.895	166575.489
1037.000	168399.044
1065.895	171294.724
1098.000	174551.971]; 
units.tW  = {'d', 'g'};  label.tW = {'time since capture', 'total weight'};  
temp.tW  = C2K(38.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'extension';

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
metaData.links.id_CoL = '3RYF2'; % Cat of Life
metaData.links.id_ITIS = '625028'; % ITIS
metaData.links.id_EoL = '309018'; % Ency of Life
metaData.links.id_Wiki = 'Lama_glama'; % Wikipedia
metaData.links.id_ADW = 'Lama_glama'; % ADW
metaData.links.id_Taxo = '67772'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200117'; % MSW3
metaData.links.id_AnAge = 'Lama_glama'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lama_glama}}';
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
bibkey = 'extension'; type = 'Misc'; bib = ...
'howpublished = {\url{https://extension.psu.edu/how-well-are-they-growing}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lama_guanicoe}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Lama_glama/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

