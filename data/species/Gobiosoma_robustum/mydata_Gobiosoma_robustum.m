function [data, auxData, metaData, txtData, weights] = mydata_Gobiosoma_robustum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Gobiosoma_robustum'; 
metaData.species_en = 'Code goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 21];

%% set data
% zero-variate data

data.ab = 4;   units.ab = 'd';   label.ab = 'life span';                 bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 1*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'SpriMcEr1961';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.46; units.Lp  = 'cm';  label.Lp  = 'total std at puberty';  bibkey.Lp  = 'SpriMcEr1961'; 
data.Li  = 2.9; units.Li  = 'cm';  label.Li  = 'ultimate std length for females';    bibkey.Li  = 'SpriMcEr1961';
data.Lim  = 4.4; units.Lim  = 'cm';  label.Lim  = 'ultimate std length for males';    bibkey.Lim  = 'SpriMcEr1961';

data.Wwb = 1.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'SpriMcEr1961';
  comment.Wwb = 'based on egg length of 0.78 mm and width of 0.55 mm: pi/6*0.078*0.055^2';
data.Wwp = 0.0346;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'SpriMcEr1961','fishbase'};
  comment.Wwi = 'based on 0.01047*Lp^3.16, see F1';
data.Wwi = 0.303;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'SpriMcEr1961','fishbase'};
  comment.Wwi = 'based on 0.01047*Li^3.16, see F1';

data.Ni  = 4*400;    units.Ni  = '#'; label.Ni  = 'total fecundity';  bibkey.Ni  = 'SpriMcEr1961';   
  temp.Ni = C2K(27); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '400 eggs per ovary, 2 spawning per life span of 1 yr';
 
% uni-variate data
% time-length
data.tL = [ ... % time (mnth), total length (cm)
3	0.797
4	0.894
5	1.101
6	1.417
7	1.572
8	1.685
9	1.873
10	2.094
11	2.110
12	2.070];
data.tL(:,1) = 30.5*data.tL(:,1)-60;
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(27);  units.temp.tL = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL = 'SpriMcEr1961'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GPKC'; % Cat of Life
metaData.links.id_ITIS = '171791'; % ITIS
metaData.links.id_EoL = '46576371'; % Ency of Life
metaData.links.id_Wiki = 'Gobiosoma'; % Wikipedia
metaData.links.id_ADW = 'Gobiosoma_robustum'; % ADW
metaData.links.id_Taxo = '175358'; % Taxonomicon
metaData.links.id_WoRMS = '276514'; % WoRMS
metaData.links.id_fishbase = 'Gobiosoma-robustum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobiosoma}}';
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
bibkey = 'SpriMcEr1961'; type = 'article'; bib = [ ... 
'author = {Springer, V.G. and A. McErlan}, ' ... 
'year = {1961}, ' ...
'title = {Spawning seasons and growth of the code goby, \emph{Gobiosoma robustum} ({P}isces: {G}obiidae) in the {T}ampa {B}ay area}, ' ...
'journal = {Tulane Stud. Zool.}, ' ...
'volume = {9}, ' ...
'pages = {77-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gobiosoma-robustum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

