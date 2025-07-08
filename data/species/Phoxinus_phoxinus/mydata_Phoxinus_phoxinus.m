function [data, auxData, metaData, txtData, weights] = mydata_Phoxinus_phoxinus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Phoxinus_phoxinus'; 
metaData.species_en = 'European minnow'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'aj'; 'ap'; 'am'; 'L0'; 'Lb'; 'Lp'; 'Li'; 'JO_W'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'; 'L-N'; 'Ww-JO'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 02 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'};

metaData.author_mod_1   = {'Roland Kuhl'; 'Benoit Goussen'};        
metaData.date_mod_1     = [2018 12 28];                           
metaData.email_mod_1    = {'benoit.goussen@ibacon.com'};                 
metaData.address_mod_1  = {'ibacon GmbH'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 18]; 

%% set data
% zero-variate data

data.ah_T1 = 5;         units.ah_T1 = 'd';  label.ah_T1 = 'age at hatch at 18 C';     bibkey.ah_T1 = 'KottFrey2007';  
    temp.ah_T1 = C2K(18); units.temp.ah_T1 = 'K'; label.temp.ah_T1 = 'temperature';
data.ah_T2 = 9.9;         units.ah_T2 = 'd';  label.ah_T2 = 'age at hatch at 12.5 C'; bibkey.ah_T2 = 'SchoSchw2000';  
    temp.ah_T2 = C2K(12.5); units.temp.ah_T2 = 'K'; label.temp.ah_T2 = 'temperature';
data.ah_T3 = 5.9;         units.ah_T3 = 'd';  label.ah_T3 = 'age at hatch at 15 C';   bibkey.ah_T3 = 'SchoSchw2000';  
    temp.ah_T3 = C2K(15); units.temp.ah_T3 = 'K'; label.temp.ah_T3 = 'temperature';
data.ah_T4 = 6;         units.ah_T4 = 'd';  label.ah_T4 = 'age at hatch at 17.5 C';   bibkey.ah_T4 = 'SchoSchw2000';  
    temp.ah_T4 = C2K(17.5); units.temp.ah_T4 = 'K'; label.temp.ah_T4 = 'temperature';
data.ah_T5 = 3.9;         units.ah_T5 = 'd';  label.ah_T5 = 'age at hatch at 20 C';   bibkey.ah_T5 = 'SchoSchw2000';  
    temp.ah_T5 = C2K(20); units.temp.ah_T5 = 'K'; label.temp.ah_T5 = 'temperature';
data.ah_T6 = 2.5;         units.ah_T6 = 'd';  label.ah_T6 = 'age at hatch at 25 C';   bibkey.ah_T6 = 'SchoSchw2000';  
    temp.ah_T6 = C2K(25); units.temp.ah_T6 = 'K'; label.temp.ah_T6 = 'temperature';
data.tj = 14;         units.tj = 'd';  label.tj = 'time since hatch at metamorphosis'; bibkey.tj = 'Frost1943'; 
    temp.tj = C2K(10.25); units.temp.tj = 'K'; label.temp.tj = 'temperature';
    comment.tj = 'Metamorphosis when yolk sac disappeared (13-14 day post hatch); Mean temperature 1933-1975 in lake Windermere (Kipling1977)';
