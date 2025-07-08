function [data, auxData, metaData, txtData, weights] = mydata_Neomysis_integer

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Neomysis_integer'; 
metaData.species_en = 'Opossum Shrimp'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab_T'; 'ap_T'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; 'L-N_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2017 09 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 27]; 

%% set data
% zero-variate data

data.ab_10 = 37;    units.ab_10 = 'd';    label.ab_10 = 'age at birth';             bibkey.ab_10 = 'WinkGrev2002';   
  temp.ab_10 = C2K(10);  units.temp.ab_10 = 'K'; label.temp.ab_10 = 'temperature';
data.ab_15 = 19;    units.ab_15 = 'd';    label.ab_15 = 'age at birth';             bibkey.ab_15 = 'WinkGrev2002';   
  temp.ab_15 = C2K(15);  units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.tp_10 = 110;    units.tp_10 = 'd';    label.tp_10 = 'time since birth at puberty'; bibkey.tp_10 = 'WinkGrev2002';
  temp.tp_10 = C2K(10);  units.temp.tp_10 = 'K'; label.temp.tp_10 = 'temperature';
  comment.tp_10 = '15 till 16 moults';
data.tp_15 = 45;    units.tp_15 = 'd';    label.tp_15 = 'time since birth at puberty'; bibkey.tp_15 = 'WinkGrev2002';
  temp.tp_15 = C2K(15);  units.temp.tp_15 = 'K'; label.temp.tp_15 = 'temperature';
  comment.tp_15 = '15 till 16 moults';
data.am = 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'WinkGrev2002';  
data.Lj  = 0.5;   units.Lj  = 'cm';  label.Lj  = 'length at metam'; bibkey.Lj  = 'WinkGrev2002'; 
  comment.Lj = 'based on inflection point in tL curves';
data.Lp  = 0.8;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'WinkGrev2002'; 
data.Li  = 1.7;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'Wiki';

data.Wdb = 2.95e-5;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'WinkGrev2002';
  comment.Wdb = 'based on (Lp/Li)^3*Wdi';
data.Wdp = 1.10e-3;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'WinkGrev2002';
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 1.05e-2;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Wiki';
  comment.Wdi = 'based on length-weight of Mysis mixta: (1.7/1.470)^3*6.8e-3';
 
