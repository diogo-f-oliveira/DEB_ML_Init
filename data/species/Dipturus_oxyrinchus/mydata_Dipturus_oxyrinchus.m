function [data, auxData, metaData, txtData, weights] = mydata_Dipturus_oxyrinchus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dipturus_oxyrinchus'; 
metaData.species_en = 'Longnose skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 15*30.5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(10.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'KadrMaro2015';   
  temp.am = C2K(10.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 16;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'KadrMaro2015';
data.Lp  = 82;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'KadrMaro2015';
data.Lpm  = 72;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'KadrMaro2015';
data.Li  = 150; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'LicaCern2007';

data.Ri  = 30/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.077	16.450
0.941	25.041
1.947	29.698
2.881	35.279
4.031	41.097
5.002	45.985
5.972	52.030
6.979	59.003
8.058	64.588
8.957	70.632
9.999	75.058
11.040	79.020
12.082	83.678
13.053	88.102
14.023	91.599
14.957	95.791
15.999	99.058
17.147	100.011
18.116	100.960
19.086	102.373
20.055	103.785
21.060	104.040
22.065	103.832
23.070	104.782
24.039	105.731
25.079	105.755];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(10.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KadrMaro2015';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.040	15.059
1.012	24.579
2.127	34.103
3.135	42.698
4.034	49.437
5.112	55.485
6.011	60.603
7.053	65.492
8.203	71.310
9.101	75.269
10.107	78.767
11.113	82.265
12.119	85.068
13.088	86.017
14.309	88.131
15.063	90.001
16.212	92.345
17.038	93.985
18.114	94.705
19.155	94.961
20.052	94.982
21.201	95.240
22.134	96.188];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(10.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KadrMaro2015';
comment.tL_m = 'data for males';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
16.432	50.479
24.026	63.785
26.234	135.086
32.310	136.282
34.518	183.960
37.971	172.829
39.075	184.857
41.007	232.482
42.941	197.430
44.459	268.594
45.980	186.216
49.015	293.113
50.258	305.169
51.223	352.603
52.188	423.659
52.466	352.848
53.430	459.337
53.843	530.284
55.503	412.501
55.634	719.613
56.742	542.666
57.152	767.156
57.424	920.753
57.981	708.264
58.259	625.642
59.637	791.267
60.054	637.806
61.158	685.267
61.705	897.973
63.090	744.703
64.189	969.329
64.469	804.029
66.122	1016.953
66.540	828.059
67.498	1194.389
68.195	946.495
69.288	1419.151
69.708	1194.824
70.816	1065.121
71.085	1348.639
71.358	1514.046
72.458	1691.429
72.879	1419.858
73.435	1230.991
74.390	1774.486
74.394	1573.700
75.505	1314.076
76.053	1514.971
76.470	1396.943
76.595	1928.464
76.598	1810.354
77.836	2011.385
78.672	1680.841
78.814	1539.136
80.051	1763.789
80.177	2330.743
80.182	2082.713
81.566	1941.253
82.521	2449.315
82.656	2602.885
82.665	2189.501
84.031	2862.998
84.186	2130.745
84.871	2367.100
85.282	2497.102
85.691	2721.593
85.976	2355.507
86.095	3158.680
86.939	2509.240
87.079	2426.590
89.000	2970.275
91.074	2840.762
91.616	3266.066
91.895	3183.444
92.993	3455.313
93.696	2888.523
93.956	3632.668
94.932	3219.475
95.480	3396.748
95.883	3881.079
95.889	3621.238
97.536	4046.759
97.672	4164.896
97.679	3846.000
97.822	3621.618
97.958	3716.133
98.218	4413.035
98.383	3267.398
99.596	4566.849
100.298	4059.113
100.710	4153.683
102.774	4461.176
103.036	5099.023
103.999	5264.566
105.379	5288.460];
units.LWw_f = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f = 'KadrMaro2015';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
15.051	26.585
32.034	112.605
34.656	183.987
36.452	148.908
38.799	184.803
41.421	244.374
45.011	280.514
45.974	410.625
47.492	458.168
49.015	316.735
49.701	505.846
52.050	423.632
53.424	707.367
53.843	530.284
54.814	353.310
55.768	873.182
56.604	566.261
57.295	519.153
57.429	696.345
58.118	767.346
59.224	732.130
59.771	968.459
61.846	791.702
63.359	1040.031
64.054	851.192
65.571	922.357
66.402	816.221
67.359	1241.606
68.193	1029.172
69.844	1289.339
70.124	1100.418
73.153	1514.400
73.297	1254.586
74.814	1337.561
76.461	1751.272
77.295	1515.215
77.974	2035.034
77.981	1704.327
78.242	2377.607
78.530	1857.978
78.674	1609.975
79.350	2247.903
80.591	2319.014
81.979	2024.012
82.532	1988.687
82.803	2224.961
84.732	2390.695
86.117	2201.992
86.245	2639.024
87.760	2828.299
88.045	2462.213
88.590	2781.218
90.105	2923.249
90.117	2415.377
92.319	2722.897
93.421	2853.035
95.355	2841.605];
units.LWw_m = {'cm', 'g'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m = 'KadrMaro2015';
comment.LWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00282 *(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '36R4F'; % Cat of Life
metaData.links.id_ITIS = '564148'; % ITIS
metaData.links.id_EoL = '46560471'; % Ency of Life
metaData.links.id_Wiki = 'Dipturus_oxyrinchus'; % Wikipedia
metaData.links.id_ADW = 'Dipturus_oxyrinchus'; % ADW
metaData.links.id_Taxo = '108259'; % Taxonomicon
metaData.links.id_WoRMS = '105872'; % WoRMS
metaData.links.id_fishbase = 'Dipturus-oxyrinchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipturus_oxyrinchus}}'; 
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
bibkey = 'KadrMaro2015'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315414000551}, ' ...
'author = {Hasna Kadri and Sondes Marouani and Mahamed Nejmeddine Bradai and Abderrahmen Boua\"{i}n and Eric Morize}, ' ...
'year = {2015}, ' ...
'title  = {Age, growth, longevity, mortality and reproductive biology of \emph{Dipturus oxyrinchus}, ({C}hondrichthyes: {R}ajidae) off the {G}ulf of {G}ab\`{e}s ({S}outhern {T}unisia, central {M}editerranean)}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {95(3)}, ' ...
'pages = {569-577}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Dipturus-oxyrinchus.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

