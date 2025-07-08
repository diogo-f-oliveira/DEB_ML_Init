function [data, auxData, metaData, txtData, weights] = mydata_Girardinus_creolus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Girardinus_creolus'; 
metaData.species_en = 'Creole topminnow'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFc'};
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
data.tp = 15*7;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'PoncRodr2013';
  temp.tp = C2K(27.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 6*7;    units.tpm = 'd';   label.tpm = 'time since birth at puberty for male';   bibkey.tpm = 'PoncRodr2013';
  temp.tpm = C2K(27.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 2.5 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.318; units.Lb  = 'cm';  label.Lb = 'total length at birth for female';     bibkey.Lb  = 'PoncRodr2013';  
data.Lbm = 1.318; units.Lbm  = 'cm'; label.Lbm = 'total length at birth for male';      bibkey.Lbm  = 'PoncRodr2013';  
data.Lp  = 4.565; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'PoncRodr2013';
data.Lpm = 2.950; units.Lpm = 'cm';  label.Lpm = 'total length at puberty for male';    bibkey.Lpm = 'PoncRodr2013';
data.Li  = 5.249; units.Li  = 'cm';  label.Li  = 'ultimate total length for felmale';   bibkey.Li  = 'PoncRodr2013';
data.Lim = 4.067; units.Lim = 'cm';  label.Lim = 'ultimate total length for male';      bibkey.Lim = 'PoncRodr2013';

data.Wwb = 16e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00676*Lb^3.13, see F2';
data.Wwi = 1.21;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.13, see F2';
data.Wwim = 0.54; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00676*Lim^3.13, see F2';

data.Ri  = 20*6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 20 young per litter, 6 litters per yr';
 
% uni-variate data
  
% time-length
% females
data.tL_f = [ ...
0.071	1.329
1.040	1.546
2.009	1.834
3.007	2.086
4.036	2.501
5.004	2.699
6.003	3.041
7.029	3.150
8.056	3.384
9.025	3.637
10.023	3.853
10.990	3.926
12.045	4.017
13.013	4.251
14.069	4.378
14.978	4.504
16.033	4.577
17.029	4.650
18.025	4.723
19.080	4.760];
data.tL_f(:,1) = 7 * data.tL_f(:,1); % convert wk to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length','female'};  
temp.tL_f = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PoncRodr2013';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ...
0.100	1.329
0.982	1.600
2.067	1.834
2.948	2.086
4.006	2.483
5.004	2.699
6.002	2.951
6.999	3.060
7.966	3.151
9.021	3.278
10.017	3.278
10.984	3.351
12.040	3.496
13.007	3.569
14.032	3.641
14.998	3.588
15.966	3.715
17.049	3.716
18.015	3.681
19.070	3.736];
data.tL_m(:,1) = 7 * data.tL_m(:,1); % convert wk to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','total length','male'};  
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
metaData.links.id_CoL = '3G3NT'; % Cat of Life
metaData.links.id_ITIS = '646900'; % ITIS
metaData.links.id_EoL = '604695'; % Ency of Life
metaData.links.id_Wiki = 'Girardinus'; % Wikipedia
metaData.links.id_ADW = 'Girardinus_creolus'; % ADW
metaData.links.id_Taxo = '174972'; % Taxonomicon
metaData.links.id_WoRMS = '1383109'; % WoRMS
metaData.links.id_fishbase = 'Girardinus-creolus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Girardinus}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Girardinus-creolus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
