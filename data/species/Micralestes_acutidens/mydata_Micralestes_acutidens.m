  function [data, auxData, metaData, txtData, weights] = mydata_Micralestes_acutidens
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Alestidae';
metaData.species    = 'Micralestes_acutidens'; 
metaData.species_en = 'Sharptooth tetra'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 09];

%% set data
% zero-variate data
data.ab =  6; units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'guess'; 
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.4;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 9;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Alestes_baremoze: pi/6*0.08^3';
data.Wwp = 0.55;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^3.10, see F1';
data.Wwi = 11.2;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.10, see F1';
  
data.Ri = 700/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase'; 
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
288.447	2.535
348.898	2.997
365+13.451	3.151
365+44.387	3.277
365+72.928	3.333
365+104.205	3.473
365+134.137	3.459
365+164.402	3.501
365+195.363	3.501
365+226.926	3.922];
data.tL(:,1) = data.tL(:,1) - 50; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995'; 

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight Ww in g = 0.01230*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '42Q5C'; % Cat of Life
metaData.links.id_ITIS = '163299'; % ITIS
metaData.links.id_EoL = '206655'; % Ency of Life
metaData.links.id_Wiki = 'Micralestes'; % Wikipedia
metaData.links.id_ADW = 'Micralestes_acutidens'; % ADW
metaData.links.id_Taxo = '179941'; % Taxonomicon
metaData.links.id_WoRMS = '1013808'; % WoRMS
metaData.links.id_fishbase = 'Micralestes-acutidens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Micralestes}}';  
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
bibkey = 'MorePalo1995'; type = 'techreport'; bib = [ ... 
'author = {Moreau, J. and M.L.D. Palomares and F.S.B. Torres and D. Pauly}, ' ... 
'year = {1995}, ' ...
'title = {Atlas d\''{e}mographique des populations de poissons d''eau douce d''{A}frique}, ' ...
'institution = {ICLARM Tech. Rep.}, ' ...
'volume = {45}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Micralestes-acutidens.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

