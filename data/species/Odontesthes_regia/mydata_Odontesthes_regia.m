function [data, auxData, metaData, txtData, weights] = mydata_Odontesthes_regia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Odontesthes_regia'; 
metaData.species_en = 'Chilean silverside'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0iMcp', '0iMm', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 12];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(15.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 26;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'PlazEspe2011';
  comment.Li = 'fishbases gives TL 18 cm';

data.Wwb = 5.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'PlazEspe2011';
  comment.Wwb = 'based of egg diameter of 1.8-2.5 mm: pi/6*0.22^3';
data.Wwp  = 26;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on 0.00562*Lp^2.93, see F1';
data.Wwi  = 151;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = {'PlazEspe2011','fishbase'};
  comment.Wwi = 'based on Li, tL and tW data: 109*(26/23.3)^3';

data.Ri = 7318/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'PlazEspe2011';   
  temp.Ri = C2K(15.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... time since birth (d), total length (cm)
  0.000	13.834
 39.973	14.037
 69.674	14.082
 98.356	15.105
127.514	16.715
159.162	17.855
200.229	18.567
231.884	19.473
261.553	20.575
291.716	21.715
322.381	22.621
353.052	23.331];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'}; 
temp.tL    = C2K(15.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OrelTole2007';

% time-weight
data.tW = [ ... time since birth (d), weight (g)
  0.000	15.806
 40.492	17.274
 69.687	16.870
 98.443	23.618
126.708	34.129
160.459	43.129
200.755	47.984
231.182	55.858
262.291	72.012
291.100	82.146
321.616	95.666
352.132	109.185];
units.tW   = {'d', 'g'};  label.tW = {'time', 'weight'}; 
temp.tW    = C2K(15.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'OrelTole2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
F2 = ' Feeds primarily on the eggs of Engraulis ringens';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '48NS4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46566589'; % Ency of Life
metaData.links.id_Wiki = 'Odontesthes_regia'; % Wikipedia
metaData.links.id_ADW = 'Odontesthes_regia'; % ADW
metaData.links.id_Taxo = '181650'; % Taxonomicon
metaData.links.id_WoRMS = '281830'; % WoRMS
metaData.links.id_fishbase = 'Odontesthes-regia'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Odontesthes_regia}}'];
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
bibkey = 'OrelTole2007'; type = 'Article'; bib = [ ... 
'ISSN = {0717-652X}, ' ...
'author = {Francisco A. Orellana and H\''{e}ctor E. Toledo}, ' ... 
'year = {2007}, ' ...
'title = {GROWTH OF JUVENILE MARINE SILVERSIDE (\emph{Odontesthes regia} {H}UMBOLDT, 1821) ({A}THERINIDAE) IN SEA NET PEN CAGES}, ' ...
'journal = {Gayana}, ' ...
'volume = {71(1)}, ' ...
'pages = {76-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PlazEspe2011'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.fishres.2011.06.009}, ' ...
'author = {Plaza, G. and Espejo, V. and Almanza, V. and Claramunt, G.}, ' ... 
'year = {2011}, ' ...
'title = {Female reproductive biology of the silverside \emph{Odontesthes regia}}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {111(1-2)}, ' ...
'pages = {31–39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Odontesthes-argentinensis.html}}'];
