function [data, auxData, metaData, txtData, weights] = mydata_Takydromus_hsuehshanensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Takydromus_hsuehshanensis'; 
metaData.species_en = 'Snow Mountain grasslizard'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww_T'; 'L-Ww'; 'Ww-p+_T'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Shu-Ping Huang'};    
metaData.date_subm = [2017 5 15];              
metaData.email    = {'sphuang0711@gmail.com'};            
metaData.address  = {'National Sun Yat-sen University, Taiwan'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 07 14]; 

%% set data
% zero-variate data

data.ab23 = 65.6;    units.ab23 = 'd';    label.ab23 = 'age at birth';           bibkey.ab23 = 'Chen2007';   
  temp.ab23 = C2K(23); units.temp.ab23 = 'K'; label.temp.ab23 = 'temperature';
data.ab28 = 33.6;    units.ab28 = 'd';    label.ab28 = 'age at birth';           bibkey.ab28 = 'Chen2007';   
  temp.ab28 = C2K(28); units.temp.ab28 = 'K'; label.temp.ab28 = 'temperature';
data.tp = 365*2;     units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'Huan2017';
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365*7.5;    units.am = 'd';      label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Guess based on Lacerta agilis';

data.Lb  = 2.60;     units.Lb  = 'cm';    label.Lb  = 'SVL at hatching';         bibkey.Lb  = 'Chen2007';  
data.Lp  = 5.4;      units.Lp  = 'cm';    label.Lp  = 'SVL at puberty';          bibkey.Lp  = 'Huan1998'; 
data.Li  = 7.2;      units.Li  = 'cm';    label.Li  = 'ultimate SVL';            bibkey.Li  = 'Huan1998';

data.Wwb = 0.40;     units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Chen2007';
data.Wwi = 7.10;     units.Wwi = 'g';     label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Huan2017';
data.Wwi_m = 7.72;   units.Wwi_m = 'g';   label.Wwi_m = 'ultimate wet weight of male';  bibkey.Wwi_m = 'Huan2017';

data.Ri  = 6/365;    units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Huan1998';   
temp.Ri = C2K(28);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '2 till 4 times per year, temp is guessed'; 

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), SVL (cm)
1	14	28	42	1	14	28	42	1	14	28	42	1	14	28	42	1	14	28	42	1	14	28	42	1	14	28	42	1	14	28	42;
2.7 2.97    3.49	3.49	2.63	2.8 	3.1 	3.2 	2.62	2.79	3.15	3.17	2.53	2.9	3	3.25	2.7 	2.9	3.12	3.23	2.5	2.7	3	3.25	2.49	2.75	2.99	3.24	2.7 3.1	3.34	3.5
]';      
%data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d, shu-ping added.
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'raised in lab at 25C room temperature plus a 2 watt bulb for thermoregulation since birth'; 
bibkey.tL = 'Chen2007';

% time-weight
% female starvation at 5C
data.tW_fS5 = [ ... %  time (d), wet weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	14	14	14	14	14	14	14	14	14	14	14	14	28	28	28	28	28	28	28	28	28	28	28	28	42	42	42	42	42	42	42	42	42	42	42	42	56	56	56	56	56	56	56	56	56	56	56	56	70	70	70	70	70	70	70	70	70	70	70	84	84	84	84	84	84	84	84	84	84;
4.17	4.48	4.61	5.16	5.19	5.32	5.51	5.80	6.02	6.62	6.68	7.40	4.00	7.51	4.37	5.63	5.49	6.69	4.63	5.46	4.75	5.32	5.35	6.58	3.98	7.21	4.13	5.58	5.50	6.62	4.41	5.46	4.74	5.08	5.11	6.57	3.927	7.294	3.871	5.595	5.327	6.613	4.37	5.304	4.636	5.041	5.022	6.139	3.927	7.294	3.871	5.595	5.327	6.613	4.37	5.304	4.636	5.041	5.022	6.139	3.93	7.26	3.84	5.26	5.33	6.54	4.40	5.14	4.93	5.03	6.06	3.94	7.27	5.26	5.34	6.55	4.34	5.12	4.92	5.03	5.87
 ]';  
