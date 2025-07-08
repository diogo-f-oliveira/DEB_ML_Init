function [data, auxData, metaData, txtData, weights] = mydata_Furcifer_labordi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Chamaeleonidae';
metaData.species    = 'Furcifer_labordi'; 
metaData.species_en = 'Labords chameleon'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 4*30.5;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'At constant temp in lab; in the field 8 month, with temp down to 20 C ';
data.tp = 60;   units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'KarsAndr2008';
  temp.tp = C2K(27); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 0.6*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'KarsAndr2008';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching for females'; bibkey.Lb  = 'KarsAndr2008';  
data.Lp  = 7;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';  bibkey.Lp  = 'KarsAndr2008';  
data.Li  = 7.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for female';     bibkey.Li  = 'KarsAndr2008';
  comment.Li = 'Total length 7 cm';
data.Lim = 10;   units.Lim = 'cm';  label.Lim  = 'ultimate SVL for male';      bibkey.Lim  = 'KarsAndr2008';
  comment.Lim = 'Total length 9 cm';

data.Wwb = 4.4/11;units.Wwb = 'g';  label.Wwb = 'wet at birth';                bibkey.Wwb = 'KarsAndr2008';
data.Wwi = 7.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'Meir2010';
  
data.Ni  = 11;    units.Ni  = '#'; label.Ni  = 'life time reproductive output';     bibkey.Ni  = 'KarsAndr2008';   
  temp.Ni = C2K(27); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (d), SVL (cm)
