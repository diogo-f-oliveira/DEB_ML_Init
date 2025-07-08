function [data, auxData, metaData, txtData, weights] = mydata_Leiognathus_bindus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes '; 
metaData.family     = 'Leiognathidae';
metaData.species    = 'Leiognathus_bindus'; 
metaData.species_en = 'Orangefin ponyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMc','0iMr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'Ww-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 15];

%% set data
% zero-variate data
data.ab = 2.7;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 9.3; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 14;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Leiognathus_equula: pi/6*0.08^3';
data.Wwi = 53.3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^3.06, see F1; max published weight 19 g';

data.Ri  = 10449/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
141.013	6.048
222.885	6.572
305.202	7.947
376.219	8.099
418.184	8.455
365+65.624	8.496
365+109.650	8.993
365+139.714	9.072
365+223.134	9.690
365+305.541	10.025
365+377.080	10.130
365+416.992	10.251];
data.tL(:,1) = 100 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(28); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SilvGarc2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
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
F1 = 'length-weight: Ww in g = 0.01995*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GT7G'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Leiognathus'; % Wikipedia
metaData.links.id_ADW = 'Leiognathus_bindus'; % ADW
metaData.links.id_Taxo = '178287'; % Taxonomicon
metaData.links.id_WoRMS = '398536'; % WoRMS
metaData.links.id_fishbase = 'Leiognathus_bindus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leiognathus}}';  
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
bibkey = 'SilvGarc2001'; type = 'Article'; bib = [ ... 
'author = {Geronimo T. Silvestre and Len R. Garces}, ' ... 
'year = {2004}, ' ...
'title = {Population parameters and exploitation rate of demersal fishes in {B}runei {D}arussalam (1989–1990)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {69}, ' ...
'pages = {73–90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Leiognathus_bindus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
