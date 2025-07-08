function [data, auxData, metaData, txtData, weights] = mydata_Sphyraena_chrysotaenia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sphyraeniformes'; 
metaData.family     = 'Sphyraenidae';
metaData.species    = 'Sphyraena_chrysotaenia'; 
metaData.species_en = 'Yellowstripe barracuda'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MI','MAm'};
metaData.ecoCode.habitat = {'0jMm', 'jiMr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 12];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19.3; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty of females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 32.2;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.45 mm: pi/6*0.145^3'; 
data.Wwp = 36.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on W = 0.00661*Lp^2.91, see F1';
data.Wwi = 161.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on W = 0.00661*Li^2.91, see F1';

data.Ri  = 1e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), std length (cm)
    1 19.50 22.65
    2 22.19 42.05
    3 24.38 61.38
    4 25.15 76.15
    5 26.24 88.00];
data.tLW(:,1) = 365 * (0.3 + data.tLW(:,1));  % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'std length', 'weight'};  
temp.tLW    = C2K(27.7);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'AllaFalt2004'; treat.tLW = {1, {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;

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
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00661 *(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Z2LF'; % Cat of Life
metaData.links.id_ITIS = '170436'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sphyraena_chrysotaenia'; % Wikipedia
metaData.links.id_ADW = 'Sphyraena_chrysotaenia'; % ADW
metaData.links.id_Taxo = '187932'; % Taxonomicon
metaData.links.id_WoRMS = '127067'; % WoRMS
metaData.links.id_fishbase = 'Sphyraena-chrysotaenia'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyraena_chrysotaenia}}';
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
bibkey = 'AllaFalt2004'; type = 'Article'; bib = [ ... 
'author = {Sohair M. Allam and Samir N. Faltas and Evelyn Ragheb}, ' ... 
'year = {2004}, ' ...
'title = {AGE AND GROWTH OF BARRACUDAS IN THE EGYPTIAN {M}EDITERRANEAN WATERS}, ' ...
'journal = {EGYPTIAN JOURNAL OF AQUATIC RESEARCH}, ' ...
'volume = {30(B)}, ' ...
'pages = {281-289}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Sphyraena-chrysotaenia.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

