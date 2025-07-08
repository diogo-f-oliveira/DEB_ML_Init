function [data, auxData, metaData, txtData, weights] = mydata_Cephalophus_sylvicultor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Cephalophus_sylvicultor'; 
metaData.species_en = 'Yellow-backed duiker'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs'};
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

data.tg = 165;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 95;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BarnGree2002';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 10.5*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '9 till 12 mnth';
data.tpm = 15*30.5; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(39.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = '12 till 18 mnth';
data.am = 22.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3650;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'BarnGree2002';
  comment.Wwb = 'AnAge: 2.4 kg';
data.Wwbm = 3650;  units.Wwbm = 'g';  label.Wwbm = 'wet weight at birth for male';      bibkey.Wwbm = 'BarnGree2002';
data.Wwi = 75e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '60 till 80 kg, females a bit heavier than males';
data.Wwim = 65e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';
  comment.Wwi = '60 till 80 kg, females a bit heavier than males';

data.Ri  = 1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 or 2 calves per litter, 1 litter per yr';
  
% uni-variate data
% time-weight
data.tW_m = [ ... % time since birth (d), wet weight (g)
  0  3650
  7  4100
 30  6600];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight'};  
temp.tW_m    = C2K(39.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BarnGree2002';
subtitle.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = 10 * weights.tW_m;
weights.Wwbm = 10 * weights.Wwbm;

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
txtData.subtitle = subtitle;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Slow foetal development is assumed';     
D3 = 'Body temperature is guessed, based on Antidorcas';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '5GB5F'; % Cat of Life
metaData.links.id_ITIS = '183849'; % ITIS
metaData.links.id_EoL = '53698668'; % Ency of Life
metaData.links.id_Wiki = 'Cephalophus_sylvicultor'; % Wikipedia
metaData.links.id_ADW = 'Cephalophus_sylvicultor'; % ADW
metaData.links.id_Taxo = '68297'; % Taxonomicon
metaData.links.id_MSW3 = '14200891'; % Mammal Spec World
metaData.links.id_AnAge = 'Cephalophus_silvicultor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephalophus_sylvicultor}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cephalophus_sylvicultor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

