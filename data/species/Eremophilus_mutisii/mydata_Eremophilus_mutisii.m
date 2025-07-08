  function [data, auxData, metaData, txtData, weights] = mydata_Eremophilus_mutisii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Trichomycteridae';
metaData.species    = 'Eremophilus_mutisii'; 
metaData.species_en = 'Captain'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL_f'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 29];

%% set data
% zero-variate data
data.ab = 6.7; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'AcosBerr2017';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 4.2 d; assumed: 2.5 d since hatch to start feeding';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'PiniAbri2006';
data.Li = 30;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AcosBerr2017';
  comment.Wwb = 'based on egg diameter of 1.052 mm: pi/6*0.1^3';
data.Wwp = 8.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00661*Lp^2.99, see F1';
data.Wwi = 172.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00661*Li^2.99, see F1';

data.Ri = 20347/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Synodontis_clarias';
  
% uni-variate data
% length-length
data.LL = [ ... % initial length (cm) and after 1 yr
 9.11 11.56
10.78 12.76
10.21 15.43];
units.LL = {'cm', 'cm'};  label.LL = {'initial length', 'length after 1 yr'};  
  temp.LL = C2K(12.5);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
  treat.LL = {0, {'L0','L1'}};
bibkey.LL = 'PiniAbri2006';
comment.LL = 'Data for reservoir 2,4,6';

% weight-weight
data.WW = [ ... % initial weight (g) and after 1 yr
8.72  9.54
9.76 18.55
7.89 35.23];
units.WW = {'g', 'g'};  label.WW = {'initial weight', 'weight after 1 yr'};  
  temp.WW = C2K(12.5);  units.temp.WW = 'K'; label.temp.WW = 'temperature';
  treat.WW = {0, {'W0','W1'}};
bibkey.WW = 'PiniAbri2006';
comment.WW = 'Data for reservoir 2,4,6';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = weights.LL * 3;
weights.WW = weights.WW * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00661*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GFSV'; % Cat of Life
metaData.links.id_ITIS = '682102'; % ITIS
metaData.links.id_EoL = '218444'; % Ency of Life
metaData.links.id_Wiki = 'Eremophilus_mutisii'; % Wikipedia
metaData.links.id_ADW = 'Eremophilus_mutisii'; % ADW
metaData.links.id_Taxo = '174011'; % Taxonomicon
metaData.links.id_WoRMS = '1022920'; % WoRMS
metaData.links.id_fishbase = 'Eremophilus-mutisii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Eremophilus_mutisii}}';  
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
bibkey = 'PiniAbri2006'; type = 'Article'; bib = [ ...
'author = {Gabriel Pinilla and Maritza Abril and Esperanza Gonz\''{A}lez}, ' ...
'year = {2006}, ' ...
'title = {Growth, feeding and reproduction of the catfish \emph{Eremophilus mutisii} ({P}isces: {T}richomycteridae), from artificial reservoirs in {C}olombia}, ' ... 
'journal = {Rev. Biol. Trop.}, ' ...
'volume = {54(2)}, '...
'pages = {589-597}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AcosBerr2017'; type = 'Article'; bib = [ ...
'doi = {10.19052/mv.4396}, ' ...
'author = {Acosta, J.A. Gonz\''{a}lez and Berrueco, B.E. Zapata and Puccini, R. Rosado }, ' ...
'year = {2017}, ' ...
'title = {Desarrollo embrionario del capit\''{a}n de la sabana, \emph{Eremophilus mutisii} ({P}isces: {T}richomycteridae)}, ' ... 
'journal = {Rev. Med. Vet.}, ' ...
'volume = {35}, '...
'pages = {137-147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Eremophilus-mutisii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

