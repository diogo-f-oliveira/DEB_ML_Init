function [data, auxData, metaData, txtData, weights] = mydata_Odocoileus_virginianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Odocoileus_virginianus'; 
metaData.species_en = 'White-tailed deer'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Le'; 't-Wwe'; 't-L'; 't-Ww_f'; 'Ww-JO'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour'};    
metaData.date_subm = [2012 02 23];              
metaData.email    = {'jessroberts09@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2013 08 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 199;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = {'Arms1950','Haug1975'};   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from RogeMoen1987';
data.tx = 129;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Verm1963';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 413;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'LesaCret2001';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5500;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Shor1970';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 61.2;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Verm1985';
data.Lp  = 130;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty'; bibkey.Lp  = 'LesaCret2001';
data.Li  = 150;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'RawsDelg1992';

data.Wwb = 3600;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Verm1985';
data.Wwx = 36000;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'LesaCret2001';
data.Wwp = 45000;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'LesaCret2001';
data.Wwi = 70000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'RawsDelg1992';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'Haug1975','Verm1965'};   
  temp.Ri = C2K(39);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% fetal development
% Fetal length (cm) vs age (d), from Armstrong 1950    
data.tL_e = [37     	40	41  44      45	52	53  60      61	65      66	75      76      85	86      90      91      95      96      105     106     110     111     120     121     132     133     150     151     180     181     200; % d, time since birth
       1.71	2.2	2.3	2.96	3	4.5	4.6	6.27	6.3	8.25	8.3	11.3	11.4	15	15.1	16.73	16.8	18.4	18.5	22.2	22.3	23.32	23.5	26.8	27      30.8	30.9	36.7	36.8	44      44.1	48]'; %cm, physical length at f and T
units.tL_e  = {'d', 'cm'};  label.tL_e = {'age', 'length'};  
temp.tL_e  = C2K(39);  units.temp.tL_e = 'K'; label.temp.tL_e = 'temperature';
bibkey.tL_e = 'Arms1950';
%
% Fetal weight (g) vs age (d), Armstrong 1950
data.tW_e = [37	44	40	41	45	60	52	53	61	65	66	75	76	85	86	90	91	95	96	105	106	110	111	120	121	132	133	150	151	180	181	200; % age (in days)
        0.5	0.7	0.8	1.7	1.8	2.3	2.4	7.2	7.4	14.8	14.9	38.1	38.2	77	77.1	90	93	140	141	295	300	350	352	624	628	840	840.1	1582.5	1613.8	2261	2430	2702]'; % mass (g)
units.tW_e  = {'d', 'g'};  label.tW_e = {'age', 'wet weight'};  
temp.tW_e  = C2K(39);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature';
bibkey.tW_e = 'Arms1950';

% Post-birth growth rate
% Juvenile to adult: Length (cm) vs time since birth (d), Verme 1963
data.tL = [1.0	181.7	547.9	915.7	1088.5	1458.3	1823.7	2188.9	2562.7	2927.9	3288.7	3649.6;    % d, time since birth
        61.0	118.8	140.5	149.9	149.9	149.9	149.9	149.9	149.9	149.9	149.9	149.9]'; % cm, physical length at f and T
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(39);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Verm1963';
% Juvenile to adult: Wet weight (g) vs time since birth (d), Lesange et al 2001
data.tW = [184.1389      182.78655	554.50005	547.62865	915.7968	913.3845; % Age class (days)	
       29886.76279	33307.185	43292.99771	56161.14579	52435.66453	66867.76113]'; % Live weight (g)	
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(39);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Verm1963';

