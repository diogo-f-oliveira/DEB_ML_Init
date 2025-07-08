function [data, auxData, metaData, txtData, weights] = mydata_Fenneropenaeus_chinensis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Penaeidae';
metaData.species    = 'Fenneropenaeus_chinensis'; 
metaData.species_en = 'Fleshy prawn'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L', 't-Ww', 'L-Ww', 'Ww-N', 'T-JO', 'T-JN', 'Ww-JX'};

metaData.COMPLETE = 4.7; % using criteria of LikaKear2011

metaData.author   = {'Jeffrey Ren'};                            
metaData.date_subm = [2019 08 30];
metaData.email    = {'ren9878@163.com'};
metaData.email    = {'jeffrey.ren@niwa.co.nz'};
metaData.address  = {'National Institute of Water and Atmospheric Research, PO Box 8602, Christchurch 8440, New Zealand'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data
data.ab = 3;    units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = {'DengYe1990','LuoKong2014','LiXiang2002'};   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.tp = 76;      units.tp = 'd';      label.tp = 'time since birth at puberty';  bibkey.tp = {'LiXiang2002','DengYe1990'};
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';  
data.am = 365*2;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'Wiki';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 0.6; units.Lj  = 'cm';  label.Lj  = 'total length at  metam';  bibkey.Lj  = {'DengYe1990','LiXiang2002'}; 
data.Lp  = 4;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'LiXiang2002';
 comment.Lp = 'no difference between female and male before 7cm';
data.Li  = 23.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';   

data.Wwb = 1.15e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DengYe1990';
  comment.Wwb = 'based on egg diameter of 0.28 mm: 4/3*pi*0.014^3'; 
data.Wwp = 2.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'LuoKong2014';
  comment.Wwp = '';
data.Wwi = 91.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'DengYe1990';
  comment.Wwi = 'von bertalanffy curve';
  
data.Ri  = 1.5e6/365; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'Chen2001','Fan2013'};   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length 
data.tL_f1 = [ ... % time since birth (day), total length (cm)
50	60	70	80	90	100	110	120	130	140	150	160	170	180	190	200
8.6	9.2	11.0	12.8	13.3	15.0	15.9	16.5	17.7	17.0	17.5	18.8	18.7	18.1	19.6	19.1
]';
units.tL_f1   = {'d', 'cm'};  label.tL_f1 = {'time since birth', 'total length', 'female'};  
temp.tL_f1    = C2K(25);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'DengYe1990';
comment.tL_f1 = 'data for females from Bohai Sea';
%
data.tL_m1 = [ ... % time since birth (day), total length (cm)
50	60	70	80	90	100	110	120	130	140	150	160	170	180	190	200
8.3	9.2	10.3	11.6	11.6	12.9	13.5	13.8	14.8	14.1	14.4	15.5	15.3	14.8	16.0	15.5
]';
units.tL_m1   = {'d', 'cm'};  label.tL_m1 = {'time since birth', 'total length', 'male'};  
temp.tL_m1    = C2K(25);  units.temp.tL_m1 = 'K'; label.temp.tL_m1 = 'temperature';
bibkey.tL_m1 = 'DengYe1990';
comment.tL_m1 = 'data for males from Bohai Sea';

data.tL_f2 = [ ... % time since birth (day), total length (cm)
70	80	90	100	110	120	130	140	150	160	170	67	74	75	83	88	96	97	106	107	102	114	113	125	121	134	131	135	136
11.37	12.03	13.4	14.91	15.62	16.48	17	17.51	18.45	19.59	19.5	11.1	12.2	12.0	13.4	14.0	15.1	14.8	15.9	15.7	14.8	16.3	15.8	17.1	16.1	17.5	16.7	17.0	16.6
]';
[~, in] = sort(data.tL_f2(:,1)); data.tL_f2 = data.tL_f2(in,:);
units.tL_f2   = {'d', 'cm'};  label.tL_f2 = {'time since birth', 'total length', 'female'};  
temp.tL_f2   = C2K(26);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'ChenLiu1990';
comment.tL_f2 = 'data for females from Yellow Sea; this data is a mixture of three cohorts collected in 1971, 1984 & 1985';
% 
data.tL_m2 = [ ... % time since birth (day), total length (cm)
70	80	90	100	110	120	130	140	150	160	170	67	74	75	83	88	96	97	106	107	102	114	113	125	121	134	131	135	136
9.95	10.7	11	12.1	13.26	14.65	14.75	14.95	15.8	15.6	15.9	9.3	10.2	10.1	11.2	11.7	12.6	12.3	13.3	13.1	12.4	13.6	13.2	14.2	13.5	14.6	14.0	14.2	13.9
]';
[~, in] = sort(data.tL_m2(:,1)); data.tL_m2 = data.tL_m2(in,:);
units.tL_m2   = {'d', 'cm'};  label.tL_m2 = {'time since birth', 'total length', 'male'};  
temp.tL_m2    = C2K(26);  units.temp.tL_m2 = 'K'; label.temp.tL_m2 = 'temperature';
bibkey.tL_m2 = 'ChenLiu1990';
comment.tL_m2 = 'data for males from Yellow Sea; this data is a mixture of three cohorts collected in 1971, 1984 & 1985';

