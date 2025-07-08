function [data, auxData, metaData, txtData, weights] = mydata_Oryctolagus_cuniculus_NZW

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Lagomorpha'; 
metaData.family     = 'Leporidae';
metaData.species    = 'Oryctolagus_cuniculus_NZW'; 
metaData.species_en = 'Rabbit, New Zealand White strain'; 
metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp', 'TA'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'; 't-Wwe'; 't-L_f'; 't-JX'; 'Ww-N'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author      = {'Andre Gergs', 'Kim Rakel'};    
metaData.date_subm   = [2017 09 22];              
metaData.email       = {'gergs@gaiac.rwth-aachen.de'};            
metaData.address     = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};   

metaData.author_mod_1    = {'Nina Marn', 'Dina Lika', 'Kim Rakel'};    
metaData.date_mod_1 = [2019 11 30];              
metaData.email_mod_1     = {'nina.marn@gmail.com'};            
metaData.address_mod_1   = {'Kea enterprises, Zagreb, Croatia'};


metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 12 12]; 

%% set data
% zero-variate data

data.tg = 31.5;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'FootCarn2000'; 
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
    comment.tg = 'lab data 31-32 days; female New Zealand; temp from AnAge';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning';      bibkey.tx = 'FootCarn2000'; 
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
    comment.tx = '"young are substantially on solid feed by 4 weeks and can be weaned tattooed, and caged individually at 6 weeks of age"';    
data.tp = 24*7;   units.tp = 'd';    label.tp = 'time since birth at puberty - females'; bibkey.tp = 'FootCarn2000'; 
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
    comment.tp = 'First ovaluation = first cycle, lab data, 24 weeks, female New Zealand; temp from AnAge';
% 159.9 +/- 0.2 days first kindling (giving birth to kits), making tp = 130d (AporHaga2014)
    
data.tp2 = 13*7;   units.tp2 = 'd';    label.tp2 = 'time since birth at puberty - females (youngest females in exp)'; bibkey.tp2 = 'BayeXXXX'; 
  temp.tp2 = C2K(39);  units.temp.tp2 = 'K'; label.temp.tp2 = 'temperature';
    comment.tp2 = 'Youngest females from lab experiments for reproduction';
    
data.tp_m = 20*7;   units.tp_m = 'd';    label.tp_m = 'time since birth at puberty - males'; bibkey.tp_m = 'FootCarn2000'; 
  temp.tp_m = C2K(39);  units.temp.tp_m = 'K'; label.temp.tp_m = 'temperature';
    comment.tp_m = 'Age when spermatozoa are produced, lab data, 20 weeks, male New Zealand; temp from AnAge';
    
data.am = 9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge'; 
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    comment.am = 'laboratory rabbit';

data.Lb  = 8;   units.Lb  = 'cm';  label.Lb  = 'kit crown-rump length';  bibkey.Lb  = 'ResearchGate';
comment.Lb = 'No other data available';
    
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate crown-rump length';  bibkey.Li  = 'wiki';
 
% data.Wwb = 70;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth - New Zealand - males';     bibkey.Wwb = 'FootCarn2000'; 
%     comment.Wwb = 'lab data, males New Zealand; this seems very high compared to lab data from Bayer control';
data.Wwb = mean([70, 35.5, 55.2]);   units.Wwb = 'g';   label.Wwb = 'wet weight at birth - New Zealand';     bibkey.Wwb = {'FootCarn2000','FadaFato2018', 'AporHaga2014'}; 
    comment.Wwb = ['mean of: FootCarn2000 >lab data, males New Zealand, <FadaFato2018> lab data, average of kits in litter of 6, ',...
       '<AporHaga2014> lab data, average of 574 kits, average litter size of 6'];
% data.Wwb2 = 55.2;   units.Wwb2 = 'g';   label.Wwb2 = 'wet weight at birth - New Zealand';     bibkey.Wwb = 'AporHaga2014'; 
%     comment.Wwb2 = 'lab data, average of 574 kits, average litter size of 6';
 
data.Wwp = 2720;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty - New Zealand - females';  bibkey.Wwp = 'BayeXXXX'; 
    comment.Wwp = 'lab data, smallest of means of females New Zealand, in Bayer studies';
data.Wwi = 5000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight - females';     bibkey.Wwi = 'FootCarn2000';
  comment.Wwi = 'lab data, females New Zealand, page 479 table 4';
data.Wwi_m = 5500; units.Wwi_m = 'g';   label.Wwi_m = 'ultimate wet weight - males';     bibkey.Wwi_m = 'FootCarn2000';
  comment.Wwi_m = 'lab data, males New Zealand, page 479 table 4';
  
