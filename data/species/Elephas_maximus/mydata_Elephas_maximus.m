function [data, auxData, metaData, txtData, weights] = mydata_Elephas_maximus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Proboscidea'; 
metaData.family     = 'Elephantidae';
metaData.species    = 'Elephas_maximus'; 
metaData.species_en = 'Asian elephant'; 

metaData.ecoCode.climate = {'Aw', 'Cwa', 'Cwb', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JXi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 10 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2013 08 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2015 10 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2016 11 14];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 11];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 644;    units.tg = 'd';     label.tg = 'age at birth';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 548;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3287;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 65.5*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 270;   units.Li  = 'cm';  label.Li  = 'ultimate shoulder height'; bibkey.Li  = 'SukuJosh988';

data.Wwb = 107e3;   units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AnAge';
data.Wwx = 400e3;   units.Wwx = 'g'; label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'guess';
data.Wwi = 3.178e6;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'estimated from relative weight of Loxodonta';

data.Ri  = 0.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'weaning at 2 till 3 year; calf interval 4.5 year';
  
data.JXm  = 1.5e5; units.JXm  = 'g/d'; label.JXm  = 'plant intake at L_m '; bibkey.JXm  = 'animalinfo';   
  temp.JXm = C2K(35.8);  units.temp.JXm = 'K'; label.temp.JXm = 'temperature';

