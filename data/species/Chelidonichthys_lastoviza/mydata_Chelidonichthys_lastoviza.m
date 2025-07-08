function [data, auxData, metaData, txtData, weights] = mydata_Chelidonichthys_lastoviza

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Chelidonichthys_lastoviza'; 
metaData.species_en = 'Streaked gurnard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.8); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
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
data.ab = 9;      units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';    
  temp.ab = C2K(11.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';  
  temp.am = C2K(11.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19.5;  units.Lp = 'cm';   label.Lp = 'total length at puberty';    bibkey.Lp = 'Papa1986';
data.Li = 40;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 8.0e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Yusc1985';
  comment.Wwb = 'based on egg diameter of 1.05-1.25 mm of Prionotus evolans: pi/6*0.115^3';
data.Wwp = 70.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00871*Lp^3.03, see F1';
data.Wwi = 623; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';     bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00871*Li^3.03, see F1';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Papa1986';
  temp.GSI = C2K(11.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (years), total length (cm)
    1 12.2  12.0
    2 15.0  14.9 
    3 17.1  17.1
    4 19.4  19.3
    5 21.8  20.9
    6 23.0  25.5
    7 26.5  NaN
    8 28.9  NaN];
data.tL_fm(:,1) = 365 * (0.95+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'}; 
treat.tL_fm = {1, {'females','males'}};
temp.tL_fm = C2K(11.8); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Papa1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00871*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y38D'; % Cat of Life
metaData.links.id_ITIS = '643892'; % ITIS
metaData.links.id_EoL = '46568654'; % Ency of Life
metaData.links.id_Wiki = 'Chelidonichthys_lastoviza'; % Wikipedia
metaData.links.id_ADW = 'Chelidonichthys_lastoviza'; % ADW
metaData.links.id_Taxo = '170739'; % Taxonomicon
metaData.links.id_WoRMS = '218121'; % WoRMS
metaData.links.id_fishbase = 'Chelidonichthys-lastoviza'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelidonichthys_lastoviza}}';
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
bibkey = 'Papa1986'; type = 'article'; bib = [ ...
'author = { C. Papaconstantin}, ' ... 
'year   = {1986}, ' ...
'title  = {The life history of rock gurnard (\emph{Trigloporus lastoviza}, Br\"{u}nn. 1768) in the {S}aronikos {G}ulf}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'page = {75-86}, ' ...
'volume = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Yusc1985'; type = 'article'; bib = [ ...
'author = {Paul Yuschak}, ' ... 
'year   = {1985}, ' ...
'title  = {Fecundity, Eggs, Larvae and Osteological Development of the Striped Searobin, (\emph{Prionotus evolans}) ({P}isces, {T}riglidae))}, ' ...
'journal = {J Northw Atl Fish. Sci}, ' ...
'page = {65-85}, ' ...
'volume = {6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chelidonichthys-lastoviza.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

