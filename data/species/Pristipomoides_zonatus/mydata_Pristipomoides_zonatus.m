function [data, auxData, metaData, txtData, weights] = mydata_Pristipomoides_zonatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Pristipomoides_zonatus'; 
metaData.species_en = 'Oblique-banded snapper';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 13];

%% set data
% zero-variate data

data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(16.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 44*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(16.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 57.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.82 mm: pi/6*0.082^3'; 
data.Wwp = 174; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01349*Lp^2.94, see F1';
data.Wwi = 2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.94, see F1; max. published weight: 1.8 kg';

data.Ri  = 1.74e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(16.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lutjanus_carponotatus: 749e3*2e3/859';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
    0.8 14.530
    1.2 16.769
    1.5 19.030
    1.9 21.309
    2.4 23.606
    2.9 25.917
    3.5 28.243
    4.1 30.582
    5.0 32.934];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(16.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RalsWill1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01349*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MJZK'; % Cat of Life
metaData.links.id_ITIS = '168919'; % ITIS
metaData.links.id_EoL = '46580800'; % Ency of Life
metaData.links.id_Wiki = 'Pristipomoides'; % Wikipedia
metaData.links.id_ADW = 'Pristipomoides_zonatus'; % ADW
metaData.links.id_Taxo = '184763'; % Taxonomicon
metaData.links.id_WoRMS = '218514'; % WoRMS
metaData.links.id_fishbase = 'Pristipomoides-zonatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristipomoides}}';
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
bibkey = 'RalsWill1988'; type = 'techreport'; bib = [ ...
'doi = {10.18785/negs.0802.02}, ' ...
'author = {Ralston, S. and H.A. Williams}, ' ...
'year = {1988}, ' ...
'title = {Depth distributions, growth, and mortality of deep slope fishes from the Mariana Archipelago}, ' ... 
'institution = {NNOAA Tech. Memo. NMFS.}, ' ...
'volume = {NOAA-TM-NMFS-SWFC-113}, '...
'pages = {1-47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pristipomoides-zonatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
