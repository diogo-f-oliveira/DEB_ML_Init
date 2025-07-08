function [data, auxData, metaData, txtData, weights] = mydata_Cephalophus_zebra
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Cephalophus_zebra'; 
metaData.species_en = 'Zebra duiker'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
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

data.tg = 227;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Wiki: 221 till 229 d';
data.tx = 100;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BarnGree2002';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment. tx = '95 till 111 d';
data.tp = 10.5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 9 till 12 mnth';
data.tpm = 15*30.5; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(39.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tp = 'Wiki: 12 till 18 mnth';
data.am = 13*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1450;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'BarnGree2002';
  comment.Wwb = '1.27 till 1.55 kg; AnAge: 1708 g';
data.Wwbm = 1450;  units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';      bibkey.Wwbm = 'BarnGree2002';
  comment.Wwbm = '1.3 till 1.75 kg; AnAge: 1708 g';
data.Wwi = 17.5e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'AnAge';
data.Wwim = 17e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'AnAge';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
 0 1500
 0 1270
 0 1550
 3 1300
 6 2200 
 7 2250
27 2950
41 4450];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BarnGree2002';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
  0  1300
  0  1590
  0  1550
  0  1750
  5  2350
  7  1640
  7  1830
  7  1950
 41  4170
 44  4400
 44  3740
 60  6020
 61  4160
105  9100
122  9900
183  8200];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BarnGree2002';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m(end) = 0; % ignore last data point

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.v = 5 * weights.psd.v;

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
metaData.links.id_CoL = 'SDRW'; % Cat of Life
metaData.links.id_ITIS = '183851'; % ITIS
metaData.links.id_EoL = '328710'; % Ency of Life
metaData.links.id_Wiki = 'Cephalophus_zebra'; % Wikipedia
metaData.links.id_ADW = 'Cephalophus_zebra'; % ADW
metaData.links.id_Taxo = '68299'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200902'; % MSW3
metaData.links.id_AnAge = 'Cephalophus_zebra'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephalophus_zebra}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cephalophus_zebra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

