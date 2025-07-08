function [data, auxData, metaData, txtData, weights] = mydata_Ceratoscopelus_maderensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Ceratoscopelus_maderensis'; 
metaData.species_en = 'Madeira lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAN','MAm'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.6); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 25];

%% set data
% zero-variate data
data.am = 2.2*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'RealBern2021';  
  temp.am = C2K(8.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 8.9;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 0.81; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00501*Lp^3.16, see F3';
data.Wwi = 5; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00501*Li^3.16, see F3';
  
data.Ri = 9632/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'fishbase';
  temp.Ri = C2K(8.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm) 
10.296	0.389
24.453	1.123
25.740	0.704
29.601	0.883
30.888	1.198
32.175	0.809
33.462	1.348
37.323	1.033
43.758	1.632
45.045	1.797
45.046	1.393
48.906	2.022
52.767	1.887
52.768	1.707
60.488	1.962
60.489	1.797
68.211	1.887
70.785	2.126
73.359	2.396
74.646	2.246
81.081	2.561
86.229	2.800
87.516	2.231
88.803	2.456
90.090	2.321
91.377	2.695
97.811	2.530
97.812	2.411
99.099	2.995
104.247	2.800
105.533	3.159
105.534	3.055
108.108	3.429
113.256	3.384
119.690	3.489
119.691	3.174
123.552	3.714
123.553	3.669
127.413	3.878
129.987	3.309
131.274	2.919
135.135	4.208
136.422	3.803
136.423	3.578
138.995	3.668
138.996	3.399
142.857	3.953
146.718	4.058
148.005	3.129
151.866	4.267
162.162	4.117
163.448	4.522
163.449	4.312
164.736	3.908
166.023	3.623
169.884	4.192
178.892	4.806
178.893	4.402
180.180	3.922
190.476	4.117
193.050	4.462
196.911	4.252
198.198	4.611
200.772	4.431
213.642	5.180
231.660	4.806
244.530	5.285
249.678	4.655
257.400	4.521
259.974	4.925
261.261	5.374
262.548	4.835
281.853	5.194
305.019	5.014
308.880	5.134
310.167	4.804
316.602	5.823
323.037	4.999
324.323	5.913
324.324	5.403
328.184	5.823
328.185	5.523
329.472	5.164
332.046	6.392
350.064	6.422
352.638	5.703
364.221	5.583
368.082	5.313
371.943	5.942
379.665	6.331
380.952	6.077
395.109	5.492
404.118	6.016
418.275	6.226
419.562	6.406
440.154	6.375
447.876	6.720
454.311	6.480
460.746	6.210
522.523	7.003
532.819	6.689
544.402	6.838
548.263	7.213
548.264	6.973
564.994	7.108
665.380	7.421
679.537	7.211
738.739	7.390
764.479	7.479];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length', 'post-larvae in deep water'};  
temp.tL = C2K(8.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RealBern2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;
weights.Li = 3*weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Preferred temperature 8.6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight Ww in g = 0.00501*(TL in cm)^3.16';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'SPPW'; % Cat of Life
metaData.links.id_ITIS = '162578'; % ITIS
metaData.links.id_EoL = '46564047'; % Ency of Life
metaData.links.id_Wiki = 'Ceratoscopelus_maderensis'; % Wikipedia
metaData.links.id_ADW = 'Ceratoscopelus_maderensis'; % ADW
metaData.links.id_Taxo = '166828'; % Taxonomicon
metaData.links.id_WoRMS = '126585'; % WoRMS
metaData.links.id_fishbase = 'Ceratoscopelus-maderensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ceratoscopelus_maderensis}}';
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
bibkey = 'RealBern2021'; type = 'article'; bib = [ ...
'doi = {10.3989/scimar.05106.007}, ' ...
'author = {Enric Real and Ainhoa Bernal and Beatriz Morales-Nin and Balbina Mol\''{i} and Itziar Alvarez and  M. Pilar Olivar}, ' ... 
'year   = {2021}, ' ...
'title  = {Growth patterns of the lanternfish \emph{Ceratoscopelus maderensis} in the western {M}editerranean {S}ea}, ' ...
'journal = {Scientia Marina}, ' ...
'page = {71-80}, ' ...
'volume = {85(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Ceratoscopelus-maderensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

