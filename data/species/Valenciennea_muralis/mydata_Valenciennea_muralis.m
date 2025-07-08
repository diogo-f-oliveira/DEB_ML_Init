function [data, auxData, metaData, txtData, weights] = mydata_Valenciennea_muralis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Valenciennea_muralis'; 
metaData.species_en = 'Mural goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
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
  temp.ab = C2K(28.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'HernMund2005';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'HernMund2005a'; 
data.Lim  = 16;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 1.1;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00661*Lp^3.03, see F1';
data.Wwi = 29.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00661*Li^3.03, see F1';

data.Ri  = 2.9e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL_f = [... %  time since birth (d), total length (cm)
79.534	5.072
92.547	4.784
101.055	6.433
103.746	5.113
110.289	5.443
128.072	6.639
131.669	4.990
144.023	8.206
145.709	5.938
150.553	8.371
167.147	6.227
179.225	5.897
181.206	7.423
187.596	5.773
187.772	8.041
190.443	6.474
190.648	9.113
209.222	8.495
220.299	7.258
221.400	9.443
224.907	6.639
224.945	7.134
225.908	7.546
228.622	6.515
233.299	6.804
234.455	9.691
240.838	7.959
247.531	10.227
250.120	7.588
250.971	6.557
251.000	6.928
251.035	7.381
254.718	6.845
256.612	7.258
262.311	8.701
265.078	8.371
265.155	9.361
266.845	7.134
268.054	10.722
271.478	6.845
271.711	9.856
273.420	7.876
292.224	10.227
295.846	8.907
295.894	9.526
306.092	8.948
318.145	8.289
324.787	9.897
363.941	10.515];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(28.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HernMund2005';
%
data.tL_m = [ ... %  time since birth (d), total length (cm)
44.856	2.144
49.499	1.979
51.383	2.268
62.595	2.763
62.620	3.093
63.510	2.557
66.338	3.010
70.069	3.093
72.789	2.144
77.588	4.000
77.617	4.371
78.407	2.557
81.393	5.031
82.266	4.289
83.140	3.546
84.106	4.000
85.904	3.175
86.791	2.598
87.920	5.155
90.742	5.526
93.503	5.113
94.348	4.000
97.125	3.794
99.029	4.330
99.890	3.423
100.104	6.186
102.882	5.979
108.455	5.814
110.132	3.423
114.954	5.567
116.733	4.495
126.041	4.454
126.066	4.784
128.872	4.948
136.510	7.381
167.284	8.000
173.885	9.072
185.900	7.918
197.914	6.763
207.427	9.361
213.999	10.062
216.700	8.866
223.016	6.268
234.403	9.031
237.277	10.062
241.804	8.412
244.517	7.381
246.348	6.969
257.626	8.330
259.604	9.814
260.397	8.041
279.035	8.247
287.623	10.928
295.040	10.515
295.869	9.196
295.936	10.062
300.435	8.041
324.800	10.062
344.436	11.134];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(28.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
F1 = 'length-weight: weight in g = 0.00661*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7F9BX'; % Cat of Life
metaData.links.id_ITIS = '636883'; % ITIS
metaData.links.id_EoL = '46575464'; % Ency of Life
metaData.links.id_Wiki = 'Valenciennea'; % Wikipedia
metaData.links.id_ADW = 'Valenciennea_muralis'; % ADW
metaData.links.id_Taxo = '189859'; % Taxonomicon
metaData.links.id_WoRMS = '277033'; % WoRMS
metaData.links.id_fishbase = 'Valenciennea-muralis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Valenciennea}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Valenciennea-muralis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
