function [data, auxData, metaData, txtData, weights] = mydata_Branchiostoma_floridae

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Leptocardii'; 
metaData.order      = 'Amphioxiformes'; 
metaData.family     = 'Branchiostomidae';
metaData.species    = 'Branchiostoma_floridae'; 
metaData.species_en = 'Florida lancelet'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30.5); % K, body temperature
metaData.data_0     = {'ab'; 'aj_T'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Le_T'; 't-L'; 'T-JO'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2011 10 11];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 09]; 



%% set data
% zero-variate data;
data.ab = 2.5;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'StokHoll1995';    
  temp.ab = C2K(30.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ab = 1 d in Stok1996 but tLe-data below strongly suggest a larger value';
data.aj_30 = 28;   units.aj_30 = 'd'; label.aj_30 = 'age at metam at 30 C'; bibkey.aj_30 = 'StokHoll1995';
  temp.aj_30 = C2K(30); units.temp.aj_30 = 'K'; label.temp.aj_30 = 'temperature';
data.aj_22 = 45;   units.aj_22 = 'd'; label.aj_22 = 'age at metam at 22 C'; bibkey.aj_22 = 'StokHoll1995';
  temp.aj_22 = C2K(22.5); units.temp.aj_22 = 'K'; label.temp.aj_22 = 'temperature';
data.ap = 6*7;     units.ap = 'd';    label.ap = 'age at puberty';          bibkey.ap = 'StokHoll1995';
  temp.ap = C2K(30.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 5.5*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'StokHoll1995';   
  temp.am = C2K(30.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = .3;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Stok1996';
data.Lj  = .5;   units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'Stok1996';
data.Lp  = 2.3;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'StokHoll1995';
data.Li  = 6.0;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'SaitMimu2005';
 comment.Li = 'for B. belcheri';

data.Wwb =  7.2215e-05;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'estimated';
  comment.Wwb = 'Wb = 2.357e-3 * Lb^2.895';
data.Wwj = 3.1687e-04;   units.Wwj = 'g';   label.Wwj = 'wet weight at metam';      bibkey.Wwj = 'estimated';
  comment.Wwj = 'Wj = 2.357e-3 * Lj^2.895';
data.Wwp = 0.0263;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'estimated';
  comment.Wwp = 'Wp = 2.357e-3 * Lp^2.895';
data.Wwi =  0.4218; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'estimated';
  comment.Wwi = 'Wi = 2.357e-3 * Li^2.895';

data.Ri  = 3000/12; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'StokHoll1995';   
  temp.Ri = C2K(30.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1000 till 5000 eggs per 2 weeks';

% uni-variate data at f
data.TO_01 = [ ... temp (C), O2 consumption (ml/h.g) of 0.01 g dry weight
10	1.1141
13	1.5821
15	1.9839
19	3.2273];
units.TO_01 = {'C', 'ml/h.g'};     label.TO_01 = {'temp', 'O2 consumption', '0.01 g dry wght'};  bibkey.TO_01 = 'CourNewe1965';
% Fig 8 on B. lanceolatum%
%
data.TO_02 = [ ... temp (C), O2 consumption (ml/h.g) of 0.02 g dry weight
10	0.4050
13	0.5883
15	0.7547
19	1.2775];
units.TO_02 = {'C', 'ml/h.g'};     label.TO_02 = {'temp', 'O2 consumption', '0.02 g dry wght'};  bibkey.TO_02 = 'CourNewe1965';
% Fig 8 on B. lanceolatum%
%
data.TO_03 = [ ... temp (C), O2 consumption (ml/h.g) of 0.03 g dry weight
10  0.2154
13	0.3202
14	0.4274
19	0.7746];
units.TO_03 = {'C', 'ml/h.g'};     label.TO_03 = {'temp', 'O2 consumption', '0.03 g dry wght'};  bibkey.TO_03 = 'CourNewe1965';
% Fig 8 on B. lanceolatum%
%
data.TO_04 = [ ... temp (C), O2 consumption (ml/h.g) of 0.04 g dry weight
10	0.1415
13	0.2138
15	0.2937
19	0.5262];
units.TO_04 = {'C', 'ml/h.g'};     label.TO_04 = {'temp', 'O2 consumption', '0.04 g dry wght'};  bibkey.TO_04 = 'CourNewe1965';
% Fig 8 on B. lanceolatum%

% Data from YamaHenm2003 Tab 1 on B. belcheri
% length (mm), dry body weights (mg); f might be low
%   males, females before 1st spawning
%   males, females after 1st spawning
%   m+f before 2nd spawning, non-reprod 
LW_mf = [ ...
30 151.5 153.7 104.2 106.2 113.6  92.5
35 242.7 246.2 167.0 168.9 178.9 148.4
40 365.1 370.2 251.3 252.3 265.1 223.4
45 523.5 530.5 360.5 359.6 375.1 320.5
50 722.6 731.9 497.7 493.6 511.6 442.7
55 967.2 979.3 665.3 657.4 677.4 592.9];

% Data from Stok96 on B. floridae at T = 273+30.5
data.tL_92 = [ ... time since settlement (d), length (cm) in 1992
1.3777	0.8006
2.5014	0.8662
3.3996	0.8989
4.2965	0.8988
4.9729	0.9907
6.3214	1.0693
7.6723	1.2071
8.5705	1.2398
9.4692	1.2857
10.1426	1.3053
10.5940	1.3775
11.7175	1.4364
12.3923	1.4889
13.5131	1.4822
14.1881	1.5413
15.0869	1.5871
15.5372	1.6330
15.9877	1.6855
16.8854	1.7051
17.1128	1.7839
18.4581	1.7838
18.9087	1.8362
20.4803	1.8886
20.9303	1.9280
21.8307	2.0132
22.0458	1.7900
22.9467	1.8884
23.6276	2.0918
24.0798	2.1837
24.2960	1.9868
24.9788	2.2361
25.4170	1.9867
25.6455	2.0917
26.5504	2.2885
26.9948	2.1900
27.2233	2.2950
28.3404	2.1965
28.5721	2.3802
29.4649	2.2817
29.6940	2.3998
29.6985	2.5114
30.8177	2.4654
31.2699	2.5572
32.8370	2.4980
33.2897	2.6030
34.1903	2.6948
34.8592	2.6029
35.5393	2.7866
36.2128	2.8062
36.4322	2.6881
37.1096	2.8062
37.3290	2.6880
38.2262	2.6945
38.2323	2.8455
39.1249	2.7404
40.2481	2.7928
40.4766	2.8978
41.1509	2.9371
42.2682	2.8451
42.4986	2.9961
44.0675	2.9828
45.4171	3.0877
46.3161	3.1402
47.4353	3.0941
49.2319	3.1662
50.3519	3.1398
50.8044	3.2383
50.8076	3.3170
52.6032	3.3628
53.0463	3.2315
54.6187	3.3036
55.7398	3.3035
57.3128	3.3887
58.6581	3.3886
59.7791	3.3885
60.2294	3.4344
61.5774	3.4999
62.0296	3.5918
63.1506	3.5917
63.3711	3.4998
64.9449	3.6047
65.1715	3.6637
67.1865	3.5914
69.2068	3.6503
69.8773	3.5977
71.2245	3.6436
71.8998	3.7092
73.0206	3.7025
73.4669	3.6500
75.0364	3.6498
75.9357	3.7088
77.5081	3.7809
78.4079	3.8530
79.3018	3.7808
80.4269	3.8791
81.5488	3.8987
83.1180	3.8920
84.0133	3.8526
85.1317	3.7869
86.2570	3.8918
87.6023	3.8917
88.4992	3.8916
88.9476	3.8916
90.0690	3.8981];
units.tL_92 = {'d', 'cm'};  label.tL_92 = {'time since settlement', 'length', '1992'};  
temp.tL_92 = C2K(30.5); units.temp.tL_92 = 'K'; label.temp.tL_92 = 'temperature';
bibkey.tL_92 = 'Stok1996'; 
 
% Data from Stok96 on B. floridae at T = 273+30.5 (15C in winter, 33C in summer)
data.tL_93 = [ ... time since settlement (d), length (cm) in 1993
0.2486	0.6038
1.5939	0.6037
2.2665	0.6037
2.4923	0.6430
3.3876	0.6036
3.3913	0.6955
4.2871	0.6691
4.2906	0.7545
4.7366	0.6953
5.6359	0.7543
5.8579	0.7018
6.5338	0.7805
6.9806	0.7411
7.6578	0.8526
7.8775	0.7410
8.1041	0.8001
8.5547	0.8526
9.6733	0.7934
9.6790	0.9312
9.9016	0.8918
10.1218	0.7934
10.1239	0.8459
10.1282	0.9509
11.2450	0.8458
11.2469	0.8917
11.6974	0.9442
13.4909	0.9375
13.4930	0.9900
14.3901	0.9965
14.8396	1.0227
15.7402	1.1145
15.7434	1.1933
16.1849	1.0226
17.5340	1.1144
18.6561	1.1406
18.6585	1.1996
18.6617	1.2784
20.0017	1.1470
20.0070	1.2783
20.2331	1.3242
20.2358	1.3898
20.6767	1.2060
20.6796	1.2782
21.3501	1.2257
22.0338	1.4947
22.7021	1.3896
23.8192	1.2911
23.8203	1.3174
24.0474	1.3895
24.5001	1.4945
24.5041	1.5930
24.7160	1.2910
25.6169	1.3894
26.5175	1.4812
26.9702	1.5862
27.8628	1.4811
27.8674	1.5927
28.5421	1.6451
29.4369	1.5926
29.4390	1.6451
29.6656	1.7041
31.4548	1.5924
31.6838	1.7105
31.9054	1.6449
33.2533	1.7104
34.1518	1.7497
34.5986	1.7103
35.4952	1.7037
36.3961	1.8020
36.8424	1.7495
37.9634	1.7494
38.1898	1.8019
39.3106	1.7953
39.5369	1.8477
40.4359	1.9002
41.7767	1.7885
41.7815	1.9066
42.0135	2.0969
42.6805	1.9591
43.1265	1.9000
43.1308	2.0050
44.7022	2.0508
44.7083	2.2017
44.9245	2.0048
46.0485	2.0769
46.7300	2.2935
47.3946	2.0965
47.3984	2.1884
48.7501	2.3458
49.1889	2.1095
49.8714	2.3523
50.3113	2.1422
50.5379	2.2013
50.9946	2.4047
51.2167	2.3522
52.3415	2.4440
52.7803	2.2077
53.2392	2.4636
55.2571	2.4634
55.2582	2.4897
55.4728	2.2534
56.5952	2.2861
56.6061	2.5552
56.8223	2.3583
56.8280	2.4961
57.5054	2.6142
58.8403	2.3582
59.7486	2.6403
60.1853	2.3515
60.8625	2.4630
60.8697	2.6402
61.0958	2.6861
61.3219	2.7321
61.7684	2.6861
62.2075	2.4563
63.7885	2.7384
64.0012	2.4562
64.0154	2.8040
64.2348	2.6859
65.1236	2.4889
66.0207	2.4954
66.7060	2.8038
66.9205	2.5675
67.3717	2.6331
68.0462	2.6790
68.0531	2.8497
68.2744	2.7775
69.8426	2.7445
70.2942	2.8232
70.7466	2.9217
71.1932	2.8757
72.0933	2.9544
73.6628	2.9542
74.7838	2.9542
75.4578	2.9869
75.9049	2.9541
77.2518	2.9933
77.2542	3.0524
77.9282	3.0852
79.4961	3.0457
79.4980	3.0916
79.9443	3.0391
81.0704	3.1637
81.2922	3.1046
81.2957	3.1899
82.1891	3.1045
82.8652	3.1898
83.3102	3.1044
84.4342	3.1765
85.1098	3.2487
86.2279	3.1764
86.4550	3.2486
86.9064	3.3207
87.3492	3.1829
87.8003	3.2485
88.4706	3.1894
88.4751	3.3009
88.9214	3.2484
88.9262	3.3665
89.3674	3.1893
90.2675	3.2680
90.2715	3.3664
90.4885	3.1892
91.3853	3.1891
92.0604	3.2481
92.9549	3.1890
93.6323	3.3071
94.3050	3.3070
95.8742	3.3003
96.1008	3.3594
98.3443	3.3920
101.2610	3.4377
101.9371	3.5230
103.9545	3.5097
105.5277	3.6015
107.9935	3.5882
109.1173	3.6537
109.3434	3.6996
111.1374	3.7061
112.0342	3.7060
112.2606	3.7585
114.7267	3.7517
114.9536	3.8173
115.3993	3.7517
116.5225	3.8041
117.8654	3.7449
118.7647	3.8039
119.6637	3.8563
120.7826	3.8038
121.2337	3.8693
122.1279	3.8036
123.0272	3.8626
124.3700	3.8035
125.0451	3.8625
125.9387	3.7837
127.2894	3.9148
127.5112	3.8557
128.4080	3.8557
130.6502	3.8555
131.9949	3.8422
133.3402	3.8421
134.0145	3.8815
135.5850	3.9076
136.0356	3.9601
138.5017	3.9533
138.5033	3.9927
139.6247	3.9992
140.5255	4.0975
140.7460	4.0056
142.3195	4.1040
143.8890	4.1038
145.0079	4.0512
145.0101	4.1038
146.1312	4.1037
147.0277	4.0970
147.6966	4.0051
148.5972	4.0969
149.2728	4.1690
150.3910	4.0968
151.0636	4.0967
151.9653	4.2148
153.5348	4.2147
153.9853	4.2671
155.1043	4.2145
157.3499	4.2997
159.3678	4.2995
160.7158	4.3650
162.0632	4.4174
169.6948	4.6203
171.0369	4.5414
172.6096	4.6201
173.5016	4.5019
175.0714	4.5083
175.5241	4.6133
176.4167	4.5082
177.9902	4.6065
178.8831	4.5080
179.7842	4.6129
181.5731	4.4947
182.0253	4.5865
183.5910	4.4945
184.9414	4.6191
185.3850	4.5009
186.5061	4.5008
187.4029	4.5008
188.3027	4.5729
188.3052	4.6320
190.9933	4.5727
191.2149	4.5070
192.3359	4.5069
193.4613	4.6119
195.0335	4.6774
196.1529	4.6379
197.0487	4.6116
197.0522	4.6969
198.8443	4.6574
199.7393	4.6114
201.5314	4.5719
202.2041	4.5718
202.8804	4.6636
203.3281	4.6439
205.3471	4.6700
207.5860	4.5911
207.5884	4.6501
209.6090	4.7156
211.6237	4.6367
215.2144	4.7152
216.7817	4.6625
218.1270	4.6624
220.5910	4.6032
221.4900	4.6556
222.1656	4.7277
223.9590	4.7210];
units.tL_93 = {'d', 'cm'}; label.tL_93 = {'time since settlement', 'length', '1993'};  
temp.tL_93 = C2K(30.5); units.temp.tL_93 = 'K'; label.temp.tL_93 = 'temperature';
bibkey.tL_93 = 'Stok1996'; 

% Data from Stok96 on B. floridae at T = 273+30.5
data.tL_94 = [ ... time since settlement (d), length (cm) in 1994
0.9215	0.6103
1.3737	0.7022
2.2743	0.7940
3.1722	0.8202
3.6230	0.8792
4.9659	0.8200
5.1917	0.8594
6.3141	0.8921
7.8844	0.9117
8.3321	0.8920
8.7805	0.8919
9.2321	0.9707
11.0291	1.0493
13.0478	1.0688
14.1710	1.1212
15.2939	1.1671
15.5206	1.2261
17.3183	1.3244
20.4597	1.3833
21.1369	1.4948
22.2617	1.5866
24.5087	1.7045
27.8756	1.7962
30.5740	1.9863
31.0149	1.8025
31.0278	2.1175
32.1363	1.8089
32.3648	1.9139
32.3725	2.1043
33.0494	2.2092
33.9498	2.2945
34.6104	1.9991
34.8308	1.9072
36.1796	1.9924
36.4084	2.1040
36.6401	2.2877
38.4295	2.1826
38.8825	2.2941
39.3355	2.4056
39.9996	2.1956
40.6891	2.6090
40.9004	2.2939
42.0343	2.6089
42.2457	2.2938
43.1594	2.7072
43.3711	2.3987
45.1648	2.3986
45.1814	2.8055
45.8377	2.4051
46.0737	2.6939
48.7688	2.8052
50.5655	2.8773
51.9110	2.8838
51.9164	3.0150
53.9295	2.8967
54.3900	3.1920
55.2828	3.0935
56.1759	3.0016
56.1799	3.1000
57.0805	3.1918
57.9736	3.0999
59.3227	3.1916
59.5429	3.0932
59.7757	3.3032
59.9913	3.0931
61.1215	3.3162
61.7850	3.0930
62.6862	3.1979
64.0440	3.5063
64.2599	3.3028
65.8249	3.1911
66.7220	3.1976
66.9588	3.5061
68.2961	3.3091
70.0901	3.3155
70.0935	3.4008
70.9869	3.3154
72.1157	3.5057
72.3357	3.4006
73.4568	3.4006
73.4610	3.5056
73.6727	3.1971
73.6890	3.5974
74.3584	3.5186
76.1473	3.4003
76.1516	3.5054
77.5052	3.7087
77.9453	3.5052
78.1730	3.5905
80.4154	3.5969
81.9932	3.8002
82.6624	3.7149
83.1231	4.0167
84.0074	3.7082
86.4781	3.8130
87.1584	4.0033
87.3709	3.7145
88.2632	3.6029
88.7202	3.8128
89.1764	4.0031
90.0732	4.0031
91.1863	3.8061
91.6427	4.0029
92.0829	3.7994
92.3111	3.8979
93.2163	4.1013
93.8766	3.7993
94.1048	3.8977
96.1225	3.8910
96.3512	4.0026
96.3553	4.1010
97.4680	3.8975
98.1535	4.2125
98.8133	3.8974
99.2660	4.0023
99.7230	4.2123
100.1669	4.1007
101.2960	4.2975
103.0862	4.2121
103.3139	4.2974
107.3498	4.2971
107.3543	4.4086
108.0310	4.5070
109.1523	4.5135
110.0447	4.4019
112.0671	4.5133
112.7358	4.4148
113.1920	4.6051
113.4124	4.5132
114.7655	4.7034
115.4341	4.6049
118.5736	4.6178
119.9229	4.7161
121.2717	4.8013
121.4884	4.6175
122.6132	4.7093
124.8549	4.6960
129.1152	4.7023
130.2446	4.9056
135.4052	4.9971];
units.tL_94 = {'d', 'cm'}; label.tL_94 = {'time since settlement', 'length'};  
temp.tL_94 = C2K(30.5); units.temp.tL_94 = 'K'; label.temp.tL_94 = 'temperature';
bibkey.tL_94 = 'Stok1996'; 

% Data from StokHoll1995 at T = 273+30 on embryo growth
data.tLe_30 = [ ... % age (d), length (mm)
0.331	0.293
0.430	0.346
0.518	0.462
0.596	0.595
0.673	0.755
0.750	1.101
0.761	0.879
0.783	1.048
0.860	0.995
0.971	1.075
1.026	1.146
1.136	1.172
1.401	1.341
1.864	1.385
2.581	1.350
3.011	1.403
5.936	1.528
9.682	2.078
14.238	2.602
15.858	3.153
17.782	3.428
23.552	3.481
27.501	4.050
30.437	4.512
31.348	4.680
34.385	4.609
36.512	4.805
38.435	4.716];
data.tLe_30(:,2) = data.tLe_30(:,2)/10; % convert mm to cm
units.tLe_30 = {'d', 'cm'}; label.tLe_30 = {'age', 'embryo length', '30 C'};  
temp.tLe_30 = C2K(30); units.temp.tLe_30 = 'K'; label.temp.tLe_30 = 'temperature';
bibkey.tLe_30 = 'StokHoll1995'; 

% Data from StokHoll1995 at T = 273+22.5 on embryo growth
data.tLe_22 = [ ...  % age (d), length (mm)
0.441	0.444
0.750	0.639
0.971	0.773
1.224	1.075
1.390	1.137
1.864	1.226
2.482	1.288
2.978	1.412
4.215	1.377
5.632	1.554
5.936	1.403
6.746	1.554
6.847	1.421
7.657	1.430
7.758	1.572
8.265	1.501
8.771	1.572
8.872	1.421
10.694	1.439
10.694	1.643
11.099	1.723
12.314	1.732
12.416	1.661
12.618	1.439
13.327	1.634
13.428	1.501
13.529	1.705
14.238	1.821
15.959	1.856
17.579	1.901
20.616	2.167
22.540	2.416
24.565	2.558
32.462	3.233
44.510	3.917
51.496	4.121];
data.tLe_22(:,2) = data.tLe_22(:,2)/10; % convert mm to cm
units.tLe_22 = {'d', 'cm'};  label.tLe_22 = {'age', 'embryo length', '22.5 C'};  
temp.tLe_22 = C2K(22.5); units.temp.tLe_22 = 'K'; label.temp.tLe_22 = 'temperature';
bibkey.tLe_22 = 'StokHoll1995'; 

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
set1 = {'tLe_30','tLe_22'}; subtitle1 = {'Data at 30, 22 degr C'};
set2 = {'tL_93','tL_92'}; subtitle2 = {'Data from 1993, 1992'};
set3 = {'TO_04','TO_03','TO_02','TO_01'}; subtitle3 = {'Data for 40, 30, 20 and 10 mg dry weight'};
metaData.grp.sets = {set1, set2, set3};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% Links
metaData.links.id_CoL = 'N6RS'; % Cat of Life
metaData.links.id_ITIS = '159683'; % ITIS
metaData.links.id_EoL = '46557907'; % Ency of Life
metaData.links.id_Wiki = 'Branchiostoma_floridae'; % Wikipedia
metaData.links.id_ADW = 'Branchiostoma_floridae'; % ADW
metaData.links.id_Taxo = '114894'; % Taxonomicon
metaData.links.id_WoRMS = '266208'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Branchiostoma_floridae}}'; 
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
bibkey = 'SaitMimu2005'; type = 'Article'; bib = [ ... 
'author = {Saito, H. and Mimura, K. and Doi, A. and Inoue, E. and Kawai, K. and Imabayashi, H.}, ' ...
'year = {2005}, ' ...
'title  = {Variations in body size of the Lancelet \emph{Branchiostoma belcheri} at different depths in the {S}eto {I}nland {S}ea: {E}ffect of food supply on the growth rate}, ' ...
'journal = {Zool. Sci.}, ' ...
'volume = {22}, ' ...
'pages = {1181--1189}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StokHoll1995'; type = 'Article'; bib = [ ... 
'author = {Stokes, D. M. and Holland, N. D.}, ' ...
'year = {1995}, ' ...
'title  = {Embryos and Larvae of a Lancelet, \emph{Branchiostoma floridae}, from Hatching through Metamorphosis: Growth in the Laboratory and External Morphology}, ' ...
'journal = {Acta Zoologica (Stockholm)}, ' ...
'volume = {76}, ' ...
'pages = {105--120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YamaHenm2003'; type = 'Article'; bib = [ ... 
'author = {Yamaguchi, T. and Henmi, Y.}, ' ...
'year = {2003}, ' ...
'title  = {Biology of the Amphioxus, \emph{Branchiostoma belcheri} in the {A}riake {S}ea, {J}apan II. {R}eproduction.}, ' ...
'journal = {Zool. Sci.}, ' ...
'volume = {20}, ' ...
'pages = {907-918}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CourNewe1965'; type = 'Article'; bib = [ ... 
'author = {Courtney, W. A. M. and Newell, R. C.}, ' ...
'year = {1965}, ' ...
'title  = {Ciliary activity and oxygen uptake in \emph{Branchiostoma lanceolatum} ({P}allas).}, ' ...
'journal = {J. Exp. Biol}, ' ...
'volume = {43}, ' ...
'pages = {1--12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stok1996'; type = 'Article'; bib = [ ... 
'author = {Stokes, M. D.}, ' ...
'year = {2005}, ' ...
'title  = {Larval settlement, post-settlement growth and secondary production of the Florida lancelet (= amphioxus) \emph{Branchiostoma floridae}.}, ' ...
'journal = {Mar Ecol. Prog. Ser}, ' ...
'volume = {130}, ' ...
'pages = {71--84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

