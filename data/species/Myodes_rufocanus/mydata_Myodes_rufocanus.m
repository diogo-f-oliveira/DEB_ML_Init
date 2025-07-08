function [data, auxData, metaData, txtData, weights] = mydata_Myodes_rufocanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Myodes_rufocanus'; 
metaData.species_en = 'Grey red-backed vole'; 

metaData.ecoCode.climate = {'Dfc','Dfd'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2022 06 21];              
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

data.tg = 18.5;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'KaneNaka1998';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp based on Myodes glareolus';
data.tx = 17;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'KaneNaka1998';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 45;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'KaneNaka1998';
  temp.tp = C2K(36.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '30-60 d';
data.am = 3.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.6); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Myodes glareolus';
  
data.Wwb = 2;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KaneNaka1998';
data.Wwx = 10;  units.Wwx = 'g';     label.Wwx = 'wet weight at waening';     bibkey.Wwx = 'AnAge';
data.Wwp = 22.5; units.Wwp = 'g';     label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'KaneNaka1998';
  comment.Wwp = '22-23 g';

data.Ri  = 5.5*3/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'KaneNaka1998','AnAge'};   
  temp.Ri = C2K(36.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-7 pups per litter; 3 litters per yr assumed';
   
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
 20	12.791 % Ia (age class)
 36	19.392 % Ib
 51	22.343 % Ic
 58	24.383 % II
 73	24.222 % III
101	25.188 % IV
123	24.812 % V
210	28.676 % 32 (root-ratio)
240	32.594 % 32
300	37.102 % 33-54
360	35.975 % 55
];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36.6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'Abe1976';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
 20	12.952 % Ia (age class)
 36	21.753 % Ib
 51	23.202 % Ic
 58	24.758 % II
 73	25.295 % III
101	26.530 % IV
123	26.744 % V
210	29.267 % 32 (root-ratio)
240	38.283 % 32
300	38.766 % 33-54
360	40.376 % 55
];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(36.6);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'Abe1976';
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
D2 = 'food availability is assumed to vary in time';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '454QD'; % Cat of Life
metaData.links.id_ITIS = '970617'; % ITIS
metaData.links.id_EoL = '1179605'; % Ency of Life
metaData.links.id_Wiki = 'Myodes_rufocanus'; % Wikipedia
metaData.links.id_ADW = 'Myodes_rufocanus'; % ADW
metaData.links.id_Taxo = '62606'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000316'; % MSW3
metaData.links.id_AnAge = 'Myodes_rufocanus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myodes_rufocanus}}';
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
bibkey = 'Abe1976'; type = 'Article'; bib = [ ... 
'doi = {10.18960/seitai.26.4_221}, ' ...
'author = {Hisashi Abe}, ' ... 
'year = {1976}, ' ...
'title = {AGE DETERMINATION OF \emph{Clethrionomys rufocanus bedfordiae} ({T}HOMAS)}, ' ...
'journal = {Jap．J．Ecol.’}, ' ...
'volume = {26}, ' ...
'pages = {221− 227}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KaneNaka1998'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf02765219}, ' ...
'author = {Kaneko, Y. and Nakata, K. and Saitoh, T. and Stenseth, N. C. and Bj{\o}rnstad, O. N.}, ' ... 
'year = {1998}, ' ...
'title = {The biology of the vole \emph{Clethrionomys rufocanus}: A review}, ' ...
'journal = {Researches on Population Ecology}, ' ...
'volume = {40(1)}, ' ...
'pages = {21–37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Myodes_rufocanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

