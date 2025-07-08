function [data, auxData, metaData, txtData, weights] = mydata_Thalassarche_chrysostoma

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Diomedeidae';
metaData.species    = 'Thalassarche_chrysostoma'; 
metaData.species_en = 'Grey-headed albatross';

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MS', 'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCic', 'biCik', 'biCit', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'}; 
metaData.date_subm = [2018 09 19];                          
metaData.email    = {'bas.kooijman@vu.nl'};     
metaData.address  = {'VU University Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 72;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(35.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '68 to 75 d';
data.tx = 145;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'HuinPrin2008';   
  temp.tx = C2K(39.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 145*3;    units.tp = 'd';    label.tp = 'time since birth at fledging'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'HuinPrin2008';
  temp.tR = C2K(39.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 47.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 187; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HuinPrin2008';
data.Wwi = 5e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'HuinPrin2008';
  comment.Wwi = 'asymptote for nestling; adults weigh less: 2.8 to 4.4 kg, with a mean mass of 3.65 kg (Wiki)';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'HeddGale1975';   
  temp.Ri = C2K(39.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1.329	207.508
1.709	248.972
2.085	217.659
2.462	175.949
2.841	217.413
2.843	290.191
3.975	248.236
4.356	341.685
5.109	237.471
5.113	372.630
5.869	382.781
6.433	299.422
6.627	455.314
7.376	247.131
7.569	371.832
7.948	413.297
8.329	517.142
8.515	413.113
8.900	620.927
9.650	454.332
9.656	631.078
9.842	558.239
10.408	526.864
11.351	495.367
11.544	620.068
11.547	703.243
12.303	702.997
12.684	806.843
13.054	588.386
13.439	775.407
13.623	650.583
13.815	733.697
14.948	722.932
14.957	972.456
15.322	598.047
15.523	951.478
16.283	1075.995
16.460	743.234
16.474	1159.109
17.035	992.575
17.038	1075.750
17.399	576.578
18.354	888.177
18.358	992.145
18.365	1200.082
18.745	1283.134
19.299	898.267
19.491	991.777
20.060	1064.371
20.242	866.769
20.257	1282.643
20.625	1001.806
20.818	1136.903
21.204	1355.115
21.376	866.401
22.724	1614.545
22.895	1105.038
23.268	969.756
23.467	1250.410
23.477	1551.918
24.411	1239.706
24.424	1624.390
24.596	1135.676
24.974	1145.950
24.983	1405.871
25.536	989.813
25.559	1655.212
25.938	1707.073
26.293	1041.552
26.297	1166.314
27.057	1290.831
27.072	1706.705
27.242	1155.610
27.249	1373.944
28.005	1384.096
28.020	1810.367
28.565	1196.768
28.575	1487.880
29.342	1809.937
29.510	1196.461
29.519	1466.780
29.899	1518.641
30.264	1154.628
30.461	1393.695
30.662	1757.523
31.020	1154.383
31.221	1528.608
31.591	1289.358
31.612	1913.169
32.165	1497.111
32.357	1580.224
32.373	2058.480
33.294	1361.584
33.318	2068.570
33.488	1527.872
33.680	1621.382
33.856	1247.034
34.251	1735.564
34.257	1901.913
34.264	2109.851
35.368	1267.337
35.388	1839.164
35.395	2047.101
35.940	1423.105
35.944	1527.074
36.149	1994.871
36.344	2171.557
36.909	2119.388
37.466	1848.886
37.639	1391.362
37.667	2202.318
38.413	1921.357
38.584	1391.056
38.610	2160.423
38.613	2233.201
38.802	2243.537
38.994	2337.047
39.150	1390.871
39.545	1889.798
39.938	2315.946
40.307	2076.696
40.477	1525.601
40.702	2565.226
41.252	2076.389
41.429	1722.834
41.644	2481.744
42.183	1691.398
42.196	2076.082
42.218	2689.497
42.782	2616.535
42.941	1753.534
43.169	2897.127
43.334	2200.476
43.542	2761.845
44.105	2657.693
44.270	1950.645
44.471	2304.077
44.868	2854.987
45.229	2366.212
45.243	2771.690
45.253	3073.199
45.591	1898.231
46.153	1762.888
46.360	2303.463
46.568	2854.435
46.752	2719.214
46.949	2937.487
47.329	3020.539
47.484	2022.379
47.499	2448.651
48.073	2666.801
48.237	1938.959
48.272	2978.645
48.275	3061.820
49.011	2500.144
49.594	2957.422
49.606	3310.915
49.755	2146.405
49.757	2198.390
50.342	2728.445
50.367	3456.225
50.526	2603.622
51.118	3331.218
51.262	2021.152
52.045	2831.861
52.071	3590.832
52.216	2311.957
52.427	2935.707
52.592	2249.453
52.796	2696.457
53.565	3091.292
53.584	3642.325
53.915	2280.214
54.311	2799.934
54.319	3018.268
54.329	3319.777
54.711	3434.020
54.855	2134.351
55.073	2997.229
55.825	2872.221
56.029	3329.622
56.226	3568.688
56.369	2227.432
56.575	2726.420
56.987	3713.999
57.125	2227.186
57.169	3516.397
57.341	3006.890
58.078	2476.404
58.094	2933.866
58.111	3432.915
58.501	3786.286
59.025	2548.875
59.231	3047.863
59.630	3650.758
59.632	3723.536
59.636	3837.902
60.173	2974.778
60.350	2631.621
60.579	3806.404
61.106	2631.375
61.150	3930.983
61.868	2839.067
61.898	3691.609
62.064	3036.546
62.282	3889.027
62.628	2963.584
63.011	3098.620
63.218	3618.402
63.749	2578.532
64.126	2557.615
64.170	3836.429
64.332	3077.397
65.080	2858.817
65.108	3669.772
65.117	3929.694
65.655	3087.364
66.061	3898.196
66.405	2920.769
66.634	4085.156
66.799	3388.505
66.966	2764.632
67.191	3804.256
67.193	3877.034
67.195	3929.019
67.911	2764.325
67.942	3668.852
67.951	3928.773
68.339	4240.556
68.716	4219.640
69.075	3658.086
69.424	2826.215
69.462	3928.282
69.608	2670.201
69.830	3637.047
69.836	3824.191
70.026	3844.923
70.230	4302.324
70.404	3855.197
70.772	3584.756
70.802	4437.299
71.157	3782.174
71.307	2659.251
72.105	3885.835
72.511	4696.668
72.667	3740.095
72.859	3844.002
73.265	4654.835
73.394	2908.101
73.630	4290.822
73.954	2720.773
73.987	3687.681
74.187	3989.129
74.764	4290.454
74.936	3812.137
75.467	2782.664
75.512	4092.668
76.075	3967.721
76.258	3790.913
76.272	4217.185
76.802	3146.124
77.017	3884.240
77.366	3052.368
77.424	4736.659
77.786	4299.869
78.166	4341.333
78.173	4570.064
78.716	3873.290
78.740	4569.880
79.075	3332.531
79.088	3696.421
79.257	3114.136
79.295	4226.600
79.679	4413.620
80.240	4226.293
80.412	3758.373
81.007	4579.540
81.342	3321.398
81.373	4225.924
81.550	3872.370
82.130	4267.266
82.133	4340.044
82.285	3279.503
82.296	3612.203
83.043	3341.639
83.267	4360.470
83.436	3798.978
83.458	4422.790
83.655	4661.856
84.552	3278.767
84.586	4287.262
84.761	3860.930
84.977	4671.823
85.302	3122.568
85.340	4224.636
85.513	3756.715
86.080	3777.325
86.121	4962.567
86.283	4182.741
86.643	3673.172
86.679	4712.858
87.201	3413.067
87.215	3808.147
87.628	4858.107
88.162	3901.412
88.365	4306.828
88.762	4857.739
88.899	3360.530
88.928	4181.882
89.276	3318.820
89.293	3828.266
89.690	4379.177
89.837	3173.080
90.076	4618.182
90.428	3879.882
90.633	4337.283
90.646	4701.173
91.350	3224.573
91.379	4066.719
92.132	3972.901
92.347	4752.605
92.683	3525.652
93.097	4586.009
93.275	4253.248
93.625	3462.964
93.646	4065.982
93.813	3410.919
94.038	4471.337
94.597	4242.422
94.782	4127.995
95.139	3535.251
95.166	4325.413
95.178	4668.509
95.723	4044.513
95.736	4418.800
96.100	4013.200
96.486	4262.602
96.643	3326.823
97.413	3742.452
97.619	4231.043
97.813	4376.538
97.969	3419.965
97.990	4043.777
98.183	4147.684
98.947	4396.963
99.311	3991.363
99.484	3544.237
99.505	4157.651
100.049	3492.068
100.066	3991.117
100.284	4843.599
100.823	4032.459
101.033	4635.416
101.175	3283.763
101.202	4073.924
101.395	4167.434
101.396	4209.022
101.936	3418.676
101.975	4572.728
102.334	4021.572
102.687	3293.669
102.721	4281.370
103.090	4042.120
103.471	4114.775
103.474	4208.347
103.484	4499.459
104.012	3376.414
104.027	3823.479
104.246	4696.754
104.411	3979.309
104.977	3979.125
105.358	4072.574
105.381	4727.576
105.518	3230.367
105.731	3916.498
106.129	4498.600
106.465	3292.441
107.048	3760.116
107.247	4071.960
107.262	4498.231
107.409	3281.737
107.431	3915.946
107.973	3208.775
108.209	4560.306
108.757	4040.278
109.100	3021.264
109.337	4424.778
109.511	3988.049
109.513	4040.033
110.238	3135.261
110.265	3935.819
110.613	3072.757
110.639	3821.331
110.668	4663.476
111.741	2916.436
111.771	3779.375
111.776	3914.534
111.794	4465.568
112.554	4569.291
113.117	4485.932
113.276	3612.534
113.287	3934.837
113.445	3019.852
113.869	4371.321
114.198	2936.432
114.227	3799.371
114.235	4017.705
114.798	3913.552
115.340	3206.382
115.552	3871.719
116.136	4380.981
117.059	3746.466
117.065	3912.816
117.417	3174.516
117.812	3663.046
117.825	4037.333
117.987	3267.904
118.386	3881.195
118.739	3174.086
119.152	4192.856
119.155	4286.428
119.332	3922.476
120.060	3121.672
120.081	3735.087
120.085	3849.453
120.822	3318.967
120.848	4067.541
121.767	3308.263
122.348	3723.954
122.350	3786.335
122.547	4025.401
123.082	3120.690
123.296	3848.409
123.673	3827.493
123.848	3421.954
123.857	3681.875
124.218	3193.100
124.781	3078.551
124.801	3671.172
125.365	3577.416
125.375	3858.131
125.725	3067.847
126.117	3483.598
126.503	3701.810
126.877	3608.115
126.881	3722.481
127.046	3036.227
128.205	3774.035
128.210	3919.591
128.363	2869.447
129.876	2931.337
129.901	3659.118
129.916	4085.389
130.096	3825.406
130.468	3658.933
130.822	2962.221
131.044	3918.671
131.415	3721.008
131.574	2868.404
132.898	2909.562
132.923	3647.739
132.929	3824.485
133.463	2846.996
134.063	3824.117
134.249	3730.484
134.618	3480.837
134.967	2648.965
135.382	3730.116
135.719	2544.751
135.755	3584.437
136.510	3573.795
136.513	3656.969
136.666	2627.619
137.047	2700.274
137.070	3386.467
137.083	3771.151
137.457	3656.663
137.990	2679.174
138.207	3479.670
139.496	2512.333
139.530	3510.431
140.639	2782.283
141.037	3374.781
141.042	3520.337
141.573	2490.864
142.359	3374.352
142.521	2594.526
143.300	3280.473
144.415	2729.071];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HuinPrin2008';
  
%% set weights for all real data
weights = setweights(data, []); 
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'feeding rate is reduced towards the end of the nesting period';
D2 = 'mod_1: Puberty is assumed to coincide with fledging with a waiting time to first brood';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '55ZCB'; % Cat of Life
metaData.links.id_ITIS = '563381'; % ITIS
metaData.links.id_EoL = '45511494'; % Ency of Life
metaData.links.id_Wiki = 'Thalassarche_chrysostoma'; % Wikipedia
metaData.links.id_ADW = 'Thalassarche_chrysostoma'; % ADW
metaData.links.id_Taxo = '610029'; % Taxonomicon
metaData.links.id_WoRMS = '225760'; % WoRMS
metaData.links.id_avibase = '0E4475F65B2A8060'; % avibase
metaData.links.id_birdlife = 'grey-headed-albatross-thalassarche-chrysostoma'; % birdlife
metaData.links.id_AnAge = 'Thalassarche_chrysostoma'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Thalassarche_chrysostoma}}';
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
bibkey = 'HuinPrin2008'; type = 'Article'; bib = [ ... 
'author = {Huin, N. and Prince, P. A. and Briggs, D. R.}, ' ... 
'doi = {10.1111/j.1474-919x.2000.tb04456}, ' ...
'year = {2008}, ' ...
'title = {Chick provisioning rates and growth in Blackbrowed Albatross \empg{Diomedea melanophris} and Grey-headed Albatross \emph{D. chrysostoma} at {B}ird {I}sland, {S}outh {G}eorgia}, ' ...
'journal = {Ibis}, ' ...
'volume = {142}, ' ...
'pages = {550-565}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Thalassarche_chrysostoma}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

