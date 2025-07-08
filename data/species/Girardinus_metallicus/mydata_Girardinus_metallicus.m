function [data, auxData, metaData, txtData, weights] = mydata_Girardinus_metallicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Girardinus_metallicus'; 
metaData.species_en = 'Metallic livebearer'; 

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
data.tp = 12*7;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'PoncRodr2013';
  temp.tp = C2K(27.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*7;    units.tpm = 'd';   label.tpm = 'time since birth at puberty for male';   bibkey.tpm = 'PoncRodr2013';
  temp.tpm = C2K(27.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 2.5 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.997; units.Lb  = 'cm';  label.Lb = 'total length at birth';                bibkey.Lb  = 'PoncRodr2013';  
data.Lbm = 0.997; units.Lbm  = 'cm'; label.Lbm = 'total length at birth for male';      bibkey.Lbm = 'PoncRodr2013';  
data.Lp  = 3.405; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'PoncRodr2013';
data.Lpm = 2.171; units.Lpm = 'cm';  label.Lpm = 'total length at puberty for male';    bibkey.Lpm = 'PoncRodr2013';
data.Li  = 4.50;  units.Li  = 'cm';  label.Li  = 'ultimate total length for felmale';   bibkey.Li  = 'PoncRodr2013';
  comment.Li = 'fishbase: 9 cm';
data.Lim = 3.00;  units.Lim = 'cm';  label.Lim = 'ultimate total length for male';      bibkey.Lim = 'PoncRodr2013';
  comment.Lim = 'fishbase: 5 cm';

data.Wwb = 6.7e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'fishbase';
  comment.Wwb = 'computed as 0.00676*Lb^3.13 ';
data.Wwi = 0.75;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'fishbase';
  comment.Wwb = 'computed as 0.00676*Li^3.13 ';
data.Wwim = 0.21; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'computed as 0.00676*Lim^3.13';

data.Ri  = 35*6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '35 young per litter; 6 litters per yr assumed'; 
 
% uni-variate data
  
% time-length
% females
data.tL_f = [ ...
0.044	1.003
1.019	1.228
2.025	1.506
3.029	1.697
4.033	1.854
5.068	2.148
6.014	2.357
6.988	2.530
8.021	2.687
8.993	2.671
10.027	2.844
11.002	3.087
12.066	3.330
13.070	3.504
14.043	3.539
15.046	3.644
16.019	3.697
17.080	3.784
18.085	4.027
19.058	4.080];
data.tL_f(:,1) = 7 * data.tL_f(:,1); % convert wk to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length','female'};  
temp.tL_f = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PoncRodr2013';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ...
0.103	1.003
0.989	1.211
2.024	1.489
2.999	1.697
4.032	1.836
5.038	2.148
6.043	2.357
7.017	2.479
8.049	2.583
9.023	2.671
10.054	2.689
11.087	2.811
12.029	2.829
13.090	2.830
14.032	2.796
15.004	2.831
16.036	2.884
16.978	2.850
18.040	2.920
19.069	2.852];
data.tL_m(:,1) = 7 * data.tL_m(:,1); % convert wk to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','total length','male'};  
temp.tL_m = C2K(27.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PoncRodr2013';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
%weights.ab = 0.2 * weights.ab;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_H only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'leight-weight: Ww (in g) = 0.00676*(TL in cm)^3.13';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3G3P3'; % Cat of Life
metaData.links.id_ITIS = '165933'; % ITIS
metaData.links.id_EoL = '1012105'; % Ency of Life
metaData.links.id_Wiki = 'Girardinus_metallicus'; % Wikipedia
metaData.links.id_ADW = 'Girardinus_metallicus'; % ADW
metaData.links.id_Taxo = '174976'; % Taxonomicon
metaData.links.id_WoRMS = '1014538'; % WoRMS
metaData.links.id_fishbase = 'Girardinus-metallicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Girardinus_metallicus}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/11967}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
