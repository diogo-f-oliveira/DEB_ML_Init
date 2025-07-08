function [data, auxData, metaData, txtData, weights] = mydata_Orius_albidipennis

%% set metaData  
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Anthocoridae';
metaData.species    = 'Orius_albidipennis'; 
metaData.species_en = 'Minute pirate bug'; 

metaData.ecoCode.climate = {'A','C'}; 
metaData.ecoCode.ecozone = {'TP'};
metaData.ecoCode.habitat = {'biTh'};
metaData.ecoCode.embryo  = {'Thl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHn','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp 
metaData.data_0     = {'Wwb';'Wwj'}; % 
metaData.data_1     = {'T-ab';'T-ap';'T-as';'T-Ni'; 'X-Wi';'X-ap';'X-am';'X-Ni';'X-R'; 't-N_T'; 't-S_T'}; % 
metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};     

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2025 01 09];

%% set data 

% zero-variate data

data.Wwb = 1.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Orius_laevigatus'; 
data.Wwj = 0.042; units.Wwj = 'g';   label.Wwj = 'wet weight female imago';   bibkey.Wwj = 'guess';
  comment.Wwj = 'based on Orius_laevigatus'; 
data.Wwjm = 0.034; units.Wwjm = 'g';   label.Wwjm = 'wet weight  male imago';   bibkey.Wwjm = 'guess';
  comment.Wwjm = 'based on Orius_laevigatus'; 
data.Wwi = 1.2*0.042; units.Wwi = 'g';   label.Wwi = 'asymptotic wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'hypothetical: 1.2*Ww_j'; 

data.Ni = 115; units.Ni = '#';   label.Ni = 'total fecundity';   bibkey.Ni = 'SancLaca2002';

% uni-variate data  

% temperature-embryo/juvenile/adult/imago (f/m) duration
data.Tt_apji = [ ... % temperature (C), duration 0b, bp, be, ei (f/m)
20 7.9 29.6 37.2 56.4 49.7	
25 4.0 15.7 19.6 30.4 20.8
30 3.1 11.3 14.4 18.1 11.7
35 2.1  8.2 10.2 11.6  8.3];
units.Tt_apji = {'C', 'd'};  label.Tt_apji = {'temperature', 'duration'}; 
treat.Tt_apji = {1 {'age at birth','time since birth to puberty','time since birth to emergence','female imago life span','male imago life span'}}; 
bibkey.Tt_apji = 'SancLaca2002'; 

