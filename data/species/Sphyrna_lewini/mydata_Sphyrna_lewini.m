function [data, auxData, metaData, txtData, weights] = mydata_Sphyrna_lewini

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Sphyrnidae';
metaData.species    = 'Sphyrna_lewini'; 
metaData.species_en = 'Scalloped hammerhead shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 11];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 305;     units.ab = 'd';      label.ab = 'age at birth';                          bibkey.ab = 'iucn';    
  temp.ab = C2K(27.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 35*365;  units.am = 'd';      label.am = 'life span';                             bibkey.am = 'AnAge';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 49;     units.Lb  = 'cm';    label.Lb  = 'fork(?) length at birth';              bibkey.Lb  = 'arkive';
  comment.Lb = 'arkive: 43-55 cm';
data.Lp  = 250;   units.Lp  = 'cm';     label.Lp  = 'fork(?) length at puberty (female)';  bibkey.Lp  = 'Wiki';
data.Lpm  = 165;  units.Lpm  = 'cm';    label.Lpm  = 'fork(?) length at puberty (male)';   bibkey.Lpm  = 'Wiki';
  % Wiki: 130-180 cm
data.Li = 241;  units.Li  = 'cm';  label.Li = 'ultimate fork length (female)';      bibkey.Li  = 'AndrPier2007';
  % Wiki: 430 cm
data.Lim  = 234;  units.Lim  = 'cm';  label.Lim  = 'ultimate fork length (male)';        bibkey.Lim  = 'AndrPier2007';

data.Wwp = 80e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty (female)';     bibkey.Wwp = 'Wiki';
data.Wwpm = 29e3; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty (male)';       bibkey.Wwpm = 'Wiki';
data.Wwi = 83820;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';       bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: Wi = 152400 for Li = 430 cm';

data.Ri  = 20.1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                  bibkey.Ri  = 'AnAge'; 
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


% uni-variate data at f
% time - length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.008	31.884
0.011	39.130
0.097	50.725
0.101	62.319
0.180	44.928
0.521	68.116
0.522	72.464
0.526	86.957
0.597	42.029
0.603	60.870
0.683	47.826
1.525	66.667
1.528	76.812
1.530	84.058
2.529	63.768
2.538	94.203
2.540	102.899
2.629	120.290
3.537	72.464
3.543	97.101
3.545	101.449
3.547	108.696
3.548	113.043
4.471	120.290
4.472	123.188
4.540	68.116
4.548	97.101
4.551	107.246
4.640	127.536
5.555	102.899
5.558	115.942
5.560	121.739
5.562	127.536
5.562	128.986
5.566	144.928
5.647	133.333
6.563	117.391
6.566	127.536
6.568	133.333
6.570	140.580
6.572	149.275
6.573	152.174
7.568	115.942
7.571	127.536
7.572	131.884
7.573	134.783
7.575	142.029
7.577	147.826
8.503	166.667
8.583	153.623
8.584	157.971
8.588	172.464
8.666	149.275
9.584	140.580
9.586	147.826
9.588	152.174
9.589	157.971
9.592	166.667
9.593	172.464
9.597	185.507
10.600	181.159
10.666	115.942
11.597	153.623
11.599	157.971
12.523	171.014
12.524	173.913
12.525	178.261
12.688	159.420
16.644	233.333
18.567	224.638
19.652	213.043
20.552	137.681
22.667	214.493
24.599	234.783
30.629	240.580];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f = C2K(27.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AndrPier2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.010	44.686
0.010	51.932
0.010	64.010
0.012	36.232
0.013	39.855
0.441	65.217
0.522	55.556
0.523	60.386
1.450	68.841
1.468	124.396
1.530	59.179
1.531	62.802
1.536	74.879
1.538	80.918
2.458	72.464
2.465	94.203
2.467	100.242
2.477	128.019
3.460	57.971
3.470	85.749
3.476	103.865
3.477	106.280
3.478	109.903
3.482	121.981
3.485	130.435
4.474	78.502
4.479	91.787
4.482	101.449
4.483	103.865
4.489	121.981
4.491	128.019
4.561	86.957
5.498	126.812
5.501	137.681
5.502	140.097
5.503	142.512
5.504	146.135
5.507	153.382
6.430	154.589
6.496	100.242
6.501	114.734
6.502	118.357
6.505	128.019
6.511	144.928
6.601	161.836
7.430	132.850
7.434	142.512
7.438	154.589
7.519	146.135
7.520	150.966
7.526	169.082
7.528	172.705
7.541	213.768
7.607	159.420
8.455	184.783
8.513	107.488
8.529	155.797
8.537	179.952
8.605	131.643
8.609	142.512
8.615	163.043
9.545	182.367
9.624	166.667
9.630	184.783
10.463	166.667
10.464	169.082
10.465	172.705
10.466	176.329
10.469	184.783
10.471	188.406
10.552	181.159
11.463	144.928
11.473	175.121
11.475	179.952
11.477	184.783
11.566	201.691
12.572	196.860
12.576	210.145
12.580	222.222
13.487	172.705
13.488	177.536
13.491	185.990
13.494	194.444
13.497	201.691
14.579	175.121
14.582	185.990
14.585	194.444
14.586	198.068
14.588	201.691
15.513	207.729
15.586	176.329
15.592	192.029
15.594	198.068
16.489	113.527
16.512	183.575
16.515	192.029
16.516	195.652
16.523	217.391
17.608	198.068
18.445	189.614
18.446	193.237
18.448	199.275
18.449	202.899
18.451	207.729
18.526	182.367
19.616	179.952
19.620	190.821
19.623	199.275
19.625	206.522
19.627	211.353
19.632	227.053
20.380	204.106
20.543	190.821
20.544	194.444
20.555	224.638
20.558	235.507
21.467	190.821
21.556	207.729
22.485	223.430
22.571	229.469
22.641	189.614
22.644	199.275
23.489	216.184
23.571	207.729
23.581	237.923
24.461	109.903
24.487	187.198
24.498	219.807
25.585	206.522
25.587	213.768
28.611	219.807
28.614	229.469
30.545	233.092];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'fork length', 'male'};
temp.tL_m = C2K(27.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AndrPier2007';
comment.tL_m = 'Data for males';

% length - weight
data.LW = [ ... fork length (cm), weight (g)
78.813	5557.074
91.971	6842.500
102.133	8949.444
105.966	16200.984
107.419	11617.355
108.204	14844.497
109.288	10801.036
109.305	12416.341
110.830	14563.148
114.216	15085.984
114.539	10238.337
115.368	17503.742
115.775	20463.400
116.131	18577.145
116.454	13729.498
116.942	24227.245
121.449	24206.447
121.752	17474.278
121.775	19628.018
121.792	21243.322
123.335	25005.434
123.684	22580.744
125.519	18533.816
127.067	22834.363
129.363	26862.225
130.013	17436.149
130.152	30358.586
130.857	26047.640
131.175	20661.558
131.524	18236.868
133.861	26033.775
135.311	21180.928
135.707	23063.717
136.123	26831.028
136.163	30600.072
136.934	32481.128
139.086	23048.119
139.887	27621.349
139.918	30582.741
139.988	37043.959
140.612	25194.926
141.080	33808.151
141.094	35154.238
141.753	26535.813
142.189	32187.647
143.284	29221.055
143.399	39989.753
144.884	38367.515
145.106	24097.258
145.158	28943.172
146.074	44285.100
146.337	33783.886
146.395	39168.235
147.206	44818.335
147.492	36470.861
148.567	31619.748
149.266	26770.368
149.298	29731.760
150.127	36997.164
150.655	51263.955
151.291	40491.791
151.305	41837.878
151.926	29719.627
152.094	45334.239
152.501	48293.897
152.709	32677.553
154.711	44245.237
155.320	31050.116
155.872	47470.647
155.933	53124.213
156.175	40738.478
156.510	36967.700
157.816	53653.982
158.899	49610.521
159.596	44491.923
160.329	42873.152
160.950	65754.901
161.184	52561.514
161.430	40444.996
162.721	55785.190
162.894	36938.237
163.033	49860.674
164.142	48240.169
165.029	60889.923
165.448	64926.451
165.768	59809.587
165.953	42039.503
166.727	44189.776
167.158	49303.174
167.814	40415.532
168.013	58991.535
168.325	53067.019
170.295	61673.311
170.728	67055.926
171.055	62477.497
171.358	55745.328
171.650	47936.289
171.670	49820.811
172.687	74585.349
173.120	44967.964
173.201	52506.053
173.224	54659.792
174.446	63538.768
175.165	60573.910
175.260	69458.085
176.257	57338.101
176.329	64068.537
176.869	44412.198
177.022	58680.722
177.297	49256.379
178.022	46829.955
178.473	53827.876
178.831	52210.838
180.549	72395.213
180.861	66470.696
180.936	73470.350
181.462	52467.923
181.503	56236.967
181.586	64044.273
181.696	74274.536
181.904	58658.191
182.043	71580.628
182.106	77503.412
182.176	83964.630
182.303	60810.197
183.857	65649.179
184.423	83415.796
185.512	79910.770
185.691	61602.251
185.838	75332.341
186.462	63483.307
186.537	70482.960
186.630	79097.918
188.063	72629.767
188.066	72898.985
189.131	67240.219
189.599	75853.444
190.082	85812.756
190.096	87158.843
190.755	78540.419
190.795	82309.463
191.933	83381.133
192.294	82033.313
192.921	70453.497
193.138	55644.804
193.219	63182.893
193.363	76643.765
193.857	87679.946
194.016	67486.905
194.394	102754.390
194.429	70984.999
196.440	83360.335
196.544	93052.163
196.656	68551.643
196.685	71243.817
197.298	93317.914
198.251	77159.668
198.508	101120.020
198.615	76081.065
199.444	83346.470
199.712	108383.692
201.310	82260.934
201.333	84414.674
202.168	92218.513
202.327	72025.472
203.794	103787.930
204.409	91131.245
205.282	102434.911
207.878	99461.387
208.196	94075.305
208.289	102690.263
212.324	128787.023
213.508	99166.172
216.440	127421.871
218.194	115836.855
218.301	125797.900
220.692	138709.938
223.766	110157.291];
units.LW = {'cm', 'g'};     label.LW = {'fork length', 'wet weight'};  
bibkey.LW = 'AndrPier2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
%weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_2: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6YZZ2'; % Cat of Life
metaData.links.id_ITIS = '160508'; % ITIS
metaData.links.id_EoL = '46559947'; % Ency of Life
metaData.links.id_Wiki = 'Sphyrna_lewini'; % Wikipedia
metaData.links.id_ADW = 'Sphyrna_lewini'; % ADW
metaData.links.id_Taxo = '42008'; % Taxonomicon
metaData.links.id_WoRMS = '105816'; % WoRMS
metaData.links.id_fishbase = 'Sphyrna-lewini'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyrna_lewini}}';  
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
bibkey = 'KohlCase1996'; type = 'Techreport'; bib = [ ...  
'author = {N. E. Kohler and J. G. Casey and P. A. Turner}, ' ...
'year = {1996}, ' ...
'title  = {Length-Length and Length-Weight Relationships for 13 Shark Species from the {W}estern {N}orth {A}tlantic}, ' ...
'institution = {Northeast Region Northeast Fisheries Science Center Woods Hole, Massachusetts}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrPier2007'; type = 'Article'; bib = [ ...  
'author = {A. N. Piercy and J. K. Carlson and J. A. Sulikowski and G. H. Burgess}, ' ...
'year = {2007}, ' ...
'title  = {Age and growth of the scalloped hammerhead shark, \emph{Sphyrna lewini}, in the north-west {A}tlantic {O}cean and {G}ulf of {M}exico}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {58}, ' ...
'pages = {34-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sphyrna_lewini}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/39385/0}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/scalloped-hammerhead/sphyrna-lewini/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  