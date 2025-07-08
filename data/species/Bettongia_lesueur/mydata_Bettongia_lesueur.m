function [data, auxData, metaData, txtData, weights] = mydata_Bettongia_lesueur

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Potoroidae';
metaData.species    = 'Bettongia_lesueur'; 
metaData.species_en = 'Boodie'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 01]; 

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 165;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 218;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.317;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 300;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 1300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 litters per yr, 1 pup per litter';

% uni-variate data

% time-length data
data.tL = [ ... % time (d), head length (cm)
 0.517	0.694
 4.810	0.856
 7.781	0.937
13.067	1.197
14.389	1.262
19.010	1.375
22.315	1.554
23.635	1.586
26.937	1.683
27.600	1.797
27.602	1.862
32.886	2.057
35.195	2.057
35.196	2.057
38.170	2.252
41.800	2.300
43.122	2.381
45.104	2.479
48.401	2.445
48.407	2.608
48.727	2.331
51.371	2.494
52.366	2.640
54.023	2.868
54.678	2.738
55.343	2.900
59.968	3.128
61.290	3.193
63.598	3.176
63.599	3.209
65.910	3.257
65.914	3.387
69.873	3.436
73.176	3.565
74.499	3.663
75.825	3.875
76.480	3.744
78.135	3.907
81.102	3.874
82.433	4.199
84.080	4.134
86.391	4.215
87.053	4.296
89.375	4.671
90.692	4.621
92.335	4.426
93.995	4.735
96.309	4.897
96.966	4.832
100.259	4.669
101.910	4.717
103.574	5.173
104.230	5.043
105.888	5.303
107.537	5.303
108.186	4.977
109.191	5.466
110.841	5.482
113.479	5.449
114.788	5.155
117.109	5.530
117.445	5.692
120.079	5.562
122.054	5.431
123.388	5.871
126.356	5.870
128.002	5.756
128.327	5.626
130.974	5.886
134.602	5.853
135.590	5.820
135.929	6.097
138.234	5.982
141.536	6.080
142.520	5.933
144.836	6.144
146.815	6.144
147.805	6.144
148.792	6.062
150.779	6.322
151.763	6.159
155.061	6.143
155.728	6.354
158.692	6.207
161.334	6.337
165.292	6.320
170.902	6.401
170.902	6.401
171.237	6.564
173.877	6.596
176.516	6.595
177.833	6.546
180.476	6.676
184.764	6.659
184.771	6.871
187.406	6.757
191.690	6.658
191.700	6.951
195.982	6.788
196.968	6.657
198.623	6.853
202.907	6.722
205.889	7.145
206.207	6.770
208.839	6.558
212.149	6.916
213.806	7.176
216.436	6.883
223.034	6.947
227.655	7.044
230.617	6.848
232.934	7.092
233.925	7.140
236.555	6.863
239.857	6.977
241.518	7.335
244.148	7.058
247.118	7.106
247.788	7.432
250.746	7.105
255.691	7.023
258.992	7.104
261.299	7.039
261.631	7.104
268.564	7.298
268.881	6.907];
n=size(data.tL,1); for i=2:n; if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3; end; end
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'head length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Tynd1968';

% time-weight data
data.tWw = [ ... % time (d), weight (g)
11.512	1.920
11.531	1.147
13.827	1.616
14.483	1.775
21.719	3.111
23.700	2.922
26.985	4.248
33.897	6.174
38.494	10.826
38.826	10.170
40.144	10.656
45.739	15.013
45.741	14.104
48.046	15.728
52.984	20.179
53.316	18.956
53.972	21.144
54.947	31.240
54.955	25.104
55.290	21.811
58.907	29.331
60.888	27.980
61.533	41.342
61.539	35.364
61.543	31.701
61.551	25.876
61.875	29.780
65.495	37.039
67.141	40.668
67.149	33.195
67.804	37.610
69.436	58.228
69.777	43.955
70.434	47.521
70.436	43.951
71.422	48.262
74.391	48.241
75.057	41.261
75.368	68.012
77.023	58.164
77.671	79.483
79.987	65.877
81.314	52.927
82.279	103.586
82.282	94.320
84.266	81.927
87.229	95.736
87.234	83.181
87.901	70.043
89.535	105.106
90.515	134.928
90.524	105.091
94.488	89.843
94.806	124.714
94.813	101.796
96.772	175.802
98.097	150.351
101.071	130.578
101.721	170.273
101.735	117.043
102.700	225.519
105.342	205.266
108.650	157.323
108.653	147.795
108.968	215.000
109.619	271.737
111.601	251.250
113.254	228.719
115.568	201.785
116.868	332.564
118.188	332.500
121.491	288.758
122.816	246.954
124.779	388.338
126.098	388.264
128.740	353.395
130.063	326.784
131.371	432.791
132.691	432.708
135.662	400.029
137.644	375.693
138.624	482.286
140.270	521.336
142.583	467.185
144.564	445.670
146.536	537.390
147.527	512.716
149.503	554.204
150.165	528.783
152.143	545.406
153.786	637.455
153.789	580.429
156.424	657.431
156.757	598.590
160.049	699.448
163.017	721.332
165.659	656.551
172.249	778.879
172.254	698.211
175.546	828.697
177.197	790.573
177.523	868.203
178.848	742.514
182.804	789.930
183.791	840.736
184.456	730.412
184.778	908.896
186.100	840.455
189.069	827.073
190.716	866.543
191.049	814.022
193.355	866.212
193.359	788.722
198.631	893.014
198.634	825.927
199.620	921.219
203.248	920.734
205.227	934.960
205.229	878.334
206.218	892.032
210.506	877.662
211.830	786.612
214.790	993.857
214.794	890.923
218.421	918.710
219.077	1008.875
220.399	932.905
222.374	1040.390
225.014	1008.007
226.332	1039.793
229.398	1092.598
231.545	1007.052
234.117	1027.326
234.972	1091.715
235.833	1006.426
239.260	1091.037
240.118	1090.901
241.833	1090.630
241.836	1005.550
243.549	1068.442
246.123	1025.539
248.697	1004.550
249.977	1181.511
250.410	1067.379
252.554	1045.599
253.837	1157.114
256.846	944.068
263.272	1109.546
263.695	1278.931
265.845	1086.838
267.989	1086.500
270.134	1064.330
270.987	1202.078];
n=size(data.tWw,1); for i=2:n; if data.tWw(i,1)<=data.tWw(i-1,1); data.tWw(i,1)=data.tWw(i-1,1)+1e-3; end; end
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Tynd1968';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.tL = 5 * weights.tL;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'LP3D'; % Cat of Life
metaData.links.id_ITIS = '552700'; % ITIS
metaData.links.id_EoL = '47048643'; % Ency of Life
metaData.links.id_Wiki = 'Bettongia_lesueur'; % Wikipedia
metaData.links.id_ADW = 'Bettongia_lesueur'; % ADW
metaData.links.id_Taxo = '60280'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000181'; % MSW3
metaData.links.id_AnAge = 'Bettongia_lesueur'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bettongia_lesueur}}';
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
bibkey = 'Tynd1968'; type = 'Article'; bib = [ ... 
'doi = {10.1071/zo9680577}, ' ...
'author = {Tyndale-Biscoe, C. H.}, ' ... 
'year = {1968}, ' ...
'title = {Reproduction and post-natal development in the marsupial \emph{Bettongia lesueur} ({Q}uoy \& {G}aimard)}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {16(4)}, ' ...
'pages = {577-602}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Bettongia_lesueur}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

