function [data, auxData, metaData, txtData, weights] = mydata_Boreogadus_saida 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Boreogadus_saida'; 
metaData.species_en = 'Polar cod'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1); % K, temp of typical arctic water
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'L0'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L_T'; 't-Le'; 't-Ww_T'; 't-Wwe'; 't-JX_T'; 'L-JO_T'; 'L-Ww'; 'L-N'; 'L0-Lt'; 'Ww0-Wwt'; 'L-X'; 'T-JO'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'; 'Kristina Kunz'; 'Jasmine Nahrgang'};    
metaData.date_subm = [2017 09 14];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso Norway'};   

metaData.author_mod_1   = {'Starrlight Augustine';  'Jasmine Nahrgang'};    
metaData.date_mod_1     = [2018 06 12];              
metaData.email_mod_1    = {'sta@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso Norway'};  

metaData.author_mod_2   = {'Starrlight Augustine'};    
metaData.date_mod_2     = [2018 11 30];              
metaData.email_mod_2    = {'sta@akvaplan.niva.no'};            
metaData.address_mod_2  = {'Akvaplan-niva, Tromso Norway'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 11 30]; 

%% set data
% zero-variate data
% data.ah = 58;    units.ah = 'd';    label.ah = 'age at hatch';             bibkey.ah = 'GrahHop1995';   
%   temp.ah = C2K(1.5);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
%   comment.ah = '58d, GrahHop19951.5 deg; Aron1975 range: 26-36d with temp ranging from -0.3-2.5. 45 to 90 d 1C  Rass (1968) in BoucMoll2016';
data.ab = 42;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KentDros2016';   
  temp.ab = C2K(3.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = '12-14d since hatch at 0 deg according to Aron1975; 70 dpf at 1.5 deg GrahHop1995';
    data.aj = 161;    units.aj = 'd';    label.aj = 'age at metamorphis';           bibkey.aj = 'KentDros2016';
  temp.aj = C2K(3.5);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = ' so-called juvenile stage in the publication ;age at ca 3 cm, estimated from otholiths from individuals captured in the Beaufort sea is 150 d since birth (0 deg C) BoucMoll2016';
    data.ap = 404;    units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'KentDros2016';
  temp.ap = C2K(3.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '2 year Crai1982'; 
data.am = 7*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Crai1982';   
  temp.am = C2K(1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.L0  = 1.67;   units.L0  = 'mm';  label.L0  = 'egg diameter';   bibkey.L0  = 'DahlNahr2017';  
  comment.L0 = 'mean egg diameter'; 
data.Lj  = 34e-1;   units.Lj  = 'cm';  label.Lj  = 'length at metamorphosis';   bibkey.Lj  = 'KentDros2016';  
  comment.Lj = '34.2mm Juvenile length- tab. 2, fin ray development and onset of squamation WalkPaul2011. BoucMoll2016 report 16 - 32 mm corresponds to metamorphosis of planktonic larvae to pelagic juveniles with improved swimmng capability';
data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'NahrVarp2014';
  comment.Lp = 'total length of 2 year old fish from fig. 4; Crai1982 report 12-15 cm forked length';
data.Li  = 30.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'NahrVarp2014';
  comment.Li = ' Andr1954 reports 40 cm; Peth1994 in HopGjos20132 reports 46 cm';

data.Ww0 = 2.2e-3;   units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';   bibkey.Ww0 = 'Nahr2017';
  comment.Ww0 = 'variation: 1.8-2.2 mg';
data.Wwj = 287.7e-3;   units.Wwj = 'g';   label.Wwj = 'wet weight at metamorphosis';   bibkey.Wwj = 'WalkPaul2011';
data.Wwp = 4.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'NahrVarp2014';
data.Wwi = 157;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'NahrVarp2014';

data.Ni  = 36530;   units.Ni  = '#'; label.Ni  = 'fecundity at 21 cm';     bibkey.Ni  = 'NahrVarp2014';   
temp.Ni = C2K(0);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data

% standard-length wet weight relationship Walkutz et al 2011
% data.LWjuv = [ ...
%     25.2 30.8 24.8 27.7 25 24.4 18.6 21.9 19.7 38.4 34.6;
%     162 272.3 114.4 136.4 101.9 98.8 34 63.5 62.7 388.3 301.9
%     ]';
% comment.LWjuv = 'Canadian Beaufort Sea, summer, 2005';
% units.LWjuv   = {'mm', 'mg'};  label.LWjuv = {'standard length', 'wet weight'};  
% bibkey.LWjuv = 'WalkPaul2011';

% - DahlNahr2017 -----------------------------------------------
% - we use control water acidity

Tt = [  ... temp (C)	Treat pCO2 (muatm)	Time (days)
0.0	400	67
0.0	400	67
0.0	400	67
0.0	400	65
0.0	400	67
0.0	400	67
1.5	400	50
1.5	400	51
1.5	400	50
1.5	400	50
1.5	400	51
1.5	400	53
3.0	400	43
3.0	400	42
3.0	400	42
3.0	400	43
3.0	400	38
3.0	400	42
4.5	400	33
4.5	400	33
4.5	400	31
4.5	400	32
4.5	400	34
4.5	400	33
6.0	400	28
6.0	400	28
6.0	400	28
6.0	400	28];

TJO = [ ... temp (C), pCO muatm, MO2 nmol/g/h, JO2 nmol/h
0.0	400	8.950	1.200
0.0	400	8.180	1.180
0.0	400	9.860	1.320
0.0	400	9.310	1.220
0.0	400	7.290	1.070
0.0	400	6.350	0.890
1.5	400	11.880	1.600
1.5	400	13.030	1.880
1.5	400	11.470	1.530
1.5	400	13.320	1.750
1.5	400	10.840	1.570
1.5	400	12.780	1.780
3.0	400	15.310	2.060
3.0	400	13.620	1.960
3.0	400	15.530	2.080
3.0	400	16.710	2.200
3.0	400	18.130	2.620
3.0	400	16.390	2.290
4.5	400	17.660	2.380
4.5	400	17.100	2.460
4.5	400	18.730	2.510
4.5	400	20.510	2.700
4.5	400	18.290	2.650
4.5	400	18.450	2.580
6.0	400	18.340	2.470
6.0	400	18.270	2.440
6.0	400	15.650	2.060
6.0	400	17.620	2.550];
data.TJO = [TJO(:,1) TJO(:,4)]; % deg C, nmol/h
bibkey.TJO = 'DahlNahr2017';
units.TJO = {'degC','nmol/h'}; label.TJO = {'temperature','oxygen consumption at age'};
age.TJO = Tt(:,3); % dpf, age
units.age.TJO = 'dpf'; label.age.TJO = 'age';
treat.TJO = {0}; units.treat.TJO = ''; label.treat.TJO = '';

% 
TLW = [ ... Treat temp [C]	Treat pCO2 [atm]	Somatic body a [mm**2]	Fish SL [mm]	Yolk sac a [mm**2]	dm [mug]	Eggs d [mm]
0.0	400	2.87	6.95	0.77	1801.58	1.65
0.0	400	2.89	7.12	0.74	1852.55	1.69
0.0	400	2.89	6.96	0.71	1821.58	1.66
0.0	400	2.92	6.96	0.78	1904.97	1.70
0.0	400	2.96	7.16	0.65	1909.29	1.71
1.5	400	2.70	6.76	0.57	1795.67	1.65
1.5	400	2.90	7.02	0.64	1873.06	1.69
1.5	400	2.71	6.73	0.73	1799.07	1.58
1.5	400	2.94	6.80	0.77	1866.27	1.66
1.5	400	2.80	6.87	0.70	1864.17	1.70
1.5	400	3.00	6.93	0.71	1896.20	1.71
3.0	400	2.81	6.65	0.72	1771.88	1.65
3.0	400	2.88	6.92	0.85	1810.79	1.69
3.0	400	2.95	6.80	0.85	1773.53	1.58
3.0	400	2.96	6.60	0.81	1825.50	1.66
3.0	400	2.90	6.74	0.93	1861.81	1.70
3.0	400	2.86	6.84	0.81	1841.73	1.71
    ];
data.tWwe = [Tt(1:17,3) TLW(:,6)];
units.tWwe = {'dpf', 'mug'};     label.tWwe = {'age', 'wet weight'};  
bibkey.tWwe = 'DahlNahr2017';
temp.tWwe = Tt(1:17,1);
units.temp.tWwe = 'K'; label.temp.tWwe = 'temperature';
treat.tWwe = {0}; units.treat.tWwe = ''; label.treat.tWwe = '';

data.tLe = [Tt(1:17,3) TLW(:,4)];  
units.tLe = {'dpf', 'mm'}; label.tLe = {'age', 'standard length'};  
bibkey.tLe = 'DahlNahr2017';
temp.tLe = Tt(1:17,1);
units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
treat.tLe = {0}; units.treat.tLe = ''; label.treat.tLe = '';



% KunzFric2016
% animals were about 2 years old at the start of the experiment

tLWX = [ ...Inc dur [days]	Fish TL [mm] (Start)	Fish wm [g] (Start)	Fish TL [mm] (End)	Fish wm [g] (End)		Feed dry total [g]		
116	147	17.1	153	26.4	6.6721
116	126	13.3	131	23.8	5.5054
116	129	11.8	147	18.5	5.9879
116	130	10.8	135	19.2	5.5862
116	136	15.9	153	27.4	10.0590
116	139	14.9	158	25.3	7.7615
112	112	7.2	    117	10.2	3.6194
112	120	10.7	136	17.9	6.3077
111	137	17.0	148	22.9	4.6647
111	160	29.1	177	37.6	9.7557
111	157	20.9	170	32.5	10.3669
111	155	26.7	170	36.5	8.5138
];
data.tL0 = [tLWX(:,2),tLWX(:,4)]; temp.tL0 = C2K(0); expLength.tL0 = tLWX(:,1); bibkey.tL0 = 'KunzFric2016';
units.tL0 = {'mm','mm'};label.tL0 = {'initial total length','final total length'};
units.temp.tL0 = 'K'; label.temp.tL0 = 'temperature';
units.expLength.tL0 = 'd'; label.expLength.tL0 = 'experiment expLength';
treat.tL0 = {0}; units.treat.tL0 = ''; label.treat.tL0 = '';
comment.tL0 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.tW0 = [tLWX(:,3),tLWX(:,5)]; temp.tW0 = C2K(0); expLength.tW0 = tLWX(:,1); bibkey.tW0 = 'KunzFric2016';
units.tW0 = {'g','g'};label.tW0 = {'initial wet weight','final wet weight'};
units.temp.tW0 = 'K'; label.temp.tW0 = 'temperature';
units.expLength.tW0 = 'd'; label.expLength.tW0 = 'experiment expLength';
treat.tW0 = {0}; units.treat.tW0 = ''; label.treat.tW0 = '';
comment.tW0 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.LW0 = [tLWX(:,2),tLWX(:,3)];  bibkey.LW0 = 'KunzFric2016';
units.LW0 = {'mm','g'};label.LW0 = {'initial total length','initial wet weight'};
comment.LW0 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.LJX0 = [tLWX(:,4),tLWX(:,end)]; 
temp.LJX0 = C2K(0); expLength.LJX0 = tLWX(:,1); bibkey.LJX0 = 'KunzFric2016';
units.LJX0 = {'mm','g'};label.LJX0 = {'final total length','dry weight of cumulated food ingested'};
units.temp.LJX0 = 'K'; label.temp.LJX0 = 'temperature';
units.expLength.LJX0 = 'd'; label.expLength.LJX0 = 'experiment expLength';
treat.LJX0 = {0}; units.treat.LJX0 = ''; label.treat.LJX0 = '';
comment.LJX0 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

LWJO0 = [ ... Fish TL [mm] (End)	Fish wm [g] (End) SMR [mumol/min/g]
153	26.4	0.0526
147	18.5	0.0534
135	19.2	0.0612
153	27.4	0.0586
];
data.LJO0 = [LWJO0(:,1),LWJO0(:,end)]; 
data.LJO0(:,2) = LWJO0(:,2) .* data.LJO0(:,2); % change unit to mumol/min
bibkey.LJO0 = 'KunzFric2016';
units.LJO0 = {'mm','micromol/min'};label.LJO0 = {'final total length','respiration'};
temp.LJO0 = C2K(0); units.temp.LJO0 = 'K'; label.temp.LJO0 = 'temperature';
comment.LJO0 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

tLWX3 = [ ...Inc dur [days]	Fish TL [mm] (Start)	Fish wm [g] (Start)	Fish TL [mm] (End)	Fish wm [g] (End)		Feed dry total [g]		
115	119	8.6	130	16.1	5.7385
102	134	13.8	157	28.8	11.7496
115	122	10.5	143	23.1	11.4810
115	163	29.4	186	48.6	14.9289
116	134	13.2	151	24.7	12.7201
116	124	13.9	146	19.3	5.8231
111	145	17.8	155	31.8	11.3368
110	154	21.3	173	32.3	10.5823
110	149	18.5	168	27.7	11.4222
110	150	18.5	156	23.7	11.3557
110	145	22.5	162	29.2	9.3619
];
data.tL3 = [tLWX3(:,2),tLWX3(:,4)]; temp.tL3 = C2K(3); expLength.tL3 = tLWX3(:,1); bibkey.tL3 = 'KunzFric2016';
units.tL3 = {'mm','mm'};label.tL3 = {'initial total length','final total length'};
units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
units.expLength.tL3 = 'd'; label.expLength.tL3 = 'experiment expLength';
treat.tL3 = {0}; units.treat.tL3 = ''; label.treat.tL3 = '';
comment.tL3 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.tW3 = [tLWX3(:,3),tLWX3(:,5)]; temp.tW3 = C2K(3); expLength.tW3 = tLWX3(:,1); bibkey.tW3 = 'KunzFric2016';
units.tW3 = {'g','g'};label.tW3 = {'initial wet weight','final wet weight'};
units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
units.expLength.tW3 = 'd'; label.expLength.tW3 = 'experiment expLength';
treat.tW3 = {0}; units.treat.tW3 = ''; label.treat.tW3 = '';
comment.tW3 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.LW3 = [tLWX3(:,2),tLWX3(:,3)];  bibkey.LW3 = 'KunzFric2016';
units.LW3 = {'mm','g'};label.LW3 = {'initial total length','initial wet weight'};
comment.LW3 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.LJX3 = [tLWX3(:,4),tLWX3(:,end)]; 
temp.LJX3 = C2K(3); expLength.LJX3 = tLWX3(:,1); bibkey.LJX3 = 'KunzFric2016';
units.LJX3 = {'mm','g'};label.LJX3 = {'final total length','dry weight of cumulated food ingested'};
units.temp.LJX3 = 'K'; label.temp.LJX3 = 'temperature';
units.expLength.LJX3 = 'd'; label.expLength.LJX3 = 'experiment expLength';
treat.LJX3 = {0}; units.treat.LJX3 = ''; label.treat.LJX3 = '';
comment.LJX3 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

LWJO3 = [ ... Fish TL [mm] (End)	Fish wm [g] (End) SMR [mumol/min/g]
130	16.1	0.0552
157	28.8	0.0495
143	23.1	0.0510
186	48.6	0.0491
146	19.3	0.0451 ];
data.LJO3 = [LWJO3(:,1),LWJO3(:,end)]; 
data.LJO3(:,2) = LWJO3(:,2) .* data.LJO3(:,2); % change unit to mumol/min
bibkey.LJO3 = 'KunzFric2016';
units.LJO3 = {'mm','micromol/min'};label.LJO3 = {'final total length','respiration'};
temp.LJO3 = C2K(3); units.temp.LJO3 = 'K'; label.temp.LJO3 = 'temperature';
comment.LJO3 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

tLWX6 = [ ...Inc dur [days]	Fish TL [mm] (Start)	Fish wm [g] (Start)	Fish TL [mm] (End)	Fish wm [g] (End)		Feed dry total [g]		
118	140	16.0	156	24.6	6.9772
118	124	12.4	165	30.8	13.0874
118	139	15.5	156	32.8	12.9741
118	144	12.0	158	22.7	9.8322
118	138	11.9	155	23.8	12.6567
118	134	11.2	147	23.9	12.0222
114	130	10.0	157	22.8	9.3730
114	150	15.0	165	25.1	11.1827
113	139	22.6	165	26.1	8.7843
113	153	22.2	172	33.4	10.5483
113	136	15.3	162	28.8	13.2703
113	141	17.3	165	25.6	9.9681];
data.tL6 = [tLWX6(:,2),tLWX6(:,4)]; temp.tL6 = C2K(6); expLength.tL6 = tLWX6(:,1); bibkey.tL6 = 'KunzFric2016';
units.tL6 = {'mm','mm'};label.tL6 = {'initial total length','final total length'};
units.temp.tL6 = 'K'; label.temp.tL6 = 'temperature';
units.expLength.tL6 = 'd'; label.expLength.tL6 = 'experiment Length';
treat.tL6 = {0}; units.treat.tL6 = ''; label.treat.tL6 = '';
comment.tL6 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.tW6 = [tLWX6(:,3),tLWX6(:,5)]; temp.tW6 = C2K(6); expLength.tW6 = tLWX6(:,1); bibkey.tW6 = 'KunzFric2016';
units.tW6 = {'g','g'};label.tW6 = {'initial wet weight','final wet weight'};
units.temp.tW6 = 'K'; label.temp.tW6 = 'temperature';
units.expLength.tW6 = 'd'; label.expLength.tW6 = 'experiment Length';
treat.tW6 = {0}; units.treat.tW6 = ''; label.treat.tW6 = '';
comment.tW6 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.LW6 = [tLWX6(:,2),tLWX6(:,3)];  bibkey.LW6 = 'KunzFric2016';
units.LW6 = {'mm','g'};label.LW6 = {'initial total length','initial wet weight'};
comment.LW6 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.LJX6 = [tLWX6(:,4),tLWX6(:,end)]; 
temp.LJX6 = C2K(6); expLength.LJX6 = tLWX6(:,1); bibkey.LJX6 = 'KunzFric2016';
units.LJX6 = {'mm','g'};label.LJX6 = {'final total length','dry weight of cumulated food ingested'};
units.temp.LJX6 = 'K'; label.temp.LJX6 = 'temperature';
units.expLength.LJX6 = 'd'; label.expLength.LJX6 = 'experiment Length';
treat.LJX6 = {0}; units.treat.LJX6 = ''; label.treat.LJX6 = '';
comment.LJX6 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

LWJO6 = [ ... Fish TL [mm] (End)	Fish wm [g] (End) SMR [mumol/min/g]
156	24.6	0.0483
165	30.8	0.0581
156	32.8	0.0597
158	22.7	0.0662
147	23.9	0.0546];
data.LJO6 = [LWJO6(:,1),LWJO6(:,end)]; 
data.LJO6(:,2) = LWJO6(:,2) .* data.LJO6(:,2); % change unit to mumol/min
temp.LJO6 = C2K(6); bibkey.LJO6 = 'KunzFric2016';
units.LJO6 = {'mm','micromol/min'};label.LJO6 = {'final total length','respiration'};
units.temp.LJO6 = 'K'; label.temp.LJO6 = 'temperature';
comment.LJO6 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

tLWX8 = [ ...Inc dur [days]	Fish TL [mm] (Start)	Fish wm [g] (Start)	Fish TL [mm] (End)	Fish wm [g] (End)		Feed dry total [g]		
117	148	14.1	161	22.6	10.4185
117	157	16.1	169	29.1	15.2862
115	134	14.4	148	20.1	10.0210
112	109	7.4	    117	11.4	4.8374
117	129	11.5	149	24.9	13.5484
117	136	10.1	142	14.9	6.1691
109	138	13.8	152	20.7	11.3591
109	148	20.7	169	30.8	9.9891
109	144	16.4	156	23.1	11.3242
109	161	21.6	172	28.4	9.3954
96	158	21.4	165	22.6	5.7179
109	149	19.1	163	25.0	10.1137
];
data.tL8 = [tLWX8(:,2),tLWX8(:,4)]; temp.tL8 = C2K(8); expLength.tL8 = tLWX8(:,1); bibkey.tL8 = 'KunzFric2016';
units.tL8 = {'mm','mm'};label.tL8 = {'initial total length','final total length'};
units.temp.tL8 = 'K'; label.temp.tL8 = 'temperature';
units.expLength.tL8 = 'd'; label.expLength.tL8 = 'experiment Length';
treat.tL8 = {0}; units.treat.tL8 = ''; label.treat.tL8 = '';
comment.tL8 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.tW8 = [tLWX8(:,3),tLWX8(:,5)]; temp.tW8 = C2K(8); expLength.tW8 = tLWX8(:,1); bibkey.tW8 = 'KunzFric2016';
units.tW8 = {'g','g'};label.tW8 = {'initial wet weight','final wet weight'};
units.temp.tW8 = 'K'; label.temp.tW8 = 'temperature';
units.expLength.tW8 = 'd'; label.expLength.tW8 = 'experiment Length';
treat.tW8 = {0}; units.treat.tW8 = ''; label.treat.tW8 = '';
comment.tW8 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.LW8 = [tLWX8(:,2),tLWX8(:,3)];  bibkey.LW8 = 'KunzFric2016';
units.LW8 = {'mm','g'};label.LW8 = {'initial total length','initial wet weight'};
comment.LW8 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

data.LJX8 = [tLWX8(:,4),tLWX8(:,end)]; 
temp.LJX8 = C2K(8); expLength.LJX8 = tLWX8(:,1); bibkey.LJX8 = 'KunzFric2016';
units.LJX8 = {'mm','g'};label.LJX8 = {'final total length','dry weight of cumulated food ingested'};
units.temp.LJX8 = 'K'; label.temp.LJX8 = 'temperature';
units.expLength.LJX8 = 'd'; label.expLength.LJX8 = 'experiment Length';
treat.LJX8 = {0}; units.treat.LJX8 = ''; label.treat.LJX8 = '';
comment.LJX8 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';

LWJO8 = [ ... Fish TL [mm] (End)	Fish wm [g] (End) SMR [mumol/min/g]
161	22.6	0.0920
169	29.1	0.0602
148	20.1	0.0818
117	11.4	0.0666
149	24.9	0.1015
142	14.9	0.0945
];
data.LJO8 = [LWJO8(:,1),LWJO8(:,end)]; 
data.LJO8(:,2) = LWJO8(:,2) .* data.LJO8(:,2); % change unit to mumol/min
temp.LJO8 = C2K(8); bibkey.LJO8 = 'KunzFric2016';
units.LJO8 = {'mm','micromol/min'};label.LJO8 = {'final total length','respiration'};
units.temp.LJO8 = 'K'; label.temp.LJO8 = 'temperature';
comment.LJO8 = 'raw data on pangea: https://doi.pangaea.de/10.1594/PANGAEA.867390';
  
% L-W data
data.LW1 = [ ... % total length (cm), wet weight (g) 
6.153	6.590	6.866	7.085	7.292	8.616	9.064	9.110	9.260	9.605	9.824	10.031	9.997	10.181	10.296	10.595	10.537	11.044	10.894	11.148	11.205	11.389	11.493	11.562	11.608	11.803	11.896	11.988	12.126	12.114	12.137	12.287	12.505	12.666	12.759	12.494	12.218	12.264	12.506	12.656	12.874	13.058	13.242	13.415	13.300	12.886	13.128	13.519	13.703	13.749	14.094	14.094	13.737	13.611	14.002	14.209	14.382	14.531	14.727	14.520	14.497	14.670	14.727	15.049	15.245	15.141	14.923	15.038	14.866	15.015	15.245	15.372	15.475	15.671	15.429	15.407	15.614	15.614	15.959	15.947	16.051	16.281	16.523	16.523	17.351	17.053	17.387	17.237	18.055	18.135	18.249	18.572	18.733	18.952	19.239	19.009	18.733	18.848	18.607	18.584	18.631	18.872	18.872	19.044	19.079	19.355	19.527	19.861	20.149	19.493	19.655	19.505	19.517	19.815	20.115	20.276	20.046	20.115	19.713	20.219	20.449	20.541	20.829	21.254	19.864	19.761	20.278	20.519	21.059	21.727	21.738	21.140	21.210	21.659	21.831	22.015	22.716	22.659	22.257	22.361	22.235	22.281	22.638	22.614	22.729	23.546	23.236	23.731	24.112	24.238	24.135	23.537	24.309	;
1.393	1.639	1.393	1.803	1.311	3.361	4.590	3.197	4.426	4.344	5.164	4.754	9.180	5.656	6.311	7.787	5.984	7.213	7.213	9.262	7.377	8.689	11.230	9.098	7.705	9.262	10.656	9.098	8.115	9.918	11.967	10.820	9.754	9.016	10.820	12.131	13.115	15.328	13.525	16.230	14.262	13.033	10.984	12.623	14.918	16.311	16.639	16.639	15.246	13.443	13.361	15.328	17.295	21.721	18.443	17.459	15.820	15.164	15.164	17.295	19.344	20.574	18.115	16.148	17.623	18.852	19.426	20.492	22.869	22.623	22.377	20.984	19.754	20.656	22.459	24.672	25.902	23.770	20.738	23.443	26.557	23.689	25.328	22.213	23.279	32.049	33.525	29.590	40.738	33.361	30.738	30.492	33.115	33.361	33.279	35.246	34.836	36.311	36.557	39.098	45.000	41.148	38.525	38.934	37.459	37.049	37.213	36.967	35.164	39.344	41.721	43.279	44.754	40.738	40.738	41.639	44.590	46.803	51.066	50.328	49.836	46.393	45.492	41.311	59.344	63.934	59.426	53.770	52.049	49.590	51.885	55.902	63.443	65.738	55.492	54.262	51.311	55.902	58.525	60.656	64.508	66.557	67.541	64.672	64.754	61.639	71.066	72.787	79.098	79.016	82.541	83.033	95.328	 
]';   
units.LW1 = {'cm', 'g'};     label.LW1 = {'total length', 'wet weight'};  
bibkey.LW1 = 'FeyWesl2017';
comment.LW1= 'Kongsfjorden and Rijpfjorden (Svalbard, Norway) between Sep - oct 2013';

data.LW = [ ... % total length (cm), wet weight (g) 
6.369	6.788	7.142	7.539	7.627	7.518	7.694	7.981	8.003	8.047	8.356	8.555	8.798	9.018	9.394	9.394	9.659	10.056	9.990	9.968	9.880	10.520	10.343	10.453	10.608	11.159	10.695	10.807	11.028	11.138	11.403	11.513	11.359	11.470	11.668	11.933	12.594	12.330	12.110	11.999	12.397	12.397	12.772	12.773	12.927	12.994	13.148	13.015	13.037	12.684	13.412	13.147	13.412	13.501	13.347	13.568	13.722	13.920	14.009	13.810	15.046	14.251	14.472	14.781	14.208	13.921	13.965	14.186	14.517	14.672	15.003	14.716	14.849	15.091	15.268	15.510	15.070	14.982	15.025	15.224	15.731	16.372	16.813	16.107	15.533	16.041	15.799	16.042	15.535	16.572	16.594	16.748	16.924	16.769	16.593	17.520	17.542	18.293	18.646	18.602	17.984	17.432	17.168	16.991	17.146	16.970	17.146	17.014	17.589	17.544	17.588	17.543	18.073	18.184	18.007	17.897	18.140	18.273	18.009	18.495	18.517	18.670	18.692	18.714	18.493	18.868	19.089	19.354	19.156	19.111	19.178	19.422	19.002	19.510	19.687	19.775	19.885	20.392	20.547	20.746	20.724	20.415	20.194	19.996	19.687	19.710	20.107	20.372	20.263	20.527	20.769	21.012	21.343	22.005	20.617	20.881	21.611	21.500	22.228	21.764	21.543	21.521	21.763	21.852	22.227	22.426	22.294	22.471	22.250	23.689	23.842	24.084	24.680	25.609	26.494	26.542	27.005	27.492	28.088	27.009	28.511	28.510	28.509	30.542	29.546	;
2.363	2.543	2.907	3.637	1.439	7.667	8.582	5.466	3.085	1.803	4.182	3.265	5.095	2.896	5.458	4.176	5.273	4.904	6.736	7.652	9.667	8.931	7.833	6.001	5.084	2.700	1.054	11.676	8.195	7.278	6.361	8.375	10.024	12.588	10.572	8.189	4.156	8.736	10.020	11.669	14.597	12.216	12.763	14.778	16.608	18.439	15.874	13.128	11.296	9.833	10.561	11.662	12.576	15.323	16.789	18.436	16.420	14.954	14.037	11.291	10.185	12.388	14.767	14.765	16.417	17.701	20.265	18.981	21.177	19.711	17.328	23.191	20.809	19.709	17.876	16.776	27.035	24.837	22.639	22.455	19.521	20.250	18.050	22.450	25.017	26.662	27.213	29.227	36.189	34.352	31.604	28.123	25.741	22.812	25.743	23.906	22.441	23.901	23.899	27.563	28.299	27.203	28.487	29.587	31.601	33.800	35.081	37.096	39.840	36.910	34.345	30.866	31.595	33.243	34.526	35.625	38.554	41.301	43.867	48.625	45.146	40.749	38.185	36.353	35.256	32.140	34.336	33.602	36.900	37.633	41.662	44.591	46.791	48.070	46.604	43.489	42.390	38.541	42.020	44.399	47.696	47.149	45.318	47.884	51.732	52.831	51.729	51.728	59.787	55.023	53.557	54.105	53.919	51.901	69.309	64.362	71.134	68.754	67.284	63.990	62.343	59.413	57.214	59.228	58.310	57.942	60.141	62.337	63.987	89.070	80.095	77.346	75.328	85.762	103.155	126.415	123.848	134.285	132.633	151.321	155.524	150.396	146.733	156.794	138.118	
    ]';   
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'NahrVarp2014';
comment.LW = 'Svalbard 2010- 2013; figure S1';

data.tL = [ ...
1	12.979
2	14.970
3	18.129
4	20.738
];
data.tL(:,1) = (data.tL(:,1) + 0.5) * 365; % d, 
units.tL = {'d', 'mm'};     label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(-1); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NahrVarp2014';
comment.tL = ['fig. 5, arctic, mature, add 0.5 year',...
    'temp is assumed -1 by taking the mooring data in the paper and an yearly average temperature of both Arctic and Atlantic fjords at 200m (adults being found at the bottom)'];

data.LN = [ ...
    11   7737
    13.5 11813
    19.5 36530
    ];
units.LN = {'cm', '#'};     label.LN = {'total length', 'egg number'};  
temp.LN = C2K(-1); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'NahrVarp2014';
comment.LN = ['Tab. 2, fish sampled in  Arctic fjord east of the FRAM straight.',...
    'temp is assume -1 by taking the mooring data in the paper and an yearly average temperature of both Arctic and Atlantic fjords at 200m (adults being found at the bottom)'];



% t-Ww data
data.tW1 = [ ...
0	    0
14	2.636
28	4.230
42	6.851
56	8.416
];  % g, 
data.tW1(:,2) = data.tW1(:,2) + 26.29; % change the data from change in wet weight to gram
units.tW1   = {'d', 'g'};  label.tW1 = {'time', 'wet weight'};  
temp.tW1    = C2K(0);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
W0.tW1 = 26.29; units.W0.tW1 = 'g'; label.W0.tW1 = 'initial weight';
bibkey.tW1 = 'HopTonn1997';
comment.tW1 = 'Fed to satiation with capelin pellets (Fig 2a, black circles).';

data.tW2 = [ ...
0.000	0
14	0.667
28	1.431
42	2.452
56	2.974
];  % g, 
data.tW2(:,2) = data.tW2(:,2) + 3.99; % change the data from change in wet weight to gram
units.tW2   = {'d', 'g'};  label.tW2 = {'time', 'wet weight'};  
temp.tW2    = C2K(0);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
W0.tW2 = 3.99; units.W0.tW2 = 'g'; label.W0.tW2 = 'initial weight';
bibkey.tW2 = 'HopTonn1997';
comment.tW2 = 'Fed to satiation with capelin pellets (Fig 2a, white circles)';
%
% larvae growth Bouchard et al 2016
data.tL2 = [ ... cm standard length, age d
4.439	5.848	6.018	5.762	4.695	4.823	5.463	5.933	6.189	6.659	7.598	7.982	8.537	8.793	9.006	8.665	7.896	7.256	7.896	6.829	6.957	7.683	8.280	7.768	6.957	7.427	7.768	8.280	9.220	9.689	9.902	10.884	10.159	9.646	8.750	8.878	10.073	11.354	11.738	12.335	12.421	11.311	11.268	10.671	9.945	9.646	9.091	8.494	9.561	10.287	12.506	11.951	10.927	10.671	10.201	9.433	10.543	11.311	12.506	14.854	13.360	12.591	14.171	15.707	16.348	16.049	15.067	14.470	13.274	12.720	12.250	11.738	12.079	10.927	11.482	12.634	13.530	14.171	14.512	14.341	14.982	15.665	16.305	16.689	15.921	15.323	15.110	15.707	16.220	16.817	17.713	17.628	16.646	15.707	14.982	14.085	13.659	14.512	15.366	17.543	18.866	19.805	20.829	19.037	18.439	17.244	16.732	15.963	15.707	15.921	16.945	17.585	17.970	18.909	19.378	20.402	21.768	22.793	21.640	20.872	19.976	19.506	19.207	20.402	21.171	22.024	21.640	20.488	20.018	19.933	19.378	18.652	18.994	18.012	18.866	19.549	20.402	19.591	20.189	20.915	21.854	22.280	22.195	22.366	19.037	20.189	20.488	21.085	21.256	21.598	22.238	22.835	23.988	24.628	24.457	26.122	25.226	24.884	24.970	24.457	23.433	22.707	23.262	21.939	22.409	22.537	22.665	24.073	24.287	24.970	25.311	26.933	27.232	27.701	23.305	23.091	24.287	24.628	24.884	27.659	27.104	26.378	26.933	26.207	25.226	25.951	26.421	25.695	28.512	29.280	28.512	30.689	29.409	27.530	;
2.543	1.565	3.912	5.672	6.259	9.193	12.323	14.670	10.758	8.606	4.694	0.978	5.868	6.455	8.411	11.149	9.389	11.345	13.301	16.039	18.973	18.582	20.342	21.907	21.125	27.384	24.841	24.059	22.494	20.147	18.973	20.538	23.276	25.623	26.601	31.296	28.753	23.863	26.210	24.254	22.298	30.122	33.056	31.687	31.883	33.643	35.208	37.751	40.293	36.577	35.403	37.751	39.315	41.467	43.619	44.988	49.682	45.379	38.533	35.208	40.685	43.814	43.227	43.032	47.531	51.247	47.531	47.922	47.335	48.704	50.856	56.528	58.680	56.333	64.548	64.156	64.156	65.134	62.396	60.049	58.484	54.963	56.919	59.462	60.636	62.396	65.917	65.330	63.178	63.765	64.156	66.895	67.873	69.633	71.785	73.350	71.394	80.000	75.892	69.829	64.352	63.765	68.460	71.589	74.328	75.110	77.653	82.347	83.521	87.824	88.998	88.215	81.369	76.479	75.110	74.132	71.980	78.435	78.240	76.479	77.262	80.391	82.152	80.587	80.391	84.108	83.325	83.130	86.259	84.108	87.628	87.237	91.345	96.626	95.844	95.257	94.670	92.127	89.976	90.367	87.042	87.824	90.367	93.301	101.711	102.298	101.125	102.103	105.428	100.342	99.560	98.582	88.411	93.692	97.213	98.386	97.800	99.756	102.298	105.428	104.059	104.254	106.797	105.428	107.579	112.274	116.381	114.230	112.861	109.340	106.015	110.513	107.579	108.557	125.379	123.423	119.315	116.577	122.445	117.751	119.511	120.880	122.836	123.227	127.531	142.005	133.399	132.616	126.357	127.531	130.660	138.093	150.024	151.589	
    ]';  % cm,standard length and time
data.tL2 = [data.tL2(:,2) data.tL2(:,1)];
% [Y,I]=sort(data.tL2(:,1)); data.tL2 = data.tL(I,:); % sort rows
units.tL2   = {'d', 'mm'};  label.tL2 = {'time since hatch', 'standard length'};  
temp.tL2   = C2K(1.5);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'BoucMoll2016';
comment.tL2 = ['south-eastern Beaufort Sea (2004 and 2008)',...
    '18 out of 21 larvae examined had empty guts so presumably low f for this data.', ...
    'temp is guessed.'];

%% set weights for all real data
weights = setweights(data, []);
%  weights.ab = 10 * weights.ab;
% weights.Ww0 = 10 * weights.Ww0;
% weights.Wwp = 0 * weights.Wwp;
% weights.Li = 10 * weights.Li;
% weights.Ni = 5 * weights.Ni;
% weights.Wwi = 0 * weights.Wwi; 
% % 
% weights.ap = 5 * weights.ap; 
% weights.tL8  = 0 * weights.tL8;
% weights.tW8  = 0 * weights.tW8;
% weights.LJX8 = 0 * weights.LJX8;
% weights.LJO8 = 0 * weights.LJO8;
% weights.LW8  = 0 * weights.LW8;
% weights.tL6  = 0 * weights.tL6;
% weights.tW6  = 0 * weights.tW6;
% weights.LJX6 = 0 * weights.LJX6;
% weights.LJO6 = 0 * weights.LJO6;
% weights.LW6  = 0 * weights.LW6;
% 
% weights.tW1 = 0 * weights.tW1;
% weights.tW2 = 0 * weights.tW2;
% 
% %weights.LW = 10 * weights.LW;
% weights.tL  = 3 * weights.tL;
% weights.tWwe = 5 * weights.tWwe;
% weights.TJO = 10 * weights.TJO;
% weights.TJO(end-10:end)  = 0 * weights.TJO(end-10:end);

weights.LN = 0.1 * weights.LN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;
%data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.v = 20 * weights.psd.v;

% weights.psd.kap = 5 * weights.psd.kap; % to prevent kappa from getting too low

%% pack auxData and txtData for output
auxData.temp      = temp;
auxData.treat     = treat;
auxData.expLength = expLength;
auxData.age        = age;
auxData.W0 = W0;
txtData.units     = units;
txtData.label     = label;
txtData.bibkey    = bibkey;
txtData.comment   = comment;

%% Group plots
set1 = {'LW','LW1'}; subtitle1 = {'NarVarp2014, FeyWesl2017'};
set2 = {'tL8','tL6','tL3','tL0'}; subtitle2 = {'growth 8, 6, 3, 0 degrees'};
set3 = {'tW8','tW6','tW3','tW0'}; subtitle3 = {'growth 8, 6, 3, 0 degrees'};
set4 = {'LJO8','LJO6','LJO3','LJO0'}; subtitle4 = {'respiration 8, 6, 3, 0 degrees'};
set5 = {'LJX8','LJX6','LJX3','LJX0'}; subtitle5 = {'tot. ingested 8, 6, 3, 0 degrees'};
set6 = {'LW8','LW6','LW3','LW0'}; subtitle6 = {'initial condition 8, 6, 3, 0 degrees'};

metaData.grp.sets = {set1; set2; set3; set4; set5; set6};
metaData.grp.subtitle = {subtitle1; subtitle2; subtitle3; subtitle4; subtitle5; subtitle6};

%% Discussion points
D1 = 'KunzFric2016: energy content of food 20.4 kJ/g dry weight (pers comm company making the food)';
D2 = 'We included only laboratory data and field data from individuals taken around Svalbard, with the exception of Lh, Lb and L-W for juveniles.';     
D3 = 'Some gonadal mass may be retained after spawning (not taken into consideration here).';
D4 = 'mod_2: error in temperature parameters of mod_1 are corrected, also an error in the input to several calls to tempcorr function in predict are fixed. Parameters are re-estimated.';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Most ubiquitous Arctic fish, found in diverse arctic and subarctic habitats ranging from brackish to fully marine waters, from coastal to offshore waters and from surface waters to great depths';
metaData.bibkey.F1 = 'BoucMoll2016'; 
F2 = 'Adults tend to avoid high temperatures';
metaData.bibkey.F2 = 'GrahHop1995'; 
F3 = 'Loses about half the body mass as eggs. Energy is taken mostly from liver but also muscle.';
metaData.bibkey.F3 = 'HopGrah1995b'; 
F4 = 'Larvae prey on: C. hyperboreus and C. glacialis';
metaData.bibkey.F4 = 'BoucMoll2016';
F5 = 'Feeds on amphipods, copepods, adults from the Arctic domain feed mostly on Themisto libellula (large Arctic amphipod)';
metaData.bibkey.F5 = {'HopGjos2013','NahrVarp2014'}; 
F6 = 'Has the largest and fewest eggs of all Gadidaes. Distribution associated with ice; especially characteristic of regisions between pack ice and drift ice. Main consumer of plankton in the Arctic seas.';
metaData.bibkey.F6 = 'Andr1954'; 

metaData.facts = struct('F1', F1,'F2', F2, 'F3', F3,'F4', F4, 'F5', F5, 'F6', F6);

%% Acknowledgment
metaData.acknowledgment = ['The creation of this entry was supported through',...
    'POLARISATION - Polar cod, lipid metabolism and disruption by polycyclic', ...
    'aromatic hydrocarbons - (01/2012-03/2016) NFR FRIPRO/fellesloftet 214184.'];

%% Links
metaData.links.id_CoL = 'MJS9'; % Cat of Life
metaData.links.id_ITIS = '164706'; % ITIS
metaData.links.id_EoL = '46564407'; % Ency of Life
metaData.links.id_Wiki = 'Boreogadus_saida'; % Wikipedia
metaData.links.id_ADW = 'Boreogadus_saida'; % ADW
metaData.links.id_Taxo = '44297'; % Taxonomicon
metaData.links.id_WoRMS = '126433'; % WoRMS
metaData.links.id_fishbase = 'Boreogadus-saida'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Boreogadus_saida}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nahr2017'; type = 'Misc'; bib = [...
'Author = {Nahrgang, Jasmine}, ' ...
'year = {2017}, '...
'howpublished = {unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DahlNahr2017'; type = 'Misc'; bib = [...
'Author = {Flemming Dahlke and Jasmine Nahrgang and Atle Mortensen and Velmurugu Puvanendran and Hans-Otto P{\"o}rtner and Daniela Storch}, ' ...
'year = {2017}, '...
'Note = {Supplement to: Dahlke, F et al. (in prep.): Effects of ocean warming and acidification on Atlantic cod and polar cod}, ' ...
'doi = {10.1594/PANGAEA.868126},'...
'Publisher = {PANGAEA: 10.1594/PANGAEA.868126}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KunzFric2016'; type = 'InCollection'; bib = [...
'Title    = {Individual whole-animal parameters of Polar cod (\emph{Boreogadus saida}) and Atlantic cod (\emph{Gadus morhua}) acclimated to ocean acidification and warming conditions},' ...
'Author   = {Kristina Lore Kunz and Stephan Frickenhaus and Silvia Hardenberg and Johansen Torild and Elettra Leo and Hans-Otto P{\"o}rtner and Matthias Schmidt and Heidrun Sigrid Windisch and Rainer Knust and Felix Christopher Mark},'...
'Publisher = {PANGAEA},'...
'Booktitle = {New encounters in Arctic waters: a comparison of metabolism and performance of polar cod (\emph{Boreogadus saida}) and Atlantic cod (\emph{Gadus morhua}) under ocean acidification and warming.}, ' ...
'Editor = {Kunz, K. L. et al.}, ' ...
'Year = {2016},'...
'Note = {In supplement to:  Polar Biology, 39(6), 1137-1153; 10.1594/PANGAEA.867390},'...
'doi = {10.1007/s00300-016-1932-z}'];
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
bibkey = 'BoucMoll2016'; type = 'Article'; bib = [ ... 
'author = {Bouchard, Caroline and Mollard, Salom{\''e} and Suzuki, Keita and Robert, Dominique and Fortier, Louis}, ' ... 
'year = {2016}, ' ...
'title = {Contrasting the early life histories of sympatric {A}rctic gadids \emph{Boreogadus saida} and \emph{Arctogadus glacialis} in the {C}anadian {B}eaufort {S}ea}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {39}, ' ...
'number = {6}, '...
'pages = {1005--1022}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NahrVarp2014'; type = 'Article'; bib = [ ... 
'author = {Nahrgang, Jasmine and Varpe, \{O}ystein and Korshunova, Ekaterina and Murzina, Svetlana and Hallanger, Ingeborg G. and Vieweg, Ireen and Berge, J\{o}rgen}, ' ... 
'year = {2014}, ' ...
'title = {Gender Specific Reproductive Strategies of an {A}rctic Key Species (\emph{Boreogadus saida}) and Implications of Climate Change}, ' ...
'journal = {PLOS ONE}, ' ...
'volume = {9}, ' ...
'doi = {10.1371/journal.pone.0098452}, '...
'pages = {1-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Crai1982'; type = 'Article'; bib = [ ... 
'author = {P. C. Craig and W. B. Griffiths and L. Haldorson and H. McElderry}, ' ... 
'year = {1982}, ' ...
'title = {Ecological Studies of {A}rctic Cod (\emph{Boreogadus saida}) in {B}eaufort {S}ea Coastal Waters, {A}laska}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {39}, ' ...
'number = {3}, '...
'pages = {395--406}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HopGrah1995'; type = 'Article'; bib = [ ... 
'author = {Hop, Haakon and Graham, Mark}, ' ... 
'year = {1995}, ' ...
'title = {Respiration of juvenile {A}rctic cod (\emph{Boreogadus saida}): effects of acclimation, temperature, and food intake}, ' ...
'journal = {Polar Biology}, ' ...
'volume = {15}, ' ...
'number = {5}, '...
'doi = {10.1007/BF00238487}, '...
'pages = {359--367}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HopGrah1995b'; type = 'Article'; bib = [ ... 
'author = {Haakon Hop and Vance L. Trudeau and Mark Graham}, ' ... 
'year = {1995}, ' ...
'title = {Spawning energetics of {A}rctic cod (\emph{Boreogadus saida}) in relation to seasonal development of the ovary and plasma sex steroid levels}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {52}, ' ...
'number = {3}, '...
'doi = {10.1139/f95-055}, '...
'pages = {541--550}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HopGjos2013'; type = 'Article'; bib = [ ... 
'author = {Haakon Hop and Harald Gj{\o}saeter}, ' ... 
'year = {2013}, ' ...
'title = {Polar cod (\textit{Boreogadus saida}) and capelin (\emph{Mallotus villosus}) as key species in marine food webs of the {A}rctic and the {B}arents {S}ea}, ' ...
'journal = {Marine Biology Research}, ' ...
'volume = {9}, ' ...
'number = {9}, '...
'doi = {10.1080/17451000.2013.775458}, '...
'pages = {878--894}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'WalkPaul2011'; type = 'Article'; bib = [ ... 
'author = {Wojciech Walkusz and Joclyn E. Paulic and William J. Williams and Slawomir Kwasniewski and Michael H. Papst}, ' ... 
'year = {2011}, ' ...
'title = {Distribution and diet of larval and juvenile {A}rctic cod (\textit{Boreogadus saida}) in the shallow {C}anadian {B}eaufort {S}ea}, ' ...
'journal = {Journal of Marine Systems}, ' ...
'volume = {84}, ' ...
'number = {3}, '...
'doi = {10.1016/j.jmarsys.2010.09.001}, '...
'pages = {78--84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Aron1975'; type = 'Article'; bib = [ ... 
'author = {T.M. Aronovich and S.I. Doroshev and L.V. Spectorova and V.M. Makhotin}, ' ... 
'year = {1975}, ' ...
'title = {Egg incubation and larval rearing of navaga (\emph{Eleginus navaga} {P}all.), polar cod (\emph{Boreogadus saida} {L}epechin) and arctic flounder (\emph{Liopsetta glacialis} {P}all.) in the laboratory}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {6}, ' ...
'number = {3}, '...
'doi = {10.1016/0044-8486(75)90043-5}, '...
'url = {http://www.sciencedirect.com/science/article/pii/0044848675900435}, '...
'pages = {233--242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Andr1954'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Andriyashev, A. P.}, ' ...
'year = {1954}, ' ...
'title  = {Fishes of the Northern Seas of the U. S. S. R.}, ' ...
'publisher = {Izdatelstvo Akademii Nauk SSSR}, ' ...
'note = {translated from russian}, ' ...
'pages = {236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GrahHop1995'; type = 'Article'; bib = [ ... 
'author = {Graham, Mark and Haakon Hop}, ' ... 
'year = {1995}, ' ...
'title = {Aspects of Reproduction and Larval Biology of {A}rctic Cod (\emph{Boreogadus Saida})}, ' ...
'journal = {Arctic}, ' ...
'volume = {48}, ' ...
'number = {2}, '...
'url = {www.jstor.org/stable/40511636}, '...
'pages = {130--135}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FeyWesl2017'; type = 'Article'; bib = [ ... 
'author = {Dariusz P. Fey and Jan M. W\c{e}s\l{l}awski}, ' ... 
'year = {2017}, ' ...
'title = {Age, growth rate, and otolith growth of polar cod (\emph{Boreogadus saida}) in two fjords of {S}valbard, {K}ongsfjorden and {R}ijpfjorden}, ' ...
'journal = {Oceanologia}, ' ...
'volume = {59}, ' ...
'doi = {10.1016/j.oceano.2017.03.011}, '...
'url = {http://www.sciencedirect.com/science/article/pii/S0078323417300532}, '...
'pages = {576--584}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HopTonn1997'; type = 'Article'; bib = [ ... 
'author = {H Hop and W M Tonn and H E Welch}, ' ... 
'year = {1997}, ' ...
'title = {Bioenergetics of Arctic cod (\emph{Boreogadus saida}) at low temperatures}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {54}, ' ...
'number = {8}, '...
'pages = {1772-1784}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'KentDros2016'; type = 'Article'; bib = [ ... 
'author = {D. Kent and H. E. Drost and J. Fisher and T. Oyama and A. P. Farrell}, ' ... 
'year = {2016}, ' ...
'title = {Laboratory rearing of wild {A}rctic cod \textit{Boreogadus saida} from egg to adulthood}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {88}, ' ...
'doi = {10.1111/jfb.12893}, '...
'pages = {1241-1248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

