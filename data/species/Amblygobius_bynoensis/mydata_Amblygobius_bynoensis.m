function [data, auxData, metaData, txtData, weights] = mydata_Amblygobius_bynoensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Amblygobius_bynoensis'; 
metaData.species_en = 'Bynoe goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
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
data.am = 380;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'HernMund2005';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.87;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'HernMund2005a'; 
data.Lim  = 10;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 1.09;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.08, see F1';
data.Wwi = 10;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00832*Li^3.08, see F1';

data.Ri  = 1.4e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL_f = [... %  time since birth (d), total length (cm)
74.954	3.387
79.525	3.221
127.971	5.938
138.940	4.856
139.854	6.398
142.596	5.690
170.018	5.278
179.159	7.113
200.183	5.950
204.753	6.575
209.324	5.118
213.894	5.577
217.550	6.953
220.292	7.620
225.777	5.704
229.433	7.038
232.175	5.747
236.746	6.206
240.402	5.956
244.058	5.540
244.973	6.874
249.543	7.666
252.285	6.583
256.856	6.709
259.598	6.501
260.512	6.626
263.254	7.919
264.168	8.210
274.223	7.587
277.879	7.838
283.364	6.797
288.848	7.506
289.762	7.965
300.731	8.841
319.013	9.428
340.951	7.973
350.091	8.975];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(28.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HernMund2005';
%
data.tL_m = [ ... %  time since birth (d), total length (cm)
45.704	1.591
49.360	1.591
52.102	1.925
53.016	1.717
54.845	2.301
56.673	2.009
58.501	2.093
61.243	1.552
64.899	2.636
69.470	2.720
70.384	3.220
75.868	2.971
79.525	1.971
83.181	2.847
83.181	3.139
85.923	1.931
87.751	3.556
92.322	2.515
92.322	2.390
101.463	5.225
105.119	4.851
112.431	5.018
141.682	6.482
162.706	4.735
184.643	4.280
188.300	6.781
188.300	5.406
189.214	5.656
194.698	4.907
198.355	7.908
211.152	4.368
215.722	6.286
216.636	4.494
223.949	5.579
226.691	9.037
226.691	6.412
234.004	7.164
235.832	7.414
240.402	5.206
242.230	8.915
244.973	9.791
245.887	5.999
253.199	8.292
257.770	8.501
265.082	9.211
268.739	8.211
270.567	8.711
274.223	9.170
279.707	9.005
283.364	7.505
292.505	8.923
293.419	9.590
304.388	8.550
320.841	6.887
378.428	9.604];
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
F1 = 'length-weight: weight in g = 0.00832*(TL in cm)^3.08';
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
