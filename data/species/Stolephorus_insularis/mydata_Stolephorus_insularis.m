  function [data, auxData, metaData, txtData, weights] = mydata_Stolephorus_insularis
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Stolephorus_insularis'; 
metaData.species_en = 'Hardenberg''s anchovy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 17];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1.7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.3;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
  comment.Lp = '24-27 cm';
data.Li = 8;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 0.385;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.15';
data.Wwi = 2.72;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.15, see F1';

data.Ri  = 360/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
37.978	3.506
38.160	3.215
44.697	3.216
45.424	3.786
46.150	3.725
46.332	3.070
46.877	3.774
48.329	2.949
48.692	4.090
48.874	3.362
50.327	3.604
51.235	3.277
52.143	3.058
52.144	3.435
52.324	4.260
53.414	3.896
53.415	3.071
53.596	4.454
54.322	4.345
54.867	3.690
55.230	3.168
55.593	3.314
56.320	3.751
56.501	3.411
58.499	4.260
58.862	4.455
59.225	3.702
59.407	3.132
59.588	4.297
61.041	3.981
61.586	3.363
61.768	3.666
62.494	3.921
63.220	4.479
63.402	3.399
64.492	3.508
65.944	4.577
66.489	3.691
66.671	3.497
68.305	3.715
68.668	3.497
70.847	3.679
71.028	4.419
71.029	3.509
71.937	3.873
73.390	3.485
74.298	3.703
74.843	4.177
75.569	4.577
76.659	3.983
77.203	4.468
79.201	4.760
80.109	4.481
85.739	3.704
94.455	5.271
95.363	4.397
98.087	4.688
102.627	5.198
104.625	5.004
109.528	5.381
111.525	4.969
112.797	4.872
113.705	5.381
118.608	5.200
119.697	5.843
125.508	6.147];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'Hoed2002'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 2;

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
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.15'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52TC7'; % Cat of Life
metaData.links.id_ITIS = '551394'; % ITIS
metaData.links.id_EoL = '46562657'; % Ency of Life
metaData.links.id_Wiki = 'Stolephorus_insularis'; % Wikipedia
metaData.links.id_ADW = 'Stolephorus_insularis'; % ADW
metaData.links.id_Taxo = '188300'; % Taxonomicon
metaData.links.id_WoRMS = '212284'; % WoRMS
metaData.links.id_fishbase = 'Stolephorus-insularis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Stolephorus_insularis}}';  
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
bibkey = 'Hoed2002'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF00076}, ' ...
'author = {Hoedt, Frank E.}, ' ...188300
'year = {2002}, ' ...
'title = {Growth in eight species of tropical anchovy determined from primary otolith increments}, ' ... 
'journal = {Marine and Freshwater Research}, ' ...
'volume = {53(5)}, '...
'pages = {859-867}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Stolephorus-insularis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  