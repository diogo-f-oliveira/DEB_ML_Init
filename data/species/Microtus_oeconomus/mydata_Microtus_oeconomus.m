function [data, auxData, metaData, txtData, weights] = mydata_Microtus_oeconomus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_oeconomus'; 
metaData.species_en = 'Tundra vole'; 

metaData.ecoCode.climate = {'Dfc', 'ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2018 01 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 22;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 19;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 30;    units.tp = 'd';    label.tp = 'time since birth at puberty for female';   bibkey.tp = 'AnAge';
  temp.tp = C2K(38.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 48;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male';   bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data from Dicrostonyx_groenlandicus';

data.Wwb = 2.9;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 27;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 40; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'AnAge';

data.Ri  = 7*3.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 pups per litter; 3.5 litters per yr';

% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
    0  2.9
    1  6.7
    2 11.4
    3 16.2
    4 20.4
    8 21.5
   12 22.8
   16 22.9
   20 23.6
   24 23.4
   28 24.2
   32 24.7
   36 25.5
   40 26.4
   44 26.8
   48 27.2];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(37);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'MorrDiet1977';
comment.tWw_f = 'Data for females M. o. operarius';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
    0  2.8
    1  7.0
    2 12.0
    3 16.6
    4 21.9
    8 26.6
   12 27.9
   16 29.1
   20 30.2
   24 32.1
   28 32.9
   32 32.4
   36 33.4
   40 35.2
   44 37.9
   48 36.0
   52 35.5
   56 35.3
   60 38.6
   64 40.9
   68 40.7];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(37);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'MorrDiet1977';
comment.tWw_m = 'Data for males M. o. operarius';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '7VV7K'; % Cat of Life
metaData.links.id_ITIS = '180298'; % ITIS
metaData.links.id_EoL = '1037789'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_oeconomus'; % Wikipedia
metaData.links.id_ADW = 'Microtus_oeconomus'; % ADW
metaData.links.id_Taxo = '62707'; % Taxonomicon
metaData.links.id_MSW3 = '13000287'; % Mammal Spec World
metaData.links.id_AnAge = 'Microtus_oeconomus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_oeconomus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dicrostonyx_torquatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Microtus_oeconomus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

