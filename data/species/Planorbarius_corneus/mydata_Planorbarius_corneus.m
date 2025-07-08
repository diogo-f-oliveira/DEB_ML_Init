function [data, auxData, metaData, txtData, weights] = mydata_Planorbarius_corneus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Planorbarius_corneus'; 
metaData.species_en = 'Great ramshorn'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L_T'; 't-Ww'; 't-S_T'; 'T-ab'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 16]; 

%% set data
% zero-variate data

data.Lb  = 0.15; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';
data.Lj  = 0.20; units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'Cost1994';
data.Lp  = 0.60; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Cost1994';
data.Li  = 3.50; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Ri  = 5000/336;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % age (wk), total length (cm)
1.883	0.284
2.757	0.335
3.134	0.387
3.884	0.445
4.137	0.503
4.638	0.554
5.014	0.599
5.765	0.664
5.893	0.735
6.020	0.799
6.396	0.825
7.021	0.870
7.769	0.883
8.394	0.909
9.017	0.909
9.516	0.928
10.139	0.934
10.764	0.973
11.389	0.999
11.639	1.018
12.264	1.050
12.390	1.095
12.517	1.134
12.891	1.147
13.267	1.173
13.642	1.205
13.768	1.224
14.143	1.250
14.767	1.269
15.141	1.289
15.641	1.314
16.264	1.308
16.764	1.340
16.889	1.347
17.140	1.379
17.391	1.411
17.766	1.437
18.265	1.463
18.765	1.482
19.138	1.463
20.011	1.482
20.635	1.501
20.885	1.514
21.385	1.546
22.133	1.546
22.384	1.585
22.882	1.585
23.504	1.566
24.126	1.546
25.123	1.546
25.622	1.546
25.996	1.553
26.868	1.553
27.243	1.579
27.867	1.591
28.365	1.591
28.864	1.591
28.990	1.617
29.614	1.649
29.989	1.662
29.990	1.695
31.237	1.701
31.860	1.695
32.483	1.695
33.106	1.707
33.855	1.733
33.981	1.765
34.356	1.785
34.981	1.811
35.604	1.811
36.226	1.798
36.724	1.798
37.347	1.785
37.970	1.778
38.343	1.778
38.718	1.785
39.341	1.798
39.716	1.817
40.092	1.849
40.591	1.869
40.964	1.856
41.711	1.849
42.335	1.869
42.710	1.875
43.208	1.881
43.708	1.901
44.207	1.920
44.707	1.952
45.330	1.946
45.827	1.920
46.450	1.920
47.073	1.920
47.696	1.920
48.569	1.927
49.441	1.927
50.065	1.939
50.937	1.927
51.807	1.901
52.431	1.907
52.930	1.920
53.430	1.946
53.805	1.978
54.429	2.004
55.051	1.965
55.549	1.965
56.047	1.965
56.546	1.972
57.170	1.985
57.794	2.004
57.796	2.036
58.420	2.055
59.043	2.062
59.417	2.062
59.915	2.062
60.413	2.049
61.036	2.049
61.659	2.043
62.156	2.023
62.655	2.023
63.153	2.017
63.528	2.043
64.027	2.049
64.525	2.049
65.024	2.049
65.771	2.049
66.519	2.055
67.143	2.068
67.517	2.075
67.891	2.075
68.513	2.055
68.887	2.068
69.511	2.068
70.009	2.068
70.134	2.081
70.882	2.075
71.131	2.075
71.505	2.075
71.879	2.081
72.502	2.081
72.876	2.088
73.125	2.075
73.498	2.075
73.748	2.075
74.247	2.094
74.995	2.094
75.493	2.088
76.116	2.081
76.490	2.088
77.238	2.094
77.487	2.094
78.110	2.094
78.608	2.094
78.982	2.094
79.480	2.081
80.352	2.081
80.727	2.094];
data.tL(:,1) = 7 * data.tL(:,1); % convert wk to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell diameter', '20 C'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Zoti2018';
%
data.tL10 = [ ... % time since birth (d), shell diameter
23.005	0.221
43.591	0.268
56.316	0.308
68.843	0.308
86.314	0.358
103.573	0.364
116.412	0.428
130.587	0.445
143.410	0.505
157.815	0.568
168.858	0.585
173.703	0.615
199.086	0.682
224.355	0.725
249.508	0.745
273.178	0.782
285.738	0.789
303.144	0.825
339.309	0.855
364.397	0.862
380.155	0.882
417.738	0.882
453.918	0.915
475.907	0.928
501.061	0.948
526.182	0.962
540.226	0.951
557.452	0.951
587.205	0.951
609.210	0.968
629.535	0.961
649.909	0.964
681.294	0.977
715.794	0.987
744.030	0.997
780.113	1.010
800.683	1.054
833.552	1.050
850.892	1.074
882.359	1.104
918.458	1.120
941.947	1.120
978.030	1.133
1004.733	1.150
1026.820	1.183
1064.469	1.197
1081.629	1.183
1113.161	1.226
1155.442	1.226
1196.239	1.243
1221.261	1.236];
units.tL10   = {'d', 'cm'};  label.tL10 = {'time since birth', 'shell diameter', '10 C'};  
temp.tL10    = C2K(10);  units.temp.tL10 = 'K'; label.temp.tL10 = 'temperature';
bibkey.tL10 = 'Cost1994';
comment.tL10 = 'Data for 10 C';
%
data.tL15 = [ ... % time since birth (d), shell diameter
24.636	0.234
34.671	0.365
50.838	0.468
62.127	0.535
78.049	0.589
86.141	0.642
101.964	0.676
116.238	0.712
133.595	0.739
148.016	0.806
160.756	0.849
173.432	0.880
189.337	0.930
200.380	0.946
214.556	0.963
228.732	0.980
246.039	0.996
261.830	1.023
277.538	1.033
291.698	1.046
299.576	1.056
312.104	1.056
326.165	1.049
338.775	1.066
345.104	1.080
356.082	1.083
376.456	1.086
387.532	1.109
417.302	1.113
445.571	1.129
466.060	1.156
499.027	1.173
525.582	1.159
552.187	1.156
586.638	1.155
607.110	1.179
636.913	1.189
666.732	1.202
690.205	1.198
718.621	1.245
753.089	1.248
773.479	1.255
807.979	1.265
830.034	1.291
859.803	1.295
889.769	1.338
918.268	1.401
943.651	1.468
973.682	1.525
998.377	1.451];
units.tL15   = {'d', 'cm'};  label.tL15 = {'time since birth', 'shell diameter', '15 C'};  
temp.tL15    = C2K(215);  units.temp.tL15 = 'K'; label.temp.tL15 = 'temperature';
bibkey.tL15 = 'Cost1994';
comment.tL15 = 'Data for 15 C';
%
data.tL20 = [ ... % time since birth (d), shell diameter
21.389	0.211
34.458	0.321
44.541	0.462
54.445	0.565
73.859	0.693
88.428	0.790
104.546	0.883
117.172	0.903
133.093	0.957
147.449	1.010
161.788	1.060
179.112	1.080
194.919	1.110
204.413	1.130
217.007	1.144
232.682	1.147
248.391	1.157
262.485	1.157
275.062	1.167
289.204	1.177
300.199	1.184
315.875	1.187
325.353	1.203
339.528	1.220
349.038	1.244
375.676	1.247
383.653	1.277
415.038	1.290
441.676	1.293
465.427	1.347
492.163	1.370
523.188	1.310
551.408	1.316
579.562	1.309];
units.tL20   = {'d', 'cm'};  label.tL20 = {'time since birth', 'shell diameter', '20 C'};  
temp.tL20    = C2K(20);  units.temp.tL20 = 'K'; label.temp.tL20 = 'temperature';
bibkey.tL20 = 'Cost1994';
comment.tL20 = 'Data for 20 C';
%
data.tL25 = [ ... % time since birth (d), shell diameter
24.570	0.221
29.743	0.318
30.022	0.375
47.722	0.472
58.963	0.529
65.505	0.585
90.871	0.649
97.315	0.686
114.852	0.749
129.175	0.796
145.179	0.866
154.853	0.923
170.873	0.997
189.877	1.040
198.133	1.127
212.571	1.197
234.674	1.234
239.602	1.281
258.409	1.284
272.650	1.314];
units.tL25   = {'d', 'cm'};  label.tL25 = {'time since birth', 'shell diameter', '25 C'};  
temp.tL25    = C2K(25);  units.temp.tL25 = 'K'; label.temp.tL25 = 'temperature';
bibkey.tL25 = 'Cost1994';
comment.tL25 = 'Data for 25 C';
    
