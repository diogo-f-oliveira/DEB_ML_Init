function [data, auxData, metaData, txtData, weights] = mydata_Prionailurus_bengalensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Prionailurus_bengalensis'; 
metaData.species_en = 'Leopard cat'; 

metaData.ecoCode.climate = {'A', 'BSh', 'BWk', 'Cf', 'Dw', 'Df'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
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

data.tg = 62;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'AnAge';
  temp.tp = C2K(39.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 96;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = 'ADW gives 75-120 g';
data.Wwx = 620;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 3800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 3.8 kg in the tropics, till 7.1 kg in Siberia';
data.Wwi_Amur = 7100;   units.Wwi_Amur = 'g';   label.Wwi_Amur = 'ultimate wet weight';     bibkey.Wwi_Amur = 'Wiki';

data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 cups per litter, 1 litter per yr, but 2 if litter gets lost';

% uni-variate data

% time-weight data
data.tW = [ ... % time since birth (d), wet weight (g)
    0  81
    7 124
   14 210
   21 307
   28 398
   35 504];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'tropical subspecies'};  
temp.tW    = C2K(39.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Andr2003';
comment.tW = 'Data for tropical subspecies';
%
data.tW_Amur = [ ... % time since birth (d), wet weight (g)
    0  95
    7 190
   14 300
   21 425
   28 565
   35 670];
units.tW_Amur   = {'d', 'g'};  label.tW_Amur = {'time since birth', 'wet weight', 'Amur subspecies P. b. euptilura'};  
temp.tW_Amur    = C2K(39.8);  units.temp.tW_Amur = 'K'; label.temp.tW_Amur = 'temperature';
bibkey.tW_Amur = 'Andr2003';
comment.tW_Amur = 'Data for Amur subspecies P. b. euptilura';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3 * weights.Wwb;

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

%% Group plots
set1 = {'tW','tW_Amur'}; subtitle1 = {'Data for tropical, Amur subspecies'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed not to differ from females, due to lack of data';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4MF7C'; % Cat of Life
metaData.links.id_ITIS = '552763'; % ITIS
metaData.links.id_EoL = '1041047'; % Ency of Life
metaData.links.id_Wiki = 'Prionailurus_bengalensis'; % Wikipedia
metaData.links.id_ADW = 'Prionailurus_bengalensis'; % ADW
metaData.links.id_Taxo = '169596'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000181'; % MSW3
metaData.links.id_AnAge = 'Prionailurus_bengalensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prionailurus_bengalensis}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Prionailurus_bengalensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Prionailurus_bengalensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

