function [data, auxData, metaData, txtData, weights] = mydata_Martes_pennanti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Martes_pennanti'; 
metaData.species_en = 'Fisher'; 

metaData.ecoCode.climate = {'Dfb', 'Dsb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFm', '0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 45;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 66;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14.3*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(38.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 35;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'AnAge';

data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 pups per litter, 1 litters per yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
4.044	42.959
5.692	94.559
6.495	94.542
9.721	111.684
9.735	128.895
12.124	103.026
12.976	163.249
14.554	128.791
16.216	197.602
17.843	223.385
21.042	206.105
21.901	274.933
27.537	292.023
28.306	248.977
31.574	317.754
32.411	360.765
33.166	300.508
35.673	420.936
35.686	438.147
35.728	489.782
42.853	360.541
43.005	549.866
46.128	437.923
48.496	386.237
48.607	523.928
51.930	661.550
56.597	472.121
61.534	618.314
62.309	583.874
63.840	489.177
64.102	816.194
66.360	626.816
66.388	661.239
67.994	661.205
68.167	876.347
68.597	411.622
73.007	902.061
73.575	609.449
74.351	575.009
75.271	721.289
75.382	858.980
77.867	953.591
82.645	901.853
89.209	1073.829
89.292	1177.097
89.409	1323.395
89.874	901.698
93.377	1263.068
98.030	1056.427
100.875	1598.535
101.478	1348.952
104.074	1581.255
107.073	1314.409
108.146	1650.014
113.975	1908.064
125.206	1890.611
130.309	2243.341
134.208	2096.957
141.498	2174.253
150.500	2380.600
156.184	2457.930
166.640	2474.917
169.714	2302.734
169.963	2612.539
172.186	2380.133
172.241	2448.979
174.789	2621.041
198.629	2302.112
199.785	2740.985
201.219	2525.808
202.153	2689.299
223.556	2335.999
226.534	2043.336
227.634	2413.364
227.862	2697.352
236.822	2852.064
237.105	3204.898
259.118	2610.621
259.679	2309.404
261.118	3101.112
264.297	3058.014
288.296	2937.016
290.970	2265.702
294.424	2566.832
307.483	2824.727
311.777	2170.590
316.180	2652.423
318.112	2058.577
319.102	2290.914
321.103	2781.404
323.360	2592.027
324.738	2308.004
330.042	2910.300
334.487	2445.488
335.616	2849.939
336.115	2471.271
340.151	2497.001
342.858	2866.995
346.529	2436.623
347.893	2135.389
347.921	2169.812
348.862	2341.909
348.897	2384.937
349.332	2927.097
352.947	2427.879
356.416	2746.221
361.762	2401.872
362.821	2720.266
363.181	2169.484];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(38.5);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'FrosKroh2005';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
6.481	77.330
10.531	120.272
15.371	145.986
16.188	163.180
16.209	188.997
19.422	188.928
19.422	188.928
21.056	223.316
22.697	266.310
25.903	257.635
28.416	386.669
30.909	489.885
32.356	291.920
34.911	472.588
35.783	558.627
39.030	601.587
46.384	756.334
50.393	747.642
56.998	971.252
60.931	867.897
63.292	807.605
66.443	730.085
67.405	927.999
69.094	1031.232
72.121	798.809
74.738	1056.929
75.056	1452.791
78.068	1203.157
78.788	1099.871
83.829	1375.150
84.411	1099.750
88.973	1779.514
90.774	1022.160
92.020	1572.908
96.250	1839.598
103.914	2381.602
107.985	2450.361
108.325	1873.762
111.060	2278.178
115.990	2415.766
127.310	2510.187
129.955	2802.729
132.538	3017.819
135.826	3112.413
140.639	3103.704
151.004	3008.816
152.041	4299.672
167.421	3447.362
170.114	3800.143
171.719	4798.388
173.790	4376.657
179.080	3963.462
195.830	3816.802
197.602	4023.304
202.365	4952.634
206.548	4160.805
233.718	3988.104
234.612	4099.961
237.755	4013.834
260.300	4082.196
261.582	3677.694
263.207	4701.755
267.655	3238.665
283.677	3186.685
291.744	3229.540
294.442	4589.207
298.487	3625.265
308.706	4347.936
310.141	3134.480
312.717	3340.965
316.581	3151.553
319.724	3065.427
320.139	3581.770
322.355	3340.758
324.071	4476.693
326.898	2996.426
330.277	3202.894
333.835	3633.110
337.005	4579.685
338.530	3478.104
341.501	3176.835
343.280	3391.943
346.417	3297.211
346.617	3546.776
349.025	4545.003
351.561	3701.575
351.664	3830.661
356.166	3434.695
358.083	3821.917
360.327	3615.328
363.685	3795.979
364.909	4320.909
400.043	4061.978];
units.tW_m = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(38.5);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'FrosKroh2005';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.tp = 5 * weights.tp;
weights.tpm = 5 * weights.tpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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
D2 = 'Body temperature from Neovison';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'The implantation can be delayed and extend the gestation time up to one year.';
metaData.bibkey.F1 = 'AnAge'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5K9DV'; % Cat of Life
metaData.links.id_ITIS = '180560'; % ITIS
metaData.links.id_EoL = '328592'; % Ency of Life
metaData.links.id_Wiki = 'Pekania'; % Wikipedia
metaData.links.id_ADW = 'Martes_pennanti'; % ADW
metaData.links.id_Taxo = '66671'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001254'; % MSW3
metaData.links.id_AnAge = 'Martes_pennanti'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Martes_pennanti}}';
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
bibkey = 'FrosKroh2005'; type = 'Incollection'; bib = [ ... 
'author = {H. Frost and W. Krohn}, ' ... 
'year = {2005}, ' ...
'title = {Postnatal growth and development in fishers}, ' ...
'booktitle = {Martens and fishes (\emph{Martes} in human-altered environments; an internaltional perspective}, ' ...
'editor = {D. J. Harrison and A. K. Fuller and G. Proulx}, '...
'publisher = {Springer}, ' ...
'isbn = {0-387-22691-5}, ' ...
'pages = {253--264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Martes_pennanti}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