% time - weight 
data.tWw = [ ... % age (w), total length (cm)
2.111	0.009
2.484	0.009
3.105	0.014
3.477	0.023
4.097	0.033
4.470	0.037
4.965	0.056
5.089	0.070
5.460	0.089
5.956	0.107
6.327	0.121
6.575	0.135
6.698	0.149
7.443	0.159
7.815	0.168
8.063	0.177
8.435	0.182
8.683	0.187
9.055	0.196
9.426	0.219
9.923	0.224
10.418	0.247
11.038	0.261
11.534	0.270
12.030	0.284
12.152	0.317
12.648	0.340
12.770	0.373
13.141	0.391
13.388	0.405
13.884	0.419
14.007	0.438
14.751	0.461
14.875	0.471
15.246	0.489
15.990	0.508
16.734	0.527
17.229	0.550
17.724	0.578
18.344	0.601
18.716	0.606
18.963	0.624
19.335	0.643
19.582	0.657
19.954	0.666
20.078	0.680
20.325	0.690
20.574	0.685
20.946	0.699
21.442	0.713
22.062	0.732
22.434	0.732
23.303	0.746
23.799	0.760
24.296	0.760
25.041	0.760
25.538	0.764
26.281	0.788
26.402	0.834
26.404	0.811
26.650	0.848
27.520	0.843
28.142	0.834
28.640	0.816
29.012	0.825
29.755	0.848
29.878	0.867
30.001	0.895
30.619	0.937
31.115	0.955
31.612	0.951
31.985	0.937
32.482	0.937
32.979	0.941
33.350	0.960
33.471	1.007
33.473	0.988
33.965	1.058
33.966	1.035
34.709	1.072
35.080	1.090
35.576	1.104
35.699	1.128
35.946	1.151
36.443	1.151
36.689	1.174
37.061	1.198
37.804	1.221
38.303	1.198
39.541	1.249
39.543	1.226
39.545	1.198
39.912	1.286
40.283	1.300
41.029	1.300
41.773	1.319
42.644	1.296
43.264	1.305
43.385	1.351
43.387	1.323
44.006	1.361
44.255	1.356
44.999	1.365
45.246	1.389
45.989	1.421
45.989	1.421
46.488	1.398
46.985	1.398
47.357	1.398
47.729	1.412
47.853	1.421
48.224	1.440
48.595	1.459
48.842	1.491
48.842	1.477
48.965	1.505
49.212	1.519
49.832	1.533
50.205	1.529
50.951	1.524
51.202	1.491
51.699	1.491
51.822	1.501
52.193	1.524
52.441	1.538
52.936	1.561
53.308	1.575
53.928	1.594
54.299	1.608
55.046	1.585
55.545	1.561
55.919	1.543
56.292	1.534
56.789	1.534
57.533	1.548
58.029	1.562
58.152	1.575
58.523	1.603
58.893	1.645
59.019	1.622
59.517	1.608
59.766	1.590
60.265	1.566
60.888	1.543
61.759	1.520
62.255	1.529
62.258	1.492
62.379	1.539
62.872	1.585
63.243	1.613
63.864	1.618
64.237	1.613
64.858	1.608
65.107	1.604
65.356	1.599
66.102	1.585
66.229	1.543
66.476	1.571
66.846	1.599
67.340	1.655
67.837	1.641
68.212	1.618
68.338	1.585
68.712	1.571
68.963	1.534
69.833	1.525
70.203	1.562
70.321	1.651
70.323	1.627
70.325	1.590
70.818	1.646
71.440	1.632
72.186	1.632
72.931	1.641
73.927	1.600
74.178	1.562
74.798	1.586
75.295	1.586
75.792	1.576
76.043	1.549
76.293	1.516
76.665	1.525
76.913	1.539
77.534	1.539
77.659	1.521
77.909	1.507
78.530	1.507
78.901	1.526
78.902	1.521
79.025	1.539
79.770	1.544
80.143	1.540
80.386	1.609];
data.tWw(:,1) = 7 * data.tWw(:,1); % convert wk to d
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight', '20 C'};  
temp.tWw    = C2K(20);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Zoti2018';

