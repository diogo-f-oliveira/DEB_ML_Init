function [data, auxData, metaData, txtData, weights] = mydata_Spicara_flexuosum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Spicara_flexuosum'; 
metaData.species_en = 'Picarel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm','MAbl'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 06];

%% set data
% zero-variate data

data.am = 12*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'HattTurk1985';   
  temp.am = C2K(14.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.1;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 23.2;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.48e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.780 mm of Spicara_maena: pi/6*0.078^3';
data.Wwp = 9.04;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^3.02, see F1';
data.Wwi = 152.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.02, see F1';

data.Ri  = 33721/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(14.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Spicara_maena: 49125*(23.2/26.3)^3';
 
% uni-variate data
% time-length-weight
data.tLW = [ ...  % time since birth (yr), total length (cm), weight (g)
    1  6.82  4.132
    2 10.06 11.85
    3 11.68 23.29
    4 13.66 37.63
    5 15.67 53.68
    6 16.78 70.52
    7 18.29 87.35
    8 NaN  103.60
    9 NaN  118.92
   10 NaN  133.05
   11 NaN  145.90
   12 NaN  157.44]; 
data.tLW(:,1) = data.tLW(:,1) * 365; % convert yr to d
units.tLW   = {'d','cm','g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(14.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'HattTurk1985'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Li = 5 * weights.Li;

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
F2 = 'protogynous sequential hermaphrodite';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46578160'; % Ency of Life
metaData.links.id_Wiki = 'Spicara_flexuosum'; % Wikipedia
metaData.links.id_ADW = 'Spicara_flexuosa'; % ADW
metaData.links.id_Taxo = '590327'; % Taxonomicon
metaData.links.id_WoRMS = '1577318'; % WoRMS
metaData.links.id_fishbase = 'Spicara-flexuosum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spicara_flexuosum}}';
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
bibkey = 'HattTurk1985'; type = 'article'; bib = [ ...  
'author = {A. Hattour and B. Turki and N. Zammouri}, ' ...
'year = {1985}, ' ...
'title  = {Quelques aspects de la biologie de l''esp\`{e}ce \emph{Spicara flexuosa} ({R}adinesque, 1810) des eaux {T}unisiennes}, ' ...
'journal = {Bull. Inst. natn. scient. tech. Oceanogr. Peche Salambo}, ' ...
'volume = {12}, ' ...
'pages = {143-162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Spicara-flexuosum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

