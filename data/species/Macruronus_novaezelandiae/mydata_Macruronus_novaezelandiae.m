function [data, auxData, metaData, txtData, weights] = mydata_Macruronus_novaezelandiae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macruronidae';
metaData.species    = 'Macruronus_novaezelandiae'; 
metaData.species_en = 'Blue grenadier'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2018 12 18]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.ab = 2.5;  units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'fishbase'; 
  temp.ab = C2K(8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature is given as 0 C, but this is hard to believe';
data.am = 25*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';  
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 67.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase';
  comment.Lp = '65 to 70 cm';
data.Li = 120;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1  mm: pi/6*0.1^3';
data.Wwi = 1.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'This is the max reported weight; relationshaip in F1 gives 6,7 kg for TL = 120 cm';  

data.Ri = 1e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Macruronus_novaezelandiae';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years) ~ total length (cm) 
1.935	53.631
2.928	63.431
3.994	72.596
4.891	78.707
5.934	81.640
6.977	85.972
7.973	86.615
8.993	88.403
9.963	92.098
10.983	93.631
11.979	94.910
13.023	96.952
14.018	97.850
14.990	99.510];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SweeHadd2018';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years) ~ total length (cm) 
1.935	53.249
2.977	61.269
3.995	68.272
4.965	74.511
5.985	75.535
7.004	77.959
8.000	79.238
8.971	80.390
10.015	82.432
11.011	83.711
12.031	84.227
13.001	87.159
13.997	87.802
14.993	88.572];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SweeHadd2018';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

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

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3XD3F'; % Cat of Life
metaData.links.id_ITIS = '623193'; % ITIS
metaData.links.id_EoL = '46564933'; % Ency of Life
metaData.links.id_Wiki = 'Macruronus_novaezelandiae'; % Wikipedia
metaData.links.id_ADW = 'Macruronus_novaezelandiae'; % ADW
metaData.links.id_Taxo = '179492'; % Taxonomicon
metaData.links.id_WoRMS = '272450'; % WoRMS
metaData.links.id_fishbase = 'Macruronus-novaezelandiae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Macruronus_novaezelandiae}}';
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
bibkey = 'SweeHadd2018'; type = 'article'; bib = [ ...
'author = {P. C. Sweetman and J. A. Haddy and S.G. Robertson}, ' ... 
'year   = {2018}, ' ...
'title  = {Multi-decadal variation in cohort specific sex ratios and otolith increment growth characteristics of juvenile blue grenadier (\emph{Macruronus novaezelandiae})}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {79-87}, ' ...
'volume = 201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-merluccius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