N_litters = 4; % how many litters per year
data.Ri  = 130/ (365*N_litters); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'HolsHutz2002'; 
  temp.Ri = C2K(39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  Nlitters.Ri = N_litters; units.Nlitters.Ri = '#/yr'; label.Nlitters.Ri = 'number of litters per year';
    comment.Ri = 'one female achieved 130 offsprings in 5 reproductive years';
    % max litter size in Baye200X experiments : 10, we can assume 2-3 litters per year based on 130 pups in 5 years
% from litterature: 4-5 litters per year for 3 years (A Guide to Breeding Rabbits:FAO) with 6-7 pups per litter (FadaFato2018)

% uni-variate data
% new embryo wet weight data from ZaikDom2013
data.tW_e2 = [ ... % gestation day (d), wet weight (g)
    6.5     0.3
    17.5	2.55
    29      52.67];
units.tW_e2   = {'d', 'g'};  label.tW_e2 = {'age', 'wet weight of foetus'};
temp.tW_e2    = C2K(39);  units.temp.tW_e2 = 'K'; label.temp.tW_e2 = 'temperature';
bibkey.tW_e2 = 'ZaikDom2013';
comment.tW_e2 = 'age = gestation day, New Zealand White, control group wet weight in the first, second and third trimester';

% t-Ww data %new BergChaz1976
data.tWw_1 = [ ... % age (days), wet weight (g)
    1	56
    10	185.00
    20	317.00
    30	653.00
    40	866.00
    50	1037.00
    60	1695.00
    70	2014.00
    80	2183.00
    90	2531.00
    108	4171.00];
units.tWw_1  = {'d', 'g'};  label.tWw_1 = {'time since birth', 'wet weight'};
temp.tWw_1   = C2K(39);  units.temp.tWw_1 = 'K'; label.temp.tWw_1 = 'temperature';
% Ww0.tWw_1 = 56; units.Ww0.tWw_1 = 'g'; label.Ww0.tWw_1 = 'initial wet weight';
bibkey.tWw_1 = 'BergChaz1976';
comment.tWw_1 = 'New Zealand, MALE';

% t-Ww data %new MasoShap1986 MALES
data.tWw_2 = [ ... % age (weeks), wet weight (g)
   1.99     3.03	3.9     4.78	5.89	6.77	7.8     8.6     9.48	10.27	11.31	12.18	13.46	14.41	15.37	16      17.04	18      18.95	19.91	20.54	21.42	22.06	22.85	23.89	24.84	25.8	26.52	27.87	29.14	29.86	30.89	32.01	32.96	33.92
   158.8	361     548.7	707.6	895.3	1069	1199	1372	1603	1791	1993	2108	2325	2498	2599	2686	2729	2773	2845	2931	3018	3105	3177	3235	3264	3336	3451	3466	3480	3480	3466	3509	3567	3625	3682
]';
data.tWw_2(:,1) = data.tWw_2(:,1)*7; % convert weeks to tdays
units.tWw_2  = {'d', 'g'};  label.tWw_2 = {'time since birth', 'wet weight'};  
temp.tWw_2   = C2K(39);  units.temp.tWw_2 = 'K'; label.temp.tWw_2 = 'temperature';
% Ww0.tWw_2 = 158.80; units.Ww0.tWw_2 = 'g'; label.Ww0.tWw_2 = 'initial wet weight';
bibkey.tWw_2 = 'MasoShap1986';
comment.tWw_2 = 'New Zealand white, MALE';

% t-Ww data %new MasoShap1986 FEMALES
data.tWw_3 = [ ... % age (weeks), wet weight (g)
   2.1      2.87	3.88	4.89	6.06	7.14	7.84	8.46	9.24	10.01	10.63	11.57	12.34	13.43	14.13	14.98	15.84	16.61	17.47	18.24	19.33	20.18	20.96	21.97	23.13	24.22	25.31	26.7	27.71	28.72	29.81	30.74	31.67	32.6	34
   211.3	394.4	619.7	831     1042	1225	1380	1521	1718	1901	2056	2211	2366	2493	2606	2746	2845	2958	3070	3113	3155	3211	3296	3394	3493	3577	3662	3732	3775	3775	3775	3887	3958	4042	4099
]';
data.tWw_3(:,1) = data.tWw_3(:,1)*7; % convert weeks to tdays
units.tWw_3  = {'d', 'g'};  label.tWw_3 = {'time since birth', 'wet weight'};  
temp.tWw_3   = C2K(39);  units.temp.tWw_3 = 'K'; label.temp.tWw_3 = 'temperature';
% Ww0.tWw_3 = 211.30; units.Ww0.tWw_3 = 'g'; label.Ww0.tWw_3 = 'initial wet weight';
bibkey.tWw_3 = 'MasoShap1986';
comment.tWw_3 = 'New Zealand white, FEMALE';

% t-L data %new MasoShap1986 FEMALES
data.tL = [ ... age (d), length [cm]
   1.98     2.53	3.08	3.64	4.11	4.67	5.46	5.93	6.72	7.59	8.07	8.78	9.73	10.75	11.7	12.97	14      15.02	16.21	17.32	18.19	19.37	20      20.95	22.06	23.09	23.96	24.2	25.07	26.01	27.04	28.07	28.78	29.57	30.2	31.15	32.02	32.97	34
   29.91	32.86	35.8	38.75	41.53	44.48	47.75	50.04	52.17	54.63	56.43	58.39	60.85	62.81	64.61	66.41	67.72	68.38	69.03	70.67	71.49	72.31	72.63	73.45	73.94	74.11	74.11	74.11	74.6	75.25	75.09	75.09	74.11	73.78	73.62	74.43	75.09	75.58	76.24
]';
data.tL(:,1) = data.tL(:,1)*7; % convert weeks to tdays
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'nose-to-tibia length'};
temp.tL    = C2K(39);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MasoShap1986';
comment.tL = 'New Zealand white, FEMALE';

