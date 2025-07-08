function [data, auxData, metaData, txtData, weights] = mydata_Camelus_bactrianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Camelidae';
metaData.species    = 'Camelus_bactrianus'; 
metaData.species_en = 'Bactrian camel'; 

metaData.ecoCode.climate = {'BWk', 'BSk', 'Dwb', 'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 395;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx =  319;  units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1278;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 35.4*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 34e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 350e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'ADW';
  comment.Wwi = 'ADW: 300 till 690 kg, males often being much larger than females';
data.Wwim = 600e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight'; bibkey.Wwim = 'ADW';
  comment.Wwi = 'ADW: 300 till 690 kg, males often being much larger than females';
  
data.Ri  = 1/2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
tWw_mf = [ ... % time since birth (d), weight (kg), males, females
  0  36.17  32.92
 30  50.88  51.63
 60  68.79  67.97
 90  97.66  96.00
120 109.21 109.05
150 130.67 127.58
180 141.25 139.95
210 149.67 157.37
240 154.67 165.63
270 153.50 174.47
300 152.17 165.74
330 152.33 165.74
360 154.08 154.90
420 178.21 170.74];
data.tW_fm = tWw_mf(:,[1 3 2]); data.tW_fm(:,[2 3]) = data.tW_fm(:,[2 3])*1e3; % convert kg to g
units.tW_fm  = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'}; 
temp.tW_fm  = C2K(38);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'ZhaoXue2000'; treat.tW_fm = {1, {'female', 'male'}};
 units.treat.tW_fm = '-'; label.treat.tW_fm = 'gender';
comment.tW_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = weights.tW_fm * 5; 
weights.Wwi = weights.Wwi * 3; 
weights.Wwim = weights.Wwim * 0; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Body temperature is copied from Lama';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_1: the large difference in ultimate weight between males and females is inconsistent with tW data, Wwim is ignored';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = 'Q9XC'; % Cat of Life
metaData.links.id_ITIS = '625026'; % ITIS
metaData.links.id_EoL = '344581'; % Ency of Life
metaData.links.id_Wiki = 'Camelus_bactrianus'; % Wikipedia
metaData.links.id_ADW = 'Camelus_bactrianus'; % ADW
metaData.links.id_Taxo = '67766'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200112'; % MSW3
metaData.links.id_AnAge = 'Camelus_bactrianus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Camelus_bactrianus}}';
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
bibkey = 'ZhaoXue2000'; type = 'Article'; bib = [ ... 
'author = {X.X. Zhao and H.W. Xue and Q.C. Nie and Y.K. Zhang}, ' ... 
'year = {2000}, ' ...
'title = {Postnatal growth and development pattern of camel calves}, ' ...
'journal = {Revue \''{E}lev. M\\{e}d. v\''{e}t. Pays trop.}, ' ...
'volume = {53}, ' ...
'pages = {201--208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Camelus_bactrianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Camelus_bactrianus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

