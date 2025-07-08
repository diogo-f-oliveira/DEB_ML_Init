function [data, auxData, metaData, txtData, weights] = mydata_Lycoteuthis_lorigera
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Lycoteuthidae';
metaData.species    = 'Lycoteuthis_lorigera'; 
metaData.species_en = 'Crowned firefly squid '; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW','MIS','MAS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 31];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 550;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'sealifebase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'HoviLipi2007';
data.Li  = 11;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'HoviLipi2007';
  comment.Li = 'assumed death at 320 d';
data.Lim = 19; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'HoviLipi2007';
  comment.Lim = 'assumed death at 500 d';

data.Wwb = 1e-3; units.Wwb = 'g'; label.Wwb  = 'weight at birth'; bibkey.Wwb  = 'HoviLapt2014';
  comment.Wwb = 'HoviLapt2014 write 0.67-0.97 g, but given the egg size of 1.2-1.5 mm, they probably mean mg rather than g';

data.Ni  = 2500; units.Ni  = '#';      label.Ni  = 'cum reprod at death';  bibkey.Ni  = 'HoviLapt2014';   
  temp.Ni = C2K(18); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
comment.Ni = 'between 1000 and 4000 eggs per spawn, assumed death at 320 d';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
132.362	3.594
140.732	4.092
145.441	4.448
148.580	4.257
151.719	4.019
152.765	4.755
152.766	4.613
153.288	4.185
154.335	4.969
155.904	4.280
156.951	4.470
156.952	4.541
156.953	4.779
159.043	5.040
162.182	4.398
166.368	5.158
166.369	4.872
167.414	5.490
167.415	4.397
169.507	4.706
170.030	5.347
170.553	4.777
171.076	4.563
174.738	4.943
178.924	5.655
181.016	5.227
183.632	5.512
187.293	5.654
187.294	5.535
187.295	5.083
190.957	5.630
190.958	5.416
195.142	5.605
214.499	6.173
215.022	6.743
218.161	6.386
221.300	6.386
223.393	6.290
223.394	6.552
223.916	6.172
225.486	5.649
226.009	6.409
228.625	7.454
229.671	6.361
232.287	6.598
234.380	6.051
236.472	6.455
236.473	6.170
236.996	7.097
237.519	8.047
238.042	6.835
239.611	6.645
240.658	6.526
242.227	6.573
243.274	6.811
244.320	7.476
246.936	7.475
247.982	7.285
249.552	8.045
249.553	6.810
250.598	7.736
250.599	7.404
253.214	8.211
256.876	7.593
259.492	8.020
259.493	8.234
267.339	7.995
271.001	9.539
276.233	8.279
277.803	10.014
278.849	8.588
280.419	9.229
285.127	10.203
285.128	10.440
286.697	9.086
289.310	8.824
289.311	9.466
289.312	9.727
289.313	9.893
292.451	9.822
296.637	9.156
296.638	9.821
300.822	9.916
303.961	9.392
306.054	9.939
307.100	10.129
311.286	10.247
312.332	9.463
314.948	10.508
315.471	11.007
315.472	10.223];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HoviLipi2007';
comment.tL_f = 'data for females'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
176.308	5.323
195.665	5.795
209.791	5.461
223.393	6.837
231.764	6.836
231.765	6.337
236.996	6.598
258.969	7.046
287.220	8.230];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HoviLipi2007';
comment.tL_m = 'data for males'; 

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
129.764	0.571
139.586	0.712
144.239	0.947
147.341	0.924
148.375	0.830
150.443	0.690
152.511	1.065
154.579	1.065
155.096	0.995
155.097	1.135
157.164	0.878
157.681	1.253
157.682	1.276
161.817	0.925
165.436	0.972
165.953	1.417
166.987	1.581
166.988	1.019
168.021	1.207
168.538	1.160
169.055	1.488
170.089	1.066
171.123	1.207
171.640	1.254
173.708	1.348
177.843	1.887
180.945	1.536
183.013	1.934
185.598	1.911
187.666	1.348
188.700	1.911
189.217	2.263
189.734	1.630
191.285	1.911
215.066	2.991
215.067	2.499
215.583	2.686
221.270	2.640
221.787	2.851
222.821	2.546
224.889	2.288
225.406	2.804
225.923	2.406
229.025	4.234
229.542	2.898
232.127	2.523
234.712	1.984
235.229	2.406
237.297	2.149
237.814	4.563
237.815	3.742
238.331	3.016
238.848	3.368
240.399	2.735
241.433	3.555
242.467	3.485
243.501	2.946
244.535	4.493
247.120	3.626
247.637	4.071
247.638	3.368
248.154	3.415
248.155	3.110
250.222	5.150
250.223	4.775
250.739	4.048
251.256	3.439
252.290	4.962
257.976	3.978
259.527	5.291
259.528	4.752
267.282	4.565
270.384	8.081
275.037	5.643
276.588	7.893
277.622	6.300
281.241	6.839
284.860	9.277
284.861	9.582
286.411	7.496
289.512	7.004
289.513	7.332
289.514	7.543
290.547	5.644
292.097	7.238
295.716	8.223
300.369	7.544
304.505	6.489
305.022	8.786
306.573	8.411
307.090	7.169
309.675	9.466
311.743	6.701
314.328	10.451
315.362	8.060
316.396	9.045];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(18);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'HoviLipi2007';
comment.tWw_f = 'data for females'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
175.775	1.605
194.387	2.263
210.931	1.795
224.889	3.038
232.644	3.297
233.161	2.781
235.746	2.781
259.527	3.627
287.962	4.777];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};
temp.tWw_m    = C2K(18);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'HoviLipi2007';
comment.tWw_m = 'data for males'; 

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
2.513	0.500
2.719	1.310
2.800	1.310
2.925	1.310
3.048	0.000
3.337	1.310
3.378	1.965
3.543	3.275
3.666	1.965
3.830	0.655
3.914	3.275
4.202	2.620
4.202	3.275
4.367	4.585
4.656	6.550
4.821	7.205
5.067	4.585
5.193	10.480
5.315	7.205
5.439	9.170
5.604	9.825
5.646	12.445
5.771	15.721
5.811	12.445
5.977	16.376
6.099	11.135
6.265	15.066
6.387	10.480
6.388	15.721
6.470	11.790
6.552	13.100
6.636	18.996
6.758	11.790
6.802	20.961
6.883	17.031
6.966	18.996
7.048	17.686
7.171	17.686
7.212	13.755
7.214	23.581
7.255	22.271
7.502	22.271
7.504	28.166
7.585	23.581
7.914	22.926
7.916	29.476
7.997	26.201
8.079	21.616
8.163	29.476
8.327	25.546
8.369	30.786
8.453	36.681
8.494	35.371
8.781	31.441
9.156	43.886
9.198	47.162
9.237	39.956
9.320	43.231
9.442	38.646
9.567	43.231
9.733	45.852
9.857	48.472
9.896	41.266
9.899	51.092
10.103	43.886
10.105	51.092
10.148	58.297
10.269	48.472
10.350	45.852
10.393	51.092
10.436	55.677
10.519	60.917
10.763	49.127];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'HoviLipi2007';
comment.LWw_f = 'data for formaline-preserved females'; 
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
13.614	81.223
14.659	137.555
15.619	183.406
16.038	210.262
16.457	237.118
16.522	171.616
16.642	157.860
16.824	222.707
17.259	155.240
17.472	181.441
17.515	188.646
17.520	208.952
17.547	154.585
17.571	243.668
17.572	247.598
17.608	226.638
17.648	222.707
17.763	192.576
17.768	210.262
17.811	217.467
18.020	226.638
18.090	184.716
18.140	213.537
18.601	243.013
18.634	214.847
18.635	216.812
19.431	265.284];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'HoviLipi2007';
comment.LWw_m = 'data for formaline-preserved males'; 

