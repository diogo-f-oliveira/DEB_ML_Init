  function [data, auxData, metaData, txtData, weights] = mydata_Stolephorus_commersonnii
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Stolephorus_commersonnii'; 
metaData.species_en = 'long-jawed anchovy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

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
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7.2;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 14.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 2.73;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00513*Lp^3.18, see F1';
data.Wwi = 25.3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.18, see F1';

data.Ri  = 10033/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
41.154	3.821
44.231	3.366
45.385	4.327
46.154	4.373
48.462	3.780
49.231	4.146
51.923	3.553
53.846	4.012
56.923	3.831
57.692	4.380
58.846	4.747
60.385	4.336
61.923	4.520
67.692	4.295
67.693	5.209
68.077	4.935
68.846	4.661
71.923	5.578
72.308	5.121
74.615	5.122
76.538	5.123
78.076	5.627
78.077	6.222
78.078	5.765
80.000	4.851
83.077	6.408
83.462	6.957
86.538	5.450
86.539	4.535
86.923	5.724
88.462	6.548
90.768	7.098
90.769	5.955
93.077	6.597
97.308	8.703
98.846	6.920
100.000	7.516
101.154	6.602
103.846	6.329
109.615	5.830
111.923	7.294
116.923	9.035
120.769	9.723
121.538	8.992
126.154	8.904
128.462	11.054
131.923	9.822
133.077	8.130
138.077	9.688
138.846	11.518
145.769	10.333
146.538	9.693
156.923	10.294
176.154	12.135
176.923	13.736
186.538	12.599
188.077	13.469
208.462	13.481
212.692	13.804
224.231	13.720
239.615	14.140];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Hoed2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
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
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.18'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52TBD'; % Cat of Life
metaData.links.id_ITIS = '615814'; % ITIS
metaData.links.id_EoL = '46562654'; % Ency of Life
metaData.links.id_Wiki = 'Stolephorus_commersonnii'; % Wikipedia
metaData.links.id_ADW = 'Stolephorus_commersonnii'; % ADW
metaData.links.id_Taxo = '596891'; % Taxonomicon
metaData.links.id_WoRMS = '152017'; % WoRMS
metaData.links.id_fishbase = 'Stolephorus-commersonnii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Stolephorus_commersonnii}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Stolephorus-commersonnii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  