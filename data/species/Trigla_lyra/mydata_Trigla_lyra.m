function [data, auxData, metaData, txtData, weights] = mydata_Trigla_lyra
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Trigla_lyra'; 
metaData.species_en = 'Piper gurnard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz','jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 30];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(13.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Papa1981';   
  temp.am = C2K(13.1);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 30;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 60;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'NeveSous2021';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.09^3';
data.Wwp = 224.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.00, see F1';
data.Wwi = 1.8e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.00, see F1';
 
data.Ri = 46437/365; units.Ri = '#/d';  label.Ri = 'reproduction rate at 32 cm';   bibkey.Ri = 'NeveSous2021';
  temp.Ri = C2K(13.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), fork length (cm)
    0 12.99
    1 14.35
    2 25.58
    3 26.58
    4 30.88
    5 36.80
    6 39.10
    7 44.40];
data.tL(:,1) = (0.9 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
  temp.tL = C2K(13.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Papa1981';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58QJR'; % Cat of Life
metaData.links.id_ITIS = '167041'; % ITIS
metaData.links.id_EoL = '46568714'; % Ency of Life
metaData.links.id_Wiki = 'Trigla_lyra'; % Wikipedia
metaData.links.id_ADW = 'Trigla_lyra'; % ADW
metaData.links.id_Taxo = '189452'; % Taxonomicon
metaData.links.id_WoRMS = '127266'; % WoRMS
metaData.links.id_fishbase = 'Trigla-lyra'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Trigla_lyra}}';  
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
bibkey = 'Papa1981'; type = 'Article'; bib = [ ...
'author = {Papaconstantinou, C.}, ' ...
'year = {1981}, ' ...
'title = {AGE AND GROWTH OF PIPER, \emph{Trigla lyra}, IN {S}ARONIKOS {G}ULF ({G}REECE)}, ' ... 
'journal = {Cybium, 3e serie}, ' ...
'volume = {5(2)}, '...
'pages = {73-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NeveSous2021'; type = 'Article'; bib = [ ...
'doi = {10.1111/jfb.14849}, ' ...
'author = {Ana Neves and In\^{e}s Sousa and Vera Sequeira and Ana Rita Vieira and Elisabete Silva and Frederica Silva and Ana Marta Duarte and Susana Mendes and Rui Ganh\~{a}o and Carlos Assis and Rui Rebelo and Maria Filomena Magalhães and Maria Manuel Gil and Leonel Serrano Gordo}, ' ...
'year = {2021}, ' ...
'title = {Enhancing knowledge on low‐value fishing species: the distinct reproductive strategy of two gurnard species}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'pages = {1-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trigla-lyra.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