units.tW_fS5  = {'d', 'g'}; label.tW_fS5 = {'time since starvation', 'wet weight', '5 C'}; 
temp.tW_fS5 = C2K(5);  units.temp.tW_fS5 = 'K'; label.temp.tW_fS5 = 'temperature';
comment.tW_fS5 = 'female starvation at 5C during winter'; 
bibkey.tW_fS5 = 'Huan2017';
% male starvation at 5C
data.tW_mS5 = [ ... %  time (d), wet weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	0	14	14	14	14	14	14	14	14	14	14	14	14	14	28	28	28	28	28	28	28	28	28	28	28	28	28	42	42	42	42	42	42	42	42	42	42	42	42	42	56	56	56	56	56	56	56	56	56	56	56	56	56	70	70	70	70	70	70	70	70	70	70	70	70	70	84	84	84	84	84	84	84	84	84	84	84	84	84;
3.89	4.69	4.75	5.12	5.17	5.32	5.40	5.81	5.97	6.19	6.26	7.17	7.68	3.83	7.24	4.59	4.74	6.06	5.03	5.50	6.10	5.34	5.22	6.09	7.66	5.89	3.93	7.23	4.59	4.70	6.09	5.05	5.50	6.27	5.33	5.22	6.10	7.69	5.90	3.607	7.084	4.561	4.528	6.062	4.905	5.33	6.051	5.325	5.114	5.929	7.561	5.658	3.607	7.084	4.561	4.528	6.062	4.905	5.33	6.051	5.325	5.114	5.929	7.561	5.658	3.61	7.07	4.52	4.53	6.09	4.87	5.36	6.01	5.34	5.08	5.75	7.56	5.65	3.55	7.08	4.32	4.54	5.87	4.87	5.33	6.00	5.36	5.08	5.76	7.53	5.64
]';  
units.tW_mS5  = {'d', 'g'}; label.tW_mS5= {'time since starvation', 'wet weight', '5 C'}; 
temp.tW_mS5 = C2K(5);  units.temp.tW_mS5 = 'K'; label.temp.tW_mS5 = 'temperature';
comment.tW_mS5 = 'male starvation at 5C during winter'; 
bibkey.tW_mS5 = 'Huan2017';
% female starvation at 10C
data.tW_fS10 = [ ... %  time (d), wet weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	14	14	14	14	14	14	14	14	14	14	14	14	28	28	28	28	28	28	28	28	28	28	28	28	42	42	42	42	42	42	42	42	56	56	56	56	56	56	56	56	70	70	70	70	70	70	70	70	84	84	84	84	84	84	84;
4.29	4.46	4.79	5.06	5.22	5.32	5.50	5.76	6.16	6.51	6.76	7.11	4.85	5.09	5.99	4.47	4.78	5.86	5.35	6.23	5.09	6.97	4.15	6.85	4.58	5.05	5.92	4.24	4.75	5.84	5.03	6.09	5.08	6.79	3.92	6.35	5.586	4.208	4.663	5.513	4.813	6.106	4.839	3.748	5.586	4.208	4.663	5.513	4.813	6.106	4.839	3.748	5.45	4.15	4.58	5.50	4.51	5.87	4.66	3.69	5.33	4.15	4.34	5.58	5.88	3.57	3.61
]';  
units.tW_fS10  = {'d', 'g'}; label.tW_fS10 = {'time since starvation', 'wet weight', '10 C'};
temp.tW_fS10= C2K(10);  units.temp.tW_fS10 = 'K'; label.temp.tW_fS10 = 'temperature';
comment.tW_fS10 = 'female starvation at 10C during winter'; 
bibkey.tW_fS10 = 'Huan2017';
% male starvation at 10C
data.tW_mS10 = [ ... %  time (d), wet weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	14	14	14	14	14	14	14	14	14	14	14	14	28	28	28	28	28	28	28	28	28	28	28	28	42	42	42	42	42	42	42	42	42	42	42	42	56	56	56	56	56	56	56	56	56	56	56	56	70	70	70	70	70	70	70	70	70	70	70	70	84	84	84	84	84	84	84	84	84	84;
3.90	4.68	4.82	5.02	5.25	5.29	5.67	5.80	6.02	6.17	6.37	6.68	4.60	3.79	5.68	5.11	5.24	6.44	6.18	4.63	5.44	6.01	6.64	4.90	4.57	3.72	5.63	5.04	5.26	6.45	6.07	4.54	5.45	5.94	6.53	4.82	4.029	3.588	5.41	4.867	5.278	6.094	5.648	4.514	5.179	5.661	6.203	4.495	4.029	3.588	5.41	4.867	5.278	6.094	5.648	4.514	5.179	5.661	6.203	4.495	3.95	3.49	5.18	4.78	5.21	6.05	5.40	4.41	5.04	5.61	5.89	4.37	3.44	5.02	4.71	5.19	6.03	4.31	4.81	5.60	5.84	4.28
]';
units.tW_mS10  = {'d', 'g'};  label.tW_mS10 = {'time since starvation', 'wet weight', '10 C'}; 
temp.tW_mS10 = C2K(10);  units.temp.tW_mS10 = 'K'; label.temp.tW_mS10 = 'temperature';
comment.tW_mS10 = 'male starvation at 10C during winter'; 
bibkey.tW_mS10 = 'Huan2017';
% female starvation at 15C
data.tW_fS15 = [ ... %  time (d), wet weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	14	14	14	14	14	14	14	14	14	14	14	14	28	28	28	28	28	28	28	28	28	28	28	42	42	42	42	42	42	56	56	56	56	56	56	70	70	70	70	70	70	84	84	84	84	84;
4.46	4.46	4.81	4.90	5.28	5.30	5.50	5.76	6.26	6.37	6.80	6.99	6.27	5.10	6.09	5.05	6.55	4.40	3.80	4.52	5.16	4.54	5.97	5.27	5.08	5.92	4.88	6.37	4.25	3.64	4.44	5.03	4.06	5.75	5.11	4.755	4.991	6.148	3.828	5.46	4.516	4.755	4.991	6.148	3.828	5.46	4.516	4.66	4.88	6.24	3.49	5.02	4.28	4.57	4.72	6.10	3.26	4.96
]';
units.tW_fS15  = {'d', 'g'};  label.tW_fS15 = {'time since starvation', 'wet weight', '15 C'};
temp.tW_fS15 = C2K(15);  units.temp.tW_fS15 = 'K'; label.temp.tW_fS15 = 'temperature';
comment.tW_fS15 = 'female starvation at 15C during winter'; 
bibkey.tW_fS15 = 'Huan2017';
% male starvation at 15C
data.tW_mS15 = [ ... %  time (d), wet weight (g)
0	0	0	0	0	0	0	0	0	0	0	0	14	14	14	14	14	14	14	14	14	14	14	28	28	28	28	28	28	28	28	28	28	28	28	42	42	42	42	42	42	42	42	42	42	56	56	56	56	56	56	56	56	56	56	70	70	70	70	70	70	70	70	70	84	84	84	84	84	84;
4.42	4.45	4.87	4.91	5.26	5.27	5.68	5.75	6.05	6.11	6.45	6.56	6.22	4.48	4.64	3.98	4.85	4.15	5.27	5.70	5.97	5.54	5.49	5.79	6.08	4.42	4.50	3.76	4.66	3.99	5.12	5.63	5.78	5.54	5.31	4.983	5.919	4.041	4.275	4.004	4.932	5.392	5.582	5.333	4.885	4.983	5.919	4.041	4.275	4.004	4.932	5.392	5.582	5.333	4.885	5.92	3.94	4.29	3.82	4.70	5.25	5.01	5.13	4.66	5.06	3.88	4.11	5.29	4.88	4.70
]';
units.tW_mS15  = {'d', 'g'};  label.tW_mS15 = {'time since starvation', 'wet weight', '15 C'}; 
temp.tW_mS15 = C2K(15);  units.temp.tW_mS15 = 'K'; label.temp.tW_mS15 = 'temperature';
comment.tW_mS15 = 'male starvation at 15C during winter'; 
bibkey.tW_mS15 = 'Huan2017';

