function [data, auxData, metaData, txtData, weights] = mydata_Osphronemus_goramy

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Osphronemidae';
metaData.species    = 'Osphronemus_goramy'; 
metaData.species_en = 'Giant gourami'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-W_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 07];

%% set data
% zero-variate data

data.ab = 4; units.ab = 'd';  label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28.5); units.temp.ab = 'K'; label.temp.am = 'temperature'; 
  comment.ab = '2-3 d';
data.am = 10 * 365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 70;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 7.4e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at puberty';     bibkey.Wwb = 'AzriSyan2022';
  comment.Wwb = 'based on egg diameter of 2.42 mm: pi/6*0.242^3; hardened egg diam 3.42 mm';
data.Wwp = 474; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.01698*Lp^3.01, see F1';
data.Wwi = 6.1e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01698*Li^3.01, see F1';
 
data.Ri = 3*15172/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assumed: 3 spawns per yr; AzriSyan2022 gives rel fecundity of 1029/kg';

% uni-variate data
% time-weight
data.tW = [ ... % time since start (d), weight (g)
  0	 14.170  14.170  14.170
 30	 57.750  54.250  47.250
 60	103.250  97.125  84.000
 90	182.875 170.625 147.875
120	309.750 264.250 203.875];
units.tW   = {'d', 'g'};  label.tW = {'time since start', 'weight'};  
temp.tW    = C2K(28.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
treat.tW = {1, {'feeding rate 0.06*W/d','feeding rate 0.04*W/d','feeding rate 0.02*W/d'}};
bibkey.tW = 'AryaAzri2027'; 
comment.tW = 'feed 340.50 kcal/kg: 0.3  protein, 0.07 lipid, 0.06 fiber, 0.12 ash, and 0.12 moisture; initial TL 9.88 cm';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.ab = 0 * weights.ab;

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
D2 = 'tW data shows that a larger fraction of the feed reach the fish at lower feeding rate';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01698*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6TC8Q'; % Cat of Life
metaData.links.id_ITIS = '638762'; % ITIS
metaData.links.id_EoL = '206862'; % Ency of Life
metaData.links.id_Wiki = 'Osphronemus_goramy'; % Wikipedia
metaData.links.id_ADW = 'Osphronemus_goramy'; % ADW
metaData.links.id_Taxo = '46863'; % Taxonomicon
metaData.links.id_WoRMS = '281942'; % WoRMS
metaData.links.id_fishbase = 'Osphronemus-goramy'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Osphronemus_goramy}}';
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
bibkey = 'AryaAzri2027'; type = 'Article'; bib = [ ...
'doi = {10.17582/journal.pjz/2017.49.5.1775.1781}, ' ...
'author = {Netti Aryani and Azrita Azrita and Ainul Mardiah and Hafrijal Syandri}, ' ...
'year = {2017}, ' ...
'title = {Influence of Feeding Rate on the Growth, Feed Efficiency and Carcass Composition of the Giant Gourami (\emph{Osphronemus goramy})}, ' ... 
'journal = {Pakistan J. Zool.}, ' ...
'volume = {49(5)}, '...
'pages = {1775-1781}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AzriSyan2022'; type = 'Article'; bib = [ ...
'doi = {10.12688/f1000research.53760.2}, ' ...
'author = {Azrita Azrita and Hafrijal Syandri and Netti Aryani}, ' ...
'year = {2022}, ' ...
'title = {Reproductive characteristics of the giant gurami sago strain (\emph{Osphronemus goramy} Lacep\`{e}de, 1801): basic knowledge for a future hatchery development strategy}, ' ... 
'journal = {F1000Research}, ' ...
'volume = {10}, '...
'pages = {922}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Osphronemus-goramy.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

