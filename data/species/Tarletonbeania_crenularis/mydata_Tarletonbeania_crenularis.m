function [data, auxData, metaData, txtData, weights] = mydata_Tarletonbeania_crenularis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Tarletonbeania_crenularis'; 
metaData.species_en = 'Blue lanternfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpm'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.2); % in K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 25]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 25]; 

%% set data
% zero-variate data
data.am = 2*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'BystPhil2010';  
  temp.am = C2K(6.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 1.7;   units.Lj = 'cm';   label.Lj = 'standard length at metam';  bibkey.Lj = 'BystPhil2010';
  comment.Lj = 'gap in tL graph 1.7 to 2.17 cm, during which metam occurs';
data.Lp = 4.9;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on same relative length, compared to Diaphus_dumerilii: 2.5/6.5*12.7 cm';
data.Li = 12.7;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Diaphus_dumerilii: pi/6*0.05^3';
data.Wwp = 1.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';  
  comment.Wwp = 'based on 0.01023*Lp^3.10, see F3';
data.Wwi = 27;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01023*Li^3.10, see F3';

data.Ri = 4e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(6.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
  
% uni-variate data
% time-length data
% larva
data.tL_l = [ ... % time since birth (d), standard length (cm)
 8.230	0.421
10.974	0.466
13.032	0.542
13.717	0.647
18.519	0.783
24.691	0.677
26.749	1.129
28.807	1.339
33.608	1.174
46.639	1.280
66.529	1.641];
units.tL_l = {'d', 'cm'}; label.tL_l = {'time since birth', 'standard length', 'larvae in surface waters'};  
temp.tL_l = C2K(15);  units.temp.tL_l = 'K'; label.temp.tL_l = 'temperature';
bibkey.tL_l = 'BystPhil2010';
comment.tL_l = 'larval growth in surface waters';
% post larva
data.tL = [ ... % time since birth (d), standard length (cm) 
185.185	2.562
194.102	2.592
197.531	2.577
198.217	2.923
200.960	2.653
205.761	2.608
206.447	2.758
206.447	2.683
208.505	2.954
214.678	2.593
215.364	2.713
222.222	3.195
222.908	3.796
223.594	2.668
227.709	3.195
230.453	3.796
230.453	3.616
231.139	3.691
231.824	3.210
237.311	3.676
237.997	3.917
244.170	3.631
248.971	3.617
249.657	3.797
255.144	4.098
270.919	3.993
275.720	3.918
299.040	5.302
301.783	4.490
302.469	4.896
312.071	4.716
315.501	4.731
315.501	4.611
321.674	4.310
325.103	5.393
325.789	4.521
325.789	4.702
326.475	5.032
326.475	5.499
326.475	5.604
336.763	5.394
338.820	5.454
340.192	5.514
345.679	5.710
347.051	5.183
350.480	5.424
355.281	5.394
355.281	5.770
356.653	5.199
358.025	5.695
360.082	7.003
362.140	6.402
367.627	5.109
370.370	6.808
377.229	6.011
377.229	7.199
379.973	5.711
383.402	6.628
395.062	6.884
408.779	5.922
412.209	6.223
415.638	7.050
417.010	7.516
420.439	6.945
429.355	7.426
431.413	6.720
433.471	5.983
435.528	7.111
438.957	6.194
439.643	7.321
451.303	7.021
454.733	7.532
458.848	6.811
462.277	6.645
463.649	7.142
467.078	7.413
469.136	7.352
475.995	6.601
504.801	7.820];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length', 'post-larvae in deep water'};  
temp.tL = C2K(6.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BystPhil2010';
comment.tL = 'post-larval growth in deep water';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_l','tL'}; subtitle1 = {'Data for larva, post-larva'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Preferred temperature 6.2 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Length-Weight relationship: W in g =  0.01023*(SL in cm)^3.10';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '54XTZ'; % Cat of Life
metaData.links.id_ITIS = '162673'; % ITIS
metaData.links.id_EoL = '46564312'; % Ency of Life
metaData.links.id_Wiki = 'Tarletonbeania_crenularis'; % Wikipedia
metaData.links.id_ADW = 'Tarletonbeania_crenularis'; % ADW
metaData.links.id_Taxo = '188818'; % Taxonomicon
metaData.links.id_WoRMS = '282927'; % WoRMS
metaData.links.id_fishbase = 'Tarletonbeania-crenularis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tarletonbeania_crenularis}}';
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
bibkey = 'BystPhil2010'; type = 'article'; bib = [ ...
'doi = {10.1007/s10641-010-9681-2}, '...
'author = {Zofia E. Bystydzie\''{n}ska and A. Jason Phillips  and Tomasz B. Linkowski}, ' ... 
'year   = {2010}, ' ...
'title  = {Larval stage duration, age and growth of blue lanternfish \emph{Tarletonbeania crenularis} ({J}ordan and {G}ilbert, 1880) derived from otolith microstructure}, ' ...
'journal = {Environ Biol Fish}, ' ...
'page = {493-503}, ' ...
'volume = {89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Tarletonbeania-crenularis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

