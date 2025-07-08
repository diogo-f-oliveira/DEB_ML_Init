function [data, auxData, metaData, txtData, weights] = mydata_Rhea_americana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Rheiformes'; 
metaData.family     = 'Rheidae';
metaData.species    = 'Rhea_americana'; 
metaData.species_en = 'Rhea'; 

metaData.ecoCode.climate = {'Aw', 'Cfa', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTd'};
metaData.ecoCode.embryo  = {'Tnsm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCv', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'E0'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-JOe'; 't-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 11 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 09];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 20];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 20];

%% set data
% zero-variate data

data.ab = 40;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'PrinDiet1997';   
  temp.ab = C2K(36.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature from tJO data';
data.tx = 150;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ARKive';   
  temp.tx = C2K(39);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ValdCort2014';   
  temp.tp = C2K(39);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'juveniles are less than a year';
data.tR = 426;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';   bibkey.tR = 'AnAge';
  temp.tR = C2K(39);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'nationalgeographic';   
  temp.am = C2K(39); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 150;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'nationalgeographic';

data.Ww0 = 575;   units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';         bibkey.Ww0 = 'PrinDiet1997';
data.Wwb = 0.75*575; units.Wwb = 'g';label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'PrinDiet1997';
data.Wwi = 23000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 23750; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'avibase';

data.E0 = 3092e3; units.E0 = 'J';   label.E0 = 'energy in egg';            bibkey.E0 = 'PrinDiet1997';
  comment.E0 = 'typical in bird eggs: 4.7-23.5 kJ/g; for rhea 5.37 kJ/g, which is low because of high water content';

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'nationalgeographic';   
temp.Ri = C2K(39);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight females (g)
  0.535	416.664
  2.116	357.141
  6.336	297.617
  9.501	297.617
 12.142	476.188
 19.005	773.810
 25.866	892.857
 27.982	1249.997
 31.138	714.286
 34.311	1130.950
 36.417	892.857
 39.060	1190.474
 41.164	833.333
 42.754	1249.997
 43.286	1547.619
 44.335	1190.474
 48.032	1428.572
 49.607	1011.903
 50.682	2142.859
 52.255	1547.619
 54.896	1726.190
 55.431	2202.382
 58.592	1904.760
 59.124	2202.382
 61.745	1249.997
 61.765	2380.952
 63.346	2261.905
 63.864	1726.190
 64.396	1964.283
 64.939	2857.140
 65.464	2738.093
 66.013	3928.572
 68.080	1488.096
 68.104	2857.140
 73.389	3392.856
 75.505	3690.478
 77.107	4821.428
 78.675	3988.095
 81.849	4464.288
 87.125	4523.811
 89.274	6726.188
 92.428	6071.430
 94.002	5595.238
 94.524	5238.097
 95.070	6309.524
 98.730	4464.288
105.120	7797.620
105.663	8690.476
109.873	8095.237
118.808	6190.477
120.997	10714.286
126.801	10773.809
131.548	10714.286
132.040	8690.476
142.120	11904.762
142.151	13630.952
148.999	13095.238
152.123	10714.286
154.257	12083.332
175.899	12797.619
176.453	14285.714
179.563	11130.952
182.284	15892.857
183.844	14583.332
187.549	15297.618
192.812	14583.332
193.315	13154.762
281.438	14464.285
283.128	20535.715
283.627	18928.572
289.423	18511.903
294.145	17023.810
294.161	17976.190
294.725	19999.999
321.012	14880.951
323.758	21011.905
324.802	20416.666
334.246	17440.476
334.290	19940.476
349.520	16011.904
352.263	22023.809
361.688	17976.190
361.751	21547.619
433.466	19761.905
435.646	23750.001
436.683	22678.571
441.396	20714.285
446.196	23690.477
446.644	19166.666];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'NavaVign2005';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight males (g)
  4.754	357.141
 10.032	476.188
 15.307	476.188
 21.640	595.239
 24.811	892.857
 30.616	1011.903
 36.426	1428.572
 41.171	1249.997
 48.051	2499.999
 49.086	1369.049
 51.210	2142.859
 55.952	1785.713
 61.787	3630.950
 68.662	4583.334
 69.157	2738.093
 73.901	2499.999
 81.300	3273.809
 81.894	7023.810
 90.318	6071.430
 95.042	4702.381
 97.718	6904.763
 97.754	8928.570
106.178	7976.190
110.911	7142.857
119.390	9285.716
119.435	11845.236
126.816	11607.142
139.473	11369.046
140.060	14761.904
149.017	14107.142
152.694	13214.285
180.736	17857.143
188.111	17261.904
192.847	16547.618
281.027	21071.429
289.492	22440.477
321.119	20952.382
321.690	23452.381
329.077	23511.904
334.871	22976.191
349.123	23452.381
357.565	23511.904
362.321	23988.097
433.588	26726.192
442.064	28690.478
446.768	26190.476];
units.tW_m  = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(39); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'NavaVign2005';
comment.tW_m = 'Data for males';

