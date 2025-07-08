function [data, auxData, metaData, txtData, weights] = mydata_Rattus_norvegicus_Wistar

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Rattus_norvegicus_Wistar'; 
metaData.species_en = 'Laboratory rat'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TP', 'TA', 'TN'};
metaData.ecoCode.habitat = {'0iTa', '0iTs', '0iTg', '0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wwe'; 't-Wwe'; 't-Le'; 't-L'; 't-Ww_f'; 'L-Ww'; 't-JX'; 'Ww-N'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author    = {'Kim Rakel'};    
metaData.date_subm = [2018 06 08];              
metaData.email     = {'rakel@gaiac-eco.de'};            
metaData.address   = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'}; 

metaData.author_mod_1    = {'Andre Gergs'};    
metaData.date_mod_1 = [2018 06 18];              
metaData.email_mod_1     = {'andre.gergs@bayer.com'};            
metaData.address_mod_1   = {'Bayer AG, 40789 Monheim, Germany'};

metaData.author_mod_2    = {'Nina Marn', 'Dina Lika', 'Kim Rakel'};    
metaData.date_mod_2 = [2019 10 24];              
metaData.email_mod_2     = {'nina.marn@gmail.com'};            
metaData.address_mod_2   = {'Kea enterprises, Zagreb, Croatia'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 12 12];

metaData.author_mod_3    = {'David Heckmann'};    
metaData.date_mod_1 = [2022 05 25];              
metaData.email_mod_1     = {'david.heckmann@bayer.com'};            
metaData.address_mod_1   = {'Bayer AG, 40789 Monheim, Germany'};

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2022 06 09];

%% set data
% zero-variate data

data.tg = 22;     units.tg = 'd';    label.tg = 'gestation time';          bibkey.tg = 'Angu1932'; 'Seng2013';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature'; 
    comment.tg = 'Albino rat (Angu1932) + unknown strain, Lab data: gestation time 21-23 days, age at birth is 21-23 days, because the young born rats begin to suckle a few hours after birth (Kool2010, page 218, Chapter: The young)';
% data.tx = 18;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Seng2013';   
data.tx = 21;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Baye2004';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
    comment.tx ='Wistar, from data';
data.tp = 37;     units.tp = 'd';    label.tp = 'time since birth at puberty females'; bibkey.tp = 'GonzLope1984';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
    comment.tp = 'Table 1, experiment 1, Wistar, female, first vaginal opening';
data.tp_m = 43.5;     units.tp_m = 'd';    label.tp_m = 'time since birth at puberty males'; bibkey.tp_m = 'Baye2005';
  temp.tp_m = C2K(37);  units.temp.tp_m = 'K'; label.temp.tp_m = 'temperature'; 
    comment.tp_m = 'Wistar, male, preputial separation';
data.am = 1400; units.am = 'd';    label.am = 'maximum life span females';                bibkey.am = 'Kool2010';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    comment.am = 'Wistar, female';

data.Lb  = 4.26;    units.Lb  = 'cm';  label.Lb  = 'length at birth';    bibkey.Lb  = 'Angu1932'; 
    comment.Lb = 'Albino rat';
data.Lx = 11.321;       units.Lx = 'cm'; label.Lx = 'total length at weaning';     bibkey.Lx = 'NascMuni2014'; 
    comment.Lx = 'Wistar';
data.Li  = 27.75;    units.Li  = 'cm';  label.Li  = 'ultimate body length';    bibkey.Li  = 'GhezCamb2012';
    comment.Li = 'naso-anal length of 12 month old wistar rats';
    
data.Wwb = 5.82;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Baye2004'; 
    comment.Wwb = 'Wistar';
data.Wwx = 47.72;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'NascMuni2014'; 
    comment.Wwx = 'Wistar';    
data.Wwp = 123;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty female';   bibkey.Wwp = 'GonzLope1984'; 
    comment.Wwp = 'Table 1, experiment 1, Wistar, female, first vaginal opening';
    
data.Wwi = 330;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight - females';     bibkey.Wwi = 'RoeLee1995';
    comment.Wwi = 'Wistar; female; from laboratory data where they kill them at age of 225 days';
data.Ri  = 12*7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Baye2004';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'Wistar; 12 pups per litter (mean from data) and 7 litters per year, i.e. 7.5 weeks between litters if they reproduce year round';
data.Wwi_m = 560;   units.Wwi_m = 'g';   label.Wwi_m = 'ultimate wet weight - males';     bibkey.Wwi_m = 'Baye2005';
    comment.Wwi_m = 'Wistar, male; from laboratory data where they kill them at age of 225 days';
    
% uni-variate data

% t-Wwe foetal development from Angu1932
tWwe = [ ... age (d), wet weight (g)
    12.95833333	0.034
    13.91666667	0.100
    14.95833333	0.190
    15.75	0.280
    15.875	0.300
    15.95833333	0.240
    16	0.300
    16.16666667	0.470
    16.75	0.450
    16.91666667	0.480
    17	0.680
    17.08333333	0.740
    17.70833333	0.770
    17.91666667	0.890
    18.79166667	1.240
    18.875	1.460
    18.91666667	1.530
    18.95833333	1.440
    19	1.430
    19.58333333	1.970
    19.83333333	2.070
    20	2.390
    20.16666667	2.750
    20.20833333	2.860
    20.25	3.520
    20.41666667	3.500
    20.79166667	4.000
    20.83333333	3.480
    20.91666667	3.740
    21	3.670
    21.16666667	4.390
    21.75	5.020
    21.79166667	4.840
    21.95833333	5.090
    21.91666667	5.930
    ];
data.tWwe = tWwe(:,[1 2 ]); 
units.tWwe   = {'d', 'g'};  label.tWwe = {'age', 'embryo wet weight - Albino rat'};  
temp.tWwe    = C2K(37);  units.temp.tWwe = 'K'; label.temp.tWwe = 'temperature';
bibkey.tWwe = 'Angu1932';
comment.tWwe = 'Albino rat';

% t-Wde foetal development from Angu1932
tWde = [ ... age (d), dry weight (g)
    12.95833333	0.002
    13.91666667	0.010
    14.95833333	0.020
    15.75	0.030
    15.875	0.030
    15.95833333	0.020
    16	0.020
    16.16666667	0.050
    16.75	0.050
    16.91666667	0.040
    17	0.060
    17.08333333	0.060
    17.70833333	0.070
    17.91666667	0.090
    18.79166667	0.080
    18.875	0.140
    18.91666667	0.170
    18.95833333	0.160
    19	0.150
    19.58333333	0.230
    19.83333333	0.240
    20	0.280
    20.16666667	0.330
    20.20833333	0.350
    20.25	0.450
    20.41666667	0.440
    20.79166667	0.500
    20.83333333	0.440
    20.91666667	0.460
    21	0.450
    21.16666667	0.570
    21.75	0.670
    21.79166667	0.610
    21.95833333	0.660
    21.91666667	0.780 ];
data.tWde = tWde(:,[1 2 ]); 
units.tWde   = {'d', 'g'};  label.tWde = {'age', 'embryo dry weight - Albino rat'};  
temp.tWde    = C2K(37);  units.temp.tWde = 'K'; label.temp.tWde = 'temperature';
bibkey.tWde = 'Angu1932';
comment.tWde = 'Albino rat';

% t-L foetal development from Angu1932
tLe = [ ... age (d), crown-rump-length of fetus [cm]
    11	0.2
    12	0.45
    13	0.65
    14	0.85
    15	1.1
    16	1.35
    17	1.65
    18	2.05
    19	2.55
    20	3
    21	3.5
    22	4.26 ];
data.tLe1 = tLe(:,[1 2 ]);
units.tLe1   = {'d', 'cm'};  label.tLe1 = {'age', 'Crown-Rump-Length of fetus'};
temp.tLe1    = C2K(37);  units.temp.tLe1 = 'K'; label.temp.tLe1 = 'temperature';
bibkey.tLe1 = 'Angu1932';
comment.tLe1 = 'Albino rat';

% t-L foetal development from NaraFox1971
tLe_2 = [ ... age (d), crown-rump-length of fetus [cm]
    16	1.555
    17	1.76
    19	2.225
    19	2.8
    20	3.4 ];
