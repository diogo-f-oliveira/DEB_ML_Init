  function [data, auxData, metaData, txtData, weights] = mydata_Trichomycterus_itacarambiensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Trichomycteridae';
metaData.species    = 'Trichomycterus_itacarambiensis'; 
metaData.species_en = 'Cave catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnc'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 26];

%% set data
% zero-variate data
data.ab = 6.7; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 8.3;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0141;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Traj1997a';
  comment.Wwb = 'based on egg diameter of 3 mm : pi/6*0.3^3';
data.Wwp = 0.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^2.93, see F1';
data.Wwi = 4.66;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00851*Li^2.93, see F1';

data.Ri = 10/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98 as found for Eremophilus_mutisii';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    180 2.5
    480 4.5
   1380 7.5];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Traj1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.Ri = weights.Ri * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^2.93'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Only occurs in the Olhos d''Agua Cave, Brazil';
metaData.bibkey.F2 = 'Traj1997'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '58FHR'; % Cat of Life
metaData.links.id_ITIS = '682218'; % ITIS
metaData.links.id_EoL = '1157237'; % Ency of Life
metaData.links.id_Wiki = 'Trichomycterus'; % Wikipedia
metaData.links.id_ADW = 'Trichomycterus_itacarambiensis'; % ADW
metaData.links.id_Taxo = '189373'; % Taxonomicon
metaData.links.id_WoRMS = '1010734'; % WoRMS
metaData.links.id_fishbase = 'Trichomycterus-itacarambiensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Trichomycterus}}';  
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
bibkey = 'Traj1997'; type = 'Article'; bib = [ ...
'author = {Trajano, E.}, ' ...
'year = {1997}, ' ...
'title = {Population ecology of \emph{Trichomycterus itacarambiensis}, a cave catfish from eastern {B}razil ({S}iluriformes, {T}richomycteridae)}, ' ... 
'journal = {Environ. Biol. Fishes}, ' ...
'volume = {50(4)}, '...
'pages = {357-369}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Traj1997a'; type = 'Article'; bib = [ ...
'author = {Trajano, E.}, ' ...
'year = {1997}, ' ...
'title = {Food and reproduction of \emph{Trichomycterus itacarambiensis}, cave catfish from south-eastern {B}razil}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {51}, '...
'pages = {53-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trichomycterus-itacarambiensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