data.tL_f3 = [ ... % time since birth (day), total length (cm)
30	37	47	57	69	74	88	103	121	170
5.75	6.82	8.98	9.63	11.81	12.23	13.75	14.59	16.15	18.41]';
units.tL_f3   = {'d', 'cm'};  label.tL_f3 = {'time since birth', 'total length', 'female'};  
temp.tL_f3    = C2K(27);  units.temp.tL_f3 = 'K'; label.temp.tL_f3 = 'temperature';
bibkey.tL_f3 = 'Zhang2001';
comment.tL_f3 = 'data for females from East China Sea';
%
data.tL_m3 = [ ... % time since birth (day), total length (cm)
30	37	47	57	69	74	88	103	121	170
5.81	6.78	7.76	9.37	10.02	11.01	11.7	13.22	14.11	15.91]';
units.tL_m3   = {'d', 'cm'};  label.tL_m3 = {'time since birth', 'total length', 'male'};  
temp.tL_m3    = C2K(27);  units.temp.tL_m3 = 'K'; label.temp.tL_m3 = 'temperature';
bibkey.tL_m3 = 'Zhang2001';
comment.tL_m3 = 'data for males from East China Sea';

% time - weight
data.tW_f1 = [ ... % time since birth (day), weight (g)
50	60	70	80	90	100	110	120	130	140	150	160	170	180	190	200
4.5	9.2	15.4	23.1	28.8	37.6	44.6	50.4	58.3	59.2	63.8	71.5	73.2	72.7	80.5	79.8
]';
units.tW_f1   = {'d', 'g'};  label.tW_f1 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f1    = C2K(25);  units.temp.tW_f1 = 'K'; label.temp.tW_f1 = 'temperature';
bibkey.tW_f1 = 'DengYe1990';
comment.tW_f1 = 'data for females from Bohai Sea';
%
data.tW_m1 = [ ... % time since birth (day), weight (g)
50	60	70	80	90	100	110	120	130	140	150	160	170	180	190	200
3.4	5.6	8.5	12.1	14.6	18.8	22.1	24.8	28.7	29.2	31.6	35.6	36.6	36.5	40.7	40.5
]';
units.tW_m1   = {'d', 'g'};  label.tW_m1 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m1    = C2K(25);  units.temp.tW_m1 = 'K'; label.temp.tW_m1 = 'temperature';
bibkey.tW_m1 = 'DengYe1990';
comment.tW_m1 = 'data for males from Bohai Sea';

data.tW_f2 = [ ... % time since birth (day), weight (g)
70	80	90	100	110	120	130	140	150	160	170	67	74	75	83	88	96	97	106	107	102	114	113	125	121	134	131	135	136
12.4	17.7	23.2	28.5	37.8	48.3	55.4	60.7	62	66	67.5	9.0	12.3	14.7	19.2	23.1	27.9	30.4	36.0	38.5	39.0	45.7	47.0	53.4	53.0	59.8	59.5	62.5	63.1
]';
[~, in] = sort(data.tW_f2(:,1)); data.tW_f2 = data.tW_f2(in,:);
units.tW_f2   = {'d', 'g'};  label.tW_f2 = {'time since birth', 'wet weight', 'female'};  
temp.tW_f2    = C2K(26);  units.temp.tW_f2 = 'K'; label.temp.tW_f2 = 'temperature';
bibkey.tW_f2 = 'ChenLiu1990';
comment.tW_f2 = 'data for females from Yellow Sea; this data is a mixture of three cohorts collected in 1971, 1984 & 1985';
%
data.tW_m2 = [ ... % time since birth (day), weight (g)
70	80	90	100	110	120	130	140	150	160	170	67	74	75	83	88	96	97	106	107	102	114	113	125	121	134	131	135	136
9.6	13.3	15	21.7	28.5	32.6	35.3	36.5	42.7	40.6	43.7	7.5	9.6	10.8	13.5	15.7	18.5	19.6	22.8	24.0	24.0	27.8	28.4	32.0	31.6	35.4	35.1	36.7	36.9
]';
[~, in] = sort(data.tW_m2(:,1)); data.tW_m2 = data.tW_m2(in,:);
units.tW_m2   = {'d', 'g'};  label.tW_m2 = {'time since birth', 'wet weight', 'male'};  
temp.tW_m2    = C2K(26);  units.temp.tW_m2 = 'K'; label.temp.tW_m2 = 'temperature';
bibkey.tW_m2 = 'ChenLiu1990';
comment.tW_m2 = 'data for males from Yellow Sea; this data is a mixture of three cohorts collected in 1971, 1984 & 1985';

