function [data, auxData, metaData, txtData, weights] = mydata_Abralia_multihamata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Enoploteuthidae';
metaData.species    = 'Abralia_multihamata'; 
metaData.species_en = 'Squid'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 27];

%% set data
% zero-variate data

data.ab = 10;   units.ab = 'd';    label.ab = 'age at birth';      bibkey.ab = 'Chia2025';   
  temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'probably 5-15 d';
data.am = 183;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'ChiaWang2025';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'depth 200-700 m, temp 6-18 C';

data.Lb  = 0.08;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';  bibkey.Lb  = 'guess';
data.Lp  = 3.68;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'ChiaWang2025';
data.Lpm  = 2.7;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male';  bibkey.Lpm  = 'ChiaWang2025';
data.Li  = 6.4; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'ChiaWang2025';
data.Lim = 2.8; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'ChiaWang2025';

data.GSI = 0.24;   units.GSI = 'g/g';  label.GSI = 'gonado somatic index at death';    bibkey.GSI = 'guess';
  temp.GSI = C2K(10); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length-weight
WLt_j = [ ...  % weight (g), mantle length (mm), time since birth (d)
1.60	19.98	49
1.59	21.59	54
1.14	19.42	43
2.58	25.28	62
1.67	21.87	53
1.24	19.39	50
1.00	17.65	51
1.13	17.23	43
1.36	19.96	47
0.58	15.16	53
2.00	26.33	55
1.95	24.00	63
1.51	23.00	57
1.20	22.00	52];
%
WLt_f = [ ...  % weight (g), mantle length (mm), time since birth (d)
 6.22	38.00	59
11.36	50.00	80
11.83	51.00	67
 6.06	39.00	46
12.85	53.00	55
10.94	47.00	56
 7.12	40.00	57
 6.96	40.00	57
 4.89	37.00	55
 5.90	39.00	56
 6.53	40.00	46
 6.33	39.00	60
 9.10	43.00	58
 6.86	40.00	59
 8.98	45.00	55
 8.59	45.00	50
 7.62	40.00	58
 5.14	36.00	65
 5.29	35.00	52
 5.32	37.00	61
 3.44	28.65	60
 3.17	27.44	53
 2.92	26.76	66
 9.90	45.75	92
 9.20	46.27  123
 8.03	45.70	86
 8.93	45.89	78
 9.44	47.03	98
 7.44	43.44	95
 4.17	40.60  127
 3.34	37.25  106
 6.57	47.21  121
 3.35	35.82  116
 4.30	40.50  120
 2.82	35.96  107
 3.52	39.98  115
 3.39	38.27	85
 3.96	42.29  126
 3.31	38.25  120
 3.63	40.22  113
 4.30	40.68  115
 2.71	33.96	98
 2.81	37.62  107
 2.82	36.05	95
 5.55	39.71	71
 4.23	35.66	76
 5.48	40.22	71
10.41	38.19  113
 5.38	35.28	77
 4.92	39.36  112
 9.11	53.32  120
 6.82	43.08	90
 7.32	45.33  110
 7.55	41.77	87
 5.75	38.8	86
 8.57	44.83	86
 5.62	38.15	73
 5.69	39.70	87
 7.15	45.73  133
 6.49	41.40	78
11.04	56.28	78
16.28	64.22  118
 3.01	32.11	68
 3.38	32.48	76
 2.78	30.31	72
 2.32	29.41	71
 2.70	29.97	74
 2.53	29.48	65
 2.26	27.49	71
 2.63	29.16	74
 3.92	31.63	73
 3.19	30.19	76
 3.36	30.96	72
 6.88	42.36	76
 6.16	40.10	70
 4.74	43.00  104
 5.61	38.57	85
 6.78	41.11	85
 5.19	37.64  103
 7.27	48.36  134
 5.58	38.51	72
 6.07	41.34	88
 6.68	42.45	76
11.09	54.46  115
 2.23	25.63	60
 2.78	30.94	71
 1.62	24.06	62
 2.39	29.19	66
 2.16	25.86	61
 1.52	24.88	56
 3.15	29.27	59
 2.58	30.58	52
 4.72	36.86	77
 2.32	28.43	63
 7.24	43.19	84
 2.91	33.19	66
 6.66	41.20	84
 4.96	40.27  103
 4.85	39.29	72
 7.06	40.30	80
 4.68	37.78	65
 3.69	32.11	64
 2.86	30.52	56
 5.28	41.84	93
 6.61	43.31	79
 6.03	39.52	78
 8.59	45.71	75
 6.94	40.89	96
 8.34	44.42	84
 6.87	40.19	76
 6.27	40.90	76
 7.18	40.87	80
 5.25	40.30  103
 3.73	34.75	90
 7.28	43.25	85
 6.91	44.53	76
 8.10	45.91  100
10.08	46.85	93
 9.15	44.54	76
 6.56	41.12	82
 4.83	36.29	83
 2.42	25.43	66
 1.98	23.56	53
 8.89	46.72	99
 8.64	53.72	81
 6.16	42.98	96
10.71	55.66  150
 8.71	50.10  101
 8.10	47.73  108
 8.66	51.50  136
 9.91	55.14  146
 5.79	40.82	81
 4.67	40.72  109
 8.08	48.25  130
 7.94	54.30  100
 7.12	44.45  102
 6.65	42.46	91
 6.98	42.4	86
 6.98	45.43	82
 8.28	54.57  142
 5.43	44.21  115
 7.23	44.20	90
 8.72	53.95  118
 1.68	25.47	94
 3.25	34.33  116
 2.60	34.45  115
 2.55	32.78  113
 2.33	34.37  101
 2.75	35.79	97
 2.73	34.52  100
 3.65	37.07  109
 3.60	37.25  118
 3.62	36.27  108
 3.38	36.62  110
 4.02	41.27  107
 4.26	41.58  104
 0.73	21.30	75
 3.29	37.14  119
 8.48	44.00	70
 7.28	43.00	56
 9.87	49.00	75
 6.68	43.00	58
 8.55	47.00	54
 8.01	46.00	56
 8.10	46.00	54
 5.32	44.00	53
 9.93	48.00	77
 9.05	47.00	56
 9.92	51.00	70
 8.51	46.00	62
 9.31	45.00	68
 4.88	42.00	94
 9.07	47.00	72
 7.83	45.00	66
 7.33	45.00	74
 8.41	43.00	70
 5.24	35.00	56
 7.36	41.00	67
 7.80	45.00	59
 6.92	42.00	77
 8.54	45.00	66
 6.51	43.00	61
 8.96	48.00	82
 8.34	46.00	67
 6.43	43.00	60
 8.66	45.00	68
 6.35	39.00	59
 6.00	40.00	54
 7.80	46.00	60
 6.69	40.00	56
 9.10	46.00	55
 9.35	47.00	61
 9.78	48.00	76
 8.65	43.00	68
11.64	52.00	63
 6.61	41.00	56
 7.73	45.00	64
 5.03	35.00	58
 2.56	29.00	54
 2.81	28.00	64
 3.02	31.00	64
 3.07	30.00	62
 6.77	44.00	64
 2.44	26.00	49
 4.15	34.00	56];
