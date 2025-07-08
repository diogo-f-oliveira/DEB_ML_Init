function [data, auxData, metaData, txtData, weights] = mydata_Lepophidium_brevibarbe

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ophidiiformes'; 
metaData.family     = 'Ophidiidae';
metaData.species    = 'Lepophidium_brevibarbe'; 
metaData.species_en = 'Shortbeard cusk-eel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 24];

%% set data
% zero-variate data

data.am = 20*30.5;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Retz1991';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Retz1991';
data.Li  = 28.8;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 4.2e-3;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 93;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00269*Li^3.11, see F1';

data.Ri  = 8.2; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';      bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), total length (cm)
  1.079	10.000 11.154
 32.613	11.385 12.908
 61.869	11.523 11.846
154.011	12.400 13.277
184.366	12.723 14.154
214.822	14.154 15.723
246.273	14.615 15.354
275.562	15.123 14.754
305.855	14.754 NaN
336.369 NaN    16.831
366.558	15.308 16.138
399.126	16.138 17.154
427.344	16.785 19.415
457.679	16.877 19.369
490.209	17.292 19.462
519.506	17.892 20.477
550.978	18.585 20.523];
data.tL_fm(:,1) = data.tL_fm(:,1)+200; % set origin at birth
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm    = C2K(26);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Retz1991'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.tL_fm = 5 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.wwi = 3 * weights.Wwi;

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
% set1 = {'tL_fN','tL_mN'}; subtitle1 = {'Data for females, males, north austral zone'};
% set2 = {'tL_fS','tL_mS'}; subtitle2 = {'Data for females, males, south austral zone'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00269*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'eggs floating in gelatinous mass';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3TG34'; % Cat of Life
metaData.links.id_ITIS = '164825'; % ITIS
metaData.links.id_EoL = '46565515'; % Ency of Life
metaData.links.id_Wiki = 'Lepophidium_brevibarbe'; % Wikipedia
metaData.links.id_ADW = 'Lepophidium_brevibarbe'; % ADW
metaData.links.id_Taxo = '178465'; % Taxonomicon
metaData.links.id_WoRMS = '275619'; % WoRMS
metaData.links.id_fishbase = 'Lepophidium-brevibarbe'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepophidium_brevibarbe}}';
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
bibkey = 'Retz1991'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1446396 }, ' ...
'author = {Michael E. Retzer}, ' ... 
'year = {1991}, ' ...
'title = {Life-History Aspects of Four Species of Cusk-Eels ({O}phidiidae: {O}phidiiformes) from the Northern {G}ulf of {M}exico}, ' ...
'journal = {Copeia}, ' ...
'volume = {1991(3)}, ' ...
'pages = {703-710}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Lepophidium-brevibarbe.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

