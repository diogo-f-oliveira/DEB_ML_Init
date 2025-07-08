function [data, auxData, metaData, txtData, weights] = mydata_Pagrus_major

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagrus_major'; 
metaData.species_en = 'Red seabream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.8); % K

metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 31];

%% set data
% zero-variate data;

data.ab = 9.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(21.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 26*365;       units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';   
  temp.am = C2K(21.8);  units.temp.am = 'K'; label.temp.am = 'temperature';        
  
data.Lp  = 34.3;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 100;    units.Li  = 'cm';   label.Li  = 'ultimate total lenght';    bibkey.Li  = 'fishbase';
  comment.Li = 'Wiki gives 120 cm';

data.Wwb = 5.24e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 578;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01288*Lp^3.03, see F1';
data.Wwi = 14.8e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.03, see F1';

data.Ri  = 4544948/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(21.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

data.tL = [ ... % rings (#), total length (cm)
0	 9.691
1	17.384
2	25.959
3	30.783
4	35.830
5	40.213
6	43.717
7	46.778
8	52.044];
data.tL(:,1) = (data.tL(:,1) + 0.66)*365; % convert year class to time since birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MuraShin1949';
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

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
D2 = 'Food availability is taken variable in tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BZNP'; % Cat of Life
metaData.links.id_ITIS = '647892'; % ITIS
metaData.links.id_EoL = '46579974'; % Ency of Life
metaData.links.id_Wiki = 'Pagrus_major'; % Wikipedia
metaData.links.id_ADW = 'Pagrus_major'; % ADW
metaData.links.id_Taxo = '182496'; % Taxonomicon
metaData.links.id_WoRMS = '273976'; % WoRMS
metaData.links.id_fishbase = 'Pagrus-major'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pagrus_major}}';
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
bibkey = 'MuraShin1949'; type = 'Article'; bib = [...
'doi = {10.2331/SUISAN.15.158}, ' ...
'author = {S. Murakami and S. Shindo}, ' ...
'year   = {1949},.' ...
'title = {Studies on the stocks of some economically important marine fishes caught around {A}makusa. {VI}. On snapper, \emph{Pagrosomus major} ({T}emminck \& {S}chlegel), of {A}makusa}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'pages = {158-160}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pagrus-major.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
