  function [data, auxData, metaData, txtData, weights] = mydata_Macquaria_novemaculeata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Macquaria_novemaculeata'; 
metaData.species_en = 'Australian bass'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0pMc', 'piFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 08];

%% set data
% zero-variate data
data.ab = 6.5;      units.ab = 'd';  label.ab = 'age at puberty for females';  bibkey.ab = 'guess';
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 47*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Wiki';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'guess';
data.Li = 60;    units.Li = 'cm'; label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'TrnsHay20025';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwi = 2.9e3;   units.Wwi = 'g';  label.Wwi = 'ultimate weight';               bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^3.05, see F1';
 
data.Ri = 44e4/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'Wiki';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% length-change in length
data.LdL = [ ... % total length (cm), change in length (cm/yr)
 0	13.704 11.958 11.721
10	10.774  9.205  8.406
20	 7.873  6.423  5.032
30	 4.973  3.641  1.717
40	 2.072  0.858  NaN];
data.LdL(:,2:4) = data.LdL(:,2:4)/ 365; % comvert cm/yr to cm/d
units.LdL = {'cm', 'cm/d'}; label.LdL  = {'total length', 'change in length'};  
temp.LdL = C2K(24); units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'WildSawy2005'; treat.LdL = {1 {'Somerset','Boondooma & Moogerah','Cressbrook'}};
label.treat.LdL = 'Australian Lake';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;
weights.ab = 0 * weights.ab;
weights.Lp = 3 * weights.Lp;
weights.Li = 3 * weights.Li;
weights.Wwb = 3 * weights.Wwb;

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight relationship: Ww in g = 0.01096*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3X24X'; % Cat of Life
metaData.links.id_ITIS = '641898'; % ITIS
metaData.links.id_EoL = '46578825'; % Ency of Life
metaData.links.id_Wiki = 'Macquaria_novemaculeata'; % Wikipedia
metaData.links.id_ADW = 'Macquaria_novemaculeata'; % ADW
metaData.links.id_Taxo = '179432'; % Taxonomicon
metaData.links.id_WoRMS = '1585685'; % WoRMS
metaData.links.id_fishbase = 'Macquaria-novemaculeata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macquaria_novemaculeata}}';
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
bibkey = 'WildSawy2005'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1365-2400.2004.00412.x}, ' ...
'author = {G. R. Wilde and W. Sawynok}, ' ...
'year = {2005}, ' ...
'title = {Growth rate and mortality of {A}ustralian bass, \emph{Macquaria novemaculeata}, in four freshwater impoundments in south-eastern {Q}ueensland, {A}ustralia}, ' ... 
'journal = {Fisheries Management and Ecology}, ' ...
'volume = {12(1)}, '...
'pages = {1–7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TrnsHay20025'; type = 'Article'; bib = [ ... 
'author = {Trnski, Thomas and Hay, Amanda C. and Fielder, D. Stewart}, ' ...
'year = {2005}, ' ...
'title = {Larval development of estuary perch (\emph{Macquaria colonorum}) and Australian bass (\emph{M. novemaculeata}) ({P}erciformes: {P}ercichthyidae), and comments on their life history}, ' ... 
'journal = {Fish. Bull.}, ' ...
'volume = {103}, '...
'pages = {183–194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Macquaria-novemaculeata}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

