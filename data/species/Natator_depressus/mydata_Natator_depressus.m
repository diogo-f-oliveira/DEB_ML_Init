function [data, auxData, metaData, txtData, weights] = mydata_Natator_depressus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Cheloniidae';
metaData.species    = 'Natator_depressus'; 
metaData.species_en = 'Flatback turtle'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0bTd', 'biMcp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHa'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwh'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'}; 
metaData.data_1     = {'T-ah'; 'L0-Lt'; 'L-Ww'; 't-Ww'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Nicola Mitchell'};    
metaData.date_subm = [2019 06 24];              
metaData.email    = {'nicola.mitchell@uwa.edu.au'};            
metaData.address  = {'School of Biological Sciences, University of Western Australia'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2019 06 28];

%% set data
% zero-variate data

data.ah = 51.23;  units.ah = 'd';      label.ah = 'age at hatching';        bibkey.ah = 'Bent2017';   
  temp.ah = C2K(29.85);   units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah =' derived from laboratory incubation of 13 Eighty Mile Beach eggs, so that time before exiting nest does not need to be accounted for; same eggs used for Lh, Ww0 and Wwh';
data.ab = 51.23 + 6;    units.ab = 'd';      label.ab = 'age at birth';        bibkey.ab = 'Bent2017';   
  temp.ab = C2K(29.85);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'age at birth = age at hatching + 2 days to exit the nest + 4 days relying on yolksac (6d)';
data.ap = 19 * 365;    units.ap = 'd';      label.ap = 'age at puberty';      bibkey.ap = 'Limp2007';
  temp.ap = C2K(26);   units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '21yrs to first nesting in Limp2007 and allocation to reproduction begins 2 years earlier, temperature based on data from tagged flatbacks in Western Australia';
data.am = (21+30+20)*365;      units.am = 'd';      label.am = 'life span';           bibkey.am = 'Limp2007';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '21yrs to first breeding + 30 years of nesting thereafter at Mon Repos in Queensland - but not the same female. Limp2007,';

data.Lh  = 5.461;   units.Lh  = 'cm';  label.Lh  = 'SCL at hatching';    bibkey.Lh  = 'Bent2017'; 
  comment.Lh = 'average SCL of 13 hatchlings from multiple females, same eggs used for Ah, Ww0 and Wwh';
data.Lb  = data.Lh;   units.Lb  = 'cm';  label.Lb  = 'SCL at birth';   bibkey.Lb  = 'Bent2017';  
  comment.Lb = 'length at hatching and emergence is approximately the same as L_b';
data.Lp  = 82.7;   units.Lp  = 'cm';  label.Lp  = 'CCL at puberty'; bibkey.Lp  = 'WaayStub2016';
  comment.Lp = '82.7 cm reported as minimum CCL of a nesting female at Cemetery Beach';  
data.Li  = 98.5;   units.Li  = 'cm';  label.Li  = 'ultimate CCL';   bibkey.Li  = 'WaayStub2016'; 
  comment.Li = 'maximum CCL of a nesting female at Port Headland; 100 cm for a female from Peak Island, QLD'; 

data.Ww0 = 66.54;   units.Ww0 = 'g';   label.Ww0 = 'wet weight of egg';     bibkey.Ww0 = 'Bent2017';
 comment.Ww0 = 'average mass of 9 eggs from multiple females, same eggs used for ah, Lh and Wwh';
data.Wwh = 45.42;   units.Wwh = 'g';   label.Wwh = 'wet weight at hatching';     bibkey.Wwh = 'Bent2017';
 comment.Wwh = 'average mass of 9 hatchlings from multiple females, same eggs used for ah, Lh and Ww0';
data.Wwp = 60e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Limp2007';
data.Wwi = 94.8e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'DBCA2019';
comment.Li = '94.8 kg reported as the heaviest female weighed at Thevernard Island'; 

data.E0 = 323e3; units.E0  = 'J'; label.E0  = 'initial energy content of the egg'; bibkey.E0  = {'VenkKann2005', 'Wine2016', 'RuslBoot2016', 'StubMitc2019'};  
comment.E0 = 'Average energy density of eggs in refs, multiplied by average dry yolk mass from nine Eighty Mile Beach eggs. d_Y is assumed higher than d_E, as in green turtle entry (StubMitc2019).';
data.Ri  = 2.84 * 46.6/ (1.6 * 365); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri = 'Limp2007';   
% if changing the numbers for calculating R_i, change also numbers for calculating fecund.LF in line 490
temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; % temp for reproduction assumed to be the same as temp for growth
comment.Ri = 'calculated as number of nests per nesting season (2.84,{Mon Repos,Limp1984}) multiplied by number of eggs per clutch (46.6, consistent for three WA rookeries, Pend2014}) and divided by the interval between two nesting seasons (1.5 yr,{Cemetery Beach, WaayStub2016})';
 
%% uni-variate data

%% FIELD DATA

% lengths - weight
data.LW_roeadlt = [56.5	61.4	72.9	79.8	80.7	80.8	81.4	83.4	83.5	84.5	84.8	85.5	85.7	85.7	85.8	85.8	85.9	85.9	86.8	87.2	87.4	87.4	87.5	87.5	87.6	87.8	88	89.3	89.7	90	90.6	91	91.8	92.6; % cm, CCL at f 
            22500	28500	46000	59000	65500	60500	56500	70500	79000	76000	72500	69500	79000	76000	73500	78500	74500	84500	70500	84500	81500	84500	81500	76500	82500	75000	79500	79500	80500	86500	83500	94500	84500	93500]';  % g, wet weight at f
units.LW_roeadlt = {'cm', 'g'};     label.LW_roeadlt = {'CCL', 'wet weight'};  bibkey.LW_roeadlt = 'DBCA2019';
comment.LW_roeadlt = 'sub adults and adults captured in water at Roebuck Bay, WA (primarily used to determine shape parameter for CCL data)';

%% lengths and weight of nesting females from Thevenard Island, WA (primarily used to determine shape parameter for CCL data)
data.LW_thevfem = [85.1	85.5	85.5	87	87.5	88.4	89	89.1	89.2	89.5	89.7	90.1	90.4	90.5	92.3	92.9	92.9	93	94.3	95; % cm, CCL at f 
            66000	67300	70200	70620	71280	77100	77150	77400	84000	74000	83600	90800	72000	88500	75500	87200	88100	81200	94800	79700]';  % g, wet weight at f
units.LW_thevfem = {'cm', 'g'};     label.LW_thevfem = {'CCL', 'wet weight'};  bibkey.LW_thevfem = 'DBCA2019';
comment.LW_thevfem = 'all females in this dataset have just deposited a clutch';

%% lengths between recaptures of nesting females from Port Headland (females have virtually stopped growing)
L0Lt = [ ... first capture (CCL, cm)	second capture	 (CCL, cm), time between captures (days)
83.9	84.1	3263
84      84.3	3274
85.1	85.6	2891
85.5	86.6	2894
86      86.1	1073
86.1	86.4	3282
86.4	86.5	2930
86.7	86.9	3280
87      87.4	2883
87.5	88      3283
87.5	88.7	3270
87.6	88.3	2906
88      88.2	3274
88      88.3	2919
88.1	89.1	3254
88.3	88.4	3259
88.5	89      2924
88.6	88.7	3265
88.8	90.5	3279
88.8	89.4	3264
88.9	89.3	3268
89      89.3	3267
89      90.9	2920
89      89.9	2858
89.2	89.4	3271
89.2	90.6	3281
89.2	90.3	3265
89.5	90.3	3288
89.5	89.6	2900
89.6	89.9	1810
89.8	90.9	3246
89.8	89.9	2919
90      91.2	2886
90.1	91      3285
90.2	90.4	2874
90.5	90.6	2866
90.6	90.9	2153
90.6	91.1	3256
90.8	91.4	3263
90.9	91.8	3276
91.3	92.9	3273
91.4	91.6	3268
92      94.1	3251
93.3	93.5	2901
93.5	94.5	2934
94.9	95.2	3267
];
%L0Lt = sortrows(L0Lt); % sort by first column in ascending order 
data.L0Lt = L0Lt(:,[1,2]);
units.L0Lt = {'cm','cm'}; label.L0Lt={'CCL at first capture','CCL at second capture'}; bibkey.L0Lt='DBCA2019';
temp.L0Lt =C2K(28); units.temp.L0Lt = 'K'; label.temp.L0Lt='temperature'; %average water temperature
time.L0Lt = L0Lt(:,3); units.time.L0Lt = 'd'; label.time.L0Lt = 'time between captures';
treat.L0Lt = {0}; units.treat.L0Lt = ''; label.treat.L0Lt = '';
comment.L0Lt ='time between captures varies, see mydata file.';

%% age-hatch
data.Tah = [28	28	28	28	28	28	28	28	28	28	28.16	28.16	28.16	28.16	28.16	28.16	28.16	28.16	28.16	28.16	28.16	28.16	28.33	28.33	28.33	28.33	28.33	28.33	28.33	28.33	28.33	28.33	28.33	28.56	28.56	28.56	28.56	28.56	28.56	28.56	28.56	28.56	28.56	28.9	28.9	28.9	28.9	28.9	28.9	28.9	28.9	28.93	28.93	28.93	28.93	28.93	28.93	28.93	29.11	29.11	29.11	29.11	29.11	29.11	29.11	29.11	29.11	29.11	29.11	29.28	29.28	29.28	29.28	29.28	29.28	29.28	29.28	29.28	29.28	29.28	29.28	29.3	29.3	29.3	29.3	29.3	29.3	29.3	29.3	29.3	29.3	29.3	29.3	29.44	29.44	29.44	29.44	29.44	29.44	29.44	29.44	29.44	29.44	29.44	29.44	29.56	29.56	29.56	29.56	29.56	29.56	29.56	29.56	29.56	29.56	29.77	29.77	29.77	29.77	29.77	29.77	29.77	29.77	29.77	29.77	32	32	32	32	32	32	32	32	32	32; % K, incubation temperature (oC)
            55	55	56	57	57	56	56	55	56	57	56	61	58	57	56	58	55	58	58	56	57	57	61	58	61	59	59	60	58	60	60	58	58	58	59	59	59	58	59	59	59	59	60	59	60	58	58	59	61	58	59	57	56	55	55	55	55	61	56	56	58	56	61	56	57	57	56	55	56	54	54	54	54	54	54	54	54	54	54	54	54	52	51	52	52	51	52	51	53	52	50	52	50	54	54	53	55	54	53	55	54	53	53	54	55	54	54	55	55	53	54	53	52	55	53	50	51	50	51	52	51	50	53	52	53	43	43	44	43	45	44	43	43	43	43
]'; % d, age at hatch
        data.Tah(:,1) = C2K(data.Tah(:,1));
units.Tah = {'K', 'd'};     label.Tah = {'incubation temperature', 'age at hatching'};  bibkey.Tah = 'Bent2017';
comment.Tah = 'Lab data at constant tmeperature';


%% length and weight of turtles reared from hatching at AQWA, Perth by Mike Salmon and Jeanette Wyneken
% first measurement is length and weight at 2 days before birth (birth is defined as onset of feeding)
% these points are used in predict file as weight at hatch, but can be excluded

%Clutch 1 hatchlings
%hatchling 1-1 
data.LW_11 = [6    6.53	7.31	7.92	8.22	8.54	8.95	9.48	9.75	10.18	10.57	10.73	10.88	11.18	11.58	12	12.12	12.54	12.91;    % cm, SCL at f,
            35.4     44.9	55.3	71.9	76.4	88.7	84.6	102.9	121.4	128.4	147	157.4	159.2	176.1	199.9	227.6	236.7	257.3	282.0]';  % g, wet weight at f and T
units.LW_11 = {'cm', 'g'};     label.LW_11 = {'SCL', 'wet weight'};  bibkey.LW_11 = 'Salm2017';

%hatchling 1-2
data.LW_12 = [6  6.63	7.08	7.72	8.01	8.07	8	8.82	9.3	9.16	10.03	10.22	10.38	10.74	11.22	11.63	12.01	12.51	13.14; % cm, SCL at f,
            36.3  46.3	54.1	69.8	72.6	74.5	73.6	88.4	103.8	110.9	130.8	139.6	145.1	153.1	179.1	209.9	241.5	266.5	315.0]';  % g, wet weight at f and T
units.LW_12 = {'cm', 'g'};     label.LW_12 = {'SCL', 'wet weight'};  bibkey.LW_12 = 'Salm2017';

%hatchling 1-3
data.LW_13 = [6.1  6.46	7.29	7.88	8.05	8.28	8.61	9.14	9.36	9.91	10.34	10.51	10.93	11.21	11.7	12.21	12.62	12.87	13.38; % cm, SCL at f,
            38  43.3	55.8	70.7	72.6	77.9	79.3	92.5	105.1	117.0	138.3	152.6	159.9	170.6	195.2	226.2	263.7	281.7	307.5]';  % g, wet weight at f and T
units.LW_13 = {'cm', 'g'};     label.LW_13 = {'SCL', 'wet weight'};  bibkey.LW_13 = 'Salm2017';

%hatchling 1-4
data.LW_14 = [5.77	6.45	7.05	7.8	8.08	8.27	8.65	9.16	9.65	10.11	10.39	10.54	10.76	10.87	11.07	11.34	11.65	12.23	12.63;      % cm, SCL at f,
            33.5  41.9	51.8	68.8	72.8	78.1	76.8	91.2	114.5	125.7	137.9	150.4	147.0	155.8	160.3	181.5	209.3	225.0	264.8]';  % g, wet weight at f and T
units.LW_14 = {'cm', 'g'};     label.LW_14 = {'SCL', 'wet weight'};  bibkey.LW_14 = 'Salm2017';

%hatchling 1-5
data.LW_15 = [5.6	5.99	6.7	7.16	7.46	7.67	7.95	8.46	8.93	9.33	9.53	9.81	9.85	9.98	10.06	10.12	9.96	9.93	10.21;      % cm, SCL at f,
            32.2  38.2	47.9	55.8	65	52.2	63.9	77.1	97.8	100.1	116.1	125.3	118.8	129.5	126.5	132.4	106.4	115.5	151.5]';  % g, wet weight at f and T
units.LW_15 = {'cm', 'g'};     label.LW_15 = {'SCL', 'wet weight'};  bibkey.LW_15 = 'Salm2017';


%Clutch 2 hatchlings
%hatchling 2-1
data.LW_21 = [6.01	6.46	6.91	7.27	7.6	7.75	8.02	8.56	9	9.47	9.76	10	9.99	10.15	10.42	10.64	10.63	10.91	11.23;      % cm, SCL at f,
            35.3  43.6	49.2	58.2	60.0	65.4	65.2	80.5	98.4	108.6	117.8	120.9	121.1	128.3	140.1	144.8	149.5	162.9	185.1]';  % g, wet weight at f and T
units.LW_21 = {'cm', 'g'};     label.LW_21 = {'SCL', 'wet weight'};  bibkey.LW_21 = 'Salm2017';

%hatchling 2-2
data.LW_22 = [6.01	6.52	7.13	7.92	7.95	8.2	8.62	9.2	9.69	9.98	10.22	10.12	10.55	10.72	11.02	11.21	11.43	11.49	11.63;      % cm, SCL at f,
            36.5 43.7	54.6	75.2	69.3	81.6	81.8	93.2	112.0	122.5	139.1	135.2	143.3	151.9	160.6	170.0	177.6	177.2	200.5]';  % g, wet weight at f and T
units.LW_22 = {'cm', 'g'};     label.LW_22 = {'SCL', 'wet weight'};  bibkey.LW_22 = 'Salm2017';

%hatchling 2-3
data.LW_23 = [6.1	6.42	7.27	7.64	8.3	8.72	9.42	9.67	9.9	10.5	10.89	11.11	11.22	11.21	11.14	11.22	11.5	11.48	11.91;      % cm, SCL at f,
            38  43.3	55.8	70.7	72.6	77.9	79.3	92.5	105.1	117.0	138.3	152.6	159.9	170.6	195.2	226.2	263.7	281.7	307.5]';  % g, wet weight at f and T
units.LW_23 = {'cm', 'g'};     label.LW_23 = {'SCL', 'wet weight'};  bibkey.LW_23 = 'Salm2017';

%hatchling 2-4
data.LW_24 = [6  6.4	7.13	7.8	8.2	8.44	8.79	9.42	9.84	10.05	10.41	10.24	10.88	11.22	11.57	12.14	12.54	12.84	13.3;      % cm, SCL at f,
            35.3  43.5	55.9	71.1	79.1	89.5	87.2	98.4	119.2	127.7	138	155.9	161.4	178.5	199.4	230.1	255.8	284.4	321.4]';  % g, wet weight at f and T
units.LW_24 = {'cm', 'g'};     label.LW_24 = {'SCL', 'wet weight'};  bibkey.LW_24 = 'Salm2017';

%hatchling 2-5
data.LW_25 = [5.91	6.46	7.32	8.08	8.5	8.98	9.32	9.7	10.06	10.43	10.9	11.16	11.5	11.9	12.33	13	13.48	13.78	14.47;      % cm, SCL at f,
            33.7 45.8	59.5	82.8	88.8	109.6	100.3	118.2	134.5	151.5	170.4	181.2	204.0	221.1	256.0	298.8	342.8	373.3	420.3]';  % g, wet weight at f and T
units.LW_25 = {'cm', 'g'};     label.LW_25 = {'SCL', 'wet weight'};  bibkey.LW_25 = 'Salm2017';


%Clutch 3 hatchlings
%hatchling 3-1
data.LW_31 = [6.22	6.91	7.61	8.04	8.25	8.97	9.42	9.63	9.81	10	10.01	10.27	10.43	10.83	11.02	11.49	11.89	12.19	12.73;      % cm, SCL at f,
            39.8  48.2	57.2	67.7	73.9	87.6	90.1	92.1	109.9	106.5	111.9	124.7	123.0	140.1	149.0	175.4	188.3	204.6	242.3]';  % g, wet weight at f and T
units.LW_31 = {'cm', 'g'};     label.LW_31 = {'SCL', 'wet weight'};  bibkey.LW_31 = 'Salm2017';

%hatchling 3-2
data.LW_32 = [5.85	6.3	6.99	7.42	7.9	8.36	8.98	9.41	9.76	10.27	10.74	11	11.19	11.56	12.01	12.35	12.65	13	13.45;      % cm, SCL at f,
            32.3  37.9	47.1	63.6	67.5	78.1	79.9	94.9	109.6	130.6	160.7	159.7	170.5	189.4	211.8	241.7	258.8	284.0	330.4]';  % g, wet weight at f and T
units.LW_32 = {'cm', 'g'};     label.LW_32 = {'SCL', 'wet weight'};  bibkey.LW_32 = 'Salm2017';

%hatchling 3-3
data.LW_33 = [5.98	6.61	7.4	8.06	8.5	9	9.26	9.61	9.99	10.22	10.53	10.74	10.88	11.13	11.49	12.1	12.21	12.51	12.92;      % cm, SCL at f,
            37.1  45.5	54.8	71.0	81.9	87.9	87.1	96.7	110.3	115.1	132.0	140.5	148.1	155.8	178.2	208.0	210.6	235.5	268.7]';  % g, wet weight at f and T
units.LW_33 = {'cm', 'g'};     label.LW_33 = {'SCL', 'wet weight'};  bibkey.LW_33 = 'Salm2017';

%hatchling 3-4
data.LW_34 = [6.08	6.74	7.01	8.05	8.48	8.72	9.05	9.44	9.74	9.9	10.14	10.53;      % cm, SCL at f,
            40.02 49.0	59.4	73.8	82.9	88.1	88.2	98.3	111.9	114.1	126.5	131.2]';  % g, wet weight at f and T
units.LW_34 = {'cm', 'g'};     label.LW_34 = {'SCL', 'wet weight'};  bibkey.LW_34 = 'Salm2017';

%hatchling 3-5
data.LW_35 = [5.84	6.3	6.88	7.32	7.41	7.31	7.65	8.24	8.84	9.08	9.37	9.52	9.79	9.99	10.07	10.49	10.71	10.84	11.01;      % cm, SCL at f,
            32.4  37.8	45.8	56.4	57.1	56.2	54.2	68.6	81.2	90.2	100.1	108.8	112.5	116.4	128.5	146.9	156.8	159.1	173.9]';  % g, wet weight at f and T
units.LW_35 = {'cm', 'g'};     label.LW_35 = {'SCL', 'wet weight'};  bibkey.LW_35 = 'Salm2017';

%hatchling 3-6
data.LW_36 = [5.64	6.18	6.71	7.18	7.28	7.79	8.12	8.64	9.17	9.52	9.96	10.19	10.24	10.58	10.65	11.2	11.54	12.01	12.57;      % cm, SCL at f,
            29.6  34.9	42.1	52.5	56.2	63.6	64.4	72.8	90.7	104.4	121.2	122.2	132.5	141.2	148.7	179.4	212.6	231.6	267.3]';  % g, wet weight at f and T
units.LW_36 = {'cm', 'g'};     label.LW_36 = {'SCL', 'wet weight'};  bibkey.LW_36 = 'Salm2017';

%hatchling 3-7
data.LW_37 = [6.02	6.52	7.2	7.82	8.37	8.8	9.13	9.42	9.69	10.18	10.36	10.77	10.99	11.15	11.4	11.84	12.12	12.38	12.87;      % cm, SCL at f,
            36.4  42.5	54.2	73.3	79.1	95.0	89.0	97.8	116.3	129.2	135.1	159.5	158.0	170.6	178.4	217.5	234.1	227.0	286.2]';  % g, wet weight at f and T
units.LW_37 = {'cm', 'g'};     label.LW_37 = {'SCL', 'wet weight'};  bibkey.LW_37 = 'Salm2017';

%hatchling 3-8
data.LW_38 = [6.02	6.28	6.94	7.46	7.9	8.13	8.43	8.99	9.19	9.76	9.88	10.16	10.83	10.52	11.73	11.04	11.25	11.52	11.97;      % cm, SCL at f,
            33.5	37.3	48.8	63.1	68.9	70.5	73.4	84.4	101.1	108.3	117.6	127.2	130.3	138.6	150.4	163.1	168.5	181.8	234.6]';  % g, wet weight at f and T
units.LW_38 = {'cm', 'g'};     label.LW_38 = {'SCL', 'wet weight'};  bibkey.LW_38 = 'Salm2017';


%Clutch 4 hatchlings
%hatchling 4-1
data.LW_41 = [5.9	6.59	7.48	7.8	8.1	8.55	8.89	9.2	9.68	10.23	10.64	10.88	10.99	11.16	11.34	11.86	12.1	12.55	12.95;      % cm, SCL at f,
            37.9  47.9	61.2	70.6	79.8	89.1	87.7	98.6	118.7	134.5	153.7	170.1	179.3	182.3	200.6	232.2	258.8	269.9	311.8]';  % g, wet weight at f and T
units.LW_41 = {'cm', 'g'};     label.LW_41 = {'SCL', 'wet weight'};  bibkey.LW_41 = 'Salm2017';

%hatchling 4-2
data.LW_42 = [6.01	6.5	7.45	7.88	8.21	8.65	9.03	9.57	9.86	10.37	10.7	10.92	10.98	11.33	11.62	11.79	12.1	12.34	12.99;      % cm, SCL at f,
            39.1  45.3	58.0	71.1	78.6	86.6	90.2	103.6	120.1	132.6	152.6	158.6	159.6	175.6	192.6	206.9	225.6	248.7	296.0]';  % g, wet weight at f and T
units.LW_42 = {'cm', 'g'};     label.LW_42 = {'SCL', 'wet weight'};  bibkey.LW_42 = 'Salm2017';

%hatchling 4-3
data.LW_43 = [6.2	6.79	7.64	8.16	8.58	9	9.55	9.94	10.34	10.72	11.04	11.01	11.29	11.27	11.48	11.91	12.23	12.65	13.15;      % cm, SCL at f,
            38.4  47.1	59.9	75.9	85.4	96.1	94.5	107.8	125.0	136.9	153.0	160.6	152.6	158.8	174.0	200.1	216.4	233.9	281.6]';  % g, wet weight at f and T
units.LW_43 = {'cm', 'g'};     label.LW_43 = {'SCL', 'wet weight'};  bibkey.LW_43 = 'Salm2017';


%Clutch 5 hatchlings
%hatchling 5-1
data.LW_51 = [5.8	6.29	7.08	7.64	8.1	8.67	8.96	9.13	9.58	9.99	10.27	10.52	10.61	11.03	11.47	11.99	12.17	12.41	12.69;      % cm, SCL at f,
            34  41.6	51.4	65.8	76.8	83.4	86.0	90.7	109.9	123.6	137.5	144.7	157.3	165.9	190.9	206.2	218.7	232.0	262.8]';  % g, wet weight at f and T
units.LW_51 = {'cm', 'g'};     label.LW_51 = {'SCL', 'wet weight'};  bibkey.LW_51 = 'Salm2017';

%hatchling 5-2
data.LW_52 = [6.13	6.6	7.28	7.62	8.1	8.52	8.98	9.33	9.63	10.26	10.56	10.81	11.1	11.38	11.68	12.17	12.6	13.17	13.76;      % cm, SCL at f,
            35.5  43.6	52.3	67.4	74.8	80.8	82.7	93.9	110.7	121.8	146.6	151.4	156.7	165.9	185.2	219.9	263.0	291.9	333.0]';  % g, wet weight at f and T
units.LW_52 = {'cm', 'g'};     label.LW_52 = {'SCL', 'wet weight'};  bibkey.LW_52 = 'Salm2017';

%hatchling 5-3
data.LW_53 = [6.01	6.67	7.41	7.88	8.28	8.68	9.09	9.73	10.18	10.46	10.74	10.94	11.19	11.51	11.75	12.16	12.57	12.81	13.24;      % cm, SCL at f,
            35.1  44.2	55.3	71.3	76.9	86.5	93.2	109.2	125.8	134.0	145.6	155.0	167.8	183.2	191.5	217.9	247.8	252.9	289.3]';  % g, wet weight at f and T
units.LW_53 = {'cm', 'g'};     label.LW_53 = {'SCL', 'wet weight'};  bibkey.LW_53 = 'Salm2017';

%hatchling 5-4
data.LW_54 = [5.92	6.52	7.27	7.88	8.25	8.65	9.19	9.54	9.77	10.36	10.64	10.99	11.11	11.61	12	12.4	12.68	13.21	13.62;      % cm, SCL at f,
            36.1  44.1	55.4	73.5	79.4	87.1	92.1	101.7	119.0	137.8	157.6	159.3	169.2	181.8	211.8	240.4	267.0	281.2	330.3]';  % g, wet weight at f and T
units.LW_54 = {'cm', 'g'};     label.LW_54 = {'SCL', 'wet weight'};  bibkey.LW_54 = 'Salm2017';

%hatchling 5-5
data.LW_55 = [6.03	6.57	7.2	7.81	8.22	8.5	8.77	9.21	9.49	9.98	10.43	10.82	11.16	11.55	11.73	12.31	12.47	12.86	13.19;      % cm, SCL at f,
            37.2  45.2	52.6	79.3	75.1	78.1	78.2	90.7	107.2	118.9	147.3	157.1	173.8	179.3	196.9	223.3	250.7	265.6	293.9]';  % g, wet weight at f and T
units.LW_55 = {'cm', 'g'};     label.LW_55 = {'SCL', 'wet weight'};  bibkey.LW_55 = 'Salm2017';


%Clutch 6 hatchlings
%hatchling 6-1
data.LW_61 = [5.41	5.99	6.56	6.94	7.17	7.3	7.8	8.38	8.89	9.11	9.32	9.51	9.52	9.74	9.84	10.1	10.37	10.56	10.91;      % cm, SCL at f,
            39.8  48.2	57.2	67.7	73.9	87.6	90.1	92.1	109.9	106.5	111.9	124.7	123.0	140.1	149.0	175.4	188.3	204.6	242.3]';  % g, wet weight at f and T
units.LW_61 = {'cm', 'g'};     label.LW_61 = {'SCL', 'wet weight'};  bibkey.LW_61 = 'Salm2017';

%hatchling 6-2
data.LW_62 = [6.1	6.52	7.16	7.68	8.05	8.81	8.9	9.52	9.97	10.33	10.61	10.99	10.98	11.44	11.53	11.62	11.89	11.91	12.29;      % cm, SCL at f,
              34.9  42.1	50.1	64.4	72.4	78.7	86.3	99	113.5	129.6	142.2	152.9	157.9	182.3	186.7	182.4	198.3	217.9	241.8]';  % g, wet weight at f and T
units.LW_62 = {'cm', 'g'};     label.LW_62 = {'SCL', 'wet weight'};  bibkey.LW_62 = 'Salm2017';

%hatchling 6-3
data.LW_63 = [6.13	6.53	7.26	7.8	8.42	8.98	9.56	9.71	10.04	10.28	10.56	10.71	10.81	11.13	11.42	11.94	12.41	12.82	13.42;      % cm, SCL at f,
              34.9  41.1	53.8	70.1	81.0	95.1	100.5	106.9	125.3	129.6	144.5	146.6	152.4	163.7	180.0	215.8	244.9	264.0	314.9]';  % g, wet weight at f and T
units.LW_63 = {'cm', 'g'};     label.LW_63 = {'SCL', 'wet weight'};  bibkey.LW_63 = 'Salm2017';

%hatchling 6-4
data.LW_64 = [5.99	6.57	7.25	7.92	8.37	8.63	9	9.43	9.89	10.32	10.66	10.68	10.86	11.22	11.3	11.67	12	12.1	12.72;      % cm, SCL at f,
              34.6  42.6	54.1	72.0	80.8	76.1	94.1	102.1	122.5	127.5	147.0	147.1	151.1	167.2	177.9	202.4	219.5	232.9	274.3]';  % g, wet weight at f and T
units.LW_64 = {'cm', 'g'};     label.LW_64 = {'SCL', 'wet weight'};  bibkey.LW_64 = 'Salm2017';

%hatchling 6-5
data.LW_65 = [5.82	6.24	7.02	7.57	7.97	8.47	8.86	9.42	9.82	10.19	10.57	10.73	10.82	10.89	10.91	11.02	11.36	11;      % cm, SCL at f,
              31.7  39.9	50.6	66.2	72.0	80.3	85.0	94.1	115.3	125.1	141.5	151.6	140.3	144.8	150.8	160.1	169.9	134.2]';  % g, wet weight at f and T
units.LW_65 = {'cm', 'g'};     label.LW_65 = {'SCL', 'wet weight'};  bibkey.LW_65 = 'Salm2017';

%hatchling 6-6
data.LW_66 = [6.01	6.5	7.23	7.72	8.06	8.44	8.9	9.23	9.43	9.99	10.37	10.51	10.58	10.94	10.99	11.13	11.45	11.6	12.01;      % cm, SCL at f,
              35.5  42.6	52.6	68.7	73.2	84.2	86.6	92.2	109.4	126.0	141.9	146.0	142.3	152.4	159.1	172.9	183.3	190.1	215.2]';  % g, wet weight at f and T
units.LW_66 = {'cm', 'g'};     label.LW_66 = {'SCL', 'wet weight'};  bibkey.LW_66 = 'Salm2017';

Clutch1 = [11, 12, 13, 14, 15 ]; Clutch2 = [21, 22, 23, 24, 25] ; Clutch3 = [31, 32, 33, 34, 35, 36, 37, 38 ]; 
 Clutch4 =[41, 42, 43] ;  Clutch5 = [51, 52, 53, 54, 55];  Clutch6 = [61, 62, 63, 64, 65, 66];
 Clutches = [Clutch1, Clutch2, Clutch3, Clutch4, Clutch4, Clutch5, Clutch6];
 
%% age and weight of turtles reared from hatching at AQWA, Perth by Mike Salmon and Jeanette Wyneken - refer Salmon et al. 2017
% first measurement is day 3 after hatching, but 2 days BEFORE onset of feeding = birth, so age then is -2. 
% All times corrected (by -5) after line 487
% Clutch 1 hatchlings
% hatchling 1-1 
data.tW_11 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     35.4	44.9	55.3	71.9	76.4	88.7	84.6	102.9	121.4	128.4	147	157.4	159.2	176.1	199.9	227.6	236.7	257.3	282.0]'; % g, wet weight at f and T
units.tW_11 = {'d', 'g'};     label.tW_11 = {'time', 'wet weight'};  bibkey.tW_11 = 'Salm2017';
temp.tW_11 = C2K(27.18); units.temp.tW_11 = 'K'; label.temp.tW_11 = 'temperature';

