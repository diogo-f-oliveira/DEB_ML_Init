function [data, auxData, metaData, txtData, weights] = mydata_Uroteuthis_duvauceli
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Myopsida'; 
metaData.family     = 'Loliginidae';
metaData.species    = 'Uroteuthis_duvauceli'; 
metaData.species_en = 'Indian squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.am = 3*365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'sealifebase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.3;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'Sami2009';
  comment.Lb = 'based on max egg diameter of 2.5 mm';
data.Lp  = 10;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'sealifebase';
data.Li  = 23;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'sealifebase';
  comment.Li = 'assumed death at 2 yrs';
data.Lim = 40; units.Lim = 'cm';label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'sealifebase';
  comment.Lim = 'assumed death at 2 yrs';

data.Ni  = 375600; units.Ni  = '#';      label.Ni  = 'cum reprod at death';  bibkey.Ni  = 'Sami2009';   
  temp.Ni = C2K(25); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
42.112	4.725
45.839	4.481
47.329	4.719
47.702	4.120
53.665	4.710
55.901	4.946
59.255	5.061
62.236	4.221
64.472	8.520
65.963	4.694
66.335	10.669
66.708	7.083
67.453	6.126
67.454	8.516
68.571	8.037
68.944	5.168
69.317	8.992
70.435	14.847
70.436	9.349
72.298	5.402
73.416	8.867
74.161	9.942
75.278	15.080
75.279	10.657
75.280	8.267
76.025	6.951
76.770	13.524
77.516	7.666
77.888	16.391
78.633	9.936
78.634	7.067
79.378	16.150
79.379	10.652
79.752	5.034
80.497	8.141
81.615	8.259
81.616	9.932
81.988	10.290
82.360	18.178
83.478	12.559
83.479	9.810
83.851	8.256
85.342	5.505
86.087	17.575
87.578	8.370
87.950	11.238
88.323	9.804
88.696	10.759
89.068	8.129
90.932	16.135
91.676	14.460
91.677	15.178
91.678	8.484
92.050	10.038
92.795	7.049
94.658	10.751
95.030	10.034
95.031	11.348
95.032	8.121
96.148	15.889
96.149	7.642
96.893	13.736
96.894	7.641
97.640	18.038
97.641	14.931
98.012	10.149
98.013	12.898
99.876	11.342
99.877	7.637
100.248	8.353
100.621	16.600
100.622	18.034
100.994	10.145
102.857	8.589
103.230	7.035
103.975	16.356
104.348	10.021
105.093	10.976
105.094	7.391
105.466	15.398
106.584	14.082
108.447	16.231
108.820	15.274
108.821	12.286
111.801	12.402
113.665	15.985
113.666	11.921
114.783	16.940
114.784	8.334
115.901	9.528
118.137	14.186
120.000	14.303
123.727	11.310
124.472	12.863
124.845	11.189
129.689	8.434
131.180	14.049];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SukrTsuc2007';
comment.tL_f = 'data for females'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
43.643	4.348
49.623	5.035
52.220	4.569
52.610	5.263
53.713	4.683
56.700	4.911
59.294	4.328
59.464	11.162
60.048	4.675
62.654	4.555
64.329	11.966
64.543	5.595
65.464	12.660
67.651	10.688
69.007	5.242
69.529	11.265
70.194	8.021
72.077	8.829
72.897	11.839
74.168	17.977
74.371	11.143
74.394	12.069
74.657	7.667
75.150	12.532
75.263	17.049
75.274	17.512
76.133	7.086
76.234	11.140
76.500	6.854
78.307	19.593
79.894	8.471
80.247	7.660
80.671	9.745
80.706	11.134
81.371	7.890
81.477	12.176
82.520	9.163
82.807	5.688
83.214	7.077
84.123	13.678
84.441	11.477
84.966	17.615
84.981	18.195
85.055	21.206
85.126	9.044
85.204	12.171
85.617	13.792
85.981	13.444
86.545	6.146
86.565	6.957
86.694	12.169
87.035	10.895
87.560	17.033
87.592	18.307
88.093	8.461
88.414	6.375
88.447	22.707
88.560	12.283
88.604	14.020
88.890	10.545
88.999	14.946
89.563	7.648
89.612	9.617
91.373	20.503
91.530	11.815
91.871	10.541
91.935	13.089
92.201	8.803
92.267	11.467
92.513	6.370
93.281	7.296
94.907	12.738
95.447	19.455
95.770	17.486
95.848	20.613
95.959	10.072
95.979	10.883
96.303	8.914
96.493	16.558
97.441	9.723
97.519	12.850
98.313	14.818
98.347	16.208
99.509	17.944
100.096	11.573
100.176	14.816
102.825	16.434
102.857	17.708
105.096	17.821
105.330	12.261
105.772	15.040
107.193	12.259
107.601	13.648
108.999	9.940
109.767	10.865
109.957	18.510
110.734	19.783
110.862	9.937
110.957	13.760
110.995	15.265
113.028	22.097
113.288	17.579
113.910	12.598
114.231	10.512
114.930	8.658
115.903	17.807
116.019	7.498
116.877	12.015
116.897	12.825
117.838	20.701
118.136	17.689
118.668	9.116
118.766	13.055
119.026	8.537
119.939	15.254
121.831	16.410
124.966	7.603
137.150	18.012
167.717	18.320];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SukrTsuc2007';
comment.tL_m = 'data for males'; 

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
4.117	8.009
4.734	10.982
5.008	10.991
5.556	15.930
6.380	16.942
6.790	21.876
7.270	26.813
7.821	18.957
7.955	31.757
8.369	22.912
8.435	30.789
8.574	26.856
8.777	37.690
8.779	29.816
8.844	42.613
9.189	36.719
9.259	31.800
9.530	45.588
9.533	33.777
9.737	39.690
9.803	52.487
10.073	66.275
10.145	56.435
10.286	41.676
10.288	34.786
10.423	42.665
10.556	59.401
10.695	53.500
10.760	66.298
10.977	26.935
11.170	71.233
11.311	58.442
11.383	48.602
11.513	72.228
11.515	67.307
11.516	63.370
11.923	82.084
12.058	89.963
12.261	98.827
12.266	82.095
12.270	67.332
12.955	73.260
13.640	76.235
13.701	106.749
13.846	79.194
13.980	91.010
14.051	80.185
14.114	100.857
14.324	87.084
14.459	96.931
14.586	133.353
14.863	124.503
15.271	138.296
15.551	116.652
15.687	123.546
15.887	145.206
15.892	127.490
16.165	132.420
16.220	181.635
16.301	136.362
16.361	167.860
16.434	153.098
16.437	143.256
16.580	121.607
16.702	177.713
17.541	121.638
18.070	194.490
18.555	177.774];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'SukrTsuc2007';
comment.LWw_f = 'data for females'; 
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
4.348	7.166
4.622	7.175
5.104	11.207
5.447	12.223
5.653	11.226
6.480	24.306
6.547	16.276
6.892	21.307
7.096	17.298
7.099	25.330
7.442	26.346
7.646	20.329
7.989	17.328
8.266	25.369
8.402	21.358
8.747	27.394
8.953	27.400
8.955	35.433
9.020	22.383
9.366	31.430
9.437	39.465
9.504	36.455
9.506	41.475
9.708	28.430
10.055	42.498
10.119	23.423
10.195	52.542
10.260	36.480
10.602	34.484
10.607	51.552
10.812	47.543
11.223	44.545
11.293	51.575
11.358	36.517
11.364	59.610
11.498	45.558
11.561	25.480
11.840	41.553
11.913	59.628
12.252	41.567
12.253	47.591
12.455	30.530
12.460	51.614
12.664	41.581
12.669	60.657
12.868	36.568
12.872	50.624
12.943	57.655
13.693	41.615
13.765	53.666
13.904	57.687
14.112	64.722
14.386	63.727
15.141	61.744
15.553	64.770
15.558	81.838
15.619	54.732
16.246	85.877
16.790	69.831
16.868	101.963
17.270	64.827
17.683	69.861
17.821	72.878
18.102	96.984
18.302	75.906
18.373	81.933
18.375	90.969
18.380	107.033
18.651	97.002
18.713	71.904
18.714	75.920
18.860	106.045
19.063	97.016
19.550	119.121
20.023	92.028
20.525	168.350
20.858	131.213
21.140	158.330
21.277	158.335
21.614	134.250
22.028	144.304
22.448	172.430
22.996	167.429];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'SukrTsuc2007';
comment.LWw_m = 'data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.Lb = 10 * weights.Lb; 
weights.Lim = 3 * weights.Lim; 

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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and del_M only';
D2 = 'Males are longer than females, but weigh less';
D3 = 'mod_1: males have equal state variables as females at b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DZJY'; % Cat of Life
metaData.links.id_ITIS = '556098'; % ITIS
metaData.links.id_EoL = '47261632'; % Ency of Life
metaData.links.id_Wiki = 'Uroteuthis_duvauceli'; % Wikipedia
metaData.links.id_ADW = 'Uroteuthis_duvauceli'; % ADW
metaData.links.id_Taxo = '157894'; % Taxonomicon
metaData.links.id_WoRMS = '574517'; % WoRMS
metaData.links.id_molluscabase = '574517'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Uroteuthis_duvauceli}}';
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
bibkey = 'SukrTsuc2007'; type = 'article'; bib = [ ... 
'doi = {10.1007/s11160-006-9033-7}, ' ...
'author = {Natinee Sukramongkol and Kotaro Tsuchiya and Susumu Segawa}, ' ... 
'year = {2007}, ' ...
'title = {Age and maturation of \emph{Loligo duvauceli} and \emph{L. chinensis} from {A}ndaman {S}ea of {T}hailand}, ' ...
'journal = {Rev Fish Biol Fisheries}, ' ...
'volume = {17}, ' ...
'pages = {237-246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sami2009'; type = 'article'; bib = [ ... 
'author = {Samiee, K. and Valinassab, T. and Vossoughi, G. and Kiabi, B. and Fatemi, M.}, ' ... 
'year = {2009}, ' ...
'title = {Reproductive biology of the {I}ndian squid \emph{Uroteuthis duvauceli} ({O}rbigny, 1835), in the northern {G}ulf of {O}man}, ' ...
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {8(1)}, ' ...
'pages = {85-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Uroteuthis-duvauceli.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

