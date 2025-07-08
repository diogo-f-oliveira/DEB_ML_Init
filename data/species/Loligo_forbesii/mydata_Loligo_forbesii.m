function [data, auxData, metaData, txtData, weights] = mydata_Loligo_forbesii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Loligo_forbesii'; 
metaData.species_en = 'Veined squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA','MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab_T'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.ab12 = 60;   units.ab12 = 'd';    label.ab12 = 'age at hatching';      bibkey.ab12 = 'PierHast2015';   
  temp.ab12 = C2K(12); units.temp.ab12 = 'K'; label.temp.ab12 = 'temperature'; 
data.ab16 = 36;   units.ab16 = 'd';    label.ab16 = 'age at hatching';      bibkey.ab16 = 'PierHast2015';   
  temp.ab16 = C2K(16); units.temp.ab16 = 'K'; label.temp.ab16 = 'temperature'; 
data.am = 550;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'RochGuer1999';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.37;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'PierHast2015';
data.Lp  = 19;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'PierHast2015';
data.Lpm  = 22.5;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for males';       bibkey.Lpm  = 'PierHast2015';
data.Li  = 46.2;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'PierHast2015';
data.Lim = 93.7; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'PierHast2015';

data.Wwi  = 2200; units.Wwi  = 'g'; label.Wwi  = 'wet weight at death'; bibkey.Wwi  = 'PierHast2015';
data.Wwim = 8300; units.Wwim  = 'g'; label.Wwim  = 'wet weight at death for males'; bibkey.Wwim  = 'PierHast2015';

data.Ni  = 1e5; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'ADW';   
  temp.Ni = C2K(18); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
322.177	10.503
332.541	11.564
333.874	13.692
342.925	13.688
345.551	15.816
350.689	13.951
361.068	15.809
367.509	14.476
371.481	19.531
371.501	20.596
379.299	22.721
384.432	20.590
398.656	20.584
398.725	24.310];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RochGuer1999';
comment.tL_f = 'data for females, hathed in autumn'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
299.352	14.637
320.086	20.474
335.637	27.913
368.035	48.911
371.922	44.649
375.810	49.436
378.402	38.787
434.125	63.225];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RochGuer1999';
comment.tL_m = 'data for males, hathed in autumn'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Wwim = 3 * weights.Wwim; 
weights.Wwi = 3 * weights.Wwi; 
weights.am = 3 * weights.am; 
%weights.ab12 = 3 * weights.ab12; 
%weights.ab16 = 3 * weights.ab16; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VVS9'; % Cat of Life
metaData.links.id_ITIS = '82374'; % ITIS
metaData.links.id_EoL = '448890'; % Ency of Life
metaData.links.id_Wiki = 'Loligo_forbesii'; % Wikipedia
metaData.links.id_ADW = 'Loligo_forbesii'; % ADW
metaData.links.id_Taxo = '157903'; % Taxonomicon
metaData.links.id_WoRMS = '140270'; % WoRMS
metaData.links.id_molluscabase = '140270'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Loligo_forbesii}}';
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
bibkey = 'RochGuer1999'; type = 'article'; bib = [ ... 
'author = {F. Rocha and A. Guerra}, ' ... 
'year = {1999}, ' ...
'title = {Age and growth of two sympatric squid \emph{Loligo vulgaris} and \emph{Loligo forbesi}, in {G}alician waters (north-west {S}pain)}, ' ...
'journal = {J.Mar. Biol. Ass.U.K.}, ' ...
'volume = {79}, ' ...
'pages = {697-707}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PierHast2015'; type = 'incollection'; bib = [ ... 
'author = {Graham J. Pierce and Lee C. Hastie and Evgenia Lefkaditou and A. Louise Allcock and Jennifer and M. Smith and Sansanee Wangvoralak and Patrizia Jereb}, ' ... 
'year = {2015}, ' ...
'title = {\emph{Loligo forbesii} {S}teenstrup, 1856}, ' ...
'booktitle = {Cephalopod biology and fisheries in Europe: II. Species Accounts}, ' ...
'editor = {Patrizia Jereb and A. Louise Allcock and Evgenia Lefkaditou and Uwe Piatkowski and Lee C. Hastie and Graham J. Pierce}, ' ...
'publisher = {ICES Cooperative Research Report}, ' ...
'number = {325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Loligo-forbesii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Loligo_forbesii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