data.tW_12 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     36.3	46.3	54.1	69.8	72.6	74.5	73.6	88.4	103.8	110.9	130.8	139.6	145.1	153.1	179.1	209.9	241.5	266.5	315]'; % g, wet weight at f and T
units.tW_12 = {'d', 'g'};     label.tW_12 = {'time', 'wet weight'};  bibkey.tW_12 = 'Salm2017';
temp.tW_12 = C2K(27.18); units.temp.tW_12 = 'K'; label.temp.tW_12 = 'temperature';

data.tW_13 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     38	43.3	55.8	70.7	72.6	77.9	79.3	92.5	105.1	117	138.3	152.6	159.9	170.6	195.2	226.2	263.7	281.7	307.5]'; % g, wet weight at f and T
units.tW_13 = {'d', 'g'};     label.tW_13 = {'time', 'wet weight'};  bibkey.tW_13 = 'Salm2017';
temp.tW_13 = C2K(27.18); units.temp.tW_13 = 'K'; label.temp.tW_13 = 'temperature';

data.tW_14 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     33.5	41.9	51.8	68.8	72.8	78.1	76.8	91.2	114.5	125.7	137.9	150.4	147.0	155.8	160.3	181.5	209.3	225	264.8]'; % g, wet weight at f and T
 units.tW_14 = {'d', 'g'};     label.tW_14 = {'time', 'wet weight'};  bibkey.tW_14 = 'Salm2017';
