function [data, auxData, metaData, txtData, weights] = mydata_Ctenophorus_ornatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Agamidae';
metaData.species    = 'Ctenophorus_ornatus'; 
metaData.species_en = 'Ornate dragon'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'T-ab'; 'L-Ww'; 't-Ww_T'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Nicola Mitchell'};                          
metaData.date_subm = [2015 04 27];                           
metaData.email     = {'nicola.mitchell@uwa.edu.au'};               
metaData.address   = {'The University of Western Australia, 6009, Australia'};      

metaData.author_mod_1   = {'Nicola Mitchell'};                          
metaData.date_mod_1     = [2017 05 30];                           
metaData.email_mod_1    = {'nicola.mitchell@uwa.edu.au'};               
metaData.address_mod_1  = {'The University of Western Australia, 6009, Australia'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 07 16];

%% set data
% zero-variate data

data.ab = 111;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Harl2000';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 316;     units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'Leba2015';
  temp.ap = C2K(27.5);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = ' average age at 6.8 cm threshold of 7 females reared in lab, incub. temps btwn 27-31 C';
data.am = 2500;    units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Brad1965';   
  temp.am = C2K(25.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.565;   units.Lb  = 'cm';  label.Lb  = 'SV length at birth';       bibkey.Lb  = 'Leba2015';  
  comment.Lb = 'Average lengh of 23 hatchlings incubated at between 27-31C in the lab';
data.Lp  = 6.8;   units.Lp  = 'cm';  label.Lp  = 'SV length at puberty';      bibkey.Lp  = 'Brad1965'; 
  comment.Lp = 'for females, also cited by Baverstock 1972, field data on visible egg follicles from Lebas supports this size';
data.Li  = 10.91;   units.Li  = 'cm';  label.Li  = 'ultimate SV length';      bibkey.Li  = 'Leba2015';
  comment.Li = 'largest male captured in the field, n animals approx 2000';

data.Ww0 = 1.595; units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';            bibkey.Ww0 = 'Leba2015';
  comment.Ww0 = 'Average mass of 33 eggs laid in lab by wild-caught females';
data.Wwb = 1.844; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Leba2015';
  comment.Wwb = 'Average mass of 24 hatchlings incubated at between 27-31C in the lab';
data.Wwp = 12.97;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Leba2015';
  comment.Wwp = 'verage mass of 9 females caught in the field at the threshold SVL of ~6.8 cm';
data.Wwi = 39.15;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Leba2015';
  comment.Wwi = 'largest male captured in the field, n animals approx 2000';  

data.Ri  = 12/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Leba2015';   
temp.Ri = C2K(22.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wild females produce up to 3 clutches per season, maximum no. eggs palpated = 4,  Mike estimated a CTE assuming 14h at 20 C and 10 h at 37 C in summer and 15C constant in winter';  

% uni-variate data

% temperature - age at birth
data.Tab = [ ...
  27 27 27 27 27 27 29 29 29 29 29 29 29 29 29 31 31 31 31 31 31 31 31; % C, incubation temperature 
  81 85 82 82 81 84 75 75 71 72 73 72 73 72 76 61 62 63 63 63 58 58 64]'; % d, age at birth
units.Tab = {'C', 'd'};  label.Tab = {'incubation temperature', 'age at birth'};  
bibkey.Tab = 'Leba2015';

% length - weight of laboratory-reared lizards
% Female 16 offspring
data.LW_M1021 = [ ...
  3.62	4.958	5.277	5.355	5.611	5.834	5.825	6.29	6.353	5.603	6.897	6.985	7.164	7.408	8.337;    % cm, snout-to-vent length at f,
  1.9121	5.23	6.03	6.75	7.85	8.39	8.17	10.14	10.73	12	13.97	13.64	15.49	16.1	23.88]';  % g, wet weight at f and T
units.LW_M1021 = {'cm', 'g'};  label.LW_M1021 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_M1021 = 'Leba2015';
%
data.LW_M1032 = [ ...
  3.517	4.307	4.553	4.63	4.968	5.165	5.263	5.395	5.77	5.881	6.134	6.476	6.526;      % cm, snout-to-vent length at f,
  1.63	3.13	3.56	3.72	4.8	5.8	6.01	6.22	7.51	7.85	10.11	11.37	12.44]';  % g, wet weight at f and T
units.LW_M1032 = {'cm', 'g'};  label.LW_M1032 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_M1032 = 'Leba2015';
%
data.LW_F1038 = [ ...
  3.546	4.552	4.632	5.011	5.299	5.501	5.708	6.04	6.032	6.166	6.235	6.372	6.494;   % cm, snout-to-vent length at f,
  1.8141	3.35	4.08	4.74	5.61	6.41	6.75	7.91	8.91	8.01	9.46	9.6	10.6]';  % g, wet weight at f and T
units.LW_F1038 = {'cm', 'g'};  label.LW_F1038 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_F1038 = 'Leba2015';
% Female 19 offspring
data.LW_F1024 = [ ...
  3.667	4.571	4.756	4.975	5.151	5.282	5.335	5.51	5.579	5.743	6.067	6.176	6.422	6.486	7.715; % cm, snout-to-vent length at f,
  1.9758	4.27	4.66	5.33	5.74	6.2	5.92	6.92	7.34	7.6	9.02	9.88	10.85	12.04	15.79]';   % g, wet weight at f and T
units.LW_F1024 = {'cm', 'g'}; label.LW_F1024 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_F1024 = 'Leba2015';
%
data.LW_M1030 = [ ...
  3.775	4.338	4.585	4.749	5.136	5.443	5.686	6.188	6.425	6.568	7.228	7.312	7.69	7.733	8.64; % cm, snout-to-vent length at f,
  1.8846	3.66	4.12	4.8	5.69	6.54	7	8.92	9.84	10.63	15.6	14.65	17.71	18.59	23.82]';  % g, wet weight at f and T
units.LW_M1030 = {'cm', 'g'}; label.LW_M1030 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_M1030 = 'Leba2015';
%
data.LW_F1043 = [ ...
  3.529	4.462	4.495	4.655	4.878	5.031	5.221	5.463	5.614	5.621	5.953	6.065	6.327	6.27	6.9;  % cm, snout-to-vent length at f,
  1.93	3.49	3.99	4	5	5.34	5.43	6.43	6.65	7.08	8.62	9.02	9.16	9.67	13.73]';      % g, wet weight at f and T
units.LW_F1043 = {'cm', 'g'}; label.LW_F1043 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_F1043 = 'Leba2015';
%Female 17 offspring
data.LW_F1025 = [ ...
  3.456	4.135	4.309	4.578	4.801	5.108	5.139	5.46	5.648	5.821	6.051	6.177	6.456	6.485	7.439;        % cm, snout-to-vent length at f,
  2.1307	3.39	3.81	4.25	4.58	5.38	5.67	6.59	6.99	7.29	8.66	9.02	10.65	10.49	17.17]';  % g, wet weight at f and T
units.LW_F1025 = {'cm', 'g'}; label.LW_F1025 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_F1025 = 'Leba2015';
%
data.LW_F1035 = [ ...
  3.534	4.537	4.595	4.983	5.108	5.307	5.353	5.599	5.67	5.857	6.167	6.319	6.903  8.212; % cm, snout-to-vent length at f,
  1.9	3.7	4.42	5.11	5.33	5.68	6.18	7.14	7.86	8	10.61	10.07	12.78  20.18]';       % g, wet weight at f and T
units.LW_F1035 = {'cm', 'g'}; label.LW_F1035 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_F1035 = 'Leba2015';
%
data.LW_F1041 = [ ...
  3.491	4.234	4.368	4.676	4.88	5.075	5.276	5.667	5.894	5.904	6.257	6.465	6.831	6.979; % cm, snout-to-vent length at f,
  1.94	3.42	3.98	4.13	5.25	5.52	5.71	6.84	8.01	8	10.5	11.35	12.89	13.27]';   % g, wet weight at f and T
units.LW_F1041 = {'cm', 'g'}; label.LW_F1041 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_F1041 = 'Leba2015';
%Female 340 offspring
data.LW_M1026 = [ ...
  3.532	4.593	4.867	5.219	5.482	6.069	6.384	6.529	6.605	6.775	7.121	7.202	7.657	7.702	8.16;      % cm, snout-to-vent length at f,
  1.7	3.73	4.8	5.7	6.63	8.39	9.43	11.27	11.69	12.33	14.35	15	16.26	17.23	23.1]';  % g, wet weight at f and T
units.LW_M1026 = {'cm', 'g'}; label.LW_M1026 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_M1026 = 'Leba2015';
%
data.LW_F1037 = [ ...
  3.467	4.092	4.217	4.331	4.613	5.03	5.052	5.633	5.786	6.008	6.404	6.599	6.729	6.93	7.915;  % cm, snout-to-vent length at f,
  1.71	2.93	3.35	3.9	4.79	5.94	6.18	7.53	8.12	9.01	12.19	12.5	13.67	14.8	22.03]';   % g, wet weight at f and T
units.LW_F1037 = {'cm', 'g'}; label.LW_F1037 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_F1037 = 'Leba2015';
%
data.LW_F1040 = [ ...
  3.539	4.215	4.425	4.701	4.989	5.356	5.493	5.63	5.905	6.035	6.474	6.834	6.916	7.054;      % cm, snout-to-vent length at f,
  1.71	2.93	3.64	4.6	5.19	6.42	6.37	6.82	7.3	8.56	11.04	12.29	12.7	13.92]';  % g, wet weight at f and T
units.LW_F1040 = {'cm', 'g'}; label.LW_F1040 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_F1040 = 'Leba2015';
%Female 429 offspring
data.LW_M1023 = [ ...
  3.597	4.068	4.365	4.786	5.038	5.278	5.314	5.68	5.83	5.898	6.371	7.015	7.163;      % cm, snout-to-vent length at f,
  1.7126	2.82	3.5	4.61	4.85	5.39	5.8	7.3	8.2	7.55	10.21	13.11	14.03]';  % g, wet weight at f and T
units.LW_M1023 = {'cm', 'g'}; label.LW_M1023 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_M1023 = 'Leba2015';
%
data.LW_M1029 = [ ...
  3.534	4.004	4.437	4.693	4.667	4.956	5.122	5.616	5.514	5.523	5.645	6.255	6.515	6.555;      % cm, snout-to-vent length at f,
  2.0241	2.57	3.45	4.4	4.14	4.88	5.28	7.2	6.83	6.67	6.93	9.66	10.69	11.56]';  % g, wet weight at f and T
units.LW_M1029 = {'cm', 'g'}; label.LW_M1029 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_M1029 = 'Leba2015';
%
data.LW_M1033 = [ ...
  3.613	4.193	4.265	4.578	4.752	5.192	5.186	5.575	5.735	6.036	6.212	6.374	6.762	6.765;      % cm, snout-to-vent length at f,
  1.94	3.11	3.31	3.59	4.47	5.41	5.19	6.82	6.93	8	10.08	11.92	14.16	13.7]';  % g, wet weight at f and T
units.LW_M1033 = {'cm', 'g'}; label.LW_M1033 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_M1033 = 'Leba2015';
%
data.LW_M1042 = [ ...
  3.534	4.323	4.42	4.622	4.764	5.154	5.236	5.681	5.951	6.151	6.452	6.891	7.104;      % cm, snout-to-vent length at f,
  1.99	3.15	3.36	3.78	4.75	5.64	5.76	7.67	8.3	9.82	11.57	14.04	15.25]';  % g, wet weight at f and T
units.LW_M1042 = {'cm', 'g'}; label.LW_M1042 = {'snout-to-vent-length', 'wet weight'};  
bibkey.LW_M1042 = 'Leba2015';

% age and weight of laboratory-reared lizards
% M1021 egg weight known (F16), day/night temp: 31 and 27.5 C
data.tW_M1021 = [ ...
  0	61	127	133	140	146	161	169	183	194	204	226	244	282	302	357	763;  % d, time at wet weight
  1.73	1.9121	5.23	6.03	6.75	7.85	8.39	8.17	10.14	10.73	12	13.97	13.64	15.49	16.1	17.23	23.88]'; % g, wet weight at f and T
units.tW_M1021 = {'d', 'g'};  label.tW_M1021 = {'time since birth', 'wet weight'};  
temp.tW_M1021 = C2K((31+27.5)/2); units.temp.tW_M1021 = 'K'; label.temp.tW_M1021 = 'temperature';
bibkey.tW_M1021 = 'Leba2015';
% M1032 egg weight known (F16), day/night temp: 29 and 27.5 C
data.tW_M1032 = [ ...
  0	75	127	133	140	146	161	169	184	194	204	237	271	306	357	644;  % d, time at wet weight
  1.77	1.63	3.13	3.56	3.72	4.8	5.8	6.01	6.22	7.51	7.85	10.11	11.37	12.44	13.5	15.44]'; % g, wet weight at f and T
units.tW_M1032 = {'d', 'g'}; label.tW_M1032 = {'time since birth', 'wet weight'};  
temp.tW_M1032 = C2K((29+27.5)/2); units.temp.tW_M1032 = 'K'; label.temp.tW_M1032 = 'temperature';
bibkey.tW_M1032 = 'Leba2015';
% F1038 egg weight known (F16), day/night temp: 27 and 27.5 C
data.tW_F1038 = [ ...
  0	81	127	134	140	146	161	169	184	194	204	237	272	282	300	357	655;  % d, time at wet weight
  1.74	1.8141	3.35	4.08	4.74	5.61	6.41	6.75	7.91	8.91	8.01	9.46	9.04	9.6	10.6	12.5	15.73]'; % g, wet weight at f and T
units.tW_F1038 = {'d', 'g'};     label.tW_F1038 = {'time since birth', 'wet weight'};  
temp.tW_F1038 = C2K((27+27.5)/2); units.temp.tW_F1038 = 'K'; label.temp.tW_F1038 = 'temperature';
bibkey.tW_F1038 = 'Leba2015';
% F1024 egg weight known (F19), day/night temp: 31 and 27.5 C
data.tW_F1024 = [ ...
  0	63	127	133	140	146	161	169	184	194	204	219	237	259	300	357	763;  % d, time at wet weight
  1.62	1.9758	4.27	4.66	5.33	5.74	6.2	5.92	6.92	7.34	7.6	9.02	9.88	10.85	12.04	12.95	15.79]'; % g, wet weight at f and T
units.tW_F1024 = {'d', 'g'};   label.tW_F1024 = {'time since birth', 'wet weight'};  
temp.tW_F1024 = C2K((31+27.5)/2); units.temp.tW_F1024 = 'K'; label.temp.tW_F1024 = 'temperature';
bibkey.tW_F1024 = 'Leba2015';
%M1030 egg weight known (F19), day/night temp: 29 and 27.5 C
data.tW_M1030 = [ ...
  0  72	127	133	140	146	161	169	184	194	204	226	235	250	282	300	357	468	763;  % d, time at wet weight
  1.63  1.8846	3.66	4.12	4.8	5.69	6.54	7	8.92	9.84	10.63	15.6	14.65	15.45	17.71	18.59	19.6	23.02	23.82]'; % g, wet weight at f and T
units.tW_M1030 = {'d', 'g'};  label.tW_M1030 = {'time since birth', 'wet weight'};  
temp.tW_M1030 = C2K((29+27.5)/2); units.temp.tW_M1030 = 'K'; label.temp.tW_M1030 = 'temperature';
bibkey.tW_M1030 = 'Leba2015';
%F1043 egg weight unknown (F19), day/night temp: 27 and 27.5 C
data.tW_F1043 = [ ...
  82	125	131	138	144	159	167	182	192	202	221	235	280	284	306	355	642	761;  % d, time at wet weight
  1.93	3.49	3.99	4	5	5.34	5.43	6.43	6.65	7.08	8.62	9.02	9.16	9.1	9.67	11.26	13.64	13.73]'; % g, wet weight at f and T
units.tW_F1043 = {'d', 'g'};     label.tW_F1043 = {'time since birth', 'wet weight'};  
temp.tW_F1043 = C2K((27+27.5)/2); units.temp.tW_F1043 = 'K'; label.temp.tW_F1043 = 'temperature';
bibkey.tW_F1043 = 'Leba2015';
%F1025 egg weight unknown (F17), day/night temp: 31 and 27.5 C
data.tW_F1025 = [ ...
  64	127	133	140	146	161	169	184	194	204	219	237	259	300	357	763;  % d, time at wet weight
  2.1307	3.39	3.81	4.25	4.58	5.38	5.67	6.59	6.99	7.29	8.66	9.02	10.65	10.49	13.5	17.17]'; % g, wet weight at f and T
units.tW_F1025 = {'d', 'g'};     label.tW_F1025 = {'time since birth', 'wet weight'};  
temp.tW_F1025 = C2K((31+27.5)/2); units.temp.tW_F1025 = 'K'; label.temp.tW_F1025 = 'temperature';
bibkey.tW_F1025 = 'Leba2015';
% F1035 egg weight unknown (F17), day/night temp: 29 and 27.5 C
data.tW_F1035 = [ ...
  64	127	133	140	146	161	169	184	194	204	219	237	259	300	357	763;  % d, time at wet weight
  2.1307	3.39	3.81	4.25	4.58	5.38	5.67	6.59	6.99	7.29	8.66	9.02	10.65	10.49	13.5	17.17]'; % g, wet weight at f and T
units.tW_F1035 = {'d', 'g'};     label.tW_F1035 = {'time since birth', 'wet weight'};  
temp.tW_F1035 = C2K((29+27.5)/2); units.temp.tW_F1035 = 'K'; label.temp.tW_F1035 = 'temperature';
bibkey.tW_F1035 = 'Leba2015';
%F1041 egg weight unknown (F17), day/night temp: 27 and 27.5 C
data.tW_F1041 = [ ...
  82	125	131	138	144	159	167	182	192	202	221	235	270	300	355	642;  % d, time at wet weight
  1.94	3.42	3.98	4.13	5.25	5.52	5.71	6.84	8.01	8	10.5	11.35	12.89	13.27	15.03	17.66]'; % g, wet weight at f and T
units.tW_F1041 = {'d', 'g'};     label.tW_F1041 = {'time since birth', 'wet weight'};  
temp.tW_F1041 = C2K((27+27.5)/2); units.temp.tW_F1041 = 'K'; label.temp.tW_F1041 = 'temperature';
bibkey.tW_F1041 = 'Leba2015';
%M1026 egg weight unknown (F340), day/night temp: 27 and 27.5 C
data.tW_M1026 = [ ...
  61	125	131	138	144	159	167	182	192	202	221	228	280	300	355	642	761;  % d, time at wet weight
  1.7	3.73	4.8	5.7	6.63	8.39	9.43	11.27	11.69	12.33	14.35	15	16.26	17.23	18.54	21.31	23.1]'; % g, wet weight at f and T
units.tW_M1026 = {'d', 'g'};     label.tW_M1026 = {'time since birth', 'wet weight'};  
temp.tW_M1026 = C2K((27+27.5)/2); units.temp.tW_M1026 = 'K'; label.temp.tW_M1026 = 'temperature';
bibkey.tW_M1026 = 'Leba2015';
% F1037 egg weight unknown (F340), day/night temp: 31 and 27.5 C
data.tW_F1037 = [ ...
  72	120	126	133	139	154	162	177	187	197	211	237	244	302	352	756;  % d, time at wet weight
  1.71	2.93	3.35	3.9	4.79	5.94	6.18	7.53	8.12	9.01	12.19	12.5	13.67	14.8	17.93	22.03]'; % g, wet weight at f and T
units.tW_F1037 = {'d', 'g'};     label.tW_F1037 = {'time since birth', 'wet weight'};  
temp.tW_F1037 = C2K((31+27.5)/2); units.temp.tW_F1037 = 'K'; label.temp.tW_F1037 = 'temperature';
bibkey.tW_F1037 = 'Leba2015';
% F1040 egg weight unknown (F340), day/night temp: 29 and 27.5 C
data.tW_F1040 = [ ...
  81	125	131	138	144	159	167	181	192	202	224	250	280	299	375	653;  % d, time at wet weight
  1.71	2.93	3.64	4.6	5.19	6.42	6.37	6.82	7.3	8.56	11.04	12.29	12.7	13.92	14.47	19.49]'; % g, wet weight at f and T
units.tW_F1040 = {'d', 'g'};  label.tW_F1040 = {'time since birth', 'wet weight'};  
temp.tW_F1040 = C2K((29+27.5)/2); units.temp.tW_F1040 = 'K'; label.temp.tW_F1040 = 'temperature';
bibkey.tW_F1040 = 'Leba2015';
% M1023 egg weight known (F429), day/night temp: 31 and 27.5 C
data.tW_M1023 = [ ...
  0	63	127	133	140	146	161	169	184	194	204	230	271	306	357	644;  % d, time at wet weight
  1.77	1.7126	2.82	3.5	4.61	4.85	5.39	5.8	7.3	8.2	7.55	10.21	13.11	14.03	16.28	20.71]'; % g, wet weight at f and T
units.tW_M1023 = {'d', 'g'};     label.tW_M1023 = {'time since birth', 'wet weight'};  
temp.tW_M1023 = C2K((31+27.5)/2); units.temp.tW_M1023 = 'K'; label.temp.tW_M1023 = 'temperature';
bibkey.tW_M1023 = 'Leba2015';
% M1029 egg weight known (F429), day/night temp: 29 and 27.5 C
data.tW_M1029 = [ ...
  0	71	127	133	140	146	161	169	184	194	204	218	252	282	300	357	538;  % d, time at wet weight
  1.71	2.0241	2.57	3.45	4.4	4.14	4.88	5.28	7.2	6.83	6.67	6.93	9.66	10.69	11.56	13.94	15.97]'; % g, wet weight at f and T
units.tW_M1029 = {'d', 'g'}; label.tW_M1029 = {'time since birth', 'wet weight'};  
temp.tW_M1029 = C2K((29+27.5)/2); units.temp.tW_M1029 = 'K'; label.temp.tW_M1029 = 'temperature';
bibkey.tW_M1029 = 'Leba2015';
% M1033 egg weight unknown (F429), day/night temp: 31 and 27.5 C
data.tW_M1033 = [ ...
  76	127	133	140	147	161	169	184	194	204	218	237	251	308	357	644	763;  % d, time at wet weight
  1.94	3.11	3.31	3.59	4.47	5.41	5.19	6.82	6.93	8	10.08	11.92	14.16	13.7	15.71	18.6	19.6]'; % g, wet weight at f and T
units.tW_M1033 = {'d', 'g'};     label.tW_M1033 = {'time since birth', 'wet weight'};  
temp.tW_M1033 = C2K((31+27.5)/2); units.temp.tW_M1033 = 'K'; label.temp.tW_M1033 = 'temperature';
bibkey.tW_M1033 = 'Leba2015';
% M1042 egg weight known (F429), day/night temp: 27 and 27.5 C
data.tW_M1042 = [ ...
  0	85	127	133	140	146	161	169	184	194	204	230	271	306	357;  % d, time at wet weight
  1.79	1.99	3.15	3.36	3.78	4.75	5.64	5.76	7.67	8.3	9.82	11.57	14.04	15.25	15.82]'; % g, wet weight at f and T
units.tW_M1042 = {'d', 'g'};     label.tW_M1042 = {'time since birth', 'wet weight'};  
temp.tW_M1042 = C2K((27+27.5)/2); units.temp.tW_M1042 = 'K'; label.temp.tW_M1042 = 'temperature';
bibkey.tW_M1042 = 'Leba2015';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_M1021','LW_M1032','LW_F1038'}; subtitle1 = {'F16 offspr M1021, M1032, F1038'};
set2 = {'LW_F1024','LW_M1030','LW_F1043'}; subtitle2 = {'F19 offspr F1024, M1030, F1043'};
set3 = {'LW_F1025','LW_F1035','LW_F1041'}; subtitle3 = {'F17 offspr F1025, F1035, F1041'};
set4 = {'LW_M1026','LW_F1037','LW_F1040'}; subtitle4 = {'F340 offspr M1026, F1037, F1040'};
set5 = {'LW_M1023','LW_M1029','LW_M1033','LW_M1042'}; subtitle5 = {'F429 offspr M1023, M1029, M1033, M1042'};
set6 = {'tW_M1021','tW_M1032','tW_F1038'}; subtitle6 = {'F16 offspr M1021, M1032, F1038'};
set7 = {'tW_F1024','tW_M1030','tW_F1043'}; subtitle7 = {'F19 offspr F1024, M1030, F1043'};
set8 = {'tW_F1025','tW_F1035','tW_F1041'}; subtitle8 = {'F17 offspr F1025, F1035, F1041'};
set9 = {'tW_M1026','tW_F1037','tW_F1040'}; subtitle9 = {'F340 offspr M1026, F1037, F1040'};
set10 = {'tW_M1023','tW_M1029','tW_M1033','tW_M1042'}; subtitle10 = {'F429 offspr M1023, M1029, M1033, M1042'};
metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7,set8,set9,set10};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7,subtitle8,subtitle9,subtitle10};

