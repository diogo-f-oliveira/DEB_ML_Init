function [data, auxData, metaData, txtData, weights] = mydata_Cephalophus_rufilatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Cephalophus_rufilatus'; 
metaData.species_en = 'Red-flanked duiker'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 8*30.5;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'Wiki';   
  temp.tg = C2K(39.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 95;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BarnGree2002';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '58 till 98 d';
data.tp = 9*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 9*30.5; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(39.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                           bibkey.am = 'Wiki';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 950;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'BarnGree2002';
  comment.Wwb = '0.81 till 1.10 kg';
data.Wwbm = 1000;  units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';      bibkey.Wwbm = 'BarnGree2002';
  comment.Wwbm = '0.82 till 1.70 kg';
data.Wwi = 14e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '12 till 14 kg';
data.Wwim = 14e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';
  comment.Wwi = '12 till 14 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf per litter, 1.4 litters per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
  0  1150
  0  1170
  0  1150
  0   820
  0  1050
  0   900
  0  1000
  0  1150
  0  1050
  0  1000
  7  1200
  7  1350
  7  1400
  7  1400
  7  1350
  7  1550
  7  1570
  7  1150
 12  1560
 26  2350
 27  2350
 31  2500
 35  1250
 37  2850
 42  2450
 42  2500
 42  3350
 53  3150
 57  4500
 86  5500
152  7800
335  9300
396  9700];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BarnGree2002';
comment.tW_f = 'data for females';
% 
data.tW_m = [ ... % time since birth (d), wet weight (g)
   0   765
   0  1150
   0  1050
   0  1100
   0   900
   0   850
   0   906
   0   850
   0   950
   5   850
   7   836
   7  1440
   7  1240
   7  1550
   7  1200
   7  1100
   7  1200
  12  1350
  21  1850
  30  2200
  37  2900
  42  1162
  42  3240
  42  2200
  42  2800
  56  2700
  69  4620
  72  1446
  76  9975
  92  1587
 397  9700];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BarnGree2002';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 5; 
weights.tW_m = weights.tW_m * 5; 
weights.tW_m(end-2) = 0; % ignore outlier

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Slow foetal development is assumed';     
D3 = 'Body temperature is guessed, based on Antidorcas';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'SDRS'; % Cat of Life
metaData.links.id_ITIS = '625172'; % ITIS
metaData.links.id_EoL = '328721'; % Ency of Life
metaData.links.id_Wiki = 'Cephalophus_rufilatus'; % Wikipedia
metaData.links.id_ADW = 'Cephalophus_rufilatus'; % ADW
metaData.links.id_Taxo = '68295'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200891'; % MSW3
metaData.links.id_AnAge = 'Cephalophus_rufilatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephalophus_rufilatus}}';
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
bibkey = 'BarnGree2002'; type = 'Article'; bib = [ ... 
'author = {R. Barnes and K. Greene and J. Holland and M. Lamm}, ' ... 
'year = {2002}, ' ...
'title = {Management and Husbandry of Duikers at the Los Angeles Zoo}, ' ...
'journal = {Zoo biology}, ' ...
'volume = {21}, ' ...
'pages = {107-121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cephalophus_rufilatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

