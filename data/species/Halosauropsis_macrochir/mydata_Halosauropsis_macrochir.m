  function [data, auxData, metaData, txtData, weights] = mydata_Halosauropsis_macrochir

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Notacanthiformes'; 
metaData.family     = 'Halosauridae';
metaData.species    = 'Halosauropsis_macrochir'; 
metaData.species_en = 'Abyssal halosaur '; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMpm', '0iMpb'};
metaData.ecoCode.embryo  = {'Mpm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCia'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 
metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 17];

%% set data
% zero-variate data
data.ab = 16;  units.ab = 'd';    label.ab = 'time since birth'; bibkey.ab = 'guess';
  temp.ab = C2K(3.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 36*365; units.am = 'd';    label.am = 'life span';     bibkey.am = 'BergClar2016';   
  temp.am = C2K(3.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'BergClar2016';
  comment.Lp = 'based on observation that individuals less than 25 cm could not be sexed';
data.Li = 76;  units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'CrabSula1985';
 comment.Wwb = 'based on guessed egg diameter of 1.5 mm of Polyacanthonotus: pi/6*0.15^3';
data.Wwi = 517; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00087*Li^3.07, see F1';
  
data.Ri = 25e3/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(3.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Polyacanthonotus challengeri, see CrabSula1985';
 
  % univariate data
  % time-length
  data.tL_f = [ ... % time since birth (yr), total length (cm)
1.108	31.099
1.108	21.852
2.082	41.306
2.082	34.114
2.127	38.018
3.101	49.116
3.101	45.212
5.095	56.860
6.025	56.040
6.070	52.136
6.070	58.163
6.070	46.245
6.158	54.944
7.044	52.960
7.044	51.110
8.063	55.085
9.171	62.142
10.057	51.048
10.101	64.061
11.032	65.022
11.120	51.255
12.051	63.038
12.051	55.024
15.019	65.920
16.968	65.102
17.057	61.061
17.057	68.048
18.032	61.954
20.070	65.177
22.019	69.085
35.975	60.002];
  data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
  units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f   = C2K(3.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
  bibkey.tL_f = 'BergClar2016';
  %
  data.tL_m = [ ... % time since birth (yr), total length (cm)
1.063	24.044
2.038	49.114
2.038	43.087
2.038	32.059
2.127	56.032
3.057	52.061
3.101	55.075
3.101	49.870
3.146	40.144
3.899	48.912
3.943	59.049
3.943	55.008
3.987	57.063
4.032	50.077
4.076	54.324
4.076	45.145
4.076	51.926
4.120	56.104
4.120	47.954
4.962	47.271
5.006	48.024
5.051	49.942
5.095	55.079
5.139	58.024
5.139	53.093
5.184	56.038
5.184	44.120
5.981	48.163
6.025	50.971
6.114	45.081
6.158	47.136
6.956	55.083
7.000	54.055
7.000	57.001
7.044	49.946
7.089	60.905
7.133	56.042
7.133	60.151
7.975	62.961
7.975	57.002
8.019	67.071
8.019	47.003
8.994	53.169
8.994	52.004
9.038	57.141
9.038	48.032
9.127	62.964
9.127	59.128
10.013	63.034
10.013	67.006
11.076	62.145
12.006	62.010
12.139	51.120
12.139	47.216
13.203	57.081
13.956	67.151
16.082	59.964
18.076	69.077
21.000	61.001
23.038	63.059];
  data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
  units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m   = C2K(3.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
  bibkey.tL_m = 'BergClar2016';
 
  % time-weight
  data.tW_f = [ ... % time since birth (yr), weight (g)
1.003	15.623
2.006	44.970
2.146	34.988
2.162	104.255
3.009	76.189
3.053	60.589
4.116	142.355
4.169	164.821
4.194	274.026
5.064	140.500
6.054	114.309
6.107	138.647
6.150	119.303
7.150	136.169
7.159	177.979
7.186	89.368
7.243	129.930
8.051	138.681
9.122	253.521
10.173	285.989
10.227	112.511
11.035	120.014
11.380	377.742
15.003	256.746
15.352	326.643
16.984	209.979
17.053	298.592
17.160	353.508
17.258	365.991
18.129	238.081
20.086	291.158
22.138	346.733
36.181	164.768];
  data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
  units.tW_f  = {'d', 'cm'};  label.tW_f = {'time since birth', 'weight', 'females'};  
  temp.tW_f   = C2K(3.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
  bibkey.tW_f = 'BergClar2016';
  comment.tW_f = 'data for females';
  %
  data.tW_m = [ ... % time since birth (yr), weight (g)
0.953	5.637
1.096	7.512
1.952	219.072
2.001	24.377
2.016	86.156
3.082	184.146
3.108	91.791
3.153	82.432
3.188	30.014
4.013	108.656
4.023	152.962
4.050	66.847
4.059	104.913
4.064	122.386
4.064	126.130
4.065	128.626
4.095	56.239
4.104	91.185
4.120	159.828
4.170	172.309
4.209	137.365
4.228	214.120
5.005	91.825
5.059	120.531
5.097	81.218
5.101	99.315
5.103	104.931
5.155	124.901
5.161	149.862
5.200	116.790
5.269	205.402
5.997	74.994
5.998	81.234
6.005	109.316
6.050	99.332
7.003	117.446
7.013	158.632
7.014	163.000
7.038	264.092
7.052	126.183
7.059	153.640
7.117	197.323
7.167	208.556
8.087	90.632
8.168	232.911
8.225	271.602
8.266	245.393
9.002	146.811
9.026	251.023
9.035	87.529
9.038	98.761
9.056	174.893
9.129	85.034
9.142	138.077
10.061	215.472
10.084	312.196
10.109	216.721
10.239	365.865
11.082	320.951
11.977	95.694
12.183	164.964
12.204	252.328
14.055	257.977
16.184	236.174
18.191	299.236
21.052	166.994
23.187	170.152
29.023	379.929];
  data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
  units.tW_m  = {'d', 'cm'};  label.tW_m = {'time since birth', 'total length', 'males'};  
  temp.tW_m   = C2K(3.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
  bibkey.tW_m = 'BergClar2016';

  % length-weight
  data.LW = [ ... % total length (cm), weight (g)
13.870	0.898
16.195	14.498
22.165	3.070
24.192	5.821
30.753	13.356
31.881	106.117
33.941	20.993
37.911	44.072
40.020	27.137
40.898	41.873
42.145	32.697
42.171	68.549
42.354	55.889
43.301	31.959
43.318	55.157
43.909	72.011
44.018	89.583
44.950	44.563
44.953	48.781
44.972	76.197
45.143	45.963
45.149	52.993
45.150	54.399
45.153	58.617
45.155	62.132
45.160	69.161
45.923	57.891
46.061	114.829
46.123	199.888
46.129	76.162
47.113	103.549
47.189	74.021
47.189	74.724
47.194	81.051
47.196	83.863
47.254	164.002
47.297	90.187
47.687	97.205
47.770	77.519
47.775	85.251
47.972	90.869
47.978	98.602
48.190	126.012
48.411	163.967
49.024	212.455
49.116	73.260
49.125	85.914
49.326	97.155
49.527	107.694
49.924	123.148
50.015	115.412
50.134	147.746
50.392	103.450
50.675	95.709
50.908	151.238
50.959	88.670
50.979	115.383
50.980	117.492
50.988	128.740
51.051	82.341
51.068	105.539
51.143	75.308
51.162	102.021
51.168	109.754
51.289	144.196
51.291	147.711
51.446	94.280
51.925	90.750
51.964	144.879
52.027	98.480
52.040	116.757
52.063	147.688
52.125	99.883
52.130	106.913
52.132	110.428
52.140	120.972
52.222	101.286
52.336	125.184
52.340	131.511
52.356	152.600
52.537	136.426
52.826	136.417
52.886	85.800
52.919	132.197
52.962	191.246
53.012	127.273
53.021	139.926
53.026	146.253
53.031	153.283
53.088	99.151
53.189	105.475
53.221	149.762
53.388	247.472
54.059	107.558
54.064	115.290
54.067	119.508
54.072	125.835
54.083	274.868
54.165	121.614
54.248	103.334
54.371	139.183
54.374	143.401
54.397	175.034
54.861	150.416
54.944	131.433
54.948	137.056
54.950	139.868
54.952	142.680
55.032	120.885
55.036	126.509
55.097	210.163
55.115	101.199
55.123	113.150
55.127	118.773
55.174	183.447
55.349	158.837
55.382	203.827
55.453	168.676
55.636	155.313
56.005	132.104
56.011	140.539
56.038	178.500
56.130	171.467
56.162	216.457
56.190	122.256
56.292	129.986
56.306	148.966
57.026	77.943
57.091	167.923
57.138	232.597
57.216	207.287
57.272	151.749
57.278	159.482
57.410	341.552
58.033	136.963
58.124	129.228
58.212	117.274
58.267	194.601
58.404	249.430
58.526	151.711
59.056	217.776
59.148	212.852
59.194	142.552
59.196	144.661
59.203	288.774
59.211	165.750
59.292	278.226
59.304	160.827
59.310	169.965
59.319	314.781
59.322	186.134
59.412	177.695
59.961	136.202
60.100	195.249
60.123	227.586
60.321	234.610
60.462	162.198
61.236	166.392
61.264	205.759
61.310	269.026
61.373	222.627
61.400	259.885
61.538	184.661
61.848	212.771
62.044	216.983
62.117	318.211
62.153	234.555
62.166	252.832
62.409	321.717
63.112	361.063
63.145	272.486
63.198	213.433
63.222	246.473
63.270	312.553
63.359	169.140
63.409	237.329
63.460	309.032
64.119	285.813
65.050	373.659
65.094	301.250
65.330	361.700
65.760	289.279
66.268	325.116
66.506	253.404
66.736	304.715
67.194	272.364
67.308	296.262
67.329	325.787
67.357	364.451
67.566	252.669
68.120	352.477
68.405	346.141
68.465	296.227
69.246	310.264
69.464	344.000
69.817	299.702
70.357	379.123
70.490	296.869
71.300	350.272
71.377	456.421
74.308	376.192
76.365	153.986];
  units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
  bibkey.LW = 'BergClar2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts 
F1 = 'length-weight: Ww in g = 0.00087*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);
                                 
%% Links
metaData.links.id_CoL = '6KZMM'; % Cat of Life
metaData.links.id_ITIS = '161672'; % ITIS
metaData.links.id_EoL = '46561221'; % Ency of Life
metaData.links.id_Wiki = 'Halosauropsis_macrochir'; % Wikipedia
metaData.links.id_ADW = 'Halosauropsis_macrochir'; % ADW
metaData.links.id_Taxo = '42616'; % Taxonomicon
metaData.links.id_WoRMS = '126639'; % WoRMS
metaData.links.id_fishbase = 'Halosauropsis-macrochir'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Halosauropsis_macrochir}}';  
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
bibkey = 'BergClar2016'; type = 'Article'; bib = [ ... 
'doi = {10.1371/journal.pone.0031493}, ' ...
'author = {Odd Aksel Bergstad and Laura Clark and Hege {\O}verb{\o} Hansen and Nicola Cousins}, ' ... 
'year = {2016}, ' ...
'title = {Distribution, Population Biology, and Trophic Ecology of the Deepwater Demersal Fish \emph{Halosauropsis macrochir} ({P}isces: {H}alosauridae) on the {M}id-{A}tlantic {R}idge}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {7(2)}, ' ...
'pages = {e31493}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CrabSula1985'; type = 'article'; bib = [ ... 
'author = {Crabtree, Roy E. and Sulak, Kenneth J. and Musick, John A.}, ' ... 
'year = {1985}, ' ...
'title = {Biology And Distribution Of Species Of \emph{Polyacanthonotus} ({P}isces, {N}otacanthiformes) In The {W}estern {N}orth-{A}tlantic}, ' ... 
'journal = {Bul.. Mar. Sci.}, ' ...
'howpublished = {\url{https://scholarworks.wm.edu/vimsarticles/1555}}, ' ...
'volume = {36(2)}, ' ...
'pages = {235-248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Halosauropsis-macrochir.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

 