data.tLe2 = tLe_2(:,[1 2 ]);
units.tLe2   = {'d', 'cm'};  label.tLe2 = {'age', 'Crown-Rump-Length of fetus'};
temp.tLe2    = C2K(37);  units.temp.tLe2 = 'K'; label.temp.tLe2 = 'temperature';
bibkey.tLe2 = 'NaraFox1971';
comment.tLe2 = 'Wistar';

% t-L data from GhezCamb2012
tL = [ ... age (days), body-length  [cm]
    60	21.41;
    120	25.84;
    180	26.05;
    360	27.75;
    ];
data.tL = tL(:,[1 2]);
units.tL   = {'d', 'cm'};  label.tL = {'age', 'Body-Length of Wistar'};
temp.tL    = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GhezCamb2012';
comment.tL = 'Wistar';

% length-wet weight data from DonaHata1911 - FEMALES
data.LWw_f = [ ... % FEMALES body length (cm), wet weight (g)
    5	7.78	9.54	10.8	12.08	13	12.8	14.83	15.2	15.57	16.75	17.0	17.75	17.9	18.44	18.54	19.2	19.33	20.67	20.38	20.67	20.9	21.7	21.46	21.75	22.12	22.0	22.71	22.3	23.33	23.43	23.38	23.69	23.25	23.71	24.0	24.67	25.5	25.0	25	25.5	26.0	25.67	26	27
    5	15      25      35      45      55	65      75      85      95      105     115     125     135     145     155     165     175     185     195     205     215     225     235     245     255     265     275     285     295     305     315     325     335     345     355     375     385     395     405	415     425     445     455 465
]';
units.LWw_f  = {'cm', 'g'};  label.LWw_f = {'body length', 'wet weight (Albino rat)'};
bibkey.LWw_f = 'DonaHata1911';
comment.LWw_f = 'Females, Albino rat';

%  t-Ww weights from RoeLee1995
tWw = [ ... age (d), wet weight (g)
18.00	25.62
24.07	100.00
36.20	145.70
48.33	175.80
57.43	192.70
90.80	225.30
137.84	247.90
180.26	257.90
248.51	271.70
347.14	291.70
407.76	302.40
492.74	316.20
556.44	326.80
617.06	328.10
680.76	328.70
734.10	328.70
];
data.tWw = tWw(:,[1 2 ]); 
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight - Wistar rat'};  
temp.tWw    = C2K(37);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'RoeLee1995';
comment.tWw = 'Wistar rat, FEMALES ';

%  t-Ww_C weights from control data
tWw_C = [ ... age (d), wet weight (g)
35.31	108.2
42.24	128.9
48.85	147.7
56.39	164
63	179
70.24	189.1
77.15	200.4
84.08	208.5
91	214.8
97.92	219.2
104.85	224.8
% begin pregnancy	--> time of mating: day 4 of mating insemination was successful : between day 104 and 111 in the data
111.79	221.7
119.28	241.1
126.21	266.2
132.86	325.8
% given birth	
140.07	251.2
140.42	265.6
147	270
154.21	258.1
161.49	266.2
168.42	246.1
]; 
Npups = 12; 
data.tWw_C = tWw_C(:,[1 2 ]); units.tWw_C   = {'d', 'g'};  label.tWw_C = {'time since birth', 'wet weight - Wistar rat'};  
temp.tWw_C    = C2K(37);  units.temp.tWw_C = 'K'; label.temp.tWw_C = 'temperature';
bibkey.tWw_C = 'Baye2002a';
comment.tWw_C = 'Wistar rat, FEMALES, age at start: 5-6 weeks ';
Ww0.tWw_C = data.tWw_C(1,2) ;  units.Ww0.tWw_C = 'g'; label.Ww0.tWw_C = 'wet weight at start of experiment';
t_mt.tWw_C = data.tWw_C(1,1) + 75 ;  units.t_mt.tWw_C = 'd'; label.t_mt.tWw_C = 'time since birth at mating';
N.tWw_C = Npups;  units.N.tWw_C = '#'; label.N.tWw_C = 'number of pups per female';

%   t-Ww_C weights from control data females
% ------------females 41, 44, 46, 47, 49 and 50-------------
tWw_C41 = [ ... experimental time (d), wet weight (g)
    70	204	193	201	209	208	211
    77	213	195	215	223	225	216
    84	222	198	232	232	237	224
    91	237	212	243	250	246	243
    98	234	212	245	251	254	249
    % All females were inseminated between day 98 and 105 in the data.
    105	231	206	245	266	249	243
    112	266	235	275	300	276	281
    119	291	263	295	320	305	311
    126	346	325	336	399	382	367
    133	285	217	295	312	269	288
    140	291	219	291	315	298	302
    140	297	221	291	316	307	300
    147	302	268	301	331	304	317
    154	288	252	289	311	301	302
    161	289	245	283	304	282	254
    ];
data.tWw_C41 = tWw_C41(:,[1 2 ]);  Npups_C41 = 9; 
data.tWw_C44 = tWw_C41(:,[1 3 ]);  Npups_C44 = 13; 
data.tWw_C46 = tWw_C41(:,[1 4 ]); Npups_C46 = 6; 
data.tWw_C47 = tWw_C41(:,[1 5 ]); Npups_C47 = 15; 
data.tWw_C49 = tWw_C41(:,[1 6 ]); Npups_C49 = 13; 
data.tWw_C50 = tWw_C41(:,[1 7 ]); Npups_C50 = 12; 

units.tWw_C41   = {'d', 'g'}; label.tWw_C41 = {'time since birth', 'wet weight - Wistar rat'}; 
temp.tWw_C41    = C2K(37);  units.temp.tWw_C41 = 'K'; label.temp.tWw_C41 = 'temperature';
bibkey.tWw_C41 = 'Baye2002b';
comment.tWw_C41 = 'Wistar rat, FEMALES, age at start: 10-11 weeks ';
Ww0.tWw_C41 = data.tWw_C41(1,2) ;  units.Ww0.tWw_C41 = 'g'; label.Ww0.tWw_C41 = 'wet weight at start of experiment';
t_mt.tWw_C41 = data.tWw_C41(1,1) + 35 ;  units.t_mt.tWw_C41 = 'd'; label.t_mt.tWw_C41 = 'time since birth at mating';
N.tWw_C41 = Npups_C41;  units.N.tWw_C41 = '#'; label.N.tWw_C41 = 'number of pups per female';

units.tWw_C44   = {'d', 'g'}; label.tWw_C44 = {'time since birth', 'wet weight - Wistar rat'};  
temp.tWw_C44    = C2K(37);  units.temp.tWw_C44 = 'K'; label.temp.tWw_C44 = 'temperature';
bibkey.tWw_C44 = 'Baye2002b';
comment.tWw_C44 = 'Wistar rat, FEMALES, age at start: 10-11 weeks ';
Ww0.tWw_C44 = data.tWw_C44(1,2) ;  units.Ww0.tWw_C44 = 'g'; label.Ww0.tWw_C44 = 'wet weight at start of experiment';
t_mt.tWw_C44 = t_mt.tWw_C41 ;  units.t_mt.tWw_C44 = 'd'; label.t_mt.tWw_C44 = 'time since birth at mating';
N.tWw_C44 = Npups_C44;  units.N.tWw_C44 = '#'; label.N.tWw_C44 = 'number of pups per female';

units.tWw_C46   = {'d', 'g'}; label.tWw_C46 = {'time since birth', 'wet weight - Wistar rat'};  
temp.tWw_C46    = C2K(37);  units.temp.tWw_C46 = 'K'; label.temp.tWw_C46 = 'temperature';
bibkey.tWw_C46 = 'Baye2002b';
comment.tWw_C46 = 'Wistar rat, FEMALES, age at start: 10-11 weeks ';
Ww0.tWw_C46 = data.tWw_C46(1,2) ;  units.Ww0.tWw_C46 = 'g'; label.Ww0.tWw_C46 = 'wet weight at start of experiment';
t_mt.tWw_C46 = t_mt.tWw_C41 ;  units.t_mt.tWw_C46 = 'd'; label.t_mt.tWw_C46 = 'time since birth at mating';
N.tWw_C46 = Npups_C46;  units.N.tWw_C46 = '#'; label.N.tWw_C46 = 'number of pups per female';

