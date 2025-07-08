  function [data, auxData, metaData, txtData, weights] = mydata_Cobitis_turcica
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Cobitis_turcica'; 
metaData.species_en = 'Turkish spined loach'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 03];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'ZaneMrak2003';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.5;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'guess';
data.Li = 12.7;    units.Li = 'cm'; label.Li = 'ultimate std length for females'; bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.2 mm of Cobitis_simplicispina: pi/6*0.12^3';
data.Wwp = 0.74;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00437*Lp^3.01, see F1';
data.Wwi = 10.8; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00437*Li^3.01, see F1; max published weight 15.1 g';

data.Ri = 2141/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Cobitis_simplicispina';
  
% univariate data

% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm)
1	5.11 1.85
2	6.88 3.92
3	8.47 5.87
4   9.65 7.54
5  10.38 8.95];
data.tLW(:,1) = 365 * (0.4+data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(22);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'KocaOlme2015'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00437*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
F2 = 'known from central Anatolia, Turkey, and Kor river basin in Iran';
metaData.bibkey.F2 = 'EkmeErka2003';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WK4K'; % Cat of Life
metaData.links.id_ITIS = '687879'; % ITIS
metaData.links.id_EoL = '215209'; % Ency of Life
metaData.links.id_Wiki = 'Cobitis_turcica'; % Wikipedia
metaData.links.id_ADW = 'Cobitis_turcica'; % ADW
metaData.links.id_Taxo = '171529'; % Taxonomicon
metaData.links.id_WoRMS = '1016356'; % WoRMS
metaData.links.id_fishbase = 'Cobitis_turcica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cobitis_turcica}}';
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
bibkey = 'KocaOlme2015'; type = 'Article'; bib = [ ...  
'author = {Habil U\v{g}ur Koca and Murtaza \"{O}lmez}, ' ...
'year = {2015}, ' ...
'title = {Aksu \c{C}ayı-{K}\"{o}pr\"{u}\c{c}ay {N}ehri ({I}sparta-{T}\"{u}rkiye) \emph{Cobitis turcica} ({H}anko, 1925) Populasyonunda Ya\c{s}, {B}\"{u}y\"{u}me ve \"{O}l\"{u}m {O}ranlar{\i}}, ' ... 
'journal = {LIMNOFISH-Journal of Limnology and Freshwater Fisheries Research}, ' ...
'volume = {1(3)}, '...
'pages = {113-121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cobitis-turcica}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

