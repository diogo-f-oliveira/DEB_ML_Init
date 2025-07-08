function [data, auxData, metaData, txtData, weights] = mydata_Meganyctiphanes_norvegica

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Euphausiacea'; 
metaData.family     = 'Euphausiidae';
metaData.species    = 'Meganyctiphanes_norvegica'; 
metaData.species_en = 'Northern krill'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MN'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wdb'; 'Wdp'; 'Wdi'}; 
metaData.data_1     = {'t-L_fT'; 'L-JO'; 'L-JX'; 'L-N'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Elisa Ravagnan'};    
metaData.date_subm = [2011 04 12];              
metaData.email    = {'elisa.ravagnan@iris.no'};            
metaData.address  = {'Internat. Research Inst. of Stavanger, Randaberg, Norway'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 09]; 

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Rava2011';   
  temp.ab = C2K(5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 200;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Read from tL-data for Lp';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'arcodiv';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.05; units.L0  = 'cm';  label.L0  = 'egg diameter';            bibkey.Lb  = 'arcodiv';
%data.Lb  = 0.05; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'arcodiv';
data.Lp  = 1.7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Rava2011';
data.Li  = 4.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Tarl2010';

data.Ww0 = 65; units.Ww0 = 'mug';  label.Ww0 = 'initial wet weight';       bibkey.Ww0 = 'arcodiv';
  comment.Ww0 = 'Computed from egg diameter L0 assuming specific density 1 g/cm^3';
data.Wd0 = 7.6; units.Wd0 = 'mug';  label.Wd0 = 'initial dry weight';     bibkey.Wd0 = 'JageRava2016';
data.Wdb = 7.0; units.Wdb = 'mug';  label.Wdb = 'dry weight at birth';  bibkey.Wdb = 'guess';
  comment.Wdb = 'Weight is computed from length, using F3';
data.Wdp = 9.1; units.Wdp = 'mg';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'LindRobi1999';
  comment.Wdp = 'Weight is computed from length, using F3';
data.Wdi = 171;  units.Wdi = 'mg';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'LindRobi1999';
  comment.Wdi = 'Weight is computed from length, using F3';
 
% uni-variate data
% t-L data Fig 2 of JageRava2016: calyptopis and furcilia stages in lab
data.tL_1 = [ ... % time since birth (d), length (cm)
0.094	0.105
3.957	0.173
9.391	0.228
16.390	0.311
20.357	0.391
24.116	0.456
28.396	0.536
33.307	0.591
37.901	0.664
42.182	0.742];
units.tL_1   = {'d', 'cm'};  label.tL_1 = {'time since birth', 'larval length'};  
temp.tL_1    = C2K(10);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1 = {'Roux1974','JageRava2016'};
comment.tL_1 = 'Food: Artemia and algae';
%
data.tL_2 = [ ... % time since birth (d), length (cm)
0.094	0.105
3.960	0.145
10.960	0.223
17.439	0.286
22.558	0.351
27.362	0.426
32.378	0.471
36.451	0.531
41.361	0.591];
units.tL_2   = {'d', 'cm'};  label.tL_2 = {'time since birth', 'larval length'};  
temp.tL_2    = C2K(10);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2 = {'Roux1974','JageRava2016'};
comment.tL_2 = 'Food: Artemia only';
%
data.tL_3 = [ ... % time since birth (d), length (cm)
0.094	0.105
3.855	0.148
11.903	0.213
18.381	0.283
22.663	0.341
28.621	0.386
34.894	0.416];
units.tL_3   = {'d', 'cm'};  label.tL_3 = {'time since birth', 'larval length'};  
temp.tL_3    = C2K(10);  units.temp.tL_3 = 'K'; label.temp.tL_3 = 'temperature';
bibkey.tL_3 = {'Roux1974','JageRava2016'};
comment.tL_3 = 'Food: algae only, every day';
%
data.tL_4 = [ ... % time since birth (d), length (cm)
0.094	0.105
5.110	0.148
12.531	0.203
19.641	0.233
25.911	0.293
32.811	0.328
40.760	0.341];
units.tL_4   = {'d', 'cm'};  label.tL_4 = {'time since birth', 'larval length'};  
temp.tL_4    = C2K(10);  units.temp.tL_4 = 'K'; label.temp.tL_4 = 'temperature';
bibkey.tL_4 = {'Roux1974','JageRava2016'};
comment.tL_4 = 'Food: Artemia and algae';
comment.tL_4 = 'Food: algae only, each other day';
%
data.tL_5 = [ ... % time since birth (d), length (cm)
0.080	0.230
2.052	0.298
3.919	0.376
5.264	0.459
7.968	0.500
10.044	0.573
12.432	0.646
15.446	0.711
18.771	0.797
22.621	0.835];
units.tL_5   = {'d', 'cm'};  label.tL_5 = {'time since birth', 'larval length'};  
temp.tL_5    = C2K(20);  units.temp.tL_5 = 'K'; label.temp.tL_5 = 'temperature';
bibkey.tL_5 = {'Roux1974','JageRava2016'};
comment.tL_5 = 'Food: Artemia and algae';
%
data.tL_6 = [ ... % time since birth (d), length (cm)
0.080	0.230
4.967	0.310
8.395	0.399
12.555	0.467
17.444	0.537
22.747	0.620
27.532	0.691
32.943	0.741
37.732	0.766
43.449	0.882];
units.tL_6   = {'d', 'cm'};  label.tL_6 = {'time since birth', 'larval length'};  
temp.tL_6    = C2K(10);  units.temp.tL_6 = 'K'; label.temp.tL_6 = 'temperature';
bibkey.tL_6 = {'Roux1974','JageRava2016'};
comment.tL_6 = 'Food: Artemia and algae';
%
% t-L data of fig 6 for field population
data.tL = [ ... % time since birth (d), length (cm)
151.723	0.346
151.724	0.676
152.874	0.495
154.023	0.417
164.368	0.456
173.563	0.692
173.564	0.762
174.713	0.629
181.609	0.692
182.759	0.762
194.253	0.762
195.402	0.959
200.000	1.037
212.644	1.092
225.287	1.752
226.437	1.226
226.438	1.611
229.885	0.676
229.886	1.360
231.034	0.998
231.035	1.187
236.782	1.360
243.678	1.603
267.816	1.289
295.402	2.090
331.034	1.988
350.575	2.161
395.402	2.130
409.195	2.263
441.379	2.185
455.172	2.350
490.805	2.428
490.806	2.507
490.807	2.570
510.345	2.633
517.241	2.405
518.391	2.483
519.540	2.585
521.839	2.664
555.172	2.758
555.173	2.821
578.161	2.908
582.759	2.963
591.954	2.868
633.333	3.002
658.621	3.167
691.954	3.112
691.955	3.151
712.644	3.081
759.770	3.104
759.771	3.151
775.862	3.167
818.391	3.049
818.392	3.151
856.322	3.120
856.323	3.183
865.517	3.246
878.161	3.356
888.506	3.230
916.092	3.332
944.828	3.301
944.829	3.458
993.103	3.505
993.104	3.599
1025.287	3.615];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
bibkey.tL = 'JageRava2016';
comment.tL = 'JageRava2016 assume temperature (C): T = 6 + 2 * sin((t-90) * pi * 2/ 365)';


% temperature-respiration data,fig 3 of JageRava2016
data.TJO_1 = [ ... % temperature (C), specific respiration (mumol/g/h)
4	19.278
8	28.048
12	35.617
16	46.788];
units.TJO_1   = {'C', 'mumol/g/h'};  label.TJO_1 = {'temperature', 'specific O_2 consumption'};  
bibkey.TJO_1 = 'JageRava2016';
comment.TJO_1 = 'Length is 3 cm';
%
data.TJO_2 = [ ... % temperature (C), specific respiration (mumol/g/h)
4	23.182
6	32.252
12	41.623
16	54.896];
units.TJO_2   = {'C', 'mumol/g/h'};  label.TJO_2 = {'temperature', 'specific O_2 consumption'};  
bibkey.TJO_2 = 'JageRava2016';
comment.TJO_2 = 'Length is 3 cm';
%
data.TJO_3 = [ ... % temperature (C), specific respiration (mumol/g/h)
4	33.092
8	40.060
12	53.634
16	70.210];
units.TJO_3   = {'C', 'mumol/g/h'};  label.TJO_3 = {'temperature', 'specific O_2 consumption'};  
bibkey.TJO_3 = 'JageRava2016';
comment.TJO_3 = 'Length is 3 cm';
%
data.TJO_4 = [ ... % temperature (C), specific respiration (mumol/g/h)
4	33.693
8	47.567
12	57.539
16	74.716];
units.TJO_4   = {'C', 'mumol/g/h'};  label.TJO_4 = {'temperature', 'specific O_2 consumption'};  
bibkey.TJO_4 = 'JageRava2016';
comment.TJO_4 = 'Length is 3 cm';
%
data.TJO_5 = [ ... % temperature (C), specific respiration (mumol/g/h)
4	38.498
8	50.270
12	69.250
16	91.232];
units.TJO_5   = {'C', 'mumol/g/h'};  label.TJO_5 = {'temperature', 'specific O_2 consumption'};  
bibkey.TJO_5 = 'JageRava2016';
comment.TJO_5 = 'Length is 3 cm';

% length-respiration data,fig 3 of JageRava2016
data.LJO = [ ... % temperature (C), specific respiration (mumol/g/h)
1.010	0.067
1.011	0.044
1.014	0.059
1.015	0.054
1.315	0.017
1.363	0.020
1.389	0.032
1.422	0.009
1.466	0.013
1.488	0.022
1.528	0.016
1.644	0.010
1.670	0.011
1.711	0.009
1.763	0.021
1.767	0.039
1.772	0.032
1.821	0.015
1.843	0.033
1.861	0.030
1.896	0.033
1.914	0.021
1.923	0.024
1.957	0.054
1.959	0.014
1.964	0.016
1.976	0.028
2.008	0.019
2.043	0.019
2.063	0.060
2.066	0.018
2.074	0.023
2.105	0.024
2.106	0.034
2.113	0.037
2.132	0.017
2.149	0.035
2.153	0.044
2.167	0.037
2.189	0.030
2.204	0.016
2.207	0.039
2.212	0.023
2.234	0.037
2.247	0.025
2.278	0.028
2.279	0.015
2.297	0.020
2.318	0.022
2.319	0.024
2.332	0.019
2.341	0.016
2.372	0.027
2.399	0.024
2.402	0.043
2.411	0.018
2.412	0.021
2.426	0.015
2.457	0.021
2.465	0.026
2.470	0.019
2.474	0.028
2.497	0.016
2.500	0.045
2.505	0.022
2.506	0.014
2.528	0.024
2.537	0.022
2.541	0.020
2.550	0.017
2.559	0.025
2.589	0.042
2.594	0.028
2.603	0.022
2.604	0.022
2.605	0.045
2.606	0.026
2.607	0.027
2.612	0.015
2.613	0.017
2.630	0.023
2.652	0.015
2.675	0.019
2.682	0.040
2.683	0.040
2.688	0.017
2.696	0.024
2.705	0.024
2.710	0.020
2.714	0.031
2.740	0.043
2.750	0.019
2.780	0.045
2.784	0.024
2.785	0.027
2.790	0.017
2.791	0.013
2.794	0.021
2.817	0.022
2.826	0.016
2.835	0.012
2.838	0.041
2.879	0.023
2.922	0.040
2.923	0.020
2.949	0.042
2.981	0.021
3.024	0.042
3.078	0.038
3.096	0.040
3.185	0.027
3.239	0.011
3.261	0.020
3.472	0.041
3.473	0.046
3.474	0.036
3.478	0.034
4.034	0.021];
units.LJO   = {'cm', 'g/d.g'};  label.LJO = {'length', 'specific O_2 consumption'};  
temp.LJO    = C2K(9);  units.temp.LJO = 'K'; label.temp.LJO = 'temperature';
bibkey.LJO = 'JageRava2016';

data.LJX = [ ... % length (cm), specific ingestion (g/d.g)
1.595	0.370
1.854	0.411
2.690	0.440
2.062	0.319
2.317	0.279
1.816	0.204
2.547	0.337
2.614	0.273
2.443	0.201
2.621	0.211
2.014	0.136
2.156	0.118
2.127	0.049
2.169	0.039
2.233	0.039
2.240	0.091
2.382	0.091
2.507	0.142
2.617	0.169
2.567	0.178
2.666	0.188
2.741	0.191
2.620	0.163
2.741	0.167
2.424	0.055
2.612	0.045
2.616	0.112
2.587	0.030
2.658	0.020
2.786	0.046
2.740	0.118
2.740	0.123
2.740	0.127
2.846	0.116
3.062	0.108
3.059	0.112
3.041	0.122
3.176	0.140
3.250	0.156];
units.LJX   = {'cm', 'g/d.g'};  label.LJX = {'length', 'specific ingestion'};  
temp.LJX    = C2K(12);  units.temp.LJX = 'K'; label.temp.LJX = 'temperature';
bibkey.LJX = 'JageRava2016';

% length-clutch size, fig 5 of JageRava2016
data.LN = [ ...
2.075	571.360
2.081	416.289
2.188	212.282
2.185	580.515
2.205	1462.203
2.279	628.508
2.341	347.201
2.383	250.098
2.373	162.936
2.347	821.976
2.396	938.019
2.396	1044.608
2.390	1189.989
2.396	1403.135
2.403	763.569
2.455	937.736
2.455	734.248
2.471	753.549
2.519	792.072
2.519	898.662
2.565	995.341
2.497	608.074
2.545	646.598
2.490	530.586
2.490	482.137
2.487	414.323
2.464	230.325
2.523	346.320
2.536	297.808
2.558	239.558
2.601	297.493
2.536	481.916
2.601	413.772
2.604	530.036
2.614	617.198
2.597	559.137
2.597	714.176
2.614	830.376
2.614	898.206
2.604	1053.291
2.623	1150.096
2.656	1101.490
2.649	1430.978
2.604	1547.478
2.688	1585.828
2.711	1701.997
2.698	1769.890
2.669	1915.380
2.682	2099.426
2.675	2370.775
2.860	2243.909
2.854	1904.793
2.766	1672.660
2.692	1353.254
2.744	1323.933
2.731	1265.857
2.688	1169.162
2.685	1120.728
2.734	1120.492
2.753	1091.328
2.776	1226.877
2.802	1255.820
2.821	1352.625
2.857	1643.150
2.912	1623.503
2.935	1855.950
3.042	2058.920
3.088	2223.428
3.140	3356.898
3.084	5120.731
3.984	5164.823
3.542	3422.776
3.451	3171.279
3.393	3074.663
3.497	2841.601
3.662	2976.458
3.675	2714.767
3.731	2792.019
3.503	2366.763
3.471	2240.952
3.442	2086.055
3.474	2008.378
3.532	2153.444
3.334	2338.512
3.237	2406.813
3.188	2009.762
3.182	1903.204
3.101	1797.009
3.003	1593.992
3.039	1748.858
2.964	1623.251
2.916	1449.068
2.896	1604.201
2.896	1332.883
2.880	1332.962
2.864	1274.901
2.831	1207.229
2.799	1158.937
2.893	1177.860
2.909	1294.061
2.935	1361.764
2.958	1225.996
2.951	1138.818
2.948	1090.384
2.929	993.579
2.883	1003.489
2.838	984.329
2.834	1061.865
2.792	1013.619
2.792	974.860
2.760	926.568
2.721	839.547
2.721	936.446
2.727	965.485
2.695	955.952
2.675	839.767
2.653	888.327
2.685	752.511
2.731	800.740
2.731	723.220
2.737	665.050
2.763	674.614
2.766	761.808
2.776	752.070
2.808	906.952
2.802	829.464
2.808	790.672
2.834	742.097
2.870	829.134
2.893	780.574
2.847	616.065
2.799	664.751
2.672	490.945
2.656	636.373
2.763	335.467
2.834	402.950
2.847	402.887
2.880	431.799
2.880	548.078
2.896	538.310
2.912	538.231
2.955	576.786
2.922	644.773
2.961	838.383
2.971	838.336
2.984	944.862
2.987	1022.365
2.844	209.104
2.883	218.605
2.997	247.124
2.974	353.824
2.971	470.119
3.013	421.464
3.068	489.026
3.036	518.253
3.023	615.216
2.994	625.047
3.023	653.975
3.042	731.401
3.068	653.755
3.110	614.791
3.127	721.301
3.153	721.175
3.156	595.191
3.205	507.746
3.208	672.459
3.195	846.940
3.130	924.774
3.114	973.302
3.107	905.504
3.078	1002.545
3.078	925.026
3.029	896.192
3.039	973.664
3.039	1060.874
3.006	1109.480
3.023	1186.921
3.016	1264.472
3.094	1109.056
3.120	1050.790
3.133	1128.247
3.162	1108.725
3.201	1108.537
3.244	875.774
3.279	1001.570
3.260	1001.664
3.308	1088.638
3.308	720.420
3.370	884.850
3.263	1243.897
3.185	1253.964
3.208	1341.063
3.201	1418.614
3.013	1312.937
3.049	1409.664
3.088	1370.715
3.088	1486.994
3.123	1612.790
3.143	1496.417
3.153	1428.540
3.166	1554.446
3.166	1719.175
3.263	1970.641
3.315	1873.490
3.334	1795.876
3.334	1476.109
3.396	1378.910
3.435	1388.412
3.474	1310.704
3.438	1213.977
3.442	1078.303
3.468	971.588
3.455	855.372
3.490	826.129
3.510	942.313
3.523	777.522
3.536	854.979
3.562	883.922
3.503	535.368
3.532	535.227
3.620	873.949
3.633	999.855
3.692	1096.471
3.731	999.383
3.555	1029.303
3.513	1077.957
3.575	1203.627
3.539	1281.319
3.607	1416.648
3.620	1600.693
3.562	1649.426
3.571	1872.247
3.630	1968.863
3.734	2297.817
3.672	1358.194
3.714	1416.128
3.763	1464.342
3.818	417.563
3.851	640.274];
units.LN   = {'cm', '#'};  label.LN = {'length', '# of mature oocytes'};  
temp.LN    = C2K(15);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'JageRava2016';
comment.LN = 'JageRava2016 assume 15 d spawning interval for the Ligurian Sea';

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
set1 = {'tL_1','tL_2','tL_3','tL_4'}; subtitle1 = {'Data at f_1, f_2, f_3, f_4 and 10 C'};
set2 = {'tL_5','tL_6'}; subtitle2 = {'Data at f_5, f_6 and 20, 10 C'};
set3 = {'TJO_1','TJO_2','TJO_3','TJO_4','TJO_5'}; subtitle3 = {'Different data sets'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Facts
F1 = ['This entry is discussed in JageRava2016; notice, however that this ref fits a model without reserve, with the consequence that some symbols have a different meaning. '...
      'Notice that, since Wd0 of JageRava2016 is 30 times the value used here, this greatly affects kappa. ',  ...
      'JageRava2016 uses a very different T_ref'];
metaData.bibkey.F1 = 'JageRava2016'; 
F2 = ['Length (mm) - Length (mm) relationships: ', ...
      'Lwa (from posterior margin of eye socket to end of the sixth abdominal segment), ' ...
      'Lwb (from posterior margin of eye socket to tip of telson excluding terminal spines), ' ...
      'Lwc (from tip of rostrum to tip of telson excluding terminal spines). ' ... 
      'Lwa = -0.276 + 0.840 Lwb; Lwa = -0.248 + 0.807 Lwc; Lwb = 0.024 + 0.961 Lwc.'];
metaData.bibkey.F2 = 'LindRobi1999'; 
F3 = ['Length (mm) - Dry weight (mug) relationships: ', ...
      'Log10 DW = 0.651 + 2.932 Log10 Lwa = 0.308 + 3.01 Log10 Lwb = 0.258 + 3.010 Log10 Lwc'];
metaData.bibkey.F3 = 'LindRobi1999';   
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3YWJ6'; % Cat of Life
metaData.links.id_ITIS = '95534'; % ITIS
metaData.links.id_EoL = '509431'; % Ency of Life
metaData.links.id_Wiki = 'Meganyctiphanes_norvegica'; % Wikipedia
metaData.links.id_ADW = 'Meganyctiphanes_norvegica'; % ADW
metaData.links.id_Taxo = '33780'; % Taxonomicon
metaData.links.id_WoRMS = '110690'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Meganyctiphanes_norvegica}}';
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
bibkey = 'arcodiv'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arcodiv.org/watercolumn/euphausiid/Meganyctiphanes_norvegica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rava2011'; type = 'Misc'; bib = [ ...
'author = {Ravagnan, E.}, ' ...
'year = {2011}, ' ...
'howpublished = {\url{Pers comm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JageRava2016'; type = 'Article'; bib = [ ... 
'author = {Jager, T. and Ravanan, E.}, ' ... 
'year = {2016}, ' ...
'title = {Modelling growth of {N}orthern krill (\emph{Meganyctiphanes norvegica}) using an energy-budget approach}, ' ...
'journal = {Ecological Modelling}, ' ...
'volume = {325}, ' ...
'pages = {28--34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tarl2010'; type = 'Article'; bib = [ ... 
'author = {Tarling, G. A.}, ' ... 
'year = {2010}, ' ...
'title = {Population dynamics of {N}orthern krill (\emph{Meganyctiphanes norvegica} {S}ars)}, ' ...
'journal = {Adv. Mar. Biol.}, ' ...
'volume = {57}, ' ...
'pages = {59-90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Roux1974'; type = 'Article'; bib = [ ... 
'author = {Le Roux, A.}, ' ... 
'year = {1974}, ' ...
'title = {Observations sur le d\''{e}veloppement larvaire de \emph{Meganyctiphanes norvegica} ({C}rustacea: {E}uphausiacea) au laboratoire}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {26}, ' ...
'pages = {45-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LindRobi1999'; type = 'Article'; bib = [ ... 
'author = {J. A. Lindley and D. B. Robins and R. Williams}, ' ... 
'year = {1999}, ' ...
'title = {Dry weight carbon and nitrogen content of some euphausiids from the north {A}tlantic {O}cean and the {C}eltic {S}ea}, ' ...
'journal = {J. Plankton Res,}, ' ...
'volume = {21}, ' ...
'pages = {2053--2066}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
