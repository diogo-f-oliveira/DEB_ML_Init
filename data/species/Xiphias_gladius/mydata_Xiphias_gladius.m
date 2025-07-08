function [data, auxData, metaData, txtData, weights] = mydata_Xiphias_gladius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Istiophoriformes'; 
metaData.family     = 'Xiphiidae';
metaData.species    = 'Xiphias_gladius'; 
metaData.species_en = 'Swordfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 04 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'lib';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4.5*365; units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'lib';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'Wiki';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.4;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki'; 
  comment.Lb = 'bill at 1 cm';
data.Lp  = 168.2;    units.Lp  = 'cm';  label.Lp  = 'LJFL at puberty';     bibkey.Lp  = 'WangSun2003'; 
FL  = 455;         units.Li  = 'cm';  label.Li  = 'ultimate LJFL';           bibkey.Li  = 'Wiki';
data.Li = (FL - 20.6207)/ 1.4847;
  comment.Li = 'computed from LWFL = (FL - 20.6207)/ 1.4847, see "facts"'; 

data.Wwi = 650000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';
data.Wwb = (data.Lb/data.Li)^3*data.Wwi; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'computed from (Lb/ Li)^3 Wwi';
data.Wwp = 74000;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'FAO';
data.Wwpm = 21000; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'FAO';

data.Ri  = 15e6/365; units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'between 1 and 29 million per spawn; temp guessed, Wiki: peference 18-22 C';
 
