function [data, auxData, metaData, txtData, weights] = mydata_Crinia_nimbus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Myobatrachidae';
metaData.species    = 'Crinia_nimbus'; 
metaData.species_en = 'Moss froglet'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAt'};
metaData.ecoCode.habitat = {'0jTf', 'bjFl', 'jiTf'};
metaData.ecoCode.embryo  = {'Tnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ah_T'; 'ab_T'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wwh'; 'Wdh'; 'Wdb'; 'Wwb'; 'Wwi'; 'E0'; 'Eh'; 'Eb'; 'Ri'}; 
metaData.data_1     = {'t-WdYe'; 't-WdVe'; 't-JOe_T'}; 

metaData.COMPLETE = 3.4; % using criteria of LikaKear2011

metaData.author   = {'Casey Mueller'; 'Starrlight Augustine'; 'Bas Kooijman'};    
metaData.date_subm = [2012 03 20];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvanplan, Tromso'};  

metaData.author_mod_1 = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 09 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU Univ Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 09 27];


%% set data
% zero-variate data

data.ah_15 = 44;  units.ah_15 = 'd';  label.ah_15 = 'age at hatch';          bibkey.ah_15 = 'MuelAugu2012';   
  temp.ah_15 = C2K(15);  units.temp.ah_15 = 'K'; label.temp.ah_15 = 'temperature';
data.ah_10 = 75;  units.ah_10 = 'd';  label.ah_10 = 'age at hatch';          bibkey.ah_10 = 'MuelAugu2012';   
  temp.ah_10 = C2K(10);  units.temp.ah_10 = 'K'; label.temp.ah_10 = 'temperature';
data.ah_5 = 169;  units.ah_5 = 'd';   label.ah_5 = 'age at hatch';           bibkey.ah_5 = 'MuelAugu2012';   
  temp.ah_5 = C2K(5);  units.temp.ah_5 = 'K'; label.temp.ah_5 = 'temperature';
data.ab_15 = 149; units.ab_15 = 'd';  label.ab_15 = 'age at birth';          bibkey.ab_15 = 'MuelAugu2012';   
  temp.ab_15 = C2K(15);  units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.ab_10 = 277; units.ab_10 = 'd';  label.ab_10 = 'age at hatch';          bibkey.ab_10 = 'MuelAugu2012';   
  temp.ab_10 = C2K(10);  units.temp.ab_10 = 'K'; label.temp.ab_10 = 'temperature';
data.ap = 2.5*365; units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'MuelAugu2012';
  temp.ap = C2K(14);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'MuelAugu2012';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0 = 0.349; units.L0  = 'cm';   label.L0  = 'diameter of ovum';        bibkey.L0  = 'MuelAugu2012';  
data.Lh  = 0.5;   units.Lh  = 'cm';   label.Lh  = 'total length at hatch';   bibkey.Lh  = 'MuelAugu2012';  
data.Lb  = 0.72;  units.Lb  = 'cm';   label.Lb  = 'total length at birth';   bibkey.Lb  = 'MuelAugu2012';  
data.Li  = 2.7;   units.Li  = 'cm';   label.Li  = 'ultimate total length';   bibkey.Li  = 'MuelAugu2012';

data.Wdh = 0.0016+0.007; units.Wdh = 'g'; label.Wdh = 'dry weight at hatch'; bibkey.Wdh = 'MuelAugu2012';
data.Wwh = 0.01+0.013;   units.Wwh = 'g'; label.Wwh = 'wet weight at hatch'; bibkey.Wwh = 'MuelAugu2012';
data.Wdb = 0.006+0.0019; units.Wdb = 'g'; label.Wdb = 'dry weight at birth'; bibkey.Wdb = 'MuelAugu2012';
data.Wwb = 0.0275+0.0043;units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'MuelAugu2012';
data.Wwi = 1.67;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MuelAugu2012';

data.E0 = 249;    units.E0 = 'J';     label.E0 = 'energy in egg';            bibkey.E0 = 'MuelAugu2012';
data.Eh = 35+167; units.Eh = 'J';     label.Eh = 'energy at hatch';          bibkey.Eh = 'MuelAugu2012';
data.Eb = 123+49; units.Eb = 'J';     label.Eb = 'energy at birth';          bibkey.Eb = 'MuelAugu2012';

