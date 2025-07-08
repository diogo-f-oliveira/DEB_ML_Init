  function [data, auxData, metaData, txtData, weights] = mydata_Americamysis_bahia
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Americamysis_bahia'; % Previously Mysidopsis bahia
metaData.species_en = 'Opossum shrimp'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp % EPA2002a: Mysids, Mysidopsis bahia, should be cultured at a temperature of 26 C.
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lb'; 'Li'; 'L_tTf'; 'Wwb'; 'Ww_tTf'; 'Ww_tTf'; 'Ni_Tf'};  
metaData.data_1     = {'t-L_Tf'; 't-Wd_f'; 't-N_f'; 'Ww-JO'};     

metaData.COMPLETE = 4.5; % using criteria of LikaKear2011

metaData.author   = {'Benoit Goussen', 'Roland Kuhl'};        
metaData.date_subm = [2019 3 27];                           
metaData.email    = {'benoit.goussen@ibacon.com'};                 
metaData.address  = {'ibacon GmbH'}; 

metaData.author_mod_1   = {'Benoit Goussen', 'Andre Gergs'};        
metaData.date_mod_1     = [2020 10 08];                           
metaData.email_mod_1    = {'benoit.goussen@ibacon.com', 'andre.gergs@bayer.com'};                 
metaData.address_mod_1  = {'ibacon GmbH', 'Bayer AG'}; 

metaData.author_mod_2   = {'Bas Kooijman'};        
metaData.date_mod_2     = [2020 11 11];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2  = {'VU University Amsterdam'}; 

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 03 29];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data
data.ab_T16 = 15.5;         units.ab_T16 = 'd';  label.ab_T16 = 'age at birth';          bibkey.ab_T16 = 'WortPric2002';
  temp.ab_T16 = C2K(16); units.temp.ab_T16 = 'K'; label.temp.ab_T16 = 'temperature';
data.ab_T20 = 10.4;         units.ab_T20 = 'd';  label.ab_T20 = 'age at birth';          bibkey.ab_T20 = 'WortPric2002';
  temp.ab_T20 = C2K(20); units.temp.ab_T20 = 'K'; label.temp.ab_T20 = 'temperature';
data.ab_T21 = 7;         units.ab_T21 = 'd';  label.ab_T21 = 'age at birth';          bibkey.ab_T21 = 'GentGent1983';
  temp.ab_T21 = C2K(21); units.temp.ab_T21 = 'K'; label.temp.ab_T21 = 'temperature';
  comment.ab_T16 = 'Embryos mature within 7 days in the brood sac and released juveniles are free swimming';
data.ab_T29 = 4.6;         units.ab_T29 = 'd';  label.ab_T29 = 'age at birth';          bibkey.ab_T29 = 'WortPric2002';
  temp.ab_T29 = C2K(29); units.temp.ab_T29 = 'K'; label.temp.ab_T29 = 'temperature';
data.tp = 14;         units.tp = 'd';  label.tp = 'time since birth at puberty';          bibkey.tp = 'GentGent1983';
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Juvenile sexually differentiates. Ova appear in < 24h';
data.am = 5*30;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'LussKuhn1988';
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Maximum 3 to 5 months at 25 C and 30 g/L salinity. Mean longevity is 90 days';
  
data.Lb = 0.152;         units.Lb = 'cm';  label.Lb = 'standard length at birth';  bibkey.Lb = 'ScarStee2017';
  temp.Lb = C2K(23); units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
  comment.Lb = 'From Figure 2 - synchronised data from 15 individuals'; 
data.Li = 0.98;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'Mole1969';
  temp.Li = C2K(24); units.temp.Li = 'K'; label.temp.Li = 'temperature';
  comment.Li = 'Other values available from Stuck1979: males 7 mm, females 8 mm'; 
data.L28_f_d1 = 8.58e-1;     units.L28_f_d1 = 'cm';     label.L28_f_d1 = 'total length of females at day 28';  bibkey.L28_f_d1 = 'Baye2002';
  temp.L28_f_d1 = C2K(25); units.temp.L28_f_d1 = 'K'; label.temp.L28_f_d1 = 'temperature';
  comment.L28_f_d1 = 'Mean value of the females controls replicates of Baye2002 (table A4).';  
data.L28_m_d1 = 8.20e-1;     units.L28_m_d1 = 'cm';     label.L28_m_d1 = 'total length of males at day 28';  bibkey.L28_m_d1 = 'Baye2002';
  temp.L28_m_d1 = C2K(25); units.temp.L28_m_d1 = 'K'; label.temp.L28_m_d1 = 'temperature';
  comment.L28_m_d1 = 'Mean value of the males controls replicates of Baye2002 (table A4).';  
data.L28_f_d2 = 8.07e-1;     units.L28_f_d2 = 'cm';     label.L28_f_d2 = 'total length of females at day 28';  bibkey.L28_f_d2 = 'Baye2004';
  temp.L28_f_d2 = C2K(26); units.temp.L28_f_d2 = 'K'; label.temp.L28_f_d2 = 'temperature';
  comment.L28_f_d2 = 'Mean value of the female controls replicates of Baye2004.';  
data.L28_m_d2 = 7.75e-1;     units.L28_m_d2 = 'cm';     label.L28_m_d2 = 'total length of males at day 28';  bibkey.L28_m_d2 = 'Baye2004';
  temp.L28_m_d2 = C2K(26); units.temp.L28_m_d2 = 'K'; label.temp.L28_m_d2 = 'temperature';
  comment.L28_m_d2 = 'Mean value of the controls replicates of Baye2004.'; 
