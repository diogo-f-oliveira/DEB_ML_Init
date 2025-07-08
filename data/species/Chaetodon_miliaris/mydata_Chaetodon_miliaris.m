function [data, auxData, metaData, txtData, weights] = mydata_Chaetodon_Chaetodon_miliaris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Chaetodontiformes'; 
metaData.family     = 'Chaetodontidae';
metaData.species    = 'Chaetodon_miliaris'; 
metaData.species_en = 'Millet butterflyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPh'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 02];

%% set data
% zero-variate data

data.ab = 30/24;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Zeke2003';   
  temp.ab = C2K(19.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Zeke2003';   
  temp.am = C2K(19.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 13;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Leis1989';
  comment.Wwb = 'based egg diameter of 0.75 mm: pi/6*0.075^3'; 
data.Wwp = 6.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02818*Lp^3.04, see F1';
data.Wwi = 68.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02818*Li^3.04, see F1';

data.GSI  = 0.09;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'Rals1981';   
  temp.GSI = C2K(19.2);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (g)
32.151	2.723
46.574	2.360
66.895	2.923
104.583	3.544
109.102	5.030
111.921	4.414
126.364	4.219
133.726	5.285
145.343	5.651
165.715	6.634
214.966	7.172
220.739	7.061
223.643	7.145
317.862	8.697
371.403	8.815];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(19.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Rals1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: weight in g = 0.02818*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 3 - 12 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '69NLG'; % Cat of Life
metaData.links.id_ITIS = '610236'; % ITIS
metaData.links.id_EoL = '46578245'; % Ency of Life
metaData.links.id_Wiki = 'Chaetodon_miliaris'; % Wikipedia
metaData.links.id_ADW = 'Chaetodon_miliaris'; % ADW
metaData.links.id_Taxo = '170351'; % Taxonomicon
metaData.links.id_WoRMS = '273328'; % WoRMS
metaData.links.id_fishbase = 'Chaetodon-miliaris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetodon_miliaris}}';
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
bibkey = 'Rals1981'; type = 'Article'; bib = [ ... 
'author = {Stephen Ralston}, ' ... 
'year = {1981}, ' ...
'title = {Aspects of the reproductive biology and feeding ecology of \emph{Chaetodon miliaris}, a {H}awaiian endemic butterflyfish}, ' ...
'journal = {Env. Biol Fish.}, ' ...
'volume = {6(2)}, ' ...
'pages = {167-176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rals1976'; type = 'Article'; bib = [ ... 
'author = {Stephen Ralston}, ' ... 
'year = {1976}, ' ...
'title = {AGE DETERMINATION OF A TROPICAL REEF BUTTERFLYFISH UTILIZING DAILY GROWTHRINGS OF OTOLITHS}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {74(4)}, ' ...
'pages = {990-994}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zeke2003'; type = 'Phdthesis'; bib = [ ... 
'author = {Z. A. Zekeria}, ' ... 
'year = {2003}, ' ...
'title = {Butterflyfishes of the Southern {R}ed {S}ea: Ecology and population dynamics}, ' ...
'school = {Groningen University, the Netherlands}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leis1989'; type = 'Article'; bib = [ ... 
'author = {Leis, J. M.}, ' ... 
'year = {1989}, ' ...
'title = {Larval biology of butterflyfishes ({P}isces, {C}haetodontidae): What do we really know?}, ' ...
'journal = {Envir. Biology of Fishes}, ' ...
'volume = {25}, ' ...
'pages = {87--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chaetodon-miliaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
