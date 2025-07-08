function [data, auxData, metaData, txtData, weights] = mydata_Pomacentrus_coelestis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Pomacentrus_coelestis'; 
metaData.species_en = 'Neon damselfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};        
metaData.date_subm   = [2018 01 31];                           
metaData.email       = {'bas.kooijman@vu.nl'};                 
metaData.address     = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 31]; 


%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on P. amboinensis';
data.tj = 14;   units.tj = 'd';    label.tj = 'time since birth at puberty'; bibkey.tj = 'KingOCal2017';
  temp.tj = C2K(28.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 45;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KingOCal2017';
  temp.tp = C2K(28.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL data for Lp';
data.am = 160;   units.am = 'd';    label.am = 'life span';                  bibkey.am = 'KingOCal2017';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.26;   units.Lb  = 'cm';  label.Lb  = 'standard length at birth'; bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on P. amboinensis';
data.Lj  = 1.20;   units.Lj  = 'cm';  label.Lj  = 'standard length at metam'; bibkey.Lj  = 'KingOCal2017';  
data.Lp  = 3.10;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to P. amboinensis: 7 * 4.85/11';
data.Li  = 7.0;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'KingOCal2017';

data.Wwb = 2.9e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 2.5 mm and egg diameter (guessed) 1.5 mm of P. amboinensis: pi/6*0.25*0.15^2';
data.Wwj = 0.074;  units.Wwj = 'g';   label.Wwj = 'wet weight at puberty';   bibkey.Wwj = {'KingOCal2017', 'fishbase'};
  comment.Wwj = 'based on Wwp = 0.04394 * (Lj/ 0.8)^2.824, see F1, F2';
data.Wwp = 1.05;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwp = 0.04394 * Lp^2.824, see F1, F2';
data.Wwi = 10.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'KingOCal2017', 'fishbase'};
  comment.Wwi = 'based on Wwi = 0.04394 * Li^2.824, see F1, F2';

data.Ri  = 444*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Chromis chromis, where smaller size of P. coelestis is assumed to balance shorter life span';
  
% uni-variate data
% t-L data
data.tL1 = [ ... % time (d), standard length (cm)
13.359	1.636
14.484	1.444
16.713	1.636
17.279	1.444
18.106	1.752
18.948	1.656
20.066	1.675
20.070	1.541
21.747	1.541
22.024	1.637
23.153	1.310
24.546	1.426
24.819	1.618
35.995	1.754
37.063	3.177
42.340	4.139
42.656	3.082
44.342	2.832
47.101	3.870
47.914	4.582
49.053	4.005
49.907	3.563
50.478	3.198
51.014	3.871
51.284	4.140
53.244	4.044
54.900	4.641
55.763	3.948
56.074	3.025
56.078	2.910
56.292	4.795
56.883	3.871
56.887	3.775
57.154	4.122
57.160	3.948
57.409	4.833
58.022	3.275
58.820	4.449
59.664	4.295
60.211	4.641
60.219	4.391
60.231	4.045
60.253	3.430
61.619	4.314
62.165	4.699
62.477	3.757
64.960	4.699
66.368	4.392
66.374	4.219
66.917	4.699
68.599	4.546
68.892	4.161
71.126	4.219
71.946	4.738
71.980	3.777
73.080	4.277
74.482	4.162
75.593	4.354
78.646	4.989
80.037	5.162
82.864	4.259
84.507	5.221
84.531	4.548
85.059	5.413
85.908	5.125
86.181	5.317
89.306	3.875
90.946	4.933
94.869	4.645
95.953	5.626
96.805	5.222
96.811	5.049
100.732	4.838
102.406	4.915
107.455	4.396
123.342	5.667
126.139	5.610];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'standard length', 'Lizard Island'};  
temp.tL1    = C2K(28.5);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'KingOCal2017';
comment.tL1 = 'Data from Lizard Island';
%
data.tL2 = [ ... % time (d), standard length (cm)
10.062	1.443
11.460	1.309
12.298	1.213
13.696	1.309
13.975	1.425
15.093	1.540
16.770	1.540
16.770	1.367
18.447	1.848
19.845	1.637
20.404	1.791
21.801	1.637
22.919	1.791
25.435	1.945
25.714	1.926
27.950	2.041
29.068	1.984
29.627	2.119
31.863	2.234
32.702	2.234
36.335	2.235
36.894	2.542
38.851	2.620
44.161	2.851
45.839	2.928
63.168	3.411
66.522	3.719
67.081	4.238
74.348	5.123
74.907	4.239
75.466	4.450
77.422	5.528
81.615	6.163
81.894	4.855
83.292	5.432
83.571	5.259
84.130	4.317
84.130	4.240
84.969	5.624
84.969	6.259
89.161	4.856
89.161	4.356
89.441	5.356
90.559	6.029
90.839	5.856
91.957	3.952
92.516	4.625
93.075	4.837
93.634	4.683
94.193	5.741
95.311	4.433
96.149	5.549
96.149	5.606
96.149	5.741
96.988	4.741
97.547	4.876
98.106	4.530
100.342	5.203
100.901	5.818
102.298	5.953
103.696	4.934
103.975	5.550
104.814	5.550
105.373	6.030
106.211	5.050
106.770	5.588
108.447	6.031
108.447	6.242
111.522	4.839
112.081	4.320
115.994	4.532
119.627	6.417
121.025	4.167
124.099	6.244
126.335	6.244
130.248	4.918
142.547	6.034
154.006	6.536
159.037	6.325];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'standard length', 'One Tree Island'};  
temp.tL2    = C2K(28.5);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'KingOCal2017';
comment.tL2 = 'Data from One Tree Island';
%
data.tL3 = [ ... % time (d), standard length (cm)
15.360	2.042
18.806	1.939
22.026	1.451
22.255	1.939
23.561	2.397
24.201	2.161
28.292	1.969
30.243	2.368
31.307	1.851
32.390	2.043
34.352	2.886
36.054	2.044
40.382	2.665
43.627	3.079
44.046	2.636
45.554	2.577
46.203	2.680
46.416	2.577
47.059	2.444
48.794	2.843
49.441	2.843
50.306	2.932
51.608	3.257
53.313	2.518
53.338	3.450
54.187	2.962
55.273	3.258
67.593	4.471
69.969	4.649
73.863	5.167
77.320	5.448
79.882	4.546
80.993	5.774
86.142	4.857
86.380	5.671
94.561	5.302
95.414	4.947
95.419	5.139
97.589	5.657
101.668	5.051
102.555	5.953
103.393	5.051
105.536	4.578
105.549	5.066
106.406	4.874
107.301	6.072
107.480	4.741
107.497	5.362
108.361	5.436
109.629	4.475
113.544	5.776
114.829	5.466
115.470	5.244
118.502	5.762
119.811	6.339
120.422	5.008
120.886	6.250
122.349	4.550
130.786	5.660
132.735	5.955
133.583	5.453
137.913	6.148
138.733	4.551
151.478	5.528];
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since birth', 'standard length', 'Fitzroy Reef'};  
temp.tL3    = C2K(28.5);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'KingOCal2017';
comment.tL3 = 'Data from Fitzroy Reef';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2','tL3'}; subtitle1 = {'Data from Lizard Isl, One Tree Isl, Fitzroy reef'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Length-weight for Pomacentrus amboinensis:  (W in g) = 0.04394 * (standard length in cm)^2.824; Error in  fishbase: FL must be SL!';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Fork-Standard length: LS =  0.8 * LF, based on photo';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4LQCB'; % Cat of Life
metaData.links.id_ITIS = '615381'; % ITIS
metaData.links.id_EoL = '46572426'; % Ency of Life
metaData.links.id_Wiki = 'Pomacentrus_coelestis'; % Wikipedia
metaData.links.id_ADW = 'Pomacentrus_coelestis'; % ADW
metaData.links.id_Taxo = '184439'; % Taxonomicon
metaData.links.id_WoRMS = '277145'; % WoRMS
metaData.links.id_fishbase = 'Pomacentrus-coelestis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacentrus_coelestis}}';
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
bibkey = 'KingOCal2017'; type = 'Article'; bib = [ ... 
'author = {M. J. Kingsford and M. D. O''Callaghan and L. Liggins and G. Gerlach}, ' ... 
'year = {2017}, ' ...
'title = {The short-lived neon damsel \emph{Pomacentrus coelestis}: implications for population dynamics}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {90}, ' ...
'pages = {2041-2059}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/5715}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
