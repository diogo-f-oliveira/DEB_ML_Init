function [data, auxData, metaData, txtData, weights] = mydata_Struthio_camelus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Struthioniformes'; 
metaData.family     = 'Struthionidae';
metaData.species    = 'Struthio_camelus'; 
metaData.species_en = 'Common ostrich'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTd'};
metaData.ecoCode.embryo  = {'Tnsm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.62); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 11 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 19];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 19]; 

%% set data
% zero-variate data

data.ab = 40.5;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'SnowPerr1998';   
  temp.ab = C2K(34.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 4.5*30.5;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'FolcChri2020';   
  temp.tx = C2K(38.62);  units.temp.tx = 'K'; label.temp.tx = 'temperature'; comment.temp.tx = '4-5 months';
data.tp = 18*30.5;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'FolcChri2020';   
  temp.tp = C2K(38.62);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'full grown around 18 mo.';
data.tR = 3.5*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'CramSimm1977';
  temp.tR = C2K(38.62);  units.temp.tR = 'K'; label.temp.tR = 'temperature'; comment.tR = '3-4 years for ';
data.am = 18250;   units.am = 'd';    label.am = 'life span';                  bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(38.62);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 212.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'SnowPerr1998';

data.Wwb = 816;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ZoccGuo2004';
data.Wwi = 130000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'SnowPerr1998';

data.Ri  = 0.016438356; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'CramSimm1977', 'SnowPerr1998'};   
temp.Ri = C2K(38.62);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g):
30   4000;
60	11000;
90	19500;
120	28500;
150	39500;
180	52100;
210	63400;
240	73300;
270	82400;
300	91000;
330	96300;
360	99900;
390	103500;
420	107000;
450	110000;
480	112300;
510	114200;
540	116000;
570	118600;
600	120300];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.62);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Sale2002';
  
data.tW2 = [...% age (d) weight (kg):
66.27565982404693, 10.135135135135135
65.10263929618769, 12.387387387387388
63.92961876832845, 17.792792792792792
72.14076246334311, 16.89189189189189
80.93841642228739, 14.63963963963964
84.45747800586511, 10.36036036036036
73.31378299120234, 13.513513513513514
92.66862170087977, 14.18918918918919
75.0733137829912, 23.423423423423422
97.36070381231671, 33.55855855855856
91.49560117302053, 28.603603603603602
99.7067448680352, 24.774774774774777
87.97653958944282, 23.873873873873872
93.2551319648094, 20.27027027027027
112.02346041055719, 27.92792792792793
112.60997067448682, 33.55855855855856
103.81231671554252, 15.99099099099099
109.67741935483872, 14.18918918918919
113.19648093841643, 19.144144144144143
114.95601173020529, 16.44144144144144
123.75366568914957, 11.486486486486486
129.03225806451613, 20.72072072072072
129.61876832844575, 17.117117117117118
138.41642228739005, 14.864864864864865
144.28152492668622, 23.873873873873872
140.76246334310852, 19.36936936936937
154.83870967741936, 19.81981981981982
149.5601173020528, 22.2972972972973
141.34897360703812, 35.36036036036036
146.0410557184751, 36.486486486486484
147.21407624633432, 33.333333333333336
167.74193548387098, 29.72972972972973
158.9442815249267, 29.054054054054056
158.35777126099708, 25.675675675675677
170.08797653958945, 25.225225225225227
180.05865102639297, 38.96396396396396
187.683284457478, 38.73873873873874
196.4809384164223, 51.126126126126124
198.24046920821115, 48.64864864864865
211.14369501466277, 54.054054054054056
221.7008797653959, 62.83783783783784
195.30791788856305, 60.810810810810814
190.6158357771261, 65.09009009009009
206.45161290322582, 66.66666666666667
206.45161290322582, 71.17117117117117
206.45161290322582, 74.32432432432432
194.13489736070383, 74.77477477477477
212.90322580645162, 79.27927927927928
219.94134897360706, 74.0990990990991
217.00879765395896, 70.94594594594595
222.28739002932554, 68.69369369369369
311.43695014662757, 113.51351351351352
302.6392961876833, 100.22522522522523
313.78299120234607, 99.0990990990991
323.16715542521996, 96.84684684684684
300.8797653958944, 91.66666666666667
308.50439882697947, 94.5945945945946
314.9560117302053, 91.89189189189189
317.30205278592376, 87.61261261261261
331.3782991202346, 90.09009009009009
325.51319648093846, 90.990990990991
341.34897360703815, 92.34234234234235
344.86803519061584, 95.72072072072072
340.76246334310855, 98.87387387387388
331.96480938416425, 98.64864864864865
325.51319648093846, 104.05405405405405
366.5689149560117, 104.27927927927928
370.6744868035191, 102.25225225225225
371.2609970674487, 99.77477477477477
364.8093841642229, 89.86486486486487
378.2991202346041, 93.46846846846847
382.99120234604106, 90.09009009009009
    ];
