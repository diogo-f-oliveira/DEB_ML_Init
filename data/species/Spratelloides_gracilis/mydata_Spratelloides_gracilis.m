function [data, auxData, metaData, txtData, weights] = mydata_Spratelloides_gracilis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Spratelloididae';
metaData.species    = 'Spratelloides_gracilis'; 
metaData.species_en = 'Silver-stripe round herring'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0iMcp', '0iMr'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 10]; 


%% set data
% zero-variate data;

data.am = 6*30.5;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'MiltBlab1991';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 4;   units.Lp  = 'cm';   label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 10.5; units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'Wiki';

data.Wwb = 4.8e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ShirWata2007';
  comment.Wwb = 'based on egg diameter of  0.45 mm: pi/6*0.045^3';
data.Wwi = 7.69;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.11, see F1';

data.Ri  = 1690*7.79/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length data
data.tL_Ali = [ % time since birth (d), standard length (cm)
33.619	3.764
34.291	3.174
35.546	3.353
35.563	3.430
35.563	3.430
35.932	3.276
36.800	3.532
37.163	3.353
38.833	3.583
38.940	4.045
39.005	4.327
41.723	3.839
41.770	4.044
41.859	4.429
42.436	3.429
42.543	3.890
43.685	3.582
43.880	4.429
44.933	3.736
45.700	3.556
45.831	4.121
45.931	4.556
46.253	4.197
47.044	4.120
47.543	4.530
48.262	4.146
48.947	3.607
49.915	4.299
50.635	3.915
50.736	4.350
52.335	4.273
52.388	4.504
52.615	3.735
54.867	4.734
55.303	3.119
55.492	3.939
55.510	4.016
55.599	4.401
57.293	4.734
57.871	3.734
59.137	3.964
59.356	4.913
60.373	4.067
61.070	3.579
62.579	4.861
63.127	3.733
63.827	5.015
64.462	6.015
65.160	3.784
65.391	4.784
66.385	3.835
66.937	4.476
67.085	5.117
67.115	5.245
68.371	3.681
68.394	3.783
69.749	4.398
69.886	4.988
70.158	6.168
70.385	5.398
71.646	3.860
71.901	4.962
71.943	5.142
72.092	4.039
72.621	4.577
72.668	4.783
73.341	4.193
74.887	3.885
76.074	5.526
76.664	4.577
76.782	5.090
78.245	4.423
79.113	4.679
79.772	5.781
80.539	5.602
81.818	5.884
82.472	5.217
82.782	4.806
83.423	5.832
86.397	4.703
87.769	5.395
90.177	5.318
96.765	5.830];  
units.tL_Ali = {'d', 'cm'};  label.tL_Ali = {'time since birth', 'standard length', 'Alifishi'};  
temp.tL_Ali = C2K(25);  units.temp.tL_Ali = 'K'; label.temp.tL_Ali = 'temperature';
bibkey.tL_Ali = 'MiltBlab1991';
comment.tL_Ali = 'Data from Alifishi';
%
data.tL_Thi = [ % time since birth (d), standard length (cm)
36.683	2.745
38.620	3.797
39.952	3.797
40.631	3.586
41.978	3.333
42.937	4.006
43.277	3.901
43.951	3.753
45.961	3.563
47.304	3.373
48.549	4.867
48.953	3.646
52.586	4.171
57.225	4.569
57.891	4.569
57.930	3.896
62.540	4.799
63.918	4.020
64.228	4.399
65.203	4.819
68.198	4.860
68.874	4.692
71.523	4.943
72.488	5.532
73.186	4.985
73.813	5.658
73.844	5.132
75.165	5.321
79.168	5.193
80.475	5.635
81.468	5.740
82.149	5.487
82.785	5.992
82.794	5.844
86.161	5.212
89.133	5.653
89.759	6.326
90.826	5.168
91.123	5.778
91.781	5.925
92.106	6.052
93.127	5.693
93.150	5.294
95.431	6.156
96.057	6.829
99.476	5.312
104.462	5.479
105.776	5.794
106.442	5.794
111.410	6.255
112.743	6.255
112.750	6.129
113.758	5.981
115.761	5.896
117.082	6.085
117.732	6.359
119.075	6.169
126.403	6.145];  
units.tL_Thi = {'d', 'cm'};  label.tL_Thi = {'time since birth', 'standard length', 'Thinadhoo'};  
temp.tL_Thi = C2K(25);  units.temp.tL_Thi = 'K'; label.temp.tL_Thi = 'temperature';
bibkey.tL_Thi = 'MiltBlab1991';
comment.tL_Thi = 'Data from Thinadhoo';
%
data.tL_Muf = [ % time since birth (d), standard length (cm)
28.959	2.450
32.538	2.727
35.141	2.855
37.744	3.110
41.323	3.281
42.625	3.878
46.855	4.390
47.831	4.176
50.108	4.773
51.410	4.517
53.037	5.200
53.362	4.880
54.013	4.175
55.965	5.178
55.965	5.050
56.291	5.285
56.616	4.666
56.941	4.516
57.592	4.858
59.870	4.601
60.846	5.199
61.171	4.964
61.171	4.686
61.822	4.964
63.774	5.284
64.100	5.027
65.727	4.856
66.377	4.515
70.282	5.026
98.265	5.769
101.844	5.982
114.534	6.066
123.644	5.339];  
units.tL_Muf = {'d', 'cm'};  label.tL_Muf = {'time since birth', 'standard length', 'Munda, fast'};  
temp.tL_Muf = C2K(25);  units.temp.tL_Muf = 'K'; label.temp.tL_Muf = 'temperature';
bibkey.tL_Muf = 'MiltBlab1991';
comment.tL_Muf = 'Data from Munda, fast';
%
data.tL_Mus = [ % time since birth (d), standard length (cm)
14.317	1.598
21.800	1.469
23.102	2.024
23.427	1.875
27.983	1.575
28.633	2.002
30.586	2.386
30.586	1.639
32.538	1.767
33.514	2.706
35.141	2.876
35.141	1.894
35.141	1.809
35.141	1.638
35.792	2.065
36.443	2.470
38.395	2.790
39.046	2.577
39.046	2.214
40.347	2.897
40.347	2.790
41.323	2.342
43.275	2.768
43.601	2.192
45.879	1.914
46.204	2.362
46.529	2.533
46.529	2.704
46.855	2.981
48.156	2.853
48.482	3.258
48.807	2.383
49.132	3.087
49.458	2.020
51.410	2.618
52.061	2.980
52.061	2.831
53.362	2.084
54.013	2.575
54.338	3.279
54.664	2.724
55.640	3.236
55.965	3.086
57.267	2.723
58.568	3.235
58.894	1.955
59.870	2.702
60.846	3.150
61.171	3.235
63.124	2.552
63.449	3.192
63.449	3.021
65.401	3.832
66.377	3.064
66.377	3.704
67.354	3.789
68.330	3.298
69.957	2.956
69.957	3.148
69.957	3.319
69.957	3.917
70.282	3.575
70.282	3.682
72.885	3.169
74.187	3.425
75.163	3.190
75.163	3.660
75.488	2.956
75.488	3.489
75.813	2.145
76.790	3.532
78.091	3.660
79.718	3.617
81.020	3.574
83.297	3.894
83.623	3.659
85.575	3.488
87.852	3.893
88.503	3.722
88.829	3.637
90.456	3.807
90.781	3.700
96.963	3.998
101.518	3.848
102.495	3.998];  
units.tL_Mus = {'d', 'cm'};  label.tL_Mus = {'time since birth', 'standard length', 'Munda, slow'};  
temp.tL_Mus = C2K(25);  units.temp.tL_Mus = 'K'; label.temp.tL_Mus = 'temperature';
bibkey.tL_Mus = 'MiltBlab1991';
comment.tL_Mus = 'Data from Munda, slow';
%
data.tL_Von = [ % time since birth (d), standard length (cm)
25.965	1.563
27.615	1.734
28.575	1.520
29.263	1.884
30.524	1.391
31.833	1.413
32.545	2.034
32.601	2.633
32.844	1.734
32.888	2.205
33.874	2.269
33.894	2.483
33.950	3.083
34.894	2.697
35.422	1.349
35.468	1.841
35.478	1.948
35.582	3.061
36.184	2.505
36.444	1.798
36.488	2.269
37.463	2.205
37.513	2.740
37.734	1.606
37.776	2.055
38.411	1.862
39.478	2.783
39.496	2.976
40.059	2.012
40.093	2.376
40.408	2.248
40.484	3.061
41.703	2.119
41.735	2.462
41.791	3.061
42.068	2.526
42.367	2.226
42.708	2.376
42.815	3.532
42.986	1.862
43.387	2.654
43.411	2.911
44.337	2.333
44.690	2.612
44.732	3.061
45.366	2.847
45.757	3.532
45.991	2.547
46.009	2.740
47.569	1.948
50.216	2.291
50.322	3.425
51.170	2.012
55.587	3.810
56.872	3.575
57.479	3.083
57.545	3.789
58.207	3.875
58.498	3.489
60.114	3.297
60.152	3.703
60.178	3.982
60.775	3.382
62.126	3.853
62.702	3.018
62.706	3.061
64.079	3.768
66.680	3.618
69.649	3.917
69.745	4.945
71.265	3.725
75.190	3.768
75.860	3.939
76.014	5.587
78.801	3.939
79.812	4.260
80.409	3.661
81.421	4.003
88.611	4.003
92.182	3.746];  
units.tL_Von = {'d', 'cm'};  label.tL_Von = {'time since birth', 'standard length', 'Vonavona'};  
temp.tL_Von = C2K(25);  units.temp.tL_Von = 'K'; label.temp.tL_Von = 'temperature';
bibkey.tL_Von = 'MiltBlab1991';
comment.tL_Von = 'Data from Vonavona';
%
data.tL_Tuf = [ % time since birth (d), standard length (cm)
31.433	2.814
32.068	3.159
32.379	3.460
36.293	3.268
38.873	3.765
38.885	3.506
39.225	3.183
39.537	3.463
41.474	3.809
46.678	3.854
47.340	3.596
47.919	5.147
47.926	4.996
48.262	4.759
48.911	4.803
50.526	5.062
51.195	4.674
52.188	4.309
53.115	5.365
53.826	4.073
55.433	4.504
59.306	5.173
59.643	4.915
67.735	5.845
70.701	5.028
72.648	5.136
75.266	4.814
77.172	5.806
79.124	5.828
90.842	5.725
90.858	5.381];  
units.tL_Tuf = {'d', 'cm'};  label.tL_Tuf = {'time since birth', 'standard length', 'Tulagi, fast'};  
temp.tL_Tuf = C2K(25);  units.temp.tL_Tuf = 'K'; label.temp.tL_Tuf = 'temperature';
bibkey.tL_Tuf = 'MiltBlab1991';
comment.tL_Tuf = 'Data from Tulagi, fast';
%
data.tL_Tus = [ % time since birth (d), standard length (cm)
41.567	1.806
46.742	2.476
46.763	2.023
48.371	2.412
48.392	1.959
50.649	2.413
53.266	2.112
54.516	3.233
54.893	2.113
56.799	3.105
57.156	2.437
59.401	3.127
59.732	2.998
61.016	3.386
61.657	3.602
62.321	3.301
63.660	2.504
68.196	2.916
68.813	3.648
68.824	3.411
69.131	3.799
70.112	3.692
70.780	3.326
70.789	3.132
70.837	2.098
71.103	3.391
72.071	3.563
73.040	3.715
74.085	2.229
75.310	3.866
75.348	3.048
76.632	3.436
76.691	2.165
77.922	3.674
77.926	3.588
78.590	3.308
80.876	3.137
81.505	3.589
81.822	3.783
82.544	2.254
83.141	3.396
84.757	3.634
86.381	3.699
87.693	3.484
88.325	3.872
88.341	3.527
89.631	3.786
90.637	3.141
93.218	3.616
93.221	3.551
94.186	3.788
95.817	3.703
97.769	3.704
100.056	3.511
100.363	3.899
103.945	3.836
105.582	3.621
106.213	4.052
108.514	3.536
109.802	3.838
112.716	4.141
132.588	3.633
146.887	4.005];  
units.tL_Tus = {'d', 'cm'};  label.tL_Tus = {'time since birth', 'standard length', 'Tulagi, slow'};  
temp.tL_Tus = C2K(25);  units.temp.tL_Tus = 'K'; label.temp.tL_Tus = 'temperature';
bibkey.tL_Tus = 'MiltBlab1991';
comment.tL_Tus = 'Data from Tulagi, slow';
%
data.tL_Liz = [ % time since birth (d), standard length (cm)
11.737	1.140
13.030	1.505
15.001	1.376
16.600	2.193
16.952	1.677
16.959	1.527
18.241	2.128
18.889	2.279
18.924	1.527
19.557	2.000
19.869	2.343
20.849	2.386
20.861	2.129
22.803	2.623
23.159	2.022
23.476	2.236
23.793	2.473
26.710	3.117
28.664	3.354
28.693	2.731
29.011	2.946
30.986	2.731
31.285	3.333
31.293	3.161
31.651	2.517
33.242	3.505
34.568	3.161
35.234	2.925
36.841	3.591
37.182	3.291
38.812	3.463];  
units.tL_Liz = {'d', 'cm'};  label.tL_Liz = {'time since birth', 'standard length', 'Lizard Island'};  
temp.tL_Liz = C2K(25);  units.temp.tL_Liz = 'K'; label.temp.tL_Liz = 'temperature';
bibkey.tL_Liz = 'MiltBlab1991';
comment.tL_Liz = 'Data from Lizard Island';
%
data.tL_Tow = [ % time since birth (d), standard length (cm)
19.524	1.544
19.530	1.674
20.839	1.458
23.479	1.524
23.488	1.697
27.442	1.655
29.746	1.591
30.410	1.678
31.741	1.938
34.042	1.809
34.721	2.221
34.725	2.307
34.728	2.372
36.353	1.874
37.380	2.676
38.713	2.980
39.011	2.308
39.028	2.677
39.346	2.417
39.972	1.724
39.985	1.984
40.322	2.157
40.691	2.981
40.966	1.832
41.978	2.309
43.290	2.180
45.276	2.332
45.289	2.614
45.293	2.700
45.301	2.874
46.297	3.026
47.276	2.809
48.271	2.940
48.589	2.680
50.266	3.287
51.261	3.417
51.574	3.071
52.563	3.071
53.905	3.570
55.554	3.570
56.206	3.419
57.236	4.286
57.517	3.246
58.516	3.463
58.824	3.008
59.165	3.246
59.843	3.636
61.809	3.399
64.438	3.204
68.426	3.899
69.737	3.726
71.068	3.986
71.075	4.138
71.719	3.813
75.020	3.901
75.360	4.118
76.347	4.075
78.314	3.837
82.283	4.120
82.609	4.033
86.880	3.731
92.491	3.863
94.145	3.993
97.782	4.211];  
units.tL_Tow = {'d', 'cm'};  label.tL_Tow = {'time since birth', 'standard length', 'Townsville'};  
temp.tL_Tow = C2K(25);  units.temp.tL_Tow = 'K'; label.temp.tL_Tow = 'temperature';
bibkey.tL_Tow = 'MiltBlab1991';
comment.tL_Tow = 'Data from Townsville';


