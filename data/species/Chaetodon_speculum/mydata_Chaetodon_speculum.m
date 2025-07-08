function [data, auxData, metaData, txtData, weights] = mydata_Chaetodon_speculum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Chaetodontiformes'; 
metaData.family     = 'Chaetodontidae';
metaData.species    = 'Chaetodon_speculum'; 
metaData.species_en = 'Mirror butterflyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 30];

%% set data
% zero-variate data

data.ab = 7;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 18;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Cheatodon larvatus: pi/6*0.075^3'; 
data.Wwp = 5.3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02570*Lp^2.97, see F1';
data.Wwi = 137.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.97, see F1';

data.GSI  = 0.06;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(28.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Cheatodon larvatus';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (g)
225.046	6.694
228.729	7.993
237.569	7.854
261.142	6.694
263.352	6.995
273.665	7.506
274.401	8.527
281.031	7.390
287.661	6.856
289.871	9.988
297.238	10.476
301.657	8.689
306.077	9.037
309.024	10.499
312.707	7.784
313.444	9.014
322.284	9.432
333.333	11.032
338.490	9.548
338.491	8.132
347.330	10.336
359.116	9.803
365.009	9.826
372.376	9.246
382.688	9.988
382.689	10.383
391.529	11.497
394.475	11.705
398.158	9.965
405.525	10.847
430.571	12.053
431.308	11.288
437.201	10.081
437.202	10.847
439.411	11.427
446.777	11.334
459.300	11.427
463.720	10.731
469.613	11.032
484.346	12.749
488.766	11.056
528.545	12.077];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LaboMori2008';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 0.02570*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 3 - 12 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'TC58'; % Cat of Life
metaData.links.id_ITIS = '610353'; % ITIS
metaData.links.id_EoL = '46578220'; % Ency of Life
metaData.links.id_Wiki = 'Chaetodon_speculum'; % Wikipedia
metaData.links.id_ADW = 'Chaetodon_speculum'; % ADW
metaData.links.id_Taxo = '170413'; % Taxonomicon
metaData.links.id_WoRMS = '218740'; % WoRMS
metaData.links.id_fishbase = 'Chaetodon-speculum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetodon_speculum}}';
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
bibkey = 'LaboMori2008'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.ecss.2008.01.011}, ' ...
'author = {M. Labonne and E. Morize and M. Kulbicki and D. Ponton and L. Marec}, ' ... 
'year = {2008}, ' ...
'title = {Otolith chemical signature and growth of \emph{Chaetodon speculum} in coastal areas of {N}ew {C}aledonia}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {78(3)}, ' ...
'pages = {493-504}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chaetodon-speculum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