data.Ri  = 16/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MuelAugu2012';   
temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% age-stage data to convert stage to age
as_15 = [... % age (d), stage at 15 C
6.768	2.442
10.818	4.923
12.160	7.360
13.109	8.518
15.527	11.038
15.924	12.278
19.577	13.520
21.602	14.760
21.665	14.223
23.733	15.092
24.799	15.258
29.048	16.046
30.249	19.681
31.828	20.095
34.488	20.552
35.525	20.966
37.773	20.307
40.902	21.383
41.348	22.209
45.078	22.791
46.774	22.214
55.571	25.855
67.905	27.104
72.706	27.810
80.239	28.353
88.233	29.599
95.684	30.844
100.567	30.848
104.772	32.007
110.668	32.632
113.516	31.478
115.541	32.718
120.357	33.300
120.424	32.722
123.462	34.583
125.782	33.305
128.825	35.124
129.430	34.588
131.208	33.309
132.540	35.829
136.876	35.874
141.764	35.837
143.237	37.160
143.324	36.416
147.195	35.800
150.300	37.083
153.561	37.044];
as = knot([5 10 20 40 80 155], as_15); % get knots for spline
sa = as(:,[2 1]);
%
as_10 = [ ... % age (d), stage at 10 C
7.320	2.360
8.812	3.517
10.827	4.840
13.390	6.123
18.428	4.805
19.087	8.440
19.867	11.042
23.278	9.723
23.418	8.526
23.525	12.243
24.988	13.648
26.233	12.286
30.981	13.446
34.076	14.812
39.366	15.972
39.424	15.477
41.692	14.653
43.266	15.108
45.344	15.895
51.429	19.534
56.807	19.951
57.829	20.489
61.099	20.367
66.917	21.652
71.355	20.830
72.343	21.657
77.715	22.116
82.599	22.120
85.312	22.122
87.341	23.321
89.662	22.043
94.942	23.286
101.696	25.852
101.986	23.374
108.977	23.917
111.075	24.538
114.034	27.060
116.495	24.584
116.747	27.062
117.755	27.723
119.068	25.784
125.976	27.028
126.054	26.367
130.385	26.454
134.115	27.035
134.517	28.233
140.476	28.320
140.878	29.518
146.987	28.326
147.927	29.565
157.228	28.912
158.778	29.574
163.671	29.496
164.136	30.157
164.824	28.918
171.258	29.585
178.248	30.127
178.718	30.747
186.237	31.414
187.467	30.176
190.728	30.137
193.983	30.140
194.380	31.379
202.044	30.807
208.560	30.772
208.957	32.011
210.658	31.393
216.554	32.017
224.683	32.106
232.289	32.030
234.783	33.890
235.404	33.230
236.615	32.157
238.795	32.077
240.534	35.753
240.810	33.400
242.859	34.434
243.789	35.756
244.221	32.081
248.275	34.521
251.928	35.763
252.616	34.524
253.449	32.047
255.479	33.247
255.726	35.766
257.213	36.965
260.464	37.009
261.593	32.013
271.204	33.342
279.886	33.349
280.215	35.167
287.492	33.273
288.829	35.752
293.862	34.476
298.595	35.760
304.549	35.889
308.347	35.892
311.472	37.009];
%
as_5 = [ ... % age (d), stage at 5 C
13.78	9.02
21.22	10.03
23.26	10.97
25.28	11.98
29.33	13.93
35.69	14.94
36.63	15.88
41.89	17.02
48.41	16.89
52.66	17.43
67.74	18.05
71.15	16.97
78.45	18.92
82.69	19.60
87.02	19.60
103.28	19.61
119.03	23.04
121.11	23.65
122.21	23.58
129.79	23.58
137.38	23.59
139.40	24.60
140.62	23.66
149.15	24.60
149.26	23.86
151.25	25.07
158.83	25.08
158.90	24.61
166.49	24.61
167.52	24.95
176.18	25.02
178.26	25.63
187.01	25.03
201.91	26.91
202.23	24.70
214.12	24.91
219.10	27.93
233.02	29.08
236.72	25.99
237.94	25.06
252.54	29.02
256.72	30.03
271.83	30.51
280.49	30.52
285.63	24.95
295.61	30.86
301.88	24.96
333.14	26.12
354.11	30.96
357.02	25.86
365.88	32.04
370.37	30.97
389.65	32.53
394.78	27.03
402.57	33.07
402.66	32.47
411.24	33.07
416.95	31.06
421.87	26.97
424.25	33.02
424.39	32.08
433.20	31.07
447.14	32.09
456.39	28.07
459.07	32.03
461.08	33.10
462.45	31.09
483.83	33.12
486.28	31.17
501.18	33.06
512.15	32.13
527.34	32.00
547.77	33.09
555.36	33.02
565.11	33.10
581.21	34.11
581.36	33.11
585.69	33.11
593.29	33.05
618.20	33.13
625.79	33.06
629.04	33.07
636.63	33.07
649.62	33.14
657.07	34.09
674.38	34.23
681.99	34.10
685.09	35.11
716.50	35.20]; 