data.L28_f_d3 = 7.46e-1;     units.L28_f_d3 = 'cm';     label.L28_f_d3 = 'total length of females at day 28';  bibkey.L28_f_d3 = 'Baye2006';
  temp.L28_f_d3 = C2K(25.5); units.temp.L28_f_d3 = 'K'; label.temp.L28_f_d3 = 'temperature';
  comment.L28_f_d3 = 'Mean value of the paired female controls replicates of Baye2006.';  
data.L28_m_d3 = 7.41e-1;     units.L28_m_d3 = 'cm';     label.L28_m_d3 = 'total length of males at day 28';  bibkey.L28_m_d3 = 'Baye2006';
  temp.L28_m_d3 = C2K(25.5); units.temp.L28_m_d3 = 'K'; label.temp.L28_m_d3 = 'temperature';
  comment.L28_m_d3 = 'Mean value of the controls replicates of Baye2006.'; 
data.L28_f_d4 = 7.4e-1;     units.L28_f_d4 = 'cm';     label.L28_f_d4 = 'total length of females at day 28';  bibkey.L28_f_d4 = 'Baye2007';
  temp.L28_f_d4 = C2K(20); units.temp.L28_f_d4 = 'K'; label.temp.L28_f_d4 = 'temperature';
  comment.L28_f_d4 = 'Mean value of the paired female controls replicates of Baye2007.';  
data.L28_m_d4 = 7.3e-1;     units.L28_m_d4 = 'cm';     label.L28_m_d4 = 'total length of males at day 28';  bibkey.L28_m_d4 = 'Baye2007';
  temp.L28_m_d4 = C2K(20); units.temp.L28_m_d4 = 'K'; label.temp.L28_m_d4 = 'temperature';
  comment.L28_m_d4 = 'Mean value of the controls replicates of Baye2007.'; 

data.Wwb = 5.1e-5;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'WortPric2002';   
  comment.Wwb = 'based on egg diameter of 0.46 mm ( 0.36-0.46 mm): pi/6*0.046^3'; 
data.Ww28_f_d1 = 5.08e-3;     units.Ww28_f_d1 = 'g';     label.Ww28_f_d1 = 'wet weight of females at day 28';  bibkey.Ww28_f_d1 = 'Baye2002';
  temp.Ww28_f_d1 = C2K(25); units.temp.Ww28_f_d1 = 'K'; label.temp.Ww28_f_d1 = 'temperature';
  comment.Ww28_f_d1 = 'Mean value of the females controls replicates of Baye2002 (table A5).'; 
data.Wd28_f_d1 = 0.96e-3;     units.Wd28_f_d1 = 'g';     label.Wd28_f_d1 = 'dry weight of females at day 28';  bibkey.Wd28_f_d1 = 'Baye2002';
  temp.Wd28_f_d1 = C2K(25); units.temp.Wd28_f_d1 = 'K'; label.temp.Wd28_f_d1 = 'temperature';
  comment.Wd28_f_d1 = 'Mean value of the females controls replicates of Baye2002 (table A6).';
data.Ww28_m_d1 = 3.93e-3;     units.Ww28_m_d1 = 'g';     label.Ww28_m_d1 = 'wet weight of males at day 28';  bibkey.Ww28_m_d1 = 'Baye2002';
  temp.Ww28_m_d1 = C2K(25); units.temp.Ww28_m_d1 = 'K'; label.temp.Ww28_m_d1 = 'temperature';
  comment.Ww28_m_d1 = 'Mean value of the males controls replicates of Baye2002 (table A5).';
data.Wd28_m_d1 = 0.74e-3;     units.Wd28_m_d1 = 'g';     label.Wd28_m_d1 = 'dry weight of males at day 28';  bibkey.Wd28_m_d1 = 'Baye2002';
  temp.Wd28_m_d1 = C2K(25); units.temp.Wd28_m_d1 = 'K'; label.temp.Wd28_m_d1 = 'temperature';
  comment.Wd28_m_d1 = 'Mean value of the males controls replicates of Baye2002 (table A6).';  
data.Wd28_f_d2 = 1.44e-3;     units.Wd28_f_d2 = 'g';     label.Wd28_f_d2 = 'dry weight of females at day 28';  bibkey.Wd28_f_d2 = 'Baye2004';
  temp.Wd28_f_d2 = C2K(26); units.temp.Wd28_f_d2 = 'K'; label.temp.Wd28_f_d2 = 'temperature';
  comment.Wd28_f_d2 = 'Mean value of the female controls replicates of Baye2004.';
data.Wd28_m_d2 = 1.02e-3;     units.Wd28_m_d2 = 'g';     label.Wd28_m_d2 = 'dry weight of males at day 28';  bibkey.Wd28_m_d2 = 'Baye2004';
  temp.Wd28_m_d2 = C2K(26); units.temp.Wd28_m_d2 = 'K'; label.temp.Wd28_m_d2 = 'temperature';
  comment.Wd28_m_d2 = 'Mean value of the controls replicates of Baye2004.';    
data.Wd28_f_d3 = 1.36e-3;     units.Wd28_f_d3 = 'g';     label.Wd28_f_d3 = 'dry weight of females at day 28';  bibkey.Wd28_f_d3 = 'Baye2006';
  temp.Wd28_f_d3 = C2K(25.5); units.temp.Wd28_f_d3 = 'K'; label.temp.Wd28_f_d3 = 'temperature';
  comment.Wd28_f_d3 = 'Mean value of the paired female controls replicates of Baye2006.';
