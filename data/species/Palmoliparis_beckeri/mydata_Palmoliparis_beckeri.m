function [data, auxData, metaData, txtData, weights] = mydata_Palmoliparis_beckeri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Liparidae';
metaData.species    = 'Palmoliparis_beckeri'; 
metaData.species_en = 'Gloved snailfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-Ww';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 28];

%% set data
% zero-variate data

data.ab = 93;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'TokrOrlo2003';   
  temp.am = C2K(3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase gives 8 yrs, but length is then much smaller than Li';

data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 42; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.092; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'TokrOrlo2003';
  comment.Wwb = 'baed on egg diameter of 5.6 mm: pi/6*0.56^3';
data.Wwp = 117;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01380*Lp^3.02, see F1';
data.Wwi = 1086;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on LW data';
 
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    6 25.75 265
    7 29.25 380
    8 31    540];
data.tLW(:,1) = (data.tLW(:,1)+0)*365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
  temp.tLW = C2K(3);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'TokrOrlo2003'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
15.044	145.601
21.975	181.188
24.148	212.479
25.787	211.460
26.010	291.114
26.069	327.347
27.076	348.482
27.162	217.859
28.071	282.579
29.191	347.168
29.732	426.624
30.002	466.353
30.047	411.921
30.154	422.735
31.168	483.762
31.178	552.668
31.234	570.768
31.239	603.407
34.217	717.618
34.260	1007.746
35.063	720.719
35.236	814.912
35.999	966.769
36.100	937.690
42.203	1086.228];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'TokrOrlo2003';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    31 328
    33 395
    36 552];
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
  temp.LN = C2K(3);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'TokrOrlo2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5;
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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01380*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4C68L'; % Cat of Life
metaData.links.id_ITIS = '644220'; % ITIS
metaData.links.id_EoL = '46569709'; % Ency of Life
metaData.links.id_Wiki = 'Palmoliparis_beckeri'; % Wikipedia
metaData.links.id_ADW = 'Palmoliparis_beckeri'; % ADW
metaData.links.id_Taxo = '182502'; % Taxonomicon
metaData.links.id_WoRMS = '281971'; % WoRMS
metaData.links.id_fishbase = 'Palmoliparis-beckeri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Palmoliparis_beckeri}}';
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
bibkey = 'TokrOrlo2003'; type = 'article'; bib = [ ... 
'author = {Alexei M. Tokranov and Alexei M. Orlov}, ' ... 
'year = {2003}, ' ...
'title = {Some biological characteristics of the rare, little-studied gloved snailfish \emph{Palmoliparis beckeri} {B}alushkin, 1996 ({Liparidae, {T}eleostei), in the {P}acific off the {N}orthern {K}uril {I}slands}, ' ...
'journal = {Aqua: Journal of Ichthyology and Aquatic Biology}, ' ...
'volume = {7(2)}, ' ...
'pages = {83-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Palmoliparis-beckeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
