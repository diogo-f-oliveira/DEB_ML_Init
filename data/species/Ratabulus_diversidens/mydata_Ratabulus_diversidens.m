function [data, auxData, metaData, txtData, weights] = mydata_Ratabulus_diversidens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Ratabulus_diversidens'; 
metaData.species_en = 'Free-spine flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 05];

%% set data
% zero-variate data

data.ab = 7.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(19.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 13*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BarnGray2011';   
  temp.am = C2K(19.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 39.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BrowSiva2003';
  comment.Wwb = 'based egg diameter of 0.5 mm of Platycephalus_conatus: pi/6*0.05^3'; 
data.Wwi = 1704; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.04, see F1';

data.Ri = 1e6/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(19.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Platycephalus_conatus';

% uni-variate data
% time-length
data.tL_Yfm = [ ... % time since birth (yr), total length (cm)
0	10.852 11.277
1	19.777 19.649
2	28.702 25.824
3	33.570 31.302
4	36.308 31.790
5	36.714 31.179
6	39.148 33.063
7	39.554 31.355
8   NaN    27.950
9	41.481 NaN
10  NaN    31.919
11	42.901 28.214
12  NaN    36.486
13	42.089 32.582];
data.tL_Yfm(:,1) = 365 * (0.8+data.tL_Yfm(:,1));  % convert yr to d
units.tL_Yfm   = {'d', 'cm'};  label.tL_Yfm = {'time since birth', 'total length', 'female'};  
temp.tL_Yfm    = C2K(19.7);  units.temp.tL_Yfm = 'K'; label.temp.tL_Yfm = 'temperature';
bibkey.tL_Yfm = 'BarnGray2011'; treat.tL_Yfm = {1 {'females','males'}}; label.treat.tL_Yfm = 'Yamba';
comment.tL_Yfm = 'data from Yamba'; title.tL_Yfm = 'Yamba';
%
data.tL_Nfm = [ ... % time since birth (yr), total length (cm)
0	11.336 12.051
1	17.617 NaN
2	26.935 23.395
3	32.407 NaN
4	40.307 NaN
5	35.252 NaN
7	40.224 NaN
8	41.546 NaN];
data.tL_Nfm(:,1) = 365 * (0.8+data.tL_Nfm(:,1));  % convert yr to d
units.tL_Nfm   = {'d', 'cm'};  label.tL_Nfm = {'time since birth', 'total length', 'female'};  
temp.tL_Nfm    = C2K(19.7);  units.temp.tL_Nfm = 'K'; label.temp.tL_Nfm = 'temperature';
bibkey.tL_Nfm = 'BarnGray2011'; treat.tL_Nfm = {1 {'females','males'}}; label.treat.tL_Nfm = 'Newcastle';
comment.tL_Nfm = 'data from Newcastle'; title.tL_Nfm = 'Newcastle';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Yfm = 5 * weights.tL_Yfm;
weights.tL_Nfm = 5 * weights.tL_Nfm;
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
txtData.title = title;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'known only from Coffs Harbor in northern New South Wales to Portland in Victoria, including Bass Strait and Tasmania';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4RLW3'; % Cat of Life
metaData.links.id_ITIS = '644468'; % ITIS
metaData.links.id_EoL = '46568634'; % Ency of Life
metaData.links.id_Wiki = 'Ratabulus'; % Wikipedia
metaData.links.id_ADW = 'Ratabulus_diversidens'; % ADW
metaData.links.id_Taxo = '185799'; % Taxonomicon
metaData.links.id_WoRMS = '282553'; % WoRMS
metaData.links.id_fishbase = 'Ratabulus-diversidens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'h274651owpublished = {\url{http://en.wikipedia.org/wiki/Ratabulus_diversidens}}';
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
bibkey = 'BarnGray2011'; type = 'article'; bib = [ ... 
'doi = {10.1071/MF11045}, ' ...
'author = {L. M. Barnes and C. A. Gray and J. E. Williamson}, ' ... 
'year = {2011}, ' ...
'title = {Divergence of the growth characteristics and longevity of coexisting {P}latycephalidae ({P}isces)}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {62}, ' ...
'pages = {1308–1317}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrowSiva2003'; type = 'techreport'; bib = [ ... 
'author = {Lauren P. Brown and K. P. Sivakumaran.}, ' ... 
'year = {2003}, ' ...
'title = {Spawning and reproductive characteristics of {B}ight redfish and deepwater flathead in the {G}reat {A}ustralian {B}ight {T}rawl {F}ishery}, ' ...
'institution = {Final report to Australian Fisheries Management Authority; Marine and Freshwater Resources Institute, Queenscliff, Victoria}, ' ...
'number = {2003/003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ratabulus-diversidens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