temp.tW_14 = C2K(27.18); units.temp.tW_14 = 'K'; label.temp.tW_14 = 'temperature';

data.tW_15 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     32.2	38.2	47.9	55.8	65.0	52.2	63.9	77.1	97.8	100.1	116.1	125.3	118.8	129.5	126.5	132.4	106.4	115.5	151.5]'; % g, wet weight at f and T
units.tW_15 = {'d', 'g'};     label.tW_15 = {'time', 'wet weight'};  bibkey.tW_15 = 'Salm2017';
temp.tW_15 = C2K(27.18); units.temp.tW_15 = 'K'; label.temp.tW_15 = 'temperature';

% Clutch 2 hatchlings
% hatchling 2-1 
data.tW_21 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     35.3	43.6	49.2	58.2	60.0	65.4	65.2	80.5	98.4	108.6	117.8	120.9	121.1	128.3	140.1	144.8	149.5	162.9	185.1]'; % g, wet weight at f and T
units.tW_21 = {'d', 'g'};     label.tW_21 = {'time', 'wet weight'};  bibkey.tW_21 = 'Salm2017';
temp.tW_21 = C2K(27.18); units.temp.tW_21 = 'K'; label.temp.tW_21 = 'temperature';

% hatchling 2-2 
data.tW_22 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     36.5	43.7	54.6	75.2	69.3	81.6	81.8	93.2	112.0	122.5	139.1	135.2	143.3	151.9	160.6	170.0	177.6	177.2	200.5]'; % g, wet weight at f and T
units.tW_22 = {'d', 'g'};     label.tW_22 = {'time', 'wet weight'};  bibkey.tW_22 = 'Salm2017';
temp.tW_22 = C2K(27.18); units.temp.tW_22 = 'K'; label.temp.tW_22 = 'temperature';

