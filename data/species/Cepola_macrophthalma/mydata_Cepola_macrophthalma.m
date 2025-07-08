function [data, auxData, metaData, txtData, weights] = mydata_Cepola_macrophthalma
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Priacanthiformes'; 
metaData.family     = 'Cepolidae';
metaData.species    = 'Cepola_macrophthalma'; 
metaData.species_en = 'Red bandfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 03 17]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SterEcon1992';   
  temp.am = C2K(11.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 21.9; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 7.4e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'RodrAlem2017';
  comment.Wwb = 'based egg diameter of 0.aa77 mm: pi/6*0.053^3'; 

data.Ri  = 1.1e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(11.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.90';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.036	14.283
1.987	22.384
2.972	30.391
3.980	37.747
4.998	42.775
5.993	47.058
6.986	48.268];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(11.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SterEcon1992';
comment.tL_f = 'data for females';
% 
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.013	13.073
1.965	23.315
3.041	31.974
3.969	39.888
4.988	46.034
5.971	50.410
6.977	52.458
7.993	54.972];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(11.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SterEcon1992';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
    26.27  16.0
    55.78 165.2];
units.LW  = {'cm', 'g'};  label.LW = {'total length','wet weight'};  
bibkey.LW = 'SterEcon1992';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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
D1 = 'males are assumed to differ from females by {p_Am}  only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00437*(TL in cm)^2.38';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; r demersal; depth range 15 - 400 m. Subtropical; 11.9 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5XK85'; % Cat of Life
metaData.links.id_ITIS = '170281'; % ITIS
metaData.links.id_EoL = '46578168'; % Ency of Life
metaData.links.id_Wiki = 'Cepola_macrophthalma'; % Wikipedia
metaData.links.id_ADW = 'Cepola_macrophthalma'; % ADW
metaData.links.id_Taxo = '166809'; % Taxonomicon
metaData.links.id_WoRMS = '126835'; % WoRMS
metaData.links.id_fishbase = 'Cepola-macrophthalma'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cepola_macrophthalma}}';
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
bibkey = 'SterEcon1992'; type = 'Article'; bib = [ ... 
'author = {K. I. Stergiou and P. Economidis and A. Sinis}, ' ... 
'year = {1992}, ' ...
'title = {Age, growth and mortality of red bandfish, \emph{Cepola macrophthalma} ({L}.), in the western {A}egean {S}ea ({G}reece)}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {40}, ' ...
'pages = {395-418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrAlem2017'; type = 'techreport'; bib = [ ... 
'author = {J. M. Rodr\''{i}guez and F. Alemany and S. Garcia}, ' ... 
'year = {2017}, ' ...
'title = {A guide to the eggs and larvae of 100 common Western Mediterranean Sea bony fish species}, ' ...
'institution = {FAO}, ' ...
'isbn = {978-92-5-109895-0}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/356}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
