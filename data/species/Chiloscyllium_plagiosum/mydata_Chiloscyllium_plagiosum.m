function [data, auxData, metaData, txtData, weights] = mydata_Chiloscyllium_plagiosum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Orectolobiformes'; 
metaData.family     = 'Hemiscylliidae';
metaData.species    = 'Chiloscyllium_plagiosum'; 
metaData.species_en = 'Whitespotted bamboo shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMr', '0iMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ah'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Ww0'; 'Wwh'; 'Wwi'; 'Ri'; 'GSI'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Ww'; 't-WwYe'; 't-WwVe'; 't-JOe'}; % tags for different types of uni-variate data

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2012 07 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data;
data.ah = 126;     units.ah = 'd';   label.ah = 'age at hatch';            bibkey.ah = 'TullPete2000';    
  temp.ah = C2K(25); units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'temps of all data are guessed; in egg capsule, if taken out of egg capsule at 20 d: ab = 118 d';
data.ap = 4*365;   units.ap = 'd';   label.ap = 'age at puberty';          bibkey.ap = 'TullPete2000';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 25*365;  units.am = 'd';   label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh  = 6*3.54; units.Lh  = 'cm'; label.Lh  = 'total length at hatch';  bibkey.Lh  = 'Wiki';
data.Lp  = 66;     units.Lp  = 'cm'; label.Lp  = 'total length at puberty';bibkey.Lp  = 'Tung2009';
%  the same for males and females
data.Li  = 93;     units.Li = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki';

data.Ww0  = 8.6;    units.Ww0  = 'g';  label.Ww0  = 'weight of external yolk sac at a = 0 d'; bibkey.Ww0  = 'TullPete2000';
data.Wwh  = 14.3;   units.Wwh  = 'g';  label.Wwh  = 'weight at hatch';        bibkey.Wwh  = 'TullPete2000';
data.Wwi  = 2200;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'TullPete2000';

data.RL  = 22/365; units.RL  = '#/d';label.RL  = 'reprod rate at L = 83.4 cm';bibkey.RL  = 'Tung2009';   
  temp.RL = C2K(25);  units.temp.RL = 'K'; label.temp.RL = 'temperature';
data.GSI  = 0.025; units.GSI  = '-'; label.GSI  = 'gonado somatic index';  bibkey.GSI  = 'Tung2009';   
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'GSI = g gonad/ g gonad-free body weight; Gonads peak in jan, so a single breeding season';