% length-weight
data.LW = [ ... % SVL (cm), wet weight (g) 
4.94	5.04	5.04	5.04	5.13	5.13	5.13	5.22	5.24	5.33	5.32	5.42	5.42	5.52	5.52	5.62	5.61	5.71	5.71	5.71	5.71	5.81	5.82	5.82	5.82	5.82	5.82	5.82	5.92	5.92	5.92	5.93	5.92	5.92	6.01	6.01	6.01	6.01	6.01	6.01	6.01	6.01	6.01	6.03	6.03	6.01	6.01	6.12	6.12	6.12	6.11	6.12	6.12	6.12	6.11	6.11	6.12	6.11	6.11	6.11	6.22	6.22	6.22	6.22	6.21	6.22	6.21	6.22	6.21	6.22	6.32	6.32	6.32	6.31	6.31	6.31	6.31	6.31	6.32	6.43	6.41	6.41	6.43	6.43	6.43	6.41	6.53	6.53	6.52	6.52	6.52	6.53	6.52	6.62	6.62	6.73	6.73	6.73	6.73	6.93	6.93	7.14	7.14	2.74	2.70	2.60	2.63	2.64	2.62	2.63	2.53	2.50	2.47	2.72	2.71	2.76	2.67	2.58	2.68	2.55	2.49	2.72	2.60	2.45	2.47	2.75	2.70	2.55	3.45	3.49	3.25	3.20	3.27	3.17	3.00	3.25	3.25	3.00	3.20	3.48	3.30	3.15	3.15	3.20	3.00	3.24	3.30	3.18	3.00	3.16	3.36	3.50;
3.27	4.32	3.74	3.40	3.44	3.22	3.06	3.06	3.20	3.65	4.29	4.57	4.07	4.07	4.98	4.86	3.63	3.44	3.88	4.22	4.70	3.60	4.10	4.20	4.38	4.48	4.79	5.51	3.96	4.06	4.19	4.67	4.79	5.75	6.48	5.72	5.64	5.39	5.29	4.91	4.83	4.75	4.49	4.29	4.21	4.11	3.89	4.07	4.35	4.55	4.85	5.08	5.50	5.72	5.92	6.04	6.20	6.46	6.56	6.62	3.67	4.57	4.76	4.94	5.34	5.56	5.88	6.16	6.37	6.53	7.39	6.73	6.25	6.07	5.66	5.44	5.34	5.22	4.62	5.59	5.79	6.03	6.15	6.25	6.37	6.65	6.41	5.75	5.53	5.23	4.82	4.42	4.30	5.29	7.00	7.72	7.26	6.46	6.30	7.04	7.57	8.72	5.90	0.42	0.45	0.43	0.36	0.37	0.42	0.37	0.33	0.44	0.37	0.45	0.41	0.44	0.43	0.37	0.40	0.33	0.38	0.39	0.41	0.33	0.33	0.42	0.40	0.33	0.86	0.95	0.79	0.81	0.90	0.66	0.59	0.93	0.97	0.70	0.46	0.97	0.98	0.89	0.73	0.89	0.63	0.83	0.76	0.83	0.65	0.80	0.89	1.04
]';   
units.LW = {'cm', 'g'};     label.LW = {'SVL', 'wet weight'};  
comment.LW = 'Taroko National Park, year 1994'; 
bibkey.LW = 'Huan1998';

