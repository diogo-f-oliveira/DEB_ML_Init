function [data, auxData, metaData, txtData, weights] = mydata_Pseudopleuronectes_americanus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Pseudopleuronectes_americanus'; 
metaData.species_en = 'Winter flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 30];

%% set data
% zero-variate data

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(6.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14 * 365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(6.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 26.8;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'size at 50% maturity (24-37 cm)';
data.Li  = 64;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on eff diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 208;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Lp = 'based on 0.00832*Lp^3.08, see F1';
data.Wwi = 3.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 2.6e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';  bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(6.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_Nfm = [ ...
  1	12.993 12.264
  2	20.348 19.623
  3	26.386 26.415
  4	31.861 30.189
  5	36.020 33.208
  6	39.427 36.604
  7	41.142 37.170
  8	42.857 37.170];	
data.tL_Nfm(:,1) = 365 * (data.tL_Nfm(:,1) + 0.2);
units.tL_Nfm = {'d', 'cm'};  label.tL_Nfm = {'time since birth', 'total length'};  
  temp.tL_Nfm = C2K(6.1);  units.temp.tL_Nfm = 'K'; label.temp.tL_Nfm = 'temperature'; 
  treat.tL_Nfm = {1,{'female','male'}}; label.treat.tL_Nfm = 'north of Cape Cod';
bibkey.tL_Nfm = {'WithBurn1993'};
comment.tL_Nfm = 'Data from north of Cape Cod';
%
data.tL_Sfm = [ ...
  1	12.046 11.865
  2	19.896 20.347
  3	27.743 27.326
  4	34.828 33.176
  5	37.905 35.644
  6	39.455 37.546
  7	41.388 40.202
  8	45.419 42.857];	
data.tL_Sfm(:,1) = 365 * (data.tL_Sfm(:,1) + 0.2);
units.tL_Sfm = {'d', 'cm'};  label.tL_Sfm = {'time since birth', 'total length'};  
  temp.tL_Sfm = C2K(6.1);  units.temp.tL_Sfm = 'K'; label.temp.tL_Sfm = 'temperature'; 
  treat.tL_Sfm = {1,{'female','male'}}; label.treat.tL_Sfm = 'south of Cape Cod';
bibkey.tL_Sfm = {'WithBurn1993'};
comment.tL_Sfm = 'Data from south of Cape Cod';

%% set weights for all real data
weights = setweights(data, []);

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
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P882'; % Cat of Life
metaData.links.id_ITIS = '172905'; % ITIS
metaData.links.id_EoL = '46570124'; % Ency of Life
metaData.links.id_Wiki = 'Pseudopleuronectes_americanus'; % Wikipedia
metaData.links.id_ADW = 'Pseudopleuronectes_americanus'; % ADW
metaData.links.id_Taxo = '46965'; % Taxonomicon
metaData.links.id_WoRMS = '158885'; % WoRMS
metaData.links.id_fishbase = 'Pseudopleuronectes-americanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleuronectes_platessa}}';
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
bibkey = 'WithBurn1993'; type = 'Article'; bib = [ ... 
'author = {David B. Witherell and Jay Burnett}, ' ... 
'year = {1993}, ' ...
'title = {Growth and maturation of winter flounder, \emph{Pleuronectes americanus}, in {M}assachusetts}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {91}, ' ...
'pages = {816-820}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pleuronectes-platessa.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