% hatchling 2-3 
data.tW_23 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     33.5	44.0	55.4	68.8	77.5	89.5	93.0	106.6	121.9	132.9	152.6	162.1	158.5	173.5	168.0	170.2	191.4	192.7	203.3]'; % g, wet weight at f and T
units.tW_23 = {'d', 'g'};     label.tW_23 = {'time', 'wet weight'};  bibkey.tW_23 = 'Salm2017';
temp.tW_23 = C2K(27.18); units.temp.tW_23 = 'K'; label.temp.tW_23 = 'temperature';

% hatchling 2-4 
data.tW_24 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     35.3	43.5	55.9	71.1	79.1	89.5	87.2	98.4	119.2	127.7	138.0	155.9	161.4	178.5	199.4	230.1	255.8	284.4	321.4]'; % g, wet weight at f and T
units.tW_24 = {'d', 'g'};     label.tW_24 = {'time', 'wet weight'};  bibkey.tW_24 = 'Salm2017';
temp.tW_24 = C2K(27.18); units.temp.tW_24 = 'K'; label.temp.tW_24 = 'temperature';

% hatchling 2-5 
data.tW_25 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     33.7	45.8	59.5	82.8	88.8	109.6	100.3	118.2	134.5	151.5	170.4	181.2	204.0	221.1	256.0	298.8	342.8	373.3	420.3]'; % g, wet weight at f and T
units.tW_25 = {'d', 'g'};     label.tW_25 = {'time', 'wet weight'};  bibkey.tW_25 = 'Salm2017';
temp.tW_25 = C2K(27.18); units.temp.tW_25 = 'K'; label.temp.tW_25 = 'temperature';