% uni-variate data  
% time-length
data.tL_f = [ ... % age (a), shoulder height (cm)
0.09	82.35
0.17	84.23
0.18	85.64
0.18	87.99
-0.05	90.10
0.11	91.97
0.11	94.09
0.11	96.20
0.12	98.07
0.12	100.18
1.06	110.28
1.06	111.22
1.06	112.39
0.99	114.27
0.91	115.67
0.91	117.55
1.07	119.43
1.08	122.24
1.08	124.12
1.00	126.00
1.01	127.87
1.01	129.75
2.08	124.36
2.08	127.41
2.01	130.93
2.01	132.57
1.94	134.21
1.94	136.09
2.02	137.96
2.03	141.48
2.03	142.42
2.03	144.06
3.02	135.15
3.02	136.33
3.02	138.44
3.02	140.08
3.03	142.43
3.03	144.30
3.03	145.48
3.03	146.65
3.04	148.76
3.04	150.17
3.04	154.39
4.03	144.07
4.04	147.83
4.04	150.17
4.04	152.05
4.04	154.16
4.05	155.80
4.05	157.45
4.05	158.85
4.06	163.78
5.20	158.16
5.21	160.03
5.06	162.61
4.98	164.49
4.98	165.66
4.83	167.07
4.84	169.88
5.00	178.80
5.91	170.83
5.92	172.24
5.92	174.11
6.00	175.29
6.00	177.16
6.17	188.66
6.84	170.36
7.00	173.65
7.00	176.23
6.93	179.04
6.85	182.80
6.86	183.97
6.87	190.54
8.00	174.12
8.00	178.11
8.01	180.69
8.01	184.21
7.86	187.26
7.87	190.54
7.87	194.30
8.03	199.22
9.01	182.10
8.93	184.21
8.94	186.33
9.09	187.97
8.95	194.54
8.95	196.88
10.02	188.91
10.02	190.79
10.10	191.96
10.10	194.31
10.11	196.42
10.03	199.00
10.04	201.11
9.89	204.86
10.79	193.14
10.95	195.02
10.88	199.47
10.88	201.12
10.88	202.99
10.89	205.34
10.89	209.09
11.87	196.19
12.11	198.31
12.11	201.12
12.11	202.76
12.04	204.64
12.04	206.75
12.05	208.63
12.05	212.38
12.06	218.48
12.95	194.56
12.96	199.01
12.96	201.12
12.96	202.77
12.96	204.88
12.97	206.76
12.97	209.34
12.82	212.62
12.91	222.47
13.96	202.54
13.96	205.12
13.97	206.29
13.97	208.40
13.98	212.86
13.90	216.61
13.91	218.96
13.91	220.60
13.92	226.70
14.96	204.65
14.97	206.76
14.97	210.99
14.98	213.33
14.99	220.84
14.99	223.42
15.95	197.15
16.04	202.55
16.05	208.18
15.97	210.76
15.90	213.34
15.90	214.98
15.90	216.86
15.91	220.38
15.83	222.02
16.97	206.30
16.90	214.75
16.90	217.10
16.83	219.68
16.84	222.96
16.70	235.39
17.88	202.56
17.97	211.94
17.98	216.40
17.91	221.56
17.91	223.20
17.92	225.08
17.92	227.19
17.78	237.51
18.91	218.98
18.91	222.97
18.92	225.32
18.92	226.72
18.86	241.27
19.67	217.58
19.75	219.92
19.91	221.33
19.99	223.21
20.00	226.73
19.92	231.42
19.70	236.82
19.94	242.68
20.83	217.35
20.83	221.57
20.91	223.68
20.93	232.83
20.94	239.40
21.91	222.98
21.92	224.63
21.92	226.97
21.93	232.37
21.94	238.94
22.92	231.20
23.00	233.31
22.93	235.66
22.86	241.05
24.00	233.08
24.02	243.17
25.00	227.69
25.00	233.32
23.00	227.21
24.79	245.05
25.79	247.64
26.79	247.17
26.00	233.09
26.93	234.03
26.77	227.70
25.85	230.04
27.91	219.02
28.07	222.78
28.84	225.13
28.84	227.71
28.85	232.64
27.94	241.55
27.72	248.58
27.72	250.23
28.80	251.87
29.80	251.88
29.94	243.20
29.93	236.63
29.84	227.01
30.69	227.01
30.85	230.53
30.88	251.18
31.95	251.89
33.42	251.90
34.26	251.43
35.11	251.67
35.88	251.67
35.88	253.78
37.11	253.09
36.80	251.21
37.72	251.21
38.80	251.22
40.18	251.22
41.03	251.23
41.95	251.23
41.96	254.05
42.81	255.69
43.73	255.46
45.11	255.94
46.04	256.18
47.27	256.18
48.11	256.19
50.11	251.97
49.26	251.97
47.88	251.96
46.88	251.96
45.95	251.95
44.95	251.48
43.65	251.94
42.34	251.70
34.86	237.83
35.55	240.18
37.24	239.71
40.94	239.26
42.09	242.55
42.55	241.15
44.02	242.80
46.71	241.64
48.17	242.35
49.09	241.65
50.02	241.65
49.93	233.20
48.85	233.20
47.85	233.19
46.70	233.19
45.77	233.42
45.08	233.18
42.77	231.29
41.69	231.29
40.85	231.28
39.92	231.28
38.92	231.28
38.00	231.51
36.62	231.73
35.62	230.79
34.54	230.79
33.77	230.78
31.69	229.60
32.15	227.49
31.98	219.51
32.76	222.57
32.76	226.32
32.92	229.61
34.06	221.63
34.07	227.73
34.69	227.27
35.69	227.04
37.15	227.04
38.00	227.05
38.84	227.52
40.46	227.29
41.46	226.83
43.00	227.07
44.30	227.08
45.38	227.08
45.92	227.09
46.76	227.09
48.00	227.10
49.30	227.10
49.84	227.10
49.99	223.59
48.99	223.35
47.76	223.34
46.91	223.34
45.91	223.33
44.84	223.33
43.99	223.32
42.91	223.32
41.91	222.84
40.68	222.84
35.84	223.52
35.83	220.70
36.98	219.07
37.75	218.84
38.83	218.84
40.06	219.08
41.29	219.09
42.06	219.09
42.98	219.10
44.06	219.10
45.21	219.11
46.14	219.11
46.75	219.58
47.91	219.59
49.14	219.59
50.22	219.36]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert a to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'shoulder height', 'female'};  
temp.tL_f   = C2K(36.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SukuJosh988';
comment.tL_f = 'Data for females; captive individuals';
%
data.tL_m = [ ... % age (a), shoulder height (m)
0.11	78.11
0.11	80.11
0.07	82.09
0.12	83.52
0.22	85.80
0.22	87.50
0.22	88.93
0.04	90.92
0.04	92.62
0.14	94.61
0.14	96.04
1.21	113.97
1.21	116.53
1.12	117.95
1.03	119.66
1.04	122.22
0.95	123.93
0.85	125.35
1.04	126.77
1.05	128.20
1.05	129.62
1.05	131.33
2.09	132.76
2.09	134.75
1.91	138.16
1.91	140.15
2.10	141.86
2.01	143.28
1.92	145.56
1.93	147.27
2.12	148.41
2.12	149.54
2.04	156.37
3.24	145.86
3.24	148.14
3.34	150.70
3.07	154.11
3.07	156.10
2.89	160.65
3.28	165.77
3.92	159.24
3.92	161.23
4.11	162.94
3.93	164.64
4.03	165.78
3.93	166.92
3.84	168.34
3.94	169.48
4.04	171.47
4.04	174.60
4.88	168.92
4.88	171.20
5.07	174.33
5.08	175.18
5.08	177.17
5.08	178.31
4.99	179.73
4.81	182.01
4.90	183.72
6.10	172.92
6.11	175.19
6.21	178.61
6.12	180.60
6.03	182.31
6.03	185.15
6.03	186.57
6.04	188.00
6.04	189.13
5.95	191.12
5.95	192.26
6.05	195.11
7.05	178.05
7.05	180.33
7.06	184.02
7.16	188.01
7.17	191.99
7.08	194.55
7.09	197.40
7.09	198.25
7.01	206.50
8.00	182.33
7.82	188.59
7.92	190.29
8.02	193.71
8.12	196.55
8.21	198.55
8.12	200.54
8.13	202.24
8.13	203.95
8.13	205.37
8.04	207.08
7.95	208.50
7.86	209.92
7.96	212.48
8.96	194.00
9.05	196.00
9.15	198.56
9.06	201.69
8.98	203.96
8.98	206.24
9.08	209.08
9.08	210.51
9.09	212.50
8.81	216.76
8.91	218.47
9.20	226.15
9.99	196.29
10.09	198.57
10.10	204.54
10.11	209.38
10.02	210.80
10.02	212.51
10.12	215.92
10.13	218.20
10.13	220.48
10.14	222.18
10.14	223.89
10.05	225.88
10.15	229.86
10.84	200.28
11.05	208.54
11.05	210.81
10.96	213.09
10.78	217.35
10.69	219.34
10.89	221.91
11.08	226.74
11.09	229.87
12.07	203.71
12.08	206.56
12.08	207.98
12.08	210.82
11.90	214.81
11.91	215.94
11.91	218.50
12.02	225.90
12.02	228.18
12.03	229.89
12.13	234.44
12.13	236.15
11.95	239.84
12.56	213.67
12.84	216.52
13.04	218.80
13.04	223.07
13.05	224.21
13.05	226.20
13.15	229.90
12.98	236.15
13.18	246.97
13.87	214.54
13.88	217.96
14.08	225.64
14.08	227.06
14.09	230.76
13.91	233.61
13.91	235.31
13.92	239.30
14.91	215.41
12.92	208.56
14.91	217.12
14.82	220.24
14.92	221.67
15.02	224.80
15.03	228.50
15.03	230.77
14.86	239.31
14.86	240.16
14.86	241.58
14.87	244.43
15.08	258.94
15.94	218.27
15.86	224.81
15.87	227.37
15.97	230.78
16.16	232.49
16.17	236.19
16.08	238.47
16.00	245.86
16.00	248.42
16.69	216.28
16.99	223.68
16.99	226.24
17.00	228.52
17.09	231.65
17.10	233.36
17.02	239.33
16.84	243.88
16.84	247.58
16.85	249.85
17.63	218.28
17.92	221.42
17.94	230.24
18.03	232.51
18.04	236.21
18.05	240.48
18.06	246.17
17.97	250.44
17.89	254.13
18.95	219.72
18.96	224.27
20.61	204.66
19.99	224.29
19.99	226.56
20.65	228.85
20.75	229.98
20.00	231.11
20.00	232.25
18.97	229.96
19.07	232.24
19.07	236.51
18.89	240.77
19.93	240.22
21.14	240.23
19.74	241.92
19.09	242.48
19.09	244.47
20.12	246.19
20.87	243.36
20.88	246.77
20.98	250.47
20.98	253.03
19.76	249.89
18.91	250.45
19.20	252.16
19.20	254.43
19.02	256.42
19.96	258.99
19.96	260.13
20.25	262.41
21.28	263.28
20.99	260.43
22.13	263.57
22.69	265.85
24.10	265.02
22.97	261.59
22.02	257.03
21.83	254.18
21.82	249.63
21.82	247.92
21.91	245.93
23.00	226.60
23.85	230.30
23.94	232.30
23.95	234.29
25.16	230.03
25.82	231.75
27.70	235.18
27.05	236.31
26.02	236.59
26.02	238.86
25.09	240.84
25.10	246.53
23.04	250.78
23.05	253.34
23.79	250.79
24.08	254.77
24.08	256.20
25.01	252.22
25.12	258.48
25.03	261.04
24.94	263.03
25.98	266.74
25.99	270.16
25.79	264.47
25.96	258.78
26.05	257.07
26.05	255.65
26.32	248.82
26.96	240.01
27.06	242.01
27.25	244.57
27.26	251.11
26.99	254.52
27.09	257.08
27.09	258.79
27.09	260.78
26.92	266.19
26.83	268.74
27.93	258.52
28.12	260.51
28.13	263.64
28.14	269.90
29.27	269.34
28.89	265.92
28.69	262.51
28.96	258.24
28.01	251.12
27.92	248.84
27.91	246.85
28.00	242.30
27.99	239.17
29.03	242.03
29.13	244.30
29.23	249.43
29.23	250.85
29.14	253.69
29.90	256.26
30.19	260.82
30.10	265.37
30.11	268.78
30.11	270.77
30.96	271.35
30.95	269.08
31.04	265.38
31.04	262.53
30.73	251.15
30.25	244.89
29.87	239.76
30.81	242.90
30.91	245.75
31.95	246.90
33.25	243.21
33.28	257.44
32.05	255.43
32.91	261.13
33.12	272.23
33.11	268.53
31.99	268.80
32.18	272.79
34.52	268.83
35.18	268.84
35.93	268.85
37.52	268.87
38.55	269.16
39.30	269.17
39.31	271.45
40.25	271.46
41.37	268.34
42.59	269.78
43.62	269.79
44.28	269.51
41.66	272.90
42.50	273.19
43.25	273.20
44.47	273.50
45.60	274.08
46.54	274.37
47.38	274.38
48.22	273.54
49.16	273.55
50.19	273.56
50.08	263.60
49.14	263.59
48.02	263.30
47.08	263.29
45.77	263.27
44.92	263.55
44.36	263.54
42.95	263.81
42.11	263.80
41.08	263.79
40.04	263.49
39.20	263.20
38.17	263.47
34.03	256.59
34.97	256.60
35.05	252.05
34.39	250.91
34.40	253.18
35.99	250.64
36.08	252.35
36.18	256.62
36.19	259.18
37.12	256.63
38.72	256.65
40.22	256.66
40.97	256.67
41.34	256.68
42.94	256.69
43.12	255.27
44.44	255.86
44.07	257.56
44.07	258.70
45.19	255.01
45.19	257.29
46.31	255.31
46.32	257.02
47.06	255.32
47.26	257.60
47.26	259.30
48.57	256.76
48.19	255.33
49.20	242.26
48.45	241.39
47.32	241.38
46.10	241.37
45.07	241.36
45.92	246.49
45.17	247.33
43.95	246.75
44.05	250.45
43.21	250.44
42.64	245.60
41.89	247.01
42.27	250.43
41.33	250.42
41.14	246.43
39.93	250.97
38.89	250.96
38.05	250.95
38.24	253.23
36.91	245.82
34.94	244.09
35.12	236.69
37.18	234.72];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'shoulder height', 'male'};  
temp.tL_m   = C2K(36.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SukuJosh988';
comment.tL_m = 'Data for males; captive individuals';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_4: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '398D9'; % Cat of Life
metaData.links.id_ITIS = '584938'; % ITIS
metaData.links.id_EoL = '997407'; % Ency of Life
metaData.links.id_Wiki = 'Elephas_maximus'; % Wikipedia
metaData.links.id_ADW = 'Elephas_maximus'; % ADW
metaData.links.id_Taxo = '69348'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11500004'; % MSW3
metaData.links.id_AnAge = 'Elephas_maximus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elephas_maximus}}';
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
bibkey = 'SukuJosh988'; type = 'Article'; bib = [ ... 
'author = {R. Sukumar and N. V. Joshi and V. Krishnamurthy}, ' ... 
'year = {1988}, ' ...
'title = {Growth in the {A}sian elephant}, ' ...
'journal = {Proc. Indian Acad. Sci. (Anim. Sci.)}, ' ...
'volume = {97}, ' ...
'pages = {561-571}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Elephas_maximus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'animalinfo'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.animalinfo.org/species/elepmaxi.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

