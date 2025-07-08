  function [data, auxData, metaData, txtData, weights] = mydata_Cirrhinus_cirrhosus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Cirrhinus_cirrhosus'; 
metaData.species_en = 'Mrigal carp'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 03 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 14]; 

%% set data
% zero-variate data
data.ab = 5;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;      units.tp = 'd';  label.tp = 'age at puberty for females';         bibkey.tp = 'Wiki';
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tp and tL';
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 60;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'Wiki'; 
  comment.Lp = 'based on Wwp and F1';
data.Li = 100;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.236e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 2e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'Wiki';
  comment.Wwp = 'based on tp and tL';
data.Wwi = 12700;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  %comment.Wwi = 'based on Li and F1';
    
data.Ri = 1e6/365; units.Ri = '#/d'; label.Ri = 'reproduction rate at 6 kg';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-weight
data.tW = [ ... % time (d), weight (g)
    10  9.24
    20 10.19
    30 10.43
    40 10.56
    50 11.23
    60 11.52
    70 11.88
    80 12.31
    90 12.62];
data.tW(:,2) = cumsum(data.tW(:,2));
units.tW = {'d', 'g'}; label.tW = {'time', 'weight'};  
temp.tW = C2K(27.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HossShik2019'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.0083 * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Z8NX'; % Cat of Life
metaData.links.id_ITIS = '688892'; % ITIS
metaData.links.id_EoL = '46581769'; % Ency of Life
metaData.links.id_Wiki = 'Cirrhinus_cirrhosus'; % Wikipedia
metaData.links.id_ADW = 'Cirrhinus_cirrhosus'; % ADW
metaData.links.id_Taxo = '171282'; % Taxonomicon
metaData.links.id_WoRMS = '280191'; % WoRMS
metaData.links.id_fishbase = 'Cirrhinus-cirrhosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cirrhinus_cirrhosus}}';  
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
bibkey = 'HossShik2019'; type = 'article'; bib = [ ...  
'author = {M. I. Hossain and F. H. Shikha and A. B. M. A. Hoque}, ' ...
'year = {2019}, ' ...
'title = {Growth Performance of {I}ndian Major Carps at Pond System Using Shrimp Industry Waste in their Diet}, ' ... 
'journal = {J. Environ. Sci. \& Natural Resources}, ' ...
'volume = {12(1-2}, ' ...
'pages = {101-108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cirrhinus-cirrhosus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

