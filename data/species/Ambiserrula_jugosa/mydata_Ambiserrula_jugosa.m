function [data, auxData, metaData, txtData, weights] = mydata_Ambiserrula_jugosa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Ambiserrula_jugosa'; 
metaData.species_en = 'Mud flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.7); % K, body temp
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

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(24.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BarnGray2011';   
  temp.am = C2K(24.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 12.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BrowSiva2003';
  comment.Wwb = 'based egg diameter of 0.5 mm of Platycephalus_conatus: pi/6*0.05^3'; 
data.Wwi = 19.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

data.Ri = 3e4/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(24.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Ratabulus_diversidens: 1e6*(12/39)^3';

% uni-variate data
% time-length
data.tL_Yfm = [ ... % time since birth (yr), total length (cm)
0	 7.606  7.884
1	10.649 10.867
2	14.097 13.549
3	17.343 16.232
4	19.168 17.418];
data.tL_Yfm(:,1) = 365 * (0.9+data.tL_Yfm(:,1));  % convert yr to d
units.tL_Yfm   = {'d', 'cm'};  label.tL_Yfm = {'time since birth', 'total length', 'female'};  
temp.tL_Yfm    = C2K(24.7);  units.temp.tL_Yfm = 'K'; label.temp.tL_Yfm = 'temperature';
bibkey.tL_Yfm = 'BarnGray2011'; treat.tL_Yfm = {1 {'females','males'}}; label.treat.tL_Yfm = 'Yamba';
comment.tL_Yfm = 'data from Yamba'; title.tL_Yfm = 'Yamba';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Yfm = 5 * weights.tL_Yfm;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

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
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'known only from Coffs Harbor in northern New South Wales to Portland in Victoria, including Bass Strait and Tasmania';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'CL7M'; % Cat of Life
metaData.links.id_ITIS = '643754'; % ITIS
metaData.links.id_EoL = '46568618'; % Ency of Life
metaData.links.id_Wiki = 'Ambiserrula_jugosa'; % Wikipedia
metaData.links.id_ADW = 'Ambiserrula_jugosa'; % ADW
metaData.links.id_Taxo = '160523'; % Taxonomicon
metaData.links.id_WoRMS = '279572'; % WoRMS
metaData.links.id_fishbase = 'Ambiserrula-jugosa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'h274651owpublished = {\url{http://en.wikipedia.org/wiki/Ambiserrula_jugosa}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Ambiserrula-jugosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
