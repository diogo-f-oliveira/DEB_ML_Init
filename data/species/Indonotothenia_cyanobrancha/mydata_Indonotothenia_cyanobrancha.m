function [data, auxData, metaData, txtData, weights] = mydata_Indonotothenia_cyanobrancha
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Indonotothenia_cyanobrancha'; 
metaData.species_en = 'Blue rockcod'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 24];

%% set data
% zero-variate data

data.ab = 140;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(-1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'based on Notothenia coriiceps';
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(-1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Notothenia coriiceps';
  
data.Lp  = 14; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 30; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based egg diameter of 1.3-1.6 mm: pi/6*0.145^3'; 
data.Wwp = 67; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = {'Hure1970','guess'};
  comment.Wwp = 'based on tL_fm and tLW_fm data: (14/24.2)^3*346.7';
data.Wwi = 660.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on tL_fm and tLW_fm data: (30/24.2)^3*346.7';

data.Ri = 25000/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 NaN    4.75
    2  7.16  7.68
    3 10.44  9.88
    4 14.96 14.21
    5 18.93 18.41
    6 21.00 20.70
    7 22.80 22.50
    8 24.20 24.10];
data.tL_fm(:,1) = 365 * (1.8 + data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(-1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Hure1970'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (yr), total length (cm)
    1  NaN    2.7
    2  9.3   11.4
    3  28.5  24.1
    4  83.0  71.3
    5 167.2 153.9
    6 227.5 218.0
    7 290.4 279.2
    8 346.7 345.0];
data.tW_fm(:,1) = 365 * (1.8 + data.tW_fm(:,1));  % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(-1);  units.temp.tW_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tW_fm = 'Hure1970'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.tW_fm = 3 * weights.tW_fm;
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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'I had to add 1 yr to age estimates to arrive at a reasonable fit';
metaData.discussion = struct('D1',D1, 'D12',D2);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00589*(TL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '47YYW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46572974'; % Ency of Life
metaData.links.id_Wiki = 'Notothenia_cyanobrancha'; % Wikipedia
metaData.links.id_ADW = 'Notothenia_cyanobrancha'; % ADW
metaData.links.id_Taxo = '423968'; % Taxonomicon
metaData.links.id_WoRMS = '234711'; % WoRMS
metaData.links.id_fishbase = 'Indonotothenia-cyanobrancha'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notothenia}}';
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
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Indonotothenia-cyanobrancha.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
