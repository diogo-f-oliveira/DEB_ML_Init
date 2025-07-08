function [data, auxData, metaData, txtData, weights] = mydata_Dikerogammarus_villosus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Amphipoda'; 
metaData.family     = 'Gammaridae';
metaData.species    = 'Dikerogammarus_villosus'; 
metaData.species_en = 'Killer shrimp'; 

metaData.ecoCode.climate = {'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFe', '0iFp', '0iFl', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-Wd'; 't-L_f'; 'T-ab'; 'Ww-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs'};    
metaData.date_subm = [2017 06 28];              
metaData.email    = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, Aachen, Germany'};     

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 27]; 

%% set data
% zero-variate data 
data.ab = 14;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Poec2007';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.tp = 60;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Poec2009';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';  
data.am = 11*30;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'PiscDevi2003';   
  temp.am = C2K(10.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
   comment.am = 'life-span of D. villosus to be 11-17 months for males and 10-11 months for females';
 
data.Lb  = 0.19;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Poec2009';
data.Lp  = 0.65;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Poec2009';
data.Li  = 2.0; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MaieKley2011';  


data.Wwi = 115;   units.Wwi = 'mg';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MaieKley2011';
   
% uni-variate data

% tW data
data.tWd = [ ... % experimental time (d), wet weight (mg)
0.00	1.14
14.00	2.76
28.00	5.67
42.00	6.57];
units.tWd   = {'d', 'mg'};  label.tWd = {'experimental time', 'dry weight'};  bibkey.tWd = 'GabePush2011';
temp.tWd    = C2K(14);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';

% tL- data
data.tL = [ ... % experimental time (d), length (cm)
0.00	0.713
14.00	1.087
28.00	1.391
42.00	1.487
];
units.tL   = {'d', 'cm'};  label.tL = {'experimental time', 'length'}; bibkey.tL = 'GabePush2011'; 
temp.tL    = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
Lwinit.tL  = 0.713; units.Lwinit.tL = 'cm'; label.Lwinit.tL = 'initial physical length';
% 
%
data.tL2 = [ ... % time since birth (d), length (cm)
0	0.519
14	0.7127
28	0.9609
42	1.08
56	1.399
];
units.tL2   = {'d', 'cm'};  label.tL2 = {'experimental time', 'length'}; bibkey.tL2 = 'GergRoth2008';  
temp.tL2    = C2K(15);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
comment.tL2='food source: chironmids';
Lwinit.tL2  = 0.519; units.Lwinit.tL2 = 'cm'; label.Lwinit.tL2 = 'initial physical length';

%
data.tL3 = [ ... % experimental time (d), length (cm)
0	0.5224
14	0.638
28	0.6992
42	0.7739
56	0.9371
];
units.tL3   = {'d', 'cm'};  label.tL3 = {'experimental time', 'length'};  bibkey.tL3 = 'GergRoth2008'; 
comment.tL3='food source: biodeposition material';
temp.tL3    = C2K(15);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
Lwinit.tL3  = 0.5224; units.Lwinit.tL3 = 'cm'; label.Lwinit.tL3 = 'initial physical length';

%
data.tL4 = [ ... % experimental time (d), length (cm)
0	0.5156
14	0.5802
28	0.6074
42	0.6618
56	0.7331
];
units.tL4   = {'d', 'cm'};  label.tL4 = {'experimental time', 'length'};  
bibkey.tL4 = 'GergRoth2008'; comment.tL4='food source: alder leaves';
temp.tL4    = C2K(15);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
Lwinit.tL4  = 0.5156; units.Lwinit.tL4 = 'cm'; label.Lwinit.tL4 = 'initial physical length';

%length-weight data
data.LW = [ ... length (cm), wet weigth (mg)
0.40	2.32
0.41	1.85
0.46	2.78
0.49	8.81
0.50	6.49
0.49	4.17
0.51	6.03
0.51	2.32
0.54	8.34
0.55	5.10
0.57	9.27
0.58	7.42
0.60	9.27
0.60	6.03
0.61	3.71
0.62	9.74
0.62	8.34
0.62	5.10
0.63	15.30
0.65	15.30
0.68	13.91
0.68	10.66
0.69	8.81
0.65	6.95
0.67	6.03
0.69	19.47
0.69	15.76
0.68	12.52
0.72	17.62
0.72	13.44
0.71	11.13
0.74	17.62
0.74	14.37
0.74	12.05
0.75	16.23
0.76	13.44
0.76	9.74
0.78	7.88
0.80	19.47
0.81	27.35
0.82	24.57
0.83	12.05
0.84	30.13
0.85	20.86
0.85	29.67
0.85	26.42
0.88	28.74
0.88	18.54
0.89	21.32
0.90	27.81
0.92	28.28
0.94	28.74
0.92	16.69
0.94	17.15
0.95	36.16
0.95	32.91
0.97	29.21
1.00	46.82
1.00	42.19
0.99	37.55
1.02	42.19
1.02	39.87
1.02	31.99
1.04	31.06
1.03	35.23
1.08	43.58
1.07	39.40
1.10	36.62
1.13	62.12
1.29	48.68
1.76	105.70
];
units.LW   = {'cm', 'mg'};  label.LW = {'length','wet weight'};  
bibkey.LW = 'DobrMajk2016'; 
%
data.LW2 = [ ... length (cm), wet weigth (mg)
1.11	29.15
1.10	24.22
1.09	21.08
1.09	17.49
1.20	51.57
1.20	49.33
1.20	43.50
1.20	39.91
1.21	36.77
1.21	33.63
1.21	29.15
1.20	25.11
1.20	21.08
1.30	77.13
1.30	65.92
1.30	62.33
1.30	59.64
1.30	56.95
1.30	53.81
1.30	50.67
1.30	47.53
1.30	44.39
1.30	40.36
1.30	37.22
1.30	33.18
1.31	30.04
1.31	25.56
1.40	73.54
1.40	69.51
1.40	65.92
1.40	63.23
1.41	60.54
1.40	56.95
1.40	54.26
1.40	50.67
1.41	47.09
1.40	44.39
1.40	41.70
1.40	39.46
1.40	36.77
1.41	34.08
1.39	32.29
1.40	30.94
1.39	29.15
1.50	97.76
1.50	91.48
1.50	82.51
1.50	77.13
1.50	74.89
1.51	72.65
1.51	69.96
1.50	67.26
1.50	65.02
1.50	61.88
1.50	59.64
1.51	57.40
1.50	52.91
1.50	50.67
1.50	47.98
1.50	45.29
1.51	42.15
1.51	39.91
1.51	36.32
1.61	101.30
1.61	95.07
1.61	88.34
1.61	85.65
1.61	83.41
1.61	80.72
1.61	78.03
1.60	74.44
1.61	70.40
1.61	68.16
1.61	65.92
1.60	63.68
1.60	60.99
1.60	57.40
1.60	54.26
1.61	51.57
1.60	48.88
1.60	46.19
1.61	43.95
1.70	110.30
1.71	106.70
1.70	100.00
1.70	96.86
1.70	162.80
1.70	94.17
1.70	91.93
1.70	88.79
1.70	86.10
1.70	83.41
1.70	80.72
1.70	77.58
1.71	74.89
1.70	72.20
1.70	69.51
1.70	67.26
1.70	64.57
1.70	62.78
1.70	60.54
1.70	58.74
1.70	56.05
1.70	53.36
1.71	51.12
1.70	48.43
1.70	45.74
1.81	122.90
1.80	113.90
1.80	111.20
1.80	108.50
1.81	105.80
1.81	103.60
1.81	101.30
1.80	99.55
1.81	97.31
1.80	95.07
1.81	92.83
1.81	90.58
1.81	88.79
1.81	86.55
1.81	83.86
1.80	80.72
1.81	78.03
1.81	74.89
1.80	72.20
1.81	69.96
1.81	66.82
1.81	64.13
1.91	161.90
1.91	135.90
1.90	126.90
1.90	117.00
1.91	115.20
1.91	112.10
1.91	109.00
1.91	107.20
1.91	104.00
1.91	102.20
1.91	100.40
1.91	98.21
1.90	95.07
1.91	92.38
1.91	89.69
1.92	88.34
1.90	84.75
1.90	82.51
2.01	170.00
2.00	143.00
2.00	126.90
2.00	122.40
2.01	119.30
2.00	114.30
2.00	109.40
2.01	105.80
2.00	103.10
2.00	101.30
2.01	99.10
2.00	96.86
2.01	93.27
2.10	183.00
2.10	177.10
2.10	127.40
2.20	133.60
2.30	162.30
];
units.LW2   = {'cm', 'mg'};  label.LW2 = {'length','wet weight'};  
bibkey.LW2 = 'MaieKley2011'; 

data.Tab = [ ... % temperature (C), time (d)
3.54	76.12
3.24	73.70
3.49	70.59
3.83	69.55
3.96	65.05
3.88	61.94
3.96	59.17
4.26	58.13
4.05	55.36
4.56	55.36
4.94	50.17
5.45	49.48
6.05	48.79
5.84	45.33
5.45	44.98
6.09	43.94
5.84	39.45
6.18	41.18
6.48	36.68
6.73	36.68
7.07	34.95
7.29	33.91
7.67	32.87
7.71	28.72
8.52	29.07
8.44	26.99
8.82	27.34
8.99	24.91
8.78	22.84
9.46	25.26
9.97	25.26
9.97	21.80
9.93	18.69
10.36	22.84
10.95	20.42
11.47	22.49
11.38	19.72
11.89	20.07
11.93	15.92
12.40	17.99
12.45	15.57
13.00	20.76
12.96	17.30
13.90	18.34
13.81	15.92
14.36	17.30
14.32	14.53
15.05	15.92
15.00	12.80
15.94	16.61
15.90	13.49
16.37	14.19
17.01	14.19
16.92	11.76
17.43	12.11
17.99	13.49
17.90	11.07
18.97	10.38
19.95	13.49
19.91	10.03
21.91	11.76
22.00	8.65
22.93	10.38
22.89	7.61
23.96	9.69
24.00	6.57
];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Poec2007';

data.WR = [ ... % wet weight (mg), egg number (#)
8.3     14.60
7.9     12.00
7.9     8.60
8.1     6.00
8.1     4.30
9.7     21.80
9.7     19.70
9.7     15.90
10.1    13.30
10.1	9.90
9.7     7.70
11.7	29.10
11.9	25.30
11.9	22.30
11.9	19.70
11.9	17.10
11.9	14.60
11.7	11.60
11.7	8.60
13.8	39.40
13.8	36.80
13.7	32.60
13.8	29.60
14.0	27.00
13.8	24.00
13.8	21.40
14.0	19.70
13.8	17.60
13.8	15.40
13.8	12.90
13.7	10.30
13.7	8.60
16.1	40.30
16.1	36.40
16.1	34.30
15.9	31.70
16.1	29.10
16.1	27.00
15.9	25.30
15.8	22.70
15.9	20.60
15.9	18.00
4.8     16.70
4.8     14.10
4.8     12.00
4.8     9.00
7.8     46.70
8.0     45.00
7.8     41.10
7.8     38.10
8.2     35.10
8.0     33.40
7.8     31.30
8.0     27.40
7.8     24.00
7.6     22.30
7.8     19.30
7.8     15.90
8.0     13.70
7.6     12.40
7.8     9.90
6.1     14.10
9.5     39.80
9.5     28.30
9.3     24.40
9.3     20.10
9.5     17.60
14.4	64.70
14.2	61.70
14.2	57.00
14.4	54.40
14.2	51.80
14.0	48.80
14.2	45.80
14.0	42.40
14.4	39.40
14.2	36.40
14.2	33.00
14.2	29.60
14.2	26.60
14.0	24.40
14.2	22.70
14.0	20.60
14.2	18.40
14.2	16.70
14.4	13.70
14.0	12.40
15.9	40.70
16.4	36.80
16.4	33.00
16.1	28.30
16.1	26.60
20.0	77.50
20.2	65.10
20.2	55.30
20.0	46.70
20.0	43.70
20.0	40.70
19.6	35.60
20.0	32.10
20.0	24.40
21.9	93.80
21.5	90.80
21.9	81.40
21.7	91.20
21.9	78.80
21.7	75.00
21.9	72.00
21.5	68.10
21.7	63.40
21.7	58.70
21.5	55.30
21.5	52.70
21.7	49.30
21.5	46.30
21.7	44.50
21.5	41.50
21.7	39.00
21.7	35.60
21.5	34.30
21.5	31.70
21.7	29.60
21.5	27.80
21.7	25.30
21.5	22.70
21.5	20.10
21.5	17.60
21.5	15.40
24.1	62.50
24.1	60.00
23.9	57.00
24.1	52.70
24.1	50.10
24.1	47.10
23.9	44.10
23.9	41.10
24.1	36.40
24.5	30.00
24.1	27.80
25.4	107.90
25.6	105.80
25.8	102.40
25.8	99.40
25.6	96.40
25.8	90.80
25.8	89.10
25.8	85.70
25.6	83.10
26.0	80.50
25.8	77.50
26.0	73.20
25.8	71.50
25.6	69.00
25.6	66.40
25.8	63.40
26.0	60.40
25.8	56.50
25.6	54.00
25.8	52.30
25.8	49.30
26.0	46.30
25.8	44.10
25.6	41.10
25.6	39.00
25.8	36.00
25.6	31.70
25.6	27.00
25.4	24.00
25.6	20.10
28.6	98.10
28.4	66.40
28.6	45.80
28.4	39.80
28.2	36.80
28.2	34.70
30.3	116.90
30.1	113.90
30.1	109.60
30.3	65.10
30.3	60.40
30.1	28.30
30.0	62.20
30.0	47.70
30.0	47.00
30.0	37.40
30.0	49.50
30.0	41.00
30.0	48.30
30.0	48.10
30.0	51.40
30.0	62.60
30.0	44.60
30.0	75.00
30.0	54.60
30.0	42.30
30.0	46.20
30.0	64.70
30.0	38.20
30.0	46.10
30.0	74.90
35.0	122.50
34.8	118.60
34.8	114.80
35.0	110.10
35.1	107.90
34.8	103.60
34.6	100.20
35.0	96.40
34.6	78.80
34.6	75.40
34.8	59.50
34.6	48.40
35.0	44.50
34.8	31.70
35.0	96.40
35.0	94.70
35.0	90.40
35.0	95.50
35.0	92.60
35.0	82.60
35.0	83.20
35.0	85.30
35.0	90.00
35.0	81.30
35.0	80.60
35.0	82.70
35.0	95.30
35.0	97.70
35.0	91.00
35.0	80.70
35.0	91.90
35.0	100.50
37.4	111.80
38.3	75.00
38.3	57.00
38.0	53.50
40.0	138.80
39.8	136.20
40.0	129.30
39.6	126.80
39.8	123.80
40.2	121.60
39.8	117.30
39.8	111.80
39.8	108.40
40.0	105.80
39.6	101.50
39.8	97.60
39.8	93.40
39.8	89.90
40.0	86.90
39.8	84.40
39.6	81.40
39.6	77.50
40.0	73.70
40.0	70.70
39.6	61.70
39.6	57.80
45.3	147.80
45.3	135.30
45.3	130.60
45.3	119.90
45.3	115.20
44.9	108.80
45.3	104.10
45.1	87.80
44.9	83.10
44.9	78.40
45.1	75.80
45.1	72.40
50.5	160.60
50.9	106.60
50.7	92.50
56.5	157.60
56.1	110.50
91.9	193.60
];
units.WR   = {'mg', '#'};  label.WR = {'wet weigth', 'egg number'};  
temp.WR    = C2K(11);  units.temp.WR = 'K'; label.temp.WR = 'temperature';
bibkey.WR = 'Poec2007'; 

% % t_L- data
data.tL5 = [ ...time (d) length (cm)
0	0.3035
1	0.312286325
2	0.322896912
3	0.333075192
4	0.342673099
5	0.351476806
6	0.360742102
7	0.370784138
8	0.380210082
9	0.390768162
10	0.401169826
11	0.410733058
12	0.419253339
13	0.430491549
14	0.441158765
15	0.451109669
16	0.460505509
17	0.471990949
18	0.4787922
19	0.490044168
20	0.500104258
21	0.511157318
22	0.520921933
23	0.528069643
24	0.535999819
25	0.543057343
26	0.552290763
];
units.tL5   = {'d','cm'};  label.tL5 = {'time','length'};  
bibkey.tL5 = 'Poec2009'; comment.tL5 ='converted growth-rate vs. length data';
temp.tL5    = C2K(12);  units.temp.tL5 = 'K'; label.temp.tL5 = 'temperature';
Lwinit.tL5  = 0.3035; units.Lwinit.tL5 = 'cm'; label.Lwinit.tL5 = 'initial physical length';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.Lwinit = Lwinit;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL2','tL3', 'tL4'}; subtitle1 = {'food: chironmids, deposition material, alder leaves'};
set2 = {'LW','LW2'}; subtitle2 = {'MaieKley2011 & DobrMajk2016'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'We assume 11 days time between broods at reference temperature (20 C). This is about the age at birth from the Tab data set, assuming that development starts directly after the last brood has been released. We do not have any information of the actual time between broods, and it might take longer than 11 days because of a mating period, or shorter if a new brood is already developing before the last has been released.';
D2 = 'The estimation does converge but the routine does not stop before a large amount of steps. The resulting parameters remain similar.';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '364SQ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46527227'; % Ency of Life
metaData.links.id_Wiki = 'Dikerogammarus_villosus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '660660'; % Taxonomicon
metaData.links.id_WoRMS = '148586'; % WoRMS


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poec2007'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M.}, ' ... 
'year = {2007}, ' ...
'title = {Strategies of a successful new invader in {E}uropean freshwaters: fecundity and reproductive potential of the {P}onto-{C}aspian amphipod \emph{Dikerogammarus villosus} in the {A}ustrian {D}anube, compared with the indigenous \emph{Gammarus fossarum} and \emph{G. roeseli}}, ' ...
'journal = {Freshwater Biology}, ' ...
'doi = {10.1111/j.1365-2427.2006.01671.x}, ' ...
'volume = {52}, ' ...
'pages = {50-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Poec2009'; type = 'Article'; bib = [ ... 
'author = {Poeckl, M.}, ' ... 
'year = {2009}, ' ...
'title = {Success of the invasive {P}onto-{C}aspian amphipod \emph{Dikerogammarus villosus} by life history traits and reproductive capacity}, ' ...
'journal = {Biol Invasions}, ' ...
'doi = {10.1007/s10530-009-9485-5}, ' ...
'volume = {11}, ' ...
'pages = {2021-2041}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PiscDevi2003'; type = 'Article'; bib = [ ... 
'author = {Piscart, C. and Devin, S. and Beisel, J.-N. and  Moreteau, J.-C.}, ' ... 
'year = {2003}, ' ...
'title = {Growth-related life-history traits of an invasive gammarid species: evaluation with a {L}aird-{G}ompertz model}, ' ...
'journal = {Can. J. Zool. }, ' ...
'doi = {0.1139/Z03-188}, ' ...
'volume = {81}, ' ...
'pages = {2021-2041}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GabePush2011'; type = 'Article'; bib = [ ... 
'author = {Gabel, F. and Pusch, M. T. and Breyer, P. and Burmester, V. and Walz, N. and Garcia, X. F.}, ' ... 
'year = {2011}, ' ...
'title = {Differential effect of wave stress on the physiology and behaviour of native versus non-native benthic invertebrates}, ' ...
'journal = {Biol. Invasions }, ' ...
'doi = {0.1007/s10530-011-0003-1}, ' ...
'volume = {13}, ' ...
'pages = {843-1853}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GergRoth2008'; type = 'Article'; bib = [ ... 
'author = {Gergs, R. and Rothhaupt, K. O.}, ' ... 
'year = {2008}, ' ...
'title = {Feeding rates, assimilation efficiencies and growth of two amphipod species on biodeposited material from zebra mussels}, ' ...
'journal = {Freshwater Biology}, ' ...
'doi = {0.1111/j.1365-2427.2008.02077.x}, ' ...
'volume = {53}, ' ...
'pages = {2494-2503}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DobrMajk2016'; type = 'Article'; bib = [ ... 
'author = {Dobrzycka-Krahel, A. and Majkowski,W. and Melzer, M.}, ' ... 
'year = {2016}, ' ...
'title = {Length-weight relationships of {P}onto-{C}aspian gammarids that have overcome the salinity barrier of the southern {B}altic {S}ea coastal waters}, ' ...
'journal = {Marine and Freshwater Behaviour and Physiology}, ' ...
'doi = {10.1080/10236244.2016.1244948}, ' ...
'volume = {-}, ' ...
'pages = {1-7}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaieKley2011'; type = 'Article'; bib = [ ... 
'author = {Maier, G. and Kley, A. and Schank, Y. and Maier, M. and Mayer, G. and Walosczek, D.}, ' ... 
'year = {2011}, ' ...
'title = {Density and temperature dependent feeding rates in an established and an alien freshwater gammarid fed on chironomid larvae}, ' ...
'journal = {J. Limnol.}, ' ...
'doi = {0.3274/JL11-70-1-14}, ' ...
'volume = {70}, ' ...
'pages = {123-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


