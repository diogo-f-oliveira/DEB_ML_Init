function [data, auxData, metaData, txtData, weights] = mydata_Ornithoteuthis_antillarum

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Ornithoteuthis_antillarum'; 
metaData.species_en = 'Atlantic bird Squid'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 18]; 

%% set data
% zero-variate data

data.am = 182;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'ArkhLapt1998';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.0;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';   bibkey.Lp  = 'ArkhLapt1998';
data.Li  = 14.5;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female';      bibkey.Li  = 'ArkhLapt1998';

data.Wwb  = 2e-4;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'ArkhLapt1998';

data.Ni  = 22e4; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'ArkhLapt1998';   
  temp.Ni = C2K(21);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
9.756	0.311
13.937	0.445
20.557	0.623
21.951	0.580
28.223	1.065
35.192	0.849
39.721	1.421
40.070	1.597
41.812	2.036
41.813	1.422
47.038	1.819
47.735	2.565
51.916	3.093
51.917	2.786
55.401	3.445
57.840	3.315
58.188	3.140
59.582	3.052
61.324	3.053
68.990	3.890
77.352	7.841
77.700	7.052
78.746	7.842
79.443	6.877
82.578	7.931
83.624	8.063
84.321	9.028
85.017	7.230
85.366	7.713
86.760	9.205
86.761	8.942
90.244	8.592
91.986	7.847
91.987	8.111
94.774	8.813
95.470	7.235
95.471	6.533
96.864	8.376
96.865	7.586
110.105	8.952
117.073	9.086
117.074	10.885
124.390	11.809
132.056	8.479
133.798	7.646
136.237	9.972
139.373	9.403
140.070	11.728
147.735	12.784
148.780	8.530
150.871	10.154
150.872	12.873
152.962	10.330
158.885	10.552
160.976	10.465
162.718	10.992
163.763	10.247
165.505	13.011
170.035	13.803
182.230	11.615];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'mantle length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArkhLapt1998';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
10.757	0.223
14.229	0.224
19.428	0.622
21.864	0.402
35.052	0.669
39.549	1.376
40.594	1.244
41.618	1.994
42.672	1.465
47.158	2.702
47.871	1.863
58.539	6.013
61.022	3.763
61.038	3.058
62.067	3.631
62.726	5.131
63.122	3.058
65.532	3.941
66.195	5.309
69.699	3.898
71.371	6.677
72.090	5.619
72.749	7.163
74.494	6.766
78.979	8.003
80.397	6.768
81.079	7.297
83.872	6.636
84.212	6.945
85.226	8.136
86.300	6.769
88.718	7.299
89.749	7.740
91.848	7.079
92.174	8.006
98.055	8.933
98.752	8.845
101.203	7.963
101.542	8.316
101.872	9.022
101.883	8.581
106.746	8.494
108.537	6.112
109.535	8.009
111.948	8.760
119.888	10.747
119.955	7.835
124.071	10.042
124.148	6.733
125.171	7.528
126.842	10.351
128.240	9.955
129.003	6.999
132.012	11.985
134.121	10.882
136.885	11.501
147.342	9.738
148.378	10.003
149.378	11.768
152.885	10.269
155.671	9.917
173.072	8.200];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'mantle length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArkhLapt1998';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
53.032	1.395
54.046	1.396
56.748	1.398
77.952	13.312
82.362	10.604
84.005	17.383
84.330	19.341
85.694	17.384
87.708	19.343
90.080	18.291
91.804	13.172
94.822	16.487
95.204	10.011
95.856	13.476
96.869	13.477
98.220	13.628
110.680	19.511
117.465	15.299
118.052	28.402
124.123	29.913
133.714	10.492
140.278	38.961
148.086	33.395
149.680	47.552
153.214	24.513
165.309	34.462];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(21);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ArkhLapt1998';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
40.537	0.633
42.901	0.785
47.967	1.090
58.403	6.520
59.782	2.455
62.489	1.854
62.805	5.017
63.161	2.307
65.504	5.622
66.876	2.460
70.258	2.011
71.886	11.048
72.937	5.477
74.936	9.695
79.641	13.313
80.997	12.561
81.366	8.043
83.372	11.057
85.406	10.004
86.390	14.372
87.756	12.265
90.791	13.020
91.781	16.635
93.507	11.064
97.196	15.133
99.870	19.352
100.896	17.546
100.902	16.642
100.919	14.082
104.272	17.850
106.987	16.044
108.723	9.118
109.712	12.733
120.737	31.115
123.833	22.834
127.887	22.837
128.215	24.344
132.196	35.190
134.275	27.511
136.888	40.766
146.833	18.936
149.399	39.119
153.518	29.483];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(21);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ArkhLapt1998';
comment.tWw_m = 'Data for males';

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
1.396	0.069
1.878	0.089
2.360	1.203
2.640	1.216
3.046	1.236
3.173	2.149
6.574	9.745
7.183	13.581
7.614	13.239
7.741	17.415
7.766	10.709
7.944	10.355
8.401	13.640
8.655	18.546
8.782	16.740
8.807	19.098
8.934	19.648
9.036	15.483
9.086	19.655
9.239	19.481
10.254	24.787
11.066	28.452
11.701	39.540
11.802	29.393
12.817	47.751
12.817	33.249
13.046	34.529];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'ArkhLapt1998';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
3.756	1.270
3.832	1.999
3.934	2.004
5.203	4.784
5.355	5.698
5.736	5.173
6.066	6.458
6.193	8.639
6.675	10.837
6.777	12.474
6.777	9.211
7.157	10.498
7.411	8.154
7.411	12.504
7.487	12.327
7.817	12.887
7.995	16.339
8.096	12.538
8.147	14.171
8.274	14.359
8.325	17.443
8.553	15.823
8.985	15.300
9.086	17.298
9.797	18.783
10.051	24.233
10.152	23.151
10.254	23.155
11.015	27.905
11.523	40.981
11.853	39.003
12.030	35.024];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'ArkhLapt1998';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.am = 5 * weights.am;
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LWw_f','LWw_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74WC4'; % Cat of Life
metaData.links.id_ITIS = '82540'; % ITIS
metaData.links.id_EoL = '403180'; % Ency of Life
metaData.links.id_Wiki = 'Ornithoteuthis_antillarum'; % Wikipedia
metaData.links.id_ADW = 'Ornithoteuthis_antillarum'; % ADW
metaData.links.id_Taxo = '158115'; % Taxonomicon
metaData.links.id_WoRMS = '225573'; % WoRMS
metaData.links.id_molluscabase = '225573'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ornithoteuthis_antillarum}}';
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
bibkey = 'ArkhLapt1998'; type = 'article'; bib = [ ... 
'author = {A.I. Arkhipkin and V.V. Laptikhovsky and CH.M. Nigmatullin and A.V. Bespyatykh and S.A. Murzov}, ' ... 
'year = {1998}, ' ...
'title = {Growth, reproduction and feeding of the tropical squid \emph{Ornithoteuthis antillarum} ({C}ephalopoda, {O}mmastrephidae) from the central-east {A}tlantic}, ' ...
'journal = {SCI. MAR.}, ' ...
'volume = {62(3)}, ' ...
'pages = {273-288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Ornithoteuthis-antillarum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