units.tWw_C47   = {'d', 'g'}; label.tWw_C47 = {'time since birth', 'wet weight - Wistar rat'};  
temp.tWw_C47   = C2K(37);  units.temp.tWw_C47 = 'K'; label.temp.tWw_C47 = 'temperature';
bibkey.tWw_C47 = 'Baye2002b';
comment.tWw_C47 = 'Wistar rat, FEMALES, age at start: 10-11 weeks ';
Ww0.tWw_C47 = data.tWw_C47(1,2) ;  units.Ww0.tWw_C47 = 'g'; label.Ww0.tWw_C47 = 'wet weight at start of experiment';
t_mt.tWw_C47 = t_mt.tWw_C41 ;  units.t_mt.tWw_C47 = 'd'; label.t_mt.tWw_C47 = 'time since birth at mating';
N.tWw_C47 = Npups_C47;  units.N.tWw_C47 = '#'; label.N.tWw_C47 = 'number of pups per female';

units.tWw_C49   = {'d', 'g'}; label.tWw_C49 = {'time since birth', 'wet weight - Wistar rat'};  
temp.tWw_C49    = C2K(37);  units.temp.tWw_C49 = 'K'; label.temp.tWw_C49 = 'temperature';
bibkey.tWw_C49 = 'Baye2002b';
comment.tWw_C49 = 'Wistar rat, FEMALES, age at start: 10-11 weeks ';
Ww0.tWw_C49 = data.tWw_C49(1,2) ;  units.Ww0.tWw_C49 = 'g'; label.Ww0.tWw_C49 = 'wet weight at start of experiment';
t_mt.tWw_C49 = t_mt.tWw_C41;  units.t_mt.tWw_C49 = 'd'; label.t_mt.tWw_C49 = 'time since birth at mating';
N.tWw_C49 = Npups_C49;  units.N.tWw_C49 = '#'; label.N.tWw_C49 = 'number of pups per female';

units.tWw_C50   = {'d', 'g'}; label.tWw_C50 = {'time since birth', 'wet weight - Wistar rat'};  
temp.tWw_C50    = C2K(37);  units.temp.tWw_C50 = 'K'; label.temp.tWw_C50 = 'temperature';
bibkey.tWw_C50 = 'Baye2002b';
comment.tWw_C50 = 'Wistar rat, FEMALES, age at start: 10-11 weeks ';
Ww0.tWw_C50 = data.tWw_C50(1,2) ;  units.Ww0.tWw_C50 = 'g'; label.Ww0.tWw_C50 = 'wet weight at start of experiment';
t_mt.tWw_C50 = t_mt.tWw_C41;  units.t_mt.tWw_C50 = 'd'; label.t_mt.tWw_C50 = 'time since birth at mating';
N.tWw_C50 = Npups_C50;  units.N.tWw_C50 = '#'; label.N.tWw_C50 = 'number of pups per female';

%   male and female weights from Baye2005
data.tWw_05study_f= [ ... experimental time (d), wet weight (g)
    0	5.7
    4	9.6
    11	24.2
    17	36.7
    21	47.9
    28	78.3
    35	113
    42	136.2
    49	150.6
    56	170.3
    63	182.1
    70	191.1
    ];
units.tWw_05study_f   = {'d', 'g'}; label.tWw_05study_f = {'time since birth', 'wet weight in control trial'}; 
temp.tWw_05study_f    = C2K(37);  units.temp.tWw_05study_f = 'K'; label.temp.tWw_05study_f = 'temperature';
bibkey.tWw_05study_f = 'Baye2005';
comment.tWw_05study_f = 'Wistar rat, FEMALES, control';

data.tWw_05study_m= [ ... experimental time (d), wet weight (g)
    0	6
    4	10
    11	24.8
    17	38
    21	46
    28	79.6
    35	125.5
    42	173.3
    49	216.9
    56	260
    63	291.9
    70	321.2
    ];
units.tWw_05study_m   = {'d', 'g'}; label.tWw_05study_m = {'time since birth', 'wet weight in control trial'}; 
temp.tWw_05study_m    = C2K(37);  units.temp.tWw_05study_m = 'K'; label.temp.tWw_05study_m = 'temperature';
bibkey.tWw_05study_m = 'Baye2005';
comment.tWw_05study_m = 'Wistar rat, MALES, control';    

%% NEW (v [2019 06 22]): sheet 2598
% MALES
%  t-Ww weights for  AVERAGE  of 30 males  F0-PT0001 - PT0030
tWw_M = [ ... % days of experiment (d), wet weight (g)
    0	7	14	21	28	35	42	49	56	63	70	77	84	91	98
    275.92	302.77	322.35	341.88	358.14	371.36	384.22	394.61	402.36	409.74	415.04	418.12	424.67	432.10	438.11
    ]'; tWw_M(:,1) = tWw_M(:,1) + 8*7 ; % initial age is 5-6 weeks old

data.tWw_m2598 = tWw_M; units.tWw_m2598 = {'d', 'g'};  label.tWw_m2598 = {'time since birth', 'wet weight - Wistar rat'};
    Ww0.tWw_m2598 = data.tWw_m2598(1,2) ;  units.Ww0.tWw_m2598 = 'g'; label.Ww0.tWw_m2598 = 'wet weight at start of experiment'; 
    bibkey.tWw_m2598  = 'Baye2004'; comment.tWw_m2598 = 'Wistar rat, MALES , age at start: 8  weeks';

% t-food intake MALES 
tJX_M = [... % days of experiment (d), food intake (g/animal/day)  -- there is a GAP between day 68 and 92. Average food consumtion used
    0	7	14	21	28	35	42	49	56	63
    21.72758621	21.89655172	21.77586207	22.15172414	22.25	22.21333333	22.74	22.34333333	22.66206897	22.32333333
    ]'; tJX_M(:,1) = tJX_M(:,1) + 8*7 ; % initial age is 5-6 weeks
% food intake noted for day 1 was measured as "how much food eaten by day 8, divided by 7; 
% different time interval when food measured between day 64 and 68!!+ there is a GAP between day 68 and 92. Average food consumtion used)  

% --- time vector adjusted to match an average food ingestion of a period to a time mid-point of that period
data.tJX_m2598 = [tJX_M(:,1)+3.5 , tJX_M(:,2)];
units.tJX_m2598 = {'d', 'g/animal/day'};  label.tJX_m2598 = {'age', 'ingestion rate'};
bibkey.tJX_m2598 = 'Baye2004'; comment.tJX_m2598 = 'Wistar rat, MALES , age at start: 8 weeks ';

%% sheet  0392
% MALES
%  t-Ww weights for  AVERAGE  of 30 males  F0-00001 -  F0-00030
tWw_M = [ ... % days of experiment (d), wet weight (g)
    1	8	15	22	29	36	43	50	57	64	68	71	78	85	92	99	141	148	155	162	169	176	183
    185.60	240.13	289.09	325.48	353.60	381.17	402.92	421.57	436.27	448.07	453.64	450.38	454.56	464.42	476.23	483.02	520.20	520.05	525.17	533.63	538.69	543.89	554.88
    ]'; tWw_M(:,1) = tWw_M(:,1) + 5.5*7 ; % initial age is 5-6 weeks old

data.tWw_m0392 = tWw_M; units.tWw_m0392 = {'d', 'g'};  label.tWw_m0392 = {'time since birth', 'wet weight - Wistar rat'};
    Ww0.tWw_m0392 = data.tWw_m0392(1,2) ;  units.Ww0.tWw_m0392 = 'g'; label.Ww0.tWw_m0392 = 'wet weight at start of experiment'; 
    bibkey.tWw_m0392  = 'Baye2001'; comment.tWw_m0392 = 'Wistar rat, MALES , age at start: 5-6  weeks';