% t-L data %new MasoShap1986 MALES
data.tL2 = [ ... age (d), length [cm]
    2.16	2.47	3.09	3.63	3.86	4.48	4.95	5.64	6.34	7.19	8.27	9.43	10.9	12.21	14.06	15.38	16.07	17      17.85	18.93	20.09	21.1	21.95	23.03	24.03	24.8	25.65	26.58	27.59	28.36	29.13	29.75	30.52	31.84	33.07	33.85
    29.75	31.71	34.33	37.77	39.73	41.86	44.48	47.75	50.54	53.32	56.43	59.54	62.81	65.1	67.56	68.38	68.71	70.18	71.32	71.98	72.8	73.45	73.78	73.78	73.78	74.43	74.93	75.09	74.93	74.76	74.11	73.62	74.11	74.93	75.58	76.4
]';
data.tL2(:,1) = data.tL2(:,1)*7; % convert weeks to tdays
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'nose-to-tibia length'};
temp.tL2    = C2K(39);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'MasoShap1986';
comment.tL2 = 'New Zealand white, MALE';

% t-Ww data %new Mahm2013 MALES single lactation
data.tWw_4 = [ ... % age (days), wet weight (g)
    0	72.14
    7	167.22
    14	277.78
    21	375
    28	588.33];
units.tWw_4  = {'d', 'g'};  label.tWw_4 = {'time since birth', 'wet weight - Males'};
temp.tWw_4   = C2K(39);  units.temp.tWw_4 = 'K'; label.temp.tWw_4 = 'temperature';
% Ww0.tWw_4 = 72.14; units.Ww0.tWw_4 = 'g'; label.Ww0.tWw_4 = 'initial wet weight';
bibkey.tWw_4 = 'Mahm2013';
comment.tWw_4 = 'New Zealand white, MALE';

% t-Ww data %new Mahm2013 MALES double lactation
data.tWw_5 = [ ... % age (days), wet weight (g)
    0	75.94
    7	205.26
    14	326
    21	403.33
    28	657.33];
units.tWw_5  = {'d', 'g'};  label.tWw_5 = {'time since birth', 'wet weight - Males'};
temp.tWw_5   = C2K(39);  units.temp.tWw_5 = 'K'; label.temp.tWw_5 = 'temperature';
% Ww0.tWw_5 = 75.94; units.Ww0.tWw_5 = 'g'; label.Ww0.tWw_5 = 'initial wet weight';
bibkey.tWw_5 = 'Mahm2013';
comment.tWw_5 = 'New Zealand white, MALE';

% t-Ww data %new Mahm2013 FEMALES single lactation
data.tWw_6 = [ ... % age (days), wet weight (g)
    0	61.27
    7	147.17
    14	277.67
    21	334
    28	537.5];
units.tWw_6  = {'d', 'g'};  label.tWw_6 = {'time since birth', 'wet weight - Females'};
temp.tWw_6   = C2K(39);  units.temp.tWw_6 = 'K'; label.temp.tWw_6 = 'temperature';
% Ww0.tWw_6 = 61.27; units.Ww0.tWw_6 = 'g'; label.Ww0.tWw_6 = 'initial wet weight';
bibkey.tWw_6 = 'Mahm2013';
comment.tWw_6 = 'New Zealand white, FEMALE';

% t-Ww data %new Mahm2013 FEMALES single lactation
data.tWw_7 = [ ... % age (days), wet weight (g)
    0	60.14
    7	176.67
    14	242.67
    21	351
    28	594];
units.tWw_7  = {'d', 'g'};  label.tWw_7 = {'time since birth', 'wet weight - Females'};
temp.tWw_7   = C2K(39);  units.temp.tWw_7 = 'K'; label.temp.tWw_7 = 'temperature';
% Ww0.tWw_7 = 60.14; units.Ww0.tWw_7 = 'g'; label.Ww0.tWw_7 = 'initial wet weight';
bibkey.tWw_7 = 'Mahm2013';
comment.tWw_7 = 'New Zealand white, FEMALE';


%% new data added by N Marn for pregnant rabbits; data extracted from Bayer AG reports by Kim Rakel 
rabbit = {'0154', '0192', '1085','0397','0203'};

% --------- time - wet weight, and time - ingestion rate ----------
 
% study M-0154 %% 156-165 days old at pairing  (22.28 -23-57 weeks)
data.tWw_0154 = [0	6	7	8	9	10	11	12	13	14	15	16	17	18	19 % time
    4.20	4.29	4.27	4.28	4.27	4.29	4.30	4.30	4.31	4.32	4.34	4.35	4.32	4.32	4.27
    4.18	4.23	4.22	4.22	4.18	4.21	4.25	4.24	4.23	4.25	4.28	4.30	4.30	4.27	4.26]'; % median % mean; kg wet weight
data.tWw_0154(:,2) = [] ; % choose if using means (second row -> remove column3) or medians (third row -> remove column2), but BE CONSISTENT
data.tWw_0154(:,2) = data.tWw_0154(:,2) *1e3; % g to kg
units.tWw_0154 = {'d', 'g'};  label.tWw_0154 = {'time of experiment', 'wet weight female'};
Ww0.tWw_0154 = data.tWw_0154(1,2) ;  units.Ww0.tWw_0154 = 'g'; label.Ww0.tWw_0154 = 'wet weight at start of experiment';
bibkey.tWw_0154  = 'Baye1999a'; comment.tWw_0154 = 'females, 156-165 days old at pairing';
Npups.tWw_0154 = 10;  units.Npups.tWw_0154 = '#'; label.Npups.tWw_0154 = 'average number of pups per female (10.15)';

  % ingestion rate
