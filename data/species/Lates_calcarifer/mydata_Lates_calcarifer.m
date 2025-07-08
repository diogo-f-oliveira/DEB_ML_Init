function [data, auxData, metaData, txtData, weights] = mydata_Lates_calcarifer
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centropomiformes'; 
metaData.family     = 'Latidae';
metaData.species    = 'Lates_calcarifer'; 
metaData.species_en = 'Barramundi'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMm', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 29];

%% set data
% zero-variate data

data.ab = 2.2;   units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = 'SchiBosm2007';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-15 h till hatch, then 36-40 h till start feeding';
data.am =  35* 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'guess';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 100;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SchiBosm2007'; 
  comment.Lp = 'TL<80 cm are males; TL>100 cm are females';
data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.44e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.87 mm: pi/6*0.087^3';
data.Wwi = 60e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri  = 47.7e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
31.136	28.569
60.771	57.115
91.906	175.572
122.292	322.107
152.302	502.344
181.937	705.047
213.073	902.156
243.833	1149.820
273.844	1386.237
303.854	1605.800
334.239	1830.987
364.625	2033.702
395.761	2247.664];
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(30);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SchiBosm2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
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
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight relationship: W = 0.0069 * TL^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; freshwater; brackish; reef-associated; amphidromous; depth range ? - 22 m. Tropical; 25 C - 31 C, preferred 27 C';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'protandric hermaphrodite';
metaData.bibkey.F3 = 'iucn'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3SJ33'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46581407'; % Ency of Life
metaData.links.id_Wiki = 'Lates_calcarifer'; % Wikipedia
metaData.links.id_ADW = 'Lates_calcarifer'; % ADW
metaData.links.id_Taxo = '45058'; % Taxonomicon
metaData.links.id_WoRMS = '278957'; % WoRMS
metaData.links.id_fishbase = 'Lates-calcarifer'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lates_calcarifer}}';
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
bibkey = 'SchiBosm2007'; type = 'Techreport'; bib = [ ...
'author = {Glenn Schipp and J\''{e}r\^{o}me Bosmans and John Humphrey}, ' ... 
'title = {Northern Territory Barramundi Farming Handbook}, ' ...
'year = {2007}, ' ...
'institution = {DEPARTMENT OF PRIMARY INDUSTRY, FISHERIES AND MINES}, ' ...
'howpublished = {\url{www.fisheries.nt.gov.au}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Lates-calcarifer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