data.tW_f3 = [ ... % time (day), wet weight (g)
30	37	47	57	69	74	88	103	121	170
2.3	3.7	8.5	10.6	19	20.3	29.8	35.6	48.2	70.8]';
units.tW_f3   = {'d', 'g'};  label.tW_f3 = {'time', 'wet weight', 'female'};  
temp.tW_f3    = C2K(27);  units.temp.tW_f3 = 'K'; label.temp.tW_f3 = 'temperature';
bibkey.tW_f3 = 'Zhang2001';
comment.tW_f3 = 'data for females from East China Sea';
%
data.tW_m3 = [ ... % time (day), wet weight (g)
30	37	47	57	69	74	88	103	121	170
2.3	3.7	5.4	9.5	11.5	15.3	18.3	26.3	31.9	45.6]';
units.tW_m3   = {'d', 'g'};  label.tW_m3 = {'time', 'wet weight', 'male'};  
temp.tW_m3    = C2K(27);  units.temp.tW_m3 = 'K'; label.temp.tW_m3 = 'temperature';
bibkey.tW_m3 = 'Zhang2001';
comment.tW_m3 = 'data for mlaes from East China Sea';

% length - weight
data.LW = [ ... % length (cm), wet weight (g)
0.7	1.7	2.3	3.28	4.43	5.24	6.2	6.93	8.12	9.02	9.7	10.73	11.38	12.87	13	13.82	14.63	15.23	16.01	16.65	17.24	17.74	18.22	18.77	19.19	5	5.5	6.3	7.94	8.94	10	11.06	12.41	13.39	14.1	14.96	15.5	16.11	6.53	7.68	9.95	10.7	11	12.1	13.26	14.65	14.75	14.95	15.8	15.6	15.9	5.75	6.82	8.98	9.63	11.81	12.23	13.75	14.59	16.15	18.41;
0.004	0.04	0.14	0.43	0.94	1.59	3.09	3.93	6.84	8.8	11.6	14.3	16.5	21.8	24.9	30.6	32.2	40	44	48.1	60.2	64.6	65.6	72	72.9	1.67	2.2	3.07	6	9	11.7	14.3	22	27.6	30.4	34	37.2	43	2.6	3.8	9.6	13.3	15	21.7	28.5	32.6	35.3	36.5	42.7	40.6	43.7	2.3	3.7	8.5	10.6	19	20.3	29.8	35.6	48.2	70.8]';
units.LW   = {'cm', 'g'};  label.LW = {'length', 'wet weight'};  
bibkey.LW = {'DengYe1990','ChenLiu1990','Zhang2001'};

% weight - fecundity
data.WN = [ ... % wet weight (g), annual fecundity)
51	50.5	55	55	58	59.5	60	64	65	65	62.5	65	65	65	69	70	70.5	70	71	70	70	69	70	75	75	73	75	76	75	77	75	74	75	75	75	80	80	81	79	80	82	80	83	80	78	80	77	79	80	85	85	83	85	87	85	86	85	84	85	85	86	85	85	85.5	85	84.5	90	91	90	89	90	87	90	92	90	90	100	100	105	105	110;
5	5.5	5.5	5.8	5.6	5.7	6	5.4	5.8	5.9	6.8	7	7.2	7.7	7.2	5.5	6.1	6.2	6.9	7	7.2	8	8.2	5.5	6.1	6.2	6.5	6.8	6.9	7.5	8.1	8.2	9	9.2	9.3	5.9	6	6.8	6.9	8	8.2	8.3	8.2	8.3	8.4	9	9.2	9.5	9.3	6.6	6.7	7	7.1	8	8.2	8.5	8.8	8.7	8.6	9	9.7	10	9.6	9.9	10.2	10.3	7	7.5	8.1	8.5	9	9.1	9.8	9.9	10	10.1	9.5	9.6	10.3	8.5	11.1]';
data.WN(:,2) = 1e5 * data.WN(:,2); % convert x1e5 eggs to eggs
units.WN = {'g', '#'}; label.WN = {'wet weight', 'fecundity'};  
temp.WN = C2K(8.5);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'DengYe1990'; 

