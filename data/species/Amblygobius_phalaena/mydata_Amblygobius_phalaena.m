function [data, auxData, metaData, txtData, weights] = mydata_Amblygobius_phalaena

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Amblygobius_phalaena'; 
metaData.species_en = 'Whitebarred goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
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

data.ab = 4.5;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 430;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'HernMund2005';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6.0;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'HernMund2005a'; 
data.Lim  = 15;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 1.8;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00776*Lp^3.04, see F1';
data.Wwi = 29.2;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00776*Li^3.04, see F1';

data.Ri  = 2.6e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL_f = [... %  time since birth (d), total length (cm)
85.893	3.069
98.097	4.358
102.756	4.399
106.441	3.899
112.109	4.939
113.913	4.189
142.893	5.684
152.294	6.849
190.352	5.343
193.239	6.551
195.069	6.134
199.763	6.633
202.528	6.258
223.134	7.838
232.490	8.419
236.991	6.419
237.104	7.877
243.573	7.251
244.523	7.501
244.553	7.876
256.615	7.332
256.653	7.832
259.456	7.957
266.026	8.622
276.345	9.620
277.141	7.870
277.218	8.870
279.956	8.162
286.471	8.119
287.428	8.452
288.420	9.243
289.306	8.660
304.304	9.949
330.235	8.153
332.236	9.944
341.463	8.860
342.294	7.568
377.785	8.979
380.663	10.061
402.110	10.474
416.994	10.305];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(28.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HernMund2005';
%
data.tL_m = [ ... %  time since birth (d), total length (cm)
57.918	2.532
58.820	2.157
61.620	2.240
62.525	1.906
66.282	2.322
73.753	2.613
73.772	2.863
74.739	3.321
77.545	3.487
80.229	2.070
81.260	3.361
83.074	2.736
86.879	3.777
88.641	2.485
89.643	3.402
94.240	2.651
95.268	3.901
95.291	4.192
97.923	2.109
98.010	3.234
112.910	3.273
117.592	3.605
121.329	3.771
121.445	5.271
129.748	4.270
130.772	5.478
132.606	5.103
142.919	6.018
145.631	4.976
153.047	4.558
162.462	5.889
175.416	4.846
181.187	7.220
183.922	6.469
195.247	8.426
196.938	6.217
197.927	6.967
203.523	7.091
205.298	5.966
210.190	9.006
210.946	6.756
220.318	7.546
224.977	7.587
228.579	6.003
232.416	7.461
238.012	7.585
239.949	8.543
245.584	9.167
256.592	7.040
282.714	7.703
284.748	9.911
294.809	7.576
304.200	8.616
322.925	9.946
334.981	9.319
349.807	8.400
350.787	9.025
356.344	8.649
403.012	10.099];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(28.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
F1 = 'length-weight: weight in g = 0.00776*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CLTK'; % Cat of Life
metaData.links.id_ITIS = '172004'; % ITIS
metaData.links.id_EoL = '46575879'; % Ency of Life
metaData.links.id_Wiki = 'Amblygobius'; % Wikipedia
metaData.links.id_ADW = 'Amblygobius_bynoensis'; % ADW
metaData.links.id_Taxo = '160590'; % Taxonomicon
metaData.links.id_WoRMS = '278650'; % WoRMS
metaData.links.id_fishbase = 'Amblygobius-bynoensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amblygobius_bynoensis}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Amblygobius-bynoensis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
