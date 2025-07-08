function [data, auxData, metaData, txtData, weights] = mydata_Lopholatilus_villarii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Latilidae';
metaData.species    = 'Lopholatilus_villarii'; 
metaData.species_en = 'Tilefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAg'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 02];

%% set data
% zero-variate data

data.tp = 6*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';   
  temp.tp = C2K(14.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '5-7 yrs';
data.am = 35*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Avil2002';   
  temp.am = C2K(14.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 34; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'Wiki'; 
data.Li  = 107;  units.Li  = 'cm';  label.Li  = 'ultimate fork length for females'; bibkey.Li  = 'Wiki';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 

data.Ri  = 8e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(14.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lopholatilus_chamaeleonticeps';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
 1 13.4 10.6
 2 16.9 14.9
 3 20.7 20.0
 4 24.6 25.4
 5 28.4 30.8
 6 31.9 36.2
 7 35.2 41.1
 8 38.5 46.1
 9 41.4 51.5
10 44.3 56.3
11 47.9 60.5
12 50.8 64.4
13 53.7 68.1
14 57.2 71.6
15 59.1 74.9
16 61.2 77.3
17 63.8 79.5
18 66.5 79.7
19 70.0 80.9
20 71.1 82.2
21 74.5 83.8
22 72.2 84.4
23 70.5 85.5
24 NaN 87.0
25 NaN  89.8
26 NaN  92.2
27 NaN  93.5
28 NaN  94.1
29 NaN  94.9
30 NaN  95.3
31 NaN  95.6
32 NaN  96.8
35 NaN  96.9];
data.tL_fm(:,1) = 365 * (0.8 + data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm    = C2K(14.7);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Avil2002'; treat.tL_fm = {1 {'females','males'}}; 

% length-weight
data.LW = [ ... % fork length (cm), wet weight (g)
 17.5    60
 22.5   130
 27.7   250
 32.5   430
 37.5   680
 42.5  1010
 47.5  2660
 52.5  1990
 57.5  2660
 62.5  3470
 67.5  4430
 72.5  5560
 77.5  6880
 82.5  8400
 87.5 10130
 92.5 12090
 97.5 14300
102.5 16770
107.5 19520
117.5 25920];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','wet weight'};  
bibkey.LW = 'Avil2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3W3LC'; % Cat of Life
metaData.links.id_ITIS = '645451'; % ITIS
metaData.links.id_EoL = '46580674'; % Ency of Life
metaData.links.id_Wiki = 'Lopholatilus_villarii'; % Wikipedia
metaData.links.id_ADW = 'Lopholatilus_villarii'; % ADW
metaData.links.id_Taxo = '179113'; % Taxonomicon
metaData.links.id_WoRMS = '276219'; % WoRMS
metaData.links.id_fishbase = 'Lopholatilus-villarii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lopholatilus_villarii}}';
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
bibkey = 'Avil2002'; type = 'phdthesis'; bib = [ ... 
'author = {\''{A}vila-da-Silva, A.O.}, ' ... 
'year = {2002}, ' ...
'title = {Evolu\c{c}\~{a}o da pesca de linha-de-fundo e din\^{a}mica de popula\c{c}\~{a}o do peixe-batata, \emph{Lopholatilus villarii} ({T}eleostei: {M}alacanthidae) na margem continental da costa brasiliera entre os paralelos 22$^\circ$ e 28$^\circ$S}, ' ...
'school = {Instituto Oceanogr\''{a}fico, Universidade de S\~{a}o Paulo}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lopholatilus-villarii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
