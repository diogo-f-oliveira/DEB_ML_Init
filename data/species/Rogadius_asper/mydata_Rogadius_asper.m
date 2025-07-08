function [data, auxData, metaData, txtData, weights] = mydata_Rogadius_asper
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Rogadius_asper'; 
metaData.species_en = 'Olive-tailed flathead'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

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

data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 26;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'SabrAmin2015';
  comment.Li = 'based on tL data';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BrowSiva2003';
  comment.Wwb = 'based egg diameter of 0.5 mm of Platycephalus_conatus: pi/6*0.05^3'; 
data.Wwi = 180; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on tL and tW data: 141.6*(26/24)^3';

data.Ri = 1.2e5/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95 as typical for Platycephalidae';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
0	11.5 12.4
1	15.2 15.3
2	19.5 19.0
3	22.1 21.2
4   24.0 NaN];
data.tL_fm(:,1) = 365 * (1.6+data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm    = C2K(27.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'SabrAmin2015'; treat.tL_fm = {1 {'females','males'}}; 

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g)
0	16.7 17.2
1	33.9 33.2
2	70.7 52.2
3	95.9 74.7
4  141.6 NaN];
data.tW_fm(:,1) = 365 * (1.6+data.tW_fm(:,1));  % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight', 'female'};  
temp.tW_fm    = C2K(27.5);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'SabrAmin2015'; treat.tW_fm = {1 {'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.ab = 0 * weights.ab;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

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
D2 = 'I had to add 1 yr to age estimates in tL and tW data to arrive at a good fit';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'known only from Coffs Harbor in northern New South Wales to Portland in Victoria, including Bass Strait and Tasmania';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4T9SN'; % Cat of Life
metaData.links.id_ITIS = '644479'; % ITIS
metaData.links.id_EoL = '46568568'; % Ency of Life
metaData.links.id_Wiki = 'Rogadius'; % Wikipedia
metaData.links.id_ADW = 'Rogadius_asper'; % ADW
metaData.links.id_Taxo = '186287'; % Taxonomicon
metaData.links.id_WoRMS = '218150'; % WoRMS
metaData.links.id_fishbase = 'Rogadius-asper'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'h274651owpublished = {\url{http://en.wikipedia.org/wiki/Rogadius-asper}}';
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
bibkey = 'SabrAmin2015'; type = 'article'; bib = [ ... 
'doi = {10.11648/j.ajls.s.2015030601.11}, ' ...
'author = {Manal Sabrah and Amal Amin and Aly El Sayed}, ' ...
'year = {2015}, ' ...
'title = {Age, Growth and Demographic Structures of Thorny Flathead \emph{Rogadius asper}, {C}uvier, 1829 ({P}ieces: {P}latycephalidae) from the Coastal Waters of the {S}uez {G}ulf}, ' ...
'journal = {American Journal of Life Sciences. Special Issue: New Horizons in Basic and Applied Zoological Research}, ' ...
'volume = {3(6-1)}, ' ...
'pages = {1-6}'];
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
'howpublished = {\url{http://www.fishbase.se/summary/Rogadius-asper.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
