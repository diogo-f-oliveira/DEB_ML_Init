  function [data, auxData, metaData, txtData, weights] = mydata_Chologaster_cornuta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Percopsiformes'; 
metaData.family     = 'Amblyopsidae';
metaData.species    = 'Chologaster_cornuta'; 
metaData.species_en = 'Swampfish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvae'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 06 27];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 06 27]; 


%% set data
% zero-variate data
data.ab = 0.6 * 30.5; units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'Poul1963'; 
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 8*30.5;  units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'Poul1963';
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'tab 5, 11-12 months at first reproduction';
data.am = 10*365;  units.am = 'd';   label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'average longevity for Amblyopsis_rosae';
  
data.Lp = 3.6;    units.Lp = 'cm';  label.Lp = 'standard length at puberty';   bibkey.Lp = 'Poul1963'; 
  comment.Lp = 'table 5, 23-53 mm standard length';
data.Li = 5.7;  units.Li = 'cm';  label.Li = 'ultimate standard length';       bibkey.Li = {'Wiki', 'Poul1963'};
  comment.Li = 'based on TL = 7 cm and SL = 0.77 * TL, see F3';
 
data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Poul1963';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 0.46; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'Poul1963';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 1.7; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';            bibkey.Wwi = {'Poul1963','fishbase'};
  comment.Wwi = 'based on 0.00389*7^3.12';
  
data.Ri = 98/365; units.Ri = '#/d'; label.Ri = 'ultimate reprod rate';         bibkey.Ri = 'Poul1963';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
     
% uni-variate data
data.tL = [ ... % time (d), standard length (mm)
 45 1.8
107 3.0
229 4.8
352 5.5
442 5.7]; 
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'}; 
temp.tL = C2K(13); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Poul1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'lives in swamp above ground, not in caves';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'From photo: SL = 0.77 * TL';
metaData.bibkey.F3 = 'Wiki'; 
F4 = 'Incubates eggs in gill chamber of females';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '69YGQ'; % Cat of Life
metaData.links.id_ITIS = '164390'; % ITIS
metaData.links.id_EoL = '207106'; % Ency of Life
metaData.links.id_Wiki = 'Chologaster_cornuta'; % Wikipedia
metaData.links.id_ADW = 'Chologaster_cornuta'; % ADW
metaData.links.id_Taxo = '170962'; % Taxonomicon
metaData.links.id_WoRMS = '1021666'; % WoRMS
metaData.links.id_fishbase = 'Chologaster-cornuta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chologaster_cornuta}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitCulv2012'; type = 'Book'; bib = [ ...  
'author = {William. B. White and David C. Culver}, ' ...
'year = {2012}, ' ...
'title  = {Encyclopedia of caves}, ' ...
'publisher = {Elsevier}'];
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
bibkey = 'Poul1963'; type = 'Article'; bib = [ ...  
'author = {Thomas L. Poulson}, ' ...
'year = {1963}, ' ...
'title = {Cave Adaptation in {A}mblyopsid Fishes}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {70}, '...
'number = {2}, '...
'pages = {257--290}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chologaster-cornuta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

