function [data, auxData, metaData, txtData, weights] = mydata_Spilogale_putorius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mephitidae';
metaData.species    = 'Spilogale_putorius'; 
metaData.species_en = 'Eastern spotted skunk'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh','0iTi','0iTs','0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 10 30]; 

%% set data
% zero-variate data

data.tg = 31;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 50;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 152;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10.5*65;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 160;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'AnAge';
data.Wwi = 965;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 5*1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 cups per litter, 1.5 litters per yr';

% uni-variate data

% time-length data
data.tL_f = [ ... % time (d), total length (cm)
    0  10
   14  16.4
   28  22.9
   32  23.2
   36  25.3
   42  27.4
   46  28.5
   54  30.5
   59  36.5
   68  39.5
   82  41.4
  104  46.4];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(36.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Crab1944';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (d), total length (cm)
    7  12.1
   28  22.9
   28  21.6
   32  23.0
   32  23.5
   36  25.4
   36  25.4
   42  27.9
   42  27.9
   46  28.9
   46  27.9
   54  32.7
   54  31.1
   59  36.5
   59  35.1
   68  39.5
   68  39.5
   82  42.0
   82  41.5
  104  48.3
  104  45.8];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(36.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Crab1944';
comment.tL_m = 'Data for males';

% time-weight data
data.tW_f = [ ... % time (d), weight (g)
    0   9.5
   14  45. % alcohol preserved
   28 116.5
   32 128
   36 156
   46 182
   54 262
   59 287
   68 339
   82 303
  104 449];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f   = C2K(36.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Crab1944';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), weight (g)
    7  22.5
   28 127
   28 117
   32 141
   32 130
   36 154
   36 153
   46 177
   46 170
   54 266
   54 262
   59 309
   59 289
   68 339
   68 360
   82 431
   82 338
  104 632
  104 549];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m   = C2K(36.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Crab1944';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4Z3P6'; % Cat of Life
metaData.links.id_ITIS = '180570'; % ITIS
metaData.links.id_EoL = '328597'; % Ency of Life
metaData.links.id_Wiki = 'Spilogale_putorius'; % Wikipedia
metaData.links.id_ADW = 'Spilogale_putorius'; % ADW
metaData.links.id_Taxo = '66785'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001587'; % MSW3
metaData.links.id_AnAge = 'Spilogale_putorius'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spilogale_putorius}}';
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
bibkey = 'Crab1944'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1374698}, ' ...
'author = {Crabb, W. D.}, ' ... 
'year = {1944}, ' ...
'title = {Growth, Development and Seasonal Weights of Spotted Skunks}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {25(3)}, ' ...
'pages = {213-221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Spilogale_putorius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

