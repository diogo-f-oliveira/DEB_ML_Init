function [data, auxData, metaData, txtData, weights] = mydata_Genypterus_chilensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ophidiiformes'; 
metaData.family     = 'Ophidiidae';
metaData.species    = 'Genypterus_chilensis'; 
metaData.species_en = 'Red cusk-eel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 09];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 09];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(8.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 67.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Genypterus_blacodes: 90*150/200';
data.Li  = 150;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 3.35e-5;   units.Wwb  = 'cm';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.4 mm of Genypterus_blacodes: pi/6*0.04^3';
data.Wwp = 1.6e3;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00257*Lp^3.17, see F1';
data.Wwi = 20.3e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00257*Li^3.17, see F1';
 
data.Ri = 1e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess'; 
  temp.Ri = C2K(8.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Genypterus_blacodes';

% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0.000	109.113
30.792	141.844
58.752	170.131
89.189	195.602
102.284	204.441
131.306	229.924
164.221	258.730
193.243	278.062
220.849	306.911
261.551	350.191];
units.tW   = {'d', 'g'};  label.tW = {'time', 'weight'};  
temp.tW    = C2K(17);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'FossImsl2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_fN','tL_mN'}; subtitle1 = {'Data for females, males, north austral zone'};
% set2 = {'tL_fS','tL_mS'}; subtitle2 = {'Data for females, males, south austral zone'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00257*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FNTF'; % Cat of Life
metaData.links.id_ITIS = '165002'; % ITIS
metaData.links.id_EoL = '46565542'; % Ency of Life
metaData.links.id_Wiki = 'Genypterus'; % Wikipedia
metaData.links.id_ADW = 'Genypterus_chilensis'; % ADW
metaData.links.id_Taxo = '174840'; % Taxonomicon
metaData.links.id_WoRMS = '278704'; % WoRMS
metaData.links.id_fishbase = 'Genypterus-chilensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Genypterus}}';
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
bibkey = 'FossImsl2020'; type = 'Article'; bib = [ ... 
'doi = {10.3856/vol48-issue5-fulltext-2528}, ' ...
'author = {Atle Foss and Albert K.D. Imsland and Felipe A. Brice\~{n}o and Spartaco Magnolfi and Piero Magnolfi and Xavier Guti\''{e}rrez}, ' ... 
'year = {2020}, ' ...
'title = {Stocking density and its influence on the productivity of red cusk eel, \emph{Genypterus chilensis} ({G}uichenot, 1848), in shallow raceways}, ' ...
'journal = {Latin American Journal of Aquatic Research}, ' ...
'volume = {48(5)}, ' ...
'pages = {818-825}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Genypterus-chilensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

