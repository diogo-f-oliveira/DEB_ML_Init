  function [data, auxData, metaData, txtData, weights] = mydata_Rineloricaria_aequalicuspis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Loricariidae';
metaData.species    = 'Rineloricaria_aequalicuspis'; 
metaData.species_en = 'Armored catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data
data.ab = 8.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Frie2020';
data.Li = 16.1;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1.56;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Frie2020'};
  comment.Wwp = 'based on 0.00437*Lp^3.14, see F1';
data.Wwi = 26.9;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00437*Li^3.14, see F1';
  
% uni-variate data

% time-length
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1  6.5  1.3
    2 10.8  6.6
    3 13.7 14.1
    4 15.6 21.4
    5 16.8 27.5
    6 17.7 32.2
    7 18.2 35.5
    8 18.6 37.9];
data.tLW(:,1) = (.3 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
  temp.tLW = C2K(24.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
  treat.tLW = {1, {'length','weight'}};
bibkey.tLW = 'Frie2020';
comment.tLW = 'data for Encantado river';

% length-fecundity
data.LN = [ ... % total length (cm), monthly fecundity(#)
     6.5   7
    10.8  35
    13.7  75
    15.6 114
    16.8 147
    17.7 172
    18.2 190
    18.6 202];
units.LN = {'cm', '#'};  label.LN = {'total length','monthly fecundity'};  
  temp.LN = C2K(24.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Frie2020';
comment.LN = 'The fecundity is assumed to be monthly';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW= weights.tLW * 20;
weights.Wwi= weights.Wwi * 3;
weights.Wwb= weights.Wwb * 3;
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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00437*(TL in cm)^3.14'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4T3QJ'; % Cat of Life
metaData.links.id_ITIS = '680491'; % ITIS
metaData.links.id_EoL = '220949'; % Ency of Life
metaData.links.id_Wiki = 'Rineloricaria_aequalicuspis'; % Wikipedia
metaData.links.id_ADW = 'Rineloricaria_aequalicuspis'; % ADW
metaData.links.id_Taxo = '186129'; % Taxonomicon
metaData.links.id_WoRMS = '1009997'; % WoRMS
metaData.links.id_fishbase = 'Rineloricaria-aequalicuspis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Rineloricaria_aequalicuspis}}';  
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
bibkey = 'Frie2020'; type = 'phdthesis'; bib = [ ...
'author = {Lucas Castello Costa de Fries}, ' ...
'year = {2020}, ' ...
'title = {Movement ecology of a small stream fish: small-scale movement patterns and effect of stream road-crossings}, ' ... 
'school = {UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL INSTITUTO DE BIOCI\^{E}NCIAS, Porto Alegre}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rineloricaria_aequalicuspis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

