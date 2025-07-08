function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_richardsoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_richardsoni'; 
metaData.species_en = 'Tiger flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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
  temp.ab = C2K(14.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'StokTalm2003';   
  temp.am = C2K(14.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 36; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 65;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BrowSiva2003';
  comment.Wwb = 'based egg diameter of 0.5 mm of Platycephalus_conatus: pi/6*0.05^3'; 
data.Wwi = 1704; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.04, see F1';

data.Ri = 1.6e6/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(14.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Platycephalus_conatus';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
2 33.3 32.2
3 36.3 33.9
4 41.3 39.1
5 44.7 43.2
6 52.1 NaN];
data.tL_fm(:,1) = 365 * (0.6+data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm    = C2K(14.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Fair1951'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;
weights.Lp = 3 * weights.Lp;
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
metaData.links.id_CoL = '4JP64'; % Cat of Life
metaData.links.id_ITIS = '644187'; % ITIS
metaData.links.id_EoL = '46568561'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus'; % Wikipedia
metaData.links.id_ADW = 'Platycephalus_richardsoni'; % ADW
metaData.links.id_Taxo = '183996'; % Taxonomicon
metaData.links.id_WoRMS = '274663'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-richardsoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'h274651owpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus}}';
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
bibkey = 'StokTalm2003'; type = 'techreport'; bib = [ ... 
'author = {Stokie, T. and Talman, S.}, ' ... 
'year = {2003}, ' ...
'title = {Age estimation of deepwater flathead (\emph{Neoplatycephalus conatus})}, ' ...
'institution = {Final report to Australian Fisheries Management Authority; Marine and Freshwater Resources Institute, Queenscliff, Victoria}, ' ...
'number = {R02/0925}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fair1951'; type = 'article'; bib = [ ... 
'doi = {10.1071/mf9510117}, ' ...
'author = {Fairbridge, W.S.}, ' ... 
'year = {1951}, ' ...
'title = {The New South Wales Tiger Flathead, \emph{Neoplatycephalus macrodon} ({O}gilby). {I}. {B}iology and Age Determination}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {2(2)}, ' ...
'pages = {117-178}'];
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
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-richardsoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
