function [data, auxData, metaData, txtData, weights] = mydata_Lemmus_sibiricus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Lemmus_sibiricus'; 
metaData.species_en = 'West Siberian lemming'; 

metaData.ecoCode.climate = {'Dfc','ET'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 19;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Lemmus lemmus';
data.tx = 15;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Lemmus lemmus';
data.tp = 24;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lemmus lemmus';
data.am = 3.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Lemmus lemmus';
  
data.Wwb = 4.1;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MorrDiet1977';
data.Wwi = 70;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MorrDiet1977';
data.Wwim = 80; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'MorrDiet1977';

data.Ri  = 2.7*7/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 pups per litter; 2.5 litters per yr, based on Lemmus lemmus';
   
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
    0  4.0
    1  8.0
    2 13.0
    3 17.8
    4 24.0
    8 31.5
   12 37.6
   16 41.9
   20 45.7
   24 48.6
   28 52.3
   32 57.8
   36 59.7
   40 63.6
   44 64.7
   48 69.4];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(37.8);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'MorrDiet1977';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
    0  4.3
    1  8.1
    2 13.2
    3 19.2
    4 24.3
    8 33.8
   12 40.2
   16 45.5
   20 49.7
   24 51.5
   28 55.6
   32 60.8
   36 67.9
   40 71.5
   44 74.2
   48 72.3
   52 70.7
   56 69.5
   60 71.8
   64 76.0
   68 80.5];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(37.8);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'MorrDiet1977';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

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
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3T4R9'; % Cat of Life
metaData.links.id_ITIS = '971090'; % ITIS
metaData.links.id_EoL = '328419'; % Ency of Life
metaData.links.id_Wiki = 'Lemmus_sibiricus'; % Wikipedia
metaData.links.id_ADW = 'Lemmus_sibiricus'; % ADW
metaData.links.id_Taxo = '62591'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000235'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lemmus_sibiricus}}';
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
bibkey = 'MorrDiet1976'; type = 'Article'; bib = [ ... 
'doi = {10.1086/physzool.50.4.30155733}, ' ...
'author = {Morrison, P. and Dieterich, R. and Preston, D.}, ' ... 
'year = {1976}, ' ...
'title = {Breeding and reproduction of fifteen wild rodents maintained as laboratory colonies}, ' ...
'journal = {Lab Anim Sci.}, ' ...
'volume = {26}, ' ...
'pages = {237-243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lemmus_lemmus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