% stage-yolk data, converted to age-yolk data
sY = [... % stage, yolk mass mg
16.948 9.647
18.905 9.190
18.915 9.986
18.918 10.285
18.953 8.195
18.983 10.682
19.627 9.834
19.676 8.938
19.978 9.334
22.932 7.629
22.955 9.519
22.976 6.285
23.005 8.723
24.947 6.973
25.004 6.724
25.018 7.967
25.022 8.315
25.025 8.514
30.954 6.845
30.985 9.431
31.009 6.496
31.424 6.345
31.473 5.449
31.477 5.797
31.489 6.842
31.955 5.944
32.952 4.795
32.998 3.601
33.420 4.146
33.423 4.395
33.427 4.694
33.475 3.748
33.494 5.340
33.936 2.502
34.930 1.055
36.076 2.343
36.774 0.996
36.782 1.643
36.786 2.041
36.897 1.344
36.947 5.572
37.153 2.885
37.155 3.034
37.200 1.790
37.207 2.437
37.250 1.044
37.264 2.188];
data.aY = sY; data.aY(:,1) = spline(sY(:,1),sa);
units.aY  = {'d', 'mg'}; label.aY = {'age', 'yolk weight'};  
temp.aY   = C2K(15); units.temp.aY = 'K'; label.temp.aY = 'temperature';
bibkey.aY = 'MuelAugu2012';

% stage-weight data, converted to age-weight data
sW = [ ... % stage, body mass mg
16.903 0.645
18.933 0.836
18.997 1.185
19.001 1.485
19.004 1.785
19.592 1.033
19.656 1.432
22.995 1.266
22.999 1.616
23.002 1.866
23.010 2.466
24.963 1.207
24.964 1.307
24.976 2.257
25.033 2.057
30.896 3.429
30.953 3.179
31.382 4.176
31.394 5.176
31.397 5.376
31.447 4.626
32.021 2.673
32.905 1.819
32.981 3.169
33.004 5.119
33.418 4.767
33.465 3.767
33.475 4.567
33.481 5.066
33.483 5.266
34.019 5.164
34.927 6.260
36.003 6.404
36.348 5.353
36.757 4.651
36.805 3.651
36.820 4.951
36.825 5.301
37.140 6.749
37.144 7.099
37.150 7.599
37.165 8.849
37.196 6.449
37.218 8.299
37.230 9.249
37.233 4.499
37.241 5.199];
data.aW = sW; data.aW(:,1) = spline(sW(:,1),sa);
units.aW  = {'d', 'mg'}; label.aW = {'age', 'dry weight'};  
temp.aW   = C2K(15); units.temp.aW = 'K'; label.temp.aW = 'temperature';
bibkey.aW = 'MuelAugu2012';