data.Wd28_m_d3 = 1.04e-3;     units.Wd28_m_d3 = 'g';     label.Wd28_m_d3 = 'dry weight of males at day 28';  bibkey.Wd28_m_d3 = 'Baye2006';
  temp.Wd28_m_d3 = C2K(25.5); units.temp.Wd28_m_d3 = 'K'; label.temp.Wd28_m_d3 = 'temperature';
  comment.Wd28_m_d3 = 'Mean value of the controls replicates of Baye2006.';  
data.Wd28_f_d4 = 1.32e-3;     units.Wd28_f_d4 = 'g';     label.Wd28_f_d4 = 'dry weight of females at day 28';  bibkey.Wd28_f_d4 = 'Baye2007';
  temp.Wd28_f_d4 = C2K(20); units.temp.Wd28_f_d4 = 'K'; label.temp.Wd28_f_d4 = 'temperature';
  comment.Wd28_f_d4 = 'Mean value of the paired female controls replicates of Baye2007.';
data.Wd28_m_d4 = 0.86e-3;     units.Wd28_m_d4 = 'g';     label.Wd28_m_d4 = 'dry weight of males at day 28';  bibkey.Wd28_m_d4 = 'Baye2007';
  temp.Wd28_m_d4 = C2K(20); units.temp.Wd28_m_d4 = 'K'; label.temp.Wd28_m_d4 = 'temperature';
  comment.Wd28_m_d4 = 'Mean value of the controls replicates of Baye2007.';  
  
data.N28_d2 = 21.4;     units.N28_d2 = '#';     label.N28_d2 = 'cumulative reproduction at day 28';  bibkey.N28_d2 = 'Baye2004';
  temp.N28_d2 = C2K(26); units.temp.N28_d2 = 'K'; label.temp.N28_d2 = 'temperature';
  comment.N28_d2 = 'Mean of the two controls replicates';     
data.N29_f1 = 2.89;     units.N29_f1 = '#';     label.N29_f1 = 'cumulative reproduction at day 29';  bibkey.N29_f1 = 'McKe1987';
  temp.N29_f1 = C2K(25); units.temp.N29_f1 = 'K'; label.temp.N29_f1 = 'temperature';
  comment.N29_f1 = 'Data for food regime 1 (limited food availability) used'; 
data.N29_f2 = 5;     units.N29_f2 = '#';     label.N29_f2 = 'cumulative reproduction at day 29';  bibkey.N29_f2 = 'McKe1987';
  temp.N29_f2 = C2K(25); units.temp.N29_f2 = 'K'; label.temp.N29_f2 = 'temperature';
  comment.N29_f2 = 'Data for food regime 2 (limited food availability) used'; 
data.N29_f3 = 7.63;     units.N29_f3 = '#';     label.N29_f3 = 'cumulative reproduction at day 29';  bibkey.N29_f3 = 'McKe1987';
  temp.N29_f3 = C2K(25); units.temp.N29_f3 = 'K'; label.temp.N29_f3 = 'temperature';
  comment.N29_f3 = 'Data for food regime 3 (limited food availability) used';    
data.N29_f4 = 8.27;     units.N29_f4 = '#';     label.N29_f4 = 'cumulative reproduction at day 29';  bibkey.N29_f4 = 'McKe1987';
  temp.N29_f4 = C2K(25); units.temp.N29_f4 = 'K'; label.temp.N29_f4 = 'temperature';
  comment.N29_f4 = 'Data for food regime 4 (maximal food availability) used'; 
  
