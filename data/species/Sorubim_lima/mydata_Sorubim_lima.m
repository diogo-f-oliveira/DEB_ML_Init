  function [data, auxData, metaData, txtData, weights] = mydata_Sorubim_lima
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Sorubim_lima'; 
metaData.species_en = 'Duckbill catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCvf','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 01];

%% set data
% zero-variate data
data.ab = 11; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23.2;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 54.2;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AndrMakr2014';
  comment.Wwb = 'based on egg diameter of 1.74 mm of Hemisorubim_platyrhynchos: pi/6*0.174^3';
data.Wwp = 87.95;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00468*Lp^3.13, see F1';
data.Wwi = 1.25e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.13, see F1';

data.GSI = 0.15; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'guess';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1 24.785
    2 33.146
    3 37.800
    4 42.218
    5 45.260];
data.tL(:,1) = (data.tL(:,1) + 0.6) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PenhMateu2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 2;
% weights.GSI = weights.GSI * 3;
% weights.Wwb = weights.Wwb * 3;
% weights.Wwi = weights.Wwi * 3;
weights.Li = weights.Li * 3;
%weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

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
F1 = 'length-weight: Ww in g = 0.00468*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4YD5T'; % Cat of Life
metaData.links.id_ITIS = '164252'; % ITIS
metaData.links.id_EoL = '355832'; % Ency of Life
metaData.links.id_Wiki = 'Sorubim_lima'; % Wikipedia
metaData.links.id_ADW = 'Sorubim_lima'; % ADW
metaData.links.id_Taxo = '44113'; % Taxonomicon
metaData.links.id_WoRMS = '1016883'; % WoRMS
metaData.links.id_fishbase = 'Sorubim-lima'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Sorubim_lima}}';  
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
bibkey = 'PenhMateu2004'; type = 'Article'; bib = [ ...
'author = {Penha, J. M. F. and Mateus, L. A. F. and Barbieri, G.}, ' ...
'year = {2004}, ' ...
'title = {AGE AND GROWTH OF THE DUCKBILL CATFISH (\emph{Sorubim cf. lima}) IN THE {P}ANTANAL}, ' ... 
'journal = {Braz. J. Biol.}, ' ...
'volume = {64(1)}, '...
'pages = {125-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrMakr2014'; type = 'Article'; bib = [ ...
'author = {Fernanda F. Andrade and Maristela C. Makrakis and Ariane F. de Lima and Lucileine de Assump\c{c}\~{a}o and Sergio Makrakis and Suelen F. R. Pini}, ' ...
'year = {2014}, ' ...
'title = {Desenvolvimento embrion\''{a}rio, larval e juvenil de \emph{Hemisorubim platyrhynchos} ({S}iluriformes, {P}imelodidae) da bacia do rio {P}aran\''{a}}, ' ... 
'journal = {Iheringia, S\''{e}rie Zoologia, Porto Alegre}, ' ...
'volume = {104(1)}, '...
'pages = {70-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sorubim-lima.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

