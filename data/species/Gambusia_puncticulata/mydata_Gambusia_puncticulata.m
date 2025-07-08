function [data, auxData, metaData, txtData, weights] = mydata_Gambusia_puncticulata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Gambusia_puncticulata'; 
metaData.species_en = 'Carribbean gambusia'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5*7;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'PoncRodr2013';
  temp.tp = C2K(27.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4*7;   units.tpm = 'd';   label.tpm = 'time since birth at puberty for male';   bibkey.tpm = 'PoncRodr2013';
  temp.tpm = C2K(27.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 2.5 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.061; units.Lb  = 'cm';  label.Lb = 'total length at birth';                bibkey.Lb  = 'PoncRodr2013';  
data.Lbm = 1.061; units.Lbm  = 'cm'; label.Lbm = 'total length at birth for male';      bibkey.Lbm  = 'PoncRodr2013';  
data.Lp  = 2.720; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'PoncRodr2013';
data.Lpm = 2.151; units.Lpm = 'cm';  label.Lpm = 'total length at puberty for male';    bibkey.Lpm = 'PoncRodr2013';
data.Li  = 4.600; units.Li  = 'cm';  label.Li  = 'ultimate total length for felmale';   bibkey.Li  = 'PoncRodr2013';
data.Lim = 2.700; units.Lim = 'cm';  label.Lim = 'ultimate total length for male';      bibkey.Lim = 'PoncRodr2013';

data.Wwb = 11.5e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00955*Lb^3.12, see F2';
data.Wwi = 1.12;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'fishbase';
  comment.Wwb = 'based on 0.00955*Li^3.12, see F2';
data.Wwim = 0.21; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'computed as based on 0.00955*Lim^3.12, see F2';

data.Ri  = 30*6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   comment.Ri = 'based on 30 young per litter, 6 litters per yr';  

% uni-variate data
  
% time-length
% females
data.tL_f = [ ...
0.029	1.000
0.965	1.201
2.076	1.656
3.012	2.003
3.977	2.422
4.971	2.605
6.082	2.860
6.988	2.988
7.953	3.207
9.006	3.335
10.000	3.318
10.994	3.446
12.047	3.484
13.041	3.703
13.977	3.704
15.058	3.777
16.023	3.887
16.959	3.943
17.982	4.053
19.064	4.181];
data.tL_f(:,1) = 7 * data.tL_f(:,1); % convert wk to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length', 'female'};  
temp.tL_f = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PoncRodr2013';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ...
0.058	1.000
0.965	1.201
2.076	1.656
2.924	1.966
3.977	2.204
4.971	2.295
5.965	2.369
7.018	2.388
7.953	2.407
9.035	2.481
10.000	2.391
10.994	2.428
12.018	2.465
13.012	2.485
13.977	2.467
15.058	2.468
16.023	2.487
17.047	2.543
18.012	2.544
19.035	2.563];
data.tL_m(:,1) = 7 * data.tL_m(:,1); % convert wk to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','total length', 'male'};  
temp.tL_m = C2K(27.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PoncRodr2013';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'leight-weight: Ww (in g) = 0.00955*(TL in cm)^3.12';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3F7WW'; % Cat of Life
metaData.links.id_ITIS = '646899'; % ITIS
metaData.links.id_EoL = '46566806'; % Ency of Life
metaData.links.id_Wiki = 'Gambusia'; % Wikipedia
metaData.links.id_ADW = 'Gambusia_puncticulata'; % ADW
metaData.links.id_Taxo = '192857'; % Taxonomicon
metaData.links.id_WoRMS = '276140'; % WoRMS
metaData.links.id_fishbase = 'Gambusia-puncticulata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gambusia}}';
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
bibkey = 'PoncRodr2013'; type = 'Article'; bib = [ ... 
'author = {J. L. Ponce de Le\''{o}n and R. Rodr\''{i}guez and G. Le\''{o}}, ' ... 
'year = {2013}, ' ...
'title = {Life-History Patterns of {C}uban Poeciliid Fishes ({T}eleostei: {C}yprinodontiformes)}, ' ...
'journal = {Zoo biology}, ' ...
'volume = {32}, ' ...
'pages = {251--256}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/27691}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
