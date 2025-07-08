function [data, auxData, metaData, txtData, weights] = mydata_Pristipomoides_flavipinnis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Pristipomoides_flavipinnis'; 
metaData.species_en = 'Golden eye jobfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.3); % K, body temp
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
  temp.ab = C2K(19.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 40*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(19.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 39; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 76.6;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.82 mm: pi/6*0.082^3'; 
data.Wwp = 730; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01479*Lp^2.95, see F1';
data.Wwi = 5351; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.95, see F1; max. published weight: 3.0 kg';

data.Ri  = 9.5e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lutjanus_carponotatus: 749e3*1113/859';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
    1.0 20.151
    1.4 22.920
    1.8 25.624
    2.2 28.252
    3.3 33.430
    4.1 35.949
    5.0 38.435
    6.2 40.888
    6.7 43.313];
data.tL(:,1) = 365 * (0.8+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(19.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
F1 = 'weight-length relationship: W in g = 0.01479*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MJZ6'; % Cat of Life
metaData.links.id_ITIS = '168920'; % ITIS
metaData.links.id_EoL = '46580801'; % Ency of Life
metaData.links.id_Wiki = 'Pristipomoides_flavipinnis'; % Wikipedia
metaData.links.id_ADW = 'Pristipomoides_flavipinnis'; % ADW
metaData.links.id_Taxo = '184757'; % Taxonomicon
metaData.links.id_WoRMS = '276553'; % WoRMS
metaData.links.id_fishbase = 'Pristipomoides-flavipinnis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristipomoides_flavipinnis}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Pristipomoides-flavipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