data.tJX_0154 = [1.5	4.5	7.5	10.5	13.5	16.5	18.5 %time
    147.87	151.08	141.21	133.84	98.92	93.18	77.00
    148.7	157.3	145.7	142.3	116.3	114.7	87]'; %g/animal/day
data.tJX_0154(:,2) = []; % choose if using means (second row) or medians (third row), but BE CONSISTENT
units.tJX_0154 = {'d', 'g/animal/day'};  label.tJX_0154 = {'time of experiment', 'ingestion rate'};
bibkey.tJX_0154 = 'Baye1999a'; comment.tJX_0154 = 'females, 156-165 days old at pairing';

% % study M-0192 %% 16-18 weeks at pairing
data.tWw_0192 = [0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28 % time
    3.67	3.73	3.80	3.82	3.85	3.88	3.88	3.91	3.91	3.92	3.93	3.94	3.94	3.95	3.96	3.97	4.00	4.02	4.00	4.02	4.05	4.05	4.07	4.09	4.09	4.11	4.12	4.13	4.14
    3.69	3.75	3.83	3.85	3.84	3.88	3.88	3.90	3.94	3.92	3.92	3.92	3.94	3.96	3.94	3.92	3.92	3.95	3.90	3.95	3.97	4.00	4.02	4.06	4.04	4.11	4.10	4.09	4.08
    ]'; % kg wet weight
data.tWw_0192(:,2) =[] ; % choose if using means (second row) or medians (third row), but BE CONSISTENT
data.tWw_0192(:,2) = data.tWw_0192(:,2) *1e3; % g to kg
units.tWw_0192 = {'d', 'g'};  label.tWw_0192 = {'time of experiment', 'wet weight female'};
    Ww0.tWw_0192 = data.tWw_0192(1,2) ;  units.Ww0.tWw_0192 = 'g'; label.Ww0.tWw_0192 = 'wet weight at start of experiment'; 
    bibkey.tWw_0192  = 'Baye1995'; comment.tWw_0192 = 'females, 16-18 weeks at pairing';
    Npups.tWw_0192 = 9;  units.Npups.tWw_0192 = '#'; label.Npups.tWw_0192 = 'average number of pups per female (8.81)';

% ingestion rate
data.tJX_0192 = [3	8.5	13	17	21.5	26 %time
    226.25	229.4375	200.9375	182.625	165.1875	129.375 %mean
    226	228.5	202.5	190.5	163	129.5]'; %g/animal/day - median
data.tJX_0192(:,2) =[] ; % choose if using means (second row) or medians (third row), but BE CONSISTENT
units.tJX_0192 = {'d', 'g/animal/day'};  label.tJX_0192 = {'time of experiment', 'ingestion rate'};
bibkey.tJX_0192 = 'Baye1995'; comment.tJX_0192 = 'females, 16-18 weeks at pairing';

% % study M-1085 %% ca. 18 weeks old.
data.tWw_1085 = [3	6	8	10	12	14	16	18	20	22	24	26	29 % time
    3.55	3.57	3.58	3.57	3.60	3.64	3.69	3.72	3.74	3.76	3.78	3.81	3.87
    3.51	3.54	3.52	3.555	3.55	3.6	3.66	3.685	3.685	3.735	3.76	3.785	3.815]'; % kg wet weight
data.tWw_1085(:,2) =[] ; % choose if using means (second row) or medians (third row), but BE CONSISTENT
data.tWw_1085(:,2) = data.tWw_1085(:,2) *1e3; % g to kg
units.tWw_1085 = {'d', 'g'};  label.tWw_1085 = {'time of experiment', 'wet weight female'};
    Ww0.tWw_1085 = data.tWw_1085(1,2) ;  units.Ww0.tWw_1085 = 'g'; label.Ww0.tWw_1085 = 'wet weight at start of experiment'; 
    bibkey.tWw_1085  = 'Baye2003'; comment.tWw_1085 = 'females, ca. 18 weeks old at beginning of study';
    Npups.tWw_1085 = 9;  units.Npups.tWw_1085 = '#'; label.Npups.tWw_1085 = 'average number of pups per female (9.04)';

% ingestion rate
data.tJX_1085 = [3.5	4.5	5.5	7	9	11	13	15	17	19	21	23	25	27	28.5 %time
    175.08	170.38	170.29	170.15	153.69	161.69	146.63	148.06	155.04	162.71	141.81	120.04	112.56	105.79	106.08
    178.5	174	169.5	169.5	163.5	161.5	153.25	156.25	153.5	164.5	142.75	131	111.5	103.25	101.5]'; %g/animal/day
data.tJX_1085(:,2) =[] ; % choose if using means (second row) or medians (third row), but BE CONSISTENT
units.tJX_1085 = {'d', 'g/animal/day'};  label.tJX_1085 = {'time of experiment', 'ingestion rate'};
bibkey.tJX_1085 = 'Baye2003'; comment.tJX_1085 = 'females, ca. 18 weeks old at beginning of study';

