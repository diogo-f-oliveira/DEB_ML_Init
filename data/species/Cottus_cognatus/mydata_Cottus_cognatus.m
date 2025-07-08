function [data, auxData, metaData, txtData, weights] = mydata_Cottus_cognatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_cognatus'; 
metaData.species_en = 'Slimy sculpin'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 23];


%% set data
% zero-variate data

data.am = 7 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.31;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
data.Li  = 12.1;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp = 1.32;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.00708*Lp^3.13, see F1';
data.Wwi = 12.3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.13, see F1';
  
data.Ri = 645/365; units.Ri = '#/d'; label.Ri = 'reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw = [ ... % age (years), wet weight (g) 
0.445	0.897
1.346	4.425
2.195	10.014
3.071	10.379];
data.tWw(:,1) = 365 * (1 + data.tWw(:,1)); % convert yr to d
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(7);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'BondJone2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = weights.tWw * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YYGC'; % Cat of Life
metaData.links.id_ITIS = '167232'; % ITIS
metaData.links.id_EoL = '46568947'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_cognatus'; % Wikipedia
metaData.links.id_ADW = 'Cottus_cognatus'; % ADW
metaData.links.id_Taxo = '172056'; % Taxonomicon
metaData.links.id_WoRMS = '159512'; % WoRMS
metaData.links.id_fishbase = 'Cottus-cognatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_cognatus}}';
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
bibkey = 'BondJone2016'; type = 'Article'; bib = [ ... 
'doi = {10.1002/rra.2886}, ' ...
'author = {M. J. Bond and N. E. Jones and T. J. Haxton}, ' ... 
'year = {2016}, ' ...
'title = {GROWTH AND LIFE HISTORY PATTERNS OF A SMALL-BODIED STREAM FISH, \emph{Cottus cognatus}, IN HYDROPEAKING AND NATURAL RIVERS OF {N}ORTHERN {O}NTARIO}, ' ...
'journal = {River Res. Applic.}, ' ...
'volume = {32}, ' ...
'pages = {721-733}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-cognatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cottus_cognatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

