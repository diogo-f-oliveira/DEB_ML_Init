function [data, auxData, metaData, txtData, weights] = mydata_Lates_mariae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centropomiformes'; 
metaData.family     = 'Latidae';
metaData.species    = 'Lates_mariae'; 
metaData.species_en = 'Bigeye lates'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 08];

%% set data
% zero-variate data

data.ab = 2.2;   units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = 'guess';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12-15 h till hatch, then 36-40 h till start feeding';
data.am =  35*365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'guess';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 45.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 80;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 3.44e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.87 mm of Lates_calcarifer: pi/6*0.087^3';
data.Wwp = 906.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^2.99, see F1';
data.Wwi = 4.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^2.99, see F1';

data.Ri  = 3.9e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Lates_calcarifer: 47.7e6*4.9e3/60e3';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
1	15.215
2	30.920
3	35.828
4	45.153
5	53.252
6	60.123
7	64.294];
data.tL(:,1) = 365*(0+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MunyMwap2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight relationship: Ww in g = 0.01000*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3SJ3C'; % Cat of Life
metaData.links.id_ITIS = '167671'; % ITIS
metaData.links.id_EoL = '218203'; % Ency of Life
metaData.links.id_Wiki = 'Lates_mariae'; % Wikipedia
metaData.links.id_ADW = 'Lates_mariae'; % ADW
metaData.links.id_Taxo = '178244'; % Taxonomicon
metaData.links.id_WoRMS = '1017918'; % WoRMS
metaData.links.id_fishbase = 'Lates-mariae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lates_mariae}}';
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
bibkey = 'MunyMwap2002'; type = 'Techreport'; bib = [ ...
'author = {Joseph Munyandorero and Leonard Mwape}, ' ... 
'title = {SOME RECORDS ON LAKE TANGANYIKA CLUPEID AND LATID FISH SPECIES; NOTES SUR LES CLUPEIDES ET LATIDES DU LAC TANGANYIKA}, ' ...
'year = {2002}, ' ...
'institution = {CP-EU Fisheries Research}, ' ...
'volume = {14}, ' ...
'pages = {132-155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Lates-mariae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

