function [data, auxData, metaData, txtData, weights] = mydata_Sthenoteuthis_pteropus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Sthenoteuthis_pteropus'; 
metaData.species_en = 'Orangeback flying squid'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'ArkhMikh1992';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23.5;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'ArkhMikh1992';
  comment.Lp = '195 to 330 mm';
data.Lpm  = 11.5;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male'; bibkey.Lpm  = 'ArkhMikh1992';
  comment.Lpm = '142 to 250 mm';
data.Li  = 55; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'ArkhMikh1992';
data.Lim = 20.5; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'ArkhMikh1992';

data.Wwb  = 2.7e-4; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'Wiki';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';

data.Ni  = 1e6; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'Wiki';   
  temp.Ni = C2K(26); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length 
data.tL_f = [ ... % time since birth (d), mantle length (cm)
14.846	0.162
19.636	0.174
22.032	0.053
24.902	0.566
27.776	0.573
29.692	0.577
32.564	0.710
36.396	0.720
41.174	2.247
44.523	2.760
47.876	2.769
50.265	3.532
51.229	2.777
54.097	3.542
59.357	4.691
60.325	3.430
72.238	11.164
74.670	6.623
84.697	10.563
88.527	10.825
92.356	11.213
95.247	9.073
98.591	10.218
101.934	11.489
106.709	13.395
109.589	12.644
112.955	11.010
118.224	11.023
122.518	13.055
129.198	16.355
139.249	17.390
143.568	16.390
144.505	19.045
147.352	22.336
147.372	19.936
153.148	16.413
154.560	19.574
158.376	21.478
160.798	18.200
161.733	20.981
162.216	20.477
165.080	21.747
169.842	25.296
169.846	24.790
169.864	22.517
170.844	19.740
180.409	21.658
193.809	23.206
197.632	24.352
201.461	24.741
220.599	27.440
294.259	40.755
339.653	54.760];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhMikh1992';
comment.tL_f = 'Data for females, autumn group)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
64.616	5.967
67.924	11.533
68.429	8.250
72.261	8.259
77.518	9.788
79.920	8.909
80.888	7.649
85.181	9.933
89.508	7.922
108.622	13.779
111.485	15.049
117.238	14.431
121.081	13.051
121.097	11.157
129.238	11.303
134.023	11.946
142.627	14.240
144.533	15.508
148.832	17.034
149.806	15.016
150.795	11.102
152.201	15.021
155.093	12.755
161.767	16.813
163.707	13.786
163.723	11.765
166.110	12.781
167.996	16.575
169.438	15.947
169.886	19.738
170.850	18.982
173.260	17.093
174.235	15.075
175.172	17.603
175.180	16.593
176.604	18.238
177.568	17.483
182.343	19.389
186.677	16.494
190.494	18.398
191.954	15.497
200.544	19.560
204.867	18.054
205.308	22.855
283.880	20.898
290.112	20.282
309.282	18.939];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhMikh1992';
comment.tL_m = 'Data for males, autumn group)'; 

%length-weight
data.LWw = [ ... % mantle length (cm), wet weight (g)
0.320	0.010
0.354	0.012
0.392	0.012
0.397	0.018
0.418	0.015
0.423	0.018
0.434	0.019
0.457	0.022
0.512	0.024
0.582	0.034
0.598	0.041
0.654	0.051
0.762	0.075
0.866	0.091
0.866	0.100
6.189	7.191
7.792	15.266
8.198	14.188
9.196	18.084
9.319	24.212
9.562	28.702
9.804	21.961
10.187	24.200
10.321	30.120
11.004	37.479
11.142	34.002
11.581	42.314
11.877	39.331
12.188	48.949
12.667	59.452
12.836	79.597
12.991	52.637
13.686	103.979
14.028	68.756
14.215	92.054
14.587	111.812
14.765	83.503
15.744	114.519
15.749	135.775
15.755	164.940
17.226	186.182
17.883	126.136
17.907	261.659
18.828	172.999
19.319	205.082
20.856	231.510
20.872	350.062
21.132	288.144
22.797	225.841
23.105	325.253
23.115	414.815
23.395	287.989
24.962	555.187
25.288	642.376
25.594	435.259
26.949	642.160
26.966	902.671
28.366	779.889
28.737	902.368
30.255	1237.626
31.025	1043.730
31.817	924.088
33.079	1363.447
34.821	1738.418
35.697	1266.990
37.096	1465.769
37.584	1780.502
37.598	2162.961
39.557	2059.707
40.591	2501.804
42.712	2562.712
53.775	5309.736];
units.LWw   = {'cm','g'};  label.LWw = {'mantle length','wet weight'};  
bibkey.LWw = 'ArkhMikh1992';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 8 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '52HL4'; % Cat of Life
metaData.links.id_ITIS = '82530'; % ITIS
metaData.links.id_EoL = '453374'; % Ency of Life
metaData.links.id_Wiki = 'Sthenoteuthis_pteropus'; % Wikipedia
metaData.links.id_ADW = 'Sthenoteuthis_pteropus'; % ADW
metaData.links.id_Taxo = '158100'; % Taxonomicon
metaData.links.id_WoRMS = '140623'; % WoRMS
metaData.links.id_molluscabase = '140623'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sthenoteuthis_pteropus}}';
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
bibkey = 'ArkhMikh1992'; type = 'Article'; bib = [ ... 
'author = {Alexander Arkhipkin and Alexander Mikheev}, ' ... 
'year = {1992}, ' ...
'title = {Age and growth of the squid emph{Sthenoteuthis pteropus} ({O}egopsida: {O}mmastrephidae) from the {C}entral-{E}ast {A}tlantic}, ' ...
'journal = {J. Exp. Mar. BioL EcoL}, ' ...
'volume = {163}, ' ...
'pages = {261-276}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Sthenoteuthis-pteropus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

