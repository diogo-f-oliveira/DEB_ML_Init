  function [data, auxData, metaData, txtData, weights] = mydata_Anchoviella_guianensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Anchoviella_guianensis'; 
metaData.species_en = 'Guyana anchovy'; 

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
metaData.date_subm = [2023 10 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 23];

%% set data
% zero-variate data
data.ab = 2; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
  comment.Lp = 'based on Bryon moorei: 38*25.5/53';
data.Li = 11.3;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 0.96;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwi = 'based on 0.00550*Li^3.21, see F1';
data.Wwi = 13.2;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00550*Li^3.21, see F1';

data.Ri = 2000/365; units.Ri = '#/d';  label.Ri = 'reproduction rate at SL 5.8 cm';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'SL 5.8 cm corresponds with TL 6.7 cm, see F2';

% uni-variate data
% time-weight
data.tW = [ ... % time since hatch (d), weight (g)
18.165	0.078
28.399	0.096
45.802	0.131
57.963	0.371
59.132	0.142
69.166	0.671
73.510	0.135
81.666	0.194
88.679	0.618
96.945	0.429
98.926	0.692
113.342	0.508
133.769	1.001
145.164	0.495
154.347	0.715
163.609	0.604
164.502	1.490
179.839	2.214
184.099	0.780
197.312	1.872
198.414	1.127
208.594	1.982
212.775	1.194
224.048	1.337
230.089	2.947
318.383	2.506];
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
F1 = 'length-weight: Ww in g = 0.00550*(TL in cm)^3.21'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.86*TL';
metaData.bibkey.F2 = 'inpn'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '66LMZ'; % Cat of Life
metaData.links.id_ITIS = '551349'; % ITIS
metaData.links.id_EoL = '46562610'; % Ency of Life
metaData.links.id_Wiki = 'Anchoviella'; % Wikipedia
metaData.links.id_ADW = 'Anchoviella_guianensis'; % ADW
metaData.links.id_Taxo = '160877'; % Taxonomicon
metaData.links.id_WoRMS = '275543'; % WoRMS
metaData.links.id_fishbase = 'Anchoviella-guianensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Anchoviella}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Anchoviella-guianensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'inpn'; type = 'Misc'; bib = ...
'howpublished = {\url{https://inpn.mnhn.fr/espece/cd_nom/423235/tab/fiche?lg=en}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