% t-food intake MALES 
tJX_M = [... % days of experiment (d), food intake (g/animal/day)  -- there is a GAP between day 68 and 92. Average food consumtion used
    1	8	15	22	29	36	43	50	57	64	68  92	99	106	113	120	127
    20.45333333	25.18	24.36333333	26.16333333	24.91333333	26.87666667	26.22	24.73448276	24.45	24.69666667 24.29  23.88333333	24.03333333	23.66	23.72333333	23.16666667	22.92333333
    ]'; tJX_M(:,1) = tJX_M(:,1) + 5.5*7 ; % initial age is 5-6 weeks
% food intake noted for day 1 was measured as "how much food eaten by day 8, divided by 7; 
% different time interval when food measured between day 64 and 68!!+ there is a GAP between day 68 and 92. Average food consumtion used)  

% --- time vector adjusted to match an average food ingestion of a period to a time mid-point of that period
data.tJX_m0392 = [ [tJX_M(1:9,1)+3.5; tJX_M(10,1)+2 ; tJX_M(11,1)+15; tJX_M(12:end,1)+3.5], tJX_M(:,2) ];
units.tJX_m0392 = {'d', 'g/animal/day'};  label.tJX_m0392 = {'age', 'ingestion rate'};
bibkey.tJX_m0392 = 'Baye2001'; comment.tJX_m0392 = 'Wistar rat, MALES , age at start: 5-6 weeks ';

%% Study 2598
% *non_preg* FEMALES : averages of PT0110, PT0111, PT0112, PT0115 -- did NOT get pregnant! 
tWw_F2 = [ ... days of experiment (d), wet weight (g)
    % 0	7	14	21	28	35	42	49	56	63	70  D0	D6	D13	D20
    0	7	14	21	28	35	42	49	56	63	70  72	78	85	92
    188.83	198.93	202.68	210.10	220.20	223.95	223.75	227.25	235.23	238.88	238.88 233.00	247.55	253.85	262.88
    ]' ; tWw_F2(:,1) = tWw_F2(:,1) + 8*7 ; % initial age is 8 weeks

data.tWw_f_np2598 = tWw_F2 ; units.tWw_f_np2598 = {'d', 'g'};  label.tWw_f_np2598 = {'time since birth', 'wet weight - Wistar rat'};  
bibkey.tWw_f_np2598 = 'Baye2004'; comment.tWw_f_np2598 = 'Wistar rat, FEMALES F0, age at start: 8 weeks';
Ww0.tWw_f_np2598 = data.tWw_f_np2598(1,2) ;  units.Ww0.tWw_f_np2598 = 'g'; label.Ww0.tWw_f_np2598 = 'wet weight at start of experiment';
t_mt.tWw_f_np2598 = data.tWw_f_np2598(1,1) + 72;  units.t_mt.tWw_f_np2598 = 'd'; label.t_mt.tWw_f_np2598 = 'time since birth at mating';

% t-food intake *non_preg* FEMALES
tJX_F2 = [... % days of experiment (d), food intake (g/animal/day) %% corrected in excel to experiment time!
    3.5	10.5	17.5	24.5	31.5	38.5	45.5	52.5	59.5	66.5	75	81.5	88.5
    15.775	15.875	16.275	17.15	16.6	16.575	17.05	16.85	16.975	16.675	17.75	18.025	15.75
    ]';  tJX_F2(:,1) = tJX_F2(:,1) + 8*7 ; % initial age is 8 weeks

% time-ingestion rate
data.tJX_f_np2598 = tJX_F2; % all times corrected
units.tJX_f_np2598 = {'d', 'g/animal/day'};  label.tJX_f_np2598 = {' age ', 'ingestion rate'}; bibkey.tJX_f_np2598 = 'Baye2004'; 
comment.tJX_f_np2598 = 'Wistar rat, FEMALES F0, age at start: 5-6 weeks';

% *non_preg* FEMALES : averages of PT0605 , PT0612, PT0626, PT0628 -- did NOT get pregnant! 
tWw_F2 = [ ... days of experiment (d), wet weight (g)
    % 0	7	14	21	28	35	42	49	56	63	70  D0	D6	D13	D20
    0	7	14	21	28	35	42	49	56	63	70  72	78	85	92
    187.5	195.2	203.275	208.425	214.025	216.425	219.875	224.6	226.025	231.15	234.025	231.15	241.225	253.625	250.675
    ]'; tWw_F2(:,1) = tWw_F2(:,1) + 7*7 ; % initial age is 6-8 weeks

data.tWw_f1_np2598 = tWw_F2 ; units.tWw_f1_np2598 = {'d', 'g'};  label.tWw_f1_np2598 = {'time since birth', 'wet weight - Wistar rat'};  
bibkey.tWw_f1_np2598 = 'Baye2004'; comment.tWw_f1_np2598 = 'Wistar rat, FEMALES F1, age at start: 6-8 weeks';
Ww0.tWw_f1_np2598 = data.tWw_f1_np2598(1,2) ;  units.Ww0.tWw_f1_np2598 = 'g'; label.Ww0.tWw_f1_np2598 = 'wet weight at start of experiment';
t_mt.tWw_f1_np2598 = data.tWw_f1_np2598(1,1) + 72;  units.t_mt.tWw_f1_np2598 = 'd'; label.t_mt.tWw_f1_np2598 = 'time since birth at mating';

% t-food intake *non_preg* FEMALES
tJX_F2 = [... % days of experiment (d), food intake (g/animal/day) %% corrected in excel to experiment time! 
    3.5	10.5	17.5	24.5	31.5	38.5	45.5	52.5	59.5	66.5	75	81.5	88.5
    16.175	16.15	15.6	15.475	15.35	15.1	14.8	15.05	15	14.95	12.85	15.7	15.55
    ]';   tJX_F2(:,1) = tJX_F2(:,1) + 7*7 ; % initial age is 8 weeks

% time-ingestion rate
data.tJX_f1_np2598 = tJX_F2; % all times corrected
units.tJX_f1_np2598 = {'d', 'g/animal/day'};  label.tJX_f1_np2598 = {' age ', 'ingestion rate'}; bibkey.tJX_f1_np2598 = 'Baye2004'; 
comment.tJX_f1_np2598 = 'Wistar rat, FEMALES F1, age at start: 6-8 weeks';

%% PREGNANT FEMALES study 2598
% wet weight
% F0 : Npups, time vector
tWw_F = [0	7       14      21      28      35      42      49      56      63      70      72      78      85	92	93	97	100	107	114
    186.13	196.93	204.37	209.82	218.00	224.13	226.82	229.76	233.25	237.74	239.00	241.05	257.40	281.55	339.76	262.08	270.84	280.98	297.46	287.08
    ]'; tWw_F(:,1) = tWw_F(:,1) + 8*7 ; % initial age is 8 weeks
Npups = 11.4; % number of pups per female (median 12, mean 11.44)

data.tWw_f0_2598 = tWw_F ; units.tWw_f0_2598 = {'d', 'g'};  label.tWw_f0_2598 = {'time since birth', 'wet weight - Wistar rat'}; 
bibkey.tWw_f0_2598 = 'Baye2004'; comment.tWw_f0_2598 = 'Wistar rat, FEMALES F0, age at start: 8 weeks';
Ww0.tWw_f0_2598 = data.tWw_f0_2598(1,2) ;  units.Ww0.tWw_f0_2598 = 'g'; label.Ww0.tWw_f0_2598 = 'wet weight at start of experiment';
N.tWw_f0_2598 = Npups;  units.N.tWw_f0_2598 = '#'; label.N.tWw_f0_2598 = 'number of pups per female';
t_mt.tWw_f0_2598 = data.tWw_f0_2598(1,1) + 72;  units.t_mt.tWw_f0_2598 = 'd'; label.t_mt.tWw_f0_2598 = 'time since birth at mating';

% t-food intake FEMALES
tJX_F = [... % days of experiment (d), food intake (g/animal/day) %% corrected in excel to experiment time!
    3.5 	10.5	17.5	24.5	31.5	38.5	45.5	52.5        59.5	66.5	75      81.5	88.5	92      95.5	102.5	109.5
    15.692	15.892	16.08	16.996	16.596	16.552	16.644	16.30869565	16.712	16.42	17.832	20.752	21.22	27.608  40.864	51.972	60.96
    ]';  tJX_F(:,1) = tJX_F(:,1) + 8*7 ; % initial age is 8 weeks