% Clutch 3 hatchlings
% hatchling 3-1 
data.tW_31 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     39.8	48.2	57.2	67.7	73.9	87.6	90.1	92.1	109.9	106.5	111.9	124.7	123	140.1	149	175.4	188.3	204.6	242.3]'; % g, wet weight at f and T
units.tW_31 = {'d', 'g'};     label.tW_31 = {'time', 'wet weight'};  bibkey.tW_31 = 'Salm2017';
temp.tW_31 = C2K(27.18); units.temp.tW_31 = 'K'; label.temp.tW_31 = 'temperature';

% hatchling 3-2 
data.tW_32 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     32.3	37.9	47.1	63.6	67.5	78.1	79.9	94.9	109.6	130.6	160.7	159.7	170.5	189.4	211.8	241.7	258.8	284	330.4]'; % g, wet weight at f and T
units.tW_32 = {'d', 'g'};     label.tW_32 = {'time', 'wet weight'};  bibkey.tW_32 = 'Salm2017';
temp.tW_32 = C2K(27.18); units.temp.tW_32 = 'K'; label.temp.tW_32 = 'temperature';

% hatchling 3-3 
data.tW_33 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     37.1	45.5	54.8	71	81.9	87.9	87.1	96.7	110.3	115.1	132	140.5	148.1	155.8	178.2	208	210.6	235.5	268.7]'; % g, wet weight at f and T
units.tW_33 = {'d', 'g'};     label.tW_33 = {'time', 'wet weight'};  bibkey.tW_33 = 'Salm2017';
temp.tW_33 = C2K(27.18); units.temp.tW_33 = 'K'; label.temp.tW_33 = 'temperature';