% time - survival
data.tS10 = [ ... % time since birth (d), 
20.159	1.000
27.114	0.982
32.535	0.951
36.365	0.903
62.025	0.888
84.086	0.799
84.810	0.728
89.502	0.624
120.228	0.541
151.743	0.537
161.645	0.523
181.726	0.523
204.418	0.497
271.870	0.501
297.490	0.481
312.952	0.449
358.889	0.453
370.265	0.443
427.598	0.438
440.349	0.423
536.467	0.424
550.455	0.388
561.909	0.386
577.549	0.372
596.214	0.374
628.986	0.352
663.410	0.352
674.746	0.338
692.998	0.299
718.559	0.273
738.639	0.273
776.990	0.235
791.215	0.223
801.097	0.207
819.783	0.211
835.402	0.195
881.241	0.189
905.249	0.152
931.106	0.155
938.140	0.141
979.715	0.139
1002.486	0.121
1028.028	0.094
1050.976	0.093
1066.557	0.074
1080.880	0.071
1090.703	0.050
1109.270	0.042
1135.088	0.042
1149.135	0.012
1169.195	0.010
1183.597	0.016
1193.539	0.006
1213.619	0.006];
units.tS10   = {'d', '-'};  label.tS10 = {'time since birth', 'fraction surviving', '10 C'};  
temp.tS10    = C2K(10);  units.temp.tS10 = 'K'; label.temp.tS10 = 'temperature';
bibkey.tS10 = 'Cost1994';
comment.tS10 = 'Data for 10 C';
%
data.tS15 = [ ... % time since birth (d), 
21.633	1.000
37.371	1.000
48.431	0.962
52.576	0.947
66.761	0.931
76.723	0.923
91.007	0.917
102.481	0.917
121.009	0.905
125.154	0.889
136.628	0.889
150.951	0.887
167.907	0.861
168.064	0.877
179.421	0.865
193.764	0.865
206.653	0.863
215.041	0.841
229.385	0.841
242.293	0.841
256.597	0.837
268.071	0.837
280.980	0.837
293.889	0.836
303.889	0.832
319.667	0.832
328.273	0.832
346.978	0.838
357.018	0.838
372.815	0.840
387.158	0.840
400.067	0.839
412.818	0.824
428.556	0.820
440.109	0.827
457.242	0.819
468.519	0.800
485.731	0.799
498.600	0.795
507.245	0.799
517.285	0.799
530.214	0.801
541.688	0.801
553.005	0.785
568.782	0.785
584.579	0.787
596.073	0.789
613.048	0.765
624.030	0.716
638.235	0.702
653.835	0.684
669.632	0.686
683.856	0.674
696.607	0.658
708.141	0.664
717.392	0.585
735.841	0.566
748.789	0.569
761.717	0.571
778.988	0.577
789.028	0.577
806.220	0.575
821.800	0.555
835.926	0.533
848.835	0.533
864.179	0.490
872.607	0.472
886.772	0.454
902.860	0.342
916.098	0.232
928.573	0.189
941.989	0.096
953.049	0.055
965.623	0.021
978.413	0.009
997.019	0.005
1008.37 0.000];
units.tS15   = {'d', '-'};  label.tS15 = {'time since birth', 'fraction surviving', '15 C'};  
temp.tS15    = C2K(15);  units.temp.tS15 = 'K'; label.temp.tS15 = 'temperature';
bibkey.tS15 = 'Cost1994';
comment.tS15 = 'Data for 15 C';
%
data.tS20 = [ ... % time since birth (d), 
23.048	1.000
37.292	0.996
49.708	0.947
68.117	0.923
83.894	0.923
98.158	0.915
108.198	0.915
125.134	0.887
125.272	0.901
140.911	0.887
150.873	0.879
163.781	0.879
166.472	0.861
180.835	0.863
192.329	0.865
206.455	0.843
206.653	0.863
219.285	0.835
223.391	0.815
236.240	0.809
246.320	0.813
261.920	0.795
277.697	0.795
289.191	0.797
302.903	0.734
316.615	0.671
332.412	0.673
346.459	0.643
358.914	0.598
371.291	0.545
387.989	0.494
398.675	0.415
415.452	0.372
428.356	0.228
439.692	0.214
455.114	0.179
470.906	0.037
482.341	0.033
492.243	0.019
507.961	0.013
519.376	0.007
535.193	0.011
552.424	0.013
565.333	0.013
578.242	0.013];
units.tS20   = {'d', '-'};  label.tS20 = {'time since birth', 'fraction surviving', '20 C'};  
temp.tS20    = C2K(20);  units.temp.tS20 = 'K'; label.temp.tS20 = 'temperature';
bibkey.tS20 = 'Cost1994';
comment.tS20 = 'Data for 20 C';
%
data.tS25 = [ ... % time since birth (d), 
23.048	1.000
32.595	0.957
34.891	0.900
49.096	0.886
62.025	0.888
80.059	0.826
92.593	0.789
106.265	0.722
115.319	0.624
129.893	0.504
147.376	0.388
161.245	0.341
176.194	0.258
191.754	0.236
204.934	0.120
216.231	0.102
231.752	0.077
246.858	0.010
261.201	0.010
271.261	0.011
285.486	0.000];
units.tS25   = {'d', '-'};  label.tS25 = {'time since birth', 'fraction surviving', '25 C'};  
temp.tS25    = C2K(25);  units.temp.tS25 = 'K'; label.temp.tS25 = 'temperature';
bibkey.tS25 = 'Cost1994';
comment.tS25 = 'Data for 25 C';