% uni-variate data
% time-length
data.tL_f = [... % time (h), standard length (mm)
0   	1.35
8.96	1.41
16.66	1.33
24.9	1.52
34.21	1.53
41.73	1.65
49.61	1.61
56.6	1.62
65.01	1.62
72.36	1.74
80.78	1.75
88.66	1.85
96.9	1.88
104.6	1.85
112.3	1.87
121.43	1.97
128.06	1.91
135.94	2.02
144.72	2.11
152.42	2.25
160.48	2.23
169.79	2.23
175.34	2.18
183.22	2.28
192	    2.03
198.99	2.37
207.04	2.46
215.64	2.46
223.34	2.49
231.58	2.4
239.82	2.54
248.6	2.6
255.22	2.78
263.28	2.78
270.99	2.88
279.04	2.85];
data.tL_f(:,1) = data.tL_f(:,1) / 24; % Transform time from hours to days
data.tL_f(:,2) = data.tL_f(:,2) / 10; % Transform size from mm to cm
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length'};  
temp.tL_f   = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ScarStee2017';
comment.tL_f = 'From Figure 1a. Data from one representative female'; 
%
data.tL_m = [... % time (h), standard length 1 (mm)
7.39	1.52
15.75	1.52
23.75	1.5
32.65	1.7
48.47	1.76
55.38	1.72
63.38	1.69
71.55	1.84
78.82	1.86
87.36	2.17
95	    2.09
103.18	2.04
110.81	2.23
119.9	2.2
126.81	2.28
134.62	2.4
143.52	2.53
151.52	2.59
159.34	2.41
173.69	2.74
190.78	2.93
197.14	2.97
205.14	2.95
222.05	3.01
230.22	3.09
237.67	3.3
246.58	3.29
253.65	3.6
261.66	3.43
269.66	3.42
293.66	3.52];
data.tL_m(:,1) = data.tL_m(:,1) / 24; % Transform time from hours to days
data.tL_m(:,2) = data.tL_m(:,2) / 10; % Transform size from mm to cm
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length'};  
temp.tL_m   = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ScarStee2017';
comment.tL_m = 'From Figure 1b. Data from one representative male'; 
%
data.tL1 = [... % time (d), length (mm)
7	0.47
14	0.65
21	0.64
28	0.7];
data.tL1(:,1) = data.tL1(:,1) +2; % experiment initated 1-2 days after birth
units.tL1  = {'d', 'cm'};  label.tL1 = {'time since birth', 'length'};  
temp.tL1   = C2K(24);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
comment.tL1 = 'From Figure 2. Feeding rate: 40 Artemia/mysid/d'; 
bibkey.tL1 = 'GreaGutj2011';
% 
data.tL2 = [... % time (d), length (mm)
7	0.55
14	0.62
21	0.71
28	0.81];
data.tL2(:,1) = data.tL2(:,1) +2; % experiment initated 1-2 days after birth
units.tL2  = {'d', 'cm'};  label.tL2 = {'time since birth', 'length'};  
temp.tL2   = C2K(24);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
comment.tL2 = 'From Figure 2. Feeding rate: 80 Artemia/mysid/d'; 
bibkey.tL2 = 'GreaGutj2011';
%
data.tL3 = [... % time (d), length (mm)
7	0.52
14	0.73
21	0.73
28	0.83];
data.tL3(:,1) = data.tL3(:,1) +2; % experiment initated 1-2 days after birth
units.tL3  = {'d', 'cm'};  label.tL3 = {'time since birth', 'length'};  
temp.tL3   = C2K(24);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
comment.tL3 = 'From Figure 2. Feeding rate: 120 Artemia/mysid/d'; 
bibkey.tL3 = 'GreaGutj2011';
%
data.tL4 = [... % time (d), length (mm)
7	0.51
14	0.69
21	0.77
28	0.84];
data.tL4(:,1) = data.tL4(:,1) +2; % experiment initated 1-2 days after birth
units.tL4  = {'d', 'cm'};  label.tL4 = {'time since birth', 'length'};  
temp.tL4   = C2K(24);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
comment.tL4 = 'From Figure 2. Feeding rate: 160 Artemia/mysid/d'; 
bibkey.tL4 = 'GreaGutj2011';
% 
data.tL5 = [... % time (d), length (mm)
2	2.6
2	2.8
2	2.6
2	2.5
2	2.4
2	2.7
2	2.5
2	2.8
2	2.5
2	2.9
2	2.6
2	2.5
2	2.5
2	2.6
2	2.5
2	2.8
2	2.5
2	2.8
2	2.8
2	2.7
4	3.6
4	3.5
4	3.7
4	3.5
4	3.4
4	3.6
4	3.7
4	3.5
4	3.1
4	3.4
4	3.4
4	3.6
4	3.4
4	3.4
4	3.6
4	3.6
4	3.3
4	3.4
4	3.3
4	3.2
6	5.9
6	6.0
6	5.4
6	4.9
6	5.2
6	4.7
6	5.1
6	4.9
6	5.4
6	4.5
6	5.3
6	5.0
6	5.0
6	5.1
6	4.5
6	5.2
6	5.3
6	4.8
6	5.0
6	5.3
8	6.2
8	5.9
8	5.9
8	5.8
8	6.4
8	6.2
8	5.9
8	5.8
8	6.1
8	6.0
8	6.4
8	5.7
8	5.8
8	6.1
8	6.0
8	6.0
8	5.7
8	6.0
8	5.8
8	6.1
10	6.9
10	6.5
10	6.4
10	6.5
10	7.1
10	7.0
10	7.2
10	7.1
10	6.8
10	6.5
10	6.0
10	6.2
10	6.5
10	6.4
10	6.4
10	7.0
10	6.5
10	6.3
10	6.8
10	6.4
12	7.1
12	8.0
12	7.9
12	7.8
12	7.7
12	7.8
12	7.9
12	7.3
12	7.2
12	7.2
12	8.0
12	7.0
12	7.5
12	7.9
12	7.8
12	7.4
12	7.6
12	7.5
12	7.1
14	7.6
14	8.5
14	7.5
14	7.9
14	7.5
14	7.8
14	7.6
14	7.4
14	7.5
14	7.4
14	8.1
14	7.7
14	7.3
14	8.0
14	8.0
14	7.6
14	6.8
14	7.3];
n=size(data.tL5,1); for i=2:n;if data.tL5(i,1)<=data.tL5(i-1,1);data.tL5(i,1)=data.tL5(i-1,1)+1e-8;end;end
data.tL5(:,2) = data.tL5(:,2)/10;
units.tL5  = {'d', 'cm'};  label.tL5 = {'time since birth', 'length'};  
temp.tL5   = C2K(25);  units.temp.tL5 = 'K'; label.temp.tL5 = 'temperature';
bibkey.tL5 = 'Baye2020';

