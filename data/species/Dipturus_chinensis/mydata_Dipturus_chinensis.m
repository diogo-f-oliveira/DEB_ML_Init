function [data, auxData, metaData, txtData, weights] = mydata_Dipturus_chinensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dipturus_chinensis'; 
metaData.species_en = 'Chinese skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 09];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 8*30.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'HaraFuru2018';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth'; bibkey.Lb  = 'HaraFuru2018';
data.Lp  = 55.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'HaraFuru2018';
  comment.Lp = 'based on tp 9.39 yr and tL_f data';
data.Lpm  = 49.4;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'HaraFuru2018';
  comment.Lp = 'based on tp 8.22 yr and tL_m data';
data.Li  = 83.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'HaraFuru2018';
data.Lim  = 76.8;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'HaraFuru2018';
 
data.Ri  = 40/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.7';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	10.907
0.000	12.891
0.932	21.627
0.932	20.636
0.992	19.050
0.992	16.670
1.954	26.796
1.954	21.839
1.954	19.856
1.984	24.417
2.014	23.029
2.946	27.008
2.946	25.421
2.976	29.586
2.976	27.801
2.976	23.835
3.006	32.759
3.908	29.400
3.938	34.556
3.938	33.168
3.968	37.928
3.968	31.582
3.968	30.194
4.028	36.541
4.930	37.544
4.930	36.156
4.930	34.569
5.020	40.123
5.020	38.735
5.952	41.127
5.982	47.473
5.982	45.886
5.982	42.515
6.042	44.301
6.944	43.916
6.974	51.055
7.004	49.271
7.004	48.081
7.004	42.529
7.034	46.694
7.034	45.504
7.996	54.837
7.996	52.854
7.996	51.267
7.996	50.276
7.996	49.284
8.958	57.427
8.958	59.014
8.958	55.444
9.018	53.859
9.980	60.217
9.980	56.846
10.010	58.234
10.010	55.855
11.002	58.247
11.032	64.197
11.032	63.007
11.032	61.421
11.964	63.218
11.994	61.433
11.994	64.606
12.024	57.666
12.024	59.054
12.024	60.244
12.956	60.851
12.956	59.265
13.016	66.008
13.016	64.421
13.016	62.835
14.008	62.650
14.008	68.004
14.038	64.435
15.030	62.663
15.030	63.456
15.030	65.439];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HaraFuru2018';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	11.168
0.000	13.363
0.000	12.366
0.932	18.560
0.962	15.768
0.992	20.355
1.984	27.149
1.984	25.953
2.014	24.158
2.014	22.762
2.014	22.164
2.014	21.566
2.014	19.571
2.946	25.766
2.946	24.769
2.976	31.949
2.976	30.553
2.976	29.356
2.976	27.960
2.976	27.162
3.968	34.555
3.968	32.760
3.968	29.170
3.968	28.173
3.998	38.344
3.998	30.367
4.028	36.949
4.028	35.752
4.960	40.152
4.960	39.753
4.960	38.756
4.960	34.568
4.990	40.950
4.990	37.759
4.990	36.762
4.990	35.765
5.922	44.751
5.922	42.957
5.952	43.356
5.952	42.159
5.982	46.148
5.982	44.553
5.982	43.556
6.042	41.363
6.042	39.568
6.914	46.560
6.944	45.363
7.004	50.549
7.004	46.960
7.004	43.968
7.004	43.569
7.004	43.569
7.004	42.373
7.034	49.353
7.034	47.758
7.034	41.775
7.966	47.571
7.996	53.953
8.026	51.959
8.026	49.167
8.026	47.970
8.056	50.364
8.988	57.356
8.988	52.769
8.988	51.373
8.988	50.775
8.988	50.576
8.988	49.180
9.048	55.961
9.048	54.166
9.950	51.386
9.950	52.982
9.980	54.179
9.980	58.766
10.040	55.575
10.040	56.373
10.040	57.370
10.942	58.778
10.942	57.382
11.002	56.984
11.002	55.389
11.002	54.392
11.002	51.400
11.092	60.376
12.024	60.388
12.024	57.995
12.024	56.798
12.024	55.801
13.016	54.618
13.016	56.014
13.016	57.011
13.016	60.003];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HaraFuru2018';
comment.tL_m = 'data for males';