% temperature - respiration rate
data.TJO = [ ...	temperature  mg O2/d.g wet W
20	9.89
20	7.25
20	5.59
25	15.50
25	11.64
25	8.40
30	22.58
30	17.14
30	12.96];
units.TJO  = {'C', 'mg O2/d.g Ww'};  label.TJO = {'temperature', 'wet-mass spec O_2 consumption'};  
bibkey.TJO = 'ZhangDong1998';
comment.TJO = 'range of wet mass of individual used: 0.2-17.3g';

% temperature - excretion rate
data.TJN = [ ...	temperature	 mg NH4/d/g wet W
20	0.57
20	0.36
20	0.22
25	0.80
25	0.57
25	0.31
30	1.14
30	0.83
30	0.47];
units.TJN  = {'C', 'mg NH4/d.g Ww'};  label.TJN = {'temperature', 'wet-mass spec NH_4 production'};  
bibkey.TJN = 'ZhangDong1998';
comment.TJN = 'range of wet mass of individual used: 0.1-17.3g';

% length - respiration 
data.LJC20 = [ ... % body length, specific CO2 production (g C/d/g wet weight)
2.7     0.00289
6.9     0.00211
11.6	0.00163];
units.LJC20   = {'cm', 'g C/d/g wet weight'};  label.LJC20 = {'body length', 'specific CO_2 production rate'};  
temp.LJC20   = C2K(20);  units.temp.LJC20 = 'K'; label.temp.LJC20 = 'temperature';
bibkey.LJC20 = 'ZhangDong1998';
%
data.LJC25 = [ ... % body length (d), specific CO2 production (g C/d/g wet weight)
2.8     0.00452
6.7     0.00340
11.5	0.00245];
units.LJC25   = {'cm', 'g C/d/g wet weight'};  label.LJC25 = {'body length', 'specific CO_2 production rate'};  
temp.LJC25   = C2K(25);  units.temp.LJC25 = 'K'; label.temp.LJC25 = 'temperature';
bibkey.LJC25 = 'ZhangDong1998';
%
data.LJC30 = [ ... % body length (d), specific CO2 production (g C/d/g wet weight)
2.8     0.00659
6.7     0.00500
11.7	0.00378];
units.LJC30   = {'cm', 'g C/d/g wet weight'};  label.LJC30 = {'body length', 'specific CO_2 production rate'};  
temp.LJC30   = C2K(30);  units.temp.LJC30 = 'K'; label.temp.LJC30 = 'temperature';
bibkey.LJC30 = 'ZhangDong1998';

%%%%% above respiration data at 20,25 & 30oC with length and weight information as following:
% Ww(g)   (ToC) L(cm) (gC/g/Ww/day)
% 0.2     20	2.7     0.00289
% 3.3     20	6.9     0.00211
% 17.1    20	11.6	0.00163
% 0.2     25	2.8     0.00452
% 3.1     25	6.7     0.00340
% 16.7    25	11.5	0.00245
% 0.2     30	2.8     0.00659
% 3.1     30	6.7     0.00500
% 17.3	  30	11.7	0.00378

% weight - feeding rate 
data.WwJX_T23 = [... % Wet weight (g), feed intake (g/d.g wet weight)
3.46	0.08
4.12	0.087
6.14	0.08
8.75	0.076
12      0.06];
units.WwJX_T23   = {'g', 'g/d.g Ww'}; label.WwJX_T23 = {'wet weight', 'specific food intake'};  
temp.WwJX_T23    = C2K(23); units.temp.WwJX_T23 = 'K'; label.temp.WwJX_T23 = 'temperature';
bibkey.WwJX_T23  = 'QiaoShen1992';
%
data.WwJX_T26 = [... % Wet weight (g), feed intake (g/d.g wet weight)
3.46	0.124
4.12	0.138
6.14	0.106
8.75	0.1
12      0.074];
units.WwJX_T26   = {'g', 'g/d.g Ww'};  label.WwJX_T26 = {'wet weight','specific food intake'};  
temp.WwJX_T26    = C2K(26); units.temp.WwJX_T26 = 'K'; label.temp.WwJX_T26 = 'temperature';
bibkey.WwJX_T26  = 'QiaoShen1992';
%
data.WwJX_T30 = [... % Wet weight (g), feed intake (g/d.g wet weight)
3.46	0.156
4.12	0.154
6.14	0.139
8.75	0.125
12      0.1];
units.WwJX_T30   = {'g', 'g/d.g Ww'};  label.WwJX_T30 = {'wet weight', 'specific food intake'};  
temp.WwJX_T30    = C2K(30); units.temp.WwJX_T30 = 'K'; label.temp.WwJX_T30 = 'temperature';
bibkey.WwJX_T30  = 'QiaoShen1992';

