function [data, auxData, metaData, txtData, weights] = mydata_Brachypterois_serrulata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Brachypterois_serrulata'; 
metaData.species_en = 'Sawcheek scorpionfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 05 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 02];

%% set data
% zero-variate data

data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'NaraVela2021'; 
data.Li  = 15;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.4e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'NaraVela2021';
  comment.Wwb = 'based on egg diameter of 0.44 mm: pi/6*0.044^3';
data.Wwi = 35.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^2.96, see F1; max published weight 29 g';
 
% uni-variate data
% length-weigth-fecundity
LWN = [ ... %  total length(mm), weight (g), fecundity (#)
  78  7    1896
  83  7    2080
  83  9    2085
  85  9    2147
  87  9    2204
  87  9    2214
  88  7    2231
  92 10    2382
  92 10    2505
  92 10    2727
  92 10    2740
  92 10    2800
  92 10    2621
  92 12    2667
  94 11    3194
  94 13    3264
  94 11    3074
  94 13    3583
  94 13.5  3845
  94 10    3863
  94 12    4031
  94 12    4208
  95 11    4221
  95 10.5  4344
  96 11    4630
  96 11    4651
  98 16    5344
  98 16    5648
  98 16    5726
  98 15    5098
 102 16    6681
 102 18    7013
 102 16    7170
 102 16.5  7430
 102 17    8425
 102 17   10935
 105 18   14494
 105 18   14921
 105 14.6 17017
 106 17   18001
 106 19   20488];
LWN(:,1) = LWN(:,1)/ 10; % convert mm to cm
data.LW = LWN(:,1:2);
units.LW = {'cm', 'g'}; label.LW = {'total length','weight'};  
bibkey.LW = 'NaraVela2021'; 
%
data.LN = LWN(:,[1 3]);
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(28); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'NaraVela2021'; 

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
%weights.Lp = 10 * weights.Lp; 
weights.LW = 3 * weights.LW; 
weights.LN = 3 * weights.LN; weights.LN(1:7)=0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Due to absence of growth data, v and [p_M] were fixed at the values for Gymnapistes_marmoratus';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww in g = 0.01175*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'MYWQ'; % Cat of Life
metaData.links.id_ITIS = '643810'; % ITIS
metaData.links.id_EoL = '46568083'; % Ency of Life
metaData.links.id_Wiki = 'Brachypterois_serrulata'; % Wikipedia
metaData.links.id_ADW = 'Brachypterois_serrulata'; % ADW
metaData.links.id_Taxo = '164553'; % Taxonomicon
metaData.links.id_WoRMS = '279987'; % WoRMS
metaData.links.id_fishbase = 'Brachypterois-serrulata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brachypterois_serrulata}}';
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
bibkey = 'NaraVela2021'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s42995-020-00083-7}, ' ...
'author = {Muddula Krishna Naranji and Govinda Rao Velamala and Kandula Sujatha}, ' ... 
'year = {2021}, ' ...
'title = {Reproductive biology of female sawcheek scorpionfish, \emph{Brachypterois serrulata} ({R}ichardson, 1846) ({T}eleostei; {S}corpaenidae) from {V}isakhapatnam {C}oast, {I}ndia}, ' ...
'journal = {Marine Life Science \& Technology}, ' ...
'volume = {3}, ' ...
'pages = {347–354}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Brachypterois-serrulata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