% time-weight
data.tWd_f1 = [... % time (d), dry weight (mug)
7	148
14	424
21	508];
data.tWd_f1(:,2) = data.tWd_f1(:,2) / 10^3; % Transform weight from mug to mg
units.tWd_f1  = {'d', 'mg'};  label.tWd_f1 = {'time since birth', 'dry weight'};  
temp.tWd_f1   = C2K(25);  units.temp.tWd_f1 = 'K'; label.temp.tWd_f1 = 'temperature';
bibkey.tWd_f1 = 'McKe1987';
comment.tWd_f1 = 'Four feeding regime used. ca. 600 Artemia nauplii per ml. See table 1 in paper';
%
data.tWd_f2 = [... % time (d), dry weight (mug)
7	155
14	359
21	663];
data.tWd_f2(:,2) = data.tWd_f2(:,2) / 10^3; % Transform weight from mug to mg
units.tWd_f2  = {'d', 'mg'};  label.tWd_f2 = {'time since birth', 'dry weight'};  
temp.tWd_f2   = C2K(25);  units.temp.tWd_f2 = 'K'; label.temp.tWd_f2 = 'temperature';
bibkey.tWd_f2 = 'McKe1987';
comment.tWd_f2 = 'Four feeding regime used. ca. 600 Artemia nauplii per ml. See table 1 in paper';
%
data.tWd_f3 = [... % time (d), dry weight (mug)
7	166
14	479
21	690];
data.tWd_f3(:,2) = data.tWd_f3(:,2) / 10^3; % Transform weight from mug to mg
units.tWd_f3  = {'d', 'mg'};  label.tWd_f3 = {'time since birth', 'dry weight'};  
temp.tWd_f3   = C2K(25);  units.temp.tWd_f3 = 'K'; label.temp.tWd_f3 = 'temperature';
bibkey.tWd_f3 = 'McKe1987';
comment.tWd_f3 = 'Four feeding regime used. ca. 600 Artemia nauplii per ml. See table 1 in paper';
%
data.tWd_f4 = [... % time (d), dry weight (mug)
7	183
14	470
21	723   ];
data.tWd_f4(:,2) = data.tWd_f4(:,2)/ 10^3; % Transform weight from mum to mg
units.tWd_f4  = {'d', 'mg'};  label.tWd_f4 = {'time since birth', 'dry weight'};  
temp.tWd_f4   = C2K(25);  units.temp.tWd_f4 = 'K'; label.temp.tWd_f4 = 'temperature';
bibkey.tWd_f4 = 'McKe1987';
comment.tWd_f4 = 'Four feeding regime used. ca. 600 Artemia nauplii per ml. See table 1 in paper';

