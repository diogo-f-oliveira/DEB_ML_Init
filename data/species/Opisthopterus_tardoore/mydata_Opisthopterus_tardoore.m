  function [data, auxData, metaData, txtData, weights] = mydata_Opisthopterus_tardoore

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Opisthopterus_tardoore'; 
metaData.species_en = 'Tardoore'; 

metaData.ecoCode.climate = {'MB';'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 10];

%% set data
% zero-variate data
data.ab = 6.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.6); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on  Engraulis encrasicolus';

data.Lp = 11;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'guess';
data.Li = 23.5;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 3.4e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'Desa1972';
  comment.Wwb = 'based on egg diameter of 0.87 mm: pi/6*0.087^3';
data.Wwp = 10.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00724*Lp^3.04, see F1';
data.Wwi = 106.6; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight: 87 g; based on 0.00724*Li^3.04, see F1, gives 106.6 g';
  
data.GSI = 0.07; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Desa1972';
  temp.GSI = C2K(18.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
29.074  0.488	
86.179  3.448	
115.490 5.467	
149.920 6.216	
182+29.082 7.526	
182+57.908 8.532	
182+78.061 10.435	
182+99.235 11.631	
182+127.551 12.374	
182+150.255 12.422	
365+29.074  12.997
365+86.179  13.373
365+115.640 13.755	
365+150.075 14.053];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(28.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Desa1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'total length- standard length: SL = 0.86 * TL, based on photo';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3WJHF'; % Cat of Life
metaData.links.id_ITIS = '161865'; % ITIS
metaData.links.id_EoL = '46562690'; % Ency of Life
metaData.links.id_Wiki = 'Opisthopterus_tardoore'; % Wikipedia
metaData.links.id_ADW = 'Opisthopterus_tardoore'; % ADW
metaData.links.id_Taxo = '179312'; % Taxonomicon
metaData.links.id_WoRMS = '281446'; % WoRMS
metaData.links.id_fishbase = 'Opisthopterus-tardoore'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Opisthopterus_tardoore}}';  
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
bibkey = 'Desa1972'; type = 'Article'; bib = [ ...  
'author = {S. S. Desai}, ' ...
'year = {1972}, ' ...
'title = {STUDIES  ON  THE  BIOLOGY OF \emph{Opisthopterus tardoores} ({C}uvier) FROM   {R}ATNAGIRI}, ' ... 
'journal = {Indian Journal of Fisheries}, ' ...
'volume = {19(1/2)}, '...
'pages = {130-142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaiViei2007'; type = 'Article'; bib = [ ...  
'author = {Ana Cecilia Giacometti Mai and Jo\~{a}o Paes Vieira}, ' ...
'year = {2007}, ' ...
'title = {Review and consideration on habitat use, distribution and life history of \emph{Lycengraulis grossidens} ({A}gassiz, 1829) ({A}ctinopterygii, {C}lupeiformes, {E}ngraulididae)}, ' ... 
'journal = {Biota Neotrop.}, ' ...
'volume = {13(3)}, '...
'pages = {195-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Opisthopterus-tardoore.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