%
WLt_m = [ ... % weight (g), mantle length (mm), time since birth (d)
2.24	28.00	49
2.51	29.00	63
1.61	18.06	51
1.56	21.46	56
1.75	22.88	54
2.86	28.16	87
2.22	27.95	77
1.71	19.89	43
1.41	17.92	56
1.18	20.36	46
1.56	21.3	44
1.19	27.37	91
3.76	37.65  125
2.19	28.10  102
1.87	25.52	71
1.54	23.24	68
2.86	30.54	120
2.71	29.67	87
1.80	25.48	59
1.93	25.08	73
2.08	36.25	62
1.75	25.11	66
1.97	25.55	74
2.11	27.06	84
2.47	33.72	94
1.78	25.70	74
2.01	26.73	79
2.86	35.89  117
1.58	25.63  106
1.82	21.94	61
2.94	27.23	74
2.50	30.88	84
2.59	34.66  144
2.19	28.39	87
2.22	28.75	72
2.08	27.77	66
2.35	28.23	74
1.73	25.45	71
2.49	30.49	92
2.25	28.52	75
3.05	31.02	81
2.76	30.88	77
2.02	27.06	78
2.20	29.1	72
1.44	27.41	91
1.15	24.09	98
1.90	31.64	95
1.32	26.73	83
1.60	28.33  103
1.95	30.73  107
2.18	34.15	121
1.20	27.06	97
1.31	29.18	99
1.38	27.58	85
1.73	34.21  110
1.39	31.85  107
1.40	25.06  107
1.88	33.02  109
1.43	27.85  111
1.31	28.38  108
1.58	30.15  129
1.97	31.29	93
1.71	34.32  108
2.20	33.91	95
1.99	32.84  106
2.02	30.52  125
1.29	22.00	56
2.42	31.00	90
2.51	30.00	66
2.59	33.00  112
2.32	29.00	50
1.85	26.00	48
1.88	25.00	49
1.42	19.00	50
2.16	28.00	64
1.91	27.00	67
1.88	26.00	58
2.06	28.00	64
2.58	27.00	56];

