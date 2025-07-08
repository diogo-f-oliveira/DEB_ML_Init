function [data, auxData, metaData, txtData, weights] = mydata_Peristedion_cataphractum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Peristediidae';
metaData.species    = 'Peristedion_cataphractum'; 
metaData.species_en = 'African armoured gurnard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'biMc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 03];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(13.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Papa1981';   
  temp.am = C2K(13.8);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 22;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 40;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'NeveSous2021';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.09^3';
data.Wwp = 53;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00427*Lp^3.05, see F1';
data.Wwi = 328.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00427*Li^3.05, see F1';
 
data.Ri = 46437/365; units.Ri = '#/d';  label.Ri = 'reproduction rate at 32 cm';   bibkey.Ri = 'guess';
  temp.Ri = C2K(13.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Trigla lyra';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), total length (cm)
    0.5  8.76
    1.5 14.29
    2.5 18.16
    3.5 21.71
    4.5 23.74
    5.5 25.93
    6.5 26.86
    7.5 28.42
    8.5 29.98
    9.5 31.10
   10.5 32.15];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
  temp.tL = C2K(13.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BottGanc2015';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

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
F1 = 'length-weight: Ww in g = 0.00427*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '775H3'; % Cat of Life
metaData.links.id_ITIS = '167019'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Peristedion_cataphractum'; % Wikipedia
metaData.links.id_ADW = 'Peristedion_cataphractum'; % ADW
metaData.links.id_Taxo = '183526'; % Taxonomicon
metaData.links.id_WoRMS = '127233'; % WoRMS
metaData.links.id_fishbase = 'Peristedion-cataphractum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Peristedion_cataphractum}}';  
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
bibkey = 'BottGanc2015'; type = 'Article'; bib = [ ...
'doi = {10.1155/2015/804971}, ' ...
'author = {Teresa Bottari and Salvatore Gancitano and Paola Rinelli and Sergio Ragonese}, ' ...
'year = {2015}, ' ...
'title = {Comparison between Otoliths and Length Based Ageing and Growth of {A}frican Armoured Searobin (\emph{Peristedion cataphractum} {L}. 1758; Teleostei, {P}eristediidae) off the Southern Coasts of {S}icily ({M}editerranean {S}ea}, ' ... 
'journal = {Journal of Marine Biology}, ' ...
'volume = {804971}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Peristedion-cataphractum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