data.tp = 137;         units.tp = 'd';  label.tp = 'time since hatch at puberty';          bibkey.tp = 'Bengtsson1974';  
    temp.tp = C2K(11.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
    comment.tp = 'time since hatch at first spawning';
data.am= 13*365;       units.am = 'd';     label.am = 'lifespan';  bibkey.am = 'MuseBorg2002';
    temp.am = C2K(3.79);   units.temp.am = 'K'; label.temp.am = 'temperature';
    comment.am = 'Mean surface temperature observed in River Hinogla, the outlet of Lake Ovre Heimdalsvatn (study from Museth 2002 DOI  10.1007/s10750-010-0158-2). 6 Data points extracted by month. If possible evently spaced in time.'; 

data.Lo = 0.016;  units.Lo = 'cm'; label.Lo = 'egg diameter'; bibkey.Lo = 'Frost1943';   
    temp.Lo = C2K(10.25); units.temp.Lo = 'K'; label.temp.Lo = 'temperature';
    comment.Lo = 'Mean temperature 1933-1975 in lake Windermere (Kipling1977)';
data.Lb = 0.5;         units.Lb = 'cm';  label.Lb = 'fork length at hatch';          bibkey.Lb = 'Frost1943'; 
    temp.Lb = C2K(10.25); units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
    comment.Lb = 'Mean temperature 1933-1975 in lake Windermere (Kipling1977)';
data.Lj = 0.8;         units.Lj = 'cm';  label.Lj = 'fork length at metamorphosis';  bibkey.Lj = 'Frost1943'; 
    temp.Lj = C2K(10.25); units.temp.Lj = 'K'; label.temp.Lj = 'temperature';
    comment.Lj = 'Metamorphosis when yolk sac disappeared (13-14 day post hatch); Mean temperature 1933-1975 in lake Windermere (Kipling1977)';
data.Lp = 5;        units.Lp = 'cm';  label.Lp = 'Fork length at puberty';        bibkey.Lp = 'Mills1987'; %Reproductive size   #According to Frost1943 maturaty at about 42mm
data.Li = 14;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'MuusDahl1968';
data.JOw = 0.22;         units.JOw = 'ml O2*h-1*g-1';  label.JOw = 'oxygen consumption per gram'; bibkey.JOw = 'PlatSarb2013'; 
    L0.JOw = 8.36;       units.L0.JOw = 'cm';  label.L0.JOw = 'Standard length at oxygen measurement';      
    W0.JOw = 8.48;       units.W0.JOw = 'g';  label.W0.JOw = 'Wet weight at oxygen measurement';         
    temp.JOw = C2K(15); units.temp.JOw = 'K'; label.temp.JOw = 'temperature';
data.LsWw = 5.38;      units.LsWw  = 'g';  label.LsWw = 'wet weight';  bibkey.LsWw = 'Puig1999';
    L0.LsWw = 6.481;       units.L0.LsWw = 'cm';  label.L0.LsWw = 'Standard length at wet weight measurement';      
    comment.LsWw = 'Mean measurement of 34 fresh P. phoxinus (4.8-8.6 cm SL) from Sec Lake (Spain)';
data.LtWw = 5.38;      units.LtWw  = 'g';  label.LtWw = 'wet weight';  bibkey.LtWw = 'Puig1999';
    L0.LtWw = 7.774;       units.L0.LtWw = 'cm';  label.L0.LtWw = 'Total length at wet weight measurement';   
    comment.LtWw = 'Mean measurement of 34 fresh P. phoxinus (4.8-8.6 cm SL) from Sec Lake (Spain)';

data.Ww0 = 3.34e-3;         units.Ww0 = 'g';  label.Ww0 = 'egg wet weight';          bibkey.Ww0 = 'SchoSchw2000'; % Wet weight of the egg at day 0
    temp.Ww0 = C2K(15); units.temp.Ww0 = 'K'; label.temp.Ww0 = 'temperature';
data.Wwb = 1.81e-3;         units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'SchoSchw2000'; 
data.Wwi = 29;         units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'Guess'; 
    comment.Wwi = 'extrapolated from length weight data from StalKest1991';

data.Ri = 1000/365;      units.Ri  = '#/d';  label.Ri = 'max reproduction';  bibkey.Ri= 'cabi';
     temp.Ri = C2K(3.79); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'Mean surface temperature observed in River Hinogla, the outlet of Lake Ovre Heimdalsvatn (study from Museth 2002 DOI  10.1007/s10750-010-0158-2). 6 Data points extracted by month. If possible evently spaced in time.'; 
   
%% uni-variate data

% Frost1943
data.tLf1 = [... % time since hatching (d), fork length (cm)
0 0.45
2 0.62
10 0.7
42 0.95
70 1.15
];
units.tLf1  = {'d', 'cm'};  label.tLf1 = {'time since hatching', 'fork length'};  
temp.tLf1   = C2K(10.25);  units.temp.tLf1 = 'K'; label.temp.tLf1 = 'temperature'; 
% L0.tLf1 = 0.45; units.L0.tLf1  = {'cm'};  label.L0.tLf1 = 'initial fork length'; 
comment.tLf1 = 'Mean temperature 1933-1975 in lake Windermere (Kipling1977)';
bibkey.tLf1 = 'Frost1943';

data.tLf2 = [... % time since hatching (y), fork length (cm)
1 3.34
2 5.62
3 6.96
];
data.tLf2(:,1) = data.tLf2(:,1) * 365; % transform in days
units.tLf2  = {'d', 'cm'};  label.tLf2 = {'time since hatching', 'fork length'};  
temp.tLf2   = C2K(10.25);  units.temp.tLf2 = 'K'; label.temp.tLf2 = 'temperature'; 
% L0.tLf2 = 3.34; units.L0.tLf2  = {'cm'};  label.L0.tLf2 = 'initial fork length'; 
comment.tLf2 = 'Age determination based on otoliths, scales, and length-frequency distribution; Mean temperature 1933-1975 in lake Windermere (Kipling1977)';
bibkey.tLf2 = 'Frost1943';

data.LfWw1 = [... % fork length (cm), wet weight with gonad full (g)
2.3	0.17
2.8	0.27
3.3	0.41
3.8	0.68
4.3	1.16
4.8	1.64
5.3	2.42
5.8	2.81
6.3	4.07
6.8	4.95
7.3	6.02
];
units.LfWw1  = {'cm', 'g'};  label.LfWw1 = {'fork length', 'wet weight'};  
temp.LfWw1   = C2K(10.25);  units.temp.LfWw1 = 'K'; label.temp.LfWw1 = 'temperature'; 
comment.LfWw1 = 'Wet weight measured during reproduction period (April - May) with gonad full';
bibkey.LfWw1 = 'Frost1943';
comment.LfWw1 = 'Data for full gonads; Mean temperature 1933-1975 in lake Windermere (Kipling1977)';

data.LfWw2 = [... % fork length (cm), wet weight with gonad empty (g)
2.8	0.24
3.3	0.37
3.8	0.7
4.3	0.95
4.8	1.39
5.3	1.73
5.8	2.3
6.3	2.96
6.8	3.5
];
units.LfWw2  = {'cm', 'g'};  label.LfWw2 = {'fork length', 'wet weight'};  
temp.LfWw2   = C2K(10.25);  units.temp.LfWw2 = 'K'; label.temp.LfWw2 = 'temperature'; 
comment.LfWw2 = 'Wet weight measured after reproduction period (August - September) with gonad empty';
bibkey.LfWw2 = 'Frost1943';
comment.LfWw1 = 'Data for empty gonads; Mean temperature 1933-1975 in lake Windermere (Kipling1977)';


%% Killen 2014
data.tWw1 = [... % time since start of experiment (d), wet weight (g)
0	1.28
21	1.4
42	1.56
95	1.66
];
units.tWw1  = {'d', 'g'};  label.tWw1 = {'time since start of experiment', 'wet weight'};  
temp.tWw1   = C2K(10);  units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
W0.tWw1 = 1.28; units.W0.tWw1  = {'g'};  label.W0.tWw1 = 'initial wet weight';
bibkey.tWw1 = 'Kill2014';

data.tLs1 = [... % time since start of experiment (d), standard length (cm)
0	4.497
21	4.685
42	4.738
95	4.889
];
units.tLs1  = {'d', 'cm'};  label.tLs1 = {'time since start of experiment', 'standard length'};  
temp.tLs1   = C2K(10);  units.temp.tLs1 = 'K'; label.temp.tLs1 = 'temperature';
L0.tLs1 = 4.497; units.L0.tLs1  = {'cm'};  label.L0.tLs1 = 'initial standard length'; 
bibkey.tLs1 = 'Kill2014';


%% Heese 1984
data.tWw2 = [... % age (y), wet weight (g)
1	0.39
2	1.09
3	2.57
4	3.73
5	5.31
6	6.38
];
data.tWw2(:,1) = data.tWw2(:,1) * 365; % transform in days
units.tWw2  = {'d', 'g'};  label.tWw2 = {'age', 'wet weight'};  
temp.tWw2   = C2K(8);  units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature';  
W0.tWw2 = 0.39; units.W0.tWw2  = {'g'};  label.W0.tWw2 = 'initial wet weight'; 
bibkey.tWw2 = 'Hees1984';
comment.tWw2 = 'Mean annual temperature of Vistula-River, of which the Skawa river is a tributary https://www.britannica.com/place/Vistula-River#ref34488'; 

data.tLs2 = [... % age (y), body length (cm)
1	2.83
2	4.04
3	5.24
4	5.99
5	6.62
6	7.02
];
data.tLs2(:,1) = data.tLs2(:,1) * 365; % transform in days
units.tLs2  = {'d', 'cm'};  label.tLs2 = {'age', 'standard length'};  % Body length considered to be standard length
temp.tLs2   = C2K(8);  units.temp.tLs2 = 'K'; label.temp.tLs2 = 'temperature';  % Mean annual temperature of Vistula-River, of which the Skawa river is a tributary https://www.britannica.com/place/Vistula-River#ref34488
L0.tLs2 = 2.83; units.L0.tLs2  = {'cm'};  label.L0.tLs2 = 'initial standard length'; 
comment.tLs2 = 'Mean annual temperature of Vistula-River, of which the Skawa river is a tributary https://www.britannica.com/place/Vistula-River#ref34488'; 
bibkey.tLs2 = 'Hees1984';

data.LsWw = [... % standard length (cm), wet weight (g)
3.61	0.62
4.41	1.35
5.5     3.62
5.51	3.7
5.6     3.31
5.64	3.05
5.84	3.81
5.84	4.01
5.86	3.52
5.9     3.74
5.92	3.3
5.92	4.8
5.96	4.8
6.09	4.65
6.09	4.77
6.1     3.74
6.1     4.31
6.11	4.8
6.14	4.06
6.18	3.56
6.28	4.43
6.29	3.79
6.31	4.09
6.35	5.62
6.39	4.7
6.4     4.79
6.4     5.16
6.48	5.48
6.49	4.91
6.55	6.91
6.58	4.89
6.59	5.33
6.59	5.84
6.6     5.42
6.61	4.11
6.65	4.39
6.7     5.19
6.73	5.65
6.75	5.57
6.77	5.68
6.8     6.26
6.81	5.77
6.88	6.05
6.89	5.5
6.91	5.9
6.91	6.39
6.94	5.35
6.99	6.28
6.99	6.34
7.01	6.72
7.03	6.9
7.09	6.64
7.15	6.34
7.17	6.96
7.2     7.16
7.21	7.9
7.25	7.44
7.46	7.12
7.48	8.31
7.49	6.92
7.78	8.76
8       8.9
8.01	10.96
8.19	11.27
];
units.LsWw  = {'cm', 'g'};  label.LsWw = {'standard length', 'wet weight'};  
temp.LsWw   = C2K(8);  units.temp.LsWw = 'K'; label.temp.LsWw = 'temperature'; 
bibkey.LsWw = 'Hees1984';
comment.LsWw = 'Mean annual temperature of Vistula-River, of which the Skawa river is a tributary https://www.britannica.com/place/Vistula-River#ref34488';

%% MillElor1985
data.tLf3 = [... % age (y), fork length (cm)
1	2.79
2	5.09
3	6.04
4	6.67
5	7.8
];
data.tLf3(:,1) = data.tLf3(:,1) * 365; % transform in days
units.tLf3  = {'d', 'cm'};  label.tLf3 = {'age', 'fork length'};  % 
temp.tLf3   = C2K(1);  units.temp.tLf3 = 'K'; label.temp.tLf3 = 'temperature';  % 
L0.tLf3 = 2.79; units.L0.tLf3  = {'cm'};  label.L0.tLf3 = 'initial fork length';
comment.tLf3 = 'Age determination based on otoliths; Mean surface temperature observed between 2003-2007 in Pijnne, Pijtsalo lake, close to the Konnevesi lake  http://wwwi3.ymparisto.fi/i3/tilanne/eng/Temperature/Temperature.htm'; 
bibkey.tLf3 = 'MillElor1985';

data.LN = [... %fork length (cm),	Fecundity (#)
4.8	101
5	108
5.1	118
5.1	102
5.3	83
5.3	134
5.4	120
5.5	127
5.5	175
5.7	212
6.3	146
6.3	208
6.3	248
6.5	318
6.5	305
6.6	273
7	289
7	396
7	417];
units.LN  = {'cm', '#'};  label.LN = {'Fork length', 'Fecundity'}; 
temp.LN   = C2K(1);  units.temp.LN = 'K'; label.temp.LN = 'temperature';  
bibkey.LN = 'MillElor1985';
comment.LN = 'Mean surface temperature observed between 2003-2007 in Pijnne, Pijtsalo lake, close to the Konnevesi lake  http://wwwi3.ymparisto.fi/i3/tilanne/eng/Temperature/Temperature.htm';

%% PlatSarb2013
data.WwJO = [... % log10 body mass (g),	log10 oxygen consumption (ml O2*h-1) in the dark
0.83	0.15
0.84	0.14
0.84001	0.22
0.86	0.2
0.88	0.19
0.88001	0.21
0.89	0.2
0.9     0.25
0.91	0.24
0.91001	0.29
0.92	0.27
0.94	0.26
0.94001	0.31
0.95	0.27
0.96	0.29
0.97	0.32
0.98	0.33
0.99	0.33
1.03	0.38
1.06	0.37];
data.WwJO = 10.^data.WwJO; % Remove log10 transformation
units.WwJO  = {'g', 'ml O2*h-1'};  label.WwJO = {'Wet weight', 'Oxygen consumption'}; 
temp.WwJO   = C2K(15);  units.temp.WwJO = 'K'; label.temp.WwJO = 'temperature';  % 
comment.WwJO = 'Oxygen consumption in the dark';
bibkey.WwJO = 'PlatSarb2013';

%% StalKest1991
data.LtWw = [... % total length (cm), wet weight (g)
0.60	0.0021
0.60	0.0013
0.61	0.0040
0.63	0.0018
0.66	0.0026
0.68	0.0016
0.68	0.0018
0.69	0.0014
0.70	0.0033
0.71	0.0017
0.71	0.0014
0.73	0.0029
0.74	0.0021
0.74	0.0018
0.74	0.0026
0.75	0.0033
0.75	0.0055
0.76	0.0016
0.77	0.0023
0.79	0.0035
0.80	0.0019
0.80	0.0025
0.80	0.0062
0.81	0.0042
0.83	0.0036
0.83	0.0050
0.83	0.0074
0.85	0.0030
0.87	0.0043
0.87	0.0060
0.88	0.0032
0.89	0.0023
0.89	0.0062
0.90	0.0018
0.90	0.0035
0.91	0.0041
0.91	0.0052
0.94	0.0045
0.94	0.0077
0.94	0.0064
0.95	0.0017
0.98	0.0034
0.98	0.0047
0.98	0.0062
1.00	0.0041
1.00	0.0168
1.00	0.0097
1.01	0.0058
1.03	0.0042
1.03	0.0073
1.06	0.0088
1.06	0.0114
1.10	0.0195
1.11	0.0129
1.13	0.0078
1.14	0.0098
1.19	0.0198
1.21	0.0162
1.24	0.0116
1.28	0.0199
1.33	0.0129
1.52	0.0302
2.42	0.1112
2.49	0.1478
2.55	0.1230
2.58	0.1634
2.62	0.1230
2.69	0.1662
2.73	0.1479
2.81	0.1868
3.07	0.3705
3.08	0.3084
3.20	0.3033
3.21	0.3706
3.29	0.3034
3.32	0.3646
3.48	0.3527
3.62	0.3965
3.81	0.3773
4.05	0.5449
4.28	0.7119
4.55	0.6662
4.70	0.9781
4.72	0.6890
4.87	1.0996
4.90	0.9306
5.01	1.0816
5.03	0.9308
5.25	1.8455
5.27	1.4611
5.30	1.1003
5.60	1.3224
5.63	1.6428
5.71	2.0072
6.06	2.2949
6.20	1.7284
6.44	2.9000
6.59	2.2583
6.90	3.4283
];
units.LtWw  = {'cm', 'g'};  label.LtWw = {'total length', 'wet weight'};  
temp.LtWw   = C2K(20);  units.temp.LtWw = 'K'; label.temp.LtWw = 'temperature'; 
bibkey.LtWw = 'StalKest1991';
comment.LtWw = 'Temperature ranges from 17 to 24 C with a mean of 20 C';

%% SchoSchw2000
data.tWw3 = [... % time since spawning (d), wet weight (g)
2	0.00178
3	0.00223
4	0.00274
5	0.00237
6	0.00254
];
data.tWw3(:,1) = data.tWw3(:,1) - 2; % Hatching occurs at day 2 since spawning in this experiment
units.tWw3  = {'d', 'g'};  label.tWw3 = {'time since hatching', 'wet weight'};  
temp.tWw3   = C2K(25);  units.temp.tWw3 = 'K'; label.temp.tWw3 = 'temperature';  
W0.tWw3 = 0.00178; units.W0.tWw3  = {'g'};  label.W0.tWw3 = 'initial wet weight'; 
bibkey.tWw3 = 'SchoSchw2000';
comment.tWw3 = 'Eggs obtained from lab organisms that were kept at 7 C before inducing spawning by increasing the temperature by 2-3 C. Eggs then transferred.'; 

data.tWw4 = [... % time since spawning (d), wet weight (g)
6	0.00184
7	0.00196
8	0.00195
9	0.00223
10	0.00251
11	0.00249
12	0.00284
13	0.00266
];
data.tWw4(:,1) = data.tWw4(:,1) - 6; % Hatching occurs at day 6 since spawning in this experiment
units.tWw4  = {'d', 'g'};  label.tWw4 = {'time since hatching', 'wet weight'};  
temp.tWw4   = C2K(15);  units.temp.tWw4 = 'K'; label.temp.tWw4 = 'temperature';  
W0.tWw4 = 0.00184; units.W0.tWw4  = {'g'};  label.W0.tWw4 = 'initial wet weight'; 
bibkey.tWw4 = 'SchoSchw2000';
comment.tWw4 = 'Eggs obtained from lab organisms that were kept at 7 C before inducing spawning by increasing the temperature by 2-3 C. Eggs then transferred.'; 

%% MuseBorg2002
data.tLt1 = [... % age (y), total length (cm)
3	5
4	6.1
5	6.9
6	7.6
7	8.4
8	8.7
9	9.5
];
data.tLt1(:,1) = data.tLt1(:,1) * 365; % transform in days
units.tLt1  = {'d', 'cm'};  label.tLt1 = {'time since birth', 'total length'};  % 
temp.tLt1   = C2K(3.79);  units.temp.tLt1 = 'K'; label.temp.tLt1 = 'temperature';  % 
% L0.tLt1 = 5; units.L0.tLt1  = {'cm'};  label.L0.tLt1 = 'initial total length';
bibkey.tLt1 = 'MuseBorg2002';
comment.tLt1 = 'Age determination based on otoliths; Mean surface temperature observed in River Hinogla, the outlet of Lake Ovre Heimdalsvatn (study from Museth 2002 DOI  10.1007/s10750-010-0158-2). 6 Data points extracted by month. If possible evently spaced in time.'; 

data.tLt2 = [... % age (y), total length (cm)
3	5
4	6
5	6.7
6	7.4
7	8.1
8	8.6
9	8.8
];
data.tLt2(:,1) = data.tLt2(:,1) * 365; % transform in days
units.tLt2  = {'d', 'cm'};  label.tLt2 = {'time since birth', 'total length'};  % 
temp.tLt2   = C2K(3.79);  units.temp.tLt2 = 'K'; label.temp.tLt2 = 'temperature';  % 
% L0.tLt2 = 5; units.L0.tLt2  = {'cm'};  label.L0.tLt2 = 'initial total length';
bibkey.tLt2 = 'MuseBorg2002';
comment.tLt2 = 'Age determination based on otoliths; Mean surface temperature observed in River Hinogla, the outlet of Lake Ovre Heimdalsvatn (study from Museth 2002 DOI  10.1007/s10750-010-0158-2). 6 Data points extracted by month. If possible evently spaced in time.'; 

data.tLt3 = [... % age (y), total length (cm)
3	5.4
4	6.6
5	7.3
6	7.7
7	8.1
8	8.5
9	8.9
];
data.tLt3(:,1) = data.tLt3(:,1) * 365; % transform in days
units.tLt3  = {'d', 'cm'};  label.tLt3 = {'time since birth', 'total length'};  % 
temp.tLt3   = C2K(3.79);  units.temp.tLt3 = 'K'; label.temp.tLt3 = 'temperature';  % 
% L0.tLt3 = 5.4; units.L0.tLt3  = {'cm'};  label.L0.tLt3 = 'initial total length';
bibkey.tLt3 = 'MuseBorg2002';
comment.tLt3 = 'Age determination based on otoliths; Mean surface temperature observed in River Hinogla, the outlet of Lake Ovre Heimdalsvatn (study from Museth 2002 DOI  10.1007/s10750-010-0158-2). 6 Data points extracted by month. If possible evently spaced in time.'; 

data.tLt4 = [... % age (y), total length (cm)
3	5.6
4	6.3
5	7
6	7.7
7	7.7
8	8.7
9	9
];
data.tLt4(:,1) = data.tLt4(:,1) * 365; % transform in days
units.tLt4  = {'d', 'cm'};  label.tLt4 = {'time since birth', 'total length'};  % 
temp.tLt4   = C2K(3.79);  units.temp.tLt4 = 'K'; label.temp.tLt4 = 'temperature';  % 
L0.tLt4 = 5.6; units.L0.tLt4  = {'cm'};  label.L0.tLt4 = 'initial total length';
bibkey.tLt4 = 'MuseBorg2002';
comment.tLt4 = 'Age determination based on otoliths; Mean surface temperature observed in River Hinogla, the outlet of Lake Ovre Heimdalsvatn (study from Museth 2002 DOI  10.1007/s10750-010-0158-2). 6 Data points extracted by month. If possible evently spaced in time.'; 

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.965	4.398
1.965	4.642
1.965	4.837
1.977	3.545
1.977	5.471
2.000	4.472
2.000	6.862
2.012	4.252
2.982	6.524
2.994	4.451
2.994	4.793
2.994	5.085
2.994	5.378
2.994	5.500
2.994	5.963
2.994	6.378
2.994	7.280
3.006	5.671
3.965	6.723
3.965	7.211
3.977	5.992
3.977	6.089
3.977	6.187
4.971	6.874
4.971	7.142
4.994	7.654
4.994	7.874
5.006	6.313
5.965	7.951
6.971	9.004
6.994	7.150
6.994	7.589
6.994	7.638
7.977	7.910
7.988	9.106
8.000	6.667
8.000	7.154
8.000	8.106
8.971	8.549
8.982	7.841
8.994	7.207
8.994	7.402
8.994	7.500
8.994	7.646
9.977	7.163
9.977	9.114
10.012	6.772];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SolhBorg2010';

%% grouped plots
set1 = {'tLt1', 'tLt2', 'tLt3', 'tLt4'}; subtitle1 = {'MuseBorg2002'; 'total length'};
set2 = {'LfWw1', 'LfWw2'}; subtitle2 = {'Frost1943'; 'wet weight with gonad full, empty'};
set3 = {'tWw3', 'tWw4'}; subtitle3 = {'SchoSchw2000'; 'wet weight at 15 or 25 C'}; % 
% set4 = {'tLf', 'tLm'}; subtitle4 = {'Soho'; 'female, male'}; % univar7
% set5 = {'tWwf', 'tWwm'}; subtitle5 = {'Soho'; 'female, male'}; % univar7
metaData.grp.sets = {set1, set2, set3}; metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.kap = 2 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.L0 = L0;
auxData.W0 = W0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
             
%% Discussion points
D1 = 'mod_1: more data is added with respect to the previous version: fecundity, raw weight-length, additional length-time curves.'; 
D2 = 'mod_1: newly hatch larvae can feed on dead nauplii so we assume hatch and birth are equivalent; we assume 1 year accumulation time in the buffer for datasets Fros1984 and MillElor198'; 
D3 = 'mod_1: Frost1943: we assume that there is no water in the wet weight of the gonad. This is based on the observation that oocytes become hydrated in the last stages of ripening.'; 
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);
metaData.bibkey.D1 = 'KestStal1992'; 

