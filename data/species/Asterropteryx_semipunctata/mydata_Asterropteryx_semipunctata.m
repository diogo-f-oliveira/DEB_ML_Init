function [data, auxData, metaData, txtData, weights] = mydata_Asterropteryx_semipunctata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Asterropteryx_semipunctata'; 
metaData.species_en = 'Starry goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 21];

%% set data
% zero-variate data

data.ab = 6;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 500;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'WintAlof2011';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 2.77;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'HernMund2005a'; 
data.Lim  = 6.5;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 0.114;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00437*Lp^2.97, see F1';
data.Wwi = 0.895;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00437*Li^2.97, see F1';

data.Ri  = 965/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL_f = [... %  time since birth (d), total length (cm)
150.416	2.106
154.223	2.834
156.543	2.252
174.955	2.835
183.586	3.302
187.091	2.545
192.052	2.953
206.710	3.070
217.745	3.362
254.396	3.685
281.255	3.832
297.008	3.338
304.396	3.688
315.449	4.067
330.137	4.330
342.338	4.360
365.479	4.215
367.865	3.953
386.264	4.479
388.603	3.984
393.522	4.188
400.739	3.693
405.747	4.334
411.797	4.102
416.705	4.248
420.299	3.927];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HernMund2005';
%
data.tL_m = [ ... %  time since birth (d), total length (cm)
31.862	0.817
40.410	0.876
47.739	0.935
47.751	0.993
48.917	0.731
56.294	1.023
62.492	1.518
63.646	1.198
66.038	0.965
68.501	1.082
73.426	1.315
73.479	1.577
84.408	1.345
84.461	1.607
84.503	1.811
93.081	2.015
96.674	1.695
101.611	1.986
106.561	2.336
110.124	1.870
112.617	2.133
117.566	2.483
121.242	2.570
149.238	2.310
150.416	2.106
157.798	2.427
161.629	3.271
167.649	2.893
171.361	3.156
178.619	2.865
193.212	2.662
194.443	2.720
195.740	3.099
203.010	2.866
226.252	3.217
229.964	3.479
253.164	3.626
265.336	3.511
278.816	3.832
293.480	3.978
300.897	4.474
309.517	4.882
314.360	4.708
320.410	4.475
330.184	4.563
337.412	4.126
338.667	4.301
339.976	4.738
352.272	5.234
355.966	5.409
361.992	5.060
371.766	5.148
381.440	4.741
383.944	5.061
384.044	5.556
387.679	5.440
388.727	4.595
401.064	5.295
404.764	5.499
418.073	4.976
422.862	4.539
431.535	5.210
443.712	5.123
449.869	5.414
455.991	5.531];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HernMund2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01023*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5VVX8'; % Cat of Life
metaData.links.id_ITIS = '636872'; % ITIS
metaData.links.id_EoL = '46575496'; % Ency of Life
metaData.links.id_Wiki = 'Asterropteryx_semipunctata'; % Wikipedia
metaData.links.id_ADW = 'Asterropteryx_semipunctata'; % ADW
metaData.links.id_Taxo = '690456'; % Taxonomicon
metaData.links.id_WoRMS = '277497'; % WoRMS
metaData.links.id_fishbase = 'Asterropteryx-semipunctata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Asterropteryx_semipunctata}}';
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
bibkey = 'HernMund2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-011-9782-6}, ' ...
'author = {V. Hernaman and P. L. Munday}, ' ... 
'year = {2005}, ' ...
'title = {Life-history characteristics of coral reef gobies. {I}. {G}rowth and life-span}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {290}, ' ...
'pages = {207–221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HernMund2005a'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-011-9782-6}, ' ...
'author = {V. Hernaman and P. L. Munday}, ' ... 
'year = {2005}, ' ...
'title = {Life-history characteristics of coral reef gobies. {I}{I}. Mortality rate, mating system and timing of maturation}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {290}, ' ...
'pages = {223–237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Asterropteryx-semipunctata.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