% hatchling 3-4 
data.tW_34 = [3	8	15	22	29	36	43	50	57	64	71	78;  % d, time at wet weight
     40.2	49	59.4	73.8	82.9	88.1	88.2	98.3	111.9	114.1	126.5	131.2]'; % g, wet weight at f and T
units.tW_34 = {'d', 'g'};     label.tW_34 = {'time', 'wet weight'};  bibkey.tW_34 = 'Salm2017';
temp.tW_34 = C2K(27.18); units.temp.tW_34 = 'K'; label.temp.tW_34 = 'temperature';

% hatchling 3-5 
data.tW_35 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     32.4	37.8	45.8	56.4	57.1	56.2	54.2	68.6	81.2	90.2	100.1	108.8	112.5	116.4	128.5	146.9	156.8	159.1	173.9]'; % g, wet weight at f and T
units.tW_35 = {'d', 'g'};     label.tW_35 = {'time', 'wet weight'};  bibkey.tW_35 = 'Salm2017';
temp.tW_35 = C2K(27.18); units.temp.tW_35 = 'K'; label.temp.tW_35 = 'temperature';

% hatchling 3-6 
data.tW_36 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     29.6	34.9	42.1	52.5	56.2	63.6	64.4	72.8	90.7	104.4	121.2	122.2	132.5	141.2	148.7	179.4	212.6	231.6	267.3]'; % g, wet weight at f and T
units.tW_36 = {'d', 'g'};     label.tW_36 = {'time', 'wet weight'};  bibkey.tW_36 = 'Salm2017';
temp.tW_36 = C2K(27.18); units.temp.tW_36 = 'K'; label.temp.tW_36 = 'temperature';

% hatchling 3-7 
data.tW_37 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     36.4	42.5	54.2	73.3	79.1	95	89	97.8	116.3	129.2	135.1	159.5	158	170.6	178.4	217.5	234.1	227	286.2]'; % g, wet weight at f and T
units.tW_37 = {'d', 'g'};     label.tW_37 = {'time', 'wet weight'};  bibkey.tW_37 = 'Salm2017';
temp.tW_37 = C2K(27.18); units.temp.tW_37 = 'K'; label.temp.tW_37 = 'temperature';

% hatchling 3-8 
data.tW_38 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     33.5	37.3	48.8	63.1	68.9	70.5	73.4	84.4	101.1	108.3	117.6	127.2	130.3	138.6	150.4	163.1	168.5	181.8	234.6]'; % g, wet weight at f and T
units.tW_38 = {'d', 'g'};     label.tW_38 = {'time', 'wet weight'};  bibkey.tW_38 = 'Salm2017';
temp.tW_38 = C2K(27.18); units.temp.tW_38 = 'K'; label.temp.tW_38 = 'temperature';

% Clutch 4 hatchlings
% hatchling 4-1 
data.tW_41 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     37.9	47.9	61.2	70.6	79.8	89.1	87.7	98.6	118.7	134.5	153.7	170.1	179.3	182.3	200.6	232.2	258.8	269.9	311.8]'; % g, wet weight at f and T
units.tW_41 = {'d', 'g'};     label.tW_41 = {'time', 'wet weight'};  bibkey.tW_41 = 'Salm2017';
temp.tW_41 = C2K(27.18); units.temp.tW_41 = 'K'; label.temp.tW_41 = 'temperature';

% hatchling 4-2 
data.tW_42 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     39.1	45.3	58	71.1	78.6	86.6	90.2	103.6	120.1	132.6	152.6	158.6	159.6	175.6	192.6	206.9	225.6	248.7	296]'; % g, wet weight at f and T
units.tW_42 = {'d', 'g'};     label.tW_42 = {'time', 'wet weight'};  bibkey.tW_42 = 'Salm2017';
temp.tW_42 = C2K(27.18); units.temp.tW_42 = 'K'; label.temp.tW_42 = 'temperature';

% hatchling 4-3 
data.tW_43 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     38.4	47.1	59.9	75.9	85.4	96.1	94.5	107.8	125	136.9	153	160.6	152.6	158.8	174	200.1	216.4	233.9	281.6]'; % g, wet weight at f and T
units.tW_43 = {'d', 'g'};     label.tW_43 = {'time', 'wet weight'};  bibkey.tW_43 = 'Salm2017';
temp.tW_43 = C2K(27.18); units.temp.tW_43 = 'K'; label.temp.tW_43 = 'temperature';

% Clutch 5 hatchlings
% hatchling 5-1 
data.tW_51 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     34	41.6	51.4	65.8	76.8	83.4	86	90.7	109.9	123.6	137.5	144.7	157.3	165.9	190.9	206.2	218.7	232	262.8]'; % g, wet weight at f and T
units.tW_51 = {'d', 'g'};     label.tW_51 = {'time', 'wet weight'};  bibkey.tW_51 = 'Salm2017';
temp.tW_51 = C2K(27.18); units.temp.tW_51 = 'K'; label.temp.tW_51 = 'temperature';

% hatchling 5-2 
data.tW_52 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     35.5	43.6	52.3	67.4	74.8	80.8	82.7	93.9	110.7	121.8	146.6	151.4	156.7	165.9	185.2	219.9	263	291.9	333]'; % g, wet weight at f and T
units.tW_52 = {'d', 'g'};     label.tW_52 = {'time', 'wet weight'};  bibkey.tW_52 = 'Salm2017';
temp.tW_52 = C2K(27.18); units.temp.tW_52 = 'K'; label.temp.tW_52 = 'temperature';