%% set weights for all real data
weights = setweights(data, []);
% weights.tWw_f = 3 * weights.tWw_f; 
% weights.tWw_m = 3 * weights.tWw_m; 
% weights.Li = 10 * weights.Li; 
% weights.Lim = 10 * weights.Lim; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LWw_f','LWw_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures were guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WNNJ'; % Cat of Life
metaData.links.id_ITIS = '556521'; % ITIS
metaData.links.id_EoL = '490702'; % Ency of Life
metaData.links.id_Wiki = 'Lycoteuthis_lorigera'; % Wikipedia
metaData.links.id_ADW = 'Lycoteuthis_lorigera'; % ADW
metaData.links.id_Taxo = '158060'; % Taxonomicon
metaData.links.id_WoRMS = '342361'; % WoRMS
metaData.links.id_molluscabase = '342361'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lycoteuthis_lorigera}}';
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
bibkey = 'HoviLipi2007'; type = 'article'; bib = [ ... 
'doi = {10.1007/s11160-006-9031-9}, ' ...
'author = {H. J. T. Hoving and M. R. Lipinski and M. A. C. Roeleveld and M. D. Durholtz}, ' ... 
'year = {2007}, ' ...
'title = {Growth and mating of southern African \emph{Lycoteuthis lorigera} ({S}teenstrup, 1875) ({C}ephalopoda; {L}ycoteuthidae)}, ' ...
'journal = {Rev Fish Biol Fisheries}, ' ...
'volume = {17}, ' ...
'pages = {259-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HoviLapt2014'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10750-013-1586-6}, ' ...
'author = {H. J. T. Hoving and V. V. Laptikhovsky and M. R. Lipinski and E. J\"{u}rgens}, ' ... 
'year = {2014}, ' ...
'title = {Fecundity, oogenesis, and ovulation pattern of southern {A}frican \emph{Lycoteuthis lorigera} ({S}teenstrup, 1875)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {725}, ' ...
'pages = {23-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Lycoteuthis-lorigera.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