% time-length
data.tL_f = [WLt_j(:,[3 2]); WLt_f(:,[3 2])]; data.tL_f(:,2) =  data.tL_f(:,2)/ 10; % convert mm to cm
[~, ind] = sort(data.tL_f(:,1)); data.tL_f = data.tL_f(ind,:); % sort ages
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'Chia2025','ChiaWang2025'};
%
data.tL_m = WLt_m(:,[3 2]); data.tL_m(:,2) =  data.tL_m(:,2)/ 10; % convert mm to cm
[~, ind] = sort(data.tL_m(:,1)); data.tL_m = data.tL_m(ind,:); % sort ages
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'Chia2025','ChiaWang2025'};

% time-weight
data.tW_f = [WLt_j(:,[3 1]); WLt_f(:,[3 1])]; 
[~, ind] = sort(data.tW_f(:,1)); data.tW_f = data.tW_f(ind,:); % sort ages
for i=2:size(data.tW_f,1); if data.tW_f(i,1)<=data.tW_f(i-1,1); data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3; end; end
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'weight', 'female'};  
temp.tW_f    = C2K(10);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = {'Chia2025','ChiaWang2025'};
%
data.tW_m = WLt_m(:,[3 1]);
[~, ind] = sort(data.tW_m(:,1)); data.tW_m = data.tW_m(ind,:); % sort ages
for i=2:size(data.tW_m,1); if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'weight', 'male'};  
temp.tW_m    = C2K(10);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = {'Chia2025','ChiaWang2025'};

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
2.161	0.842
2.396	2.014
2.425	1.924
2.510	1.653
2.594	2.255
2.613	2.495
2.679	2.886
2.716	3.126
2.763	3.096
2.905	3.307
2.943	3.186
3.000	2.946
3.028	3.096
3.065	3.667
3.188	3.186
3.206	3.908
3.207	3.006
3.215	4.749
3.254	3.727
3.273	3.517
3.301	3.878
3.311	3.727
3.321	3.006
3.368	3.457
3.405	3.577
3.414	4.389
3.423	4.178
3.425	2.585
3.433	3.818
3.434	3.277
3.434	2.856
3.489	4.449
3.490	3.727
3.499	4.028
3.526	5.321
3.527	4.780
3.527	4.689
3.536	4.990
3.538	3.337
3.554	5.411
3.564	4.810
3.575	3.607
3.595	3.307
3.602	5.110
3.612	4.359
3.632	3.517
3.650	4.509
3.679	4.058
3.687	4.900
3.689	3.186
3.708	3.457
3.736	3.367
3.743	5.230
3.753	5.261
3.753	4.930
3.754	4.449
3.773	3.938
3.783	3.457
3.790	5.802
3.799	6.283
3.800	5.230
3.801	4.569
3.810	5.080
3.812	10.401
3.818	5.561
3.819	5.411
3.849	3.547
3.858	3.908
3.859	3.246
3.875	5.772
3.878	3.487
3.884	5.651
3.902	6.433
3.903	6.283
3.924	4.629
3.931	5.952
3.951	5.591
3.960	5.621
3.963	3.126
3.972	3.487
3.977	7.004
3.980	4.900
3.988	5.651
3.996	6.764
3.997	6.463
4.005	7.455
4.007	5.982
4.010	3.547
4.018	4.780
4.026	6.192
4.026	5.441
4.027	5.321
4.046	4.569
4.056	4.208
4.071	7.335
4.076	3.727
4.085	4.148
4.099	8.176
4.100	7.064
4.100	6.884
4.101	6.253
4.102	5.802
4.104	3.908
4.110	6.553
4.147	7.485
4.147	6.974
4.167	6.733
4.179	4.269
4.189	4.178
4.196	6.012
4.197	4.780
4.206	5.261
4.217	3.938
4.237	3.697
4.242	6.854
4.245	4.539
4.262	5.651
4.270	7.275
4.277	9.048
4.289	6.673
4.298	7.455
4.299	6.403
4.306	8.597
4.306	8.447
4.307	7.876
4.307	7.756
4.310	5.321
4.317	7.365
4.318	6.854
4.318	6.222
4.327	6.673
4.328	6.192
4.331	3.788
4.355	7.455
4.364	7.184
4.377	4.749
4.384	6.824
4.395	5.351
4.402	7.034
4.410	8.507
4.415	4.479
4.421	7.154
4.438	9.108
4.439	8.297
4.459	6.974
4.461	5.591
4.471	5.020
4.485	9.168
4.486	8.447
4.496	7.996
4.499	5.591
4.505	7.906
4.513	9.108
4.513	8.868
4.515	7.485
4.523	8.657
4.534	7.725
4.551	9.108
4.553	7.305
4.560	9.168
4.562	7.966
4.563	7.094
4.580	8.838
4.581	7.996
4.588	9.499
4.589	8.537
4.597	9.860
4.599	8.176
4.620	6.914
4.626	9.559
4.645	9.319
4.646	8.357
4.655	8.898
4.658	6.703
4.683	9.198
4.690	10.972
4.691	10.461
4.691	10.130
4.703	8.537
4.712	9.078
4.721	9.349
4.724	6.523
4.751	8.146
4.786	9.920
4.798	8.146
4.805	9.649
4.816	8.928
4.834	9.649
4.846	7.275
4.890	9.920
4.948	9.289
4.964	11.453
4.966	9.830
4.974	11.182
4.996	8.657
5.070	10.010
5.114	11.814
5.166	8.687
5.181	11.663
5.188	13.076
5.255	12.926
5.316	9.168
5.364	8.657
5.383	8.808
5.412	7.966
5.418	11.122
5.459	8.597
5.459	8.327
5.495	9.830
5.504	10.040
5.551	10.701
5.626	11.032
6.403	16.202];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'ChiaWang2025';
%
data.LWw_m = [ ... % manth length (cm), wet weight (g)
1.538	0.601
1.745	1.052
1.755	1.052
1.811	1.443
1.839	1.623
1.915	1.263
2.000	1.263
2.028	1.683
2.169	1.924
2.180	1.293
2.302	1.623
2.397	1.683
2.435	1.202
2.500	1.834
2.520	1.443
2.556	2.495
2.557	1.984
2.557	1.743
2.557	1.623
2.604	1.683
2.660	2.585
2.661	1.984
2.670	2.255
2.690	1.323
2.718	1.202
2.727	1.954
2.745	2.946
2.754	2.645
2.755	1.984
2.775	1.353
2.801	2.796
2.821	2.285
2.841	1.353
2.850	1.473
2.896	2.495
2.906	2.315
2.907	1.293
2.981	2.525
3.002	1.503
3.039	1.713
3.058	2.044
3.066	2.766
3.076	2.735
3.113	3.216
3.123	2.495
3.152	2.375
3.152	1.864
3.210	1.293
3.218	2.285
3.293	2.645
3.313	1.984
3.313	1.864
3.331	2.495
3.407	2.285
3.416	2.675
3.455	1.683
3.605	2.735
3.614	2.856
3.634	2.074
3.821	3.818];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'ChiaWang2025';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.am = 10 * weights.am;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LWw_f','LWw_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '8TN2V'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '488799'; % Ency of Life
metaData.links.id_Wiki = 'Abralia_multihamata'; % Wikipedia
metaData.links.id_ADW = 'Abralia_multihamata'; % ADW
metaData.links.id_Taxo = '157982'; % Taxonomicon
metaData.links.id_WoRMS = '341836'; % WoRMS
metaData.links.id_molluscabase = '341836'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onykia ingens}}';
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
bibkey = 'ChiaWang2025'; type = 'Article'; bib = [ ...
'doi = {10.1016/j.fishres.2025.107347}, ' ...
'author = {Chun-I Chiang and Chia-Hui Wang}, ' ... 
'year = {2025}, ' ...
'title = {Life-history traits, maturation, and energy allocation of a small mesopelagic squid \emph{Abralia multihamata}}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {285}, ' ...
'pages = {413-421}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chia2025'; type = 'Misc'; bib = [ ...
'author = {Chun-I Chiang}, ' ...
'year = {2025}, ' ...
'note = {personal communication of unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Abralia-multihamata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

end
