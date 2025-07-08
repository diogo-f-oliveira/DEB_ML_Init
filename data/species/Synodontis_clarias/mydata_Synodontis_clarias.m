  function [data, auxData, metaData, txtData, weights] = mydata_Synodontis_clarias
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Mochokidae';
metaData.species    = 'Synodontis_clarias'; 
metaData.species_en = 'Mandi'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 24];

%% set data
% zero-variate data
data.ab = 8.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'ArayHirt2003';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'ArayHirt2003';
data.Li = 36;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ArayHirt2003';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 90.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (0.01000*Lp^3.04, see F1';
data.Wwi = 309;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.01000*Li^3.04, see F1';

data.Ri = 20347/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'ArayHirt2003';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm), femles, males
    1 NaN  20.0
    2 20.9 22.7
    3 24.5 22.9
    4 25.0 24.1
    5 25.4 24.9
    6 27.7 26.3
    7 28.1 26.4];
data.tL_fm(:,1) = (.8 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'ArayHirt2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 3;
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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53XLB'; % Cat of Life
metaData.links.id_ITIS = '681596'; % ITIS
metaData.links.id_EoL = '205457'; % Ency of Life
metaData.links.id_Wiki = 'Synodontis_clarias'; % Wikipedia
metaData.links.id_ADW = 'Synodontis_clarias'; % ADW
metaData.links.id_Taxo = '188627'; % Taxonomicon
metaData.links.id_WoRMS = '1022736'; % WoRMS
metaData.links.id_fishbase = 'Synodontis-clarias'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Synodontis_clarias}}';  
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
bibkey = 'ArayHirt2003'; type = 'Article'; bib = [ ...
'author = {Patricia Araya and Lourdes Hirt and Silvia Flores}, ' ...
'year = {2003}, ' ...
'title = {Biología reproductiva y crecimiento de \emph{Pimelodus clarias maculatus} ({L}ac. 1803) ({P}isces, {P}imelodidae) en la zona de influencia del embalse {Y}acyret\''{a}}, ' ... 
'journal = {Ecología Austral}, ' ...
'volume = {13}, '...
'pages = {83-95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Synodontis-clarias.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