% time-ingestion rate
data.tJX_f0_2598 = tJX_F ; % all times corrected
units.tJX_f0_2598 = {'d', 'g/animal/day'};  label.tJX_f0_2598 = {' age ', 'ingestion rate'}; bibkey.tJX_f0_2598 = 'Baye2004'; 
comment.tJX_f0_2598 = 'Wistar rat, FEMALES F0, age at start: 5-6 weeks';

% pups of same females as above: growth g/day
tWw_pups = [0	4	7	14	21
    5.833983061	9.584574681	15.3827381	32.19457143	48.38969048
    ]';
data.tWw_F0p_2598 = tWw_pups;
units.tWw_F0p_2598  = {'d', 'g'};  label.tWw_F0p_2598 = {'age', 'wet weight'};  
bibkey.tWw_F0p_2598 = 'Baye2004'; 
 
%%  PREGNANT FEMALES stuy 0392

% FEMALES  
%  t-Ww_M weights AVERAGE for 28 females that got pregnant + gave birth  F0-00121 - F0-00150, but not F0-00145 and F0-00149
tWw_F = [ ... days of experiment (d), wet weight (g)
    1	8	15	22	29	36	43	50	57	64	68	71	71.5	78	85	92	92.5	99	106	113	120	127	134	141
    147.48	174.76	198.47	215.84	230.24	240.54	249.53	257.81	264.35	270.53	272.46	275.09	273.60	293.15	322.31	408.72	303.68	311.90	327.40	316.37	299.99	309.98	311.09	305.59
    ]'; tWw_F(:,1) = tWw_F(:,1) +  5.5*7 ; % initial age is 5-6 weeks
Npups = 13.5; % number of pups per female (median 14, mean 13.55)

data.tWw_f0_0392 = tWw_F ; units.tWw_f0_0392 = {'d', 'g'};  label.tWw_f0_0392 = {'time since birth', 'wet weight - Wistar rat'}; 
bibkey.tWw_f0_0392 = 'Baye2001'; comment.tWw_f0_0392 = 'Wistar rat, FEMALES, age at start: 5-6 weeks';
Ww0.tWw_f0_0392 = data.tWw_f0_0392(1,2) ;  units.Ww0.tWw_f0_0392 = 'g'; label.Ww0.tWw_f0_0392 = 'wet weight at start of experiment';
N.tWw_f0_0392 = Npups;  units.N.tWw_f0_0392 = '#'; label.N.tWw_f0_0392 = 'number of pups per female';
t_mt.tWw_f0_0392 = data.tWw_f0_0392(1,1) + 72;  units.t_mt.tWw_f0_0392 = 'd'; label.t_mt.tWw_f0_0392 = 'time since birth at mating';

% t-food intake FEMALES
tJX_F = [... % days of experiment (d), food intake (g/animal/day)
    8       15      22      29      36      43      50      57      64      68	7.5	14	21	7.5	14	21	28	35	42
    15.40	18.86   17.825	19.41	17.50	18.53	18.66	17.23	16.69	17.47857143	18.36428571	21.14642857	22.25	30.42222222	50.74285714	62.26071429	25.68214286	22.25357143	19.87
    ]';    tJX_F(11: 13 , 1) = tJX_F(11:13, 1) + tJX_F(10, 1); % correct to actual time of experiment for gestation
tJX_F(14: end , 1) = tJX_F(14:end, 1) + tJX_F(13, 1); % correct to actual time of experiment for lactation
tJX_F(:,1) = tJX_F(:,1) + 5.5*7 ; % initial age is 5-6 weeks

% time-ingestion rate
data.tJX_f0_0392 = [tJX_F(:,1) - 3.5, tJX_F(:,2) ]; % first part, remove 3.5 days to get the middle measurement
units.tJX_f0_0392 = {'d', 'g/animal/day'};  label.tJX_f0_0392 = {' age ', 'ingestion rate'}; bibkey.tJX_f0_0392 = 'Baye2001'; 
comment.tJX_f0_0392 = 'Wistar rat, FEMALES , age at start: 5-6 weeks';

% pups of same females as above: growth g/day
tWw_pups = [0	4	7	14	21	28	35
    6.058177033	9.146043618	17.2894709	30.07013889	49.24261905	81.39503284	128.1772727
 ]'; 
% t_Wwpups(:end) = []; % consider removing last column - not much data

data.tWw_F0p_0392 = tWw_pups;
units.tWw_F0p_0392  = {'d', 'g'};  label.tWw_F0p_0392 = {'age', 'wet weight'};  
bibkey.tWw_F0p_0392 = 'Baye2001'; 

%% wet weight of females - number of pups
% F0_2598
WwN_F0 = [240.2	227.9	229.7	240.5	239.9	251.3	240.9	242	257	247.7	237.7	243.1	255.9	233.1	227	225	235.4	232.7	247.1	245.8	236.1	247.8	255.8	207.7	227	244	239.9	250.2	244.9	251.3
    9	15	10	12	12	11	14	12	6	0	0	0	6	8	0	14	13	13	9	11	13	8	13	13	14	15	10	4	13	15    ]';
WwN_F1 = [227.2	234.5	209.4	228	232.2	232.5	248.6	236.3	232.3	208.9	236.8	234.2	225	213.4	223.2	193.6	268.7	256.7	230.1	236.8	224.7	229.1	224.4	254.1	213.5	250.3	214.1	218.3	230.1	217
    10	10	10	13	0	10	13	8	12	11	12	0	12	9	12	5	12	12	11	9	12	10	13	9	11	0	11	0	11	12    ]';
data.WwN_2598 = [WwN_F0; WwN_F1];
units.WwN_2598 = {'g', '#'};  label.WwN_2598 = {'wet weight (at impregnation)', 'number of pups'};  
bibkey.WwN_2598 = 'Baye2004'; comment.WwN_2598 = 'two generation study; predictions depend on number of litters per year (assumed 5)'; 

% wet weight of females - number of pups 0392
WwN_F0 = [256.2	261.3	275.5	294.5	252.6	283.4	289.8	276.6	300.1	294.5	306	232	303.8	288	270.2	255.6	292	268.2	277.2	281.5	297.4	263.5	273.9	237.6	239.3	273.3	270.7	280.5	266.8	238.9
    14	15	12	13	13	15	12	17	17	13	17	9	16	14	12	11	16	14	11	14	13	13	12	14	15	16	15	6	14	12]';
WwN_F1 = [293.3	289.1	314.4	340.6	281.8	313.2	307.8		345.4	316.4	337.8	267.7	340.5	330.2	302.5	301	320.3	297.4		329.5	354.3	310.9	316.6	276.5		302	301.5	339.7	299	272.9
    14	14	12	12	9	16	10		18	13	19	15	14	16	13	14	11	15		14	16	13	9	16		16	18	7	16	14]';

data.WwN_0392 = [WwN_F0; WwN_F1];
units.WwN_0392 = {'g', '#'};  label.WwN_0392 = {'wet weight (at impregnation)', 'number of pups'};  
bibkey.WwN_0392 = 'Baye2001'; comment.WwN_0392 = 'two generation study, predictions depend on number of litters per year (assumed 5)'; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% dh: Ellington 1980 fasting data

%% loss of bodyweight in pregnant mothers (Fig 1)

tWw_f0_fast = [ ... duration_of_fasting_h, loss_of_bw_percent
    6 12 24 36
    2.956010  4.822677  6.272805 12.461211
    ]';
tWw_f0_fast(:,1) = tWw_f0_fast(:,1)/24; %convert to days
Npups = mean([26,24,23,23,24])/2 ; % number of pups per female, average over all treatments, from Table 2 (numbers are for two mothers each, thus division by 2)