data.WwJX_T  = [... % Wet weight (g), feed intake (g/d) per individual
1.19	0.28
1.62	0.33
2.77	0.45
4.36	0.59
6.47	0.73
9.15	0.89
12.48	1.07
16.53	1.25
21.32	1.44
27.01	1.66];
units.WwJX_T   = {'g', 'g/d'};  label.WwJX_T = {'wet weight', 'food intake'};  
temp.WwJX_T    = C2K(26); units.temp.WwJX_T = 'K'; label.temp.WwJX_T = 'temperature';
bibkey.WwJX_T  = 'ZhangLin1983';

%% set weights for all real data
weights = setweights(data, []);

weights.Li = 3 * weights.Li;
weights.Ri = 5 * weights.Ri;

weights.WN = 3 * weights.WN;

weights.tL_f3 = 2 * weights.tL_f3;
weights.tW_f3 = 2 * weights.tW_f3;
weights.tL_m3 = 2 * weights.tL_m3;
weights.tW_m3 = 2 * weights.tW_m3;

weights.tL_f1 = 2 * weights.tL_f1;
weights.tW_f1 = 2 * weights.tW_f1;
weights.tL_m1 = 2 * weights.tL_m1;
weights.tW_m1 = 2 * weights.tW_m1;

weights.tL_f2 = 2 * weights.tL_f2;
weights.tW_f2 = 2 * weights.tW_f2;
weights.tL_m2 = 2 * weights.tL_m2;
weights.tW_m2 = 2 * weights.tW_m2;

weights.TJO = 2 * weights.TJO;
weights.TJN = 2 * weights.TJN;

weights.LJC20 = 2 * weights.LJC20;
weights.LJC25 = 2 * weights.LJC25;
weights.LJC30 = 2 * weights.LJC30;

weights.WwJX_T23 = 3 * weights.WwJX_T23;
weights.WwJX_T26 = 3 * weights.WwJX_T26;
weights.WwJX_T30 = 3 * weights.WwJX_T30;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 2 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f1','tL_m1'}; subtitle1 = {'Length for females, males in Bohai Sea'};
set2 = {'tL_f2','tL_m2'}; subtitle2 = {'Length for females, males in Yellow Sea'};
set3 = {'tL_f3','tL_m3'}; subtitle3 = {'Length for females, males in East China Sea'};
set4 = {'tW_f1','tW_m1'}; subtitle4 = {'Wet Weight for females, males in Bohai Sea'};
set5 = {'tW_f2','tW_m2'}; subtitle5 = {'Wet Weight for females, males in Yellow Sea'};
set6 = {'tW_f3','tW_m3'}; subtitle6 = {'Wet Weight for females, males in East China Sea'};
set7 = {'LJC20','LJC25','LJC30'}; subtitle7 = {'Respiration rates at 20, 25 & 30 C'};
set8 = {'WwJX_T23','WwJX_T26','WwJX_T30'}; subtitle8 = {'Spec feeding rates at 23, 26 & 30 C'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7,set8};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7,subtitle8};