% age-respiration data
data.aJO_15 = [ ... % age(d), J_O (muL/h)
4.762 0.017
9.507 0.082
10.403 0.244
10.432 0.163
11.328 0.325
13.253 0.276
17.027 0.390
18.859 0.600
20.662 0.891
21.737 0.552
23.564 0.779
27.447 0.585
28.205 1.135
30.158 1.006
31.037 1.216
33.921 1.152
34.059 0.764
34.759 1.475
35.938 0.845
38.527 1.605
40.631 1.055
41.694 0.748
43.509 1.007
46.046 1.912
54.670 1.800
65.998 2.125
70.800 2.028
78.511 1.803
87.902 2.208
94.717 1.821
95.387 2.613
100.363 2.032
104.016 2.485
104.056 2.372
104.710 3.212
109.420 3.374
109.755 2.437
113.165 3.569
119.141 2.858
119.667 4.054
119.933 3.311
122.858 3.133
123.135 2.358
123.534 3.909
125.562 3.570
127.626 3.134
128.337 3.813
128.458 3.474
129.013 4.589
133.209 3.523
133.319 5.882
133.931 4.169
136.035 6.287
136.058 6.222
136.122 6.044
137.515 7.483
142.202 5.043
142.601 3.928
143.011 8.114
144.549 6.481
146.386 4.009
150.542 5.723
154.062 6.547];
units.aJO_15  = {'d', 'muL/h'}; label.aJO_15 = {'age', 'O2 consumption', '15 C'};  
temp.aJO_15   = C2K(15); units.temp.aJO_15 = 'K'; label.temp.aJO_15 = 'temperature';
bibkey.aJO_15 = 'MuelAugu2012';
%
data.aJO_10 = [ ...  % age(d), J_O (muL/h)
10.013 0.001
14.758 0.066
19.015 0.164
21.431 0.075
21.850 0.237
23.798 0.124
28.525 0.238
28.580 0.084
31.331 0.392
31.892 0.157
35.189 0.271
37.125 0.190
38.524 0.279
39.874 0.506
39.926 0.360
44.101 0.684
44.145 0.563
45.122 0.498
50.427 0.329
56.970 0.702
57.805 1.033
60.784 0.702
66.945 0.808
69.919 0.493
70.543 1.414
70.792 0.719
76.808 1.229
78.398 0.785
81.747 0.753
84.822 1.489
87.657 1.562
88.879 0.810
93.217 0.682
93.977 1.223
100.147 1.305
101.242 0.909
101.993 1.475
107.836 1.136
110.694 1.144
113.489 1.330
115.489 1.072
116.578 0.692
116.792 1.428
116.962 0.951
125.762 1.679
126.034 0.920
128.915 2.197
132.735 0.848
132.865 1.817
133.946 1.462
138.191 1.592
138.237 1.463
140.168 1.398
143.757 2.029
146.355 1.431
146.479 2.417
155.461 1.303
155.839 1.578
156.937 1.174
161.668 1.279
162.098 1.409
164.552 1.215
165.566 1.045
168.736 1.515
172.938 1.766
176.845 1.507
185.590 1.056
186.390 1.484
188.589 2.002
193.141 1.275
193.222 1.049
200.747 1.340
207.896 1.349
208.153 1.964
209.286 1.463
216.967 1.318
217.594 2.231
224.169 2.515
225.903 1.667
226.810 1.796
232.408 2.144
234.459 4.407
234.809 2.096
234.847 1.991
235.228 3.591
235.679 2.330
236.930 1.498
239.135 1.999
239.522 2.250
240.863 2.501
241.282 2.662
242.276 1.216
242.305 2.468
243.461 4.570
244.137 4.012
247.391 2.914
248.657 3.374
250.570 2.025
251.056 3.334
251.931 3.552
252.058 3.197
252.668 1.492
253.760 2.437
255.480 4.296
255.746 3.553
259.543 3.602
261.104 1.905
270.091 3.441
278.512 2.562
279.139 3.475
280.821 2.772
281.809 4.008
287.756 3.379
289.268 3.153
293.134 3.008
300.625 3.396
300.708 3.162
302.752 2.783
304.194 4.084];
units.aJO_10  = {'d', 'muL/h'}; label.aJO_10 = {'age', 'O2 consumption', '10 C'};  
temp.aJO_10   = C2K(10); units.temp.aJO_10 = 'K'; label.temp.aJO_10 = 'temperature';
bibkey.aJO_10 = 'MuelAugu2012';
%
data.aJO_5 = [ ... % age(d), J_O (muL/h)
22.890 0.001
32.427 0.001
36.718 0.001
40.033 0.061
48.610 0.078
52.889 0.111
67.171 0.178
69.607 0.032
76.687 0.235
80.562 0.066
86.249 0.164
99.551 0.303
112.434 0.280
112.495 0.110
117.639 0.393
118.214 0.119
121.014 0.289
126.198 0.459
135.784 0.323
136.677 0.493
138.596 0.461
149.062 0.526
150.588 0.260
157.244 0.317
157.671 0.455
162.411 0.536
163.240 0.884
163.419 0.383
176.186 0.683
176.241 0.530
186.269 0.490
198.545 0.831
200.019 0.710
200.131 0.395
217.253 0.518
231.515 0.641
234.693 1.086
237.196 0.755
253.009 0.538
257.662 0.862
270.094 0.767
280.939 1.107
283.965 0.647
293.715 1.384
300.096 0.875
330.606 0.895
352.144 0.671
353.442 1.043
354.939 0.857
366.226 1.295
369.194 0.996
388.726 1.047
389.091 1.362
393.668 0.563
401.525 1.259
401.621 0.992
411.437 1.543
416.974 0.727
420.826 0.622
424.086 0.841
424.488 1.051
432.169 0.907
447.043 0.650
453.993 1.216
457.961 0.788
461.139 1.233
462.631 1.064
483.585 1.139
486.888 1.236
500.652 1.415
511.229 1.174
526.105 0.909
528.024 0.877
547.305 1.631
552.747 1.082
552.804 0.920
556.995 1.204
563.150 1.326
580.405 1.077
581.815 1.134
582.156 1.514
582.185 1.433
586.485 1.409
592.695 1.378
617.990 1.316
620.909 1.155
627.035 1.357
637.583 1.197
648.648 0.923
657.985 1.482
673.532 2.009
680.393 1.493
680.572 2.325
686.279 1.033
716.472 1.941];
units.aJO_5  = {'d', 'muL/h'}; label.aJO_5 = {'age', 'O2 consumption', '5 C'};  
temp.aJO_5   = C2K(5); units.temp.aJO_5 = 'K'; label.temp.aJO_5 = 'temperature';
bibkey.aJO_5 = 'MuelAugu2012';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Group plots
set1 = {'aJO_15','aJO_10','aJO_5'}; subtitle1 = {'Data at 15, 10, 5 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'This species decreases kappa between E_Hh and E_Hj, and resets after E_Hj';
D2 = 'Results of this entry are reported in MuelAug2012';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'no feeding for metamorphosis to froglet; cloud forests of Tasmania sea-level to 1100 m alpine heath';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'largest Australian anuran eggs, longest a_b';
metaData.bibkey.F2 = 'MuelAugu2012'; 
F3 = 'hatching at stage 25, birth at stage 37';
metaData.bibkey.F3 = 'Gosn1960'; 
F4 = 'Arrhenius applies for 5, 10 15 C till hatch, but not to 5 C cohort between hatch and birth';
metaData.bibkey.F4 = 'MuelAugu2012'; 
F5 = 'Earlier name Bryobatrachus nimbus, but ReadKeog2001 moves it to Crina nimbus';
metaData.bibkey.F5 = 'ReadKeog2001'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = 'ZGD3'; % Cat of Life
metaData.links.id_ITIS = '664666'; % ITIS
metaData.links.id_EoL = '332826'; % Ency of Life
metaData.links.id_Wiki = 'Crinia_nimbus'; % Wikipedia
metaData.links.id_ADW = 'Crinia_nimbus'; % ADW
metaData.links.id_Taxo = '781013'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Crinia+nimbus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crinia_nimbus}}';
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
bibkey = 'MitcSeym2000'; type = 'Article'; bib = [ ... 
'author = {Mitchell, N. J. and Seymour, R. S.}, ' ... 
'year = {2000}, ' ...
'title = {Effects of Temperature on Energy Cost and Timing of Embryonic and Larval Development of the Terrestrially Breeding Moss Frog, \emph{Bryobatrachus nimbus}}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {73}, ' ...
'number = {6}, '...
'pages = {829--840}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gosn1960'; type = 'Article'; bib = [ ... 
'author = {Gosner K. L.}, ' ... 
'year = {1960}, ' ...
'title = {A simplified table for staging anuran embryos and larvae with notes on identification}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {16}, ' ...
'pages = {183-190}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReadKeog2001'; type = 'Article'; bib = [ ... 
'author = {Read, K. and Keogh, J. S. and Scott, I. A. and Roberts, J. D. and Doughty, P.}, ' ... 
'year = {2001}, ' ...
'title = {Molecular phylogeny of the {A}ustralian frog genera \emph{Crinia}, \emph{Geocrinia}, and allied taxa ({A}nura: {M}yobatrachidae)}, ' ...
'journal = { Mol Phylogenet Evol.}, ' ...
'volume = {21}, ' ...
'number = {2}, '...
'pages = {294--308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MuelAugu2012'; type = 'Article'; bib = [ ... 
'author = {Mueller, C. and Augustine, S. and Kooijman, S. A. L. M. and Kearney, M. and Seymour, R.}, ' ... 
'year = {2012}, ' ...
'title = {The tradeoff between maturation and growth during accelerated development of frogs}, ' ...
'journal = {Comp. Physiol. Biochem. A}, ' ...
'howpublished = {\url{https://www.zotero.org/groups/500643/deb_library/items/4ZMA4WX3/item-details}}, '...
'volume = {163}, ' ...
'pages = {103--110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
