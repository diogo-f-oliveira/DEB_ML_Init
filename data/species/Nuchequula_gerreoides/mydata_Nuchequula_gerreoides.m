function [data, auxData, metaData, txtData, weights] = mydata_Nuchequula_gerreoides

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes '; 
metaData.family     = 'Leiognathidae';
metaData.species    = 'Nuchequula_gerreoides'; 
metaData.species_en = 'Decorated ponyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc','0iMr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 03];

%% set data
% zero-variate data
data.ab = 2.7;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 9.2; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 12.5;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'LeeLiu2005';
  comment.Wwb = 'based on egg diameter of 0.8 mm : pi/6*0.08^3';
data.Wwi = 445; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01698*Li^2.96, see F1';

data.Ri  = 4.4e3/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.97';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    366.481	7.676
365+121.750	9.622
365+182.382	10.054
365+242.164	10.541
365+275.753	11.459
365+306.950	11.405
730+275.624	12.378];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(28); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DwipHari1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01698*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '482LG'; % Cat of Life
metaData.links.id_ITIS = '645782'; % ITIS
metaData.links.id_EoL = '46578706'; % Ency of Life
metaData.links.id_Wiki = 'Nuchequula_gerreoides'; % Wikipedia
metaData.links.id_ADW = 'Nuchequula_gerreoides'; % ADW
metaData.links.id_Taxo = '3418034'; % Taxonomicon
metaData.links.id_WoRMS = '398531'; % WoRMS
metaData.links.id_fishbase = 'Nuchequula-gerreoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leiognathus_equula}}';  
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
bibkey = 'DwipHari1986'; type = 'techreport'; bib = [ ... 
'author = {Dwiponggo, A. and Hariati, T. and Banon, S. and Palomares, M L D and Pauly, Daniel}, ' ... 
'year = {1986}, ' ...
'title = {Growth, mortality and recruitment of commercially important fishes and penaed shrimps in {I}ndonesian waters}, ' ...
'institution = {Research Institute for Marine Fisheries, Jacarta, Indonesia}, ' ...
'series = {ICLARM Technical Reports}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'LeeLiu2005'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1444-2906.2005.00999.x}, ' ...
'author = {Cheng-Fang Lee and Kwang-Ming Liu and Wei-Cheng Su and Chuen-Chi Wu}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive biology of the common ponyfish \emph{Leiognathus equulusin} the south-western waters off {T}aiwan}, ' ...
'institution = {Research Institute for Marine Fisheries, Jacarta, Indonesia}, ' ...
'volume = {71(3)}, ' ...
'pages = {551–562}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Leiognathus-equula.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
