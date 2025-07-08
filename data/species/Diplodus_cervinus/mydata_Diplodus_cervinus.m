function [data, auxData, metaData, txtData, weights] = mydata_Diplodus_cervinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Diplodus_cervinus'; 
metaData.species_en = 'Zebra sea bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 27]; 



%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 17*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'PajuLore2003';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'PajuLore2003';  
data.Li  = 55;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 61.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'PajuLore2003','fishbase'};
  comment.Wwp = 'based in 0.01202*Lp^3.08, see F1';
data.Wwi = 2750;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01202*Li^3.08, see F1';

data.Ri  = 761e3/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Diplodus sargus, weight-specifically';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (mm)
 0  65 
 1  98 
 2 173 
 3 232 
 4 286 
 5 332 
 6 370 
 7 400 
 8 426 
 9 446 
10 472 
11 491 
12 507 
13 519 
14 532 
15 547 
16 551 
17 565];
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PajuLore2003';
  
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

%% Facts
F1 = 'weight-length relationship: W = 0.01202*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6CY2G'; % Cat of Life
metaData.links.id_ITIS = '182917'; % ITIS
metaData.links.id_EoL = '994779'; % Ency of Life
metaData.links.id_Wiki = 'Diplodus_cervinus'; % Wikipedia
metaData.links.id_ADW = 'Diplodus_cervinus'; % ADW
metaData.links.id_Taxo = '192584'; % Taxonomicon
metaData.links.id_WoRMS = '127051'; % WoRMS
metaData.links.id_fishbase = 'Diplodus-cervinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodus_cervinus}}';
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
bibkey = 'PajuLore2003'; type = 'Article'; bib = [ ... 
'author = {Jos\''{e} G. Pajuelo and Jos\''{e} M. Lorenzo and Rosa Dom\''{i}nguez-Seoane}, ' ... 
'year = {2003}, ' ...
'title = {Age estimation and growth of the zebra seabream \emph{Diplodus cervinus cervinus} ({L}owe, 1838) on the {C}anary {I}slands shelf ({C}entral-east {A}tlantic)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {62}, ' ...
'pages = {97-103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Diplodus-cervinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
