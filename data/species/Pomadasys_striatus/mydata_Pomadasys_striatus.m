function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_striatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_striatus'; 
metaData.species_en = 'Striped grunter'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 17];

%% set data
% zero-variate data

data.ab = 7.7;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'base on growth at 5 yr';
  
data.Lp  = 9.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Pomadasys_kaakan: 35*22/80';
data.Li  = 22;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.8 mm for Pomadasys_argenteus: pi/6*0.08^3'; 
data.Wwi = 201; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.00, see F1, gives 212 g';

data.Ri  = 8.9e3/365;   units.Ri  = '#/d'; label.Ri  = 'reproduction rate at TL 58 cm';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on tLW dta; 286520 ova at TL = 58 cm for Pomadasys_argenteus: 286520*(22/70)^3';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1  7.78 10.23
    2 10.32 21.41
    3 12.59 36.18
    4 13.81 49.76];
data.tLW(:,1) = 365 * (0.9 + data.tLW(:,1));  % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(27.4);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'LatiShen1972'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwb = 5 * weights.Wwb;
      
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01995*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4LQMF'; % Cat of Life
metaData.links.id_ITIS = '630226'; % ITIS
metaData.links.id_EoL = '46578435'; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_striatus'; % ADW
metaData.links.id_Taxo = '184508'; % Taxonomicon
metaData.links.id_WoRMS = '218562'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-striatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys}}';
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
bibkey = 'LatiShen1972'; type = 'Article'; bib = [ ... 
'author = {Latif, A.F.A. and S. Shenouda}, ' ... 
'year = {1972}, ' ...
'title = {Biological studies on \emph{Rhonciscus striatus} (fam. {P}omadasydae) from the {G}ulf of {S}uez}, ' ...
'journal = {Bull. Inst. Ocean. Fisheries (Egypt)}, ' ...
'volume = {2}, ' ...
'pages = {497-522}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-striatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