data.tWw_f0_fast = tWw_f0_fast ; units.tWw_f0_fast = {'d', '%'};  label.tWw_f0_fast = {'duration of fasting', 'avg. loss of wet weight'}; 
treat.tWw_f0_fast  = {0};  units.treat.tWw_f0_fast = 'h'; label.treat.tWw_f0_fast = 'duration of fasting';
bibkey.tWw_f0_fast = 'Elli1980'; comment.tWw_f0_fast = 'Wistar rat, FEMALES, age at start unknown';
N.tWw_f0_fast = Npups;  units.N.tWw_f0_fast = '#'; label.N.tWw_f0_fast = 'number of pups per female';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tLe_f1_fast = [ ... duration_of_fasting_h, crown-rump length [mm]
    0 6 12 24 36
    12.8 12.6 12.3 12.4 12
    ]';
tLe_f1_fast(:,1) = tLe_f1_fast(:,1)/24; %convert to days
tLe_f1_fast(:,2) = tLe_f1_fast(:,2)/10; %convert to cm

data.tLe_f1_fast = tLe_f1_fast ; units.tLe_f1_fast = {'d', 'cm'};  label.tLe_f1_fast = {'duration of fasting', 'avg. crown-rump length'}; 
treat.tLe_f1_fast  = {0};  units.treat.tLe_f1_fast = 'h'; label.treat.tLe_f1_fast = 'duration of fasting';
N.tLe_f1_fast = N.tWw_f0_fast; units.N.tLe_f1_fast = '#'; label.N.tLe_f1_fast = 'number of pups per female'; 
bibkey.tLe_f1_fast = 'Elli1980'; comment.tLe_f1_fast = 'Wistar rat, FEMALES, age at start unknown';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% dh: Zhang 2010 fasting data

%% bodyweight in pregnant mothers (Fig 1)
% controls
tWw_f0_zhang_ctrl = [ ... day of gestation [d], bw [g]
    1 7 14 21
    265.0 298.3 324.9 374.7
    ]';
% 50% of food from gestation day 7
tWw_f0_zhang_FR50 = [ ... day of gestation [d], bw [g]
    1 7 14 21
    261.9 295.8 278.3 323.6
    ]';

Npups_zhang_ctrl = 13; % number of pups per female, rounded average for control, from section 3.1
Npups_zhang_FR50 = 12; % number of pups per female, rounded average , from section 3.1

data.tWw_f0_zhang_ctrl = tWw_f0_zhang_ctrl ; units.tWw_f0_zhang_ctrl = {'d', 'g'};  label.tWw_f0_zhang_ctrl = {'gestation day', 'wet weight'}; 
bibkey.tWw_f0_zhang_ctrl = 'Zhan2010'; comment.tWw_f0_zhang_ctrl = 'Wistar rat, F0 FEMALES';
Ww0.tWw_f0_zhang_ctrl = tWw_f0_zhang_ctrl(1,2) ;  units.Ww0.tWw_f0_zhang_ctrl = 'g'; label.Ww0.tWw_f0_zhang_ctrl = 'wet weight at start of experiment'; % 
N.tWw_f0_zhang_ctrl = Npups_zhang_ctrl;  units.N.tWw_f0_zhang_ctrl = '#'; label.N.tWw_f0_zhang_ctrl = 'number of pups per female';

data.tWw_f0_zhang_FR50 = tWw_f0_zhang_FR50 ; units.tWw_f0_zhang_FR50 = {'d', 'g'};  label.tWw_f0_zhang_FR50 = {'gestation day', 'wet weight'}; 
bibkey.tWw_f0_zhang_FR50 = 'Zhan2010'; comment.tWw_f0_zhang_FR50 = 'Wistar rat, F0 FEMALES';
Ww0.tWw_f0_zhang_FR50 = tWw_f0_zhang_FR50(1,2) ;  units.Ww0.tWw_f0_zhang_FR50 = 'g'; label.Ww0.tWw_f0_zhang_FR50 = 'wet weight at start of experiment'; % 
N.tWw_f0_zhang_FR50 = Npups_zhang_FR50;  units.N.tWw_f0_zhang_FR50 = '#'; label.N.tWw_f0_zhang_FR50 = 'number of pups per female';
%
%
tWwE_f1_zhang_ctrl = [ ... day after birth [d], bw [g]
    1 7 10 14 21
    5.830 12.765 15.900 24.245 39.820 % average over both genders in Table 1
    ]';

tWwE_f1_zhang_FR50 = [ ... day after birth [d], bw [g]
    1 7 10 14 21
    4.840  9.725 12.395 19.465 26.340 % average over both genders in Table 1
    ]';

data.tWwE_f1_zhang_ctrl = tWwE_f1_zhang_ctrl ; units.tWwE_f1_zhang_ctrl = {'d', 'g'};  label.tWwE_f1_zhang_ctrl = {'day after birth', 'wet weight'}; 
bibkey.tWwE_f1_zhang_ctrl = 'Zhan2010'; comment.tWwE_f1_zhang_ctrl = 'Wistar rat';

data.tWwE_f1_zhang_FR50 = tWwE_f1_zhang_FR50 ; units.tWwE_f1_zhang_FR50 = {'d', 'g'};  label.tWwE_f1_zhang_FR50 = {'day after birth', 'wet weight'}; 
bibkey.tWwE_f1_zhang_FR50 = 'Zhan2010'; comment.tWwE_f1_zhang_FR50 = 'Wistar rat';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% dh: Woodall 1996 fasting data

tWw_f0_wood_ctrl = [ ... day of gestation [d], bw [g]
    1 23
    234.6 338.7
    ]';

tWw_f0_wood_30perc = [ ... day of gestation [d], bw [g]
    1 15 23
    238.5 211.0 227.6   
    ]';

Npups_wood_ctrl = 12; % number of pups per female, rounded average for control, from Results section
Npups_wood_30perc = 12; % number of pups per female, rounded average , from Results section

data.tWw_f0_wood_ctrl = tWw_f0_wood_ctrl ; units.tWw_f0_wood_ctrl = {'d', 'g'};  label.tWw_f0_wood_ctrl = {'gestation day', 'wet weight'}; 
bibkey.tWw_f0_wood_ctrl = 'Wood1996'; comment.tWw_f0_wood_ctrl = 'Wistar rat, F0 FEMALES';
Ww0.tWw_f0_wood_ctrl = tWw_f0_wood_ctrl(1,2) ;  units.Ww0.tWw_f0_wood_ctrl = 'g'; label.Ww0.tWw_f0_wood_ctrl = 'wet weight at start of experiment'; % 
N.tWw_f0_wood_ctrl = Npups_wood_ctrl;  units.N.tWw_f0_wood_ctrl = '#'; label.N.tWw_f0_wood_ctrl = 'number of pups per female';

data.tWw_f0_wood_30perc = tWw_f0_wood_30perc ; units.tWw_f0_wood_30perc = {'d', 'g'};  label.tWw_f0_wood_30perc = {'gestation day', 'wet weight'}; 
bibkey.tWw_f0_wood_30perc = 'Wood1996'; comment.tWw_f0_wood_30perc = 'Wistar rat, F0 FEMALES';
Ww0.tWw_f0_wood_30perc = tWw_f0_wood_30perc(1,2) ;  units.Ww0.tWw_f0_wood_30perc = 'g'; label.Ww0.tWw_f0_wood_30perc = 'wet weight at start of experiment'; % 
N.tWw_f0_wood_30perc = Npups_wood_30perc;  units.N.tWw_f0_wood_30perc = '#'; label.N.tWw_f0_wood_30perc = 'number of pups per female';

tWw_f1_wood_f_ctrl = [ ... age [d], bw [g]    
    0 20 35
    5.74 48.90 119.46
    ]';

tWw_f1_wood_f_30perc = [ ... age [d], bw [g]    
    0 20 35    
    4.62 37.96 98.78
    ]';

data.tWw_f1_wood_f_ctrl = tWw_f1_wood_f_ctrl ; units.tWw_f1_wood_f_ctrl = {'d', 'g'};  label.tWw_f1_wood_f_ctrl = {'Age', 'wet weight'}; 
bibkey.tWw_f1_wood_f_ctrl = 'Wood1996'; comment.tWw_f1_wood_f_ctrl = 'Wistar rat, FEMALES';

