function [data, auxData, metaData, txtData, weights] = mydata_Meles_meles

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Meles_meles'; 
metaData.species_en = 'Badger'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCiw', 'xiSv', 'xiHs', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 01 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 49;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for females';
data.am = 18.6*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 12;   units.Lb  = 'cm';  label.Lb  = 'head-body length at birth'; bibkey.Lb  = 'Wiki';
data.Li  = 90;   units.Li  = 'cm';  label.Li  = 'ultimate head-body length'; bibkey.Li  = 'Wiki';
  comment.Li = 'Wiki: 60-90 cm; tail 12-24 cm';

data.Wwb = 80;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwi = 13000;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: till 27.2 kg';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
tWfm = [..., % time since birth (d), body weight (g) female, male
  0   90   92
 16  310  320
 31  602  640
 48  920  980
 80 2200 2500
160    1 9150];
data.tW_f = tWfm(1:5,[1 2]);
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(37);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GucwGucw1968';
comment.tW_f = 'Data for females';
%
data.tW_m = tWfm(:,[1 3]);
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(37);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GucwGucw1968';
comment.tW_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  


%% Facts
F1 = 'The implantation can be delayed and extend the gestation time up to one year.';
metaData.bibkey.F1 = 'AnAge'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZDRX'; % Cat of Life
metaData.links.id_ITIS = '621922'; % ITIS
metaData.links.id_EoL = '328046'; % Ency of Life
metaData.links.id_Wiki = 'Meles_meles'; % Wikipedia
metaData.links.id_ADW = 'Meles_meles'; % ADW
metaData.links.id_Taxo = '66751'; % Taxonomicon
metaData.links.id_WoRMS = '1465482'; % WoRMS
metaData.links.id_MSW3 = '14001283'; % MSW3
metaData.links.id_AnAge = 'Meles_meles'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Meles_meles}}';
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
bibkey = 'GucwGucw1968'; type = 'Article'; bib = [ ... 
'author = {Gucwinska, H. and Gucwinski, A.}, ' ... 
'year = {1969}, ' ...
'title = {A note on the development and growth of European badgers, \emph{Meles meles}, born at {W}roclaw {Z}oo}, ' ...
'journal = {The international zoo yearbook}, ' ...
'volume = {8}, ' ...
'number = {1}, '...
'pages = {133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Meles_meles}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