% % temperature-total fecundity
% data.TN = [ ... % temperature (C), viable eggs per female (#)
% 20  93  % tN20  99.5 
% 25 130  % tN25 113
% 30  92  % tN30 114
% 35  35];% tN35  84
% units.TN   = {'C', '#'};  label.TN = {'temperature', 'total fecundity'};
% bibkey.TN = 'SancLaca2002'; 
% outcommented since inconsistency with tN* data

% time-cum reproduction rate
data.tN20 = [ ... % time since start imago (d), number of eggs (#/d)
 0  0.000
 5	0.000
 6	0.223
 7	0.474
 8	1.329
 9	1.177
10	2.233
11	1.352
12.	1.603
13	1.829
14	2.332
15	1.853
16	2.809
17	2.255
18	2.456
19	3.160
20	2.254
21	2.706
22	2.252
23	2.202
24	2.579
25	2.779
26	2.829
27	2.527
28	2.501
29	2.727
30	2.575
31	1.543
32	2.449
33	2.297
34	1.693
35	3.051
36	1.843
37	2.119
38	1.842
39	1.917
40	2.319
41	1.866
42	1.638
43	1.864
44	1.763
45	1.738
46	1.611
47	1.384
48	1.132
49	0.981
50	1.156
51	0.955
52	1.055
53	1.432
54	1.331
55	0.551
56	0.827
57	0.751
58	0.499
59	0.322
60	0.724
61	0.000
62	0.396
63	0.305
64	0.294
65	0.243
66	0.193
67	0.000
68	0.000
69	0.000
70	0.000
71	0.000
72	0.000
73	0.000
74	0.000
75	0.000
76	0.000
77	0.000
78	0.000
79	0.000
80	0.000
81	0.000
82	0.000
83	0.000
84  0.284
85	0.158
86	0.000];
data.tN20(:,2) = cumsum(data.tN20(:,2)); % convert reprod rate to cum reprod rate
units.tN20   = {'d', '#'};  label.tN20 = {'time since start imago', 'cumulative reproduction rate', '20 C'}; 
temp.tN20 = C2K(20);  units.temp.tN20 = 'K'; label.temp.tN20 = 'temperature';
bibkey.tN20 = 'SancLaca2002'; 
%
data.tN25 = [ ... % time since start imago (d), number of eggs (#/d)
 0  0.000
 1  0.000
 2	0.000
 3	0.588
 4	3.502
 5	4.728
 6	4.933
 7	7.693
 8	6.645
 9	4.984
10	6.032
11	5.700
12	5.086
13	4.575
14	5.495
15	4.626
16	5.188
17	5.316
18	4.677
19	4.907
20	3.527
21	3.297
22	3.911
23	3.374
24	2.684
25	2.965
26	2.709
27	1.764
28	1.406
29	0.971
30	0.690
31	0.204
32	0.230
33	0.256
34	0.230
35	0.128
36	0.000];
data.tN25(:,2) = cumsum(data.tN25(:,2)); % convert reprod rate to cum reprod rate
units.tN25   = {'d', '#'};  label.tN25 = {'time since start imago', 'cumulative reproduction rate', '25 C'}; 
temp.tN25 = C2K(25);  units.temp.tN25 = 'K'; label.temp.tN25 = 'temperature';
bibkey.tN25 = 'SancLaca2002'; 
%
data.tN30 = [ ... % time since start imago (d), number of eggs (#/d)
 0	0.000
 1	0.000
 2	0.225
 3	1.970
 4	5.982
 5	5.534
 6	4.562
 7	6.232
 8	6.581
 9	5.361
10	3.816
11	4.239
12	4.539
13	3.841
14	3.418
15	2.222
16	3.169
17	3.767
18	3.942
19	4.416
20	4.566
21	5.214
22	4.890
23	4.567
24	4.193
25	4.069
26	2.250
27	2.549
28	4.219
29	2.973
30	0.805
31	0.000];
data.tN30(:,2) = cumsum(data.tN30(:,2)); % convert reprod rate to cum reprod rate
units.tN30   = {'d', '#'};  label.tN30 = {'time since start imago', 'cumulative reproduction rate', '30 C'}; 
temp.tN30 = C2K(30);  units.temp.tN30 = 'K'; label.temp.tN30 = 'temperature';
bibkey.tN30 = 'SancLaca2002'; 
%
data.tN35 = [ ... % time since start imago (d), number of eggs (#/d)
 0  0.000
 1	0.000
 2	5.206
 3	6.011
 4	6.262
 5	7.217
 6	6.135
 7	5.153
 8	6.235
 9	5.479
10	3.844
11	4.648
12	5.025
13	4.522
14	2.207
15	6.307
16	3.614
17	2.884
18	3.337
19	0.000];
data.tN35(:,2) = cumsum(data.tN35(:,2)); % convert reprod rate to cum reprod rate
units.tN35   = {'d', '#'};  label.tN35 = {'time since start imago', 'cumulative reproduction rate', '35 C'}; 
temp.tN35 = C2K(35);  units.temp.tN35 = 'K'; label.temp.tN35 = 'temperature'; 
bibkey.tN35 = 'SancLaca2002'; 

% time-survival
data.tS20 = [ ... % time since start imago (d), surviving fraction (-)
0.400	1.000
8.600	1.000
9.393	0.967
10.386	0.935
11.982	0.914
23.782	0.912
25.175	0.878
31.776	0.878
32.169	0.850
32.963	0.816
36.164	0.823
36.957	0.788
40.555	0.776
41.952	0.764
45.344	0.764
45.352	0.764
48.345	0.730
48.738	0.693
50.132	0.661
51.125	0.630
52.325	0.630
52.720	0.600
61.119	0.600
62.113	0.569
63.314	0.572
64.107	0.538
64.900	0.503
65.888	0.444
67.076	0.385
67.871	0.356
68.657	0.288
69.458	0.291
70.852	0.263
71.645	0.228
72.439	0.197
73.631	0.157
77.419	0.101
77.432	0.163
79.220	0.104
79.413	0.066
82.015	0.079
83.208	0.042
85.201	0.000];
units.tS20   = {'d', '-'};  label.tS20 = {'time since start imago', 'surviving fraction', '20 C'}; 
temp.tS20 = C2K(20);  units.temp.tS20 = 'K'; label.temp.tS20 = 'temperature'; 
bibkey.tS20 = 'SancLaca2002'; 
%
data.tS25 = [ ... % time since start imago (d), surviving fraction (-)
0.000	1.000
9.439	1.000
11.061	0.965
12.063	0.965
12.479	0.931
13.883	0.934
15.119	0.858
15.547	0.792
16.954	0.789
17.970	0.757
18.592	0.710
19.996	0.710
20.611	0.681
24.226	0.681
24.860	0.603
25.874	0.580
29.487	0.580
29.506	0.533
32.917	0.533
33.131	0.514
34.735	0.514
35.224	0.297
37.033	0.290
39.069	0.221
39.672	0.221
40.673	0.221
42.091	0.196
42.911	0.155
43.330	0.110
46.139	0.110
47.160	0.076
48.162	0.076
50.380	0.056
55.999	0.066
56.616	0.038
59.625	0.038
60.845	0.000];
units.tS25   = {'d', '-'};  label.tS25 = {'time since start imago', 'surviving fraction', '25 C'}; 
temp.tS25 = C2K(25);  units.temp.tS25 = 'K'; label.temp.tS25 = 'temperature'; 
bibkey.tS25 = 'SancLaca2002'; 
%
data.tS30 = [ ... % time since start imago (d), surviving fraction (-)
1.402	1.000
2.816	0.950
3.823	0.922
5.427	0.922
6.234	0.893
6.640	0.868
8.048	0.840
8.855	0.815
9.663	0.784
10.670	0.755
12.084	0.702
13.091	0.674
14.499	0.652
15.121	0.549
16.123	0.545
16.741	0.464
18.356	0.404
18.968	0.351
21.771	0.351
21.979	0.326
22.980	0.326
23.789	0.292
24.995	0.273
26.198	0.273
27.011	0.216
28.635	0.110
30.249	0.060
31.651	0.060
32.258	0.031
41.879	0.025
43.085	0.000];
units.tS30   = {'d', '-'};  label.tS30 = {'time since start imago', 'surviving fraction', '30 C'}; 
temp.tS30 = C2K(30);  units.temp.tS30 = 'K'; label.temp.tS30 = 'temperature'; 
bibkey.tS30 = 'SancLaca2002'; 
%
data.tS35 = [ ... % time since start imago (d), surviving fraction (-)
0.803	1.000
1.606	0.966
2.811	0.941
4.016	0.916
5.020	0.891
6.024	0.860
6.627	0.803
7.831	0.772
9.237	0.694
10.040	0.519
10.442	0.435
11.847	0.435
12.651	0.379
13.454	0.241
14.859	0.179
15.663	0.157
16.867	0.116
18.072	0.038
22.088	0.038
23.293	0.000];
units.tS35   = {'d', '-'};  label.tS35 = {'time since start imago', 'surviving fraction', '35 C'}; 
temp.tS35 = C2K(35);  units.temp.tS35 = 'K'; label.temp.tS35 = 'temperature'; 
bibkey.tS35 = 'SancLaca2002'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3 * weights.Wwb;
weights.Wwj = 3 * weights.Wwj;
weights.Wwi = 0 * weights.Wwi;
weights.Ni = 10 * weights.Ni;
weights.Tt_apji = 10 * weights.Tt_apji;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tN35','tN30','tN25','tN20'}; subtitle1 = {'Data for 35, 30, 25, 20 C'};
set2 = {'tS35','tS30','tS25','tS20'}; subtitle2 = {'Data for 35, 30, 25, 20 C'};
metaData.grp.sets = {set1,set2}; txtData.label.sets = {'temperature','temperature'};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points 
D1 = 'males are supposed to differ from females by {p_Am} only';
D2 = 'model hep is applied: period bp acceleration, pe isomorphic growth, allocation to reprod, ei no growth or allocation to reprod';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Neonates count as instar 1, moult into instar 2 till 5, followed by the imago; so the period from birth to imago has 6 instar periods';
metaData.bibkey.F1 = 'Kopp2025'; 
metaData.facts = struct('F1',F1);

%% Links 
metaData.links.id_CoL = 'BY3DJ'; % Cat of Life, no data, it has data for Orius Wolff, 1811 
metaData.links.id_ITIS = '93980'; % ITIS Life, no data, it has data for Orius Wolff, 1811 
metaData.links.id_EoL = '3688421'; % Ency of Life
metaData.links.id_Wiki = 'Orius'; % Wikipedia
metaData.links.id_ADW = 'Orius'; % ADW, no data 
metaData.links.id_Taxo = '2729348'; % Taxonomicon, no data, has data for Orius niger (Wolff, 1811)
metaData.links.id_WoRMS = 'Orius'; % WoRMS, no data

%% References
bibkey = 'Kopp2025'; type = 'Misc'; bib = [ ...
'author = {Koppert}, ' ...
'year = {2025}, ' ...
'howpublished = {\url{https://www.koppert.com/crop-protection/biological-pest-control/predatory-insects/orius-laevigatus/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://https://nl.wikipedia.org/wiki/Orius_albidipennis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SancLaca2002'; type = 'Article'; bib = [ ...
'author = {Sanchez, J.A. and Lacasa, A.}, ' ...
'year = {2002}, ' ...
'title  = {Modelling population dynamics of \emph{Orius laevigatus} and \emph{O. albidipennis} ({H}emiptera: {A}nthocoridae) to optimize their use as biological control agents of \emph{Frankliniella occidentalis} ({T}hysanoptera: {T}hripidae)}, ' ...
'journal = {Bulletin of Entomological Research}, ' ...
'volume = {92}, ' ...
'pages = {77--88}, ' ...
'doi = {10.1079/BER2001136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