7.708	1.999
8.538	3.295
12.296	2.541
13.810	2.423
15.326	2.352
16.859	2.611
19.886	2.375
19.892	2.493
19.897	2.588
23.682	2.328
24.488	3.177
27.480	2.304
27.509	2.846
32.836	2.988
35.078	2.304
35.864	2.775
37.373	2.587
53.397	3.835
57.211	4.118
57.233	4.518
59.450	3.363
60.934	2.703
60.995	3.835
61.722	3.222
63.254	3.458
63.284	4.000
64.075	4.589
64.789	3.740
65.521	3.222
65.563	4.000
66.385	5.154
67.094	4.212
67.872	4.542
68.587	3.717
68.600	3.952
68.650	4.871
70.857	3.551
71.661	4.353
72.386	3.716
72.387	3.740
72.399	3.952
73.171	4.188
73.203	4.777
73.984	5.154
75.493	4.965
76.936	3.551
76.950	3.810
77.686	3.363
77.726	4.117
78.624	6.662
79.270	4.565
80.749	3.810
80.868	6.002
82.256	3.575
83.848	4.918
86.159	5.483
86.835	3.951
86.856	4.328
86.944	5.955
86.961	6.261
87.633	4.658
87.677	5.460
88.465	5.978
89.926	4.894
91.504	5.978
92.208	4.941
92.247	5.672
92.976	5.106
92.996	5.460
93.039	6.261
94.545	6.002
95.219	4.422
95.230	4.635
96.007	4.941
97.555	5.459
97.584	6.001
99.124	6.378
99.888	6.449
100.703	7.463
102.903	6.001
104.366	4.964
119.574	5.175
119.588	5.435
119.601	5.670
119.619	6.000
127.968	5.835
128.059	7.508
135.565	5.811
135.595	6.377
136.372	6.683
140.867	5.504
140.941	6.871
143.216	6.801
144.672	5.622
149.252	5.999
149.262	6.188
152.265	5.527
152.309	6.329
153.799	5.787
155.368	6.706
156.880	6.564
159.170	6.753
162.977	6.894
169.059	6.964
169.769	6.045
204.806	7.623
205.532	6.986
206.306	7.245
206.311	7.340
210.134	7.787
210.155	8.164
210.858	7.127
211.597	6.750
211.633	7.410
211.640	7.528
214.687	7.669
214.699	7.905
218.506	8.046
219.234	7.457
219.248	7.716
219.275	8.211
229.856	7.174
229.903	8.046
232.909	7.433
232.929	7.786
233.682	7.668
233.709	8.163
234.420	7.268
238.992	7.503
239.777	7.975
240.478	6.890
240.520	7.668
242.023	7.362
289.150	7.689
382.532	6.294
382.538	6.412
383.337	7.119
387.095	6.365
387.875	6.742
387.884	6.907
388.591	5.941
399.249	6.317
400.027	6.647
419.016	6.528
419.803	7.023
487.424	6.973
497.331	7.515
506.440	7.349
526.915	6.618];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KarsAndr2008';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since birth (yr), total (cm)
0       3.298
0       3.272
0.940	3.295
7.707	1.975
10.781	2.612
15.338	2.588
16.088	2.399
19.887	2.399
21.418	2.611
22.925	2.375
25.256	3.318
29.002	2.351
36.598	2.304
37.429	3.624
38.132	2.563
38.158	3.058
38.247	4.684
55.702	4.306
56.498	4.966
56.509	5.178
56.526	5.485
58.823	5.815
59.562	5.438
60.225	3.646
61.851	5.602
63.418	6.474
64.991	7.464
65.669	5.956
65.682	6.191
65.707	6.663
65.723	6.946
66.263	2.892
67.168	5.579
67.977	6.474
70.092	3.457
70.280	6.922
74.814	6.450
76.291	5.672
76.321	6.215
77.797	5.413
77.885	7.039
78.748	8.948
79.374	6.474
81.656	6.521
81.684	7.039
82.372	5.719
82.468	7.487
83.107	5.248
83.953	6.851
86.215	6.520
89.307	7.487
90.810	7.180
91.555	6.921
93.826	6.756
95.379	7.369
96.874	6.921
98.300	5.200
98.354	6.190
99.171	7.250
99.196	7.698
99.899	6.661
105.205	6.425
118.158	7.085
118.942	7.532
120.391	6.236
120.408	6.542
120.428	6.920
120.485	7.957
121.215	7.414
122.035	8.522
125.004	7.226
126.470	6.236
126.507	6.919
127.245	6.519
127.315	7.815
128.798	7.131
131.778	6.047
131.902	8.333
132.487	5.104
134.867	6.966
136.425	7.673
138.681	7.225
138.695	7.484
141.656	6.046
144.085	8.804
144.751	7.083
144.892	9.676
145.566	8.097
146.283	7.295
146.308	7.767
146.333	8.215
150.940	9.110
151.725	9.581
153.115	7.177
153.903	7.696
156.159	7.271
160.018	8.379
161.496	7.601
162.323	8.850
162.941	6.234
163.854	9.062
167.651	9.015
169.140	8.449
171.391	7.931
172.169	8.261
172.979	9.180
173.036	10.240
173.770	9.769
173.793	10.193
176.729	8.284
176.746	8.590
178.231	7.954
206.350	8.070
208.695	9.272
210.247	9.861
211.022	10.144
211.751	9.579
213.332	10.710
214.055	10.026
214.784	9.461
215.487	8.423
215.530	9.201
217.878	10.474
218.653	10.757
220.830	8.871
220.848	9.201
229.989	9.625
230.735	9.366
230.775	10.096
232.372	11.534
235.285	9.200
236.071	9.695
236.075	9.766
236.101	10.237
236.106	10.332
236.772	8.611
239.172	10.826
241.372	9.365
241.386	9.624
242.172	10.096
284.714	9.952
284.734	10.329
289.349	11.366
382.607	7.685
382.618	7.874
382.676	8.958
385.630	7.378
393.347	9.570
395.601	9.099
399.394	8.981
400.099	7.967
421.446	9.309
421.454	9.451
428.312	9.804
429.716	7.683
429.730	7.942
429.754	8.390
433.607	9.380
486.177	11.993
486.869	10.744
498.217	9.848
527.874	10.294];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
temp.tL_m   = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KarsAndr2008';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Single clutch during seasonal life span as juvenile/adult';
metaData.bibkey.F1 = 'KarsAndr2008';
F2 = 'Known for its agressive sex life, which might relate to its huge maintenance in the waste-to-hurry tetrapod';
metaData.bibkey.F2 = 'Kooy2013';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6K4XX'; % Cat of Life
metaData.links.id_ITIS = '715204'; % ITIS
metaData.links.id_EoL = '1056897'; % Ency of Life
metaData.links.id_Wiki = 'Furcifer_labordi'; % Wikipedia
metaData.links.id_ADW = 'Furcifer_labordi'; % ADW
metaData.links.id_Taxo = '641166'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Furcifer&species=labordi'; % ReptileDB
metaData.links.id_AnAge = 'Furcifer_labordi'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Furcifer_labordi}}';
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
bibkey = 'KarsAndr2008'; type = 'Article'; bib = [ ... 
'author = {K. B. Karsten and L. N. Andriamandimbiarisoa and S. F. Fox and Ch. J. Raxworthy}, ' ... 
'year = {2008}, ' ...
'title = {A unique life history among tetrapods: {A}n annual chameleon living mostly as an egg}, ' ...
'journal = {PNAS}, ' ...
'volume = {105}, ' ...
'pages = {8980--8984}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Meir2010'; type = 'Article'; bib = [ ... 
'author = {S. Meiri}, ' ... 
'year = {2010}, ' ...
'title = {Length-weight allometries in lizards}, ' ...
'journal = {J. Zool.}, ' ...
'volume = {281}, ' ...
'pages = {218--226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2013'; type = 'Article'; bib = [ ... 
'author = 	 {Kooijman, S. A. L. M.}, ' ...
'title = 	 {Waste to hurry: {D}ynamic {E}nergy {B}udgets explain the need of wasting to fully exploit blooming resources.}, ' ...
'journal = 	 {Oikos}, ' ...
'year = 	 2013, ' ...
'volume =    122, ' ...
'pages =     {348--357}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

