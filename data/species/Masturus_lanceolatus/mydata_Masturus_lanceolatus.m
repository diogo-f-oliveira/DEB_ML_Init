function [data, auxData, metaData, txtData, weights] = mydata_Masturus_lanceolatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Molidae';
metaData.species    = 'Masturus_lanceolatus'; 
metaData.species_en = 'Sharptail mola'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'biCij'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'R_L'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 105 * 365; units.am = 'd';   label.am = 'life span for females';   bibkey.am = 'Wiki';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.amm = 85 * 365; units.amm = 'd';   label.amm = 'life span for males';    bibkey.amm = 'Wiki';   
  temp.amm = C2K(21);  units.temp.amm = 'K'; label.temp.amm = 'temperature'; 

data.Lp  = 100;   units.Lp  = 'cm';  label.Lp  = 'stnadard length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'estimate, derived from other species';
data.Li  = 0.85*337;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';    bibkey.Li  = 'fishbase';
  comment.Li = 'based on total length of 337 cm, converted to standard length based on photo';

data.Wwb = 9e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'PopeHays2010';
  comment.Wwb = 'based on egg diameter of 1.3 mm for mola mola: pi/6*0.12^3';

data.Ri  = 2.5e8/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.45';
  
% univariate data

% time-length 
data.tL_f = [ ... % time since birth (yr), standard length (cm)
2.403	41.937
3.042	76.453
3.224	70.822
3.589	83.855
3.650	50.054
3.772	86.675
3.802	81.042
4.380	74.008
4.471	64.150
4.502	84.925
4.776	79.648
4.837	82.817
5.141	86.695
5.141	89.512
5.171	91.625
5.202	84.583
5.232	81.767
5.262	86.697
5.262	93.739
5.323	82.825
5.384	86.347
5.475	84.587
5.506	86.701
5.506	88.813
5.506	89.517
5.597	93.744
5.810	102.198
5.840	87.762
5.962	89.524
6.084	100.441
6.175	95.513
6.205	91.992
6.327	97.628
6.327	100.445
6.570	93.054
6.631	98.337
6.844	95.171
7.118	101.161
7.179	103.626
7.209	104.683
7.300	110.670
7.331	100.460
7.361	93.770
7.392	96.235
8.213	106.459
8.395	102.588
8.456	106.814
8.487	98.716
8.608	101.183
9.217	116.332
9.278	109.995
9.430	115.631
9.430	120.561
9.490	112.815
9.764	128.312
10.190	126.206
10.829	129.032
10.951	134.668
10.951	138.893
11.559	129.395
12.167	131.869
12.289	135.744
12.745	136.102
13.749	139.638
13.962	138.937
13.992	142.811
14.753	148.808
15.757	158.682
15.757	161.499
16.821	162.571
18.373	154.495
19.224	170.705
19.711	174.233
20.745	178.473];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'LiuaLeea2009';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), standard length (cm)
1.338	38.400
1.338	40.865
2.312	48.273
2.646	48.982
4.471	68.375
4.471	71.192
4.624	78.941
4.684	72.604
4.745	75.774
5.232	79.654
5.475	78.249
5.567	82.124
5.688	88.112
5.719	85.999
5.779	83.183
6.023	81.779
6.114	85.301
6.722	89.887
6.783	86.015
6.935	99.398
7.118	92.358
7.148	88.133
7.422	91.658
7.422	100.461
7.422	105.391
7.544	96.590
7.665	93.774
7.939	109.976
8.061	102.935
8.517	108.928
8.639	112.099
8.760	102.241
8.760	100.481
8.791	106.467
8.882	113.511
9.217	119.149
9.247	108.586
9.673	123.381
9.856	116.694
10.190	122.333
10.281	113.883
10.342	116.701
10.403	111.068
10.403	123.744
10.707	132.551
10.829	121.286
10.890	124.808
11.255	129.038
11.316	120.236
11.468	126.225
11.498	122.000
11.802	129.751
12.137	136.094
12.228	131.870
12.471	134.338
12.897	132.231
13.202	140.687
13.992	140.346
14.753	144.583
14.966	151.276
15.909	145.656
15.909	150.586
16.030	158.686
16.304	152.352];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'LiuaLeea2009';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... % standard length (cm), weight (kg)
41.314	5.672
49.993	7.898
59.354	25.375
64.920	12.336
71.501	33.065
74.974	31.994
81.896	60.349
81.920	29.854
82.962	29.860
83.634	58.180
83.648	39.665
84.692	37.493
85.728	44.033
86.416	52.750
86.760	56.019
87.099	66.912
88.141	66.918
88.850	48.407
90.233	56.038
90.571	66.931
90.887	107.229
92.304	71.297
92.321	49.515
92.665	53.873
92.667	51.695
93.357	57.144
95.082	71.312
96.465	78.943
96.483	56.072
96.489	48.448
96.818	71.321
96.826	61.519
97.500	86.572
98.545	83.311
98.894	80.045
99.948	64.804
100.621	92.035
100.967	93.126
100.978	80.057
100.985	71.344
101.309	99.662
103.400	89.872
105.144	80.079
105.830	90.974
106.504	117.117
106.877	84.445
109.627	119.312
109.648	93.173
109.666	70.302
109.981	110.601
110.681	104.070
112.403	121.505
112.424	95.367
116.223	121.526
116.574	116.082
120.407	98.677
125.953	111.777
127.314	146.636
128.003	153.174
130.788	144.476
130.795	135.764
134.242	167.367
135.932	226.188
136.985	210.946
138.739	189.173
138.746	180.460
139.752	225.119
141.841	217.507
142.197	206.618
150.876	208.843
152.593	232.813
156.749	246.994
158.135	250.269
162.291	263.361
168.874	281.912
174.059	311.346
177.171	327.699
179.939	339.695
188.243	376.770
190.035	307.076
190.662	392.030
194.121	408.386];
data.LW_f(:,2) = data.LW_f(:,2) * 1e3; % convert kg to g
units.LW_f   = {'cm', 'g'};  label.LW_f = {'standard length', 'wet weight', 'female'};  
bibkey.LW_f  = 'LiuaLeea2009';
%
data.LW_m = [ ...  % standard length (cm), weight (kg)
38.538	3.479
41.316	3.494
48.258	6.799
69.770	26.520
73.241	27.628
77.390	50.522
78.783	45.084
78.791	35.282
80.162	57.072
80.166	52.716
81.564	40.743
86.057	66.906
87.459	50.577
88.507	42.959
89.179	71.280
91.608	73.471
92.325	45.158
94.383	76.753
94.387	71.308
94.728	80.023
98.189	94.200
103.415	71.357
103.747	90.963
104.800	76.810
105.499	70.279
105.822	100.776
106.507	112.760
107.230	76.823
107.554	106.231
107.906	100.788
108.958	87.724
110.688	95.357
112.051	128.038
112.065	109.523
116.915	123.708
117.254	134.601
117.967	110.644
118.985	141.145
119.343	128.078
119.708	105.208
122.108	143.340
122.817	124.829
122.827	112.849
124.207	123.748
125.923	149.896
125.938	130.292
128.697	154.267
128.708	140.109
129.769	115.065
130.075	167.344
131.517	100.916
131.801	180.423
131.805	176.066
132.485	193.496
133.554	159.739
137.692	195.702
139.744	234.921
139.796	169.575
140.120	198.983
141.520	184.832
142.558	189.194
144.641	189.205
147.736	227.341
149.466	236.063
149.492	202.301
151.202	236.073
151.922	203.403
157.784	254.623
160.558	260.084];
data.LW_m(:,2) = data.LW_m(:,2) * 1e3; % convert kg to g
units.LW_m   = {'cm', 'g'};  label.LW_m = {'standard length', 'wet weight', 'male'};  
bibkey.LW_m  = 'LiuaLeea2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Ri = 0 * weights.Ri;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and h_a only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3YDT9'; % Cat of Life
metaData.links.id_ITIS = '173419'; % ITIS
metaData.links.id_EoL = '46570740'; % Ency of Life
metaData.links.id_Wiki = 'Masturus_lanceolatus'; % Wikipedia
metaData.links.id_ADW = 'Masturus_lanceolatus'; % ADW
metaData.links.id_Taxo = '47095'; % Taxonomicon
metaData.links.id_WoRMS = '127404'; % WoRMS
metaData.links.id_fishbase = 'Masturus-lanceolatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Masturus_lanceolatus}}';
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
bibkey = 'LiuaLeea2009'; type = 'Article'; bib = [ ... 
'author = {Kwang-Ming Liua and Mei-Ling Leea and Shoou-Jeng Joung and Yung-Chou Chang}, ' ... 
'year = {2009}, ' ...
'title = {Age and growth estimates of the sharptail mola, \emph{Masturus lanceolatus}, in waters of eastern {T}aiwan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {95}, ' ...
'pages = {154-160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PopeHays2010'; type = 'Article'; bib = [ ... 
'author = {Pope, E. C. and Hays, G. C. and Thys, T. M. and Doyle, T. K. and Sims, D. W. and Queiroz, N. and Hobson, V. J. and Kubicek, L. and Houghton, J. D. R.}, ' ... 
'year = {2010}, ' ...
'title = {The biology and ecology of the ocean sunfish \emph{Mola mola}: a review of current knowledge and future research perspectives}, ' ...
'journal = {Rev Fish Biol Fisheries}, ' ...
'doi = {10.1007/s11160-009-9155-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Masturus-lanceolatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