% time-fecundity KuhnMunn2001
data.tN1 = [... % time (d), eggs (#)
1   0
13	0
14	16
15	50
16	92
17	99
18	99
19	110
20	118
21	139
22	148
23	155
24	155
25	162
26	191
27	191
28	202];
data.tN1(:,2) = data.tN1(:,2)/ 16; % Assume 16 females per measurement as more in line with other datasets (see paper)
units.tN1  = {'d', '#'};  label.tN1 = {'time since birth', 'cumulative number of eggs'};  
temp.tN1   = C2K(26);  units.temp.tN1 = 'K'; label.temp.tN1 = 'temperature';
bibkey.tN1 = 'KuhnMunn2001';
comment.tN1 = ['Cumulative number of eggs assumed to be for 16 females without account for female death during experiment (not reported); '...
  'Temperature not available. Assumed to be inline with the US EPA guidance one'];
%
% time-fecundity Baye2002 control 1
data.tN1_d1 = [... % time (d), eggs (#)
1   0    %add data for no reproduction if available from study reports
17	0.3
18	0.6
19	0.9
20	1.2
21	1.5
22	2.4
23	2.7
24	4.5
25	5.9
26	6.4
27	7.6
28	8.4];
units.tN1_d1  = {'d', '#'};  label.tN1_d1 = {'time since birth', 'cumulative number of eggs'};  
temp.tN1_d1   = C2K(24.4);  units.temp.tN1_d1 = 'K'; label.temp.tN1_d1 = 'temperature';
bibkey.tN1_d1 = 'Baye2002';
comment.tN1_d1 = 'Young per day per 10 females was transformed in cumulative young per female';
%
% time-fecundity Baye2002 control 2
data.tN2_d1 = [... % time (d), eggs (#)
 1  0    %add data for no reproduction if available from study reports
17	0.2
18	0.8
19	1.1
20	1.1
21	1.6
22	1.7
23	1.9
24	2.6
25	3.1
26	3.1
27	3.9
28	4.5];
units.tN2_d1  = {'d', '#'};  label.tN2_d1 = {'time since birth', 'cumulative number of eggs'};  
temp.tN2_d1   = C2K(24.7);  units.temp.tN2_d1 = 'K'; label.temp.tN2_d1 = 'temperature';
bibkey.tN2_d1 = 'Baye2002';
comment.tN2_d1 = 'Young per day per 10 females was transformed in cumulative young per female';
%
% time-fecundity Baye2006 control 1
data.tN1_d3 = [... % time (d), eggs (#)
1   0    %add data for no reproduction if available from study reports
13	0
14	1.67
15	4.33
16	6
17	6.125
18	6.125
19	6.125
20	10.375
21	11.375
22	11.518
23	11.518
24	11.518
25	13.6845
26	13.851
27	13.851
28	13.851];
units.tN1_d3  = {'d', '#'};  label.tN1_d3 = {'time since birth', 'cumulative number of eggs'};  
temp.tN1_d3   = C2K(26);  units.temp.tN1_d3 = 'K'; label.temp.tN1_d3 = 'temperature';
bibkey.tN1_d3 = 'Baye2006';
comment.tN1_d3 = 'Mean cumulative number of eggs';
%
data.tN2_d3 = [... % time (d), eggs (#)
    1   0    %add data for no reproduction if available from study reports
13	0
14	0.7
15	4.7
16	5.5
17	5.5
18	5.5
19	6.4
20	10.2
21	10.9
22	10.9
23	10.9
24	10.9
25	11.1
26	11.8
27	11.8
28	11.8];
units.tN2_d3  = {'d', '#'};  label.tN2_d3 = {'time since birth', 'cumulative number of eggs'};  
temp.tN2_d3   = C2K(26);  units.temp.tN2_d3 = 'K'; label.temp.tN2_d3 = 'temperature';
bibkey.tN2_d3 = 'Baye2006';
comment.tN2_d3 = 'Mean cumulative number of eggs';
%
% time-fecundity Baye2002 control 4
data.tN1_d4 = [... % time (d), eggs (#)
    1   0    %add data for no reproduction if available from study reports
14	0
15	0.5
16	0.6
17	0.6
18	1
19	1
20	1.3
21	1.5
22	1.5
23	3.8
24	4.55
25	7.675
26	9.175
27	9.175
28	11.89];
units.tN1_d4  = {'d', '#'};  label.tN1_d4 = {'time since birth', 'cumulative number of eggs'};  
temp.tN1_d4   = C2K(26);  units.temp.tN1_d4 = 'K'; label.temp.tN1_d4 = 'temperature';
bibkey.tN1_d4 = 'Baye2007';
comment.tN1_d4 = 'Mean cumulative number of eggs';
%
data.tN2_d4 = [... % time (d), eggs (#)
1   0    %add data for no reproduction if available from study reports
14	0
15	0
16	0.11
17	0.44
18	0.55
19	0.66
20	0.66
21	0.66
22	2.44
23	4.66
24	5.11
25	6.33
26	7.44
27	12
28	12.88];
units.tN2_d4  = {'d', '#'};  label.tN2_d4 = {'time since birth', 'cumulative number of eggs'};  
temp.tN2_d4   = C2K(26);  units.temp.tN2_d4 = 'K'; label.temp.tN2_d4 = 'temperature';
bibkey.tN2_d4 = 'Baye2007';
comment.tN2_d4 = 'Mean cumulative number of eggs';
% 
data.tN_G1 = [... % time (d), offspring (#)
21	0
21	1.88
28	4.81
28	5.98];
data.tN_G1(:,1) = data.tN_G1(:,1) +2; % experiment initated 1-2 days after birth
data.tN_G1(:,2) = data.tN_G1(:,2) / 12.5; % number of offspring of 25 mysids given in the paper, here assuming a sex ratio of 0.5
units.tN_G1  = {'d', '#'};  label.tN_G1 = {'time since birth', 'cumulative reproduction'};  
temp.tN_G1   = C2K(24);  units.temp.tN_G1 = 'K'; label.temp.tN_G1 = 'temperature';
comment.tN_G1 = 'From Figure 1 of GreaGutj2011. Feeding rate: 80 Artemia/mysid/d'; 
bibkey.tN_G1 = 'GreaGutj2011';
% 
data.tN_G2 = [... % time (d), offspring (#)
21	0
21	2.02
21	7.07
28	11.98
28	13.15
28	44.09];
data.tN_G2(:,1) = data.tN_G2(:,1) +2; % experiment initated 1-2 days after birth
data.tN_G2(:,2) = data.tN_G2(:,2) / 12.5; % number of offspring of 25 mysids given in the paper, here assuming a sex ratio of 0.5
units.tN_G2  = {'d', '#'};  label.tN_G2 = {'time since birth', 'cumulative reproduction'};  
temp.tN_G2   = C2K(24);  units.temp.tN_G2 = 'K'; label.temp.tN_G2 = 'temperature';
comment.tN_G2 = 'From Figure 1 of GreaGutj2011. Feeding rate: 80 Artemia/mysid/d'; 
bibkey.tN_G2 = 'GreaGutj2011';
%
data.tN_G3 = [... % time (d), offspring (#)
21	0
21	24.94
21	26.93
28	29.33
28	35.245
28	63.22];
data.tN_G3(:,1) = data.tN_G3(:,1) +2; % experiment initated 1-2 days after birth
data.tN_G3(:,2) = data.tN_G3(:,2) / 12.5; % number of offspring of 25 mysids given in the paper, here assuming a sex ratio of 0.5
units.tN_G3  = {'d', '#'};  label.tN_G3 = {'time since birth', 'cumulative reproduction'};  
temp.tN_G3   = C2K(24);  units.temp.tN_G3 = 'K'; label.temp.tN_G3 = 'temperature';
comment.tN_G3 = 'From Figure 1 of GreaGutj2011. Feeding rate: 120 Artemia/mysid/d'; 
bibkey.tN_G3 = 'GreaGutj2011';
%
data.tN_G4 = [... % time (d), offspring (#)
21	2.76
21	7.78
21	20.98
21	39.1
28	45.695
28	47.645
28	64.685];
data.tN_G4(:,1) = data.tN_G4(:,1) +2; % experiment initated 1-2 days after birth
data.tN_G4(:,2) = data.tN_G4(:,2) / 12.5; % number of offspring of 25 mysids given in the paper, here assuming a sex ratio of 0.5
units.tN_G4  = {'d', '#'};  label.tN_G4 = {'time since birth', 'cumulative reproduction'};  
temp.tN_G4   = C2K(24);  units.temp.tN_G4 = 'K'; label.temp.tN_G4 = 'temperature';
comment.tN_G4 = 'From Figure 1 of GreaGutj2011. Feeding rate: 160 Artemia/mysid/d'; 
bibkey.tN_G4 = 'GreaGutj2011';

% weight-oxygen consumption
data.WwJO = [... % wet weights (mg),	oxygen consumption (mul O2*h-1)
0.08	1.91
0.31	2.77
0.69	4.33
0.71	0.72
0.8     1.27
0.9     2.19
0.92	1.19
1       0.22
1.08	2.22
1.09	4.17
1.2     3.11
1.21	1.7
1.23	0.43
1.3     4.75
1.301   4.16
1.31	1.26
1.32	3.65
1.321	3.46
1.49	1.02
1.61	3.78
1.68	4.12
1.71	5.98
1.74	2.23
1.79	3.71
1.8     6.24
1.801   4.68
1.81	4.31
1.89	3.89
1.9 	2.66
1.901    5.13
1.91	3.09
1.97	3.7
2.07	7.12
2.08	4.77
2.09	3.42
2.1     0.8
2.101   3.91
2.102   4.07
2.11	3.62
2.2     3.45
2.201   4.07
2.21	3.6
2.211	1.53
2.22	3.26
2.221	4.62
2.31	3.44
2.39	8.09
2.71	6.11
2.77	3.59
2.89	6.59
2.9     5.27
3.12	6.83
3.13	2.3
3.2     7.65
3.201   5.36
3.21	5.5
3.22	1.05
3.24	2.67
3.3     7.07
3.38	4.61
3.39	3.6
3.4     4.98
3.401   4.74
3.41	2.23
3.51	4.08
3.511	4.93
3.61	4.68
3.611	4.57
3.612	5.28
3.613	6.75
3.62	5.96
3.71	5.93
3.8     8.18
3.801   0.66
3.81	2.04
3.811	4.96
3.89	5.42
3.9     7.12
3.98	5.69
3.99	3.44
4.12	3.76
4.13	3.23
4.17	9.35
4.2     3.9
4.3     6.04
4.32	3.82
4.39	5.55
4.391	4.76
4.4     2.66
4.59	1.1
4.591	6.52
4.6     2.07
4.62	4.95
4.68	5.26
4.69	6.02
4.691	4.43
4.692	7.14
4.79	5.08
4.88	4.24
5.11	4.63
5.111	4.26
5.19	3.97
5.191	8.94
5.21	3.81
5.38	3.6
5.39	3.34
5.59	4.9
5.68	8.8
5.91	4.31
6.01	4.24
7.31	7.36];
data.WwJO = data.WwJO / 10^3; % From mg to g and mul to ml
units.WwJO  = {'g', 'ml O2*h-1'};  label.WwJO = {'Wet weight', 'Oxygen consumption'}; 
temp.WwJO   = C2K(21);  units.temp.WwJO = 'K'; label.temp.WwJO = 'temperature';  % 
comment.WwJO = 'All data were aggregated (Fig 3). Temperature between 18 and 24 C. Mean temperature used; Oxygen consumption for salinity between 18 and 26 C and temperature between 18 and 24 C';
bibkey.WwJO = 'ModlFroe1997';

%% grouped plots
set1 = {'tWd_f4', 'tWd_f3', 'tWd_f2', 'tWd_f1'}; subtitle1 = {'McKe1987 food levels 4,3,2,1'};
set2 = {'tL_f', 'tL_m'}; subtitle2 = {'ScarStee2017 data for individual females, males'};
set4 = {'tL1', 'tL2', 'tL3', 'tL4'}; subtitle4 = {'GreaGutj2011 data for 4 food levels'};
set3 = {'tN1_d1', 'tN2_d1', 'tN1_d3', 'tN2_d3', 'tN1_d4', 'tN2_d4'}; subtitle3 = {'Bayer studies cumulative reproduction'};
set5 = {'tN_G1', 'tN_G2', 'tN_G3', 'tN_G4'}; subtitle5 = {'GreaGutj2011 data for 4 food levels'};
metaData.grp.sets = {set1,set2, set3, set4, set5}; metaData.grp.subtitle = {subtitle1,subtitle2, subtitle3, subtitle4, subtitle5};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 3;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Age at birth and age at hatching considered equivalent';
D2 = 'Standard length reported as measurement from the midpoint of the eye to the midpoint of the statocyst situated at the base of the uropods; Total length as measurement from the tip of the rostrum to the posterior tip of the telson excluding the spines.';
D3 = 'All non reported measurement methods are considered standard length';
D4 = 'Males are assumed to differ from females by {p_Am} only';
D5 = 'mod_1: added growth and reproduction data for different food levels and a (small) range of temperatures.';
D6 = 'mod_2: added pseudo-data point k=0.3 to ensure that k < 1';
D7 = 'mod_3: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',65, 'D7',D7);

%% Facts
F1 = 'length-length relationship: SL = TL * 0.8; estimated from drawing';
metaData.bibkey.F1 = 'EPA2009'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The Bayer study reports can be requested by sending an email to: cropscience-transparency@bayer.com';

%% Links
metaData.links.id_CoL = '66BR3'; % Cat of Life
metaData.links.id_ITIS = '682617'; % ITIS
metaData.links.id_EoL = '1040545'; % Ency of Life
metaData.links.id_Wiki = 'Americamysis_bahia'; % Wikipedia
metaData.links.id_ADW = 'Americamysis_bahia'; % ADW
metaData.links.id_Taxo = '3464443'; % Taxonomicon
metaData.links.id_WoRMS = '226286'; % WoRMS


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
bibkey = 'GentGent1983'; type = 'Article'; bib = [ ...  
'author = {Gentille, J. H. and Gentille, S. M. and Hoffman, G.}, ' ...
'year = {1983}, ' ...
'title = {The effects of a chronic mercury exposure on survival, reproduction and population dynamics of \emph{Mysidopsis bahia}}, ' ... 
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {2}, '...
'pages = {61--68}, '...
'doi = {10.1002/etc.5620020107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'KuhnMunn2001'; type = 'Article'; bib = [ ...  
'author = {Kuhn, A. and Munns Jr., W. R. and Champlin, D. and McKinney, R. and Tagliabue, M. and Serbst, J. and Gleason, T.}, ' ...
'year = {2001}, ' ...
'title = {Evaluation of the efficacy of extrapolation population modeling to predict the dynamics of \textit{Americamysis bahia} populations in the laboratory}, ' ... 
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {20.1}, '...
'pages = {213--221}, '...
'doi = {10.1002/etc.5620200125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'LussKuhn1988'; type = 'Article'; bib = [ ...  
'author = {Lussier, S. M. and Kuhn, A. and Chammas, M. J. and Sewall, J.}, ' ...
'year = {1988}, ' ...
'title = {Techniques for the laboratory culture of {M}ysidopsis species ({C}rustacea: {M}ysidacea)}, ' ... 
'journal = {Environmental Toxicology and Chemistry}, ' ...
'volume = {7}, '...
'pages = {969--977}, '...
'doi = {10.1002/etc.5620071203}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'ModlFroe1997'; type = 'Article'; bib = [ ...  
'author = {Modlin, R. F., Froelich, A. J.}, ' ...
'year = {1997}, ' ...
'title = {Influence of temperature, salinity, and weight on the oxygen consumption of a laboratory population of \emph{Americamysis bahia} {M}ysidacea}, ' ... 
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {17.1}, '...
'pages = {21--26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mole1969'; type = 'Article'; bib = [ ...  
'author = {Molenock, J.}, ' ...
'year = {1969}, ' ...
'title = {\emph{Mysidopsis bahia}, a new species of mysid ({C}rustacea: {M}ysidacea) from {G}alveston bay, {T}exas}, ' ... 
'journal = {Tulane Studies in Zoology and Botany}, ' ...
'volume = {15}, '...
'pages = {113--116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McKe1987'; type = 'techreport'; bib = [ ...  
'author = {McKenney Jr., C. L.}, ' ...
'year = {1987}, ' ...
'title = {Optimization of environmental factors during the life cycle of \emph{Mysidopsis bahia}}, ' ... 
'institution = {U.S. Environmental Protection Agency}, ' ...
'number = {EPA/600/M-87/004 (NTIS PB87216446)}, '...
'address = {Washington, D.C.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'ScarStee2017'; type = 'Article'; bib = [ ...  
'author = {Scarfe, D. A. and Steele, C. W.}, ' ...
'year = {2017}, ' ...
'title = {Linear intermolt growth in \emph{Americamysis bahia} ({M}olenock 1969) ({M}ysida, {M}ysidae)}, ' ... 
'journal = {Marine and Freshwater Behaviour and Physiology}, ' ...
'volume = {50.4}, '...
'pages = {257--272}, '...
'doi = {10.1080/10236244.2017.1369075}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'WortPric2002'; type = 'Article'; bib = [ ...  
'author = {Wortham-Neal, J. L. and Price, W. W.}, ' ...
'year = {2002}, ' ...
'title = {Marsupial developmental stages in \emph{Americamysis bahia} ({M}ysida, {M}ysidae)}, ' ... 
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {22.1}, '...
'pages = {98--112}, '...
'doi = {10.1163/20021975-99990213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'EPA2009'; type = 'techreport'; bib = [ ...  
'author = {EPA}, ' ...
'year = {2002}, ' ...
'title = {Culturing \emph{Americamysis bahia} supplement to training video}, ' ... 
'institution = {U.S. Environmental Protection Agency Office of Wastewater Management Water Permits Division 1200 Pennsylvania Ave., NW Washington, DC 20460}, ' ...
'volume = {EPA 833-C-09-001}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Baye2002'; type = 'techreport'; bib = [ ...  
'author = {Bayer}, ' ...
'year = {2002}, ' ...
'title = {A Flow-Through Life-Cycle Toxicity Test with the Saltwater Mysid (\emph{Americamysis bahia})}, ' ... 
'institution = {Bayer}, ' ...
'volume = {Report number M-082820-01-1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Baye2004'; type = 'techreport'; bib = [ ...  
'author = {Bayer}, ' ...
'year = {2004}, ' ...
'title = {Life-Cycle Toxicity Test with Mysids (\emph{Americamysis bahia})}, ' ... 
'institution = {Bayer}, ' ...
'volume = {Report number M-242228-01-1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Baye2006'; type = 'techreport'; bib = [ ...  
'author = {Bayer}, ' ...
'year = {2006}, ' ...
'title = {Life-Cycle Toxicity Test with Mysids (\emph{Americamysis bahia})}, ' ... 
'institution = {Bayer}, ' ...
'volume = {Report number M-281198-01-1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Baye2007'; type = 'techreport'; bib = [ ...  
'author = {Bayer}, ' ...
'year = {2007}, ' ...
'title = {Life-cycle toxicity test with Mysids (\emph{Americamysis bahia}) under flow-through conditions}, ' ... 
'institution = {Bayer}, ' ...
'volume = {Report number M-284852-01-1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baye2020'; type = 'unpublished'; bib = [ ...  
'author = {Bayer}, ' ...
'year = {2020}, ' ...
'title = {unpublished data set generated for inclusion in AmP}, ' ... 
'institution = {Bayer}, ' ...
'volume = {-}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GreaGutj2011'; type = 'Article'; bib = [ ...  
'author = {Grear, J.S., Horowitz, D.B. and Gutjahr-Gobell R.}, ' ...
'year = {2011}, ' ...
'title = {Mysid population responses to resource limitation differ from those predicted by cohort studies}, ' ... 
'journal = {Marine ecology progress series}, ' ...
'volume = {432}, '...
'pages = {115-123}, '...
'doi = {10.3354/meps09158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