% t-W data
data.tW_BH = [ ... % time since birth (d), wet weight (g)
0.000	3923.670
0.000	6975.464
0.030	8719.307
0.046	10463.196
0.111	13514.989
0.111	12207.084
0.111	6103.542
0.111	4795.637
0.142	17874.643
0.158	20490.453
0.159	9155.291
0.160	7847.385
0.174	21798.358
0.175	16566.738
0.206	25286.090
0.208	9591.274
0.222	28337.839
0.238	32261.554
0.271	17874.643
0.272	10463.196
0.288	13079.006
0.302	35749.286
0.320	20054.470
0.320	16130.754
0.334	38801.079
0.335	30081.727
0.366	42724.795
0.368	23542.202
0.382	44904.622
0.384	17874.643
0.432	28337.839
0.465	19618.531
0.577	30953.649
0.641	30517.711
0.770	31825.616
0.785	43596.716
0.818	32261.554
0.882	43160.733
1.027	46648.510
1.041	63651.231
1.041	61471.405
1.074	57111.706
1.075	49700.259
1.090	55803.801
1.090	54495.896
1.105	69754.773
1.347	67138.963
1.347	65831.058
1.363	72370.584
1.364	63651.231
1.378	78038.142
1.427	71062.679
1.508	75858.316
1.556	70626.695
2.041	64087.170
2.071	85013.606
2.088	81525.874
2.088	73242.505
2.089	70626.695
2.089	67574.947
2.104	76730.237
2.345	88937.321
2.345	87629.416
2.345	86321.511
2.345	84577.668
2.346	77166.221
2.361	91989.115
2.376	98528.595
2.393	95476.847
2.424	100272.484
2.427	78910.064
2.427	77166.221
2.443	73242.505
2.927	69754.773
3.087	87193.478
3.087	83269.763
3.104	81961.858
3.343	103324.232
3.344	95476.847
3.345	91553.132
3.359	106812.010
3.392	101144.406
3.392	99836.501
3.392	98964.579
3.393	88937.321
3.409	91989.115
3.425	96784.752
3.458	84577.668
3.458	82397.841
3.459	78910.064
3.474	85449.590
3.490	88065.400
3.522	91989.115
4.120	84141.684
4.134	97656.674
4.135	93732.958
4.311	102888.294
4.391	114223.457
4.391	111171.663
4.392	104196.199
4.425	91117.148
4.440	108991.836
4.441	100272.484
4.441	98964.579
4.474	88501.383
4.505	102888.294
4.505	96348.769
4.538	92861.037
4.539	84577.668
4.539	79346.047
4.570	91553.132
4.586	95476.847
5.102	99836.501
5.102	95040.864
5.103	88065.400
5.358	118583.110
5.358	116403.284
5.359	110299.741
5.376	103324.232
5.377	94168.942
5.392	101144.406
5.408	105068.121
5.423	113351.490
5.425	91989.115
5.439	115967.300
5.456	109427.820
5.472	107247.948
5.474	88501.383
5.474	83705.701
5.489	103760.216
5.506	91117.148
5.521	98964.579
5.522	96784.752
5.538	89373.305
6.022	91553.132
6.359	106812.010
6.408	105068.121
6.408	99836.501
6.457	95912.830
6.457	94168.942
6.457	92861.037];
data.tW_BH(:,1) = 365 * data.tW_BH(:,1); % convert yr to d
units.tW_BH  = {'d', 'g'};  label.tW_BH = {'time since birth', 'wet weight', 'Black Hills'};  
temp.tW_BH   = C2K(39);  units.temp.tW_BH = 'K'; label.temp.tW_BH = 'temperature';
bibkey.tW_BH = 'MontSchm2009';
comment.tW_BH = 'Black Hills population';
%
% South Dakota
data.tW_SD = [ ...
0.000	2565.894
0.046	7358.931
0.047	3871.180
0.063	5614.203
0.078	8665.092
0.079	5613.327
0.094	12587.954
0.094	10408.115
0.143	6481.752
0.158	15200.277
0.174	18251.212
0.175	11711.650
0.175	8659.840
0.205	24788.977
0.206	21737.212
0.223	13452.922
0.237	33942.612
0.237	26095.139
0.238	23915.300
0.268	37428.612
0.269	31761.023
0.270	16938.047
0.285	29580.263
0.285	28272.351
0.286	23476.688
0.287	11269.537
0.287	7345.800
0.300	39606.700
0.301	36118.949
0.301	30887.300
0.318	23038.997
0.318	19987.186
0.319	13447.670
0.333	34373.346
0.335	16934.546
0.364	42655.009
0.367	15188.897
0.367	13880.985
0.367	12137.132
0.368	8649.335
0.380	41346.222
0.381	33498.748
0.382	26087.260
0.382	25651.320
0.383	19983.685
0.383	19547.744
0.397	35241.771
0.398	28266.223
0.413	38292.660
0.414	31317.159
0.444	45266.457
0.446	31751.394
0.493	38724.269
0.557	42644.505
0.718	42199.765
0.797	49170.890
0.798	42631.374
0.799	36527.798
0.831	32602.311
1.021	59621.933
1.021	57006.108
1.022	48722.694
1.070	55259.584
1.083	80544.982
1.085	64850.080
1.085	61362.329
1.086	52642.929
1.116	71387.846
1.117	65720.256
1.118	59180.695
1.324	86635.427
1.325	76608.115
1.340	87506.478
1.340	79659.050
1.355	97968.901
1.356	84017.852
1.357	74862.511
1.404	89246.875
1.404	84015.226
1.405	76603.738
1.435	94912.714
1.436	82705.563
1.437	73986.163
1.451	97527.663
1.452	87500.350
1.453	80088.863
1.453	78345.010
1.467	94475.022
1.468	92731.124
1.469	73984.412
1.532	91855.696
1.534	73980.910
1.534	70493.159
1.564	89238.121
1.775	72659.867
1.918	90090.789
1.952	66546.663
1.999	79187.173
2.000	68287.934
2.048	74824.870
2.048	71773.059
2.077	104033.084
2.079	80490.709
2.094	90953.086
2.095	84413.570
2.142	94002.270
2.159	83102.156
2.160	77870.507
2.208	83099.530
2.271	93123.341
2.318	102276.055
2.333	112738.478
2.351	95734.788
2.364	120584.156
2.380	123199.105
2.416	88319.799
2.429	115349.050
2.430	103141.854
2.431	93986.513
2.432	85703.099
2.462	112295.489
2.462	110115.650
2.478	105319.112
2.481	83956.575
2.481	81340.750
2.481	79160.912
2.495	99650.602
2.528	90929.451
2.754	76966.191
2.771	70861.741
2.786	85247.855
3.057	103543.700
3.057	99184.023
3.071	120981.625
3.072	115314.035
3.106	97437.498
3.122	90461.121
3.281	114430.683
3.343	128814.217
3.360	120093.941
3.374	141455.558
3.395	100473.552
3.407	137094.107
3.410	110064.003
3.423	134913.415
3.426	105703.405
3.427	97855.976
3.440	130116.877
3.443	94367.350
3.459	99598.079
3.475	96981.379
3.475	95237.526
3.492	92620.826
3.505	123573.814
3.505	120957.989
3.505	117470.238
3.524	90003.251
3.524	86515.500
4.053	103489.426
4.098	131388.853
4.101	105230.698
4.118	93894.598
4.151	82121.682
4.277	114812.395
4.342	105217.567
4.359	93445.482
4.370	147504.859
4.372	121346.704
4.406	102598.241
4.421	113932.591
4.423	99981.541
4.435	139653.907
4.438	112187.817
4.451	134421.405
4.468	128316.954
4.486	105209.689
4.487	98234.142
4.501	121775.642
4.520	94308.699
4.533	123517.789
4.533	117850.154
4.536	89948.101
4.537	85588.424
4.569	83406.789
5.033	106051.852
5.064	111717.691
5.288	118680.983
5.304	121295.932
5.319	136989.936
5.319	133066.222
5.335	131321.449
5.352	122601.218
5.370	104289.571
5.385	116931.833
5.402	108211.557
5.402	107339.631
5.403	97312.319
5.417	113006.345
5.419	100363.254
5.434	110825.631
6.043	118639.840
6.044	113408.191
6.300	126037.322
6.300	123421.497
6.314	144347.150
6.314	141295.363
6.330	138678.663
6.348	122546.945
6.395	136059.359
6.397	115568.771
6.398	109029.255
6.412	126903.121
6.414	104232.671
6.462	108153.782
6.479	100305.478
6.479	98997.566];
data.tW_SD(:,1) = 365 * data.tW_SD(:,1); % convert yr to d
units.tW_SD  = {'d', 'g'};  label.tW_SD = {'time since birth', 'wet weight', 'South Dakota'};  
temp.tW_SD   = C2K(39);  units.temp.tW_SD = 'K'; label.temp.tW_SD = 'temperature';
bibkey.tW_SD = 'MontSchm2009';
comment.tW_SD = 'South Dakota population';
  