% uni-variate data at f
data.aW = [ ... % age (d), wet weight of embryo excluding yolk sak (g)
3.475	0.044
15.641	0.05
22.206	0.05
29.159	0.06
33.405	0.133
35.335	0.267
35.337	0.044
40.358	0.044
40.741	0.400
42.288	0.178
43.250	0.489
46.913	1.156
48.852	0.267
50.008	0.578
56.374	1.200
56.757	1.511
61.188	2.578
64.262	4.222
71.987	4.133
74.117	3.511
76.622	4.133
79.301	6.667
87.746	12.000
87.763	10.178
87.966	9.200
92.736	15.200
92.763	12.311
98.747	12.578
101.044	14.711
102.814	11.378
103.172	14.267
107.791	15.911
107.799	15.067
109.718	16.356
109.754	12.578
110.875	16.444
112.237	15.378
113.033	12.933
113.762	17.467
116.845	18.178
123.072	13.200
126.539	14.133
126.722	15.156
126.728	14.533
134.111	9.867];
units.aW = {'d', 'g'}; label.aW = {'age', 'embry weight (excl yolk)'};  
temp.aW = C2K(25); units.temp.aW = 'K'; label.temp.aW = 'temperature';
bibkey.aW = 'TullPete2000';
%
data.aY = [ ... % age (d), wet weight of yolk sak (g)
2.888	9.453
2.889	9.382
3.093	8.739
3.109	7.930
3.112	7.763
21.870	9.674
28.413	8.486
33.002	9.202
34.748	8.179
40.309	8.204
42.597	8.919
42.800	8.324
46.811	9.159
48.744	8.398
49.904	7.874
50.282	8.160
55.451	8.638
56.628	7.281
56.796	8.496
61.065	5.926
64.145	5.331
71.978	6.882
73.884	7.525
76.596	6.098
78.536	4.955
87.988	2.101
88.169	2.649
88.172	2.482
92.590	2.127
92.628	0.151
99.139	0.629
100.493	0.010
102.770	1.321
102.987	0.011
107.781	0.037
109.891	0.014
111.424	0.062
113.534	0.039
113.918	0.015
116.986	0.016
122.932	0.018
126.959	0.019
133.671	0.015];
units.aY = {'d', 'g'}; label.aY = {'age', 'yolk weight'};  
temp.aY = C2K(25); units.temp.aY = 'K'; label.temp.aY = 'temperature';
bibkey.aY = 'TullPete2000';
%
data.aJO = [ ... % age (d), O2-consumption (ml O2/d), pre-hatch
13.958	0.150
14.169	0.940
14.170	1.893
15.438	6.250
15.650	0.938
15.651	2.436
15.861	0.121
21.782	7.197
21.994	3.792
22.205	0.294
22.206	0.294
22.207	2.430
22.417	0.523
23.051	5.561
23.686	3.109
26.224	4.333
27.915	1.607
27.916	3.514
28.338	4.331
28.973	5.283
28.974	6.373
28.975	11.276
34.048	0.784
34.260	4.189
34.261	5.006
35.952	1.327
35.953	3.915
35.954	6.502
35.955	7.183
36.163	2.144
36.164	2.689
39.124	5.410
42.719	6.632
42.720	13.033
42.931	8.266
42.932	10.581
44.199	9.218
44.200	19.432
44.622	6.766
45.891	18.068
46.103	10.442
47.795	14.117
50.967	11.390
51.813	13.977
52.447	10.436
53.716	13.294
53.927	18.197
53.928	23.372
54.139	14.792
56.888	1.443
57.100	3.077
59.003	15.604
59.004	16.830
59.005	18.328
59.006	32.355
66.828	22.134
66.829	27.990
67.039	39.157
67.251	20.227
67.252	34.799
75.076	17.768
75.077	22.126
75.078	22.943
75.079	25.258
75.080	32.067
81.208	49.221
81.420	29.746
81.421	35.874
81.422	41.730
81.423	55.349
83.112	40.775
83.535	33.829
86.284	45.130
89.668	49.213
89.669	55.750
90.091	53.570
91.571	44.989
97.069	50.976
97.281	48.797
100.030	31.090
104.048	36.942
104.049	40.755
104.050	42.798
105.952	32.991
109.970	38.434
110.181	32.714
110.182	35.846
116.103	28.486
119.909	47.004
120.121	38.969
120.332	30.934
123.927	29.160
124.985	27.797
125.196	34.197
125.197	39.236
126.042	29.975
128.157	34.195
128.369	26.159
131.752	23.841
131.964	21.934
131.965	22.887
132.387	27.517
133.656	24.792
133.867	29.695
134.079	33.099
140.211	22.335
141.057	28.462
141.269	31.730
142.538	27.099];
units.aJO = {'d', 'ml O2/d'}; label.aJO = {'age', 'pre-hatch resp'};  
temp.aJO = C2K(25); units.temp.aJO = 'K'; label.temp.aJO = 'temperature';
bibkey.aJO = 'TullPete2000';
%
data.LW = [ ... total length (cm), wet weight (g)
18.902	17.084
20.717	28.474
21.668	28.474
22.100	28.474
22.532	28.474
23.483	34.169
24.953	51.253
26.595	62.642
27.200	62.642
28.237	56.948
28.842	62.642
29.879	79.727
30.917	85.421
31.608	96.811
32.299	79.727
32.473	113.895
33.251	102.506
34.892	96.811
35.932	159.453
36.709	159.453
37.833	153.759
38.958	193.622
39.128	136.674
39.909	205.011
40.342	239.180
40.426	165.148
40.946	205.011
41.463	165.148
41.465	233.485
41.896	193.622
41.984	233.485
41.984	233.485
42.589	261.959
42.936	284.738
43.453	227.790
43.886	267.654
44.057	210.706
44.059	284.738
44.493	324.601
44.749	227.790
45.269	279.043
45.527	233.485
45.529	307.517
46.049	335.991
46.393	296.128
46.824	261.959
47.086	341.686
47.258	313.212
47.948	279.043
48.038	375.854
48.209	330.296
48.816	375.854
49.159	301.822
49.250	427.107
49.593	353.075
49.940	387.244
50.109	301.822
50.891	415.718
51.061	330.296
51.235	364.465
51.756	427.107
52.100	381.549
52.189	466.970
52.620	415.718
52.704	364.465
53.224	404.328
53.313	472.665
53.916	410.023
54.000	353.075
54.005	489.749
54.008	569.476
54.090	455.581
54.698	529.613
54.781	449.886
55.130	552.392
55.214	478.360
55.730	398.633
55.733	484.055
55.737	592.255
55.821	529.613
56.255	575.171
56.511	495.444
56.516	632.118
56.854	410.023
57.033	580.866
57.202	489.749
57.207	632.118
57.808	523.918
57.899	632.118
58.069	563.781
58.587	541.002
58.848	603.645
59.020	580.866
59.369	677.677
59.459	785.877
59.714	637.813
60.234	683.371
60.322	734.624
61.013	723.235
61.096	632.118
61.527	592.255
61.617	689.066
61.874	637.813
62.136	700.456
62.138	780.182
63.176	791.572
63.602	626.424
63.693	757.403
63.777	700.456
63.867	797.267
63.872	922.551
64.125	763.098
64.565	990.888
64.818	814.351
64.909	939.636
64.990	774.487
65.080	894.077
65.161	717.540
65.338	837.130
65.605	1059.226
65.946	928.246
66.025	728.929
66.027	774.487
66.028	814.351
66.030	865.604
66.208	1019.362
66.468	1042.141
66.636	899.772
66.720	825.740
66.816	1093.394
67.067	859.909
67.070	956.720
67.332	1019.362
67.683	1190.205
67.934	928.246
68.104	865.604
68.111	1070.615
68.281	990.888
68.290	1230.068
68.460	1167.426
68.544	1082.005
68.632	1121.868
68.715	1025.057
69.238	1161.731
69.241	1241.458
69.491	973.804
69.591	1389.522
70.094	928.246
70.105	1241.458
70.272	1082.005
70.367	1338.269
70.534	1161.731
70.709	1218.679
70.955	831.435
71.225	1133.257
71.234	1412.301
71.483	1099.089
71.573	1218.679
72.014	1469.248
72.182	1332.574
72.348	1138.952
72.515	968.109
72.696	1190.205
72.866	1104.784
72.969	1583.144
73.124	1082.005
73.391	1292.711
73.735	1264.237
73.906	1201.595
73.997	1332.574
74.607	1480.638
74.681	1121.868
75.290	1230.068
75.373	1133.257
75.555	1395.216
75.651	1674.260
75.983	1275.626
76.178	1936.219
76.510	1543.280
76.516	1697.039
78.154	1600.228
78.160	1753.986
78.755	1492.027
79.010	1366.743
79.614	1326.879
79.899	2061.503];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  bibkey.LW = 'Tung2009';
%
% data from Tung2009
% combined sexes, females grow slightly slower to somewhat larger size
data.tL = [ ... time since hatch (yr), total length (cm)
0.011	14.650
0.975	49.877
0.985	39.177
0.985	44.444
0.985	46.255
1.981	41.811
1.981	45.926
1.981	48.724
1.981	51.687
1.981	58.601
1.992	43.621
1.992	44.938
1.992	46.914
1.992	50.370
1.992	56.132
2.967	61.235
2.967	63.704
2.977	56.132
2.977	58.765
2.977	65.514
2.988	42.634
2.988	46.420
2.988	48.230
2.988	49.383
2.988	50.700
2.988	52.675
2.988	53.827
2.988	54.815
2.988	57.449
3.984	52.510
3.984	53.992
3.984	63.210
3.984	64.527
3.984	66.008
3.984	72.593
3.995	59.753
3.995	60.741
3.995	61.728
3.995	66.996
4.970	76.543
4.980	53.333
4.980	54.815
4.980	59.918
4.980	72.263
4.991	61.399
4.991	65.021
4.991	67.160
4.991	73.086
5.976	66.996
5.976	78.683
5.987	67.819
5.987	69.465
5.987	71.440
5.987	72.099
5.987	76.049
6.983	71.440
6.993	79.177];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since hatch','total length'};
temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Tung2009';

