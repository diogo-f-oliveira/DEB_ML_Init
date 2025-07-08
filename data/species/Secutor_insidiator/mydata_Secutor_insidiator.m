  function [data, auxData, metaData, txtData, weights] = mydata_Secutor_insidiator
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Leiognathidae';
metaData.species    = 'Secutor_insidiator'; 
metaData.species_en = 'Pugnose ponyfish '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 20];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2.2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Kizh2014';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7.9;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 11.3;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 5.9;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01202*Lp^3.0, see F1';
data.Wwi = 17.34;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.0, see F1';

data.Ri  = 80449/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Photopectoralis bindus';

% uni-variate data
data.LL = [ ... % total length at t (cm), total length at t+30.5 d (cm)
2.923	4.294
3.943	5.026
4.224	5.231
6.369	7.132
7.547	8.243
8.743	9.209
8.867	9.646
9.657	10.173
11.240	11.723];
units.LL = {'cm', 'cm'};  label.LL = {'total length at t', 'total length at t + 30.5 d'};  
  temp.LL = C2K(27.2);  units.temp.LL = 'K'; label.temp.LL = 'temperature'; 
bibkey.LL = 'Kizh2014';
comment.LL = 'The assumption is that the graphs for Secutor_insidiator and Photopectoralis_bindus are interchnaged, in vew of max L';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = weights.LL * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.0'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W8R3'; % Cat of Life
metaData.links.id_ITIS = '168818'; % ITIS
metaData.links.id_EoL = '46578676'; % Ency of Life
metaData.links.id_Wiki = 'Secutor_insidiator'; % Wikipedia
metaData.links.id_ADW = 'Secutor_insidiator'; % ADW
metaData.links.id_Taxo = '187367'; % Taxonomicon
metaData.links.id_WoRMS = '1526390'; % WoRMS
metaData.links.id_fishbase = 'Secutor-insidiator'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Secutor_insidiator}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...Photopectoralis-bindus
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kizh2014'; type = 'Article'; bib = [ ... 
'author = {Shoba Joe Kizhakudan}, ' ...
'year = {2014}, ' ...
'title = {Study on the growth of three species of silverbellies from the South-East Coast of {I}ndia}, ' ... 
'journal = {Indian Journal of Geo-Marine Sciences}, ' ...
'volume = {43(2)}, '...
'pages = {263-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Secutor-insidiator.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  