function [data, auxData, metaData, txtData, weights] = mydata_Saurida_tumbil
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Saurida_tumbil'; 
metaData.species_en = 'Greater lizardfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 05 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 02];

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'fishbase';  
  temp.am = C2K(27.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 28.6;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'HalfAmin2007';
  comment.Wwb = 'based on egg diameter of 0.9 mm of Saurida undosquamis: pi/6*0.09^3';
data.Wwi = 1.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.12, see F1';

data.Ri = 71364/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(27.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data for females
data.tL_fm = [ ... % age (years) ~ fork length (cm) 
0	19.222 17.605
1	28.563 26.587
2	35.569 34.671
3	42.216 39.341
4	47.066 43.293
5	50.479 46.886
6	53.892 48.683
7	55.868 50.299];
data.tL_fm(:,1) = 365 * (.7 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(27.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KeivAbas2014'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'data for females, males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00537*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XQ8C'; % Cat of Life
metaData.links.id_ITIS = '162414'; % ITIS
metaData.links.id_EoL = '46563969'; % Ency of Life
metaData.links.id_Wiki = 'Saurida_tumbil'; % Wikipedia
metaData.links.id_ADW = 'Saurida_tumbil'; % ADW
metaData.links.id_Taxo = '186633'; % Taxonomicon
metaData.links.id_WoRMS = '217663'; % WoRMS
metaData.links.id_fishbase = 'Saurida-tumbil'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saurida_tumbil}}';
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
bibkey = 'KeivAbas2014'; type = 'article'; bib = [ ...
'author = {Yazdan Keivany and Akbar Abaszadeh and Nasrollah M. Soofiani}, ' ... 
'year   = {2014}, ' ...
'title  = {A study on some growth parameters and feeding characteristics of the lizardfish, \emph{Saurida tumbil}, from the {I}ranian {P}ersian {G}ulf coast}, ' ...
'journal = {Journal of Marine Science and Technology}, ' ...
'page = {51-60}, ' ...
'volume = {13(3)}'];
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
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Saurida-tumbil.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