% length-weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
11.672	14.410
13.344	9.607
17.574	43.231
19.049	43.231
19.639	52.838
20.426	52.838
21.311	48.035
22.000	57.642
23.377	91.266
24.361	96.070
24.951	96.070
25.738	100.873
26.623	105.677
27.115	96.070
27.803	144.105
28.590	168.122
29.475	144.105
30.066	230.567
30.459	192.140
31.246	201.747
32.525	225.764
33.213	278.602
33.410	182.533
34.393	278.602
35.279	302.620
35.869	240.174
36.361	341.048
37.049	268.996
37.443	374.673
37.836	307.424
38.230	413.100
38.328	374.673
39.705	403.493
40.590	384.279
40.787	513.974
41.180	427.511
41.967	461.135
42.262	624.454
42.557	562.009
42.656	470.742
43.344	509.170
43.639	590.830
43.738	470.742
43.934	562.009
44.426	634.061
44.426	696.507
45.311	614.847
45.410	547.598
45.902	677.292
46.000	542.795
46.295	768.559
46.295	600.437
47.279	768.559
47.377	566.812
47.672	634.061
48.459	734.934
48.656	903.057
48.852	855.022
49.049	778.166
49.148	806.987
49.836	941.485
49.934	1032.751
50.033	883.843
50.131	782.969
50.918	989.519
51.016	855.022
51.410	778.166
51.607	898.253
51.902	975.109
52.197	1032.751
53.279	960.699
53.377	1090.393
53.475	1200.873
53.672	931.877
54.066	1090.393
54.262	1133.625
54.262	1027.948
54.361	1244.105
54.656	936.681
55.148	1181.659
55.344	1277.729
55.934	1143.231
56.033	1325.764
56.033	1205.677
56.033	1071.179
56.426	1263.319
56.918	1436.244
57.213	1344.978
57.311	1224.891
57.410	1301.747
57.508	1258.515
57.705	1503.493
57.803	1388.210
58.000	1671.616
58.000	1128.821
58.098	1268.122
58.197	1541.921
58.393	1095.196
58.689	1364.192
58.787	1575.546
58.984	1431.441
59.180	1330.568
59.180	1301.747
59.869	1508.297
60.262	1623.581
60.262	1436.244
60.262	1335.371
60.459	1546.725
60.951	1498.690
61.148	1738.865
61.443	1580.349
61.541	1431.441
61.738	1714.847
61.738	1484.279
61.836	1393.013
61.934	1772.489
62.131	1513.101
62.230	1613.974
62.328	1450.655
62.820	1714.847
63.016	1575.546
63.115	1834.934
63.508	1460.262
63.607	1647.598
63.705	1762.882
63.902	1700.437
64.000	2108.734
64.000	1868.559
64.098	1911.790
64.098	1796.506
64.295	1594.760
64.689	1719.650
64.787	1513.101
64.984	1935.808
65.180	1657.205
65.475	1551.528
65.672	1777.292
65.672	1738.865
65.770	2185.589
65.770	1906.987
66.262	2075.109
66.656	1806.113
67.541	2012.664
68.328	1849.345
68.426	2070.305
68.820	2012.664];
units.LWw_f = {'cm', 'g'};  label.LWw_f = {'total length', 'wet weight', 'female'};
bibkey.LWw_f = 'HaraFuru2018';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (cm)
10.472	4.803
11.357	19.214
11.947	24.018
12.439	4.803
15.095	19.214
15.782	33.624
18.045	33.624
19.421	48.035
19.520	43.232
19.717	33.624
19.912	62.445
20.699	67.249
21.093	62.445
21.486	72.053
22.371	62.445
22.862	96.070
23.747	100.873
24.140	100.873
24.532	129.694
24.927	100.873
25.812	96.070
26.303	129.694
26.501	100.873
27.482	163.319
27.483	129.694
28.563	182.533
28.958	144.105
29.054	201.747
29.842	168.122
30.040	139.301
30.234	206.550
30.725	220.961
31.511	244.978
31.905	230.568
32.297	249.782
33.380	225.764
33.575	278.603
33.967	307.424
34.853	297.817
34.854	264.192
35.641	264.192
35.735	350.655
36.231	278.603
36.423	369.869
36.914	389.083
37.211	345.852
37.801	345.852
37.898	384.279
38.290	413.100
38.490	336.245
38.682	451.529
38.686	350.655
38.978	417.904
39.374	369.869
39.567	446.725
39.667	413.100
39.768	350.655
39.859	518.777
39.959	475.546
40.155	504.367
40.257	427.511
40.749	417.904
41.043	446.725
41.140	480.349
41.140	461.135
41.437	422.708
41.928	437.118
42.220	523.581
42.517	480.349
43.005	566.812
43.103	566.812
43.107	485.153
43.691	610.044
44.085	595.633
44.182	634.061
44.380	605.240
44.382	566.812
44.383	542.795
45.067	634.061
45.361	653.275
45.946	768.559
45.948	720.524
45.952	643.668
46.439	744.541
46.737	672.489
46.740	610.044
47.327	682.096
47.423	734.935
47.527	605.240
47.614	869.432
47.814	797.380
48.019	619.651
48.211	725.328
48.305	811.790
48.596	912.664
48.701	763.756
48.893	855.022
49.388	797.380
49.686	715.720
49.688	672.489
50.368	879.039
50.668	768.559
50.672	677.293
50.858	917.467
50.951	1032.751
50.955	936.681
50.964	744.541
51.064	710.917
51.260	725.328
51.351	874.236
51.539	1080.786
51.642	965.502
51.743	912.664
51.845	826.201
51.939	931.878
52.234	936.681
52.340	758.952
52.432	903.057
52.526	1003.930
52.535	792.576
52.622	1047.162
52.631	859.825
52.637	725.328
53.026	816.594
53.121	903.057
53.309	1100.000
53.311	1051.965
53.412	984.716
53.416	898.253
53.714	831.004
53.804	1008.734
53.913	773.362
54.001	1003.930
54.006	903.057
54.196	1047.162
54.303	859.825
54.503	787.773
54.595	931.878
54.691	989.520
54.694	917.467
54.790	955.895
55.178	1090.393
55.188	855.022
55.279	1018.341
55.381	955.895
55.482	879.039
55.485	831.004
55.572	1071.179
55.766	1124.017
55.773	979.913
55.864	1143.232
55.875	888.646
56.063	1095.197
56.163	1066.376
56.164	1037.555
56.167	955.895
56.268	917.467
56.354	1176.856
56.653	1095.197
56.747	1200.873
56.852	1037.555
57.050	1018.341
57.245	1056.769
57.251	922.271
57.336	1224.891
57.342	1090.393
57.640	1023.144
57.642	984.716
58.129	1075.983
58.132	1023.144
58.512	1316.157
58.518	1172.052
58.619	1128.821
58.719	1095.197
59.212	1051.965
59.298	1335.371
59.400	1263.319];
units.LWw_m = {'cm', 'g'};  label.LWw_m = {'total length', 'wet weight', 'male'};
bibkey.LWw_m = 'HaraFuru2018';
comment.LWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Ri = 0 * weights.Ri;

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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length - weight: Ww in g = 0.00575  * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '793N8'; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '58265753'; % Ency of Life
metaData.links.id_Wiki = 'Dipturus_chinensis'; % Wikipedia
metaData.links.id_ADW = 'Raja_chinensis'; % ADW
metaData.links.id_Taxo = '1802409'; % Taxonomicon
metaData.links.id_WoRMS = '1419311'; % WoRMS
metaData.links.id_fishbase = 'Dipturus-chinensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipturus}}';   
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
bibkey = 'HaraFuru2018'; type = 'article'; bib = [ ...  
'doi = {10.1111/jai.13575}, ' ...
'author = {K. Hara and K. Furumitsu and T. Aoshima and H. Kanehara and A. Yamaguchi}, ' ...
'year = {2018}, ' ...
'title  = {Age, growth, and age at sexual maturity of the commercially landed skate species, \emph{Dipturus chinensis} ({B}asilewsky, 1855), in the northern {E}ast {C}hina {S}ea}, ' ...
'journal = {J Appl Ichthyol.}, ' ...
'volume = {34}, ' ...
'pages = {66-72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dipturus-chinensis.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];