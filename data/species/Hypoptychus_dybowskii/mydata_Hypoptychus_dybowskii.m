function [data, auxData, metaData, txtData, weights] = mydata_Hypoptychus_dybowskii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Hypoptychidae';
metaData.species    = 'Hypoptychus_dybowskii'; 
metaData.species_en = 'Korean sandlance'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'piMc', '0iFe', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 05];

%% set data
% zero-variate data

data.ab = 32;      units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'NariMune1999';   
  temp.ab = C2K(7.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 1 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'NariMune1997';   
  temp.am = C2K(7.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7;   units.Lb  = 'cm';  label.Lb  = 'standard length at birth';   bibkey.Lb  = 'NariMune1999'; 
data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'NariMune1997'; 
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwp = 0.46;   units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on  0.00302*Lp^3.12, see F1'; 
data.Wwi = 3.98;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00302*Li^3.12, see F1'; 

data.Ri  = 80/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(7.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [... % time (d), standard length (cm)
4.441	0.911
9.052	0.844
11.763	0.960
19.764	1.042
24.531	1.290
26.389	1.025
29.714	1.041
31.794	1.223
34.497	1.322
35.259	1.521
46.634	1.719
48.855	2.182
50.507	1.503
50.672	1.834
55.946	1.768
67.461	2.247
83.525	3.869
86.063	3.637
86.594	3.372
87.114	4.415
92.486	4.547
104.479	3.321
111.673	4.446
113.123	4.695
113.206	4.860
119.789	4.760
121.285	3.766
121.565	4.329
121.936	5.075
123.213	4.975
125.038	4.644
126.105	5.455
126.686	5.290
128.367	6.002
128.528	4.991
130.007	3.964
132.426	4.825
135.639	5.952
136.105	5.554
136.953	4.593
138.021	5.405
139.829	5.040
140.938	5.934
140.999	4.725
145.317	5.404
149.573	4.625
150.381	6.248
151.959	5.420
153.850	5.221
160.817	4.558
165.192	5.353
169.728	5.137
177.321	5.733
180.881	4.888
185.829	5.500
189.006	5.218
189.504	4.887
198.432	5.499
199.030	5.367
202.795	4.936
208.526	7.121
212.424	6.955
217.121	5.729
221.665	5.530
228.595	6.126
231.697	5.695
231.763	5.828
233.613	5.546
243.345	6.439
244.745	6.588
245.565	6.903
265.407	6.785
269.873	5.096
272.486	5.013
272.815	5.675
273.239	5.195
274.566	5.195
276.099	5.609
279.452	7.016
282.077	5.625
283.338	5.492
285.278	5.393
289.493	7.198
289.864	5.276
289.897	5.342
290.799	5.823
292.690	5.624
293.246	5.408
293.873	6.667
295.582	6.104
298.792	5.888
299.875	6.733
305.264	6.898
307.061	7.842
307.081	6.550
314.353	6.500
315.363	7.195
315.931	5.672
317.179	6.847
321.135	6.797
321.415	7.361
322.173	6.218
323.186	5.588
326.173	4.925
326.297	5.174
329.844	5.637
329.964	7.211
331.665	6.631
331.830	6.962
337.821	5.670
337.907	7.177
342.415	5.570
348.986	6.779
353.090	7.027
357.308	7.507
358.837	6.579
362.767	6.479]; 
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'standard length', 'females'};  
temp.tL_f    = C2K(7.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'NariMune1997';
%
data.tL_m = [... % time (d), standard length (cm)
134.115	5.554
151.056	4.940
155.292	5.453
160.499	5.254
167.475	4.607
168.327	4.988
171.030	5.087
171.825	5.352
172.414	5.203
182.249	4.970
189.793	5.467
192.347	5.268
204.460	5.615
245.561	5.561
250.402	5.959
250.480	4.783
257.147	4.848
264.789	5.543
274.978	6.023
279.630	6.039
283.560	5.939
288.286	6.104
303.501	6.020
317.381	5.920
330.549	5.720
334.570	5.803
338.183	6.398]; 
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'standard length', 'males'};  
temp.tL_m    = C2K(7.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'NariMune1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00302*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYBB'; % Cat of Life
metaData.links.id_ITIS = '171689'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Hypoptychus_dybowskii'; % Wikipedia
metaData.links.id_ADW = 'Hypoptychus_dybowskii'; % ADW
metaData.links.id_Taxo = '153397'; % Taxonomicon
metaData.links.id_WoRMS = '281124'; % WoRMS
metaData.links.id_fishbase = 'Hypoptychus_dybowskii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hypoptychus_dybowskii}}';
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
bibkey = 'NariMune1999'; type = 'Article'; bib = [ ... 
'author = {Yoji Narimatsu and Hiroyuki Munehara}, ' ... 
'year = {1999}, ' ...
'title = {Spawn date dependent survival and growth in the early life stages of \emph{Hypoptychus dybowskii} ({G}asterosteiformes)}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {56}, ' ...
'pages = {1849–1855}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NariMune1997'; type = 'Article'; bib = [ ... 
'author = {Yoji Narimatsu and Hiroyuki Munehara}, ' ... 
'year = {1997}, ' ...
'title = {Age Determination and Growth from Otolith Daily Growth Increments of \emph{Hypoptychus dybowskii} ({G}asterosteiformes)}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {63(4)}, ' ...
'pages = {503-508}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Hypoptychus-dybowskii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
