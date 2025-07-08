  function [data, auxData, metaData, txtData, weights] = mydata_Glaniopsis_hanitschi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Gastromyzontidae';
metaData.species    = 'Glaniopsis_hanitschi'; 
metaData.species_en = 'Hillstream loach'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 15];

%% set data
% zero-variate data
data.ab = 14.5;        units.ab = 'd';  label.ab = 'age at birth';            bibkey.ab = 'guess'; 
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on Barbus barbus with temp correction';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';     bibkey.Lp = 'guess'; 
data.Li = 7.9;    units.Li = 'cm'; label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 1.0e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 0.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on tLW data; 0.00603*Lp^3.11, see F1, gives 0.3 g';
data.Wwi = 7;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on tLW data, 0.00603*Li^3.11, see F1, gives 3.7 g';

data.Ri = 333/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';            bibkey.Ri = 'guess';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% univariate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
0 1.8 0.141
1 2.7 0.328
2 3.4 0.557];
data.tLW(:,1) = 365 * (0.9 + data.tLW(:,1));
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'WatsBalo1985'; treat.tLW = {1 {'length','weight'}};
comment.tLW = 'Data from Baram River, Borneo';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW= weights.tLW * 10;
weights.ab = weights.ab * 0;
weights.Ri = weights.Ri * 0;

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

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight (g) = 0.00603*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic to Borneo';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3G5FJ'; % Cat of Life
metaData.links.id_ITIS = '687704'; % ITIS
metaData.links.id_EoL = '218214'; % Ency of Life
metaData.links.id_Wiki = 'Glaniopsis'; % Wikipedia
metaData.links.id_ADW = 'Glaniopsis_hanitschi'; % ADW
metaData.links.id_Taxo = '175011'; % Taxonomicon
metaData.links.id_WoRMS = '1018999'; % WoRMS
metaData.links.id_fishbase = 'Glaniopsis_-hanitschi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Glaniopsis_hanitschi}}';  
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
bibkey = 'WatsBalo1985'; type = 'article'; bib = [ ...  
'doi = {10.1007/bf00004856}, ' ...
'author = {Watson, D. J. and Balon, E. K.}, ' ...
'year = {1985}, ' ...
'title = {Determination of age and growth in stream fishes of northern {B}orneo}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {13(1)}, '...
'pages = {59–70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Glaniopsis-hanitschi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