%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 5 * weights.Ri;
weights.Lp = 5 * weights.Lp;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Ali', 'tL_Thi', 'tL_Muf', 'tL_Mus', 'tL_Von'}; subtitle1 = {'Data for loc Ali, Thi, Mus, Muf, Von'};
set2 = {'tL_Tuf', 'tL_Tus', 'tL_Liz', 'tL_Tow'}; subtitle2 = {'Data for loc Tuf, Tus, Liz, Tow'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00513*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'standard-total length: SL = TL * 0.87';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4ZDQ3'; % Cat of Life
metaData.links.id_ITIS = '551212'; % ITIS
metaData.links.id_EoL = '46562435'; % Ency of Life
metaData.links.id_Wiki = 'Spratelloides_gracilis'; % Wikipedia
metaData.links.id_ADW = 'Spratelloides_gracilis'; % ADW
metaData.links.id_Taxo = '187975'; % Taxonomicon
metaData.links.id_WoRMS = '212263'; % WoRMS
metaData.links.id_fishbase = 'Spratelloides-gracilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spratelloides_gracilis}}';
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
bibkey = 'MiltBlab1991'; type = 'Article'; bib = [ ... 
'author = {D. A. Milton and S. J. M. Blaber and N. J. F. Rawlinson}, ' ... 
'year = {1991}, ' ...
'title = {Age and growth of three species of tuna baitfish (genus: \emph{Spratelloides) in the tropical {I}ndp-{P}acific}}, ' ...
'journal = {Journal of fish Biology}, ' ...
'volume = {39}, ' ...
'pages = {849-866}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShirWata2007'; type = 'Article'; bib = [ ... 
'author = {Norio Shirafuji  and Yoshiro Watanabe and Yasuyuki Takeda and  Tomohiko Kawamura}, ' ... 
'year = {2007}, ' ...
'title = {Maturation and spawning of \emph{Spratelloides gracilis} {C}lupeidae in temperate waters off {C}ape {S}hionomisaki, central {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {73}, ' ...
'pages = {623-632}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Spratelloides-gracilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
