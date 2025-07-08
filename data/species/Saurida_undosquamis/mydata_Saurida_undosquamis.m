function [data, auxData, metaData, txtData, weights] = mydata_Saurida_undosquamis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Saurida_undosquamis'; 
metaData.species_en = 'Brushtooth lizardfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_W'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 28]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'fishbase';  
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19.8;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 48.9;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'YoneSaka2002';
data.Lim = 42.2;    units.Lim = 'cm';  label.Lim = 'ultimate total length for males';  bibkey.Lim = 'YoneSaka2002';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'HalfAmin2007';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwi = 849; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females';       bibkey.Wwi = 'YoneSaka2002';
  comment.Wwi = 'based on 0.0038*Li^3.1666';
data.Wwim = 532; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males';      bibkey.Wwim = 'YoneSaka2002';
  comment.Wwim = 'based on 0.0038*Li^3.1666';

data.R97 = 19856/365; units.R97 = '#/d';  label.R97 = 'reprod rate at 97 g'; bibkey.R97 = 'KadhMoha2013';
  temp.R97 = C2K(27); units.temp.R97 = 'K'; label.temp.R97 = 'temperature'; 
  comment.R97 = 'total spawner in Parangipettai waters';
data.R290 = 79282/365; units.R290 = '#/d';  label.R290 = 'reprod rate at 290 g'; bibkey.R290 = 'KadhMoha2013';
  temp.R290 = C2K(27); units.temp.R290 = 'K'; label.temp.R290 = 'temperature'; 
  comment.R290 = 'total spawner in Parangipettai waters';

% uni-variate data
% tL data for females
data.tL_f = [ ... % age (years) ~ fork length (cm) 
 1 14.4
 2 19.5
 3 22.6
 4 27.5
 5 30.8
 6 33.1
 7 36.2
 8 37.9
 9 40.1
10 40.4
11 41.8];
data.tL_f(:,1) = 365 * (.6 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YoneSaka2002';
comment.tL_f = 'data for females';
% tL data for males
data.tL_m = [ ... % age (years) ~ fork Length (cm) 
1 11.8
2 18.4
3 21.6
4 24.0
5 26.7
6 28.9
7 30.3
8 34.3
9 35.9];
data.tL_m(:,1) = 365 * (.6 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YoneSaka2002';
comment.tL_m = 'data for males';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Peferred temperature 27 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'weight (g)-length (cm): 0.0038*L^3.1666';
metaData.bibkey.F2 = 'HalfAmin2007'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6XQ8D'; % Cat of Life
metaData.links.id_ITIS = '162417'; % ITIS
metaData.links.id_EoL = '46563965'; % Ency of Life
metaData.links.id_Wiki = 'Saurida_undosquamis'; % Wikipedia
metaData.links.id_ADW = 'Saurida_undosquamis'; % ADW
metaData.links.id_Taxo = '154128'; % Taxonomicon
metaData.links.id_WoRMS = '126371'; % WoRMS
metaData.links.id_fishbase = 'Saurida-undosquamis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saurida_undosquamis}}';
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
bibkey = 'YoneSaka2002'; type = 'article'; bib = [ ...
'author = {M. Yoneda and T. Sakai and M. Tokimura and H. Horikawa and M. Matsuyama}, ' ... 
'year   = {2002}, ' ...
'title  = {Age and growth of the lizardfish \emph{Saurida sp.} 1 in the {E}ast {C}hina Sea using otolith ring marks}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {231-238}, ' ...
'volume = {55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KadhMoha2013'; type = 'article'; bib = [ ...
'author = {Kadharsha, K. and Mohanchander, P. and Lyla, P. S. and Khan, S. A.}, ' ... 
'year   = {2013}, ' ...
'title  = {Feeding and reproductive biology of \emph{Saurida undosquamis} ({R}ichardson, 1848) from {P}arangipettai coast, Southeast coast of {I}ndia}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {1479--1487}, ' ...
'volume = {16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HalfAmin2007'; type = 'article'; bib = [ ...
'author = {M. M. El-Halfawy and A. M. Amin and A. M. Ramadan}, ' ... 
'year   = {2007}, ' ...
'title  = {Growth and Reproduction of Female Brushtooth Lizardfish \emph{Saurida undosquamis} ({R}ichardson) from the {G}ulf of {S}uez, {E}gypt}, ' ...
'journal = {E.U. Journal of Fisheries and Aquatic Science}, ' ...
'page = {143--148}, ' ...
'volume = {24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1055}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