% % study M-0397 %% 90-120 days old at beginning of study (12.86 - 17.14 weeks)
data.tWw_0397 = [0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29 % time
    2.72	2.74	2.74	2.75	2.74	2.75	2.74	2.75	2.75	2.74	2.74	2.75	2.75	2.76	2.77	2.80	2.81	2.81	2.82	2.82	2.81	2.82	2.82	2.83	2.84	2.86	2.88	2.89	2.91	2.92
    2.72	2.75	2.75	2.76	2.75	2.77	2.78	2.79	2.76	2.74	2.73	2.72	2.73	2.74	2.73	2.77	2.79	2.81	2.82	2.83	2.80	2.82	2.81	2.84	2.84	2.85	2.89	2.91	2.90	2.91]'; % kg wet weight
data.tWw_0397(:,2) =[] ; % choose if using means (second row) or medians (third row), but BE CONSISTENT
data.tWw_0397(:,2) = data.tWw_0397(:,2) *1e3; % g to kg
units.tWw_0397 = {'d', 'g'};  label.tWw_0397 = {'time of experiment', 'wet weight female'};
    Ww0.tWw_0397 = data.tWw_0397(1,2) ;  units.Ww0.tWw_0397 = 'g'; label.Ww0.tWw_0397 = 'wet weight at start of experiment'; 
    bibkey.tWw_0397  = 'Baye1999b'; comment.tWw_0397 = 'females, 90-120 days old at beginning of study (12.86 - 17.14 weeks)';
    Npups.tWw_0397 = 7;  units.Npups.tWw_0397 = '#'; label.Npups.tWw_0397 = 'average number of pups per female (mean 6.10, median 7)';

% ingestion rate
data.tJX_0397 = [2	5.5	9.5	14	18	22	26.5 %time
    126.99	121.92	109.47	106.75	98.86	92.84	90.60
    132.00	117.65	109.30	113.00	99.65	94.50	83.60]'; %g/animal/day
data.tJX_0397(:,2) =[] ; % choose if using means (second row) or medians (third row), but BE CONSISTENT
units.tJX_0397 = {'d', 'g/animal/day'};  label.tJX_0397 = {'time of experiment', 'ingestion rate'};
bibkey.tJX_0397 = 'Baye1999b'; comment.tJX_0397 = 'females, 90-120 days old at beginning of study (12.86 - 17.14 weeks)';

% % study M-0203 %%  13-18 weeks old at pairing
data.tWw_0203 = [0	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28 % time
    2.81	2.87	2.93	2.95	2.98	3.00	3.02	3.06	3.08	3.11	3.12	3.15	3.17	3.19	3.22	3.24	3.27	3.29	3.31	3.33	3.37	3.39	3.41	3.42	3.44	3.46	3.47	3.47	3.48
    2.80	2.85	2.93	2.97	3.01	3.06	3.07	3.08	3.12	3.14	3.14	3.17	3.19	3.20	3.23	3.27	3.30	3.32	3.34	3.37	3.37	3.44	3.42	3.45	3.49	3.49	3.50	3.47	3.48]'; % kg wet weight
data.tWw_0203(:,2) =[] ; % choose if using means (second row) or medians (third row), but BE CONSISTENT
data.tWw_0203(:,2) = data.tWw_0203(:,2) *1e3; % g to kg
units.tWw_0203 = {'d', 'g'};  label.tWw_0203 = {'time of experiment', 'wet weight female'};
    Ww0.tWw_0203 = data.tWw_0203(1,2) ;  units.Ww0.tWw_0203 = 'g'; label.Ww0.tWw_0203 = 'wet weight at start of experiment'; 
    bibkey.tWw_0203  = 'Baye1988'; comment.tWw_0203 = 'females, 13-18 weeks old at pairing';
    Npups.tWw_0203 = 7;  units.Npups.tWw_0203 = '#'; label.Npups.tWw_0203 = 'average number of pups per female (mean 7.4, median 7)';

% ingestion rate
data.tJX_0203 = [3	8.5	13	17	21.5	26 %time
    142.67	139.87	144.93	114.27	89.40	39.67
    186.00	202.00	185.00	192.00	0.00	0.00]'; %g/animal/day
data.tJX_0203(:,2) =[] ; % choose if using means (second row) or medians (third row), but BE CONSISTENT
units.tJX_0203 = {'d', 'g/animal/day'};  label.tJX_0203 = {'time of experiment', 'ingestion rate'};
bibkey.tJX_0203 = 'Baye1988'; comment.tJX_0203 = 'females, 13-18 weeks old at pairing';

%% --------- wet weight at becoming pregnant vs number of pups ----------

data.WwN_0154 = [3596	4166	3681	4035	4309	3931	4182	4376	4692	4344	4515	4054	4733
    8	8	8	8	9	10	10	11	11	11	12	13	13]';
units.WwN_0154 = {'g', '#'};  label.WwN_0154 = {'wet weight at insemination', 'litter size'};
bibkey.WwN_0154 = 'Baye1999a'; 

data.WwN_0192 = [3424	3589	3637	3653	3883	4056	3734	4095	3480	3263	3274	3813	3824	3294	3892	3762
    2	5	6	7	8	9	9	9	9	9	9	10	11	11	13	14]';
units.WwN_0192 = {'g', '#'};  label.WwN_0192 = {'wet weight at insemination', 'litter size'};
bibkey.WwN_0192 = 'Baye1995'; 

data.WwN_1085 = [3510	3440	3380	3160	3400	3140	3600	3850	3470	4050	3420	3560	3620	3510	3340	3620	3750	4150	3340	3700	3810	3640	3360	3480
    2	4	5	6	7	7	7	9	9	9	9	9	9	10	10	11	11	11	11	12	12	12	12	13]';