% uni-variate data
% t-L data
data.tL_10 = [ ... % time since birth (d), standard length (cm)
43.462	0.386
43.674	0.360
49.345	0.408
50.162	0.395
51.185	0.373
55.209	0.486
56.046	0.412
56.442	0.442
56.447	0.429
59.286	0.442
62.132	0.434
62.309	0.512
62.518	0.495
62.524	0.477
62.531	0.456
63.926	0.538
65.362	0.495
65.366	0.482
65.372	0.464
68.192	0.534
68.194	0.530
69.811	0.551
70.235	0.499
70.414	0.573
70.859	0.456
71.423	0.590
71.449	0.512
72.250	0.547
73.287	0.482
74.085	0.525
75.900	0.564
76.714	0.560
77.132	0.525
77.531	0.547
77.705	0.634
77.926	0.582
78.937	0.595
80.336	0.665
80.351	0.617
82.375	0.638
82.816	0.534
82.998	0.599
85.035	0.582
86.023	0.665
86.028	0.647
86.239	0.625
87.022	0.712
87.846	0.678
87.855	0.651
88.244	0.704
89.477	0.660
89.666	0.704
89.673	0.682
89.846	0.773
90.687	0.686
90.883	0.708
90.884	0.704
94.320	0.756
94.356	0.647
96.331	0.817
96.357	0.739
96.539	0.799
96.545	0.782
96.978	0.704
97.378	0.721
98.144	0.860
99.199	0.743
100.185	0.830
100.201	0.782
100.206	0.769
100.220	0.725
102.169	0.974
102.868	0.704
104.081	0.721
105.468	0.826
105.851	0.895
107.075	0.878
107.092	0.826
108.688	0.913
108.700	0.878
110.136	0.834
110.306	0.934
110.725	0.895
112.771	0.852
113.196	0.795
113.392	0.817
114.999	0.869
115.984	0.961
117.006	0.943
118.410	0.995
118.448	0.882
119.041	0.930
119.252	0.908
119.849	0.943
120.849	0.991
120.855	0.974
122.498	0.917
123.260	1.069
124.119	0.930
124.944	0.891
126.735	1.004
127.557	0.974
128.780	0.961
130.176	1.039
132.024	0.978
134.634	1.069
136.290	0.978
136.319	0.891
138.308	1.017
138.725	0.982
139.486	1.139
139.518	1.043
143.577	1.052
143.583	1.035
143.594	1.000
144.180	1.069
145.004	1.035
146.603	1.113
149.260	1.065
149.881	1.030
151.337	0.926
151.899	1.069
154.134	1.065
155.746	1.104
155.967	1.052
156.791	1.017
157.166	1.109
158.984	1.139
162.234	1.139
165.477	1.161
169.140	1.139
169.543	1.148
169.552	1.122
169.555	1.113
177.065	1.126
179.092	1.139
179.271	1.213
179.307	1.104
179.321	1.061
180.093	1.183
182.526	1.196
184.982	1.139
185.197	1.104
193.084	1.209
196.335	1.204
197.339	1.239
198.199	1.096];  
units.tL_10   = {'d', 'cm'};  label.tL_10 = {'time since birth', 'standard length', '10 C'};  
temp.tL_10    = C2K(10);  units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'WinkGrev2002';
%
data.tL_15 = [ ...   % time since birth (d), standard length (cm)
4.268	0.243
5.691	0.243
7.317	0.243
8.537	0.289
9.146	0.269
10.569	0.289
11.789	0.275
11.992	0.328
12.195	0.302
13.415	0.328
13.618	0.311
14.024	0.433
14.837	0.403
15.244	0.361
16.057	0.380
16.667	0.334
16.667	0.354
16.870	0.393
18.496	0.502
19.715	0.315
19.919	0.407
19.919	0.433
20.122	0.357
20.122	0.472
20.325	0.446
20.528	0.387
20.528	0.459
21.138	0.423
22.764	0.610
23.374	0.554
23.577	0.475
23.577	0.489
23.577	0.525
24.593	0.420
24.593	0.446
24.593	0.528
24.593	0.538
24.593	0.564
25.407	0.443
25.813	0.472
27.439	0.584
27.439	0.643
27.439	0.659
28.049	0.659
28.252	0.387
28.455	0.505
28.455	0.630
29.065	0.643
29.065	0.548
29.268	0.659
29.472	0.616
29.675	0.436
29.675	0.472
29.675	0.561
29.878	0.643
30.488	0.577
30.894	0.551
31.504	0.462
32.520	0.525
32.724	0.633
32.724	0.774
32.927	0.652
33.333	0.793
34.146	0.498
34.146	0.718
34.146	0.754
34.553	0.685
34.959	0.564
35.569	0.639
35.569	0.780
35.772	0.498
35.772	0.869
35.976	0.518
36.585	0.738
37.398	0.574
38.415	0.721
38.618	0.767
38.618	0.793
38.821	0.580
39.837	0.826
39.837	0.856
40.041	0.659
40.650	0.721
40.650	0.705
40.650	0.692
40.854	0.616
41.057	0.534
41.463	0.944
43.699	0.816
43.902	0.633
44.106	0.839
44.309	0.856
44.512	0.879
44.715	0.695
44.715	0.774
44.919	0.725
45.732	0.846
45.935	0.698
45.935	0.921
46.341	0.797
47.764	1.010
48.577	0.885
48.780	0.721
50.406	0.721
51.220	0.820
52.846	0.892
52.846	0.970
53.252	0.830
53.659	0.856
55.894	0.974
56.098	0.820
56.098	0.938
56.504	1.079
57.724	0.934
57.927	0.820
59.146	1.013
60.163	0.997
61.789	0.879
61.992	1.010
64.431	0.902
64.634	1.066
66.870	0.941
66.870	0.957
67.480	1.033
69.512	0.987
69.512	1.174
69.919	1.036];
units.tL_15   = {'d', 'cm'};  label.tL_15 = {'time since birth', 'standard length', '15 C'};  
temp.tL_15    = C2K(15);  units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'WinkGrev2002';
  
