function [data, auxData, metaData, txtData, weights] = mydata_Limia_vittata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Limia_vittata'; 
metaData.species_en = 'Cuban limia'; 

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

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 12*7;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'PoncRodr2013';
  temp.tp = C2K(27.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7*7;    units.tpm = 'd';   label.tpm = 'time since birth at puberty for male';   bibkey.tpm = 'PoncRodr2013';
  temp.tpm = C2K(27.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 2.5 * 365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.900; units.Lb  = 'cm';  label.Lb = 'total length at birth';                bibkey.Lb  = 'PoncRodr2013';  
data.Lbm = 0.900; units.Lbm  = 'cm'; label.Lbm = 'total length at birth for male';      bibkey.Lbm  = 'PoncRodr2013';  
data.Lp  = 3.285; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'PoncRodr2013';
data.Lpm = 2.291; units.Lpm = 'cm';  label.Lpm = 'total length at puberty for male';    bibkey.Lpm = 'PoncRodr2013';
data.Li  = 5.390; units.Li  = 'cm';  label.Li  = 'ultimate total length for felmale';   bibkey.Li  = 'PoncRodr2013';
data.Lim = 4.080; units.Lim = 'cm';  label.Lim = 'ultimate total length for male';      bibkey.Lim = 'PoncRodr2013';

data.Wwb = 6.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00955*Lb^3.12, see F2';
data.Wwi = 1.83;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'fishbase';
  comment.Wwb = 'based on 0.00955*Li^3.12, see F2';
data.Wwim = 0.76; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00955*Lim^3.12, see F2';

data.Ri  = 50*6/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 50 young per litter, 6 litters per yr';  

% uni-variate data
  
% time-length
% females
data.tL_f = [ ...
0.030	0.923
1.046	0.996
2.033	1.140
2.960	1.212
3.976	1.445
4.993	1.678
5.979	1.928
6.966	2.143
8.012	2.411
8.939	2.430
9.925	2.680
11.031	2.753
12.078	3.270
12.975	3.680
14.021	4.125
15.007	4.251
16.054	4.502
17.040	4.663
17.967	4.754
19.013	4.862];
data.tL_f(:,1) = 7 * data.tL_f(:,1); % convert wk to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','total length','female'};  
temp.tL_f = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PoncRodr2013';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ...
0.000	0.959
0.957	1.031
2.063	1.140
2.990	1.248
3.946	1.480
4.963	1.713
6.009	1.963
6.996	2.356
7.952	2.553
8.999	2.732
10.045	2.965
11.001	3.091
12.048	3.146
13.034	3.396
13.961	3.557
15.037	3.577
16.024	3.721
17.010	3.598
17.967	3.671
18.984	3.637];
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
D1 = 'Males are assumed to differ from females by {p_Am}. E_Hb, E_Hj and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'ovoviviparous, not viviparous, so reproduction is by eggs';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'leight-weight: Ww (in g) = 0.00955*(TL in cm)^3.12';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '72B4Q'; % Cat of Life
metaData.links.id_ITIS = '165946'; % ITIS
metaData.links.id_EoL = '46566822'; % Ency of Life
metaData.links.id_Wiki = 'Limia_vittata'; % Wikipedia
metaData.links.id_ADW = 'Limia_vittata'; % ADW
metaData.links.id_Taxo = '178848'; % Taxonomicon
metaData.links.id_WoRMS = '281357'; % WoRMS
metaData.links.id_fishbase = 'Limia-vittata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limia}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Limia-vittata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
