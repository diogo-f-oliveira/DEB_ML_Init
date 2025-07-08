  function [data, auxData, metaData, txtData, weights] = mydata_Thryssa_hamiltonii
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Thryssa_hamiltonii'; 
metaData.species_en = 'Hamilton''s thryssa'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
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
  temp.ab = C2K(28.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 27;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 31.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00537*Lp^3.09, see F1';
data.Wwi = 142.2;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00537*Li^3.09, see F1';

data.Ri  = 27583/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since hatch (d), total length (cm)
31.411	2.467
42.209	4.034
44.172	4.407
46.135	3.663
47.117	2.994
55.951	5.304
57.914	3.891
61.841	4.264
65.767	3.447
66.748	4.713
70.675	5.533
72.638	4.120
77.546	7.693
79.509	8.363
80.491	6.727
83.435	6.133
83.436	4.942
84.417	5.389
88.344	5.614
92.270	8.070
93.252	7.178
98.157	8.817
98.158	5.543
98.159	6.659
99.141	9.189
101.104	8.297
106.012	9.712
106.013	7.927
107.975	9.341
111.902	7.036
114.847	7.484
115.828	10.088
118.773	17.455
120.736	10.983
127.607	8.530
132.515	10.020
138.404	7.790
138.405	8.683
140.368	11.809
140.369	12.478
150.184	11.068
152.147	11.441
154.110	8.986
157.055	8.615
161.963	10.701
164.908	13.603
166.871	8.470
168.834	11.670
176.687	10.260
176.688	12.120
180.613	11.377
181.595	15.246
181.596	13.386
191.411	10.563
192.393	16.292
192.394	15.697
193.374	11.382
198.282	9.598
206.135	14.958
207.117	13.247
210.061	16.150
222.822	9.979
225.767	15.486
226.748	14.594
228.712	16.231
231.656	12.289
235.583	14.225
246.380	9.393
249.325	15.197
252.270	16.463
262.086	9.994
267.975	16.097
282.699	16.326
290.552	18.858
290.553	16.924
304.294	17.524
314.110	17.305
326.871	17.086
328.834	19.245
329.816	21.477
336.687	17.536
337.669	15.677
360.245	15.685
361.227	17.545
374.969	19.187
381.840	17.479
412.270	18.755
418.159	18.013
428.957	18.687
430.920	20.696
436.810	22.038
438.773	15.045
444.663	21.371
444.664	17.949
450.552	18.918
458.405	18.177
461.350	19.368
480.982	21.385
493.742	22.059
494.724	21.018
511.411	20.057
516.319	19.314
532.025	17.088
533.006	20.214
549.693	20.443
577.178	18.221
607.607	23.590
629.202	19.728];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
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
F1 = 'length-weight: Ww in g = 0.00537*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56NJ3'; % Cat of Life
metaData.links.id_ITIS = '551408'; % ITIS
metaData.links.id_EoL = '46562628'; % Ency of Life
metaData.links.id_Wiki = 'Thryssa_hamiltonii'; % Wikipedia
metaData.links.id_ADW = 'Thryssa_hamiltonii'; % ADW
metaData.links.id_Taxo = '189016'; % Taxonomicon
metaData.links.id_WoRMS = '275555'; % WoRMS
metaData.links.id_fishbase = 'Thryssa-hamiltonii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Thryssa_hamiltonii}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Thryssa-hamiltonii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  