% time-respiration
% embryo data from PrinDiet1997; brooding temp = 36.5C. Rel hum = 60-70%
% RQ constant at 0.75
% 0.22 of initial yolk mass is metabolised during embryogeny.
% yolk mass fraction is 0.30 in 3d chicks
data.tJO = [ ... % time (d), O_2 cons (ml O2/h)
19.389	10.200
19.611	11.086
19.743	8.869
21.612	22.616
21.833	21.729
22.635	29.712
22.900	28.381
24.015	42.572
24.371	45.676
24.639	49.667
24.861	50.554
25.531	60.754
25.709	61.197
26.603	77.162
26.911	73.171
27.714	83.814
28.336	86.031
28.515	89.579
29.002	88.248
29.535	90.909
30.067	88.692
30.645	93.570
31.088	90.909
31.666	94.900
32.063	90.466
32.420	94.457
32.510	97.561
33.218	94.457
33.529	96.674
34.015	92.239
34.325	91.796
34.460	96.231
34.902	92.239
34.945	89.579
35.656	91.796
36.008	86.031
36.407	86.475
36.986	90.909
37.206	88.248
37.783	89.579
38.003	86.031
38.359	87.361
38.493	90.909
39.115	91.796
39.155	82.927
39.611	110.421
39.915	97.118
40.322	113.525
40.933	192.018
40.967	168.958];
units.tJO = {'d', 'ml O2/h'}; label.tJO = {'time', 'embryo O_2 consumption'};  
temp.tJO  = C2K(36.5); units.temp.tJO = 'K'; label.temp.tJO = 'temperature';
bibkey.tJO = 'PrinDiet1997';

%% set weights for all real data
weights = setweights(data, []);
% weights.Wwi = weights.Wwi * 3;
% weights.Wwim = weights.Wwim * 3;
% weights.tp = weights.tp * 3;
% weights.tJO = weights.tJO * 50;
% weights.ab = weights.ab * 3;
weights.tJO(45:50) = 0 * weights.tJO(45:50); % exclude pipping

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
%weights.psd.v = 10 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_2: males have equal state variables at b, compared to females';
D3 = 'mod_3: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'no change in yolk composition during development';
metaData.bibkey.F1 = 'PrinDiet1997'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S5KY'; % Cat of Life
metaData.links.id_ITIS = '174379'; % ITIS
metaData.links.id_EoL = '1178370'; % Ency of Life
metaData.links.id_Wiki = 'Rhea_americana'; % Wikipedia
metaData.links.id_ADW = 'Rhea_americana'; % ADW
metaData.links.id_Taxo = '51258'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '00986B2456382647'; % avibase
metaData.links.id_birdlife = 'greater-rhea-rhea-americana'; % birdlife
metaData.links.id_AnAge = 'Rhea_americana'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhea_americana}}';
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
bibkey = 'NavaVign2005'; type = 'Article'; bib = [ ... 
'author = {J. L. Navarro and P. E. Vignolo and M. R. Demar\''{i}a and N. O. Maceira and M. B. Martella}, ' ... 
'year = {2005}, ' ...
'title = {Growth curves of farmed Greater Rheas (\emph{Rhea americana albescens}) from central {A}rgentina}, ' ...
'journal = {Arch.Gefl\"{u}gelk.}, ' ...
'volume = {69}, ' ...
'pages = {90-93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KilgBern1973'; type = 'Article'; bib = [ ... 
'author = {Kilgore, D. L. and Bernstein, M. H. and Schidt-Nielsen, K.}, ' ... 
'year = {1973}, ' ...
'title = {Brain temperature in a large bird, the Rhea}, ' ...
'journal = {Am. J. Physiol.}, ' ...
'volume = {225}, ' ...
'pages = {739--742}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinDiet1997'; type = 'Article'; bib = [ ... 
'author = {Prinzinger, R. and Dietz, V. and Nagel, B.}, ' ... 
'year = {1997}, ' ...
'title = {Respiratory quatient and embryological development of metabolic heat production in the rhea (\emph{Rhea americana})}, ' ...
'journal = {J. therm. Biol.}, ' ...
'volume = {22}, ' ...
'pages = {223--226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nationalgeographic'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animals.nationalgeographic.com/animals/birds/greater-rhea/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avianweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.avianweb.com/greaterrheas.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rhea_americana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/greater-rhea/rhea-americana/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KirwKort2021'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.grerhe1.02}, ' ...
'author = {Kirwan, G. M. and A. Korthals and C. E. Hodes}, ' ...
'year = {2021}, ' ...
'title = {Greater Rhea (\emph{Rhea americana})}, ' ...
'howpublished = {version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ValdCort2014'; type = 'Article'; bib = [ ... 
'doi = {10.1371/journal.pone.0097334}, ' ...
'author = {Diego Javier Valdez and Marilina Vera Cortez and Natalia S. Della Costa and Alvina L{\`e}che and Cristian Hansen and Joaqu{\''i}n L. Navarro and M{\''o}nica B. Martella}, ' ... 
'year = {2014}, ' ...
'title = {Seasonal Changes in Plasma Levels of Sex Hormones in the Greater Rhea (Rhea americana), a South American Ratite with a Complex Mating System}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {9}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=00986B2456382647&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