units.WwN_1085 = {'g', '#'};  label.WwN_1085 = {'wet weight at insemination', 'litter size'};
bibkey.WwN_1085 = 'Baye2003';

% data.WwN_0397 = [3234	2876	2883	2455	2723	2515	2853	2593	2509	2741	2908	2536	2773	2632	2531	2503	2658	2855	2809
%     2	3	3	4	5	5	5	6	6	7	7	7	7	7	7	8	9	9	9]';
% units.WwN_0397 = {'g', '#'};  label.WwN_0397 = {'wet weight at insemination', 'litter size'};
% bibkey.WwN_0397 = 'Baye1999b'; 

% data.WwN_0203 = [2426	2791	2803	2734	2981	2595	3059	2991	3004	2684	2778	2665	2884	2917	2844
%     4	5	5	6	6	6	7	7	8	8	8	8	9	12	12]';
% units.WwN_0203 = {'g', '#'};  label.WwN_0203 = {'wet weight at insemination', 'litter size'};
% bibkey.WwN_0203 = 'Baye1988'; 

%% --------- foetal growth t-Wwe, from same studies as above --------- 
% 1st row: number of pups in litter, 2nd row: mean Ww of pups per mother
% at day 19 (0154); 
NWwe_0154 = [8	8	8	8	9	10	10	11	11	11	12	13	13
    2.33875	2.19875	2.145	2.1225	2.054444444	2.405	2.298	2.178181818	2.352727273	2.488181818	2.296666667	2.280769231	2.348461538    
    ];
% at day 28 (0192 and 0203)
NWwe_0192 = [2	5	6	7	8	9	9	9	9	9	9	10	11	11	13	14
    41.55	35.55	35.55	27.97142857	32.5	30.81111111	32.48888889	32.35555556	32.2	32.3	34.36666667	35.44	28.51818182	32.88181818	28.46923077	25.35714286
    ];
NWwe_0203 = [4	5	5	6	6	6	7	7	8	8	8	8	9	12	12
    31.85	37.5	38.5	39.81666667	36.33333333	31.5	37.87142857	39.98571429	39.375	36.5	34.3375	33.0375	27.34444444	32.7	34.76666667
    ];
% at day 29 (1085 and 0397)
NWwe_1085 = [2	4	5	6	7	7	7	9	9	9	9	9	9	10	10	11	11	11	11	12	12	12	12	13
    43.85	34.6	33.26	35.68333333	44.32857143	35.78571429	39.22857143	36.71111111	38.53333333	37.33333333	38.98888889	33.36666667	34.6	28.36	38.58	35.85454545	38.02727273	30.47272727	36.88181818	24.96666667	29.33333333	34.25	30.08333333	25.98461538
    ];
NWwe_0397 = [2	3	3	4	5	5	5	6	6	7	7	7	7	7	7	8	9	9	9
    48.65	41.53333333	45.3	39.25	44.26	40.9	40.48	38.03333333	43.5	41.98571429	38.98571429	36.4	33.72857143	39.48571429	38.27142857	38.325	36.5	37.15555556	35.98888889
    ];

data.tWwe_Baye = [ones(length(NWwe_0154),1)*19 , NWwe_0154(2,:)' ;  % day 19
    ones(length(NWwe_0192),1)*28 , NWwe_0192(2,:)' ; % day 28
    ones(length(NWwe_0203),1)*28 , NWwe_0203(2,:)' ; % day 28
    ones(length(NWwe_1085),1)*29 , NWwe_1085(2,:)' ; % day 29
    ones(length(NWwe_0397),1)*29 , NWwe_0397(2,:)' ; % day 29
    ];
units.tWwe_Baye = {'d', 'g'};  label.tWwe_Baye = {'age', 'wet weight of foetus'};
bibkey.tWwe_Baye = 'BayeXXXX'; comment.tWwe_Baye = 'all pups, predicted for average litter size and average f of the experiments';
Npups.tWwe_Baye = mean([mean(NWwe_0154(1,:)), mean(NWwe_0192(1,:)), mean(NWwe_0203(1,:)), ...
    mean(NWwe_1085(1,:)), mean(NWwe_0397(1,:))]);
 units.Npups.tWwe_Baye = '#'; label.Npups.tWwe_Baye = 'average number of pups of all females';
Ww0.tWwe_Baye = mean([Ww0.tWw_0154, Ww0.tWw_0192, Ww0.tWw_0203, Ww0.tWw_0397, Ww0.tWw_1085]);
 units.Ww0.tWwe_Baye = 'g'; label.Ww0.tWwe_Baye = 'wet weight at start of experiment'; 



%% set weights for all real data
weights = setweights(data, []);
% weights.Wwi_m = 30 * weights.Wwi_m; 
weights.tWw_1085 = 5 * weights.tWw_1085;
weights.Lb = 0.5 * weights.Lb; % I think the data is valid (and only that is available) but no good refs
weights.tg = 10 * weights.tg;
weights.tx = 10 * weights.tx;
weights.tp = 0.2 * weights.tp; % seems to high based on Baye200X lab data
weights.tp2 = 10 * weights.tp2; % seems to high based on Baye200X lab data
weights.Wwp = 10 * weights.Wwp; % seems to high based on Baye200X lab data
for rr = 1 :length(rabbit)
    eval(['weights.tJX_', rabbit{rr}, ' = 0.5 * weights.tJX_', rabbit{rr},';']); 
    eval(['weights.tWw_', rabbit{rr}, ' = 20 * weights.tWw_', rabbit{rr},';']); 
