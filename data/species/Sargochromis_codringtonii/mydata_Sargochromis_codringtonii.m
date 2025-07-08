function [data, auxData, metaData, txtData, weights] = mydata_Sargochromis_codringtonii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Sargochromis_codringtonii'; 
metaData.species_en = 'Green Hhappy'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 31];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 39.0;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 23e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Smit2000';
  comment.Wwb = 'based on Copadichromis chrysonotus egg length of 4.3 mm and presumed width 0f 3.2 mm: pi/6*0.43*0.32^2';
data.Wwp = 81.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01585*Lp^2.99, see F1';
data.Wwi = 906.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585*Li^2.99, see F1';

data.Ri  = 850/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'Smit2000';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 50 eggs/young per clutch for Copadichromis chrysonotus, assumed one clutch per yr';
 
% uni-variate data

% time-length-weight
data.tLW = [ ... % time (d), std length (cm)
    1  8.7  24
    2 13.0  76
    3 17.9 140
    4 21.6 240];
data.tLW(:,1) = 365*(data.tLW(:,1) + 0); % set origin at birth
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'std length', 'weight'};  
temp.tLW    = C2K(26);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'BaloCoch1974'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01585*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79N22'; % Cat of Life
metaData.links.id_ITIS = '649286'; % ITIS
metaData.links.id_EoL = '1157337'; % Ency of Life
metaData.links.id_Wiki = 'Sargochromis'; % Wikipedia
metaData.links.id_ADW = 'Sargochromis_codringtonii'; % ADW
metaData.links.id_Taxo = '571672'; % Taxonomicon
metaData.links.id_WoRMS = '1017108'; % WoRMS
metaData.links.id_fishbase = 'Sargochromis-codringtonii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sargochromis}}';
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
bibkey = 'Smit2000'; type = 'Article'; bib = [ ...    
'author = {Lance W. Smith}, ' ...
'year  = {2000}, ' ...
'title = {The reproductive biology of an open-water spawning {L}ake {M}alawi cichlid, \emph{Copadichromis chrysonotus}}, ' ...  
'journal = {African Zoology}, ' ...
'volume = {35(2)}, ' ...
'pages = {151–164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sargochromis-codringtonii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