data.tWw_f1_wood_f_30perc = tWw_f1_wood_f_30perc ; units.tWw_f1_wood_f_30perc = {'d', 'g'};  label.tWw_f1_wood_f_30perc = {'Age', 'wet weight'}; 
bibkey.tWw_f1_wood_f_30perc = 'Wood1996'; comment.tWw_f1_wood_f_30perc = 'Wistar rat, FEMALES';

%% set weights for all real data
weights = setweights(data, []);
weights.tg = 1 * weights.tg; 
weights.tx = 1 * weights.tx; 
weights.Wwb = 2 * weights.Wwb;
weights.Wwx = 2 * weights.Wwx;

weights.tp = 2 * weights.tp; 
weights.Wwp = 1 * weights.Wwp;
weights.Wwi = 5 * weights.Wwi;
weights.Wwi_m = 5 * weights.Wwi_m;
weights.Li = 1 * weights.Li;
weights.tWde = 0 * weights.tWde; % use wet weight only
weights.tLe1 = 1 * weights.tLe1;
weights.tLe2 = 1 * weights.tLe2;
weights.tL = 10 * weights.tL;
% use for validation
weights.tWw_C46 = 0 *weights.tWw_C46;weights.tWw_C47= 0 *weights.tWw_C47; 
weights.tWw_C50 = 0 *weights.tWw_C50;
%dh use F1 as validation for fasting data
weights.tLe_f1_fast = 0 * weights.tLe_f1_fast;
weights.tWwE_f1_zhang_ctrl = 0 * weights.tWwE_f1_zhang_ctrl;
weights.tWwE_f1_zhang_FR50 = 0 * weights.tWwE_f1_zhang_FR50;
weights.tWw_f1_wood_f_ctrl = 0 * weights.tWw_f1_wood_f_ctrl;
weights.tWw_f1_wood_f_30perc = 0 * weights.tWw_f1_wood_f_30perc;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; 
auxData.Ww0 = Ww0; auxData.N = N; auxData.t_mt = t_mt; 
auxData.perc_bw_loss.tWw_f0_fast = tWw_f0_fast ; %dh
auxData.embryo_length_loss.tLe_f1_fast = tLe_f1_fast ; % dh
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tLe1','tLe2'}; subtitle1 = {'Data of Angu1932 (Albino rat) and NaraFox1971 (Wistar)'};
set2 = {'tWw_m2598','tWw_m0392'};  subtitle2 = {'Wet weight, males 2598 and 0392'};
set3 = {'tJX_m2598','tJX_m0392'}; subtitle3 = {'Ingestion rate, males 2598 and 0392'};
set4 = {'tWw_f_np2598','tWw_f1_np2598','tWw_f0_2598','tWw_f0_0392'}; subtitle4 = {'Wet weight, non-pregnant females F0 & F1 of 2598 + females F0 2598 and 0392'};
set5 = {'tJX_f_np2598','tJX_f1_np2598','tJX_f0_2598','tJX_f0_0392'}; subtitle5 = {'Ingestion rate, non-pregnant females F0 & F1 of 2598 + females F0 2598 and 0392'};
set6 = {'tWw_F0p_2598','tWw_F0p_0392'}; subtitle6 = {'pups, from females F0 2598 and 0392'};
set7 = {'tWw_C41','tWw_C44', 'tWw_C49'}; subtitle7 = {'OECD control data females (pink C44, red C41, blue C49)'};
set8 = {'tWw_05study_f','tWw_05study_m'}; subtitle8 = {'male (blue) and female (red) in control trial'};
set9 = {'WwN_2598','WwN_0392'}; subtitle9 = {'studies 2598 (red) and 0392 (blue), 2 generations'};
set10 = {'tWw_C46','tWw_C47', 'tWw_C50'}; subtitle10 = {'OECD control data females (C46, C47, C50)'};
set11 = {'tWw_f0_zhang_ctrl','tWw_f0_zhang_FR50'}; subtitle11 = {'Zhang 2010 F0, red: ctrl blue: 50% food'};
set12 = {'tWwE_f1_zhang_ctrl','tWwE_f1_zhang_FR50'} ; subtitle12 = {'Zhang 2010 F1, red: ctrl blue: 50% food'};
set13 = {'tWw_f0_wood_ctrl','tWw_f0_wood_30perc'} ; subtitle13 = {'Wood 1996 F0'};
set14 = {'tWw_f1_wood_f_ctrl','tWw_f1_wood_f_30perc'} ; subtitle14 = {'Wood 1996 F1'};
metaData.grp.sets = {set1, set2, set3, set4, set5, set6, set7, set8, set9, set10, set11, set12, set13, set14};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4, subtitle5, subtitle6, subtitle7, subtitle8, subtitle9, subtitle10, subtitle11, subtitle12, subtitle13, subtitle14};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = ['Contrary to the version 2018/06/18  >> Additional t-Ww, and t-JX (ingestion rate) and Ww-N  data added. For simplicity, only mean data (of each study) uploaded for t-Ww and t-JX, '...
    'but data are separated for males, pregnant females, and non-pregnant females. '...
    'Wwb and Ri adjusted to match better observations (data).'];
D3 = ['Parameters: [E_G] now higher but more in line with other rat entries. [p_M] higher (compared to prev.version and other rat entries), but possibly due to the fact '...
    'that ingestion data has been added. Ingestion data could require a higher {p_Am} to match observed ingestion, but then a higher [p_M] to match observed size.' ...
    'Parameters d_X and mu_X were estimated because food energy content might differ from the default one (Kooijman 2010), and we assumed sufficient ingestion data' ...
    'available for estimation. A default value for parameter d_V = 0.3 was used instead of the d_V = 0.13 in the previous version, because it is more realistic. ' ...
    'As a consequence, data from Angu1932 were used as wet weight only, while dry weight was discarded for parameter estimation because it gives a d_V = 0.13.'];
D4 = ['New function dget_EVH_AF developed with Dina Lika to calculate size and age at birth and weaning, and body mass and upregulation (of feeding) of mother '...
    'during pregnancy and lactation, and growth of foetus/pup. See dget_EVH_AF for more info. ' ...
    'Alternatively, length of the embryo can be calculated using the equation for exponential growth, while NOT using the dget_EVH_AF (as was done until now), ' ...
    'if only embryonic phase is of interest. Predictions for embryo wet weight and dy weight (if calculated as now via get_EVH_AF.m) will very much depend '...
    'on number of siblings in the litter and food ingestion of mother. Currently the predictions are an average of foetal growth in studies 2598 and 0392. '...
    'Goodness of fit for foetal weight is slightly worse than in previous version possibly because dataset specific f was not used.'];
D5 = ['All (adult) females are modelled with the new function, with non-pregnant females having the litter size of zero, ' ... 
    'and pregnant females the average litter size in that study.'];
D6 = ['Currently the (measurable) growth of embryo starts after t_0, but this period between fertilization  and growth is possibly used to prepare other'...
    'maternal and extra-embryonal structures. This is currently not modelled, but might be included in extensions, as the energy required for building these'...
    'tissues might explain the earlier (than predicted) onset of up-regulation of feeding. Alternatively, a different driver of earlier up-regulated  ' ...
    'feeding is possible, in which case t_0 is a diapause (reported for rats in literature.'];
D7 = 'Kept from version 2018/06/18: All data present + specific function get_eL2 used for control males';
D8 = ['Modified version 2019/12/12: Used supply dynamics for embryo growth (instead of demand dynamics).'...
    'Included additional data sets on the effect of reduced food availability on the weight of mothers and offspring.'...
    'For these data sets on reduced food availability, functional reponses were calibrated to data of the mothers, and offspring was used as validation.' ];

metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5, 'D6', D6, 'D7', D7, 'D8', D8);

%% Acknowledgment
metaData.acknowledgment = 'Versions 2019/12/12 and 2022/06/10 of this entry were financially supported by Bayer.';

