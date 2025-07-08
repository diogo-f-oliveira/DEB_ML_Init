function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_zosterae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_zosterae'; 
metaData.species_en = 'Pigmy seahorse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 05];

%% set data
% zero-variate data

data.ab = 10;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'ADW';   
  temp.ab = C2K(26.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 1*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(26.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'Stra1958';  
data.Lp  = 2.1;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = {'fishbase','Stra1958'};
  comment.Wwb = 'based on 0.00447*Lb^3.00, see F1';
data.Wwp = 0.0414;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00444*Lp^3.00, see F1';
data.Wwi = 0.5587;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.00, see F1';

data.Ri  = 2*69/30.5;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Stra1958';   
  temp.Ri = C2K(26.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '69 eggs per brood, 2 broods per month';
 
% uni-variate data
% time-length
data.tL = [ ...
0.706	0.857
0.882	0.822
5.647	1.165
5.735	1.120
8.559	1.141
8.647	1.332
11.735	1.446
11.823	1.335
14.824	1.643
14.912	1.542
17.646	1.639
17.647	1.848
21.706	1.844
21.971	1.732
23.647	1.743
23.734	1.645
26.735	1.739
26.912	1.433
29.735	1.943
29.823	1.735
32.824	1.633
32.825	1.845
36.529	2.036
36.706	2.133
44.382	1.986
44.383	2.159
44.384	2.212
44.470	1.909
44.471	2.010
44.472	2.045
44.473	2.253
44.556	1.934
44.557	1.962
44.558	2.114
44.559	2.132
44.646	1.854
44.647	2.073
44.735	1.809
44.736	2.128
44.824	1.836
44.912	1.534
44.913	2.034
44.914	2.149
45.000	1.996
45.001	2.017
45.002	2.100
45.088	1.934
45.176	1.909
45.177	1.954];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(29.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Stra1958';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LZPY'; % Cat of Life
metaData.links.id_ITIS = '166493'; % ITIS166493
metaData.links.id_EoL = '46567812'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_zosterae'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_zosterae'; % ADW
metaData.links.id_Taxo = '44859'; % Taxonomicon
metaData.links.id_WoRMS = '275213'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus-zosterae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_zosterae}}';
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
bibkey = 'Stra1958'; type = 'Article'; bib = [ ... 
'author = {Kirk Strawn}, ' ... 
'year = {1958}, ' ...
'title = {Life History of the Pigmy Seahorse, \emph{Hippwampus zosterae} {J}ordan and {G}ilbert, at {C}edar {K}ey, {F}lorida}, ' ...
'journal = {Copea}, ' ...
'volume = {19(1)}, ' ...
'pages = {16-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus_zosterae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Hippocampus_zosterae/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

