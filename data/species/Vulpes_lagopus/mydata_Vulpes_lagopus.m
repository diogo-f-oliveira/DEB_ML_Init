function [data, auxData, metaData, txtData, weights] = mydata_Vulpes_lagopus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Vulpes_lagopus'; 
metaData.species_en = 'Arctic fox'; 

metaData.ecoCode.climate = {'Dfc', 'ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCva', 'xiCvm', 'xiSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2016 12 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 52;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 51;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 304;    units.tp = 'd';    label.tp = 'time since birth at puberty';bibkey.tp = 'AnAge';
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.3*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am =  'life span between 15 and 25 yr ';
  
data.Wwb = 70;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 3030;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'PresNils1995';
data.Wwim = 3600;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'PresNils1995';
  
data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW_f = [ % time since birth (d), wet weight (g)
32.028	645.454
49.671	690.909
51.271	736.364
51.814	645.454
52.811	1463.636
63.414	2500.000
64.013	1772.727
66.711	1500.000
69.385	1500.000
74.782	945.455
76.316	1736.363
77.374	1863.637
78.481	1445.454
81.137	1645.455
82.184	1900.000
82.772	1300.000
84.924	1154.545
85.953	1609.091
85.967	1445.454
87.603	1090.909
88.645	1400.000
90.178	2200.000
90.692	2436.364
93.985	1490.909
95.019	1881.818
97.145	2036.364
98.156	2690.909
98.200	2190.909
98.832	1100.000
100.267	3000.000
104.581	2600.000
104.643	1900.000
107.790	2590.909
108.894	2209.091
112.644	2136.363
113.120	2790.909
115.285	2500.000
117.443	2290.909
118.567	1681.818
123.325	2290.909
125.519	1681.818
125.963	2690.909
129.170	2709.091
145.204	2809.091
151.659	2381.818
163.940	2590.909
171.999	2172.727
172.916	3881.818
177.247	3290.909
183.131	3272.727
190.189	2081.818
191.714	2972.727
204.012	2981.818
205.011	3772.727
207.212	3081.818
207.240	2763.636
213.103	2981.818
217.880	3381.818
220.053	3000.000
226.367	4163.636
226.437	3372.727
229.733	2390.909
231.865	2472.727
233.960	2972.727
234.513	2763.636
236.526	4172.727
240.876	3372.727
243.602	2790.909
243.620	2581.818
244.111	3072.727
247.846	3172.727
251.116	2472.727
255.911	2681.818
269.831	2490.909
273.547	2800.000
275.580	3990.909
278.930	2400.000
286.347	3190.909
286.454	1981.818
287.970	2972.727
290.161	2390.909
293.358	2527.273
293.791	3663.636
294.316	3772.727
297.649	2372.727
299.243	2490.909
300.251	3181.818
300.269	2981.818
540.597	2546.576
540.634	2337.484
570.034	2754.329
570.934	3627.016
573.229	2545.093
600.624	2389.303
601.251	4816.547
601.425	3825.630
601.529	3234.716
631.177	2242.459
659.359	3604.815
660.271	4404.773
661.582	2931.986
661.685	2341.072
662.477	3831.946]; 
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(38.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'PresNils1995';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (d), wet weight (g)
25.638	345.455
26.162	463.636
26.168	390.909
35.242	581.818
36.306	645.454
36.816	927.273
37.369	718.182
38.993	500.000
40.587	609.091
42.195	572.727
43.787	709.091
44.843	863.636
45.382	809.091
49.118	900.000
51.248	1000.000
51.255	918.182
52.304	1154.545
52.310	1081.818
52.334	809.091
57.628	1409.091
57.680	827.273
59.803	1009.091
61.899	1490.909
62.958	1609.091
64.074	1090.909
64.585	1354.546
66.693	1709.091
68.881	1154.545
69.366	1709.091
72.663	718.182
74.206	1409.091
75.233	1890.909
75.298	1154.545
79.009	1518.182
79.033	1245.455
79.579	1118.182
79.991	2500.000
80.659	1009.091
81.095	2109.091
81.105	2000.000
82.221	1481.818
83.806	1700.000
85.967	1445.454
86.515	1300.000
87.468	2609.091
88.047	2109.091
88.511	2909.091
88.525	2754.545
88.627	1609.091
89.678	1809.091
90.732	1990.909
91.185	2900.000
91.323	1354.546
93.886	2600.000
96.123	1500.000
98.128	3009.091
98.213	2045.455
98.227	1890.909
98.785	1627.273
98.796	1509.091
100.395	1563.636
100.882	2109.091
102.397	3109.091
105.676	2318.182
108.894	2209.091
113.156	2390.909
115.901	1590.909
119.527	2909.091
121.702	2500.000
130.222	2909.091
138.742	3318.182
141.428	3181.818
151.668	2281.818
164.937	3409.091
166.035	3090.909
171.962	2590.909
174.028	3409.091
175.110	3263.636
175.144	2881.818
176.187	3181.818
177.265	3081.818
177.852	2500.000
179.430	2790.909
179.901	3509.091
179.939	3081.818
182.487	4490.909
183.602	3981.818
183.638	3581.818
184.191	3372.727
185.276	3200.000
188.351	4700.000
191.614	4090.909
194.315	3781.818
194.345	3445.454
195.340	4281.818
199.251	2400.000
199.716	3190.909
199.759	2700.000
201.295	3472.727
203.985	3290.909
205.019	3690.909
207.194	3281.818
207.712	3472.727
208.745	3881.818
214.110	3681.818
217.415	2609.091
217.888	3300.000
217.940	2718.182
225.902	3381.818
229.118	3300.000
240.241	4500.000
241.400	3490.909
241.436	3090.909
241.445	2990.909
249.992	3090.909
255.892	2890.909
258.564	2909.091
262.772	3700.000
264.324	4281.818
264.333	4181.818
265.954	3990.909
265.982	3681.818
271.829	4081.818
271.854	3800.000
271.908	3190.909
280.403	3881.818
281.569	2800.000
283.610	3900.000
283.736	2481.818
284.315	1990.909
288.495	3081.818
292.747	3381.818
293.166	4681.818
305.125	2500.000
540.248	4537.501
540.281	4346.591
540.354	3928.406
540.386	3746.586
540.423	3537.494
540.527	2946.580
570.788	4454.295
571.020	3136.103
571.055	2936.101
571.895	4145.154
571.948	3845.152
571.964	3754.242
572.034	3354.238
572.122	2854.234
600.459	3334.765
600.562	2743.851
601.473	3552.900
601.494	3434.718
601.562	3043.805
629.913	3442.517
629.934	3324.334
630.722	4833.389
630.915	3733.380
631.864	4324.246
632.071	3142.418
632.106	2942.417
632.127	2824.234
632.141	2742.415
632.162	2624.233
632.896	4442.381
660.473	3250.219
661.250	4822.910]; 
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(38.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'PresNils1995';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males at Svalbard'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '7G4SC'; % Cat of Life
metaData.links.id_ITIS = '622025'; % ITIS
metaData.links.id_EoL = '46559217'; % Ency of Life
metaData.links.id_Wiki = 'Vulpes_lagopus'; % Wikipedia
metaData.links.id_ADW = 'Vulpes_lagopus'; % ADW
metaData.links.id_Taxo = '112284'; % Taxonomicon
metaData.links.id_WoRMS = '404130'; % WoRMS
metaData.links.id_MSW3 = '14000873'; % MSW3
metaData.links.id_AnAge = 'Vulpes_lagopus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Arctic_fox}}';
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
bibkey = 'PresNils1995'; type = 'Article'; bib = [ ... 
'author = {P. Prestrud and K. Nilssen}, ' ... 
'year = {1995}, ' ...
'title = {GROWTH, SIZE, AND SEXUAL DIMORPHISM IN ARCTIC FOXES}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {76}, ' ...
'pages = {522-530}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Vulpes_lagopus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Vulpes_lagopus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

