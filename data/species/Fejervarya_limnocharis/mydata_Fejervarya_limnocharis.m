function [data, auxData, metaData, txtData, weights] = mydata_Fejervarya_limnocharis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Dicroglossidae';
metaData.species    = 'Fejervarya_limnocharis'; 
metaData.species_en = 'Indian cricket frog'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFp', 'jiFm'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 31];

%% set data
% zero-variate data

data.ab = 30; units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 365; units.tp = 'd';    label.tp = 'time since metam at puberty for female at f_l';   bibkey.tp = 'PancDesh2003';   
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';                        bibkey.am = 'PancDesh2003';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li  = 4.55;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';         bibkey.Li  = 'LalfVanl2019';
data.Lim  = 3.37;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';         bibkey.Lim  = 'LalfVanl2019';

data.Wwb = 1.9e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'LalfVanl2019';
  comment.Wwb = 'based on egg diameter of 1.53 mm: pi/6*0.153^3';
data.Wwj = 1.4;  units.Wwj = 'g';  label.Wwj = 'wet weight at metam for female';     bibkey.Wwj = 'guess';
  comment.Wwj = 'based on Euphlyctis_cyanophlyctis';
data.Wwi = 6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';

data.Ri  = 900/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';                bibkey.Ri  = 'LalfVanl2019';
  temp.Ri  = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '488 to 1035 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-length
data.tL = [ ... % time since metam (d), SVL (cm)
0	1.613
0	1.613
0	1.713
0	2.000
0	2.000
0	2.200
0	2.238
0	2.350
0	2.500
0	2.500
0	2.500
0	2.650
0	2.650
0	2.750
0	3.100
0	3.100
0	3.100
0	3.413
0	3.500
0	2.800
0	2.800
0	2.900
0.	3.000
1	2.313
1	2.900
1	2.700
1	2.800
1	2.800
1	2.975
1	2.975
1	2.975
1	2.975
1	3.225
2	2.400
2	2.713
2	2.700
2	3.000
2	3.000
2	3.000
2	3.000
2	3.113
2	3.200
3	2.800
3	3.000];
data.tL(:,1) = (data.tL(:,1) + 0.5) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since metam', 'SVL'};  
temp.tL   = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PancDesh2003'; 

% time-weight
data.tW = [ ... % time since metam (d), weight (g)
0	1
0	1
0	1
0	1
0	1
0	1
0	5
0	7
0	2
0	2
0	2
0	2
0	2
0	2
0	3
0	3
0	3
0	3
0	3
0	3
0	6
0	4
0	4
1	2
1	2
1	2
1	3
1	3
1	3
1	3
1	4
1	4
1	1
2	2
2	2
2	2
2	2
2	2
2	3
2	3
2	4
2	4
3	2
3	2];
data.tW(:,1) = (data.tW(:,1) + 0.5) * 365; % convert yr to d
units.tW = {'d', 'g'};  label.tW = {'time since metam', 'weight'};  
temp.tW   = C2K(26);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PancDesh2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.tL = 3 * weights.tL;
weights.Wwj = 3 * weights.Wwj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6HR35'; % Cat of Life
metaData.links.id_ITIS = '664962'; % ITIS
metaData.links.id_EoL = '330511'; % Ency of Life
metaData.links.id_Wiki = 'Fejervarya_limnocharis'; % Wikipedia
metaData.links.id_ADW = 'Fejervarya_limnocharis'; % ADW
metaData.links.id_Taxo = '168118'; % Taxonomicon
metaData.links.id_WoRMS = '1458136'; % WoRMS
metaData.links.id_amphweb = 'Fejervarya+limnocharis'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fejervarya_limnocharis}}';
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
bibkey = 'PancDesh2003'; type = 'Article'; bib = [ ... 
'author = {Katti Pancharatna and Shubha A. Deshpande}, ' ... 
'year = {2003}, ' ...
'title = {Skeletochronological data on age, body size and massin the Indian Cricket Frog \emph{Limnonectes limnocharis} ({B}OIE, 1835) ({A}nura: {R}anidae)}, ' ...
'journal = {Herpetozoa}, ' ...
'volume = {16(1/2)}, ' ...
'pages = {41-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LalfVanl2019'; type = 'Article'; bib = [ ...
'doi = {10.33493/scivis.19.04.03}, ' ...
'author = {C. Lalfakawmi and Michael Vanlalchhuana and Lalrinsanga and Lalbiakzuala and H. T. Lalremsanga}, ' ... 
'year = {2019}, ' ...
'title = {The breeding biology of \emph{Fejervarya limnocharis} complex, \emph{F. multistriata} ({H}allowell, 1861) in {M}izoram, northeast {I}ndia}, ' ...
'journal = {Science Vision}, ' ...
'volume = {19(4)}, ' ...
'pages = {134-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Fejervarya+limnocharis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

