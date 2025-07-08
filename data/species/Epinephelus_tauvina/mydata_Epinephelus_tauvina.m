function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_tauvina

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_tauvina'; 
metaData.species_en = 'Greasy grouper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 29];

%% set data
% zero-variate data

data.ab = 7.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(26.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(26.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 61.1;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 100;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 3232;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01202*Lp^3.04, see F1';
data.Wwi = 14451;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.04, see F1';

data.GSI = 0.045; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'SayeBarr1999';
  temp.GSI = C2K(26.2); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
1	24.056  163.913
2	31.843  464.407
3	36.398  653.616
4	40.948  954.287
5	46.939 1338.022
6	51.846 1805.265
7	56.395 2411.304
8	60.945 3128.536
9	66.936 4067.895
10	71.483 5035.118
11	74.592 5752.263
12	77.342 6441.542];
data.tLW(:,1) = (0.95+data.tLW(:,1)) * 365;
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(26.2);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'SayeOsma2007'; treat.tLW = {1 {'total length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
25.039	161.770
25.867	356.159
27.711	278.967
28.942	279.286
29.356	357.063
30.383	396.164
30.798	512.776
32.025	396.589
32.643	474.419
33.677	668.861
34.493	552.567
34.908	669.180
35.519	552.833
36.551	708.440
37.996	941.824
39.216	631.460
39.837	786.961
40.054	1097.697
40.454	825.955
41.486	981.562
41.718	1680.652
42.103	1020.557
43.125	904.317
43.339	1137.382
44.163	1215.265
44.173	1487.112
44.978	1060.136
45.408	1565.102
46.422	1254.685
46.471	2536.251
47.058	1798.539
47.250	1449.074
47.665	1565.686
49.091	1294.211
49.309	1643.782
49.495	1138.976
50.138	1838.171
50.557	2071.289
50.943	1450.030
51.770	1605.584
51.779	1838.596
52.203	2188.220
53.211	1722.462
53.419	1800.186
53.854	2421.658
54.045	2072.193
55.062	1839.446
55.080	2305.470
55.477	1956.058
56.123	2732.925
56.136	3082.443
56.315	2383.460
56.359	3548.520
57.537	2150.766
57.973	2811.073
58.579	2578.221
58.771	2228.756
58.807	3160.804
59.614	2811.498
59.637	3394.029
60.017	2617.428
60.444	3044.723
61.476	3200.330
61.489	3549.848
61.663	2734.359
62.484	2734.572
62.490	2889.913
62.512	3472.443
62.533	4016.138
62.649	1686.071
63.317	3045.467
63.553	3861.062
63.729	3084.408
63.943	3317.474
64.570	3628.316
64.752	3007.003
64.767	3395.357
64.785	3861.381
64.791	4016.722
64.808	4482.746
66.005	3589.852
66.029	4211.218
66.834	3784.241
66.843	4017.253
67.033	3628.953
67.081	4871.684
67.466	4211.589
67.845	3396.154
67.866	3939.848
68.508	4639.044
68.535	5338.080
68.694	4134.238
68.911	4444.973
68.929	4910.997
69.324	4522.750
69.561	5338.346
70.364	4872.534
70.536	4018.210
70.767	4678.464
70.771	4794.970
70.786	5183.323
71.011	5688.235
71.571	4251.487
72.046	5921.513
72.200	4601.165
72.428	5183.748
72.621	4873.118
72.645	5494.484
73.253	5300.466
73.284	6116.009
73.293	6349.021
73.472	5650.038
73.653	5028.725
73.684	5844.267
74.448	4368.737
74.672	4834.814
74.685	5184.332
74.904	5533.903
75.155	6737.852
75.319	5650.516
75.341	6233.046
75.945	5922.522
76.178	6660.447
76.223	7825.507
76.578	6388.706
76.595	6815.895
76.749	5495.546
77.385	6039.400
77.606	6427.807
77.627	6971.502
77.985	5612.371
78.023	6622.090
78.055	7437.632
78.077	8020.162
78.257	7360.014
78.410	6000.831
78.856	6932.985
78.865	7165.997
79.032	6156.331
79.270	7010.762
79.452	6428.285
79.647	6156.491
79.667	6661.350
79.915	7787.628
80.489	6700.398
80.679	6312.098
80.715	7244.146
80.748	8098.523
81.172	8448.148
81.335	7360.811
81.936	6972.617
82.369	7555.254
82.751	6817.488
83.234	8720.526
83.380	7167.166
84.202	7206.214
84.223	7749.908
84.617	7322.826
84.832	7594.726
85.063	8254.980
87.188	10158.443
87.657	11673.128
90.824	8644.821
91.159	12023.549
91.927	10664.524
94.625	11441.922
95.452	11597.476
97.625	14743.669];    
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'SayeOsma2007'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5QS'; % Cat of Life
metaData.links.id_ITIS = '167708'; % ITIS
metaData.links.id_EoL = '46579626'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_tauvina'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_tauvina'; % ADW
metaData.links.id_Taxo = '105889'; % Taxonomicon
metaData.links.id_WoRMS = '218205'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-tauvina'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_tauvina}}';
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
bibkey = 'SayeOsma2007'; type = 'article'; bib = [ ... 
'author = {Abdel Fattah Mohamed El-Sayed and Amany Mohamed Ahmed Osman and Medhat Abdel Barr}, ' ... 
'year = {2007}, ' ...
'title = {AGE AND GROWTH OF \emph{Epinephelus tauvina} ({T}ELEOSTEI; {S}ERRANIDAE) IN {A}RABIAN {G}ULF, {Q}ATAR}, ' ...
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {33(1)}, '...
'pages = {352-361}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SayeBarr1999'; type = 'article'; bib = [ ... 
'author = {Abdel Fattah Mohamed El-Sayed and Medhat Abdel Barr}, ' ... 
'year = {1999}, ' ...
'title = {Reproductive biology of grouper fish \emph{Epinephelus tauvina} (family {S}erranidae in the {A}rabian {G{ulf waters}, ' ...
'journal = {Indian Journal of Marine Sciences}, ' ...
'volume = {28}, '...
'pages = {89-91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-tauvina.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

