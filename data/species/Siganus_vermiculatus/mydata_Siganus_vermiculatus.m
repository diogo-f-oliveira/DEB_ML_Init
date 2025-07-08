function [data, auxData, metaData, txtData, weights] = mydata_Siganus_vermiculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siganiformes'; 
metaData.family     = 'Siganidae';
metaData.species    = 'Siganus_vermiculatus'; 
metaData.species_en = 'Vermiculated spinefoot'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 23];

%% set data
% zero-variate data

data.am = 3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 29.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'Based on same relative length, compared to S. canaliculatus: 23/37.5 * Li';
data.Li  = 45;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on assumed egg diameter of 0.7 mm of S. canaliculatus: 4/3*pi*0.035^3, motivated by 1.4 mm larvae of S. randalli'; 
data.Wwp = 490; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01230*Lp^3.13, see F1';
data.Wwi = 1838; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.13, see F1; max. published weight: 2.4 kg';

data.Ri  = 35e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tW = [ ... % time since birth (d), weight (g)
1.142	18.044
19.419	28.733
42.699	52.384
89.215	75.439
128.595	129.519
159.592	137.370
184.561	176.808
220.571	203.261
261.546	222.376
285.376	243.771
335.755	261.746
376.182	283.681
386.699	286.486];
data.tW(:,1) = 70+ data.tW(:,1);  % set origin at birth
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(28.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GundPopp1983';


%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01230*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 1 - 50 m, usually 1 - 12 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6YN6J'; % Cat of Life
metaData.links.id_ITIS = '172334'; % ITIS
metaData.links.id_EoL = '46577167'; % Ency of Life
metaData.links.id_Wiki = 'Siganus_vermiculatus'; % Wikipedia
metaData.links.id_ADW = 'Siganus_vermiculatus'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '273927'; % WoRMS
metaData.links.id_fishbase = 'Siganus-vermiculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siganus_vermiculatus}}';
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
bibkey = 'GundPopp1983'; type = 'Article'; bib = [ ... 
'author = {N. Gundermann and D. M. Popper and T. Lichatowich}, ' ... 
'year = {1983}, ' ...
'title = {Biology and Life Cycle of \emph{Siganus vermiculatus} ({S}iganidae, {P}isces)}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {37(2)}, ' ...
'pages = {73--82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/Siganus-vermiculatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
