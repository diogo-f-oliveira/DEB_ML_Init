function [data, auxData, metaData, txtData, weights] = mydata_Parascalops_breweri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Talpidae';
metaData.species    = 'Parascalops_breweri'; 
metaData.species_en = 'Hairy-tailed mole'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh','0iTf','0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'a-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 07 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 5*7;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '4-6 w d';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 10.5*30.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'EoL';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Talpa europaea, Eol gives 6.69 g';
data.Wwx = 34.8;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'EoL';
data.Wwi = 50;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Wiki';
  comment.Wwi = 'ADW: 40-85 g; based on remark that females are lighter than males';
data.Wwim = 65;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';       bibkey.Wwim = 'Wiki';
  comment.Wwim = 'ADW: 40-85 g; based on remark that females are lighter than males';

data.Ri  = 4.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-5 pups per litter, 1 litter per yr';
  
% univariate data
% time-weight
data.tWw_f = [ ... % time (d), wet weight (g)
  0	38.746
 59	41.112
 91	43.503
150	44.163
300	46.612];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'}; 
temp.tWw_f = C2K(38.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Eadi1939';
comment.tWw_f = 'data for females; mean value of catches in tunnel in time';
%
data.tWw_m = [ ... % time (d), wet weight (g)
  0	43.235
 59	45.046
 91	50.071
150	52.215
300	54.219];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'}; 
temp.tWw_m = C2K(38.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Eadi1939';
comment.tWw_m = 'data for males; mean value of catches in tunnel in time'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = weights.tWw_f * 3;
weights.tWw_m = weights.tWw_m * 3;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'body temperature based on Talpa europaea';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '762F6'; % Cat of Life
metaData.links.id_ITIS = '179977'; % ITIS
metaData.links.id_EoL = '327374'; % Ency of Life
metaData.links.id_Wiki = 'Parascalops_breweri'; % Wikipedia
metaData.links.id_ADW = 'Parascalops_breweri'; % ADW
metaData.links.id_Taxo = '61317'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700634'; % MSW3
metaData.links.id_AnAge = 'Parascalops_breweri'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parascalops_breweri}}';
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
bibkey = 'Eadi1939'; type = 'Article'; bib = [ ... 
'author = {W. Robert Eadie}, ' ... 
'year = {1939}, ' ...
'title = {A Contribution to the Biology of \emph{Parascalops breweri}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {20}, ' ...
'number = {2}, ' ...
'pages = {150-173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Parascalops_breweri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/327374/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