% Oxygen consumption, from Rawson et al 2005 of young deer (until 90 days old)   
data.WJO = [7585.007246	8108.620966	8925.241991	8912.48886	9357.37426	9602.891015	9341.09954	10496.56018	10468.0551	10981.71074	10481.1274	12340.0807	11230.08388	10470.46574	10966.06965	9337.572783	12914.00648	12918.70556	12348.52257	12936.80405	15208.24149	14462.78733	13181.50504	13218.89035	14506.74577	14445.71359	15136.97174	17746.02136	15163.0302	15532.98776	15529.12551	17759.55175	16937.76098	16934.32927	17706.14433	19865.70582	24358.41358	24942.55853	27440.941	23399.6844	28677.15079	20829.07578	20836.60697	20841.78925	24412.9915	27427.80164	28810.71259	28821.06335	25064.26652	24356.61885	21295.75295	21369.62987	20749.89962	19861.1321	23348.17824	18212.64406; % body mass (g)	
       33.63656324	34.27126843	39.48772313	44.55266477	56.5811542	58.36572971	48.8486465	56.82962206	55.99820701	52.46811259	49.24802382	61.30508695	48.66629744	43.78298613	44.43758691	34.79932151	39.55665767	42.22980789	49.46417645	52.13245366	53.36683432	61.52540155	57.59552207	59.43095892	65.06455815	71.62147723	76.89035396	80.22738414	89.36548505	97.65301014	95.87542217	108.7456693	96.81133192	95.17726782	104.9264261	106.9983931	129.1246204	137.5925579	149.9230534	136.9955713	192.5869935	120.6179409	124.1512155	126.5629828	154.7972884	176.4465112	186.8127826	191.5312943	164.5250994	157.4124281	137.8284698	146.6702649	133.0285693	128.5347636	167.6318599	127.3301806]'; % mL O2 / min
