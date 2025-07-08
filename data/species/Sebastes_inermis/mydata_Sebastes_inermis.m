function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_inermis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_inermis'; 
metaData.species_en = 'Black rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 25];

%% set data
% zero-variate data

data.am = 40*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(17.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '30-50 yrs';

data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 35.9;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 55.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on  0.01288*Lp^3.02, see F1';
data.Wwi = 640; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.02, see F1';

data.Ri  = 62e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 13.81 13.50
    2 17.25 17.10
    3 19.37 19.05 
    4 20.57 20.16
    5 21.41 20.78
    6 22.22 21.56
    7 22.92 NaN
    8 22.83 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.8) * 365; % set origin at birth
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(17.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KamiKawa2013'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
    1  43.50  39.48
    2  86.56  83.74
    3 124.01 118.29
    4 149.30 141.49
    5 169.03 155.97
    6 189.65 175.38
    7 208.64 NaN
    8 206.22 NaN];
data.tW_fm(:,1) = (data.tW_fm(:,1)+0.8) * 365; % set origin at birth
units.tW_fm  = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm   = C2K(17.3);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'KamiKawa2013'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.Wwp = 3 * weights.Wwp;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01288*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7MJ'; % Cat of Life
metaData.links.id_ITIS = '644580'; % ITIS
metaData.links.id_EoL = '46568149'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_inermis'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_inermis'; % ADW
metaData.links.id_Taxo = '187283'; % Taxonomicon
metaData.links.id_WoRMS = '274803'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-inermis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_inermis}}';
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
bibkey = 'KamiKawa2013'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10228-013-0381-8}, ' ...
'author = {Kamimura, Y. and Kawane, M. and Hamaguchi, M. and Shoji, J.},' ...
'year = {2013}, ' ...
'title = {Age and growth of three rockfish species, \emph{Sebastes inermis}, \emph{S. ventricosus} and \emph{S. cheni}, in the central {S}eto {I}nland {S}ea, {J}apan}, ' ...
'journal = {Ichthyological Research}, ' ...
'volume = {61(2)}, ' ...
'pages = {108–114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KimKim2010'; type = 'article'; bib = [ ... 
'doi = {10.3796/KSFT.2010.46.4.346}, ' ...
'author = {Hee-Yong Kim and Sang-Hwa Kim and Sun-Jung Huh and Young Il Seo},' ...
'year = {2010}, ' ...
'title = {Age and growth of the black rockfish, \emph{Sebastes inermis}, in the {J}eonnam marine ranching area in the southern {S}ea of {K}orea}, ' ...
'journal = {Journal of the Korean society of Fisheries Technology}, ' ...
'volume = {46(4)}, ' ...
'pages = {108–114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-inermis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
