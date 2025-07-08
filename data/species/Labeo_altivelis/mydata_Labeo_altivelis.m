  function [data, auxData, metaData, txtData, weights] = mydata_Labeo_altivelis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeo_altivelis'; 
metaData.species_en = 'Rednose labeo'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 01];

%% set data
% zero-variate data
data.ab = 12;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'BaloCoch1974';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 27;    units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 49;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.3 mm of Labeo bata: pi/6*0.13^3';
data.Wwp = 239;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^3.08, see F1';
data.Wwi = 3600;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max. published weight; based on 0.00933*Li^3.08, see F1, gives 1499 g';

data.Ri = 9e5/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'guess';
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Labeo bata';

% univariate data
% time-length
data.tLW = [ ... % time (yr), std length (cm), weight (g)
    1  7.9   13
    2 12.9   58
    3 19.2  185
    4 24.2  386
    5 28.2  600
    6 29.4  678
    7 36.5 1260
    8 38.1 1420
    9 40.0 1630];
data.tLW(:,1) = 365 * (0 + data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time', 'std length', 'weight'};  
temp.tLW = C2K(28);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'BaloCoch1974'; treat.tLW = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5;
weights.Wwb = weights.Wwb * 5;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
%weights.Wwi = weights.Wwi * 0;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00933*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RHSX'; % Cat of Life
metaData.links.id_ITIS = '689261'; % ITIS
metaData.links.id_EoL = '218821'; % Ency of Life
metaData.links.id_Wiki = 'Labeo_altivelis'; % Wikipedia
metaData.links.id_ADW = 'Labeo_altivelis'; % ADW
metaData.links.id_Taxo = '177867'; % Taxonomicon
metaData.links.id_WoRMS = '1021700'; % WoRMS
metaData.links.id_fishbase = 'Labeo-altivelis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeo_altivelis}}';  
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
bibkey = 'BaloCoch1974'; type = 'Book'; bib = [ ...
'author = {Balon, E.K. and A.G. Coche}, ' ...
'year = {1974}, ' ...
'title = {Lake Kariba: a man-made tropical ecosystem in Central Africa}, ' ... 
'publisher = {Dr. W. Junk, The Hague}, ' ...
'series = {Monogr. Biol.}, ' ...
'volume = {24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeo-altivelis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

