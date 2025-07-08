  function [data, auxData, metaData, txtData, weights] = mydata_Triportheus_angulatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Triportheidae';
metaData.species    = 'Triportheus_angulatus'; 
metaData.species_en = 'Angular hatchetfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 22];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 22];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 23.8;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 3.9e-3;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.95 mm: pi/6*0.195^3';
data.Wwp = 58.28;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (15.5/23.8)^3*211';
data.Wwi = 211;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri = 1e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'Azev2010';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on relative fecundity of 0.5 for small Characiformes: absolute fecundity: 1e3*0.5*211';

% uni-variate data
% time-weight
data.tW = [ ... % time since hatch (d), weight (g)
13.355	0.335
31.319	0.622
43.536	2.142
58.245	1.762
73.964	3.007
99.973	2.340
114.513	5.441
128.043	6.094
139.218	12.308
142.674	8.079
171.946	13.425
185.531	10.735
194.471	18.838
214.761	22.967
241.858	23.017
251.996	26.508
282.466	28.908
308.382	39.452];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
  temp.tW = C2K(24.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'Bayl1988';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 3;

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
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^2.91'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58Z44'; % Cat of Life
metaData.links.id_ITIS = '163013'; % ITIS
metaData.links.id_EoL = '1012822'; % Ency of Life
metaData.links.id_Wiki = 'Triportheus'; % Wikipedia
metaData.links.id_ADW = 'Triportheus_angulatus'; % ADW
metaData.links.id_Taxo = '189603'; % Taxonomicon
metaData.links.id_WoRMS = '1020537'; % WoRMS
metaData.links.id_fishbase = 'Triportheus-angulatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Triportheus}}';  
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
bibkey = 'Bayl1988'; type = 'Article'; bib = [ ...
'doi = {10.1007/bf00004848}, ' ...
'author = {Peter B. Bayley}, ' ...
'year = {1988}, ' ...
'title = {Factors affecting growth rates of young tropical floodplain fishes: seasonality and density-dependence}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {21(2)}, '...
'pages = {127–142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Azev2010'; type = 'Article'; bib = [ ...
'author = {Marco A. Azevedo}, ' ...
'year = {2010}, ' ...
'title = {Reproductive characteristics of characid fish species ({T}eleostei, {C}haraciformes) and their relationship with body size and phylogeny}, ' ... 
'journal = {Iheringia, S\''{e}r. Zool., Porto Alegre}, ' ...
'volume = {100(4)}, '...
'pages = {469-482}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Triportheus-angulatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
