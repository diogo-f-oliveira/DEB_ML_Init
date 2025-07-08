function [data, auxData, metaData, txtData, weights] = mydata_Atherurus_africanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Hystricidae';
metaData.species    = 'Atherurus_africanus'; 
metaData.species_en = 'African brush-tailed porcupine'; 
metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 08]; 

%% set data
% zero-variate data

data.tg = 106;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 4*30.5; units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 150;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = '300-400 g';
data.Wwi = 2750;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = '11-20 kg, till 30 kg';

data.Ri  = 1.5*2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 pups per litter, 2.5 litters per yr';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
3.492	260.459
4.708	215.543
14.249	314.291
14.292	206.507
17.821	368.164
21.388	431.018
23.767	471.423
27.384	413.020
28.554	480.379
32.113	565.688
36.887	606.080
36.898	579.134
40.448	686.899
42.875	606.047
44.025	727.298
46.441	673.392
50.004	749.719
53.568	821.556
54.799	736.219
58.385	754.163
61.931	870.910
66.698	929.266
67.848	1050.517
67.866	1005.607
69.083	956.199
69.158	767.576
73.872	960.663
73.881	938.208
80.984	1144.755
81.050	978.587
86.972	1144.721
92.965	1131.215
95.167	1616.232
95.299	1283.896
95.314	1247.968
103.726	1176.064
106.026	1414.075
108.480	1265.858
111.831	1872.127
118.063	1261.313
119.182	1458.912
121.554	1517.282
121.561	1499.318
122.792	1413.981
128.725	1553.170
128.739	1517.241
134.639	1737.268
136.859	2177.375
148.977	1822.517
150.196	1768.618
152.738	1400.340
153.776	1800.035
157.365	1808.997
158.649	1593.421
159.805	1696.708
168.138	1822.409
182.549	1723.526
182.589	1624.723
188.446	1952.535
191.058	1409.107
195.576	2091.716
202.883	1786.286
206.395	1988.362
210.155	1570.677
219.578	1965.833
219.601	1907.450
219.623	1853.558
224.254	2253.232
226.549	2504.716
237.621	1768.127
247.134	1938.732
248.292	2037.528
248.421	1714.174
251.930	1925.232
267.411	2145.205
267.513	1889.217
273.255	2504.454
276.938	2279.883
277.151	1745.450
286.606	2059.768
286.685	1862.163
297.378	2077.672
305.872	1799.181
309.248	2342.575
312.683	2737.766
314.074	2252.728
316.297	2683.853
318.967	1996.712
326.050	2252.661
327.235	2284.091
339.360	1911.269
341.420	2751.077
344.119	1992.080
355.772	2800.398
358.341	2364.755
368.040	2068.293
377.442	2517.342
380.947	2737.382
384.640	2485.865
384.850	1960.414
390.696	2315.172
391.743	2692.412
395.504	2270.235
419.505	2148.843
423.021	2341.937
444.384	2826.847
444.542	2431.636
445.818	2234.024
449.275	2575.322
454.098	2494.457
476.705	2862.593
476.728	2804.210
476.856	2485.347
484.075	2399.977
485.298	2337.096
486.413	2543.677
516.239	2830.934
516.341	2574.946
524.746	2521.006
525.807	2862.318
540.307	2538.883
564.197	2695.935
580.019	2062.612
594.072	2857.443
615.653	2798.939
632.362	2942.558
636.317	2035.350
645.761	2376.614
713.912	2659.166
743.759	2892.531];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GaillPont1997';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 10; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed, based on Hystrix';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '68924'; % Cat of Life
metaData.links.id_ITIS = '584678'; % ITIS
metaData.links.id_EoL = '326518'; % Ency of Life
metaData.links.id_Wiki = 'Atherurus_africanus'; % Wikipedia
metaData.links.id_ADW = 'Atherurus_africanus'; % ADW
metaData.links.id_Taxo = '63375'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400044'; % MSW3
metaData.links.id_AnAge = 'Atherurus_africanus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hystrix_africaeaustralis}}';
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
bibkey = 'GaillPont1997'; type = 'Article'; bib = [ ... 
'author = {J.-M. Gaillard and D. Pontier and D. Allaine and A. Loison and J.-C. Herves and A. Heizmann}, ' ...
'year = {1997}, ' ...
'title  = {Variation in growth form and precocity at birth in eutherian mammals}, ' ...
'journal = {Proc. R. Soc. Lond. B}, ' ...
'volume = {264}, ' ...
'pages = {859--868}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Atherurus_africanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

