function [data, auxData, metaData, txtData, weights] = mydata_Panthera_tigris_tigris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Panthera_tigris_tigris'; 
metaData.species_en = 'Siberian tiger'; 

metaData.ecoCode.climate = {'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 08];              
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

data.tg = 105;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 121;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 35*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 54*30.5;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(37.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1190;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 160e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'typically 100 to 167 kg';
data.Wwim = 300e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';    bibkey.Wwim = 'Wiki';
  comment.Wwim = 'typically 180 to 306 kg; 465 kg';
  
data.Ri  = 2.5*0.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 pups per litter, 0.4 litters per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), female body weight (g)
 1  1600
 3  1550
 4  1620
 5  1680
 6  1700
 9  2200
11  2650
13  2927
23  3950
30  4640
37  4360
44  4900
52  6880
88 11850
 2   950
 3   980
 5  1000
 9  1620
16  1950
24  2700
30  3290
37  3850
45  4380
81  6750
98  8180
150 22000
 2  1200
 3  1230
 5  1400
 9  1800
16  2560
24  3360
30  4000
37  4550
45  5300
81  7580
98  9390
150 27000
 2  1390
 3  1500
 5  1570
 9  1800
16  2480
24  3160
30  3850
37  4390
45  5270
81  7100
98  8880
150 25000];
units.tW_f = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f  = C2K(37.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Vese1967';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time (d), male body weight (g)
 1  1610
 3  1580
 4  1690
 5  1740
 6  1870
 9  2160
11  2650
13  2960
23  3710
30  4570
37  4180
44  4800
52  6540
88 10400
 1  1300
 3  1330
 4  1420
 5  1460
 6  1580
 9  1940
11  2130
13  2540
23  3380
30  3900
37  3660
44  4200
52  6090
88 10760
 2  1100
 3  1250
 5  1380
 9  1730
16  2500
24  3150
30  3760
37  4450
45  5090
81  7000
98  8630
150 23000]; 
units.tW_m = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m  = C2K(37.9);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Vese1967';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tp = 3 * weights.tp;
weights.Wwim = 3 * weights.Wwim;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Fact
F1 = 'Largest subspecies of tiger and largest cat, also known Amur tiger';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5K5M9'; % Cat of Life
metaData.links.id_ITIS = '183806'; % ITIS
metaData.links.id_EoL = '328674'; % Ency of Life
metaData.links.id_Wiki = 'Panthera_tigris_tigris'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '67319'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000259'; % MSW3
metaData.links.id_AnAge = 'Panthera_tigris_tigris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Panthera_tigris}}';
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
bibkey = 'Vese1967'; type = 'Article'; bib = [ ... 
'author = {Veselovsky, Z.}, ' ... 
'doi = {10.1111/j.1748-1090.1967.tb00397.x}, ' ...
'year = {1967}, ' ...
'title = {The {A}mur tiger \emph{Panthera tigris altaica} in the wild and in captivity}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {7}, ' ...
'pages = {210-215}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Panthera_tigris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

