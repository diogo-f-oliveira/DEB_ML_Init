function [data, auxData, metaData, txtData, weights] = mydata_Myodes_rutilus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Myodes_rutilus'; 
metaData.species_en = 'Northern red-backed vole'; 

metaData.ecoCode.climate = {'Dfc','Dwd','Dfd'};
metaData.ecoCode.ecozone = {'TH'};
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
etaData.date_acc  = [2021 11 15];              

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Myodes glareolus';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on Myodes glareolus';
data.tp = 47;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Myodes glareolus';
data.am = 4.9*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.6); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Myodes glareolus';
  
data.Wwb = 2.9;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MorrDiet1977';
data.Wwi = 29;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MorrDiet1977';
data.Wwim = 30; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'MorrDiet1977';

data.Ri  = 4.3*3/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'MorrDiet1976';   
  temp.Ri = C2K(36.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 pups per litter; 3 litters per yr assumed';
   
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
    0  2.9
    1  5.8
    2  9.9
    3 13.7
    4 17.0
    8 19.6
   12 21.9
   16 23.6
   20 24.9
   24 26.0
   28 27.5
   32 28.9
   36 30.4];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36.6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'MorrDiet1977';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
    0  3.0
    1  6.1
    2 10.2
    3 14.2
    4 17.4
    8 21.4
   12 23.5
   16 25.4
   20 26.3
   24 27.6
   28 28.1
   32 29.0
   36 29.3
   40 29.7
   44 29.9
   48 30.2
   52 29.9
   56 30.5
   60 30.2
   64 31.0
   68 31.1];
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
metaData.links.id_CoL = '743QT'; % Cat of Life
metaData.links.id_ITIS = '970618'; % ITIS
metaData.links.id_EoL = '1037785'; % Ency of Life
metaData.links.id_Wiki = 'Myodes_rutilus'; % Wikipedia
metaData.links.id_ADW = 'Myodes_rutilus'; % ADW
metaData.links.id_Taxo = '1684645'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000317'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myodes_rutilus}}';
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
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Myodes_glareolus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

