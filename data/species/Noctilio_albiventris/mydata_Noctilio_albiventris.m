function [data, auxData, metaData, txtData, weights] = mydata_Noctilioa_albiventris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Noctilionidae';
metaData.species    = 'Noctilio_albiventris'; 
metaData.species_en = 'Lesser bulldog bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 25]; 

%% set data
% zero-variate data

data.tg = 31.5;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Wiki';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '4-5 wk';
data.tx = 75;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'BrowBrow1983';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'fully weaned at 75-90 d';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'Wiki';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'BrowBrow1983';
data.Wwi = 30;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litters per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1.030	5.862
1.067	7.634
1.078	8.134
1.297	6.543
1.563	7.179
1.599	8.906
2.336	7.904
2.952	7.176
2.969	7.994
2.979	8.494
2.990	8.994
3.128	9.539
3.187	6.357
3.959	7.037
4.082	6.900
4.121	8.719
4.348	7.536
4.379	8.991
4.979	7.535
5.155	9.853
5.257	8.716
5.265	9.125
5.413	10.125
5.525	9.443
5.602	7.124
6.252	7.987
6.284	9.532
6.421	10.032
6.523	8.895
7.199	10.985
7.207	11.394
7.306	10.075
7.375	7.348
7.507	7.666
7.822	10.620
8.216	11.346
8.844	11.163
8.962	10.799
9.288	8.253
9.370	12.162
9.959	10.160
9.973	10.842
9.990	11.615
10.253	12.114
10.739	11.250
10.776	12.977
11.498	11.293
11.514	12.066
11.582	9.293
12.028	12.474
12.294	13.110
12.366	10.519
12.383	11.337
12.403	12.291
13.194	13.881
13.311	13.471
14.280	11.515
14.317	13.242
14.365	15.514
14.388	10.605
14.421	12.196
14.430	12.605
14.693	13.105
14.782	11.332
15.476	14.330
15.608	14.603
16.263	15.738
16.336	13.192
16.347	13.737
16.373	14.965
16.423	11.328
16.444	12.328
17.532	16.007
17.906	15.825
18.167	16.188
18.388	14.687
18.455	11.869
18.630	14.187
18.873	13.777
18.891	14.595
18.898	14.959
19.159	15.368
19.181	16.413
19.981	12.411
20.068	16.547
20.149	14.411
20.287	14.956
20.448	16.592
20.815	16.046
20.971	17.455
21.184	15.590
21.305	15.317
21.846	11.044
22.228	17.179
22.364	17.633
22.405	13.588
22.451	15.769
22.464	16.406
22.554	14.678
22.559	14.906
22.572	15.542
22.855	16.996
23.111	17.132
23.367	11.313
23.469	16.176
23.634	17.994
24.144	18.220
24.630	17.310
24.634	17.537
24.752	17.128
24.792	19.037
25.149	17.991
25.327	14.445
25.414	12.581
25.485	15.945
26.181	19.034
27.032	17.487
27.044	18.032
27.052	18.441
27.333	19.759
27.381	16.077
27.387	16.350
27.487	15.077
27.931	18.212
27.975	14.303
28.763	15.710
28.914	16.892
28.966	19.392
28.973	19.710
28.978	19.937
29.030	16.391
30.174	16.798
30.177	16.934
30.258	20.752
30.384	14.752
31.074	17.523
31.107	19.114
31.176	16.387
31.190	17.069
31.226	18.750
31.367	19.477
31.375	19.841
31.385	20.341
31.858	18.794
31.909	21.203
32.085	17.567
32.419	15.475
32.774	20.338
33.092	17.428
33.134	19.428
33.267	19.746
33.413	20.700
33.418	20.927
33.591	17.154
34.152	19.835
34.191	21.653
34.210	16.562
34.398	19.516
34.504	18.516
34.513	18.970
34.688	21.288
34.822	21.652
35.117	17.651
35.671	20.013
35.802	20.240
35.884	18.104
36.023	18.740
36.081	21.467
36.124	17.512
36.222	22.194
36.494	17.102
36.593	21.830
37.194	20.374
37.208	21.055
37.438	19.964
37.468	21.373
37.879	16.918
37.958	20.690
38.013	17.281
38.119	22.326
38.158	18.190
38.236	21.871
38.699	19.870
39.054	18.779
39.208	20.051
39.478	20.914
39.899	16.913
39.912	17.550
40.081	19.549
40.132	22.004
40.141	22.413
40.158	23.231
40.185	18.504
40.349	20.276
40.353	20.503
40.360	20.821
40.375	21.549
41.001	21.274
41.647	21.955
41.912	22.545
41.962	18.954
41.966	19.136
42.005	21.000
42.058	17.499
42.257	20.954
42.306	17.272
42.322	24.044
42.503	20.635
42.750	20.407
43.151	21.452
43.238	19.588
43.284	21.769
43.423	22.360
43.827	23.586
43.863	19.268
44.049	22.131
44.204	17.495
44.252	19.767
44.260	20.131
44.286	21.404
44.866	24.948
45.066	22.447
45.325	22.765
45.435	21.992
45.972	23.491
46.234	17.945
46.392	19.445
46.396	19.626
46.403	19.990
46.407	20.172
46.561	21.490
46.577	22.262
47.012	24.943
47.341	22.533
47.740	23.532
48.140	18.532
48.163	19.622
48.309	20.531
48.339	21.986
48.343	22.168
48.412	19.440
49.024	18.530
49.162	25.075
49.223	21.984
49.234	22.529
50.286	18.481
50.313	19.800
50.392	23.527
50.485	21.936
51.297	18.525
51.769	22.978
52.211	25.977
52.381	22.068
52.389	22.431
52.423	24.068
53.117	21.021
53.285	23.020
53.325	18.929
53.359	20.520
53.599	19.929
54.166	22.882
54.280	22.291
54.327	24.518
55.276	21.607
55.386	20.834
55.509	26.697
56.278	21.241
56.377	19.923
56.946	22.967
57.536	27.011
57.629	25.420
58.167	21.010
58.441	22.009
58.451	22.509
59.263	25.098
59.414	20.280
59.723	22.961
60.198	27.505
60.422	20.187
61.236	22.867
61.257	23.821
61.320	20.821
61.355	22.503
61.545	25.548
61.597	22.002
63.102	21.499
63.258	22.908
64.027	23.451
64.057	24.906
64.240	27.587
64.596	26.496
64.608	21.087
65.144	22.540
66.042	23.220
66.652	22.218
67.569	23.807
67.629	26.625
67.723	25.125
68.173	28.488
68.513	20.624
69.204	23.486
69.352	24.531
69.387	26.167
69.402	26.894
70.593	23.483
72.195	27.615
72.515	24.842
72.552	26.569
72.584	22.115
72.615	29.569
74.153	24.657
74.182	26.020
76.233	27.516
76.468	26.652
76.684	24.924
76.908	23.560
78.342	25.738
80.489	25.734
80.672	28.461
80.790	28.051
90.497	33.348
94.266	26.431
96.505	30.835
96.559	27.381
102.571	31.095
102.620	33.413
102.906	29.003
109.458	34.352
113.202	26.253
115.378	27.658
115.444	30.794
121.375	30.645
121.643	31.371
121.717	28.917];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BrowBrow1983';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
%weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '7W33B'; % Cat of Life
metaData.links.id_ITIS = '631888'; % ITIS
metaData.links.id_EoL = '1038749'; % Ency of Life
metaData.links.id_Wiki = 'Noctilio_albiventris'; % Wikipedia
metaData.links.id_ADW = 'Noctilio_albiventris'; % ADW
metaData.links.id_Taxo = '64049'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801512'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Noctilio_albiventris}}';
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
bibkey = 'BrowBrow1983'; type = 'Article'; bib = [ ... 
'author = {Patricia E. Brown and Timothy W. Brown and Alan D. Grinnell}, ' ... 
'year = {1983}, ' ...
'title = {Echolocation, development, and vocal communication in the lesser bulldog bat, \emph{Noctilio Mbiventris}}, ' ...
'journal = {Behav. Ecol. Sociobiol.}, ' ...
'volume = {13}, ' ...
'pages = {287-298}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

