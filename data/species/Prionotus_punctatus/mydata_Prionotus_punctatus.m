function [data, auxData, metaData, txtData, weights] = mydata_Prionotus_punctatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Prionotus_punctatus'; 
metaData.species_en = 'Bluewing searobin'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.1); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 07];

%% set data
% zero-variate data
data.ab = 7.7;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(26.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 19*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'Andr2004';  
  temp.am = C2K(26.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 26.2;  units.Lp = 'cm';   label.Lp = 'total length at puberty';    bibkey.Lp = 'fishbase';
data.Li = 45;    units.Li = 'cm';   label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 6.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.05 mm of Prionotus_carolinus: pi/6*0.105^3';
data.Wwp = 168;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00933*Lp^3.00, see F1';
data.Wwi = 850; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00933*Li^3.00, see F1; max. published weight: 114.10 g';

data.Ri = 180e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(26.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on P. evolans';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
    4 19 NaN
    5 16 26
    6 25 24
    7 27 27
    8 28 26
    9 30 28
   10 31 28
   11 34 30
   12 36 30
   13 38 33
   14 36 35
   15 39 33
   16 38 32
   17 NaN NaN
   18 39 NaN
   19 40 NaN];
data.tL_fm(:,1) = 365 * (0.8+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
treat.tL_fm = {1, {'females','males'}};
temp.tL_fm = C2K(26.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Andr2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00933*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6W8BR'; % Cat of Life
metaData.links.id_ITIS = '166989'; % ITIS
metaData.links.id_EoL = '46568747'; % Ency of Life
metaData.links.id_Wiki = 'Prionotus'; % Wikipedia
metaData.links.id_ADW = 'Prionotus_punctatus'; % ADW
metaData.links.id_Taxo = '184732'; % Taxonomicon
metaData.links.id_WoRMS = '276288'; % WoRMS
metaData.links.id_fishbase = 'Prionotus-punctatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prionotus}}';
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
bibkey = 'Andr2004'; type = 'article'; bib = [ ...
'author = {Andrade, Humber Agrelli}, ' ... 
'year   = {2004}, ' ...
'title  = {Age and growth of the searobin (\emph{Prionotus punctatus}) in {B}razilian waters}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'page = {1-9}, ' ...
'volume = {75(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Prionotus-punctatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