% hatchling 5-3 
data.tW_53 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     35.1	44.2	55.3	71.3	76.9	86.5	93.2	109.2	125.8	134	145.6	155	167.8	183.2	191.5	217.9	247.8	252.9	289.3]'; % g, wet weight at f and T
units.tW_53 = {'d', 'g'};     label.tW_53 = {'time', 'wet weight'};  bibkey.tW_53 = 'Salm2017';
temp.tW_53 = C2K(27.18); units.temp.tW_53 = 'K'; label.temp.tW_53 = 'temperature';

% hatchling 5-4
data.tW_54 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     36.1	44.1	55.4	73.5	79.4	87.1	92.1	101.7	119	137.8	157.6	159.3	169.2	181.8	211.8	240.4	267	281.2	330.3]'; % g, wet weight at f and T
units.tW_54 = {'d', 'g'};     label.tW_54 = {'time', 'wet weight'};  bibkey.tW_54 = 'Salm2017';
temp.tW_54 = C2K(27.18); units.temp.tW_54 = 'K'; label.temp.tW_54 = 'temperature';

% hatchling 5-5 
data.tW_55 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     37.2	45.2	52.6	79.3	75.1	78.1	78.2	90.7	107.2	118.9	147.3	157.1	173.8	179.3	196.9	223.3	250.7	265.6	293.9]'; % g, wet weight at f and T
units.tW_55 = {'d', 'g'};     label.tW_55 = {'time', 'wet weight'};  bibkey.tW_55 = 'Salm2017';
temp.tW_55 = C2K(27.18); units.temp.tW_55 = 'K'; label.temp.tW_55 = 'temperature';

% Clutch 6 hatchlings
% hatchling 6-1 
data.tW_61 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     29.2	35.2	41	48.6	50.7	53.8	64.4	70.9	89.9	95.2	105.8	109.3	121	124.4	128.2	141.7	149.6	164.5	176.3]'; % g, wet weight at f and T
units.tW_61 = {'d', 'g'};     label.tW_61 = {'time', 'wet weight'};  bibkey.tW_61 = 'Salm2017';
temp.tW_61 = C2K(27.18); units.temp.tW_61 = 'K'; label.temp.tW_61 = 'temperature';

% hatchling 6-2 
data.tW_62 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     34.9	42.1	50.1	64.4	72.4	78.7	86.3	99	113.5	129.6	142.2	152.9	157.9	182.3	186.7	182.4	198.3	217.9	241.8]'; % g, wet weight at f and T
units.tW_62 = {'d', 'g'};     label.tW_62 = {'time', 'wet weight'};  bibkey.tW_62 = 'Salm2017';
temp.tW_62 = C2K(27.18); units.temp.tW_62 = 'K'; label.temp.tW_62 = 'temperature';

% hatchling 6-3 
data.tW_63 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     34.9	41.1	53.8	70.1	81	95.1	100.5	106.9	125.3	129.6	144.5	146.6	152.4	163.7	180	215.8	244.9	264	314.9]'; % g, wet weight at f and T
units.tW_63 = {'d', 'g'};     label.tW_63 = {'time', 'wet weight'};  bibkey.tW_63 = 'Salm2017';
temp.tW_63 = C2K(27.18); units.temp.tW_63 = 'K'; label.temp.tW_63 = 'temperature';

% hatchling 6-4 
data.tW_64 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     34.6	42.6	54.1	72	80.8	76.1	94.1	102.1	122.5	127.5	147	147.1	151.1	167.2	177.9	202.4	219.5	232.9	274.3]'; % g, wet weight at f and T
units.tW_64 = {'d', 'g'};     label.tW_64 = {'time', 'wet weight'};  bibkey.tW_64 = 'Salm2017';
temp.tW_64 = C2K(27.18); units.temp.tW_64 = 'K'; label.temp.tW_64 = 'temperature';

% hatchling 6-5 
data.tW_65 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113;  % d, time at wet weight
     31.7	39.9	50.6	66.2	72	80.3	85	94.1	115.3	125.1	141.5	151.6	140.3	144.8	150.8	160.1	169.9]'; % g, wet weight at f and T    
units.tW_65 = {'d', 'g'};     label.tW_65 = {'time', 'wet weight'};  bibkey.tW_65 = 'Salm2017';
temp.tW_65 = C2K(27.18); units.temp.tW_65 = 'K'; label.temp.tW_65 = 'temperature';

% hatchling 6-6 
data.tW_66 = [3	8	15	22	29	36	43	50	57	64	71	78	85	92	99	106	113	120	128;  % d, time at wet weight
     35.5	42.6	52.6	68.7	73.2	84.2	86.6	92.2	109.4	126	141.9	146	142.3	152.4	159.1	172.9	183.3	190.1	215.2]'; % g, wet weight at f and T
units.tW_66 = {'d', 'g'};     label.tW_66 = {'time', 'wet weight'};  bibkey.tW_66 = 'Salm2017';
temp.tW_66 = C2K(27.18); units.temp.tW_66 = 'K'; label.temp.tW_66 = 'temperature';


 for ii = 1: length(Clutches)
     cc = num2str(Clutches(ii));
     eval(['data.tW_', cc, '(:,1) = data.tW_', cc, '(:,1) -5 ;']) % % set to start from birth as age 0
     % if you want to completely exclude the first data pairs (for LW and tW), outcomment the two lines below, 
     % and also modify the predict file accordingly, otherwise you get dimension errors
%      eval(['data.LW_', cc, '(1,:) = [] ;']) % % set to start from birth as age 0
%      eval(['data.tW_', cc, '(1,:) = [] ;']) % % set to start from birth as age 0
     
 end

%% set weights for all real data

weights = setweights(data, []);

% zero-variate data:
weights.L0Lt = 10 * weights.L0Lt;
weights.Lp = 0 * weights.Lp;
weights.Li = 0 * weights.Li;
weights.ap = 0 * weights.ap;

% weights.ap =  weights.ap/10;       % give ap data less weight (only estimates available; large range likely)
% weights.Lp =  weights.Lp/10;       % give Lp little weight as there is virtually no growth after puberty, yet as this value is much lower than Li the model will predict continued growth
% weights.Wwp =  weights.Wwp/10;     % give Lp little weight as there is virtually no growth after puberty, yet as this value is much lower than Li the model will predict continued growth
% weights.ah =  weights.ah *10;      % give ah more weight given that fixing T_0 may cause a poor fit
% 
% % uni-variate data: divided by number of hatchlings (= number of data sets) to avoid overweighing a particular data type
% for ii = 1: length(Clutches)
%      cc = num2str(Clutches(ii));
%      eval(['weights.LW_', cc, '(:,1) = weights.LW_', cc, '/32 ;']) % there are 32 hatchlings in this data group 
%      eval(['weights.tW_', cc, '(:,1) = weights.tW_', cc, '/32 ;'])    
% end

% weights.Tah = weights.Tah * 10;    % important to fit this well given interest in predicting embryonic metabolic rates
 
%% set pseudodata and respective weights
[data, units, label, weights] =addpseudodata(data, units, label, weights);
data.psd.k = 0.75; units.psd.k ='-'; label.psd.k = 'maintenance ratio'; weights.psd.k = 0.5; 

%% pack auxData and txtData for output

auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots

set1 = {'LW_11','LW_12','LW_13','LW_14','LW_15'}; subtitle1 = {'SCL versus weight for five hatchlings from Clutch 1'};
set2 = {'LW_21','LW_22','LW_23','LW_24','LW_25'}; subtitle2 = {'SCL versus weight for five hatchlings from Clutch 2'};
set3 = {'LW_31','LW_32','LW_33','LW_34','LW_35','LW_36','LW_37','LW_38'}; subtitle3 = {'SCL versus weight for eight hatchlings from Clutch 3'};
set4 = {'LW_41','LW_42','LW_43'}; subtitle4 = {'SCL versus weight for three hatchlings from Clutch 4'};
set5 = {'LW_51','LW_52','LW_53','LW_54','LW_55'}; subtitle5 = {'SCL versus weight for five hatchlings from Clutch 5'};
set6 = {'LW_61','LW_62','LW_63','LW_64','LW_65','LW_66'}; subtitle6 = {'SCL versus weight for six hatchlings from Clutch 6'};
set7 = {'tW_11','tW_12','tW_13','tW_14','tW_15'}; subtitle7 = {'age versus weight for five hatchlings from Clutch 1'};
set8 = {'tW_21','tW_22','tW_23','tW_24','tW_25'}; subtitle8 = {'age versus weight for five hatchlings from Clutch 2'};
set9 = {'tW_31','tW_32','tW_33','tW_34','tW_35','tW_36','tW_37','tW_38'}; subtitle9 = {'age versus weight for eight hatchlings from Clutch 3'};
set10 = {'tW_41','tW_42','tW_43'}; subtitle10 = {'age versus weight for three hatchlings from Clutch 4'};
set11 = {'tW_51','tW_52','tW_53','tW_54','tW_55'}; subtitle11 = {'age versus weight for five hatchlings from Clutch 5'};
set12 = {'tW_61','tW_62','tW_63','tW_64','tW_65','tW_66'}; subtitle12 = {'age versus weight for six hatchlings from Clutch 6'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7,set8,set9,set10,set11,set12};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7,subtitle8,subtitle9,subtitle10,subtitle11,subtitle12};

%% Discussion points
D1 = ['Data from the Eighty Mile Beach population are calculated for f=0.985 based on the ratio of the size attained by the EMB population and '...
    'the size of the largest published flatback turtle record'];
D2 = ['We assume that the density of yolk is different than that of the density of reserve and structure. '...
    'The yolk density d_Y is introduced as an extra parameter (see also StubMitc2019 and AmP entry for Chelonia mydas).'];
D3 = ['Arrhenius temperatue calculated from data on incubation times from Bent2017, but we excluded the data from 32 C where development '...
    'rates start to decline. 3-parameter Arrhenius function describing an upper boundary for thermal tolerance has been added to capture '...
    'the slower rate of change of development rate at temperatures near the peak of 34 C.'];
D4 = ['Pseudodata point k has been modified to k=0.75 to be in line with other sea turtle models in the collection '...
    '(see StubMitc2019 and AmP entry for Chelonia mydas)'];
D5 = ['L_h for the captive-reared hatchlings based on their specified f, fixing t0 at 27 days (calculations exist for this, '...
    'but in essence the assumption is that growth begins at the same proportion of time to hatching - about 30% - as it does for '...
    'C. mydas. See StubMitc2019 for a discussion of t0'];
D6 = 'L0Lt data fit poorly as females grow very little after first nesting, yet the model predicts continued growth';
D7 = ['Comment on the entry version: This entry is a continuation of version 2017/07/14 by the same author. Changes introduced in '...
    'version 2017/11/12 (k = 0.3) were discarded - see discussion point 4. All discussion points relate to the current version.' ];
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5,'D6', D6,'D7', D7);

 

%% Links
metaData.links.id_CoL = '45TDR'; % Cat of Life
metaData.links.id_ITIS = '949133'; % ITIS
metaData.links.id_EoL = '791397'; % Ency of Life
metaData.links.id_Wiki = 'Natator_depressus'; % Wikipedia
metaData.links.id_ADW = 'Natator_depressus'; % ADW
metaData.links.id_Taxo = '93064'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Natator&species=depressus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Flatback_sea_turtle}},'...
'note = {Last accessed: 2019/06/26}'];
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
%%%
bibkey = 'Bent2017'; type = 'Misc'; bib = [ ...
'author = {Bentley, B.},' ...
'year = {2017},'...
'note = {Lab data collected at UWA, Perth by Blair Bentley}'];
eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DBCA2019'; type = 'Misc'; bib = [ ...
'author = {{Western Australian Department of Biodiversity, Conservation and Attractions}}, ' ...
'year = {2019}'];
eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Limp1984'; type = 'Article'; bib = [ ... 
'author = {Limpus, C.J. and Fleay, A. and Baker, V.}, ' ... 
'year = {1984}, ' ...
'title = {The flatback turtle, \textit{Chelonia depressus}, in {Q}ueensland: reproductive peridocity, philopatry and recruitment},' ...
'journal = {Australian Wildlife Research}, ' ...
'volume = {11}, ' ...
'pages = {579-587}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Limp2007'; type = 'Techreport'; bib = [ ... 
'author = {Limpus, C.}, ' ... 
'year = {2007},' ...
'institution = {Queensland Government Environmental Protection Agency: Brisbane}, ' ...
'title = {A biological review of {A}ustralian marine turtle species. 5. {F}latback turtle, \textit{Natator depressus},({G}arman)}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RuslBoot2016'; type = 'Article'; bib = [ ...  
'author = {Rusli, M.U. and Booth, D.T. and Joseph, J.},'...
'year = {2016},'...
'title = {Synchronous activity lowers the energetic cost of nest escape for sea turtle hatchlings},'...
'journal = {Journal of Experimental Biology},'...
'volume = {219},'...
'number = {10},'...
'pages = {1505-1513},'...
'doi = {10.1242/jeb.134742}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Salm2017'; type = 'Misc'; bib = [ ...
'author = {Salmon, M.}, ' ...
'year = {2017},'...
'note = {Turtles reared from hatching at AQWA, Perth by Mike Salmon and Jeanette Wyneken}'];
eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StubMitc2019'; type = 'Article'; bib = [ ... 
'author = {Stubbs, J. L. and Mitchell, N. J. and Marn, N. and Vanderklift, M. A. and Pillans, R. D. and Augustine, S.}, ' ... 
'year = {2019}, ' ...
'title = {A full life cycle Dynamic Energy Budget ({D}{E}{B}) model for the green sea turtle (\emph{Chelonia mydas}) fitted to data on embryonic development}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {143}, ' ...
'pages = {78-88}, '...
'doi = {10.1016/j.seares.2018.06.012}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VenkKann2005'; type = 'Article'; bib = [ ...  
'author = {Venkatesan, S. and Kannan, P. and Rajagopalan, M. and Vivekanandan, E.},'...
'year = {2005},'...
'title = {Embryonic energetics in the egg of the green turtle \emph{Chelonia mydas}},'...
'journal = {Journal of the Marine Biological Association of India},'...
'volume = {47},'...
'number = {2},'...
'pages = {193-197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WaayStub2016'; type = 'Techreport'; bib = [ ... 
'author = {Waayers, D. and Stubbs, J.}, ' ... 
'institution = {Care for Hedland Environmental Association}, ' ...
'year = {2016}, ' ...
'title = {A Decade of Monitoring Flatback Turtles in {P}ort {H}edland, {W}estern {A}ustralia, 2004/05 - 2013/14}, ' ...
'pages = {59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wine2016'; type = 'Article'; bib = [ ...  
'author = {Wine, C.},'...
'year = {2016},'...
'title = {Sea turtle energetics},'...
'journal = {Hohonu},'...
'volume = {14},'...
'pages = {82-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


