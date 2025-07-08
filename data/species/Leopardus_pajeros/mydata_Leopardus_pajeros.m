function [data, auxData, metaData, txtData, weights] = mydata_Leopardus_pajeros

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Leopardus_pajeros'; 
metaData.species_en = 'Pampas cat'; 

metaData.ecoCode.climate = {'A','BWk','BSk','Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 02]; 

%% set data
% zero-variate data

data.tg = 80;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(39.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 55;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(39.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'guess';
  temp.tp = C2K(39.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 140;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Andr2003';
  comment.Wwb = 'AnAge gives 55.5 g';
data.Wwi = 3935;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 cups per litter, 1 litter per yr ';

% uni-variate data

% time-weight data
data.tW = [ ... % time since birth (d), wet weight (g)
    0 140
    7 243
   14 382
   21 500
   28 643
   35 776];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Andr2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females, due to lack of data';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3T78C'; % Cat of Life
metaData.links.id_ITIS = '726255'; % ITIS
metaData.links.id_EoL = '925987'; % Ency of Life
metaData.links.id_Wiki = 'Leopardus_pajeros'; % Wikipedia
metaData.links.id_ADW = 'Leopardus_pajeros'; % ADW
metaData.links.id_Taxo = '985474'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000097'; % MSW3
metaData.links.id_AnAge = 'Leopardus_colocolo'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leopardus_colocolo}}';
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
bibkey = 'Andr2003'; type = 'techreport'; bib = [ ... 
'author = {Andrews, P.}, ' ... 
'year = {2003}, ' ...
'title = {Hand-Rearing of SmallFelids}, ' ...
'institution = {Hexagon Farm Wild Feline Breeding Facility}, ' ...
'howpublished = {\url{https://aszk.org.au/wp-content/uploads/2020/05/Hand-RearingSmallFelidsPennyAndrewsHexagonFarms.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Leopardus_colocolo}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Leopardus_pajeros/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

