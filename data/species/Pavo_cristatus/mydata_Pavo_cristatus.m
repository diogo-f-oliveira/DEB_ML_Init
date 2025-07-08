function [data, auxData, metaData, txtData, weights] = mydata_Pavo_cristatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Pavo_cristatus'; 
metaData.species_en = 'Indian peafowl'; 

metaData.ecoCode.climate = {'Am', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                 
metaData.date_subm = [2018 10 23];                            
metaData.email     = {'bas.kooijman@vu.nl'};                  
metaData.address   = {'VU University of Amsterdam'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 22];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 22];

%% set data
% zero-variate data;
data.ab = 29;      units.ab = 'd';    label.ab = 'age at birth';                          bibkey.ab = 'AnAge';  
  temp.ab = C2K(37); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 3;       units.tx = 'd';    label.tx = 'time since birth at fledging';          bibkey.tx = 'guess';  
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature'; comment.tx = 'leaves the nest around 3d';
data.tp = 200;       units.tp = 'd';    label.tp = 'time since birth at puberty';          bibkey.tp = 'guess';  
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';
 comment.tp = 'close to adult size';
  data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';         bibkey.tR = 'AnAge'; 
  temp.tR = C2K(41);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23.2*365;     units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';                   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 120;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                    bibkey.Wwb = 'AnAge'; 
data.Wwi = 3.1e3;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'StarSutt2000';   
  comment.Wwi = 'Wiki: 2.75 to 4 kg';
data.Wwim = 4e3;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'StarSutt2000';   
  comment.Wwim = 'Wiki: 4 to 6 kg';

data.Ri  = 8/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 8 eggs per clutch, probably 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), weight (g)
3.396	90.237
11.271	124.261
13.537	191.931
16.908	192.026
27.046	282.452
36.053	350.312
36.069	406.650
38.342	496.855
41.735	575.824
41.747	620.894
48.489	621.084
49.625	666.187
53.044	835.297
55.256	711.416
57.567	936.833
68.822	1004.755
72.237	1162.598
76.798	1399.347
76.851	1590.897
80.124	1241.694
80.143	1309.300
81.374	1692.433
86.948	1534.844
90.369	1715.222
95.991	1726.648
98.216	1647.837
108.404	1918.547
109.563	2042.523
110.648	1907.342
110.661	1952.413
114.127	2290.539
115.181	2042.681
119.732	2245.626
129.829	2189.573
129.876	2358.588
130.971	2257.210
134.351	2291.108
141.093	2291.298
142.239	2370.204
150.117	2415.496
152.380	2471.898
153.516	2517.000
153.529	2562.071
170.383	2562.546
170.424	2709.026
174.890	2607.743
178.229	2495.161
181.650	2675.539
200.783	2788.754
201.907	2788.786
216.536	2868.071
225.515	2834.521
225.550	2958.466
227.810	3003.600
230.095	3138.876
248.048	3049.241
251.355	2823.982
253.650	2993.060
266.082	3252.566
271.646	3061.173
289.630	3084.215
290.776	3163.120
300.771	2746.500
302.019	3185.972];
units.tW_f = {'d', 'g'};     label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f = C2K(41); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'StarSutt2000';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), weight (g)
2.260	45.134
12.410	180.631
13.518	124.325
16.911	203.293
22.545	259.790
24.802	293.657
27.071	372.594
29.318	372.657
31.600	496.665
36.088	474.256
37.247	598.232
37.259	643.303
38.389	665.870
40.602	541.989
44.026	733.634
46.296	812.572
49.638	711.257
54.189	914.203
54.212	993.077
58.760	1184.754
59.839	1027.038
59.861	1105.912
63.286	1297.558
66.634	1218.779
66.698	1444.132
67.790	1331.487
67.809	1399.093
73.452	1489.393
74.535	1342.945
76.867	1647.236
77.902	1331.772
81.387	1737.504
83.565	1489.678
83.653	1805.173
87.018	1782.733
90.319	1534.939
90.341	1613.812
90.398	1816.631
91.594	2075.819
93.813	1974.474
97.190	1997.104
98.345	2109.812
98.364	2177.419
102.799	1963.459
108.461	2121.365
108.483	2200.239
109.670	2425.625
113.060	2493.326
113.069	2527.129
115.133	1873.666
115.288	2425.783
118.643	2369.539
119.726	2223.091
119.855	2685.066
123.226	2685.161
128.841	2674.052
131.069	2606.509
131.161	2933.272
132.098	2268.510
134.402	2471.392
135.469	2268.605
136.684	2595.400
137.912	2967.265
144.543	2573.086
146.882	2899.912
146.907	2990.054
149.186	3102.794
150.205	2730.992
153.662	3035.314
160.457	3227.055
162.647	3024.300
172.791	3137.262
172.833	3283.742
176.115	2968.341
176.143	3069.750
176.181	3204.963
176.200	3272.569
178.409	3137.420
180.603	2945.932
180.720	3362.837
191.946	3329.350
198.625	3104.186
198.656	3216.863
199.821	3363.375
199.837	3419.714
200.885	3149.321
201.948	2935.266
203.119	3104.313
212.225	3521.471
226.864	3634.559
229.048	3409.269
236.849	3184.137
249.342	3657.728
250.485	3725.366
251.703	4063.428
253.707	3195.879
254.985	3748.028
267.332	3703.305
288.754	3963.063
297.673	3715.427
297.717	3873.175
306.659	3704.413
313.286	3298.966
325.855	4042.982
338.202	3998.259
374.154	3988.004
377.423	3627.533];
units.tW_m = {'d', 'g'};     label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m = C2K(41); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'StarSutt2000';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

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
D2 = 'Food intake is reduced just after hatch';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '6TWGZ'; % Cat of Life
metaData.links.id_ITIS = '176113'; % ITIS
metaData.links.id_EoL = '45510662'; % Ency of Life
metaData.links.id_Wiki = 'Pavo_cristatus'; % Wikipedia
metaData.links.id_ADW = 'Pavo_cristatus'; % ADW
metaData.links.id_Taxo = '53209'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'A8C34DC9655204ED'; % avibase
metaData.links.id_birdlife = 'indian-peafowl-pavo-cristatus'; % birdlife
metaData.links.id_AnAge = 'Pavo_cristatus'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pavo_cristatus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049264/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StarSutt2000'; type = 'Article'; bib = [ ... 
'author = {Starck, J. M. and Sutter, E.}, ' ... 
'year = {2000}, ' ...
'title = {Patterns of growth and heterochrony in moundbuilders (\emph{Megapodiidae}) and fowl (\emph{Phasianidae})}, ' ...
'journal = {J. Avian Biol.}, ' ...
'volume = {31}, ' ...
'pages = {527--547}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pavo_cristatus}}'; 
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