% temperatrue - age at birth
data.Tab = [ ... % temp (C), mean age at hitch (d)
    10 67
    15 25.7
    20 13.9
    25  8.5];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'at at birth'};  
bibkey.Tab = 'Cost1997';

%% set weights for all real data
weights = setweights(data, []);
weights.Lj = 0 * weights.Lj;
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.tS10 = weights.tS10 * 0;
weights.tS15 = weights.tS15 .* (data.tS15(:,2) < 0.85);
weights.tS20 = weights.tS20 .* (data.tS20(:,2) < 0.85);
weights.tS25 = weights.tS25 .* (data.tS25(:,2) < 0.85);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL25','tL20','tL15','tL10'}; subtitle1 = {'Cost1994 data for 25, 20, 15, 10 C'};
set2 = {'tS25','tS20','tS15','tS10'}; subtitle2 = {'Cost1994 data for 25, 20, 15, 10 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JKHZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2927244'; % Ency of Life
metaData.links.id_Wiki = 'Planorbarius_corneus'; % Wikipedia
metaData.links.id_ADW = 'Planorbarius_corneus'; % ADW
metaData.links.id_Taxo = '38522'; % Taxonomicon
metaData.links.id_WoRMS = '819958'; % WoRMS
metaData.links.id_molluscabase = '819958'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Planorbarius_corneus}}';
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
bibkey = 'Zoti2018'; type = 'Article'; bib = [ ... 
'author = {A. A. Zotin}, ' ... 
'title = {Individual Growth of \emph{Planorbarius corneus} ({P}lanorbidae, {G}astropoda) in Postlarval Ontogenesis}, ' ...
'journal = {Russian Journal of Developmental Biology}, ' ...
'number = {6}, ' ...
'volume = {49}, ' ...
'year = {2018}, ' ...
'pages = {381-387}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cost1994'; type = 'Article'; bib = [ ... 
'author = {K. Costil}, ' ... 
'title = {INFLUENCE OF TEMPERATURE ON SURVIVAL AND GROWTH OF TWO FRESHWATER PLANORBID SPECIES, \emph{Planorbarius corneus} ({L}.) AND \emph{Planorbis planorbis} ({L}.)}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {60}, ' ...
'year = {1994}, ' ...
'pages = {223-235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cost1997'; type = 'Article'; bib = [ ... 
'doi = {10.1093/mollus/63.2.293}, ' ...
'author = {K. Costil}, ' ... 
'title = {Effect of temperature on embryonic development of two freshwater pulmonates, \emph{Planorbarius corneus} ({L}.) and \emph{Planorbis planorbis} ({L}.)}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {63}, ' ...
'year = {1997}, ' ...
'pages = {293-296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