[x i] = sort(data.WJO(:,1),1); data.WJO = data.WJO(i,:);
units.WJO  = {'g', 'ml O_2/ min'};  label.WJO = {'wet weight', 'O_2 consumption'};  
temp.WJO   = C2K(39);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO = 'RawsDelg1992';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_BH','tW_SD'}; subtitle1 = {'Data from Black Hills, South Dakota'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow foetal development is assumend';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '48NBQ'; % Cat of Life
metaData.links.id_ITIS = '180699'; % ITIS
metaData.links.id_EoL = '328652'; % Ency of Life
metaData.links.id_Wiki = 'Odocoileus_virginianus'; % Wikipedia
metaData.links.id_ADW = 'Odocoileus_virginianus'; % ADW
metaData.links.id_Taxo = '68077'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200278'; % MSW3
metaData.links.id_AnAge = 'Odocoileus_virginianus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Odocoileus_virginianus}}';
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
bibkey = 'Arms1950'; type = 'Article'; bib = [ ... 
'author = {Armstrong, R. A.}, ' ... 
'year = {1950}, ' ...
'title = {Fetal development of the northern white-tailed deer (\emph{Odocoileus virginianus borealis} {M}iller)}, ' ...
'journal = {American Midland Naturalist}, ' ...
'volume = {43}, ' ...
'pages = {650--666}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CheaMort1946'; type = 'Article'; bib = [ ... 
'author = {Cheatum, E. L. and Morton, G. H.}, ' ... 
'year = {1946}, ' ...
'title = {Breeding season of white-tailed deer in New York}, ' ...
'journal = {Journal of Wildlife Management}, ' ...
'volume = {10}, ' ...
'pages = {249--263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haug1975'; type = 'Article'; bib = [ ... 
'author = {Haugen, A.}, ' ... 
'year = {1975}, ' ...
'title = {Reproductive performance of white-tailed deer in {I}owa}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {56}, ' ...
'pages = {151--159}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LesaCret2001'; type = 'Article'; bib = [ ... 
'author = {Lesage, L. and Cr\^{e}te, M. and Huot, J. and Ouellet, J.-P.}, ' ... 
'year = {2001}, ' ...
'title = {Evidence for a trade-off between growth and body reserves in northern white-tailed deer}, ' ...
'journal = {Oecologia}, ' ...
'volume = {126}, ' ...
'pages = {30--41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Moen1978'; type = 'Article'; bib = [ ... 
'author = {Moen, A. N.}, ' ... 
'year = {1978}, ' ...
'title = {Seasonal changes in heart rates, activity, metabolism, and forage intake of white-tailed deer}, ' ...
'journal = {Journal of Wildlife Management}, ' ...
'volume = {42}, ' ...
'pages = {715--738}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RawsDelg1992'; type = 'Article'; bib = [ ... 
'author = {Rawson, R. E. and Delgiudice, G. D. and Dziuk, H. E. and Mech, L. D.}, ' ... 
'year = {1992}, ' ...
'title = {Energy metabolism and hematology of white-tailed deer fawns}, ' ...
'journal = {Journal of Wildlife Diseases}, ' ...
'volume = {28}, ' ...
'pages = {91--94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobbMoen1974'; type = 'Article'; bib = [ ... 
'author = {Robbins, C. T. and Moen, A. N. and Reid, J. T.}, ' ... 
'year = {1974}, ' ...
'title = {Body composition of white-tailed deer}, ' ...
'journal = {Journal of Animal Science}, ' ...
'volume = {38}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RogeMoen1987'; type = 'Article'; bib = [ ... 
'author = {Rogers, L. L. and Moen, A. N. and Shedd, M. L.}, ' ... 
'year = {1987}, ' ...
'title = {Rectal temperatures of 2 free-ranging white-tailed deer fawns}, ' ...
'journal = {Journal of Wildlife Management}, ' ...
'volume = {51}, ' ...
'pages = {59--62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shor1970'; type = 'Article'; bib = [ ... 
'author = {Short, C.}, ' ... 
'year = {1970}, ' ...
'title = {Morphological development and aging of mule and white-tailed deer fetuses}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {34}, ' ...
'pages = {383--388}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilvColo1969'; type = 'Article'; bib = [ ... 
'author = {Silver, H. and Colovos, N. F. and Holter, J. B. and Hayes, H. H.}, ' ... 
'year = {1969}, ' ...
'title = {Fasting metabolism of white-tailed deer}, ' ...
'journal = {The Journal of Wildlife Management}, ' ...
'volume = {33}, ' ...
'pages = {490--498}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Verm1961'; type = 'Article'; bib = [ ... 
'author = {Verme, L. J.}, ' ... 
'year = {1961}, ' ...
'title = {Late breeding in {N}orthern {M}ichigan deer}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {42}, ' ...
'pages = {426--427}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Verm1963'; type = 'Article'; bib = [ ... 
'author = {Verme, L. J.}, ' ... 
'year = {1963}, ' ...
'title = {Effect of nutrition on the growth of white-tailed deer fawns}, ' ...
'journal = {Transactions of the North American Wildlife Conference}, ' ...
'volume = {28}, ' ...
'pages = {431--443}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Verm1965'; type = 'Article'; bib = [ ... 
'author = {Verme, L. J.}, ' ... 
'year = {1965}, ' ...
'title = {Reproduction studies of penned white-tailed deer}, ' ...
'journal = {Journal of Wildlife Management}, ' ...
'volume = {29}, ' ...
'pages = {74--79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Verm1985'; type = 'Article'; bib = [ ... 
'author = {Verme, L. J.}, ' ... 
'year = {1985}, ' ...
'title = {Birth weights of fawns from doe fawn white-tailed deer}, ' ...
'journal = {Journal of Wildlife Management}, ' ...
'volume = {49}, ' ...
'pages = {962--963}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MontSchm2009'; type = 'Article'; bib = [ ... 
'author = {Montheith, K. L. and Schmitz, L. E. and Jenks, J. A. and Delger, J. A. and Bowyer, R. T.}, ' ... 
'year = {2009}, ' ...
'title = {Growth of male white-tailed deer: consequences of maternal effects}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {90}, ' ...
'pages = {651-660}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Odocoileus_virginianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TWOE'; type = 'Misc'; bib = ...
'howpublished = {\url{http://thewebsiteofeverything.com/animals/mammals/Artiodactyla/Cervidae/Odocoileus/Odocoileus-virginianus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

