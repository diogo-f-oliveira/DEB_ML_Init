function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_conatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_conatus'; 
metaData.species_en = 'Deepwater flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 04];

%% set data
% zero-variate data

data.ab = 6;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(14.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 26*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'StokTalm2003';   
  temp.am = C2K(14.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 40; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 70;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BrowSiva2003';
  comment.Wwb = 'based egg diameter of 0.5 mm: pi/6*0.05^3'; 
data.Wwi = 2134; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.04, see F1';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 3 NaN  41.0
 4 37.7 41.9
 5 47.1 42.8
 6 50.9 43.7
 7 53.7 45.4
 8 56.0 45.9
 9 58.5 45.9
10 62.1 50.9
11 64.0 47.6
12 64.9 47.7
13 65.3 47.8
14 63.1 52.7
15 65.8 47.2
16 65.3 NaN
17 72.5 46.0
18 75.0 55.0
19 NaN 59.0
21 72.5 NaN
26 69.0 NaN];
data.tL_fm(:,1) = 365 * (0.6+data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm    = C2K(14.4);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'StokTalm2003'; treat.tL_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % fork length (cm),fecundity (#)
29.899	700242.423
32.900	618992.590
32.945	782263.563
36.932	1027670.016
41.008	1074108.236
43.964	1569383.333];
units.LN  = {'cm', '#'};  label.LN = {'fork length', 'fecundity'};  
temp.LN    = C2K(14.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BrowSiva2003';

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
F2 = 'Endemic to southern Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '77PN9'; % Cat of Life
metaData.links.id_ITIS = '644351'; % ITIS
metaData.links.id_EoL = '46568553'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus'; % Wikipedia
metaData.links.id_ADW = 'Platycephalus_conatus'; % ADW
metaData.links.id_Taxo = '183988'; % Taxonomicon
metaData.links.id_WoRMS = '274655'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-conatus'; % fishbase

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
bibkey = 'BrowSiva2003'; type = 'techreport'; bib = [ ... 
'author = {Lauren P. Brown and K. P. Sivakumaran.}, ' ... 
'year = {2003}, ' ...
'title = {Spawning and reproductive characteristics of {B}ight redfish and deepwater flathead in the {G}reat {A}ustralian {B}ight {T}rawl {F}ishery}, ' ...
'institution = {Final report to Australian Fisheries Management Authority; Marine and Freshwater Resources Institute, Queenscliff, Victoria}, ' ...
'number = {2003/003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-conatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
