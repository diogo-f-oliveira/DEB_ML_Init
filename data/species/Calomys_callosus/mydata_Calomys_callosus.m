function [data, auxData, metaData, txtData, weights] = mydata_Calomys_callosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Calomys_callosus'; 
metaData.species_en = 'Large vesper mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
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

data.tg = 21;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'MorrDiet1976';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 22;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 51.5;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(36.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.7;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MorrDiet1977';
data.Wwi = 48;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MorrDiet1977';
data.Wwim = 49; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'MorrDiet1977';

data.Ri  = 3*3/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'MorrDiet1976';   
  temp.Ri = C2K(36.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 pups per litter; 3 litters per yr assumed';
   
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
    0  2.8
    1  5.8
    2  8.7
    3 13.5
    4 17.9
    8 21.8
   12 25.6
   16 29.9
   20 33.4
   24 36.0
   28 38.4
   32 39.2
   36 40.8
   40 42.4
   44 46.5];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36.6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'MorrDiet1977';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
    0  2.7
    1  5.5
    2  8.7
    3 13.1
    4 17.8
    8 22.2
   12 26.3
   16 30.3
   20 33.7
   24 36.9
   28 41.2
   32 44.6
   36 46.9
   40 47.5
   44 48.6
   48 49.6
   52 49.9
   56 49.5
   60 48.6
   64 47.6];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(36.6);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
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
metaData.links.id_CoL = 'PYL2'; % Cat of Life
metaData.links.id_ITIS = '633094'; % ITIS
metaData.links.id_EoL = '1179872'; % Ency of Life
metaData.links.id_Wiki = 'Calomys_callosus'; % Wikipedia
metaData.links.id_ADW = 'Calomys_callosus'; % ADW
metaData.links.id_Taxo = '88780'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000616'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calomys_callosus}}';
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
bibkey = 'MorrDiet1977'; type = 'Article'; bib = [ ... 
'doi = {10.1086/physzool.50.4.30155733}, ' ...
'author = {Morrison, P. and Dieterich, R. and Preston, D.}, ' ... 
'year = {1977}, ' ...
'title = {Body Growth in Sixteen Rodent Species and Subspecies Maintained in Laboratory Colonies}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {50(4)}, ' ...
'pages = {294–310}'];
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