%% set weights for all real data
weights = setweights(data, []);
weights.aW(45) = 0; % exclude outlier
weights.GSI = 0;    % exclude GSI

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'assume that hatch and birth coincide';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Oviparous';
metaData.bibkey.F1 = 'TullPete2000'; 
F2 = 'At a = 100 d: yolk is completely absorbed';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5Y4DD'; % Cat of Life
metaData.links.id_ITIS = '159942'; % ITIS
metaData.links.id_EoL = '46559713'; % Ency of Life
metaData.links.id_Wiki = 'Chiloscyllium_plagiosum'; % Wikipedia
metaData.links.id_ADW = 'Chiloscyllium_plagiosum'; % ADW
metaData.links.id_Taxo = '94273'; % Taxonomicon
metaData.links.id_WoRMS = '277832'; % WoRMS
metaData.links.id_fishbase = 'Chiloscyllium-plagiosum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chiloscyllium_plagiosum}}';  
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
bibkey = 'TullPete2000'; type = 'Article'; bib = [ ...
'author = {Tullis, A. and Peterson, G.}, ' ...
'year = {2000}, ' ...
'title = {Growth and Metabolism in the Embryonic White-Spotted Bamboo Shark, \emph{Chiloscyllium plagiosum}: {C}omparison with Embryonic Birds and Reptiles}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {73(3)}, '...
'pages = {271-282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tung2009'; type = 'Phdthesis'; bib = [ ...
'author = {Tung, S, Y.}, ' ...
'year = {2009}, ' ...
'title = {Age, growth, and reproductive biology of the whitespotted bamboo shark (\emph{Chiloscyllium plagiosum}) from {H}ong {K}ong and adjacent waters}, ' ...
'school = {Univ Hong Kong}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/5120}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

