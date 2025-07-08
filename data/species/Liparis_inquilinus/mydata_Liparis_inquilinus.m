function [data, auxData, metaData, txtData, weights] = mydata_Liparis_inquilinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Liparidae';
metaData.species    = 'Liparis_inquilinus'; 
metaData.species_en = 'Inquiline snailfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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

data.ab = 15;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(8.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13 * 365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(8.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.9; units.Lj  = 'cm';  label.Lj  = 'total length at metam'; bibkey.Lj  = 'AbleMusi1976'; 
data.Lp  = 4.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AbleMusi1976'; 
data.Li  = 7.1; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AbleMusi1976';
  comment.Wwb = 'baed on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 0.6;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','AbleMusi1976'};
  comment.Wwp = 'based on 0.00525*Lp^3.15, see F1';
data.Wwi = 2.52;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.15, see F1';

data.Ri = 1135/ 365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AbleMusi1976';   
  temp.Ri = C2K(8.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since hatch (d), total length (cm)
100.000	0.373
139.860	0.425
175.593	1.001
217.433	2.128
234.669	2.531
249.910	2.396
257.295	2.584
288.944	2.891
300.867	2.985
306.563	3.536
324.272	3.414
349.368	3.454
357.442	4.783
365+22.513	4.514
365+38.499	5.050
365+54.114	5.238
365+68.518	5.224
365+84.117	5.546
365+99.314	5.787];
data.tL(:,1) = data.tL(:,1)-100; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(8.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AbleMusi1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00525*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase';
F2 = 'planktontic as larvae, lives in scallop Placopecten magellanicus as juvenile';
metaData.bibkey.F2 = 'AbleMusi1976';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3V9MV'; % Cat of Life
metaData.links.id_ITIS = '167577'; % ITIS
metaData.links.id_EoL = '46569428'; % Ency of Life
metaData.links.id_Wiki = 'Liparis_inquilinus'; % Wikipedia
metaData.links.id_ADW = 'Liparis_inquilinus'; % ADW
metaData.links.id_Taxo = '178952'; % Taxonomicon
metaData.links.id_WoRMS = '159528'; % WoRMS
metaData.links.id_fishbase = 'Liparis-inquilinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liparis_inquilinus}}';
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
bibkey = 'AbleMusi1976'; type = 'article'; bib = [ ... 
'author = {Able, K. and J. Musick}, ' ... 
'year = {1976}, ' ...
'title = {Life history, ecology and behavior of \emph{Liparis inquilinus} ({P}isces, {C}yclopteridae) associated with the sea scallop, \emph{Plagopecten magellanicus}}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {74(2)}, ' ...
'pages = {409-421}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Liparis-inquilinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
