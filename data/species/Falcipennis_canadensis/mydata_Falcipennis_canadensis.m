function [data, auxData, metaData, txtData, weights] = mydata_Falcipennis_canadensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Falcipennis_canadensis'; 
metaData.species_en = 'Spruce grouse'; 

metaData.ecoCode.climate = {'Dsa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 21];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 21];

%% set data
% zero-variate data

data.ab = 20;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'avibase';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17-24 d';
data.tx = 10;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'young remain with mother until 12-15 wk';
data.tp = 80;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on how long to maximum weight';
data.tR = 365;          units.tR = 'd';    label.tR = 'time since birth at first reproduction'; bibkey.tR = 'avibase';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 13*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 22.65; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';          bibkey.Ww0 = 'avibase';
data.Wwb = 15;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 448.7;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 492;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 5/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-10 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.114	12.061
0.799	14.254
1.711	15.351
2.282	15.351
3.195	18.640
3.993	17.544
3.993	14.254
4.336	18.640
5.248	21.930
6.161	26.316
6.161	25.219
7.302	23.026
8.101	18.640
8.215	23.026
8.329	29.605
9.242	26.316
10.040	35.088
11.067	29.605
11.067	35.088
11.181	42.763
11.752	41.667
11.866	36.184
11.866	29.605
11.980	17.544
13.121	42.763
13.121	19.737
14.034	32.895
14.148	42.763
15.060	43.860
15.174	40.570
16.087	57.018
16.201	42.763
17.228	57.018
17.228	53.728
18.141	62.500
18.141	50.439
18.141	57.018
20.081	64.693
20.081	74.561
22.248	71.272
22.248	62.500
22.362	76.754
23.161	88.816
23.161	97.588
25.101	72.368
26.128	88.816
26.242	97.588
27.154	122.807
27.154	115.132
28.181	132.675
28.295	141.447
28.295	148.026
28.409	115.132
29.094	93.202
29.893	151.316
30.007	138.158
30.007	120.614
31.034	151.316
31.034	107.456
32.174	154.605
33.201	161.184
33.201	154.605
33.886	160.088
34.228	150.219
34.685	189.693
35.255	160.088
36.054	167.763
36.168	156.798
37.195	167.763
37.423	179.825
37.423	199.561
37.879	187.500
37.993	176.535
37.993	163.377
38.107	211.623
39.248	206.140
39.248	210.526
39.248	219.298
39.248	224.781
39.248	232.456
39.362	184.211
39.362	190.789
39.933	191.886
40.047	207.237
40.047	202.851
40.161	254.386
40.161	237.939
40.161	221.491
40.161	216.009
40.161	179.825
41.188	233.553
41.416	219.298
41.530	196.272
41.530	202.851
41.530	210.526
41.530	223.684
41.644	223.684
41.872	216.009
41.987	207.237
42.329	189.693
42.443	229.167
43.013	207.237
43.013	212.719
43.013	246.711
43.242	244.518
43.356	229.167
43.356	239.035
43.926	290.570
43.926	250.000
43.926	240.132
43.926	236.842
44.040	257.675
44.040	223.684
44.040	211.623
44.953	260.965
45.181	211.623
45.181	233.553
45.181	246.711
45.181	255.482
45.409	224.781
46.094	280.702
46.094	263.158
46.094	254.386
46.094	246.711
46.094	243.421
46.094	237.939
46.094	230.263
46.208	289.474
47.007	264.254
47.007	277.412
47.007	281.798
47.007	290.570
47.121	228.070
47.121	242.325
47.235	259.868
47.349	251.097
47.805	298.246
48.034	360.746
48.034	262.061
48.034	254.386
48.148	314.693
48.148	279.605
48.148	239.035
48.832	240.132
48.832	233.553
49.060	286.184
49.060	294.956
49.060	302.632
49.060	320.176
49.060	265.351
49.060	260.965
49.060	254.386
49.060	243.421
49.289	274.123
50.087	291.667
50.201	283.991
50.886	342.105
50.886	233.553
50.886	248.904
50.886	277.412
51.000	320.176
51.000	316.886
51.114	265.351
51.799	269.737
51.913	277.412
51.913	259.868
51.913	254.386
52.027	230.263
52.141	309.211
52.711	324.561
52.826	330.044
52.940	278.509
52.940	303.728
52.940	310.307
52.940	317.982
52.940	336.623
52.940	343.202
53.168	286.184
53.168	296.053
53.168	299.342
53.738	339.912
53.738	347.588
53.852	317.982
53.966	299.342
53.966	263.158
54.081	376.097
54.765	330.044
54.765	280.702
54.993	317.982
54.993	300.439
55.792	302.632
55.906	277.412
56.020	315.790
56.134	357.456
56.134	330.044
56.134	286.184
57.047	303.728
57.161	358.553
57.275	338.816
57.275	328.947
57.846	308.114
58.188	346.491
58.188	353.070
58.416	331.140
59.215	244.518
59.215	319.079
59.215	337.719
59.329	330.044
60.128	398.026
60.356	357.456
60.698	389.254
61.040	342.105
61.040	369.518
61.154	331.140
61.383	365.132
61.839	341.009
61.953	331.140
61.953	350.877
62.067	358.553
62.752	353.070
62.866	344.298
62.866	357.456
63.094	320.176
64.121	349.781
67.315	339.912
68.114	381.579
68.114	373.904
68.114	369.518
69.255	395.833
69.825	412.281
69.825	321.272
70.282	369.518
70.396	395.833
70.966	439.693
71.081	464.912
71.195	419.956
71.195	408.991
71.195	377.193
72.221	398.026
72.336	390.351
72.336	365.132
73.134	421.053
75.302	421.053
75.303	406.798
76.215	449.561
76.216	452.851
78.268	399.123
78.268	412.281
80.094	390.351
80.095	396.930
80.096	406.798
83.289	452.851
84.201	400.219];
n=size(data.tW_f(:,1)); for i=2:n; if data.tW_f(i,1)<=data.tW_f(i-1,1);data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3;end;end
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight','females'};  
temp.tW_f    = C2K(40.7);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'SchrBlom2021'; 
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
1.027	17.429
1.826	17.429
2.738	15.251
2.738	19.608
2.966	22.876
4.107	25.054
4.221	21.787
4.906	22.876
5.020	21.787
6.047	27.233
6.732	18.519
7.872	26.144
7.872	27.233
8.101	18.519
8.899	23.965
9.013	30.501
9.013	25.054
10.839	34.858
11.638	51.198
11.866	39.216
11.866	34.858
12.094	22.876
12.664	23.965
13.919	50.109
14.034	45.752
14.832	46.841
14.832	43.573
15.060	56.645
15.631	52.288
16.658	64.270
17.000	53.377
17.913	66.449
17.913	74.074
17.913	52.288
18.027	53.377
19.168	62.092
19.852	64.270
19.966	88.235
21.906	59.913
22.134	72.985
22.819	83.878
22.819	93.682
22.933	104.575
24.074	82.789
24.758	112.200
24.872	100.218
25.785	129.630
27.725	118.736
27.725	105.664
28.752	87.146
28.752	80.610
28.866	126.362
28.866	69.717
28.980	142.702
28.980	116.558
29.664	168.845
29.893	135.076
29.893	143.791
30.805	145.969
31.946	180.828
31.946	106.754
32.060	162.309
32.859	160.131
34.000	186.275
34.000	148.148
34.000	144.880
34.114	161.220
35.711	209.150
35.826	169.935
35.940	194.989
35.940	198.257
37.651	209.150
37.879	236.383
37.993	180.828
38.107	196.078
38.221	137.255
38.678	209.150
38.792	223.312
38.792	230.937
38.906	184.096
38.906	198.257
38.906	204.793
39.819	222.222
39.933	242.919
39.933	217.865
39.933	204.793
39.933	193.900
40.047	213.508
40.617	206.972
40.732	205.882
40.732	221.133
40.732	229.847
40.732	235.294
40.846	183.007
40.846	245.098
41.758	217.865
41.758	217.865
41.758	202.614
41.872	230.937
41.872	223.312
41.987	261.438
41.987	252.723
42.101	238.562
42.215	247.277
42.899	244.009
42.899	253.813
43.013	213.508
43.013	262.527
43.013	269.063
43.584	265.795
43.584	225.490
43.812	296.296
43.812	301.743
43.926	257.081
43.926	214.597
44.040	286.492
44.040	254.902
44.040	242.919
44.040	234.205
44.725	261.438
44.839	270.152
44.839	277.778
44.839	286.492
44.953	225.490
44.953	230.937
44.953	245.098
45.067	220.044
45.752	222.222
45.866	324.619
45.866	278.867
45.866	235.294
45.866	246.187
45.866	252.723
46.893	289.760
46.893	265.795
46.893	252.723
46.893	241.830
46.893	233.115
47.235	276.688
47.235	248.366
47.805	291.939
47.919	245.098
47.919	252.723
47.919	261.438
47.919	270.152
47.919	320.261
48.148	305.011
48.148	313.725
48.604	348.584
48.832	339.869
48.832	331.155
48.832	302.832
48.832	279.956
48.832	270.152
48.832	265.795
48.832	261.438
48.946	242.919
49.060	309.368
50.087	318.083
50.886	346.405
50.886	352.941
50.886	357.298
51.000	310.457
51.000	322.440
51.000	338.780
51.228	293.028
51.913	320.261
52.027	294.118
52.027	282.135
52.027	274.510
52.027	265.795
52.027	254.902
52.027	248.366
52.255	300.654
52.711	337.691
52.711	331.155
52.711	330.065
52.940	376.906
52.940	366.013
52.940	355.120
52.940	346.405
52.940	302.832
52.940	309.368
53.168	321.351
54.081	322.440
54.081	311.547
54.081	298.475
54.651	352.941
54.879	357.298
54.993	320.261
54.993	326.797
54.993	345.316
55.906	339.869
55.906	382.353
55.906	387.800
56.020	300.654
56.819	322.440
56.819	288.671
56.933	335.512
56.933	350.763
57.732	374.728
57.732	349.673
57.732	345.316
57.846	360.566
57.846	328.976
58.188	409.586
58.872	335.512
58.987	368.192
58.987	360.566
60.013	340.959
60.812	355.120
60.926	368.192
61.725	391.068
61.725	380.174
61.839	411.765
61.839	363.834
62.752	349.673
62.866	405.229
62.980	389.978
62.980	380.174
63.779	345.316
64.121	405.229
66.517	397.603
66.859	366.013
66.859	357.298
67.087	431.373
68.000	374.728
69.027	419.390
69.826	445.534
69.940	422.658
70.054	399.782
70.282	431.373
70.624	457.516
70.738	360.566
70.852	413.943
70.852	422.658
70.966	399.782
71.081	445.534
71.423	431.373
71.537	468.410
71.879	461.874
71.993	440.087
73.248	442.266
74.732	441.176
74.846	455.338
75.758	411.765
75.758	456.427
75.872	445.534
78.154	443.355
78.154	448.802
83.745	409.586];
n=size(data.tW_m(:,1)); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1);data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3;end;end
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight','males'};  
temp.tW_m    = C2K(40.7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'SchrBlom2021'; 
comment.tW_m = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 3 * weights.ab;
%weights.Ww0 = 0 * weights.Ww0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_3: Pseudo-data point k is used, rather than k_J; Parameter t_R is added, replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2,  'D3',D3);  

%% Links
metaData.links.id_CoL = '6HNNW'; % Cat of Life
metaData.links.id_ITIS = '553896'; % ITIS
metaData.links.id_EoL = '45510623'; % Ency of Life
metaData.links.id_Wiki = 'Falcipennis_canadensis'; % Wikipedia
metaData.links.id_ADW = 'Falcipennis_canadensis'; % ADW
metaData.links.id_Taxo = '381889'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4BCA4FFF85E6B1E2'; % avibase
metaData.links.id_birdlife = 'spruce-grouse-falcipennis-canadensis'; % birdlife
metaData.links.id_AnAge = 'Falcipennis_canadensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Falcipennis_canadensis}}';
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
bibkey = 'SchrBlom2021'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.sprgro.01.1}, ' ...
'author = {Schroeder, M. A. and E. J. Blomberg and D. A. Boag and P. Pyle and M. A. Patten}, ' ...
'year = {2021}, ' ...
'title = {Spruce Grouse (\emph{Canachites canadensis}), version 1.1. In Birds of the World (P. G. Rodewald, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA}, ' ... 
'howpublished = {\url{https://birdsoftheworld.org/bow/species/sprgro/cur/breeding}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4BCA4FFF85E6B1E2&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Falcipennis_canadensis}}';
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

