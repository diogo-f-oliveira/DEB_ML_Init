function [data, auxData, metaData, txtData, weights] = mydata_Histioteuthis_bonnellii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Histioteuthidae';
metaData.species    = 'Histioteuthis_bonnellii'; 
metaData.species_en = 'Umbrella squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm','MI','MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 450;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'MereStac2011';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'MereStac2011';
data.Lpm  = 5.5;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male';  bibkey.Lpm  = 'MereStac2011';
data.Li  = 23; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'MereStac2011';
data.Lim = 19.8; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'MereStac2011';

data.Wwb  = 2.4e-5;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'Lapt2001';
  comment.Wwb = 'based on egg length 0.5 mm and egg width of 0.3 mm: pi/6*0.05*0.03^2';

data.Ni  = 275e3; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'Lapt2001';   
  temp.Ni = C2K(18); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on kap=0.7';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
172.293	3.458
186.400	4.644
198.147	5.435
209.866	5.632
218.035	5.040
226.268	5.830
231.003	6.917
253.349	8.992
261.393	5.731
264.947	6.621
270.890	8.498
274.250	5.237
274.296	6.225
282.599	8.498
282.623	8.992
285.025	10.277
290.768	7.905
293.087	7.411
294.369	9.783
297.743	6.818
309.592	9.783
309.744	13.043
311.836	7.708
316.604	9.486
324.800	9.486
330.715	10.771
331.766	8.202
332.974	8.992
340.064	10.375
341.171	8.992
352.774	6.719
354.116	10.375
354.185	11.858
354.417	16.798
367.047	11.462
367.163	13.933
374.217	14.526
390.643	15.217
394.438	21.245
408.281	16.798
410.827	21.146
420.259	22.530
421.106	15.613
421.236	18.379
436.615	21.739];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MereStac2011';
comment.tL_f = 'Data for females from south Sardinian waters)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm
138.948	2.542
147.197	2.837
155.455	3.329
160.138	2.834
166.030	3.030
171.963	4.116
182.551	4.114
186.169	5.991
188.420	3.817
199.133	6.482
200.361	7.569
204.974	5.592
220.263	5.490
223.778	5.193
225.048	7.169
229.726	6.575
230.916	6.871
258.091	9.336
272.250	10.223
273.534	12.495
288.488	5.279
289.716	6.366
293.413	9.922
295.538	5.080
296.961	10.317
300.625	13.182
306.591	14.959
318.067	8.830
323.903	7.841
323.931	8.434
324.033	10.608
327.391	6.951
332.203	9.223
334.668	11.594
338.388	15.645
339.495	14.162
347.721	13.963
348.711	10.010
348.795	11.789
353.384	9.318
364.237	14.948
366.386	10.600
368.706	9.907
377.006	11.289
386.460	12.177
389.943	11.188
390.329	19.389
392.380	12.966
396.034	15.633
407.980	19.485
408.869	13.358
410.212	16.915
414.728	12.863];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MereStac2011';
comment.tL_m = 'Data for males from south Sardinian waters'; 

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
177.033	53.066
193.780	53.596
199.761	117.026
212.919	164.873
218.900	117.631
230.861	133.820
230.862	86.389
252.392	340.034
260.766	182.196
265.550	419.502
275.120	87.788
278.708	198.574
279.904	293.473
283.493	356.828
287.081	467.613
291.866	214.800
297.847	309.851
297.848	246.610
308.612	816.120
312.201	168.012
316.986	784.764
318.182	452.786
322.967	389.697
324.163	326.493
331.340	279.289
333.732	595.571
338.517	437.619
345.694	627.569
354.067	1781.984
355.263	248.425
355.264	501.390
357.656	896.722
364.833	549.123
368.421	1197.458
376.794	944.758
394.737	1451.255
397.129	2621.291
409.091	3206.649
410.287	2115.778
424.641	1720.975
424.642	1894.888
424.643	3855.362
438.995	3270.836];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(18);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'MereStac2011';
comment.tWw_f = 'Data for females from south Sardinian waters'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
136.792	0.200
149.764	0.500
163.901	47.431
176.873	47.431
185.095	158.103
198.095	63.241
200.420	173.913
206.293	252.964
219.298	142.292
226.359	189.723
226.392	79.051
235.784	221.344
255.817	268.775
269.912	458.498
274.662	347.826
288.868	158.103
292.425	94.862
294.639	584.980
294.662	505.929
299.496	110.672
301.644	822.134
313.404	932.806
315.931	363.636
315.963	252.964
319.492	284.585
324.097	664.032
324.153	474.308
330.077	379.447
330.114	252.964
334.715	648.221
338.154	980.237
339.138	1644.269
348.791	901.186
348.824	790.514
348.889	569.170
354.827	426.877
360.574	932.806
366.619	426.877
367.733	648.221
377.167	648.221
386.615	600.791
390.023	1043.478
390.969	1833.992
395.807	1422.925
406.136	2387.352
407.767	853.755
416.003	916.996];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(18);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'MereStac2011';
comment.tWw_m = 'Data for males from south Sardinian waters'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3M5FM'; % Cat of Life
metaData.links.id_ITIS = '82501'; % ITIS
metaData.links.id_EoL = '493098'; % Ency of Life
metaData.links.id_Wiki = 'Histioteuthis_bonnellii'; % Wikipedia
metaData.links.id_ADW = 'Histioteuthis_bonnellii'; % ADW
metaData.links.id_Taxo = '158035'; % Taxonomicon
metaData.links.id_WoRMS = '140111'; % WoRMS
metaData.links.id_molluscabase = '140111'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Histioteuthis_bonnellii}}';
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
bibkey = 'MereStac2011'; type = 'Article'; bib = [ ... 
'author = {M. Mereu and D. Stacca and R. Cannas and D. Cuccu}, ' ... 
'year = {2011}, ' ...
'title = {ON THE GROWTH RINGS ON \emph{Histioteuthis bonnellii} ({F}\''{e}RUSSAC, 1835) UPPER BEAKS}, ' ...
'journal = {Biol. Mar. Mediterr.}, ' ...
'volume = {18(1)}, ' ...
'pages = {124-127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lapt2001'; type = 'Article'; bib = [ ... 
'author = {Vladimir Laptikhovshy}, ' ... 
'year = {2001}, ' ...
'title = {The first data on ovary maturation and fecundity in the squid family {H}istioteuthidae}, ' ...
'journal = {Sci. Mar.}, ' ...
'volume = {65(2)}, ' ...
'pages = {127-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Histioteuthis-bonnellii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

