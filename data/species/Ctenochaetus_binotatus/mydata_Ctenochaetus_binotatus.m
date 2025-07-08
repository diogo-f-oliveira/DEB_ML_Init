function [data, auxData, metaData, txtData, weights] = mydata_Ctenochaetus_binotatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Ctenochaetus_binotatus'; 
metaData.species_en = 'Twospot surgeonfish'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 03 09]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 09]; 

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length, compared to Zebrasoma_scopas: 13.2/40*22';
data.Li  = 22;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 11; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on g = 0.03236*Lp^2.94, see F1';
data.Wwi = 286; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.03236*Li^2.94, see F1';

data.Ri  = 2.5e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data
% time-length data 
data.tL = [ ... % time since birth (d), standard length (cm)
 66 2.83
 74 2.86
 84 2.97
 92 3.31
104 3.50
114 3.75
131 4.10
171 5.25
186 5.48
193 5.95
200 5.80
218 6.30
223 6.45
262 7.30
352 8.67];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(27.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Lou1993';

% time-weight data 
data.tW = [ ... % time since birth (d), wet weight (g)
63.973	0.952
65.771	0.571
68.481	1.429
73.881	0.762
74.785	1.143
77.486	0.952
79.294	1.619
80.641	1.143
81.088	0.762
84.245	1.143
84.251	1.905
86.498	1.238
90.103	1.429
91.456	1.619
91.897	0.571
93.718	2.667
99.113	1.524
99.570	2.286
107.678	2.286
109.024	1.619
112.630	1.905
115.326	1.143
124.344	2.190
129.750	2.286
129.761	3.429
133.815	3.429
149.586	4.095
171.692	7.810
180.280	11.048
188.799	6.667
189.292	11.429
194.252	12.000
200.082	9.143
201.460	12.095
201.875	8.095
219.021	11.333
220.824	11.429
239.765	13.905
267.275	17.524
280.384	22.667
299.740	21.143
339.903	29.238
355.305	38.857
360.197	31.905
361.073	29.048];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(27.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Lou1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 0.03236*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 0 - 15 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '325BP'; % Cat of Life
metaData.links.id_ITIS = '172309'; % ITIS
metaData.links.id_EoL = '46577093'; % Ency of Life
metaData.links.id_Wiki = 'Ctenochaetus_binotatus'; % Wikipedia
metaData.links.id_ADW = 'Ctenochaetus_binotatus'; % ADW
metaData.links.id_Taxo = '172377'; % Taxonomicon
metaData.links.id_WoRMS = '219655'; % WoRMS
metaData.links.id_fishbase = 'Ctenochaetus-binotatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ctenochaetus_binotatus}}';
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
bibkey = 'Lou1993'; type = 'Article'; bib = [ ... 
'author = {D. C. Lou}, ' ... 
'year = {1993}, ' ...
'title = {Growth in juvenile \emph{Scarus rivulatus} and \emph{Ctnechaetus binotatus}: a comparison of families {S}caridae and {A}canthuridae}, ' ...
'journal = {Journal of fish Biology}, ' ...
'volume = {42}, ' ...
'pages = {15--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Ctenochaetus-binotatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

