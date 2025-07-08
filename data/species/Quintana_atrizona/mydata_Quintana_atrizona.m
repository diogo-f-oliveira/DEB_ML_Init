function [data, auxData, metaData, txtData, weights] = mydata_Quintana_atrizona

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Quintana_atrizona'; 
metaData.species_en = 'Barred topminnow'; 

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

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 01]; 

%% set data
% zero-variate data

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '28 till 45 d';
data.tp = 8*7;     units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'PoncRodr2013';
  temp.tp = C2K(27.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*7;    units.tpm = 'd';   label.tpm = 'time since birth at puberty for male';   bibkey.tpm = 'PoncRodr2013';
  temp.tpm = C2K(27.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 2.5 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.781; units.Lb  = 'cm';  label.Lb = 'total length at birth';                bibkey.Lb  = 'PoncRodr2013';  
data.Lbm = 0.781; units.Lbm  = 'cm'; label.Lbm = 'total length at birth for male';      bibkey.Lbm = 'PoncRodr2013';  
data.Lp  = 2.615; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'PoncRodr2013';
data.Lpm = 1.882; units.Lpm = 'cm';  label.Lpm = 'total length at puberty for male';    bibkey.Lpm = 'PoncRodr2013';
data.Li  = 3.000; units.Li  = 'cm';  label.Li  = 'ultimate total length for felmale';   bibkey.Li  = 'PoncRodr2013';
data.Lim = 2.200; units.Lim = 'cm';  label.Lim = 'ultimate total length for male';      bibkey.Lim = 'PoncRodr2013';

data.Wwb = 3.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00955*Lb^3.12';
data.Wwi = 0.21;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'fishbase';
  comment.Wwb = 'computed as 0.00676*Li^3.13 ';
data.Wwim = 0.080; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'computed as 0.00676*Lim^3.13';

data.Ri  = 35*7/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '35 young per litter; 7 litters per yr assumed'; 

% uni-variate data
  
% time length
% females
data.tL_f = [ ...
0.058	0.770
0.988	1.003
1.977	1.254
3.052	1.504
3.953	1.791
5.000	1.988
5.959	2.185
6.919	2.364
7.994	2.651
9.041	2.758
10.029	2.758
10.988	2.758
12.006	2.884
13.023	2.901
13.983	2.919
15.058	2.884
16.017	2.973
17.035	2.937
17.965	3.027
19.012	2.901];
data.tL_f(:,1) = 7 * data.tL_f(:,1); % convert wk to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length','female'};  
temp.tL_f = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PoncRodr2013';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ...
0.058	0.788
0.988	1.003
2.006	1.290
3.023	1.504
4.041	1.755
5.000	1.881
5.988	2.024
7.035	2.149
7.994	2.096
8.983	2.060
9.942	2.024
11.017	2.078
11.977	2.113
13.023	2.167
13.924	2.078
15.087	2.221
16.047	2.131
17.006	2.149
17.965	2.131
18.983	2.149];
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
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hb and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'leight-weight: Ww (in g) = 0.00955*(TL in cm)^3.12';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6X3RK'; % Cat of Life
metaData.links.id_ITIS = '646976'; % ITIS
metaData.links.id_EoL = '218128'; % Ency of Life
metaData.links.id_Wiki = 'Quintana_atrizona'; % Wikipedia
metaData.links.id_ADW = 'Quintana_atrizona'; % ADW
metaData.links.id_Taxo = '185682'; % Taxonomicon
metaData.links.id_WoRMS = '1014650'; % WoRMS
metaData.links.id_fishbase = 'Quintana-atrizona'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Quintana_atrizona}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Quintana-atrizona.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