%% Discussion points
D1 = 'The different individual here only differ in temperature';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6BMPN'; % Cat of Life
metaData.links.id_ITIS = '1056746'; % ITIS
metaData.links.id_EoL = '795255'; % Ency of Life
metaData.links.id_Wiki = 'Ctenophorus_ornatus'; % Wikipedia
metaData.links.id_ADW = 'Ctenophorus_ornatus'; % ADW
metaData.links.id_Taxo = '90658'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Ctenophorus&species=ornatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ornate_crevice-dragon}}';
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
bibkey = 'Brad1965'; type = 'phdthesis'; bib = [ ... 
'author = {Bradshaw, S.D.}, ' ... 
'year = {1965}, ' ...
'title = {The comparative ecology of lizards of the genus \emph{Amphibolurus}}, ' ...
'school = {University of Western Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harl2000'; type = 'Article'; bib = [ ... 
'author = {Harlow, P.}, ' ... 
'year = {2000}, ' ...
'title = {Incubation temperature determines hatchling sex in {A}ustralian rock dragons ({A}gamidae: Genus \emph{Ctenophorus})}, ' ...
'journal = {Copeia}, ' ...
'volume = {2000}, ' ...
'pages = {958--964}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bave1972'; type = 'phdthesis'; bib = [ ... 
'author = {Baverstock, P.}, ' ... 
'year = {1972}, ' ...
'title = {The evolution and maintenance of genetic variability in growth rates in the lizard \emph{Amphibolurus ornatus}}, ' ...
'school = {University of Western Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leba2000'; type = 'phdthesis'; bib = [ ... 
'author = {Lebas, N. R.}, ' ... 
'year = {2000}, ' ...
'title = {Sexual selection and the mating system of the ornate dragon lizard, \emph{Ctenophorus ornatus}}, ' ...
'school = {University of Western Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leba2015'; type = 'Misc'; bib = [ ...
'author = {Lebas, N. R.}, '...
'note = {Unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