data.tW2(:,2) = data.tW2(:,2) * 1e3; %  kg to g
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(38.62);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'RamoCaet2013';
comment.tW2 = 'female fig 2 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tW2 = weights.tW2 * 2;
weights.tW = weights.tW * 2;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_2: v is reduced';
D2 = 'mod_3: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6ZYDX'; % Cat of Life
metaData.links.id_ITIS = '174375'; % ITIS
metaData.links.id_EoL = '45513749'; % Ency of Life
metaData.links.id_Wiki = 'Struthio_camelus'; % Wikipedia
metaData.links.id_ADW = 'Struthio_camelus'; % ADW
metaData.links.id_Taxo = '51245'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '2247CB050A76CF8E'; % avibase
metaData.links.id_birdlife = 'common-ostrich-struthio-camelus'; % birdlife
metaData.links.id_AnAge = 'Struthio_camelus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Struthio_camelus}}';
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
bibkey = 'CramSimm1977'; type = 'Incollection'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1977}, ' ...
'title = {Ostrich to Ducks}, ' ...
'publisher = {Oxford University Press}, ' ...
'booktitle = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {I}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DegeKam1991'; type = 'Article'; bib = [ ... 
'author = {Degen, A. A. and Kam, M. and Rosenstrauch, A. and Plavnik, I.}, ' ... 
'year = {1991}, ' ...
'title = {Growth-Rate, Total-Body Water Volume, Dry-Matter Intake and Water-Consumption of Domesticated Ostriches (\emph{Struthio camelus})}, ' ...
'journal = {Agricultura in practic}, ' ...
'volume = {71--72}, ' ...
'pages = {112--117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sale2002'; type = 'Techreport'; bib = [ ... 
'author = {Sales, J.}, ' ... 
'year = {2002}, ' ...
'title = {Feeding Guidelines for Ratites in Zoos.}, ' ...
'institution = {Ghent University, Merelbeke}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition.}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZoccGuo2004'; type = 'Article'; bib = [ ... 
'author = {Zoccarato, I. and Guo, K. and Gasco, L. and Picco, G.}, ' ... 
'year = {2004}, ' ...
'title = {Effect of egg weight on ostrich (\emph{Struthio camelus}) chick weight and growth}, ' ...
'journal = {Italian Journal of Animal Science}, ' ...
'volume = {3}, ' ...
'pages = {7--17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FolcChri2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.ostric2.01}, ' ...
'author = {Folch, A. and D. A. Christie and F. Jutglar and E. F. J. Garcia}, ' ...
'year = {2020}, ' ...
'title = {Common Ostrich (\emph{Struthio camelus})}, ' ...
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
bibkey = 'RamoCaet2013'; type = 'Article'; bib = [ ... 
'doi = {10.3382/ps.2012-02380}, ' ...
'author = {Ramos, S. B. and Caetano, S. L. and Savegnago, R. P. and Nunes, B. N. and Ramos, A. A. and Munari, D. P.}, ' ... 
'year = {2013}, ' ...
'title = {Growth curves for ostriches ({Struthio} camelus) in a {Brazilian} population}, ' ...
'journal = {Poultry Science}, ' ...
'volume = {92}, ' ...
'number = {1}, ' ...
'pages = {277--282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
