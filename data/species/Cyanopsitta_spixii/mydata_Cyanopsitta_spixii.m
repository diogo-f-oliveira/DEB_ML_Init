function [data, auxData, metaData, txtData, weights] = mydata_Cyanopsitta_spixii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Cyanopsitta_spixii'; 
metaData.species_en = 'Spix''s macaw'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 05];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 26;    units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'ADW';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24 till 28 d';
data.tx = 70;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 210;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'In captivety upto 7 yr, but this might be the result of inbreeding';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'TschRett2010';
data.Wwi = 280;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';              bibkey.Wwi = 'TschRett2010';

data.Ri = 2.5/365/1.5; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 3 eggs/clutch; breeds once per 1.5 yr';
 
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.222	15.317
2.220	17.505
3.774	20.788
5.105	26.258
6.437	31.729
7.325	40.481
8.435	49.234
9.323	55.799
10.655	62.363
11.765	73.304
12.653	84.245
13.541	92.998
13.984	100.656
15.094	112.691
15.760	123.632
16.870	136.761
17.536	144.420
17.980	154.267
18.868	163.020
19.756	176.149
20.422	184.902
21.532	199.125
22.420	211.160
22.642	223.195
23.307	230.853
23.973	240.700
24.195	247.265
25.527	260.394
26.637	274.617
27.525	289.934
28.635	301.969
29.079	314.004
29.523	324.945
30.189	338.074
31.521	342.451
32.630	359.956
33.518	369.803
34.850	378.556
35.294	393.873
36.182	399.344
37.514	404.814
37.736	415.755
38.846	426.696
40.400	426.696
40.844	435.449
42.175	446.389
43.507	456.236
44.395	450.766
45.727	459.519
46.393	455.142
47.281	446.389
49.057	445.295
49.723	438.731
50.610	435.449
51.720	435.449
52.386	427.790
53.496	422.319
55.272	422.319
57.048	414.661
58.158	411.379
59.711	404.814
60.821	401.532
62.597	394.967
64.151	388.403
65.039	380.744
66.815	370.897
68.590	361.050
69.700	355.580
71.254	347.921
73.030	340.263
74.584	332.604
76.582	321.663
78.135	323.851
79.467	317.287
80.799	312.910
82.353	312.910
84.129	311.816
85.683	303.063
88.124	306.346
89.012	308.534
90.566	304.158
91.676	303.063
93.896	303.063
94.562	303.063
95.671	306.346
96.559	294.311
97.669	297.593
99.223	295.405
101.443	298.687
103.219	295.405
104.551	291.028
105.882	293.217
107.658	297.593
108.324	294.311
109.434	294.311
111.210	294.311
112.320	291.028
112.986	285.558
115.205	292.123
115.649	286.652
117.203	292.123
117.204	285.558
118.313	286.652
119.423	285.558
120.089	284.464
120.977	281.182
121.865	276.805
122.087	274.617
123.418	277.899
125.416	277.899
126.304	276.805
127.414	272.429
129.412	269.147
131.632	269.147
132.519	268.053
134.295	263.676
136.071	262.582
138.291	269.147
140.511	268.053];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(41.3);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'TschRett2010';
feed.tW1 = [ ... % time since birth (d), food (g/d)
0.105	0.000
0.947	1.813
1.479	5.430
2.428	8.147
3.275	12.218
4.534	12.681
5.488	17.656
6.120	19.467
7.076	25.345
8.237	28.967
8.664	32.583
9.404	35.750
10.560	37.115
11.202	43.441
11.525	47.507
12.477	51.579
13.642	57.007
14.283	62.882
15.341	67.858
15.870	70.120
17.242	74.647
17.984	78.265
18.627	85.043
19.682	88.213
20.527	91.381
21.268	94.999
21.487	99.516
22.855	101.786
23.184	108.561
23.402	112.626
23.517	117.593
24.255	119.857
24.786	123.022
25.314	124.833
26.262	127.098
26.900	131.167
26.923	142.454
27.123	137.490
27.246	146.520
27.260	152.841
27.686	156.005
28.512	150.144
29.986	153.317
30.102	158.736
30.324	164.607
30.650	170.027
31.820	178.164
32.649	173.657
32.949	166.436
33.566	161.024
33.766	156.512
33.999	167.349
34.435	175.479
34.766	183.157
35.814	183.167
36.861	182.725
37.906	180.928
38.747	182.290
39.569	174.623
40.828	175.086
41.587	186.831
42.751	192.259
43.638	165.179
44.893	163.836
45.816	154.363
46.972	155.728
47.489	152.121
49.622	119.634
50.440	109.710
51.580	103.851
52.422	105.213
53.573	104.320
54.780	79.952
55.755	95.311
57.007	92.162
58.994	89.922
60.348	85.871
61.496	83.624
62.636	77.314
63.983	70.103
64.397	67.398
65.023	66.049
66.165	60.642
67.205	56.588
68.564	55.246
69.613	55.255
70.448	53.908
72.126	53.923
73.698	53.938
74.636	51.237
75.374	53.501
76.633	53.964
77.893	54.878
79.256	54.891
80.294	50.385
81.340	49.040
82.498	51.308
83.223	47.252
84.483	48.166
85.316	45.916
87.001	49.543
87.418	48.192
90.243	45.961
91.091	50.483
91.831	53.198
92.448	47.786
94.012	43.737
95.589	46.009
96.418	41.502
99.141	40.172];
units.feed.tW1 = {'d', 'g/d'} ; label.feed.tW1 = {'time since birth', 'food intake', 'mixed food, 20% protein, 10% fat'};
comment.tW1 = 'food consisted of a mix of 3 commercial brands, around 20% protein, 10 percent fat';
%
data.tW4 = [ ... % time since birth (d), wet weight (g)
1.110	17.505
4.661	22.976
6.659	32.823
7.991	42.670
9.545	54.705
11.321	71.116
12.653	88.621
13.984	101.751
15.316	118.162
17.092	136.761
18.868	154.267
20.422	171.772
21.976	184.902
23.307	198.031
24.639	214.442
25.971	228.665
27.303	239.606
28.635	257.112
30.411	272.429
31.521	289.934
33.074	298.687
33.962	310.722
35.516	319.475
36.626	328.228
37.070	333.698
39.512	340.263
41.953	341.357
43.507	346.827
45.505	351.204
46.171	350.109
47.725	351.204
48.613	351.204
49.945	346.827
51.276	346.827
53.274	347.921
54.384	344.639
55.494	342.451
57.048	340.263
57.936	336.980
58.824	336.980
59.267	333.698
60.821	329.322
62.375	320.569
64.151	312.910
65.261	310.722
66.815	307.440
67.703	299.781
69.478	294.311
71.476	293.217
73.030	293.217
74.806	291.028
76.582	288.840
77.913	288.840
79.023	289.934
80.577	291.028
82.131	289.934
83.241	287.746
83.907	284.464
84.573	281.182
86.349	284.464
88.346	284.464
89.234	281.182
90.344	276.805
91.898	281.182
93.674	278.993
94.562	281.182
95.450	281.182
97.003	283.370
98.557	281.182
100.333	280.088
102.109	277.899
104.107	275.711
105.882	273.523
108.324	277.899
110.766	277.899
113.651	282.276
114.983	282.276
116.315	282.276
117.425	282.276
118.757	285.558
120.089	285.558
121.643	285.558
123.196	278.993
125.416	278.993
127.192	278.993
129.412	281.182
130.744	281.182
132.519	281.182
134.517	285.558
136.959	289.934
138.735	289.934
140.511	285.558
142.952	285.558
144.950	285.558
146.726	285.558
148.502	285.558
150.055	280.088
152.719	281.182
153.829	281.182
154.717	284.464
155.383	283.370
156.937	285.558
158.713	285.558
159.822	282.276
161.376	285.558
162.042	282.276
163.374	282.276
164.706	277.899
165.594	281.182
166.482	280.088
167.814	281.182
168.923	277.899
170.255	282.276
171.587	282.276
172.475	272.429
174.029	265.864
175.361	266.958];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};  
temp.tW4    = C2K(41.3);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4  = 'TschRett2010';
feed.tW4 = [ ... % time since birth (d), food (g/d)
0.106	 0.053
0.959	 7.231
2.643	10.858
4.747	14.489
5.384	18.106
6.648	21.278
7.290	27.153
8.663	32.131
9.824	36.205
11.097	43.440
11.524	47.056
12.374	52.481
13.224	57.906
14.289	66.042
15.456	72.373
16.394	70.124
17.449	73.294
18.080	74.203
19.553	76.925
20.177	74.222
21.637	70.623
22.685	70.633
23.322	74.702
24.569	69.295
25.722	69.306
26.784	76.087
27.413	76.093
28.365	80.165
29.944	83.339
30.481	89.213
31.531	90.126
32.363	86.973
33.211	91.495
35.738	96.936
36.350	88.815
37.609	89.729
38.648	85.224
39.496	89.746
40.423	81.628
41.266	83.893
42.635	87.066
43.482	90.685
44.635	90.696
45.253	85.735
46.514	87.101
47.447	82.143
48.711	85.315
49.228	81.708
50.589	80.817
51.741	80.376
52.580	80.835
53.311	79.487
54.754	67.762
55.608	74.993
56.651	72.745
57.698	71.852
58.515	61.475
58.941	64.640
59.783	66.453
60.500	58.333
61.338	58.341
63.528	52.943
64.161	54.754
65.632	56.574
66.466	54.324
67.307	55.234
68.356	55.695
69.727	59.771
70.568	61.133
71.314	67.009
72.568	64.763
74.023	58.907
76.226	59.830
77.500	67.516
78.440	65.719
79.470	57.150
80.610	50.840
81.451	52.202
82.709	52.213
84.281	52.227
85.319	47.271
86.374	50.440
87.627	48.194
88.472	51.362
89.500	41.439
90.787	55.446
92.040	53.200
92.463	55.010
93.811	47.799
94.459	56.834
95.402	56.842
96.130	54.140];
units.feed.tW4 = {'d', 'g/d'} ; label.feed.tW4 = {'time since birth', 'food intake', 'mixed food, 20% protein, 10% fat'};
comment.tW4 = 'food consisted of a mix of 3 commercial brands, around 20% protein, 10 percent fat';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
weights.tW4 = weights.tW4 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.feed = feed;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW4'}; subtitle1 = {'Different feeding regimes'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'food intake is given as function of time, but strange enough, it starts for 0, explaining why predicted growth is delayed, relative to observed, despite high v. Digestion efficiency is assumed to decrease slightly with specific feeding rate, relative to max';
D3 = 'life span seems very short for a macaw';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Female breeds, both parents feed young; nest in big hollow Caraibeira trees (Tabebuia aurea)';
metaData.bibkey.F1 = {'ADW','Wiki'}; 
F2 = 'Extinct in the wild';
metaData.bibkey.F2 = {'ADW','Wiki'}; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '32NS5'; % Cat of Life
metaData.links.id_ITIS = '177658'; % ITIS
metaData.links.id_EoL = '1177960'; % Ency of Life
metaData.links.id_Wiki = 'Cyanopsitta_spixii'; % Wikipedia
metaData.links.id_ADW = 'Cyanopsitta_spixii'; % ADW
metaData.links.id_Taxo = '70692'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'FB8F32C30473F64B'; % avibase
metaData.links.id_birdlife = 'spixs-macaw-cyanopsitta-spixii'; % birdlife
metaData.links.id_AnAge = 'Cyanopsitta_spixii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyanopsitta_spixii}}';
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
bibkey = 'TschRett2010'; type = 'Article'; bib = [ ... 
'author = {A. Tschudin and H. Rettmer and R. Watson and S. Hammer}, ' ... 
'year = {2010}, ' ...
'title = {Evaluation of hand-rearing records for {S}pix''s macaw \emph{Cyanopsitta spixii} at the {Al Wabra Wildlife Preservation} from 2005 to 2007}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {44}, ' ...
'pages = {201--211}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cyanopsitta_spixii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Cyanopsitta_spixii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

