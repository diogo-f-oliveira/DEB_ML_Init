function [data, auxData, metaData, txtData, weights] = mydata_Ophidion_josephi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ophidiiformes'; 
metaData.family     = 'Ophidiidae';
metaData.species    = 'Ophidion_josephi'; 
metaData.species_en = 'Crested cusk-eel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.2); % K, body temp
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

data.am = 27*30.5;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Retz1991';   
  temp.am = C2K(24.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Retz1991';
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 4.2e-3;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 19.3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00102*Li^3.06, see F1';

data.Ri  = 3; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';      bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), total length (cm)
  1.782	10.414 11.391
 61.990	11.579 12.180
124.305	16.917 16.504
185.313	17.256 17.030
248.921	17.444 17.030
307.355	18.233 18.346
370.148	19.060 18.609
429.414	19.398 18.835];
data.tL_fm(:,1) = data.tL_fm(:,1)+150; % set origin at birth
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm    = C2K(24.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
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
D1 = 'males are assumed to differ for females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00102*(TL in cm)^3.06';
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

