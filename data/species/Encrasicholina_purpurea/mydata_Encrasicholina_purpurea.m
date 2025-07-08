  function [data, auxData, metaData, txtData, weights] = mydata_Encrasicholina_purpurea
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Encrasicholina_purpurea'; 
metaData.species_en = 'Nehu'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 18];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 0.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(25.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.0;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 7.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 0.42;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00977*Lp^3.2';
data.Wwi = 6.17;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.2, see F1';

data.Ri  = 825/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Stolephorus_carpentariae';

% uni-variate data
data.tL = [ ... % time since hatch (d), std length (cm)
1.289	0.352
1.923	0.400
2.872	0.448
5.398	0.529
6.349	0.593
7.298	0.641
7.615	0.657
7.626	0.769
8.565	0.721
9.217	0.929
9.520	0.818
9.840	0.882
9.841	0.882
9.842	0.882
11.433	1.058
12.698	1.122
12.719	1.314
13.023	1.218
13.649	1.186
14.916	1.266
21.897	1.812
25.345	1.684
29.464	1.957
31.046	2.037
32.307	2.054
33.252	2.070
35.146	2.118
43.028	2.263
47.449	2.408
51.228	2.441
52.181	2.521
53.424	2.377
59.733	2.522
62.582	2.683
67.008	2.876
68.259	2.796
68.615	3.196
68.885	2.764
73.326	3.101
73.957	3.117
85.629	3.391
87.512	3.343
91.946	3.616
98.273	3.937
107.781	4.579
118.518	4.933
124.512	5.078
129.895	5.399
132.420	5.463
136.837	5.576
139.050	5.673
153.233	5.883
156.080	6.028
159.870	6.156];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
  temp.tL = C2K(25.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'StruUchi1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;

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
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.2'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6F89B'; % Cat of Life
metaData.links.id_ITIS = '551384'; % ITIS
metaData.links.id_EoL = '46562679'; % Ency of Life
metaData.links.id_Wiki = 'Encrasicholina_purpurea'; % Wikipedia
metaData.links.id_ADW = 'Encrasicholina_purpurea'; % ADW
metaData.links.id_Taxo = '173697'; % Taxonomicon
metaData.links.id_WoRMS = '279331'; % WoRMS
metaData.links.id_fishbase = 'Encrasicholina-purpurea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Encrasicholina_purpurea}}';  
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
bibkey = 'StruUchi1976'; type = 'Article'; bib = [ ... 
'author = {Paul Struhsaker and James H. Uchiyama}, ' ...
'year = {1976}, ' ...
'title = {A ge and growth of the nehu, \emph{Stolephorus purpureus} ({p}isces: {E}ngraulidae), from the {H}awaiian {I}slands as indicated by daily growth increments of sagittae}, ' ... 
'journal = {Fishery Bulletin}, ' ...
'volume = {74(1)}, '...
'pages = {9-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Encrasicholina-purpurea.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  