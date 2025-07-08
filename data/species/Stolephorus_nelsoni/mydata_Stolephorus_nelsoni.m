  function [data, auxData, metaData, txtData, weights] = mydata_Stolephorus_nelsoni
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Stolephorus_nelsoni'; 
metaData.species_en = 'Nelson''s anchovy'; 

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
metaData.data_1     = {'L-dL'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

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

data.Lp = 4.3;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
  comment.Lp = 'fishbase gives 7.0 cm, but this seems unrealistic give Li of 7.4 cm';
data.Li = 9;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Hoed2002';
  comment.Li = 'fishbase gives 7.4 cm';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 0.59;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00389*Lp^3.15';
data.Wwi = 6.22;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^3.19, see F1';

data.Ri  = 2526/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
15.830	1.631
24.324	2.249
36.293	2.472
39.768	2.669
41.698	2.612
41.699	2.922
45.174	2.921
46.332	2.583
48.263	3.089
50.193	2.836
51.351	2.582
55.598	3.116
58.687	3.595
61.004	3.087
63.707	3.847
66.795	3.255
70.270	3.564
79.923	4.830
86.486	3.730
95.753	5.306
98.069	6.320
102.703	5.727
105.019	4.713
108.880	5.106
112.355	4.937
116.602	6.232
120.849	6.034
128.185	6.765
136.293	6.960
136.680	6.453
142.085	6.593
142.471	6.086
149.421	7.578
150.579	8.112
152.510	7.436
153.668	7.577
154.054	5.943
156.757	6.618
160.232	6.843
167.181	7.997
168.340	9.011
182.239	7.740
183.784	7.374
198.842	7.794
199.614	8.413
203.089	7.624
232.432	8.097
234.749	8.350
246.718	6.940
264.093	8.288
284.556	8.961];
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
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^3.19'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52TCP'; % Cat of Life
metaData.links.id_ITIS = '551396'; % ITIS
metaData.links.id_EoL = '46562668'; % Ency of Life
metaData.links.id_Wiki = 'Stolephorus_nelsoni'; % Wikipedia
metaData.links.id_ADW = 'Stolephorus_nelsoni'; % ADW
metaData.links.id_Taxo = '188302'; % Taxonomicon
metaData.links.id_WoRMS = '275324'; % WoRMS
metaData.links.id_fishbase = 'Stolephorus-nelsoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Stolephorus_nelsoni}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Stolephorus-nelsoni.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  