%% Discussion points 
D1 = 'The 3rd set of growth data was a mixture of three cohorts collected in Yellow Sea in 1971, 1984 & 1985, so less weigh is given';
D2 = 'There is a large range of oxygen consumption and ammonia excretion, so less weight is given';
D3 = 'There is a large variation of feeding rates at 23, 26 & 30oC, so less weight is given';
D4 = 'Males are assumed to differ from females by {p_Am} only';
D5 = 'The estimated sclaed function responses vary slighty in accordance to mean temperature, where the Bohai Sea is coolest, so the algae are probably richer in carbohydrates';
D6 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Facts

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '551578'; % ITIS
metaData.links.id_EoL = '344332'; % Ency of Life
metaData.links.id_Wiki = 'Fenneropenaeus_chinensis'; % Wikipedia
metaData.links.id_ADW = 'Fenneropenaeus_chinensis'; % ADW
metaData.links.id_Taxo = '382573'; % Taxonomicon
metaData.links.id_WoRMS = '762806'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chinese_white_shrimp}}';
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
bibkey = 'LiXiang2002'; type = 'Article'; bib = [ ... 
'author = {Li, F. and Xiang, J.}, ' ... 
'year = {2002}, ' ...
'title = {Study on early sex differentiation of \emph{Penaeus chinesis}}, ' ...
'journal = {Sudia Marina Sinica}, ' ...
'volume = {44}, ' ...
'pages = {101--105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DengYe1990'; type = 'Book'; bib = [ ... 
'author = {Deng, J.Y. and Ye, C.C. and Liu, Y.C.}, ' ...
'year = {1990}, ' ...
'title  = {\emph{Penaensis chinensis} in the Bohai and Yellow Sea-C its biology and management}, ' ...
'publisher = {Ocean Press, Beijing}, ' ...
'pages = {283p}, ' ...
'howpublished = {\url{-}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fan2013'; type = 'Article'; bib = [ ... 
'author = {Fan, G.}, ' ... 
'year = {2013}, ' ...
'title = {ecundity and hatchery technique of \emph{Penaensis chinensis}}, ' ...
'journal = {Sciences of Modern Agriculture}, ' ...
'volume = {7}, ' ...
'pages = {287--288}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chen2001'; type = 'Book'; bib = [ ... 
'author = {Chen, L.}, ' ...
'year = {2001}, ' ...
'title  = {Effects of different salinity and pH on juvenile \emph{Penaeus chinensis}}, ' ...
'publisher = {Henei University}, ' ...
'pages = {31p}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LuoKong2014'; type = 'Article'; bib = [ ... 
'author = {Luo, K. and Kong, J. and Luan, S. and Wang, Q. and Cao, B. and Liu, N. }, ' ... 
'year = {2014}, ' ...
'title = {Comparison of growth and survival between selected population and inbreeding population at different growing stage in \emph{Fenneropenaeus chinensis}}, ' ...
'journal = {Periodical of Ocean University of China}, ' ...
'volume = {7}, ' ...
'pages = {51--57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zhang2001'; type = 'Article'; bib = [ ... 
'author = {Zhang, C.}, ' ... 
'year = {2001}, ' ...
'title = {Growth characteristics of releasing \emph{Penaeus orientalis} in the Mindong waters}, ' ...
'journal = {ournal of Fisheries of China}, ' ...
'volume = {25(2)}, ' ...
'pages = {116--119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChenLiu1990'; type = 'Article'; bib = [ ... 
'author = {Chen, Z. and Liu, Y. and Qiu, S. and Gao, Y. and Zhang, Y.}, ' ... 
'year = {2002}, ' ...
'title = {Growth and stock enhancement of released \emph{Penaeus chinesis} in the coastal waters of Yellow Sea}, ' ...
'journal = {Acta Oceanologica Sinica}, ' ...
'volume = {12(6)}, ' ...
'pages = {758--764}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhangDong1998'; type = 'Article'; bib = [ ... 
'author = {Zhang, S. and Dong, S. and Wang, F.}, ' ... 
'year = {2002}, ' ...
'title = {Studies on the bioenergetics of \emph{Penaeus chinesis} I. oxygen consumption and ammonia-N excretion rates under different conditions}, ' ...
'journal = {Journal of Ocean University of Qingdao}, ' ...
'volume = {28(2)}, ' ...
'pages = {223--227}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'QiaoShen1992'; type = 'Article'; bib = [ ... 
'author = {Qiao, Z. and Shen, X. and Zhang, G.}, ' ... 
'year = {1992}, ' ...
'title = {Effects of feed, water temperature, feeding dose on eating and growth of \emph{Penaeus chinesis}}, ' ...
'journal = {Marine Sciences}, ' ...
'volume = {2}, ' ...
'pages = {36--40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhangLin1983'; type = 'Article'; bib = [ ... 
'author = {Zhang, N. and Lin, R. and Cao, D. and Zhang, W. and Gao, H. and Liang, X.}, ' ... 
'year = {2016}, ' ...
'title = {Preliminary observation on relationship of body weight, length with the daily food requirement of Chinese shrimp \emph{Penaeus orientalis} Kishinouye}, ' ...
'journal = {Oceanologia et Liminologia Sinica}, ' ...
'volume = {14(5)}, ' ...
'pages = {482--487}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