% weight-standard metabolic rate
% males at 10 C
data.WwpT_m10 = [ ... % wet weight (g), SMR (J/h)
4.54	4.13	3.47	5.59	3.93	3.46	4.04	4.63	4.59	3.37	2.50	5.51	7.72	3.55	5.66	4.56	3.43;
4.38	2.59	1.37	3.20	3.06	0.97	2.72	2.16	2.58	2.21	1.48	2.38	6.43	2.67	2.20	6.35	3.82
]'; 
[W, i] = sort(data.WwpT_m10(:,1)); data.WwpT_m10 = data.WwpT_m10(i,:); % sort weights
units.WwpT_m10 = {'g', 'J/h'};     label.WwpT_m10= {'wet weight', 'standard metabolic rate', '10 C'};  
temp.WwpT_m10 = C2K(10);  units.temp.WwpT_m10 = 'K'; label.temp.WwpT_m10 = 'temperature';
bibkey.WwpT_m10 = 'Huan2017';
comment.WwpT_m10 = 'Data for males'; 
% females at 10 C
data.WwpT_f10 = [ ...% wet weight (g), SMR (J/h)
3.73	4.04	3.35	2.75	4.83	4.82	1.94	3.57	1.49	1.97	1.80	1.30	3.88	5.33	4.36	2.31	3.59	2.03	2.06	4.11	2.91	3.56	3.03	5.42	5.68;
1.12	2.98	2.87	2.05	2.52	3.02	1.12	1.44	0.95	0.90	1.00	0.80	2.03	2.55	1.40	1.06	2.59	0.95	1.42	1.71	5.60	3.66	3.77	2.66	3.31
]'; 
[W, i] = sort(data.WwpT_f10(:,1)); data.WwpT_f10 = data.WwpT_f10(i,:); % sort weights
units.WwpT_f10 = {'g', 'J/h'};     label.WwpT_f10= {'wet weight', 'standard metabolic rate', '10 C'};  
temp.WwpT_f10 = C2K(10);  units.temp.WwpT_f10 = 'K'; label.temp.WwpT_f10 = 'temperature';
bibkey.WwpT_f10 = 'Huan2017';
comment.WwpT_f10 = 'Data for females'; 
% males at 20 C
data.WwpT_m20= [ ... % wet weight (g), SMR (J/h)
4.19	4.05	4.25	5.41	3.48	4.85	4.17	5.26	4.34	6.00	2.89	3.64	6.47	3.13	6.85	6.08	4.98	3.51	3.73;
9.87	9.12	12.09	20.64	12.70	8.08	8.11	13.50	6.46	7.28	5.98	9.21	19.34	8.72	12.39	7.09	8.57	5.09	6.05
]'; 
[W, i] = sort(data.WwpT_m20(:,1)); data.WwpT_m20 = data.WwpT_m20(i,:); % sort weights
units.WwpT_m20 = {'g', 'J/h'};     label.WwpT_m20= {'wet weight', 'standard metabolic rate', '20 C'};  
temp.WwpT_m20 = C2K(20);  units.temp.WwpT_m20 = 'K'; label.temp.WwpT_m20 = 'temperature';
bibkey.WwpT_m20 = 'Huan2017';
comment.WwpT_m20 = 'Data for males'; 
% females at 20 C
data.WwpT_f20= [ ...% wet weight (g), SMR (J/h)
3.99	2.33	3.52	6.36	2.68	2.99	1.77	2.24	1.13	4.21	6.50	2.60	2.52	2.86	2.89	5.01	1.73	1.61	3.32	3.93;
12.96	5.08	10.28	13.27	4.97	5.23	3.34	9.83	3.16	10.53	30.35	14.27	8.78	8.66	18.06	18.43	4.79	8.52	7.96	5.36
]'; 
[W, i] = sort(data.WwpT_f20(:,1)); data.WwpT_f20 = data.WwpT_f20(i,:); % sort weights
units.WwpT_f20 = {'g', 'J/h'};     label.WwpT_f20= {'wet weight', 'standard metabolic rate', '20 C'};  
temp.WwpT_f20 = C2K(20);  units.temp.WwpT_f20 = 'K'; label.temp.WwpT_f20 = 'temperature';
bibkey.WwpT_f20 = 'Huan2017';
comment.WwpT_f20 = 'Data for females'; 
% males at 30 C
data.WwpT_m30 =  [...% wet weight (g), SMR (J/h)
5.18	4.55	3.19	4.50	5.89	5.28	5.37	4.41	4.57	5.21	4.16	4.80	3.53	7.72	4.45	5.33	2.59	3.93	2.11;
27.76	24.44	16.79	21.48	37.92	8.62	33.68	23.27	15.21	18.24	14.20	44.37	37.19	64.33	20.22	27.07	12.20	18.60	18.40
]'; 
[W, i] = sort(data.WwpT_m30(:,1)); data.WwpT_m30 = data.WwpT_m30(i,:); % sort weights
units.WwpT_m30 = {'g', 'J/h'};  label.WwpT_m30 = {'wet weight', 'standard metabolic rate', '30 C'};  
temp.WwpT_m30 = C2K(30);  units.temp.WwpT_m30 = 'K'; label.temp.WwpT_m30 = 'temperature';
bibkey.WwpT_m30 = 'Huan2017';
comment.WwpT_m30 = 'Data for males'; 
% females at 30 C
data.WwpT_f30 =  [...% wet weight (g), SMR (J/h)
4.33	5.24	3.25	4.41	2.64	3.19	1.90	2.53	1.60	5.25	6.55	6.33	2.76	3.96	3.24	3.26	2.35	5.11	1.77	2.10
25.02	27.75	16.52	27.35	12.38	17.61	8.01	10.65	7.16	29.50	59.07	57.05	28.17	29.41	28.12	20.94	16.07	37.45	8.15	19.11
]'; 
[W, i] = sort(data.WwpT_f30(:,1)); data.WwpT_f30 = data.WwpT_f30(i,:); % sort weights
units.WwpT_f30 = {'g', 'J/h'};  label.WwpT_f30= {'wet weight', 'standard metabolic rate', '30 C'};  
temp.WwpT_f30 = C2K(30);  units.temp.WwpT_f30 = 'K'; label.temp.WwpT_f30 = 'temperature';
bibkey.WwpT_f30 = 'Huan2017';
comment.WwpT_f30 = 'Data for females'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fS15 = weights.tW_fS15 * 0;
weights.tW_fS10 = weights.tW_fS10 * 0;
weights.tW_fS5 = weights.tW_fS5 * 0;
weights.tW_mS15 = weights.tW_mS15 * 0;
weights.tW_mS10 = weights.tW_mS10 * 0;
weights.tW_mS5 = weights.tW_mS5 * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_fS15','tW_fS10','tW_fS5'}; subtitle1 = {'Starving females at 15, 10, 5C'};
set2 = {'tW_mS15','tW_mS10','tW_mS5'}; subtitle2 = {'Starving males at 15, 10, 5C'};
set3 = {'WwpT_f30','WwpT_f20','WwpT_f10'}; subtitle3 = {'Females at 30, 20, 10C'};
set4 = {'WwpT_m30','WwpT_m20','WwpT_m10'}; subtitle4 = {'Males at 30, 20, 10C'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '54KRK'; % Cat of Life
metaData.links.id_ITIS = '1155433'; % ITIS
metaData.links.id_EoL = '290159'; % Ency of Life
metaData.links.id_Wiki = 'Takydromus_hsuehshanensis'; % Wikipedia
metaData.links.id_ADW = 'Takydromus_hsuehshanensis'; % ADW
metaData.links.id_Taxo = '642687'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Takydromus&species=hsuehshanensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Takydromus}}';
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
bibkey = 'Chen2007'; type = 'PhDthesis'; bib = [ ... 
'author = {Chen, Y. H.}, ' ... 
'year = {2007}, ' ...
'title = {The temperature effect on embryos and hatchlings in high altitudinal grass lizard, \emph{Takydromus hsuehshanensis}}, ' ...
'school = {National Taiwan Normal University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Huan1998'; type = 'Article'; bib = [ ... %used in estimating the maximum reproduction per year
'author = {Wen-San Huang}, ' ... 
'year = {1998}, ' ...
'title = {Reproductive Cycles of the Grass Lizard, \emph{Takydromus hsuehshanensis}, with Comments on Reproductive Patterns of Lizards from the Central High Elevation Area of {T}aiwan}, ' ...
'journal = {Copeia}, ' ...
'volume = {1998}, ' ...
'number = {4}, '...
'pages = {866--873}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Huan2017'; type = 'Misc'; bib = [ ...
'author = {Shu-Ping Huang}, ' ... 
'year = {2017}, ' ...
'howpublished = {Unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1055279/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

