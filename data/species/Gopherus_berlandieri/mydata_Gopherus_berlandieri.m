function [data, auxData, metaData, txtData, weights] = mydata_Gopherus_berlandieri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Gopherus_berlandieri'; 
metaData.species_en = 'Texas tortoise'; 

metaData.ecoCode.climate = {'BSh','BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi','0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 09];

%% set data
% zero-variate data

data.ab = 103;     units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'JuddMcQu1980';
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '88 till 118 d';
data.tp = 10*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'theturtleroom';
  temp.tp = C2K(26);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30.7*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 4;  units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'JuddMcQu1980';
data.Li = 21.9;  units.Li = 'cm';   label.Li = 'ultimate carapace length for female';   bibkey.Li = 'JuddMcQu1980';

data.Wwb = 21; units.Wwb = 'g';   label.Wwb = 'wet weigh at birth';                bibkey.Wwb = 'JuddMcQu1980';

data.Ri  = 2.5*1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'theturtleroom';   
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 eggs/clutch; 1 or 2 clutches per yr';

% uni-variate data

% time-length
data.tL = [ ... % time  since birth (yr), length of carapace (cm)
7.152	2.452
7.569	1.898
7.657	3.092
11.777	2.895
18.287	2.476
21.300	3.042
21.610	3.436
21.620	2.365
24.360	3.670
29.957	3.177
31.259	3.743
32.251	2.832
33.766	3.669
41.997	3.263
44.300	4.013
52.151	3.127
54.852	3.299
62.218	2.880
64.958	4.185
84.421	3.925
86.442	3.235
87.375	3.334
89.007	3.235
104.107	2.865
117.157	3.148
121.161	3.886
122.210	3.049
125.368	2.716
129.925	4.156
136.397	3.688
146.707	3.749
147.921	3.121
152.342	3.306
157.220	4.068
164.469	3.502
178.403	3.821
178.850	3.304
188.140	4.239
197.089	3.660
211.140	4.127
213.132	3.400
229.029	4.040
236.112	4.347
239.688	4.544
244.993	4.765
246.082	5.061
265.156	4.308
267.595	5.232
270.627	4.739
272.619	5.096
280.936	4.800
282.540	5.748
300.438	5.673
304.403	5.279
309.096	5.808
318.803	5.106
329.006	6.114
335.798	6.052
337.994	6.668
349.354	5.892
366.805	6.334
366.990	6.568
368.175	5.903
372.664	6.173
374.209	5.964
374.326	7.195
380.263	6.050
389.582	5.939
391.817	6.603
395.004	6.308
402.466	7.095
407.675	6.110];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JuddMcQu1980';
comment.tL = 'Data for 7 individuals; one slow-groing individual excluded';

% time-weight
data.tWw = [ ... % time  since birth (yr), weight (g)
3.931	17.516
5.235	24.006
7.540	20.419
14.204	30.497
15.288	21.615
17.724	19.907
23.227	25.543
23.525	29.814
24.615	33.230
26.592	37.158
28.326	25.373
33.239	34.767
37.712	37.842
38.772	28.618
50.613	27.422
51.738	31.351
55.597	37.842
65.199	28.960
72.572	36.988
83.109	29.301
83.846	39.891
85.485	26.739
95.901	41.770
99.082	38.525
111.691	36.134
129.862	40.233
134.806	37.842
146.724	25.543
151.661	35.280
163.014	27.081
174.074	26.910
179.756	35.109
180.715	36.646
191.549	33.230
210.805	28.447
213.615	44.332
225.503	43.820
237.427	43.820
237.558	45.699
246.587	53.043
254.282	41.258
271.388	42.283
275.920	46.211
278.992	65.854
289.452	44.845
298.624	54.239
299.773	58.509
300.195	76.786
302.995	68.075
308.635	63.463
308.897	67.220
320.863	55.606
327.397	63.804
330.166	66.879
330.624	85.668
333.185	73.540
338.860	93.866
344.895	70.466
347.664	73.540
363.000	85.839
366.497	74.907
371.327	83.106
374.281	76.615
386.146	75.761
390.780	68.929
395.335	97.624
399.582	73.028
401.683	115.388
408.742	82.252];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'weight'};  
temp.tWw    = C2K(29);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'JuddMcQu1980';
comment.tWw = 'Data for 7 individuals; one slow-groing individual excluded';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 3 * weights.psd.k_J; weights.psd.k_J = 0;
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '3H2LF'; % Cat of Life
metaData.links.id_ITIS = '173857'; % ITIS
metaData.links.id_EoL = '456479'; % Ency of Life
metaData.links.id_Wiki = 'Gopherus_berlandieri'; % Wikipedia
metaData.links.id_ADW = 'Gopherus_berlandieri'; % ADW
metaData.links.id_Taxo = '398392'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gopherus&species=berlandieri'; % ReptileDB
metaData.links.id_AnAge = 'Gopherus_berlandieri'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gopherus_berlandieri}}';
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
bibkey = 'JuddMcQu1980'; type = 'Article'; bib = [ ... 
'doi = {10.11609/zp.v12i1.4970}, ' ...
'author = {Frank W. Judd and J. Carlton McQueen}, ' ... 
'year = {1980}, ' ...
'title = {Incubation, Hatching, and Growth of the Tortoise, \emph{Gopherus berlandieri}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {14(4)}, ' ...
'pages = {377-380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Gopherus_berlandieri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Gopherus&species=berlandieri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'theturtleroom'; type = 'Misc'; bib = ...
'howpublished = {\url{https://theturtleroom.org/species-profiles/gopherus-berlandieri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

