function [data, auxData, metaData, txtData, weights] = mydata_Paranotothenia_magellanica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Paranotothenia_magellanica'; 
metaData.species_en = 'Magellanic rockcod'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 25];

%% set data
% zero-variate data

data.ab = 35;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(7.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Notothenia coriiceps';
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(7.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Notothenia coriiceps';
  
data.Lp  = 21; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 43; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based egg diameter of 0.8 mm: pi/6*0.08^3'; 
data.Wwp = 140; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = {'Hure1970','guess'};
  comment.Wwp = 'based on tLW and Lp';
data.Wwi = 1.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Hure1970';

data.Ri = 70000/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(7.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1 12.1   59.9
    2 18.0  187.3
    3 23.4  397.8
    4 26.6  574.7
    5 30.0  811.6
    6 33.1 1070
    7 36.5 1420];
data.tLW(:,1) = 365 * (0.8 + data.tLW(:,1));  % convert yr to d
units.tLW   = {'d','cm','g'};  label.tLW = {'time since birth', 'total length','weight'};  
temp.tLW    = C2K(7.9);  units.temp.tLW = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tLW = 'Hure1970'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00589*(TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4D6G8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46572984'; % Ency of Life
metaData.links.id_Wiki = 'Paranotothenia_magellanica'; % Wikipedia
metaData.links.id_ADW = 'Paranotothenia_magellanica'; % ADW
metaData.links.id_Taxo = '182991'; % Taxonomicon
metaData.links.id_WoRMS = '234645'; % WoRMS
metaData.links.id_fishbase = 'Paranotothenia-magellanica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paranotothenia_magellanica}}';
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
bibkey = 'Hure1970'; type = 'Article'; bib = [ ... 
'author = {Hureau, J.-C.}, ' ... 
'year = {1970}, ' ...
'title = {Biologie compar\''{e}e de quelques poissons antarctiques ({N}otothenidae)}, ' ...
'journal = {Bull. Inst. Océanogr. Monaco}, ' ...
'volume = {68(1391)}, ' ...
'pages = {1-244}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Paranotothenia-magellanica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