% uni-variate data
% time-length
% collection area longitude of 35E-95E and the latitude of 15S-10N in 2008
% females west indian
data.tL_fW = [ ... time since birth (yr), lower jaw fork length (cm)
0.974	120.077
0.976	91.940
0.978	59.240
0.989	94.981
0.991	75.209
1.002	107.147
1.002	107.147
1.004	82.052
1.985	105.551
1.985	101.749
1.985	99.468
1.997	128.364
1.997	123.041
1.997	121.520
1.998	113.915
1.998	112.395
2.011	118.477
2.012	108.591
2.013	89.580
2.978	149.582
2.978	145.780
2.979	126.769
2.980	107.757
2.992	137.414
2.992	135.133
2.992	132.091
2.993	129.809
2.993	123.726
2.993	122.205
2.993	119.163
2.993	115.361
3.005	139.694
3.986	166.236
3.987	151.027
3.987	150.266
3.987	146.464
3.987	144.943
3.988	138.099
3.988	131.255
3.999	170.797
4.000	159.391
4.000	154.067
4.001	152.546
4.001	143.421
4.001	141.900
4.994	193.536
4.994	189.733
4.995	170.722
4.995	169.201
4.996	165.399
4.997	150.950
5.008	187.451
5.008	185.930
5.008	177.565
5.009	175.283
5.009	160.835
5.010	158.553
5.022	182.127
5.022	179.085
5.975	200.305
5.977	184.335
5.977	181.293
5.977	178.252
5.988	208.669
5.990	191.178
5.990	188.897
5.990	188.137
5.990	186.616
5.991	170.646
5.991	166.844
6.006	153.154
6.984	213.916
6.984	211.635
6.998	209.353
6.999	195.664
6.999	192.623
6.999	190.341
7.000	182.737
7.012	206.310
7.012	204.028
7.012	200.226
7.012	197.184
7.993	219.163
8.007	214.599
8.008	203.953
8.008	200.911
8.009	194.067
9.004	206.919
9.972	217.492
10.000	203.801];
data.tL_fW(:,1) = (.5 + data.tL_fW(:,1)) * 365; % convert yr to f
n=size(data.tL_fW,1); for i=2:n; if data.tL_fW(i,1)<=data.tL_fW(i-1,1); data.tL_fW(i,1)=data.tL_fW(i-1,1)+1e-3; end; end
units.tL_fW   = {'d', 'cm'};  label.tL_fW = {'time since birth', 'LJFL', 'female'};  
temp.tL_fW    = C2K(20);  units.temp.tL_fW = 'K'; label.temp.tL_fW = 'temperature';
bibkey.tL_fW = 'WangLin2010';
comment.tL_fW = 'females West Indian';
% males west indian
data.tL_mW = [ ... time since birth (yr), lower jaw fork length (cm)
1.011	65.475
1.013	86.007
1.013	89.049
1.013	90.570
1.013	92.852
1.013	97.414
1.014	98.935
1.014	100.456
1.014	105.779
1.025	72.320
1.025	73.841
1.026	76.123
1.026	81.446
1.026	83.727
2.007	95.969
2.021	114.221
2.021	115.742
2.023	139.316
2.023	141.598
2.023	143.119
2.034	99.773
2.034	101.294
2.034	104.336
2.035	107.378
2.035	109.659
2.035	120.306
2.036	127.150
2.036	130.192
2.036	134.755
2.037	137.796
2.049	121.828
2.049	124.109
3.002	122.661
3.002	124.942
3.016	127.985
3.016	131.787
3.017	145.475
3.017	147.757
3.017	150.799
3.028	112.016
3.028	114.298
3.028	118.100
3.029	119.621
3.030	143.195
4.008	117.414
4.012	171.407
4.012	171.407
4.022	128.061
4.022	129.582
4.023	132.624
4.023	134.906
4.023	142.510
4.023	142.510
4.025	165.324
4.038	158.481
4.038	163.044
5.003	146.387
5.003	148.668
5.017	156.274
5.032	168.442
5.043	137.265
6.012	176.122
6.012	182.966
6.025	168.518
6.027	192.092
7.006	189.885
7.006	191.406
7.017	147.301
7.019	176.959
7.020	187.605
7.020	199.012
7.021	205.856
8.013	189.962
8.014	202.129
8.027	199.088
9.021	215.894
9.022	222.738
9.047	190.801];
data.tL_mW(:,1) = (.5 + data.tL_mW(:,1)) * 365; % convert yr to f
n=size(data.tL_mW,1); for i=2:n; if data.tL_mW(i,1)<=data.tL_mW(i-1,1); data.tL_mW(i,1)=data.tL_mW(i-1,1)+1e-3; end; end
units.tL_mW = {'d', 'cm'}; label.tL_mW = {'time since birth', 'LJFL', 'male'};  
temp.tL_mW  = C2K(20); units.temp.tL_mW = 'K'; label.temp.tL_mW = 'temperature';
bibkey.tL_mW = 'WangLin2010';
comment.tL_mW = 'males West Indian';
%
data.tL_fE = [ ... time since birth (yr), lower jaw fork length (cm)
0.956	70.909
0.956	74.545
0.971	65.455
0.971	67.273
0.985	61.818
0.985	80.000
0.985	82.727
0.985	84.545
0.985	88.182
0.985	90.000
0.985	96.364
0.985	102.727
0.985	150.000
1.000	90.909
1.000	94.545
1.000	104.545
1.000	108.182
1.000	119.091
1.015	112.727
1.015	114.545
2.000	98.182
2.000	101.818
2.000	104.545
2.000	107.273
2.000	109.091
2.000	154.545
2.015	112.727
2.015	115.455
2.015	118.182
2.015	132.727
2.015	142.727
2.015	146.364
2.029	123.636
2.029	126.364
2.029	128.182
2.029	130.000
2.029	139.091
3.000	112.727
3.000	117.273
3.000	150.909
3.000	151.818
3.000	160.000
3.015	92.727
3.015	125.455
3.015	129.091
3.015	131.818
3.015	137.273
3.015	144.545
3.015	147.273
3.015	162.727
3.015	170.000
3.029	121.818
3.029	140.909
3.029	154.545
3.985	142.727
3.985	146.364
3.985	150.000
3.985	154.545
4.000	136.364
4.000	140.909
4.000	162.727
4.000	167.273
4.000	175.455
4.000	180.000
4.000	185.455
4.000	189.091
4.015	160.909
4.015	184.545
4.029	132.727
4.044	159.091
4.044	173.636
5.000	122.727
5.000	150.000
5.000	176.364
5.015	156.364
5.015	158.182
5.015	163.636
5.015	165.455
5.015	169.091
5.015	170.909
5.015	174.545
5.015	178.182
5.015	181.818
5.015	185.455
5.015	189.091
5.015	196.364
5.015	200.000
5.015	203.636
5.029	192.727
5.985	180.909
6.000	166.364
6.000	169.091
6.000	172.727
6.000	175.455
6.000	179.091
6.000	199.091
6.000	214.545
6.015	184.545
6.015	186.364
6.015	191.818
6.015	248.182
6.029	188.182
6.956	195.455
6.971	189.091
6.971	198.182
7.000	183.636
7.000	248.182
7.015	205.455
7.985	196.364
8.000	180.909
8.000	185.455
8.000	201.818
8.000	209.091
8.000	224.545
9.000	203.636
9.985	207.273
9.985	224.545];
data.tL_fE(:,1) = (.5 + data.tL_fE(:,1)) * 365; % convert yr to f
n=size(data.tL_fE,1); for i=2:n; if data.tL_fE(i,1)<=data.tL_fE(i-1,1); data.tL_fE(i,1)=data.tL_fE(i-1,1)+1e-3; end; end
units.tL_fE   = {'d', 'cm'};  label.tL_fE = {'time since birth', 'LJFL', 'female'};  
temp.tL_fE    = C2K(20);  units.temp.tL_fE = 'K'; label.temp.tL_fE = 'temperature';
bibkey.tL_fE = 'WangLin2010';
comment.tL_fE = 'females East Indian';
%
data.tL_mE = [ ... time since birth (yr), lower jaw fork length (cm)
0.985	114.932
1.000	71.493
1.000	74.208
1.000	104.977
1.000	109.502
1.000	111.312
1.000	129.412
1.015	65.158
1.015	65.158
1.015	66.968
1.015	76.923
1.015	83.258
1.015	83.258
1.015	86.878
1.015	87.783
1.015	91.403
1.015	119.457
1.029	99.548
2.015	104.072
2.015	108.597
2.015	111.312
2.015	115.837
2.015	136.652
2.015	142.081
2.015	156.561
2.029	91.403
2.029	97.738
2.029	120.362
2.029	123.982
2.029	127.602
2.029	133.937
2.029	142.986
2.029	147.511
3.015	114.932
3.015	145.701
3.015	150.226
3.015	165.611
3.029	93.213
3.029	110.407
3.029	153.846
3.029	154.751
3.029	156.561
3.029	157.466
3.029	169.231
3.044	100.452
3.044	121.267
3.044	123.982
3.044	129.412
3.044	138.462
3.044	143.891
3.059	161.991
4.015	128.507
4.015	146.606
4.015	184.615
4.029	130.317
4.029	133.937
4.029	143.891
4.029	152.941
4.029	162.896
4.029	165.611
4.029	171.041
4.044	139.367
5.029	141.176
5.029	143.891
5.029	152.941
5.029	156.561
5.044	148.416
5.044	150.226
5.044	163.801
5.044	165.611
5.044	169.231
5.044	169.231
6.000	178.281
6.015	176.471
6.015	187.330
6.015	190.045
7.015	149.321
7.015	175.566
8.015	195.475
8.015	209.955
8.029	202.715
10.015	215.385];
data.tL_mE(:,1) = (.5 + data.tL_mE(:,1)) * 365; % convert yr to f
n=size(data.tL_mE,1); for i=2:n; if data.tL_mE(i,1)<=data.tL_mE(i-1,1); data.tL_mE(i,1)=data.tL_mE(i-1,1)+1e-3; end; end
units.tL_mE = {'d', 'cm'}; label.tL_mE = {'time since birth', 'LJFL', 'male'};  
temp.tL_mE  = C2K(20); units.temp.tL_mE = 'K'; label.temp.tL_mE = 'temperature';
bibkey.tL_mE = 'WangLin2010';
comment.tL_mE = 'males East Indian';

