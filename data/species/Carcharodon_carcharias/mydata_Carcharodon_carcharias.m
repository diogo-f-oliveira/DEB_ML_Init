function [data, auxData, metaData, txtData, weights] = mydata_Carcharodon_carcharias

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Lamnidae';
metaData.species    = 'Carcharodon_carcharias'; 
metaData.species_en = 'Great white shark'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf', 'biCvb', 'biCvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2011 09 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'}; 

metaData.author_mod_1   = {'Bas Kooijman'};                             
metaData.date_mod_1     = [2011 09 22];                          
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 04];

%% set data
% zero-variate data;
data.ab = 330;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';    
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 33*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 73*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 140;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';
data.Lp = 475;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
  comment.Lp = 'for female, for male: 375 cm';
data.Li = 640;     units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki'; 
  comment.Li = 'for female'; 

data.Wwb = 35000;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwp = 578700; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Wiki';
data.Wwi = 3324000;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki'; 
  comment.Wwi = 'for females';
  
data.Ri  = 10/5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assumed: one litter each 5 yrs';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
0	151.828 127.868
1	243.243 197.096
2	298.887 241.672
3	334.658 288.645
4	372.019 319.708
5	400.636 342.034
6	429.253 371.511
7   NaN     385.092
8   NaN     397.876
9   NaN     412.250
10  NaN     424.241
11  NaN     436.232];
data.tL_fm(:,1) = 365*(data.tL_fm(:,1) + 0); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(22);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TanaKita2011'; treat.tL_fm = {1 {'female','male'}};
comment.tL_fm = 'Data from 2 individuals';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
weights.Ri = 3 * weights.Ri;
weights.tp = 0 * weights.tp;
weights.Lb = 5 * weights.Lb;
weights.Wwb = 0 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: tL data added; data reviewed';
D3 = 'ab was found to be 1 yr longer that the reported 11 mnth by fishbase; cf the sawfish-species and the greenland shark';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'mother feeds young in uterus with unfertilised eggs; oophagy occurs';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'muscle temp = envir temp + 4; fishbase: preferred temp = 18.1 C';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'length-weight: Ww in g  = 0.00871*(TL in cm)^3.05';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '5WZLF'; % Cat of Life
metaData.links.id_ITIS = '159903'; % ITIS
metaData.links.id_EoL = '46559751'; % Ency of Life
metaData.links.id_Wiki = 'Carcharodon_carcharias'; % Wikipedia
metaData.links.id_ADW = 'Carcharodon_carcharias'; % ADW
metaData.links.id_Taxo = '41903'; % Taxonomicon
metaData.links.id_WoRMS = '105838'; % WoRMS
metaData.links.id_fishbase = 'Carcharodon-carcharias'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharodon_carcharias}}';   
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
bibkey = 'CailNata1985'; type = 'Article'; bib = [ ...  
'author = {Cailliet, G. M. and Natanson, L. J. and Welden, B. A. and Ebert, D. A.}, ' ...
'year = {1985}, ' ...
'title  = {Preliminary studies on the age and growth of the white shark, \emph{Carcharodon carcharias}, using vertebral bands.}, ' ...
'journal = {Memoirs of the Southern California Academy of Sciences}, ' ...
'volume = {9}, ' ...
'pages = {49B60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fran1996'; type = 'Incollection'; bib = [ ...  
'author = {Francis, M. P.}, ' ...
'year = {1996}, ' ...
'title  = {Observations on a pregnant white shark with a review of reproductive biology.}, ' ...
'booktitle = {Great White Sharks}, ' ...
'publisher = {Academic Press}, ' ...
'editor = {A.P. Klimley and D.G. Ainley}, ' ...
'pages = {157--172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UnchToda1996'; type = 'Article'; bib = [ ...  
'author = {Uchida, S. and Toda, M.}, ' ...
'year = {1996}, ' ...
'title  = {Records of pregnant white sharks from {J}apanese waters.}, ' ...
'journal = {Kaiyo Monthly}, ' ...
'volume = {28}, ' ...
'pages = {371--379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UnchToda1996a'; type = 'Incollection'; bib = [ ...  
'author = {Uchida, S. and Toda, M. and Teshima, K. and Yano, K.}, ' ...
'year = {1996}, ' ...
'title  = {Pregnant white sharks and full-term embryos from Japan.}, ' ...
'booktitle = {Great White Sharks; The Biology of \emph{Carcharodon carcharias}.}, ' ...
'editor = {A.P. Klimley and D.G. Ainley}, ' ...
'publisher = {Academic Press, San Diego}, ' ...
'pages = {139--155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UnchYasu1987'; type = 'Article'; bib = [ ...  
'author = {Uchida, S. and Yasuzumi, F. and Toda, M. and Okura, N.}, ' ...
'year = {1987}, ' ...
'title  = {On the observations of reproduction in \emph{Carcharodon carcharias} and \emph{Isurus oxyrinchus} (abstract).}, ' ...
'journal = {Report of the Japanese Group for Elasmobranch Studies}, ' ...
'volume = {24}, ' ...
'pages = {5--\6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TanaKita2011'; type = 'Article'; bib = [ ...  
'doi = {10.1071/MF10130}, ' ...
'author = {S. Tanaka and T. Kitamura and T. Mochizukiand K. Kofuji}, ' ...
'year = {2011}, ' ...
'title  = {Age, growth and genetic status of the white shark (\emph{Carcharodon carcharias}) from {K}ashima-nada, {J}apan}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {62}, ' ...
'pages = {548–556}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

