function [data, auxData, metaData, txtData, weights] = mydata_Sphyraena_sphyraena
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sphyraeniformes'; 
metaData.family     = 'Sphyraenidae';
metaData.species    = 'Sphyraena_sphyraena'; 
metaData.species_en = 'European barracuda'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MA','MAm'};
metaData.ecoCode.habitat = {'0jMm', 'jiMr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.3); % K, body temp
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

data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 27.6; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 165;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.45 mm: pi/6*0.145^3'; 
data.Wwp = 118.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on W = 0.00759*Lp^2.91, see F1';
data.Wwi = 21.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on W = 0.00759*Li^2.91, see F1; max published weight 3.8 kg';

data.Ri  = 103453/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assumed length 40 cm';

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), fork length (cm)
    1 23.29  39.47
    2 28.63  67.30 
    3 31.40  96.07
    4 33.42 120.97
    5 35.32 150.17
    6 38.08 183.17
    7 39.03 212.33
    8 42.32 256.55];
data.tLW(:,1) = 365 * (0.8 + data.tLW(:,1));  % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'fork length', 'weight'};  
temp.tLW    = C2K(18.3);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'AllaFalt2004'; treat.tLW = {1, {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Wwp = 0 * weights.Wwp;

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
F1 = 'length-weight: Ww in g = 0.00759*(TL in cm)^2.91';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YZYG'; % Cat of Life
metaData.links.id_ITIS = '170443'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Sphyraena_sphyraena'; % Wikipedia
metaData.links.id_ADW = 'Sphyraena_sphyraena'; % ADW
metaData.links.id_Taxo = '46314'; % Taxonomicon
metaData.links.id_WoRMS = '127068'; % WoRMS
metaData.links.id_fishbase = 'Sphyraena-sphyraena'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyraena_sphyraena}}';
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
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Sphyraena-sphyraena.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

