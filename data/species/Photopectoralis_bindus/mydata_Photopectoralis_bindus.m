  function [data, auxData, metaData, txtData, weights] = mydata_Photopectoralis_bindus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Leiognathidae';
metaData.species    = 'Photopectoralis_bindus'; 
metaData.species_en = 'Orangefin ponyfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

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
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2.2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Kizh2014';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.3;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 14;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 5.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (9.3/14)^3*19';
data.Wwi = 19;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri  = 10449/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.LL = [ ... % total length at t (cm), total length at t+30.5 d (cm)
1.821	3.340
4.061	5.354
4.774	6.360
5.616	6.613
5.853	6.829
8.278	9.264
8.541	9.281
8.990	9.921
11.625	12.044
11.862	12.367
12.310	12.440
13.786	14.058];
units.LL = {'cm', 'cm'};  label.LL = {'total length at t', 'total length at t + 30.5 d'};  
  temp.LL = C2K(28);  units.temp.LL = 'K'; label.temp.LL = 'temperature'; 
bibkey.LL = 'Kizh2014';
comment.LL = 'The assumption is that the graphs for Secutor_insidiator and Photopectoralis_bindus are interchnaged, in vew of max L';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = weights.LL * 5;

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
F1 = 'length-weight: Ww in g = 0.02042*(TL in cm)^2.93'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GT7G'; % Cat of Life
metaData.links.id_ITIS = '168801'; % ITIS
metaData.links.id_EoL = '46578712'; % Ency of Life
metaData.links.id_Wiki = 'Photopectoralis'; % Wikipedia
metaData.links.id_ADW = 'Photopectoralis_bindus'; % ADW
metaData.links.id_Taxo = '3418987'; % Taxonomicon
metaData.links.id_WoRMS = '398536'; % WoRMS
metaData.links.id_fishbase = 'Photopectoralis-bindus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Photopectoralis}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Photopectoralis-bindus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  