end
weights.tW_e2 = 5 * weights.tW_e2;
weights.tL2 = 5 * weights.tL2;
weights.tWwe_Baye = 1 * weights.tWwe_Baye;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; %old
weights.psd.t_0 = 0.1; 

%% group plots
set1 = {'tWw_1','tWw_2','tWw_3'}; comment1 = {'BergChaz1976 MALE, and MasoShap1986 MALES and FEMALES'};
set2 = {'tL','tL2'}; comment2 = {'MasoShap1986 MALES and FEMALES (red)'};
set3 = {'tWw_4','tWw_5'}; comment3 = {'Mahm2013 MALES single (red) and double (blue) lactation'};
set4 = {'tWw_6','tWw_7'}; comment4 = {'Mahm2013 FEMALES single (red) and double (blue) lactation'};
set5 = {'tWw_0154','tWw_0192','tWw_1085','tWw_0397','tWw_0203'}; comment5 = {'pregnant f, ctrl exp. Bayer: red 0192, pinkred 0154, pink 1085, black 0203, blue 0397'};
set6 = {'tJX_0154','tJX_0192','tJX_1085', 'tJX_0397', 'tJX_0203'}; comment6 = {'ingestion rate, ctrl exp. Bayer: red 0192, pinkred 0154, pink 1085, black 0203, blue 0397'};
set7 = {'WwN_0154','WwN_0192','WwN_1085'};%, 'WwN_0397', 'WwN_0203'}; 
comment7 = {'Reproduction output, ctrl exp. Bayer: red 0192, pinkred 0154, pink 1085, black 0203, blue 0397'};
set8 = {'tW_e2','tWwe_Baye'}; comment8 = {'foetal growth, ZaikDom2013 (red), Bayer (blue)'};
metaData.grp.sets = {set1, set2, set3, set4, set5, set6, set7, set8};
metaData.grp.comment = {comment1, comment2, comment3, comment4, comment5, comment6, comment7, comment8};

%% pack auxData and txtData for output
auxData.temp = temp; 
auxData.Ww0 = Ww0; auxData.Npups = Npups;  auxData.Nlitters = Nlitters; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = ['Different to version : Added data on pregnant females, and dget_EVH_AF to derive their dynamics. '...
    'We assumed no saturating function of litter size (Seff = del_upreg). For an example of saturating function see Wistar rat entry.'];
D3 = 'To avoid negative growth (shrinking), a condition dV = max( 0,pG/E_G ) in inserted in get_EVH_AF;';
D4 = ['Rabbit entry needs a bit more work and adjustment of the equations relating to pregnancy, as well as to feeding because coprophagia'...
    '(eating of foeces) should perhaps be explicitly modelled if ingestion data are of interest. For foetal development, more data on foetal  '...
    'length and weight is needed, as it is currently impossible to know whether a constant body composition is maintained throughout foetal'...
    'development (resulting in constant reserve density) or reserve density fluctuates depending on the condition of the mother or number of '...
    'siblings in a litter. '];
D5 = 'Parameter estimation is slow due to the code complexity; with more continuations a different parameter set might be obtained.';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Acknowledgment
metaData.acknowledgment = 'This entry (version 2019/12/12) was financially supported by Bayer. Bayer is making the science it owns available for review for the purposes of furthering scientific discovery and collaboration, public awareness and ensuring robust science supports our technologies.  If interested in accessing underlying research referenced in this article please visit https://www.cropscience-transparency.bayer.com/ or email to cropscience-transparency@bayer.com';

