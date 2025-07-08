function [data, auxData, metaData, txtData, weights] = mydata_Hylomyscus_stella
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Hylomyscus_stella'; 
metaData.species_en = 'Stella wood mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 15];

%% set data
% zero-variate data

data.tg = 29.5;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Dela2009';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 38;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Dela2009';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 1.5;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Dela2009';
data.Wwi = 20;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Dela2009';

data.Ri  = 3*2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Dela2009';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 2 litters per yr assumed';
  
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.000	1.410
0.000	1.169
0.000	1.582
0.000	1.443
0.000	1.718
1.387	2.061
1.387	1.855
1.734	1.305
1.734	1.098
2.775	1.579
2.775	1.269
3.121	2.437
3.815	1.887
3.815	1.784
3.815	1.578
5.202	2.367
5.549	1.954
5.549	2.367
5.549	2.435
5.549	1.817
5.896	2.572
5.896	2.813
6.590	2.263
6.936	2.125
7.283	1.746
7.977	2.261
8.671	3.223
8.671	3.429
8.671	3.532
9.017	2.535
9.364	4.494
9.364	2.398
9.711	2.947
10.405	3.634
10.405	2.603
11.098	4.114
11.445	3.221
11.792	3.048
12.139	4.491
12.139	4.045
12.486	5.625
13.179	4.594
13.179	3.631
13.179	2.772
13.526	4.078
13.526	3.769
14.566	5.692
15.260	4.489
15.260	4.351
15.954	7.065
15.954	5.622
15.954	5.004
15.954	4.626
16.647	5.244
16.994	6.171
16.994	5.175
17.341	5.896
17.341	4.934
17.688	5.483
17.688	4.418
18.382	3.490
18.382	3.902
18.728	5.929
18.728	5.036
19.075	6.754
19.422	5.894
19.769	8.128
20.116	6.272
20.462	6.546
20.462	5.687
20.462	5.275
20.462	3.419
20.809	6.889
20.809	6.168
20.809	5.274
20.809	4.243
21.503	7.336
21.503	5.617
22.197	6.407
22.543	8.056
22.543	6.098
22.890	7.609
23.237	3.795
23.584	6.681
23.584	6.372
23.931	6.921
23.931	6.509
23.931	5.890
24.277	7.161
24.277	3.278
24.624	7.333
24.624	4.653
25.318	7.607
26.012	8.775
26.012	7.366
26.012	7.366
26.358	8.706
26.358	7.641
26.705	2.933
27.052	8.534
27.052	9.015
27.052	8.018
27.399	8.121
28.092	8.567
29.133	9.357
29.133	6.333
29.827	8.188
29.827	8.359
29.827	7.500
30.173	7.775
30.520	9.287
31.214	10.901
32.601	10.007
32.601	9.113
32.601	8.976
32.601	8.838
33.295	9.662
33.295	10.246
34.335	7.840
35.029	10.004
36.763	9.865
36.763	10.415
38.150	11.720
38.844	11.170
39.191	11.341
39.538	11.856
39.538	9.245
40.925	12.474
42.312	10.170
43.006	11.922
43.006	11.750
45.087	11.989
45.434	12.229
46.127	9.754
46.474	13.087
48.555	12.948
48.902	9.958
52.023	13.907
52.023	13.736
55.838	10.605
56.185	14.385
58.960	13.833
59.306	14.313
61.734	12.112
66.243	14.033
66.590	15.269
69.364	11.075
73.873	15.779
73.873	14.026
74.220	12.445
76.647	15.398
76.647	11.549
76.994	15.948
80.116	14.296
80.462	16.185
80.462	16.632
83.237	12.575
87.052	18.448
87.399	14.255
90.173	12.363
94.335	19.404
94.682	15.726
95.029	17.822
97.803	19.401
97.803	11.531
101.272	15.652
103.699	18.983
105.780	21.112
107.168	19.805
107.861	11.935
109.249	18.532
112.023	22.103
114.104	12.823];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'Dela2009';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
35.029	10.486
36.416	10.759
36.763	12.237
37.457	10.174
39.191	12.028
39.538	14.434
39.538	12.372
39.538	11.066
41.272	13.126
42.659	12.781
45.087	13.982
46.474	16.180
51.676	14.354
52.370	16.931
60.000	17.784
61.387	15.102
66.590	18.809
73.179	20.212
80.809	20.618
88.092	20.062];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(36);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'Dela2009';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6MNQ2'; % Cat of Life
metaData.links.id_ITIS = '585262'; % ITIS
metaData.links.id_EoL = '1179110'; % Ency of Life
metaData.links.id_Wiki = 'Hylomyscus_stella'; % Wikipedia
metaData.links.id_ADW = 'Hylomyscus_stella'; % ADW
metaData.links.id_Taxo = '89268'; % Taxonomicon
metaData.links.id_MSW3 = '13001393'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hylomyscus_stella}}';
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
bibkey = 'Dela2009'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1971.tb02177.x}, ' ...
'author = {Delany, M. J.}, ' ... 
'year = {2009}, ' ...
'title = {The biology of small rodents in {M}ayanja {F}orest, {U}ganda}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {165(1)}, ' ...
'pages = {85–1297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

