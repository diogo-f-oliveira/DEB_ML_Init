function [data, auxData, metaData, txtData, weights] = mydata_Ommastrephes_bartramii

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Ommastrephes_bartramii'; 
metaData.species_en = 'Neon flying squid'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 28];              
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

data.am = 365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'YatsMido1997';   
  temp.am = C2K(10.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'YatsMido1997';
  comment.Lp = 'base on tL_f data for tp';
data.Lpm  = 31.5;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male'; bibkey.Lpm  = 'YatsMido1997';
  comment.Lp = 'base on tL_m data for tp';
data.Li  = 90; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'sealifebase';
data.Lim = 45; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'sealifebase';

data.Wwb  = 5.1e-4; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'VijaSakai2014';
  comment.Wwb = 'based on on egg diameter of 0.99 mm: pi/6*0.099^3';

data.Ni  = 4e6; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'VijaSakai2014';   
  temp.Ni = C2K(10.4); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '3.7e6 to 4.9e6';
  
% uni-variate data
% time-length data
data.tL_f = [ ... % % time since august 1 (d), growth increment (mm)
103.417	19.709
105.658	18.430
107.686	19.963
109.479	18.940
114.417	18.172
114.420	18.853
116.211	17.490
118.235	18.171
119.821	21.151
120.931	18.170
120.936	19.362
122.508	19.276
122.992	26.942
126.321	18.083
126.330	20.042
126.999	18.934
127.005	20.382
127.675	19.360
129.482	21.659
130.824	20.296
132.170	19.955
132.625	21.317
132.841	19.358
133.292	19.699
134.413	19.357
134.634	18.506
135.315	20.039
136.210	19.272
137.106	18.846
138.235	20.123
138.464	21.145
138.903	18.845
138.907	19.697
139.356	19.697
139.808	20.293
140.249	18.419
140.491	22.252
142.054	20.207
142.503	20.036
142.519	23.614
142.522	24.295
143.869	24.295
146.561	23.442
148.807	23.441
150.150	22.419
150.344	15.519
150.365	20.204
151.508	24.548
152.397	22.503
153.503	18.670
154.193	22.247
154.416	21.906
154.654	24.972
154.916	33.235
156.002	24.972
157.102	19.776
162.284	23.351
167.223	22.839
167.685	25.564
169.482	25.649
169.511	32.037
170.599	24.371
177.376	32.971
178.036	29.734
184.566	33.480
187.499	36.290
190.865	35.522
192.266	47.362
196.445	27.599
198.276	35.179
198.515	38.501
199.621	34.667
202.314	34.155
203.222	36.199
204.114	34.751
205.937	40.457
206.163	40.883
207.068	42.331
207.962	41.309
208.829	34.409
209.997	44.289
210.372	27.764
210.843	32.619
210.851	34.493
210.857	35.856
215.840	44.969
216.005	31.595
217.587	33.810
218.047	36.194
218.964	40.453
221.658	39.941
221.896	43.007
223.451	39.259
225.696	38.918
229.048	35.083
229.311	43.686
233.796	41.981
237.625	44.365
238.516	42.661
240.085	41.979
243.471	45.641
244.138	44.022
248.175	42.658
249.973	42.998
250.189	40.953
251.537	41.038
258.711	38.140
264.115	41.034
264.137	45.804
265.244	42.311
275.350	41.882
275.840	50.911
279.830	39.240
284.579	46.223
290.612	39.151
293.319	41.876
305.464	45.364];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(10.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YatsMido1997';
comment.tL_f = 'Data for females'; 
%
data.tL_m = [ ... % time since august 1 (d), growth increment (mm)
100.130	16.215
101.256	16.299
102.848	17.333
104.900	18.883
107.621	20.174
109.115	15.767
111.619	17.490
112.805	20.942
113.430	18.178
113.453	19.473
115.461	18.606
118.609	18.601
119.333	21.363
122.880	18.593
123.584	20.233
124.942	20.749
124.952	21.267
126.241	17.983
126.474	18.414
126.486	19.105
127.152	18.586
127.159	19.018
128.031	17.462
128.085	20.484
128.294	19.620
128.947	18.410
128.962	19.274
128.984	20.483
129.003	21.519
131.646	18.492
132.555	19.008
133.304	23.152
134.377	20.301
134.566	18.314
134.578	19.005
135.498	20.126
136.127	17.621
136.364	18.311
137.515	19.777
139.102	20.552
139.355	22.106
139.489	29.532
140.656	19.426
140.662	19.772
142.030	20.806
142.461	19.769
142.465	20.028
144.267	20.197
144.276	20.715
145.149	19.246
145.192	21.664
146.106	22.439
146.518	20.366
146.526	20.798
147.033	23.992
149.445	20.620
150.177	23.814
151.064	23.122
156.008	23.027
156.227	22.681
156.664	21.989
159.714	29.065
162.979	23.101
163.612	33.290
163.730	27.331
166.370	24.131
168.519	31.122
169.502	23.262
173.597	25.932
173.620	27.228
174.995	28.693
175.170	25.930
178.992	25.923
179.364	34.126
180.085	24.194
182.600	26.521
192.478	25.727
195.672	28.312
200.498	34.176
203.757	27.866
206.471	28.725
209.017	32.780
308.648	34.766];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YatsMido1997';
comment.tL_m = 'Data for males'; 

% length-weight
data.LW = [ ... % masntle length (cm), wet weight (g)
19.429	132.272
20.466	237.532
20.904	202.617
21.450	272.758
21.777	307.840
24.788	273.488
25.276	413.639
25.603	457.474
26.095	492.593
26.262	396.349
26.588	475.195
26.970	519.042
27.568	659.217
27.843	598.008
28.013	396.732
28.060	659.325
28.609	598.176
28.716	694.479
28.719	563.189
28.824	747.019
28.931	817.065
28.933	773.301
28.935	677.022
28.937	607.000
29.425	773.409
29.427	694.635
29.645	720.941
29.753	790.986
29.974	703.507
29.976	650.991
29.977	607.228
30.027	764.788
30.188	896.114
30.247	738.578
30.956	800.002
31.062	948.822
31.504	800.122
31.555	913.919
31.996	817.735
32.155	1010.330
32.480	1106.682
32.754	1097.989
32.812	984.216
33.516	1255.705
33.905	1045.724
33.906	1010.713
34.012	1115.769
34.396	1080.843
34.824	1439.798
34.841	818.358
34.890	1045.940
34.991	1326.049
35.382	1046.047
35.542	1186.126
35.922	1326.253
36.796	1361.455
44.921	2413.561
48.687	2755.742];
units.LW   = {'cm', 'g'};  label.LW = {'mantle length','weight'};  
bibkey.LW = 'AneePrav2014';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 10 * weights.Li;

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
D2 = 'Reproductive output is assumed to correspond to death at 365 d';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'typically lives for 1 yr; Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'preferred temperature 10.4 C';
metaData.bibkey.F2 = 'seabaselife'; 
F3 = 'Spawns twice';
metaData.bibkey.F2 = 'VijaSakai2014'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6SM23'; % Cat of Life
metaData.links.id_ITIS = '82527'; % ITIS
metaData.links.id_EoL = '453373'; % Ency of Life
metaData.links.id_Wiki = 'Ommastrephes_bartramii'; % Wikipedia
metaData.links.id_ADW = 'Ommastrephes_bartramii'; % ADW
metaData.links.id_Taxo = '158110'; % Taxonomicon
metaData.links.id_WoRMS = '181382'; % WoRMS
metaData.links.id_molluscabase = '181382'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ommastrephes_bartramii}}';
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
bibkey = 'YatsMido1997'; type = 'Article'; bib = [ ... 
'author = {Akihiko Yatsu and Satoshi Midorikawa and Takahiro Shimada and Yuji Uozumi}, ' ... 
'year = {1997}, ' ...
'title = {Age and growth of the neon flying squid, \emph{Ommastrephes bartrami}, in the {N}orth {P}acific {O}cean}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {29}, ' ...
'pages = {257-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AneePrav2014'; type = 'Article'; bib = [ ... 
'author = {Aneesh, Kumar K. V. and Pravin, P. and Ragesh,  N. and Meenakumari, B.}, ' ... 
'year = {2014}, ' ...
'title = {Length-weight relationship of neon flying squid \emph{Ommastrephes bartramii} ({C}ephalopoda: {O}mmastrephidae) caught from {I}ndian sector of {S}outhern {O}cean}, ' ...
'journal = {Indian Journal of Geo-Marine Science}, ' ...
'volume = {43}, ' ...
'pages = {1581-1584}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VijaSakai2014'; type = 'Article'; bib = [ ... 
'doi = {10.3989/scimar.04112.27B}, ' ...
'author = {Dharmamony Vijai and Mitsuo Sakai and Yoshihiko Kamei and Yasunori Sakurai}, ' ... 
'year = {2014}, ' ...
'title = {Spawning pattern of the neon flying squid \emph{Ommastrephes bartramii} ({C}ephalopoda: {O}egopsida) around the {H}awaiian {I}slands}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {78}, ' ...
'pages = {511-519}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Ommastrephes-bartramii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

