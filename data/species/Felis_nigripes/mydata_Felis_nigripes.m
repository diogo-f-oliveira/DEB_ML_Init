function [data, auxData, metaData, txtData, weights] = mydata_Felis_nigripes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Felis_nigripes'; 
metaData.species_en = 'Black-footed cat'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri';'JXi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 05];              
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

data.tg = 66;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 32;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '30 till 35 d';
data.tp = 445;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 434;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15.6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 82;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Arms1975';
data.Wwi = 1.65e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';  
data.Wwim = 2.45e3;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';  

data.Ri  = 2*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2  per litter, 4 litters per yr';

data.JXi  = 250;   units.JXi  = 'g/d'; label.JXi  = 'maximum food intake rate';    bibkey.JXi  = 'Wiki';   
  temp.JXi = C2K(37.9);  units.temp.JXi = 'K'; label.temp.JXi = 'temperature';

% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), body weight (g)
      0   82.5
      2  106.5
      7  151
      9  180
     14  215
     27  235
     35  290
     48  440
     58  550
     90  820
    105  800
    107  890
    110  990
    113 1060
    119  960
    125 1260
    131 1160
    138 1230
    142 1280
    153 1300
    156 1300
    168 1390
    190 1480
    219 1580
    311 1680
    344 1695];
units.tW_f = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f  = C2K(37.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Arms1975';
comment.tW_f = 'data for a female kitten';
%
data.tW_m = [ ... % time (d), body weight (g)
      0   87.9
      2  106.8
      7  156
      9  181.7
     14  215
     27  280
     35  350
     48  490
     58  620
     90 1110
    105 1250
    107 1320
    113 1360
    119 1480
    125 1630
    131 1690
    142 1810
    153 1930
    190 2460
    219 2550
    311 2410
    344 2500];
units.tW_m = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m  = C2K(37.9);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Arms1975';
comment.tW_m = 'data for a male kitten';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3DXVM'; % Cat of Life
metaData.links.id_ITIS = '183800'; % ITIS
metaData.links.id_EoL = '328666'; % Ency of Life
metaData.links.id_Wiki = 'Felis_nigripes'; % Wikipedia
metaData.links.id_ADW = 'Felis_nigripes'; % ADW
metaData.links.id_Taxo = '168142'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000054'; % MSW3
metaData.links.id_AnAge = 'Felis_nigripes'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Felis_nigripes}}';
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
bibkey = 'Arms1975'; type = 'Article'; bib = [ ... 
'author = {Armstrong, J.}, ' ... 
'doi = {10.1111/j.1748-1090.1975.tb01414.x}, ' ...
'year = {1975}, ' ...
'title = {Hand-rearing Black-footed cats at the {N}ational {Z}oological {P}ark, {W}ashington}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {15}, ' ...
'pages = {245-249}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Felis_nigripes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Felis_nigripes/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

