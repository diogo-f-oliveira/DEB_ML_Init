function [data, auxData, metaData, txtData, weights] = mydata_Ammodytes_hexapterus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Ammodytidae';
metaData.species    = 'Ammodytes_hexapterus'; 
metaData.species_en = 'Pacific sand lance'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN','MPNW','MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 08];

%% set data
% zero-variate data

data.ab = 19;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(3.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(3.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.9 mm of Ammodytes_marinus: pi/6*0.09^3'; 
data.Wwp = 4.9; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00257*Lp^3.15, see F1';
data.Wwi = 115.6; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00257*Li^3.15, see F1';

% uni-variate data
% time-length-weight
data.tLW= [  ... % time since birth (yr), total length (cm)
    2 13.0 16.0
    3 17.2 21.2
    4 19.8 29.5
    5 22.5 39.0
    6 25.2 52.0];
data.tLW(:,1) = 365 * (0.75 + data.tLW(:,1)); % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(3.4);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Tokr2007'; treat.tLW = {1, {'length','weight'}};

% length-fecundity
data.LN= [  ... % total length (cm), fecundity (#)
  19.5 20000
  21.5 31900
  23.5 41300
  25.5 41700];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(3.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Tokr2007';

% weight-fecundity
data.WN= [  ... % weight (g), fecundity (#)
    25 20800
    35 33900
    45 42500
    55 41700];
units.WN   = {'cm', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN    = C2K(3.4);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Tokr2007';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.tLW = 5 * weights.tLW;
weights.ab = 0 * weights.ab;
%weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from CEG, N coast'};
% set2 = {'tW','tW1'}; subtitle2 = {'Data from CEG, N coast'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00257*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CTLH'; % Cat of Life
metaData.links.id_ITIS = '171672'; % ITIS
metaData.links.id_EoL = '46573107'; % Ency of Life
metaData.links.id_Wiki = 'Ammodytes'; % Wikipedia
metaData.links.id_ADW = 'Ammodytes_hexapterus'; % ADW
metaData.links.id_Taxo = '160648'; % Taxonomicon
metaData.links.id_WoRMS = '254510'; % WoRMS
metaData.links.id_fishbase = 'Ammodytes-hexapterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ammodytes}}';
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
bibkey = 'Tokr2007'; type = 'Article'; bib = [ ... 
'author = {A. M. Tokranov}, ' ... 
'year = {2007}, ' ...
'title = {Distribution and Some Biological Features of the {P}acific Sand Lance \emph{Ammodytes hexapterus} ({A}mmodytidae) in Waters off {K}amchatka in the {S}ea of {O}khotsk}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {47(4)}, ' ...
'pages = {288–295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ammodytes-hexapterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

