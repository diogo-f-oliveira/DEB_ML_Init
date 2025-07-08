function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_koreanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_koreanus'; 
metaData.species_en = 'Rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 23];

%% set data
% zero-variate data

data.am = 14*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'ZhuaZhan2020';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 19.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 14;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01349*Lp^3.17, see F1';
data.Wwi = 171;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.17, see F1';

data.GSI  = 0.22;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'MishGanz2006';   
  temp.GSI = C2K(15);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
1.070	7.392
1.332	8.671
1.333	7.782
1.380	8.393
2.027	9.562
2.029	8.229
2.100	9.007
2.315	9.729
2.337	11.507
2.386	10.452
2.963	10.454
2.986	11.065
3.275	10.788
3.298	11.732
3.344	12.510
3.346	11.233
3.347	10.566
3.368	12.344
3.369	11.955
3.372	10.066
3.374	9.288
3.396	10.233
3.397	9.677
3.994	11.846
3.996	10.957
4.067	11.402
4.305	12.458
4.306	12.124
4.307	11.791
4.352	13.514
4.355	11.402
4.401	12.903
4.977	13.571
4.979	12.349
6.084	12.408
6.229	12.186
6.300	12.575
9.328	12.807
10.337	12.976];
data.tL(:,1) = 365*(0.9+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZhuaZhan2020'; 
comment.tL = 'data from Penglai';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
%D2 = 'Data Wwp and Wwi are at odds with LW data and ignored';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01349*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7MS'; % Cat of Life
metaData.links.id_ITIS = '644586'; % ITIS
metaData.links.id_EoL = '46568156'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_koreanus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_koreanus'; % ADW
metaData.links.id_Taxo = '187288'; % Taxonomicon
metaData.links.id_WoRMS = '274810'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-koreanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_koreanus}}';
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
bibkey = 'ZhuaZhan2020'; type = 'article'; bib = [ ... 
'doi = {10.1007/s00343-019-8303-x}, ' ...
'author = {Zhuang, Longchuan and Zhang, Chi and Liu, Qun and Ye, Zhenjiang},' ...
'year = {2020}, ' ...
'title = {Age, growth, reproductive biology, color pattern, and ontogenetic divergence of two closely related rockfishes  (\emph{Sebastes koreanus}  and  \emph{S. nudus}) off  the coasts of the {S}handong {P}eninsula, {C}hina}, ' ...
'journal = {Journal of Oceanology and Limnology}, ' ...
'volume = {38(1)}, ' ...
'pages = {204-225}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-koreanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
