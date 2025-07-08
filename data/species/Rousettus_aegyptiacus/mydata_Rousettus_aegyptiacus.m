function [data, auxData, metaData, txtData, weights] = mydata_Rousettus_aegyptiacus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Rousettus_aegyptiacus'; 
metaData.species_en = 'Egyptian fruit bat'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BWk', 'BSh', 'BSk'};
metaData.ecoCode.ecozone = {'THp', 'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 28]; 

%% set data
% zero-variate data

data.tg = 116;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 21.06; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwx = 73.8;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';        bibkey.Wwx = 'AnAge';
data.Wwi = 125;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'AnAge';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litters per yr';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
0.967	23.463
0.980	25.599
0.981	21.026
0.995	24.076
1.003	22.248
1.003	18.285
1.016	25.603
1.018	20.116
1.024	24.080
1.025	21.031
1.047	24.082
1.989	25.376
1.991	21.717
2.896	24.199
2.937	25.116
2.981	23.593
2.982	22.373
3.023	25.119
3.047	22.376
3.067	25.121
3.068	23.596
3.113	23.903
3.947	27.284
3.948	26.064
3.951	23.320
3.978	25.150
3.980	22.712
4.035	25.152
4.036	24.238
4.696	25.474
4.763	26.086
4.938	26.395
5.048	24.873
5.049	23.349
5.158	25.180
5.385	26.100
5.959	25.197
6.001	26.112
6.448	27.340
6.638	26.734
6.684	28.259
6.981	27.349
6.985	25.215
7.082	27.961
7.084	26.436
7.503	27.967
7.724	27.361
7.951	26.755
8.062	29.500
8.422	27.676
8.797	26.766
8.919	29.512
8.984	29.513
8.989	26.769
9.451	28.604
9.867	29.828
9.944	27.390
10.010	29.830
10.304	29.833
10.606	29.532
10.995	30.146
11.320	28.625
11.905	29.545
12.073	31.376
12.075	30.461
12.082	28.022
12.611	30.161
12.700	31.077
13.068	32.300
13.266	29.557
13.849	31.087
14.156	29.870
14.458	32.311
14.984	33.840
14.992	31.401
15.101	31.402
15.316	32.623
15.767	32.016
16.103	34.763
16.110	32.629
16.820	33.548
16.937	34.768
17.308	34.771
17.558	35.077
17.571	31.724
17.820	33.555
18.607	33.865
19.007	35.696
19.021	32.343
19.427	34.784
19.730	29.908
20.572	36.925
20.582	34.791
20.874	36.317
21.633	38.150
21.641	36.321
21.785	39.066
23.092	36.633
23.095	36.024
23.241	40.293
23.249	38.768
23.764	37.551
23.925	39.686
25.177	37.558
25.192	34.814
25.352	38.778
25.909	38.476
26.291	37.563
26.647	42.138
26.654	40.918
26.836	42.748
27.047	40.005
27.453	37.873
28.638	42.756
28.647	41.231
28.655	40.012
29.504	38.491
30.142	39.713
30.346	41.848
30.769	44.593
30.777	43.374
31.241	40.936
31.245	40.327
31.723	36.975
32.139	43.379
32.381	42.160
33.116	38.504
33.571	42.164
34.032	45.824
34.041	44.605
34.299	43.081
34.775	46.132
35.791	46.440
35.800	45.220
36.074	43.392
36.304	47.356
37.604	51.629
37.661	44.617
37.918	46.447
38.761	44.925
39.003	49.499
39.032	46.145
39.563	50.415
39.865	48.586
40.402	53.466
40.708	51.943
40.749	47.369
40.762	45.845
40.982	54.382
41.295	52.554
41.682	42.799
42.835	50.119
42.855	47.985
44.067	52.561
44.648	58.660
44.743	48.905
45.701	51.041
46.005	53.786
46.381	49.519
47.340	55.009
48.022	55.620
48.060	51.962
49.823	52.271
50.042	65.381
50.088	61.113
50.131	57.149
50.880	55.322
50.897	53.798
51.589	58.067
52.004	54.410
53.143	54.412
53.499	56.852
61.173	71.197
61.303	61.441
63.396	73.030
63.514	64.494
66.634	76.389
68.658	71.515
79.122	83.117
79.175	80.068
81.580	75.193
89.167	64.533
89.952	90.753
90.118	82.217
90.237	76.120
92.807	79.781
95.096	67.284
96.211	80.090
98.795	91.069
99.134	75.216
103.365	82.233
112.457	92.913
119.863	98.408
125.831	74.024
129.663	68.844
131.699	96.895
132.440	70.981
137.319	103.912
140.910	84.707
153.569	87.461
156.879	88.988
157.235	111.854
158.402	77.709
161.559	86.552
178.645	89.003];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Noll1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

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

%% Links
metaData.links.id_CoL = '4THCH'; % Cat of Life
metaData.links.id_ITIS = '632267'; % ITIS
metaData.links.id_EoL = '323421'; % Ency of Life
metaData.links.id_Wiki = 'Rousettus_aegyptiacus'; % Wikipedia
metaData.links.id_ADW = 'Rousettus_aegyptiacus'; % ADW
metaData.links.id_Taxo = '63887'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800397'; % MSW3
metaData.links.id_AnAge = 'Rousettus_aegyptiacus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rousettus_aegyptiacus}}';
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
bibkey = 'Noll1979'; type = 'Article'; bib = [ ... 
'author = {U. G. Noll}, ' ... 
'year = {1979}, ' ...
'title = {POSTNATAL GROWTH AND DEVELOPMENT OF THERMOGENESIS IN \emph{Rousettus aegyptiacus}}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {63A}, ' ...
'pages = {89--93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rousettus_aegyptiacus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