% LW-data from WangLin2010, sexes combined
data.LW = [ ... % lower jaw fork length (cm) wet weight (g)
60.171	730.514
60.559	1155.989
60.559	2434.398
61.335	2006.938
62.112	727.205
63.276	2429.766
64.053	-554.512
65.217	295.775
65.994	3277.407
66.382	3276.745
66.770	1571.538
67.547	-134.331
69.099	4976.658
70.264	1139.446
71.817	1562.936
71.817	7954.981
72.593	4970.703
72.981	2839.360
73.370	4969.380
77.640	1553.010
77.640	4535.965
77.640	9649.601
79.969	1122.904
80.357	696.105
81.522	4529.348
82.686	1970.544
83.463	3247.630
83.463	7508.994
84.239	6229.261
84.239	10064.488
86.568	2816.200
86.957	4093.947
87.345	7076.240
90.062	3236.381
90.839	4087.330
90.839	5791.876
91.615	2807.598
92.003	8772.845
92.780	3657.886
93.168	7066.315
93.168	7918.587
93.556	11327.017
93.944	5360.446
95.109	10045.961
98.214	3648.622
98.602	10040.005
99.379	5777.318
99.379	7481.864
100.155	16429.404
100.155	28361.222
102.096	60318.141
102.484	5772.025
103.261	5770.701
104.425	10030.080
105.202	20256.029
105.590	7471.277
111.025	4905.195
111.025	10871.104
112.578	10016.184
112.966	12998.477
113.742	12144.881
114.130	14701.037
114.519	10439.012
114.519	12143.557
114.519	21518.557
114.907	5750.850
115.683	12141.572
115.683	23221.118
117.236	9155.971
117.236	12138.926
118.012	15546.693
118.012	22364.875
118.012	27052.375
118.012	30035.329
118.401	8727.850
118.789	8301.051
118.789	15971.506
119.565	13413.364
119.953	15117.248
119.953	18952.475
119.953	18952.475
119.953	19804.748
120.342	11707.496
120.342	22787.041
121.506	17245.283
122.283	29175.778
122.671	8720.571
122.671	15964.889
122.671	17669.434
123.059	9572.182
123.059	9572.182
123.059	22782.409
123.835	16815.177
123.835	25764.040
124.612	9995.671
124.612	10421.808
124.612	18944.535
125.776	35135.732
126.165	9140.752
126.165	16811.206
126.941	18940.565
128.494	30869.736
128.882	13397.484
129.270	9135.458
129.270	26607.049
129.658	20214.342
129.658	46634.797
130.047	20639.817
130.435	24048.246
130.435	25326.655
130.435	32144.837
130.823	49189.630
131.211	12115.104
131.211	34274.195
131.599	27881.488
131.988	22341.054
132.376	35124.483
133.929	9979.791
135.093	27449.396
135.093	36398.260
135.481	41937.371
135.870	23186.709
135.870	31283.300
136.258	34691.729
137.422	23184.062
137.422	24462.472
137.811	21052.719
138.199	27017.966
138.587	19346.850
138.587	20199.123
138.975	32130.279
139.363	29146.663
139.752	39799.410
140.140	15082.840
140.528	25735.587
140.916	26161.062
141.693	27864.284
142.081	17210.213
142.081	25306.804
142.081	34681.804
142.469	22323.188
142.857	30845.253
143.245	20617.319
143.245	42350.273
143.245	44054.819
144.410	34677.834
144.798	38086.263
144.798	39790.808
144.798	44904.445
145.575	29988.349
145.575	33397.439
145.575	36380.394
145.963	82402.460
147.127	19332.293
148.292	14642.808
149.457	20180.595
149.457	44470.368
149.845	32111.752
149.845	43617.433
149.845	49157.206
151.009	22308.630
152.174	32533.918
152.562	15913.938
154.503	12075.402
154.503	43183.357
154.503	47018.584
154.891	22302.013
154.891	34233.831
154.891	57671.331
155.668	35510.917
156.832	42753.250
156.832	46162.341
157.220	59798.043
157.997	44881.947
157.997	45308.083
157.997	45734.220
159.550	39765.664
159.938	62350.229
159.938	63202.502
159.938	64907.047
160.326	36781.386
160.326	39338.204
160.714	36354.588
161.102	24422.108
161.491	35074.855
161.491	45302.128
161.879	29960.557
162.267	41039.441
162.655	70016.052
163.043	42316.526
163.043	48282.436
163.043	64901.754
164.596	57654.789
164.984	31233.673
164.984	50409.809
165.373	41886.420
165.373	66176.193
165.761	61488.031
166.149	41885.096
166.149	42311.233
166.149	49555.551
166.537	30378.753
166.537	31231.026
166.537	70009.435
166.925	29099.682
167.314	39326.293
167.314	39326.293
168.090	65319.288
168.090	66597.697
168.478	39750.444
169.255	45715.030
169.255	47845.712
169.255	60203.667
169.255	75544.576
169.643	37191.641
169.643	44009.823
169.643	51680.278
170.031	30798.934
170.031	43156.889
170.031	54662.570
170.031	54662.570
170.419	46991.454
170.419	55940.318
170.419	56366.454
170.807	49547.611
171.196	39319.676
171.584	79375.833
172.360	50397.237
173.137	52526.595
173.525	38889.570
175.078	45705.105
175.078	46131.241
175.078	46983.514
175.078	83631.241
175.466	48687.397
175.854	52095.827
176.242	49964.483
176.630	45276.321
177.407	38882.953
177.407	38882.953
177.407	39309.089
177.795	41865.245
178.571	64875.286
178.960	45272.351
179.348	79362.599
180.124	61463.548
180.124	97259.002
180.512	49531.068
180.512	66150.386
180.512	90866.295
181.289	62313.836
181.289	68705.881
181.677	45267.719
182.065	44840.921
182.842	29498.689
182.842	74669.143
183.230	46969.618
183.230	47821.891
183.230	58901.436
183.230	71685.527
183.230	71685.527
183.230	87026.436
184.006	62735.340
184.394	61030.133
185.171	90006.082
185.559	78073.602
185.947	69976.350
186.335	52077.961
186.335	67845.006
186.724	58469.344
187.500	50371.430
187.500	56763.476
187.888	89575.314
188.276	67841.698
188.665	78068.309
189.441	83180.622
189.441	83606.758
189.441	87441.985
189.829	69117.460
189.829	97242.460
190.217	67412.253
190.217	70395.207
190.606	75082.046
190.606	86587.727
190.606	94684.318
190.994	69967.748
191.382	58035.268
191.382	72097.768
191.770	64000.515
191.770	89568.697
192.158	61016.899
192.547	42266.237
193.711	57179.025
193.711	78059.707
193.711	78485.843
194.488	81893.610
194.876	89989.540
195.264	53767.287
196.040	60584.145
196.040	98510.282
196.429	81464.166
197.593	94246.271
197.981	56745.610
197.981	60154.701
197.981	78478.564
198.758	104897.695
199.534	75919.099
199.534	92538.417
199.534	104896.372
199.922	81884.347
199.922	89980.937
200.311	103190.503
200.699	86570.523
201.863	60574.220
202.640	63555.851
202.640	91680.851
203.028	87418.826
203.028	89975.644
203.804	76337.957
203.804	96792.502
204.193	74206.613
204.193	78467.977
204.193	94235.022
204.581	91677.543
204.581	105740.043
206.134	84430.578
206.134	129601.032
206.522	72071.961
206.910	102326.981
207.686	66104.067
207.686	90819.976
207.686	119797.249
208.075	92097.724
208.075	96359.087
208.463	89540.244
208.463	96784.562
209.239	90817.329
209.627	69935.986
209.627	86981.440
209.627	108714.395
210.016	83145.551
210.016	85276.233
210.016	97634.188
210.016	121923.960
210.404	92093.753
210.404	96781.253
211.180	83569.703
211.957	73767.243
212.345	60130.218
212.733	109561.374
213.121	85270.940
213.121	87827.758
214.674	71205.793
214.674	115523.975
214.674	129586.475
214.674	140666.020
215.062	78875.586
215.062	94642.631
215.839	72056.080
215.839	83561.762
216.615	99327.484
216.615	112111.575
218.556	92505.994
218.556	97619.630
219.720	99748.327
219.720	104435.827
220.109	117219.256
222.826	95481.670
223.602	78008.755
223.991	114229.685
224.767	98887.452
224.767	110393.134
225.155	104000.427
225.543	93772.492
226.708	114225.053
227.484	90786.229
227.873	139365.113
228.261	94620.133
228.261	99307.633
229.814	97174.305
232.531	134243.536
237.966	144887.682
238.354	140625.656
238.742	129971.585
240.295	140196.211
244.565	104819.614
244.565	132944.614
247.671	169587.048
250.000	174270.578
251.941	91170.678
252.329	134209.789
270.186	175940.715];
units.LW = {'cm', 'g'};     label.LW = {'LJFL', 'wet weight'};  
bibkey.LW = 'WangLin2010';
comment.LW = 'sexes combined';

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
set1 = {'tL_fW','tL_mW'}; subtitle1 = {'West Indian data for females, males '};
set2 = {'tL_fE','tL_mE'}; subtitle2 = {'East Indian data for females, males '};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Surface to a depth of 550 m; Stomage analysis: 82% had eaten squid and 53% had eaten fish. have special organs next to their eyes to heat their eyes and brain. Temperatures of 10 to 15 C above the surrounding water temperature have been measured.';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Larval prickly scales are lost during development';
metaData.bibkey.F2 = 'lib'; 
F3 = 'LJFL = 7.7911 + 1.0647 EFL (lower jaw versus eye fork length in cm';
metaData.bibkey.F3 = 'WangSun2003'; 
F4 = 'FL = 20.6207 + 1.4847 EFL';
metaData.bibkey.F4 = 'NOAA'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '7G9C4'; % Cat of Life
metaData.links.id_ITIS = '172482'; % ITIS
metaData.links.id_EoL = '46581460'; % Ency of Life
metaData.links.id_Wiki = 'Xiphias_gladius'; % Wikipedia
metaData.links.id_ADW = 'Xiphias_gladius'; % ADW
metaData.links.id_Taxo = '46706'; % Taxonomicon
metaData.links.id_WoRMS = '127094'; % WoRMS
metaData.links.id_fishbase = 'Xiphias-gladius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xiphias_gladius}}';
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
bibkey = 'WangLin2010'; type = 'Article'; bib = [ ... 
'author = {S.-P. Wang, C.-H. Lin and W.-C. Chiang}, ' ... 
'year = {2010}, ' ...
'title = {Age and growth analysis of swordfish (\emph{Xiphias gladius}) in the {I}ndian {O}cean based on the specimens collected by {T}aiwanese observer program}, ' ...
'howpublished = {\url{http://www.iotc.org/files/proceedings/2010/wpb/IOTC-2010-WPB-08-rev1.pdf}}, ' ...
'journal = {IOTC-2010-WPB-08}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WangSun2003'; type = 'Article'; bib = [ ... 
'author = {S.-P. Wang, C.-L. Sun and S.-Z. Yeh}, ' ... 
'year = {2003}, ' ...
'title = {Sex Ratios and Sexual Maturity of Swordfish (\emph{Xiphias gladius} {L}.) in the Waters of {T}aiwan}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {42}, ' ...
'pages = {529--539}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NOAA'; type = 'Misc'; bib = [ ... 
'author = {Uchiyama, J. H. and DeMartini, E. E. and Williams, H. A.}, ' ... 
'year = {1999}, ' ...
'title = {Length-weight interrelationships for swordfish, \emph{Xiphias gladius} {L}., caught in the central {N}orth {P}acific}, ' ...
'journal = {NOAA technical merorandum NMFS}, ' ...
'howpublished = {\url{http://www.nmfs.hawaii.edu/tech/NOAA_Tech_Memo_284.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FAO'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/species/2503/en}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'lib'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.thefreelibrary.com/The+early+life+history+of+swordfish+Xiphias+gladius+in+the+western...-a0111201172}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