%% Facts
F1 = 'Freshwater; brackish; demersal; potamodromous; temperate; 2 C - 20 C';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GTGC'; % Cat of Life
metaData.links.id_ITIS = '163596'; % ITIS
metaData.links.id_EoL = '46581654'; % Ency of Life
metaData.links.id_Wiki = 'Phoxinus_phoxinus'; % Wikipedia
metaData.links.id_ADW = 'Phoxinus_phoxinus'; % ADW
metaData.links.id_Taxo = '43660'; % Taxonomicon
metaData.links.id_WoRMS = '154326'; % WoRMS
metaData.links.id_fishbase = 'Phoxinus-phoxinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phoxinus_phoxinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'cabi'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.cabi.org/isc/datasheet/69626 }}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bengtsson1974'; type = 'Article'; bib = [ ...  
'author = {Bengtsson, B.-E.}, ' ...
'year = {1974}, ' ...
'title = {The effects of zinc on the mortality and reproduction of the minnow \emph{Phoxinus phoxinus} {L}.}, ' ... 
'journal = {Archives of Environmental Contamination and Toxicology}, '...
'volume = {2}, '...
'number = {4}, '...
'pages = {342--355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'MuusDahl1968'; type = 'Book'; bib = [ ...    
'author = {Muus, B.J. and Dahlstr{\o}m, P.}, ' ...
'year  = {1968}, ' ...
'title = {S\"{u}sswasserfische}, ' ...  
'publisher = {BLV Verlagsgesellschaft}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KottFrey2007'; type = 'Book'; bib = [ ...    
'author = {Kottelat, M. and Freyhof, J.}, ' ...
'year  = {2007}, ' ...
'title = {Handbook of European freshwater fishes}, ' ...  
'publisher = {Publications Kottelat}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'Puig1999'; type = 'Article'; bib = [ ...  
'author = {Puigcerver, M.}, ' ...
'year = {1999}, ' ...
'title = {Variations in length, weight and length-weight relationships in the European minnow \emph{Phoxinus phoxinus} ({L}.) due to fixation and preservation processes}, ' ... 
'journal = {Miscell\`{a}nia Zool\`{o}gica}, '...
'volume = {22.1}, '...
'pages = {21--27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Frost1943'; type = 'Article'; bib = [ ...  
'author = {Frost, W. E.}, ' ...
'year = {1943}, ' ...
'title = {The natural history of the minnow, \emph{Phoxinus phoxinus}}, ' ... 
'journal = {Journal of Animal Ecology}, '...
'volume = {12.2}, '...
'pages = {139--162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'MillElor1985'; type = 'Article'; bib = [ ...  
'author = {Mills, C. A. and Eloranta A:}, ' ...
'year = {1985}, ' ...
'title = {The biology of \emph{Phoxinus phoxinus} ({L}.) and other litoral zone fishes in Lake Konnevesi, Central Finland}, ' ... 
'journal = {Annales Zoologici Fennici}, '...
'volume = {22}, '...
'pages = {1--12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Mills1987'; type = 'Article'; bib = [ ...  
'author = {Mills, C. A.}, ' ...
'year = {1987}, ' ...
'title = {The life history of the minnow \emph{Phoxinus phoxinus} ({L}.) in a productive stream}, ' ... 
'journal = {Freshwater Biology}, '...
'volume = {17.1}, '...
'pages = {53--67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'MuseBorg2002'; type = 'Article'; bib = [ ...  
'author = {Museth, J. and Borgstr{\o}m, R. and Brittain, J.E. and Herberg, I. and Naalsund, C.}, ' ...
'year = {2002}, ' ...
'title = {Introduction of the {European minnow} into a subalpine lake: habitat use and long-term changes in  population dynamics}, ' ... 
'journal = {Journal of Fish Biology}, '...
'volume = {60}, '...
'pages = {1308--1321}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Kill2014'; type = 'Article'; bib = [ ...  
'author = {Killen, S. S.}, ' ...
'year = {2014}, ' ...
'title = {Growth trajectory influences temperature preference in fish through an effect on metabolic rate}, ' ... 
'journal = {Journal of Animal Ecology}, '...
'volume = {83}, '...
'pages = {1513--1522}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Hees1984'; type = 'Article'; bib = [ ...  
'author = {Heese, T.}, ' ...
'year = {1984}, ' ...
'title = {ON SOME PROBLEMS IN BIOLOGY OF MINNOW, \emph{Phoxinus phoxinus} (L.) ({C}YPRINIDAE) IN THE RIVER {S}KAWA}, ' ... 
'journal = {Acta Ichthyologica et Piscatoria},'...
'volume = {14}, '...
'pages = {25--42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'PlatSarb2013'; type = 'Article'; bib = [ ...  
'author = {Plath, M. and Sarbu, A. and Erkoc, K. and Bierbach, D. and Jourdan, J. and Schleucher, E.}, ' ...
'year = {2013}, ' ...
'title = {Energetic costs of group-living? A reversed "group effect" in shoaling minnows (\emph{Phoxinus phoxinus})}, ' ... 
'journal = {Bulletin of Fish Biology},'...
'volume = {14}, '...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'SchoSchw2000'; type = 'Article'; bib = [ ...  
'author = {Sch\"{o}nweger, G. and Schwerte, T. and Pelster, B.}, ' ...
'year = {2000}, ' ...
'title = {Temperature-dependent development of cardiac activity in unrestrained larvae of the minnow \emph{Phoxinus phoxinus}}, ' ... 
'journal = {American Journal of Physiology-Regulatory, Integrative and Comparative Physiology},'...
'volume = {279}, '...
'pages = {R1634-R1640}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'StalKest1991'; type = 'Article'; bib = [ ...  
'author = {Stalmans, J.M. and Kestemont, P.}, ' ...
'year = {1991}, ' ...
'title = {Production de juveniles de vairon \emph{Phoxinus phoxinus} {L}. \`{a} partir de larves obtenues en conditions control\''{e}es.}, ' ... 
'journal = {Bulletin francais de la p\^{e}che et de la pisciculture},'...
'volume = {320}, '...
'pages = {29--37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'KestStal1992'; type = 'Article'; bib = [ ...  
'author = {P. Kestemont and J.M. Stalmans}, ' ...
'year = {1992}, ' ...
'title = {Initial feeding of European minnow larvae, \emph{Phoxinus phoxinus} {L}. 1. Influence of diet and feeding level}, ' ... 
'journal = {Aquaculture},'...
'volume = {104}, '...
'number = {3}, '...
'doi = {10.1016/0044-8486(92)90214-6}, '...
'pages = {327--340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

%
bibkey = 'SolhBorg2010'; type = 'Article'; bib = [ ...  
'doi = {10.1007/s10750-010-0156-4}, ' ...
'author = {Marthe T. Solhaug Jenssen and Reidar Borgstrom and Brit Salbu and Bj{\o}rn Olav Rosseland}, ' ...
'year = {2010}, ' ...
'title = {The importance of size and growth rate in determining mercury concentrations in {E}uropean minnow (\emph{Phoxinus phoxinus}) and brown trout (\emph{Salmo trutta}) in the subalpine lake, {\O}vre {H}eimdalsvatn}, ' ... 
'journal = {Hydrobiologia}, ' ...
'volume = {642}, '...
'pages = {115-126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