% L-N data
data.LN_10 = [ ... % standard length (cm), hatched juveniles (#) 
0.871	11.920
0.897	7.101
0.927	2.283
0.927	5.326
0.958	10.399
0.989	16.486
1.004	7.355
1.030	18.261
1.050	16.486
1.050	9.384
1.060	25.109
1.086	36.014
1.086	10.145
1.086	12.428
1.086	7.101
1.096	27.645
1.096	7.101
1.101	21.051
1.111	8.116
1.116	8.877
1.127	16.232
1.132	9.384
1.132	7.355
1.162	19.783
1.162	7.355
1.162	5.326
1.178	28.913
1.193	9.638
1.193	14.203
1.193	17.246
1.193	18.261
1.198	2.536
1.198	10.399
1.214	19.275
1.214	22.826
1.214	23.587
1.219	21.558
1.229	7.355
1.229	15.217
1.234	11.667
1.239	20.290
1.239	34.239
1.249	12.428
1.249	10.906
1.249	29.167
1.265	12.174
1.275	18.261
1.275	16.739
1.285	9.384
1.285	16.739
1.295	20.290
1.295	24.094
1.295	29.167
1.321	10.399
1.326	25.109
1.336	27.645
1.357	13.188
1.357	15.471
1.362	21.304
1.362	29.167
1.377	24.348
1.398	18.514
1.418	32.971
1.418	37.790
1.439	28.406
1.480	27.899
1.485	23.587
1.515	30.435
1.536	25.362
1.541	34.239
1.561	17.500
1.587	48.949
1.669	32.971];   
units.LN_10  = {'cm', 'N'};   label.LN_10 = {'standard length', 'number of young', '10 C'};  
temp.LN_10   = C2K(10);  units.temp.LN_10 = 'K'; label.temp.LN_10 = 'temperature';
bibkey.LN_10 = 'WinkGrev2002';
%
data.LN_15 = [ ... % standard length (cm), hatched juveniles (#) 
0.716	7.127
0.825	2.291
0.862	7.891
0.862	8.655
0.862	11.455
0.883	6.364
0.883	12.473
0.899	4.327
0.904	7.382
0.904	8.655
0.915	10.182
0.920	13.745
0.925	4.327
0.930	7.891
0.930	10.945
0.932	28.509
0.941	9.418
0.977	7.382
0.978	13.491
0.988	6.364
1.003	6.109
1.004	12.473
1.024	7.636
1.025	13.236
1.029	4.836
1.030	8.909
1.040	9.673
1.050	4.327
1.056	5.855
1.056	11.964
1.057	20.364
1.057	25.709
1.068	28.255
1.071	6.618
1.072	13.236
1.084	35.891
1.087	7.891
1.089	28.255
1.113	2.291
1.113	8.400
1.114	18.836
1.126	41.491
1.134	9.418
1.145	11.200
1.149	59.818
1.153	42.000
1.155	6.364
1.160	3.055
1.160	4.582
1.169	48.109
1.172	18.836
1.173	30.036
1.176	7.891
1.177	15.018
1.177	20.873
1.177	22.400
1.188	30.800
1.193	25.709
1.197	9.418
1.199	32.073
1.199	34.109
1.200	42.000
1.200	52.182
1.201	54.727
1.203	12.218
1.203	13.745
1.210	35.382
1.218	10.945
1.219	18.327
1.219	23.673
1.220	30.036
1.236	39.200
1.239	7.382
1.241	33.600
1.241	35.891
1.246	37.927
1.247	43.018
1.250	12.727
1.250	20.618
1.262	32.836
1.262	36.909
1.267	28.255
1.268	45.564
1.274	52.691
1.276	9.418
1.281	11.709
1.281	16.545
1.283	31.055
1.283	33.855
1.283	34.873
1.283	36.145
1.298	29.018
1.302	15.782
1.312	10.182
1.314	31.055
1.334	24.945
1.354	12.982
1.355	15.527
1.356	28.255
1.372	31.818
1.386	18.327
1.387	24.182
1.397	28.255
1.419	32.836
1.449	19.091
1.491	23.673
1.534	34.109
1.593	49.127
1.599	63.891
1.640	55.491
1.691	33.345];   
units.LN_15  = {'cm', 'N'};   label.LN_15 = {'standard length', 'number of young', '15 C'};  
temp.LN_15   = C2K(15);  units.temp.LN_15 = 'K'; label.temp.LN_15 = 'temperature';
bibkey.LN_15 = 'WinkGrev2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_10 = 5 * weights.tL_10;
weights.tL_15 = 5 * weights.tL_15;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_15', 'tL_10'}; subtitle1 = {'Data at 15, 10 C'};
set2 = {'LN_15', 'LN_10'}; subtitle2 = {'Data at 15, 10 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'Females release eggs into a brood pouch or marsupium, where they are held until they hatch';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '46NDX'; % Cat of Life
metaData.links.id_ITIS = '90063'; % ITIS
metaData.links.id_EoL = '344079'; % Ency of Life
metaData.links.id_Wiki = 'Neomysis_integer'; % Wikipedia
metaData.links.id_ADW = 'Neomysis_integer'; % ADW
metaData.links.id_Taxo = '34098'; % Taxonomicon
metaData.links.id_WoRMS = '120136'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neomysis_integer}}';
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
bibkey = 'WinkGrev2002'; type = 'Article'; bib = [ ... 
'author = {G. Winkler and W. Greve}, ' ... 
'year = {2002}, ' ...
'title = {Laboratory studies of the effect of temperature on growth, moulting and reproduction in the co-occurring mysids \emph{Neomysis integer} and \emph{Praunus flexuosus}}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {235}, ' ...
'pages = {177-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
