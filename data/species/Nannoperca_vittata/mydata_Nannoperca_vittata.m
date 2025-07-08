  function [data, auxData, metaData, txtData, weights] = mydata_Nannoperca_vittata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Nannoperca_vittata'; 
metaData.species_en = 'Western pygmy perch'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};        
metaData.date_mod_1     = [2024 10 28];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 28];

%% set data
% zero-variate data
data.ab = 14; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.3;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 8;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'PenPott1991a';
  comment.Wwb = 'based on egg diameter of 0.9-1.1 mm: pi/6*0.1^3';
data.Wwp = 0.86;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01072*Lp^3.01, see F1';
data.Wwi = 5.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.01, see F1';
 
data.Ri = 793/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate ';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length-weight
data.tLW = [ ... % time since hatch (yr), total length (cm), weight (g)
    1 4.36 1.1
    2 5.25 1.9
    3 5.30 2.0 
    4 6.34 3.5
    5 6.50 3.4];
data.tLW(:,1) = (.8 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
  temp.tLW = C2K(20);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
  treat.tLW = {1, {'length','weight'}};
bibkey.tLW = 'PenPott1991';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
   4.36 203
   5.25 378
   5.30 360
   6.34 575
   6.50 746];
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PenPott1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 3;
weights.ab = weights.ab * 0;

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
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'mod_1: Wwb data updated';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic to the Vlaminghian region of south-western Australia'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '45MLG'; % Cat of Life
metaData.links.id_ITIS = '641886'; % ITIS
metaData.links.id_EoL = '211434'; % Ency of Life
metaData.links.id_Wiki = 'Nannoperca_vittata'; % Wikipedia
metaData.links.id_ADW = 'Nannoperca_vittata'; % ADW
metaData.links.id_Taxo = '478374'; % Taxonomicon
metaData.links.id_WoRMS = '1020471'; % WoRMS
metaData.links.id_fishbase = 'Nannoperca-vittata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Nannoperca_vittata}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...1020471
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PenPott1991'; type = 'Article'; bib = [ ...
'author = {Pen, L.J. and I.C. Potter}, ' ...
'year = {1991}, ' ...
'title = {Biology of the western pygmy perch, \emph{Edelia vittata}, and comparisons with two other teleost species endemic to southwestern {A}ustralia}, ' ... 
'journal = {Environ. Biol. Fishes}, ' ...
'volume = {31(4)}, '...
'pages = {365-380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PenPott1991a'; type = 'article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1991.tb04401.x}, ' ...
'author = {Pen, L.J. and I.C. Potter and Hilliard, R. W.}, ' ... 
'year   = {1991}, ' ...
'title  = {Biology of \emph{Galaxiella munda} {M}c{D}owall ({T}eleostei: {G}alaxiidae), including a comparison of the reproductive strategies of this and three other local species}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {717–731}, ' ...
'volume = {39(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Nannoperca_vittata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

