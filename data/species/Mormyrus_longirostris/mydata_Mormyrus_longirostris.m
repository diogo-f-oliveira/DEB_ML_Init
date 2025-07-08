  function [data, auxData, metaData, txtData, weights] = mydata_Mormyrus_longirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Mormyridae';
metaData.species    = 'Mormyrus_longirostris'; 
metaData.species_en = 'Eastern bottlenose mormyrid'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 
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
data.ab = 13; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 34;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 75;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.1 mm of Mormyrus kannume: pi/6*0.21^3';
data.Wwp = 327.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01318*Lp^2.87, see F1';
data.Wwi = 3172;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^2.87, see F1; max published weight 10 kg';
  
data.Ri = 7e4/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'fishbase';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), std length (cm), weight (g)
0  15.4   42
1  27.8  284
2  37.8  737 
3  45.1 1278
4  52.3 2100
5  55.3 2460
6  58.1 2900
7  59.0 3080];
data.tLW(:,1) = (data.tLW(:,1) + 0.8) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'std length', 'weight'};  
temp.tLW = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'BaloCoch1974'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5;
weights.Wwi = weights.Wwi * 0;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Weights Wwp and Wwi are inconsistent with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^2.87'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.9*TL from photo'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '743C4'; % Cat of Life
metaData.links.id_ITIS = '649931'; % ITIS
metaData.links.id_EoL = '211890'; % Ency of Life
metaData.links.id_Wiki = 'Mormyrus_longirostris'; % Wikipedia
metaData.links.id_ADW = 'Mormyrus_longirostris'; % ADW
metaData.links.id_Taxo = '180385'; % Taxonomicon
metaData.links.id_WoRMS = '1021701'; % WoRMS
metaData.links.id_fishbase = 'Mormyrus-longirostris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Mormyrus_longirostris}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Mormyrus-longirostris.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