%% Links
metaData.links.id_CoL = '0488cb00ad3e3545c4c28f8feaf747e0'; % Cat of Life
metaData.links.id_EoL = '327977'; % Ency of Life
metaData.links.id_Wiki = 'Oryctolagus_cuniculus_NZW'; % Wikipedia
metaData.links.id_ADW = 'Oryctolagus_cuniculus'; % ADW
metaData.links.id_Taxo = '61547'; % Taxonomicon
metaData.links.id_MSW3 = '13500254'; % Mammal Spec World
metaData.links.id_AnAge = 'Oryctolagus_cuniculus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/New_Zealand_rabbit}},'...
'note = {Last accessed: 2019/25/11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Oryctolagus_cuniculus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%%   
%
bibkey = 'AporHaga2014'; type = 'Article'; bib = [ ... 
'author = {Apori, SO and Hagan, JK and Osei, YD}, ' ... 
'year = {2015}, ' ...
'title = {Growth and reproductive performance of two rabbit breeds reared under intensive system in Ghana}, ' ...
'journal = {Trop Anim Health Prod. }, ' ...
'volume = {47}, ' ...
'number = {1}, ' ...
'pages = {221--225}, '...
'DOI = {10.1007/s11250-014-0714-2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%     
bibkey = 'Baye1988'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {1988}, ' ...
'note = {Control data from studies on rabbit}},'...
'number = {M-020348-01-1},' ...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye1995'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {1995}, ' ...
'note = {Control data from studies on rabbit}},'...
'number = {M-019229-02-1},' ...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye1999a'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {1999}, ' ...
'note = {Control data from studies on rabbit}},'...
'number = {M-015410-01-1},' ...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye1999b'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {1999}, ' ...
'note = {Control data from studies on rabbit}},'...
'number = {M-039377-03-1},'...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2003'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {2003}, ' ...
'note = {Control data from studies on rabbit}},'...
'number = {M-108558-01-1},'...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BayeXXXX'; type = 'Misc'; bib = [ ...
'author = {{Bayer AG}}, ' ... 
'year = {2003}, ' ...
'note = {Multiple control data from studies from multiple years on rabbit}},'...
'number = {M-020348-01-1, M-019229-02-1, M-039377-03-1, M-108558-01-1},'...
'howpublished = {\url{https://www.cropscience-transparency.bayer.com/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BergChaz1976'; type = 'Article'; bib = [ ... 
'author = {Berger, M. and Chazaud, J. and Jean-Faucher, Ch. and de Turckheim, M. and Veyssiere, G. and Jean, Cl.}, ' ... 
'year = {1976}, ' ...
'title = {Developmental Patterns of Plasma and Testicular Testosterone in Rabbits from Birth to 90 Days of Age}, ' ...
'journal = {Biology of Reproduction}, ' ...
'volume = {15}, ' ...
'pages = {561--564}, '...
'DOI = {10.1530/acta.0.0890780}, '...
'howpublished = {\url{http://www.eje-online.org/content/89/4/780.short}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%     
bibkey = 'FadaFato2018'; type = 'Article'; bib = [ ... 
'author = {Fadare, A.O. and Fatoba, T.J.}, ' ... 
'year = {2018}, ' ...
'title = {Reproductive performance of four breeds of rabbit in the humid tropics}, ' ...
'journal = {Livestock Research for Rural Development}, ' ...
'volume = {30}, ' ...
'pages = {Article #114}, '...
'note = {Retrieved November 21, 2019}, '...
'howpublished = {\url{http://www.lrrd.org/lrrd30/7/delod30114.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FootCarn2000'; type = 'Article'; bib = [ ... 
'author = {Foote, R. H. and Carney, E.W.}, ' ... 
'year = {2000}, ' ...
'title = {The rabbit as a model for reproductive and developmental toxicity studies}, ' ...
'journal = {Reproductive Toxicology}, ' ...
'volume = {14}, ' ...
'pages = {477--493}, '...
'DOI = {10.1016/S0890-6238(00)00101-5}, '...
'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S0890623800001015}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'HolsHutz2002'; type = 'Article'; bib = [ ... 
'author = {von Holst, D. and Hutzelmeyer, H. and Kaetzke, P. and Khaschei, M. and Roedel, H. G. and Schrutka, H.}, ' ... 
'year = {2002}, ' ...
'title = {Social rank, fecundity and lifetime reproductive success in wild European rabbits \emph{(Oryctolagus cuniculus)}}, ' ...
'journal = {Behavioral Ecology and Sociobiology}, ' ...
'volume = {51}, ' ...
'pages = {245--254}, '...
'DOI = {10.1007/s00265-001-0427-1}, '...
'howpublished = {\url{http://link.springer.com/article/10.1007/s00265-001-0427-1}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Mahm2013'; type = 'Article'; bib = [ ... 
'author = {Mahmoud, E. A. A.}, ' ... 
'year = {2013}, ' ...
'title = {A STUDY OF SOME FACTORS AFFECTING MILK YIELD IN {N}EW {Z}EALAND {W}HITE RABBITS UNDER EGYPTIAN CONDITIONS}, ' ...
'journal = {Benha Veterinary Medical Journal}, ' ...
'volume = {25}, ' ...
'issue = {2},'...
'pages = {13--22}, '...
'howpublished = {\url{http://www.bvmj.bu.edu.eg/issues/25-2/2.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'MasoShap1986'; type = 'Article'; bib = [ ... 
'author = {Masoud, I. and Shapiro, F. and Kent, R. and Moses, A.}, ' ... 
'year = {1986}, ' ...
'title = {A Longitudinal Study of the Growth of the {N}ew {Z}ealand {W}hite Rabbit: Cumulative and Biweekly Incremental Growth Rates for Body Length, Body Weight, Femoral Length, and Tibia Length}, ' ...
'journal = {Journal of Orthopaedic Research}, ' ...
'volume = {4}, ' ...
'pages = {221--231}, '...
'DOI = {10.1002/jor.1100040211}, '...
'howpublished = {\url{http://onlinelibrary.wiley.com/doi/10.1002/jor.1100040211/abstract;jsessionid=A5926540BF242BC79B535ED433241747.f02t03}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ResearchGate'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.researchgate.net/post/can_any_one_suggest_the_normal_weight_and_length_for_newborn_rabbit_one_day_old2}}', ...
'note = Retrieved November 21, 2019'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZaikDom2013'; type = 'Article'; bib = [ ... 
'author = {Zaiki,F. W. A. and Dom, S. M. and Razak, H. R. A. and Hassan, H. F.}, ' ... 
'year = {2013}, ' ...
'title = {Prenatal Ultrasound Heating Influences on Fetal Weight Assessment of Oryctolagus cuniculus Throughout Pregnancy}, ' ...
'journal = {Advanced Science and Technology Letters}, ' ...
'volume = {33 (Bioscience and Medical Research 2013)}, ' ...
'pages = {5--11}, '...
'DOI = {10.14257/astl.2013.33.02}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

% keyboard