%% Links
metaData.links.id_CoL = '4RM67'; % Cat of Life
metaData.links.id_ITIS = '180363'; % ITIS
metaData.links.id_EoL = '328448'; % Ency of Life 
metaData.links.id_Wiki = 'Rattus_norvegicus'; % Wikipedia
metaData.links.id_ADW = 'Rattus_norvegicus'; % ADW
metaData.links.id_Taxo = '63135'; % Taxonomicon
metaData.links.id_WoRMS = '993634'; % WoRMS
metaData.links.id_MSW3 = '13001766'; % Mammal Spec World
metaData.links.id_AnAge = 'Rattus_norvegicus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rattus_norvegicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rattus_norvegicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Angu1932'; type = 'article'; bib = [ ...  
'author = {Angulo y Gonzalez, A.W.}, ' ...
'year = {1932}, ' ...
'title  = {THE PRENATAL GROWTH OF THE ALBINO RAT}, ' ...
'journal = {The Anatomical Record}, ' ...
'volume = {52}, ' ...
'issue = {2}, ' ...
'pages = {117-138}, ' ...
'DOI = {10.1002/ar.1090520203}, '...
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.1002/ar.1090520203/full}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2001'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {2001}, ' ...
'note = {Control data from tests, 2 generations study in rat}}', ...
'number = {M-039264-02-1},' ...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2002a'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {2002}, ' ...
'note = {Control data from tests, 2 generations reproduction study in rat}},' ...
'number = {M-036790-01-1},' ...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2002b'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {2002}, ' ...
'note = {Control data from tests, 1 generation reproduction study in rat}},' ...
'number = {M-035507-01-1},' ...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2004'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {2004}, ' ...
'note = {Control data from tests, 2 generations study in rat}},'...
'number = {M-259850-01-1},' ...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2005'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {2005}, ' ...
'note = {Control data from screening study conducted in accordance with U.S. EPA Office of Prevention, Pesticides and Toxic Substances (OPPTS) Guideline 870.6300}}' ...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DonaHata1911'; type = 'article'; bib = [ ...  
'author = {Donaldson, H. H. and Hatai, S.}, ' ...
'year = {1911}, ' ...
'title  = {A comparison of the Norway rat with the Albino rat in respect to body length, brain weight, spinal cord weight and the percentage of water in both the brain and the spinal cord}, ' ...
'journal = {The Journal of Comparative Neurology}, ' ...
'volume = {21}, ' ...
'issue = {5}, ' ...
'pages = {417-458}, ' ...
'DOI = {10.1002/cne.900210502}, '...
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.1002/cne.900210502/abstract}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GhezCamb2012'; type = 'article'; bib = [ ...  
'author = {Ghezzi, A. C. and Cambri, L. T. and Botezelli, J. D. and Ribeiro, C. and Dalia, R. A. and de Mello, M. A. R.}, ' ...
'year = {2012}, ' ...
'title  = {Metabolic syndrome markers in wistar rats of different ages}, ' ...
'journal = {Diabetology & Metabolic Syndrome}, ' ...
'volume = {4}, ' ...
'issue = {16}, ' ...
'DOI = {10.1186/1758-5996-4-16}, '...
'howpublished = {\url{http://link.springer.com/article/10.1186%%2F1758-5996-4-16?LI=true}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GonzLope1984'; type = 'article'; bib = [ ...  
'author = {Gonzalez, M. D. and Lopez, F. and Aguilar, E.},' ...
'year = {1984}, ' ...
'title  = {Involvement of prolactin in the onset of puberty in female rats},' ...
'journal = {Journal of Endocrinology},' ...
'volume = {101},' ...
'pages = {63-68},' ...
'howpublished = {\url{https://www.ncbi.nlm.nih.gov/pubmed/6538590}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kool2010'; type = 'Book'; bib = [ ...  
'author = {Koolhaas, J.M.}, ' ...
'year = {2010},' ...
'title  = {Chapter 22: The Laboratory Rat - The UFAW Handbook on the Care and Management of Laboratory and Other Research Animals}, ' ...
'publisher = {Universities Federation for Animal Welfare},' ...
'pages = {311-326)},' ...
'DOI = {10.1002/9781444318777.ch22}, '...
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.1002/9781444318777.ch22/summary}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NaraFox1971'; type = 'article'; bib = [ ...  
'author = {Narayanan, C. H. and Fox, M. W. and Hamburger, V.}, ' ...
'year = {1971}, ' ...
'title  = {Prenatal Development of Spontaneous and Evoked Activity in the Rat \emph{(Rattus norvegicus albinus)} }, ' ...
'journal = {Behaviour}, ' ...
'volume = {40}, ' ...
'issue = {1/2}, ' ...
'pages = {100-134}, ' ...
'howpublished = {\url{https://www.jstor.org/stable/4533406?seq=1#page_scan_tab_contents}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NascMuni2014'; type = 'article'; bib = [ ...  
'author = {do Nascimento, E. and de Santana Muniz, G. and de Souza Alexandre, L. and da Rocha, L. S. and Dalia, R. A. and Leandro, C. G. and de Castro, R. M. and Bolanos-Jimenez, F.}, ' ...
'year = {2014}, ' ...
'title  = {Unlimited access to low-energy diet causes acute malnutrition in dams and alters biometric and biochemical parameters in offspring}, ' ...
'journal = {Journal of Developmental Origins of Health and Disease}, ' ...
'volume = {5}, ' ...
'issue = {1}, ' ...
'pages = {45-55}, ' ...
'DOI = {10.1017/S2040174413000482}, '...
'howpublished = {\url{https://www.cambridge.org/core/journals/journal-of-developmental-origins-of-health-and-disease/article/div-classtitleunlimited-access-to-low-energy-diet-causes-acute-malnutrition-in-dams-and-alters-biometric-and-biochemical-parameters-in-offspringdiv/BF37C6D3E5685C3E4A2F364BC6ECE7EC}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoeLee1995'; type = 'article'; bib = [ ...  
'author = {Roe, F.J.C. and Lee, P.N. and Conybaere, G. and Kelly, D. and Matter, B. and Prentice, D. and Tobin, G.}, ' ...
'year = {1995},' ...
'title  = {The Biosure Study: Influence of Composition of Diet and Food Consumption on Longevity, Degenerative Diseases and Neoplasia in {W}istar Rats Studied for uo to 30 Month Post Weaning}, ' ...
'journal = {Food and Chemical Toxicology},' ...
'volume = {33},' ...
'supplement = {1},' ...
'pages = {1S-100S},' ...
'howpublished = {\url{https://www.ncbi.nlm.nih.gov/pubmed/7713457}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Seng2013'; type = 'article'; bib = [ ...  
'author = {Sengupta, P.}, ' ...
'year = {2013}, ' ...
'title  = {The Laboratory Rat: {R}elating Its Age with Human''s}, ' ...
'journal = {International Journal of Preventive Medicine}, ' ...
'volume = {4}, ' ...
'issue = {6}, ' ...
'pages = {624-630}, ' ...
'howpublished = {\url{https://www.ncbi.nlm.nih.gov/pubmed/23930179}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Elli1980';type = 'article'; bib = [ ...   
  'title={In-vivo and in-vitro studies on the effects of maternal fasting during embryonic organogenesis in the rat},'...
  'author={Ellington, SKL},'...
  'journal={Reproduction},'...
  'volume={60},'...
  'number={2},'...
  'pages={383--388},'...
  'year={1980},'...
  'publisher={Bioscientifica Ltd}' ]; % dh
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Zhan2010';type = 'article'; bib = [ ...     
  'title={Effects of maternal food restriction on physical growth and neurobehavior in newborn {W}istar rats},'... 
  'author={Zhang, Yinguo and Li, Ning and Yang, Jiajia and Zhang, Tao and Yang, Zhuo},'...
  'journal={Brain Research Bulletin},'...
  'volume={83},'...
  'number={1-2},'...
  'pages={1-8},'...
  'year={2010},'...
  'publisher={Elsevier}']; % dh
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Wood1996';type = 'article'; bib = [ ...    
  'title={Chronic maternal undernutrition in the rat leads to delayed postnatal growth and elevated blood pressure of offspring},'...
  'author={Woodall, SM and Johnston, BM and Breier, BH and Gluckman, PD},'...
  'journal={Pediatric research},'...
  'volume={40},'...
  'number={3},'...
  'pages={438-443},'...
  'year={1996}']; %dh
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

