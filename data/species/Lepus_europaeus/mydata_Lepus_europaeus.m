function [data, auxData, metaData, txtData, weights] = mydata_Lepus_europaeus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Leporidae';
metaData.species    = 'Lepus_europaeus'; 
metaData.species_en = 'Brown hare'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp', 'TA', 'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Le'; 't-Ww'; 't-Wwe'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 47;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Broe1982';   
  temp.tg = C2K(38.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from PaciBagl2006';
data.tx = 29;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = {'zoogdierver','AnAge'};   
  temp.tx = C2K(38.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 236;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10.7*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 10.5; units.Li  = 'cm';  label.Li  = 'ultimate head-rump length';  bibkey.Li  = 'zoogdierver';
  comment.Li = '9-12 cm';

data.Wwb = 119.7;units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 390;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 4175; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'zoogdierver','AnAge'};
  comment.Wwi = '3-5 kg';

data.Ri  = 11/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'zoogdierver';   
  temp.Ri = C2K(38.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.986	90.196
0.986	103.268
0.986	121.569
0.986	142.484
1.033	152.941
1.033	163.399
1.925	129.412
1.972	176.471
2.911	163.399
2.911	197.386
2.958	103.268
2.958	111.111
2.958	121.569
2.958	137.255
2.958	147.712
2.958	152.941
3.005	207.843
3.005	218.301
3.850	171.242
3.850	200.000
3.897	129.412
3.897	147.712
3.897	163.399
3.991	239.216
4.930	176.471
4.930	244.445
4.977	103.268
4.977	142.484
4.977	158.170
4.977	189.543
4.977	200.000
4.977	207.843
5.023	226.144
5.023	260.131
5.822	160.784
5.822	325.490
5.869	200.000
5.915	294.118
5.962	181.699
5.962	223.529
6.056	197.386
6.056	283.660
6.150	210.457
6.197	333.333
6.901	173.856
6.901	241.830
6.995	192.157
6.995	210.457
7.981	283.660
7.981	294.118
8.075	270.588
8.920	239.216
8.920	312.418
8.920	335.948
8.920	346.405
8.920	403.922
8.967	262.745
8.967	275.817
8.967	281.046
8.967	288.889
8.967	294.118
8.967	383.007
9.014	377.778
9.061	369.935
9.906	233.987
9.906	249.673
9.906	265.359
9.906	299.346
9.906	304.575
9.906	325.490
9.906	356.863
9.906	362.092
9.906	383.007
9.906	401.307
9.953	484.967
10.000	338.562
10.047	498.039
10.892	393.464
10.892	416.994
10.939	202.614
10.939	307.190
10.939	359.477
10.939	375.163
11.925	346.405
11.972	299.346
11.972	427.451
11.972	461.438
12.019	241.830
12.019	244.445
12.066	265.359
12.066	367.320
12.066	377.778
12.207	414.379
12.817	390.850
12.864	513.725
12.911	320.261
12.911	346.405
12.958	281.046
13.005	296.732
13.005	364.706
13.803	430.065
13.897	239.216
13.897	448.366
13.897	461.438
13.897	537.255
13.944	513.725
13.991	372.549
14.038	498.039
14.883	335.948
14.883	351.634
14.883	364.706
14.930	437.908
14.977	401.307
15.869	610.458
15.915	453.595
15.915	568.627
15.915	652.288
15.962	550.327
16.009	532.026
16.854	626.144
16.854	636.601
16.901	406.536
16.901	458.824
16.901	539.869
16.948	490.196
16.948	597.386
16.948	631.373
16.995	508.497
17.042	558.170
17.089	675.817
17.136	437.908
17.793	641.830
17.793	722.876
17.840	498.039
17.840	524.183
17.840	539.869
17.840	780.392
17.887	294.118
17.887	354.248
17.887	555.556
17.887	566.013
17.887	605.229
17.934	416.994
17.934	484.967
17.934	576.471
17.981	372.549
17.981	393.464
17.981	458.824
18.779	743.791
18.826	639.216
19.859	513.725
19.859	673.203
19.859	688.889
19.953	715.033
20.798	416.994
20.845	678.431
20.892	618.301
20.939	490.196
20.939	733.333
20.939	746.405
20.986	764.706
22.817	563.399
22.864	696.732
22.864	730.719
22.864	738.562
22.864	743.791
22.911	749.020
22.911	785.621
22.911	788.235
22.911	1078.431
22.958	592.157
22.958	811.765
22.958	814.379
22.958	822.222
22.958	830.065
22.958	918.954
22.958	937.255
22.958	966.013
22.958	1031.373
23.005	631.373
23.005	639.216
23.005	657.516
23.005	662.745
23.005	864.052
23.005	911.111
23.005	950.327
23.052	898.039
23.052	900.654
23.099	1130.719
23.756	1044.444
23.897	803.922
23.897	819.608
23.897	827.451
23.944	848.366
23.991	905.882
24.038	696.732
24.038	712.418
24.038	725.490
24.038	952.941
24.883	471.895
24.883	600.000
24.930	416.994
24.930	615.686
24.930	701.961
24.930	722.876
24.930	735.948
24.930	743.791
24.930	754.248
24.930	769.935
24.930	788.235
24.930	796.078
24.930	801.307
24.930	819.608
24.930	845.752
24.977	641.830
25.869	769.935
25.869	783.007
25.869	790.850
25.869	798.693
25.915	660.131
25.915	725.490
25.915	903.268
25.962	675.817
25.962	913.726
25.962	937.255
25.962	947.712
25.962	947.712
25.962	963.399
25.962	1107.190
26.009	992.157
26.009	1002.614
26.056	709.804
26.056	735.948
26.854	571.242
26.854	809.150
26.854	835.294
26.901	699.346
26.901	979.085
26.948	657.516
26.948	796.078
26.948	1036.601
26.948	1052.288
27.840	1081.046
27.887	592.157
27.887	712.418
27.887	845.752
27.887	1015.686
27.934	874.510
27.934	892.811
28.826	738.562
28.873	981.699
28.920	824.837
28.920	903.268
28.920	1044.444
28.967	1146.405
29.014	945.098
29.906	769.935
29.906	1376.471
29.953	908.497
29.953	929.412
29.953	932.026
29.953	1026.144
29.953	1180.392
30.000	879.739
30.000	952.941
30.000	976.471
30.000	1047.059
30.000	1086.275
30.000	1099.346
30.000	1115.033
30.000	1143.791
30.000	1149.020
30.000	1321.569
30.000	1332.026
30.047	840.523
30.047	1219.608
30.047	1250.980
30.094	1292.810];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BrayCham2002';

% t-L data 
data.tL = [ ...    % time since birth (d), skull length (cm)
0.924	4.544
0.958	4.049
0.972	4.625
1.013	4.471
1.014	4.512
1.018	4.666
1.052	4.187
1.053	4.220
1.064	4.715
1.110	4.731
1.973	4.707
2.025	4.959
2.884	4.764
2.884	4.789
2.885	4.813
2.923	4.497
2.928	4.691
2.970	4.578
2.971	4.594
2.978	4.919
2.979	4.943
2.981	5.048
2.982	5.105
2.984	5.178
2.988	5.357
3.844	5.008
3.890	5.049
3.891	5.065
3.898	5.381
3.925	4.578
3.928	4.716
4.114	4.903
4.937	5.114
4.943	5.374
4.983	5.131
4.984	5.179
4.984	5.187
4.986	5.260
5.017	4.644
5.022	4.838
5.033	5.309
5.065	4.733
5.066	4.782
5.069	4.903
5.978	4.896
5.979	4.936
5.988	5.366
6.025	4.977
6.026	5.034
6.027	5.066
6.031	5.228
6.032	5.269
6.032	5.293
6.033	5.334
6.037	5.488
6.038	5.545
6.039	5.594
6.040	5.642
6.041	5.699
6.074	5.139
6.074	5.147
6.897	5.367
6.937	5.115
6.985	5.213
6.990	5.448
7.070	4.953
7.856	5.562
8.899	5.441
8.953	5.798
8.954	5.847
8.955	5.879
8.956	5.944
8.959	6.090
8.991	5.482
8.992	5.514
8.992	5.530
8.992	5.547
8.993	5.587
8.994	5.603
8.995	5.652
8.997	5.725
8.997	5.741
8.998	5.774
9.032	5.271
9.910	5.936
9.948	5.579
9.949	5.628
9.949	5.644
9.950	5.693
9.953	5.790
9.991	5.482
9.992	5.523
10.002	5.969
10.007	6.196
10.031	5.247
10.034	5.393
10.035	5.409
10.036	5.450
10.052	6.172
10.889	5.012
10.915	6.148
10.943	5.353
10.946	5.491
10.948	5.604
10.955	5.913
10.958	6.034
11.898	5.370
11.907	5.808
11.908	5.848
11.909	5.873
11.956	5.929
11.957	5.994
11.958	6.043
11.997	5.743
11.997	5.759
12.007	6.189
12.041	5.670
12.084	5.573
12.955	5.898
12.956	5.946
12.956	5.962
12.957	5.995
12.994	5.622
12.995	5.662
12.997	5.735
12.998	5.776
12.999	5.816
12.999	5.841
13.009	6.255
13.057	6.393
13.915	6.133
13.916	6.190
13.968	6.474
13.987	5.314
14.008	6.223
14.055	6.279
14.056	6.353
14.956	5.955
14.959	6.053
15.001	5.931
15.007	6.199
15.044	5.826
15.966	6.370
15.967	6.427
16.061	6.556
16.061	6.573
16.063	6.662
16.065	6.743
16.925	6.597
16.927	6.646
16.927	6.679
16.967	6.435
16.969	6.516
16.970	6.549
17.005	6.103
17.055	6.314
17.093	5.957
17.114	6.898
17.160	6.906
17.961	6.168
17.971	6.598
17.973	6.671
17.973	6.704
17.977	6.866
18.005	6.095
18.007	6.200
18.008	6.233
18.014	6.484
18.015	6.517
18.016	6.582
18.018	6.663
18.040	5.657
18.056	6.338
18.058	6.444
18.076	7.215
18.183	5.941
18.834	6.582
18.932	6.891
19.975	6.778
20.013	6.469
20.021	6.818
20.023	6.891
20.880	6.600
20.882	6.697
21.015	6.519
21.027	7.046
21.055	6.308
22.835	6.601
22.929	6.747
22.990	7.428
22.991	7.461
22.991	7.477
22.993	7.582
23.068	6.869
23.070	6.942
23.076	7.201
23.077	7.282
23.078	7.307
23.083	7.550
23.116	6.990
23.117	7.015
23.120	7.169
23.158	6.812
23.163	7.047
23.163	7.071
23.164	7.096
23.165	7.120
23.165	7.144
24.024	6.934
24.029	7.137
24.029	7.161
24.030	7.194
24.037	7.526
24.042	7.721
24.067	6.820
24.071	6.999
24.073	7.088
24.074	7.121
24.938	7.137
24.962	6.204
24.967	6.415
24.978	6.894
24.981	7.032
24.987	7.291
25.016	6.577
25.080	7.405
25.899	7.414
25.935	7.016
25.937	7.097
25.938	7.170
25.945	7.479
25.986	7.243
25.987	7.316
25.991	7.503
26.034	7.357
26.065	6.740
26.068	6.878
26.070	6.968
26.084	7.568
26.084	7.568
26.086	7.673
26.086	7.673
26.879	6.562
26.929	6.733
26.983	7.130
26.984	7.187
27.033	7.325
27.040	7.625
27.040	7.658
27.069	6.903
27.072	7.049
27.799	7.025
27.904	7.674
27.974	6.717
27.991	7.504
28.038	7.553
28.039	7.585
28.937	7.123
28.947	7.537
28.948	7.578
28.950	7.659
28.951	7.732
28.979	6.953
29.906	7.749
29.950	7.692
29.953	7.805
29.999	7.846
30.029	7.148
30.033	7.335
30.037	7.505
30.038	7.538
30.038	7.570
30.046	7.919
30.049	8.016
30.096	8.122
30.144	8.195];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length of skull'};  
temp.tL    = C2K(38.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BrayCham2002';

% t-W data
data.tW1 = [ ...  % time since birth (month), weight (g)
0.040	114.291 
0.226	167.334
0.657	522.276
1.498	1304.474
3.801	2831.759
7.502	3778.620
8.268	3835.671];
data.tW1(:,1) = data.tW1(:,1) * 30.5; % convert month to d
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(38.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Broe1982';

% foetal development

% data from Frag62 in Broe82
data.tW_e = [ ...
14.706	2.554 % age (d), embryo weight (g)
17.713	3.140
25.065	13.598
25.065	13.598
25.115	5.839
25.201	7.057
26.027	10.259
26.386	18.803
26.391	20.027
26.398	21.659
28.099	20.712
28.164	16.626
28.171	18.258
30.257	31.976
30.263	33.608
31.226	30.677
31.279	23.734
31.949	48.581
32.020	66.127
32.066	57.552
32.073	59.184
32.106	67.345
32.126	72.241
34.018	58.219
34.151	30.862
34.202	43.511
34.232	50.855
35.092	102.626
35.170	61.804
35.210	51.597
37.158	51.448
37.665	76.307
37.867	66.087
38.080	58.316
38.118	67.701
38.161	38.310
38.273	66.056
38.938	109.679
38.979	99.880
39.122	94.971
39.152	62.316
39.167	85.988
41.054	110.741];
units.tW_e  = {'d', 'g'};  label.tW_e = {'age', 'foetal wet weight'};  
temp.tW_e   = C2K(38.5);  units.temp.tW_e = 'K'; label.temp.tW_e = 'temperature';
bibkey.tW_e = 'Frag1962';

data.tW_e2 = [ ...
10.200	13.103
16.179	25.298
28.101	41.121
35.188	66.292
41.947	130.673
46.868	142.541];
units.tW_e2  = {'d', 'g'};  label.tW_e2 = {'age', 'foetal wet weight'};  
temp.tW_e2   = C2K(38.5);  units.temp.tW_e2 = 'K'; label.temp.tW_e2 = 'temperature';
bibkey.tW_e2 = 'Frag1962';
%
data.tL_e2 = [...  % age(d) embryo length (cm)
9.937	2.104
16.060	4.447
19.055	2.418
27.981	7.678
28.140	9.050
32.021	11.969
33.862	8.607
34.927	11.062
41.370	15.526
47.000	17.078];
units.tL_e2   = {'d', 'cm'};  label.tL_e2 = {'age', 'foetal length'};  
temp.tL_e2    = C2K(38.5);  units.temp.tL_e2 = 'K'; label.temp.tL_e2 = 'temperature';
bibkey.tL_e2 = 'Frag1962';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-6;
weights.tW1 = 200 * weights.tW1;


%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data from BrayCham2002,Broe1982'};
set2 = {'tW_e','tW_e2'}; subtitle2 = {'Data from Frag1962'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Links
metaData.links.id_CoL = '6PPYF'; % Cat of Life
metaData.links.id_ITIS = '552501'; % ITIS
metaData.links.id_EoL = '118009'; % Ency of Life
metaData.links.id_Wiki = 'Lepus_europaeus'; % Wikipedia
metaData.links.id_ADW = 'Lepus_europaeus'; % ADW
metaData.links.id_Taxo = '61511'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13500156'; % MSW3
metaData.links.id_AnAge = 'Lepus_europaeus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepus_europaeus}}';
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
bibkey = 'BrayCham2002'; type = 'Article'; bib = [ ... 
'author = {Bray, Y. and Champely, S. and Soyez, D.}, ' ... 
'year = {2002}, ' ...
'title = {Age determination in leverets of European hare \emph{Lepus europaeus} based on body measurements}, ' ...
'journal = {Wildl. Biol.}, ' ...
'volume = {8}, ' ...
'pages = {31--39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Broe1982'; type = 'Phdthesis'; bib = [ ... 
'author = {Broekhuizen, S.}, ' ... 
'year = {1983}, ' ...
'title = {Hazen in {N}ederland}, ' ...
'school = {Wageningen Univ.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Frag1962'; type = 'Article'; bib = [ ... 
'author = {Fraguglione, D.}, ' ... 
'year = {1962}, ' ...
'title = {Le foetus du lievre commun (\emph{Lepus europeus} {P}.)}, ' ...
'journal = {Revue du Royal St. Hubert Club Belgique}, ' ...
'volume = {2}, ' ...
'pages = {35--37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaciBagl2006'; type = 'Article'; bib = [ ... 
'author = {Paci G. and Bagliacca, M. and Lavazza, A.}, ' ... 
'year = {2006}, ' ...
'title = {Stress evaluation in hares (\emph{Lepus europaeus} {P}allas) captured for translocation}, ' ...
'journal = {Ital. J. Anim. Sci.}, ' ...
'volume = {5}, ' ...
'pages = {175--181}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lepus_europaeus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'zoogdierver'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.zoogdiervereniging.nl/node/10}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ncbi'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ncbi.nlm.nih.gov/pubmed/11916113}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

