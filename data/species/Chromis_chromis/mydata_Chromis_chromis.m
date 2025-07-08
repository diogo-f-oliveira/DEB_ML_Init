function [data, auxData, metaData, txtData, weights] = mydata_Chromis_chromis 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Chromis_chromis'; 
metaData.species_en = 'Damselfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-JO'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Rinaldi Alessandro'; 'Valeria Montalto'; 'Dina Lika'; 'Gianluca Sara'};    
metaData.date_subm = [2014 05 22];              
metaData.email    = {'arinaldi@unime.it'};            
metaData.address  = {'Department of Earth and Marine Sciences, University of Palermo, Italy'};   

metaData.author_mod_1  = {'Antonio Giacoletti'}; 
metaData.date_mod_1    = [2017 06 15];
metaData.email_mod_1   = {'anto.giacoletti@gmail.com'};
metaData.address_mod_1 = {'Department of Earth and Marine Sciences, University of Palermo, Italy'}; 

metaData.author_mod_2   = {'Bas Kooijman'};        
metaData.date_mod_2     = [2017 11 22];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2  = {'VU University Amsterdam'}; 

metaData.author_mod_3   = {'Starrlight Augustine'};        
metaData.date_mod_3     = [2018 11 30];                           
metaData.email_mod_3    = {'sta@akvaplan.niva.no'};                 
metaData.address_mod_3  = {'Akvaplan-niva, Tromsoe, Norway'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 30]; 


%% set data
% zero-variate data

data.ab = 5.3;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'King1985';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 18;      units.aj = 'd';    label.aj = 'age at metam';             bibkey.aj = 'MacpRave2005';
  temp.aj = C2K(22);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 2*365;   units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'DulcKral1994';
  temp.ap = C2K(22);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 9*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'DulcKral1995';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.29;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'King1985';  
data.Lj  = 0.70;   units.Lj  = 'cm';  label.Lj  = 'standard length at metam'; bibkey.Lj  = 'King1985';  
data.Lp  = 5.28;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'Ales2014'; 
data.Li  = 11.7;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'VallBayl2003';

data.E0 = 0.438;   units.E0 = 'J';   label.E0 = 'reserve energy at start';   bibkey.E0 = 'guess';
comment.E0 = 'value measured for Chromis multilineata by RobeCOll2105'; 


data.Wd0 = 0.018e-3;   units.Wd0 = 'g';   label.Wd0 = 'dry weight at start';   bibkey.Wd0 = 'guess';
comment.Wd0 = 'value measured for Chromis multilineata by RobeColl2015, assuming the authors made a typo in the unit and it is mg instead of microgram.'; 

data.Wwp = 7.85;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Ales2014';
data.Wwi = 22.92;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'VallBayl2003';

% 444*7/365
data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'DulcSold2005';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is mean for the Mediterranen Sea. Fecundity ranged from 6 050 to 73 688 eggs (Dul?i? and Kraljevi?, 1994 cited in faoadriamed)';
  
% uni-variate data
% t-L data
data.tL = [ ... % time (a), standard length (cm)
0.027 0.5	1	1.5	2	2.5	3	3.5	4	4.5	5	5.5	6
1.11 4.33	4.8	5.29	5.28	6.23	6	6.51	6.51	7.21	7.68	8	8.01
]';
data.tL(:,1) = 365 * data.tL(:,1); % covert a to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'Ales2014','Giac2016'};
comment.tL = 'Ales2014 obtained by aging sagitta otholits collected from Marettimo Island populations during the period 2007-2008; Giac2016 average lenght of juveniles collected in the Palermo coastline during summer 2016';  

% L-W data
data.LW = [ ... % total length (cm), wet weight (g) 
0.8236	0.8316	0.8567	0.8568	0.8723	0.8741	0.8780	0.8983	0.9004	0.9099	0.9215	0.9284	0.9291	0.9440	0.9450	0.9459	0.9475	0.9530	0.9554	0.9556	0.9609	0.9660	0.9701	0.9730	0.9759	0.9796	0.9855	0.9890	0.9925	0.9970	0.9976	1.0056	1.0077	1.0078	1.0088	1.0146	1.0166	1.0173	1.0179	1.0181	1.0183	1.0213	1.0265	1.0336	1.0397	1.0400	1.0401	1.0425	1.0443	1.0463	1.0466	1.0474	1.0507	1.0548	1.0577	1.0578	1.0611	1.0611	1.0663	1.0678	1.0698	1.0716	1.0770	1.0790	1.0799	1.0833	1.0834	1.0837	1.0842	1.0860	1.0866	1.0962	1.0996	1.0999	1.1026	1.1056	1.1063	1.1097	1.1104	1.1153	1.1169	1.1180	1.1200	1.1212	1.1239	1.1255	1.1257	1.1295	1.1314	1.1336	1.1337	1.1337	1.1424	1.1451	1.1464	1.1481	1.1489	1.1509	1.1535	1.1539	1.1541	1.1552	1.1564	1.1579	1.1579	1.1582	1.1627	1.1631	1.1665	1.1728	1.1778	1.1787	1.1826	1.1932	1.1959	1.1968	1.2009	1.2128	1.2189	1.2273	1.2389	1.2567	1.2580	1.2694	1.2747	1.2757	1.2989	1.3067	1.3167	1.3187	1.3237	1.3357	1.3714	1.3719	1.3901	1.4092	1.4223	1.4782	1.4906	1.5007	1.5258	1.6098	1.6184	1.6392	3.51	3.80	3.85	4.00	4.00	4.00	4.05	4.06	4.10	4.11	4.13	4.14	4.17	4.20	4.20	4.22	4.23	4.26	4.28	4.30	4.30	4.30	4.30	4.31	4.31	4.32	4.33	4.34	4.34	4.34	4.34	4.35	4.36	4.39	4.40	4.40	4.41	4.42	4.42	4.42	4.43	4.45	4.46	4.47	4.47	4.47	4.48	4.48	4.49	4.49	4.49	4.50	4.50	4.50	4.50	4.50	4.50	4.51	4.53	4.53	4.53	4.53	4.53	4.53	4.54	4.56	4.57	4.58	4.58	4.58	4.59	4.60	4.60	4.60	4.60	4.60	4.60	4.60	4.61	4.61	4.62	4.62	4.63	4.64	4.64	4.65	4.65	4.65	4.65	4.66	4.66	4.68	4.69	4.69	4.69	4.70	4.70	4.70	4.71	4.71	4.72	4.72	4.72	4.72	4.72	4.73	4.73	4.73	4.74	4.75	4.75	4.77	4.78	4.79	4.79	4.79	4.80	4.80	4.80	4.81	4.81	4.82	4.82	4.83	4.84	4.84	4.84	4.84	4.84	4.84	4.85	4.85	4.86	4.86	4.87	4.87	4.87	4.87	4.87	4.88	4.88	4.88	4.90	4.90	4.90	4.90	4.90	4.90	4.90	4.91	4.91	4.91	4.91	4.91	4.92	4.92	4.92	4.95	4.95	4.95	4.95	4.95	4.95	4.96	4.98	4.99	4.99	5.00	5.00	5.00	5.00	5.00	5.00	5.00	5.00	5.00	5.01	5.01	5.01	5.02	5.02	5.02	5.03	5.03	5.04	5.04	5.04	5.04	5.05	5.06	5.07	5.08	5.09	5.09	5.09	5.10	5.10	5.10	5.11	5.11	5.12	5.12	5.12	5.12	5.13	5.14	5.14	5.14	5.14	5.14	5.15	5.15	5.15	5.16	5.17	5.19	5.19	5.19	5.19	5.19	5.19	5.19	5.19	5.20	5.20	5.20	5.20	5.20	5.20	5.20	5.20	5.21	5.21	5.21	5.22	5.22	5.22	5.24	5.24	5.24	5.25	5.25	5.26	5.28	5.28	5.28	5.29	5.30	5.30	5.30	5.30	5.30	5.30	5.30	5.31	5.31	5.31	5.32	5.33	5.34	5.34	5.34	5.35	5.35	5.35	5.35	5.36	5.38	5.38	5.39	5.39	5.40	5.40	5.40	5.40	5.40	5.40	5.41	5.41	5.41	5.41	5.42	5.43	5.43	5.44	5.45	5.45	5.47	5.47	5.49	5.49	5.49	5.49	5.49	5.49	5.50	5.50	5.50	5.50	5.50	5.50	5.50	5.50	5.50	5.50	5.51	5.51	5.52	5.52	5.53	5.53	5.54	5.55	5.55	5.55	5.55	5.56	5.58	5.59	5.59	5.59	5.59	5.60	5.60	5.60	5.60	5.60	5.60	5.60	5.60	5.61	5.61	5.61	5.62	5.62	5.62	5.62	5.63	5.64	5.64	5.64	5.66	5.66	5.67	5.67	5.68	5.68	5.69	5.69	5.69	5.69	5.69	5.69	5.70	5.70	5.70	5.70	5.70	5.71	5.71	5.71	5.71	5.71	5.72	5.72	5.73	5.73	5.73	5.74	5.75	5.75	5.76	5.77	5.77	5.78	5.79	5.79	5.79	5.79	5.79	5.80	5.80	5.80	5.80	5.80	5.80	5.80	5.80	5.80	5.80	5.81	5.81	5.81	5.82	5.83	5.83	5.83	5.83	5.84	5.84	5.85	5.85	5.86	5.86	5.87	5.89	5.89	5.89	5.89	5.89	5.90	5.90	5.90	5.90	5.90	5.90	5.90	5.90	5.91	5.91	5.91	5.91	5.92	5.92	5.92	5.93	5.93	5.94	5.95	5.95	5.95	5.95	5.96	5.97	5.97	5.97	5.98	5.99	5.99	5.99	5.99	5.99	6.00	6.00	6.00	6.00	6.00	6.00	6.00	6.01	6.01	6.01	6.01	6.01	6.01	6.02	6.02	6.02	6.02	6.02	6.05	6.05	6.05	6.06	6.07	6.09	6.10	6.10	6.10	6.10	6.10	6.10	6.10	6.10	6.10	6.10	6.10	6.10	6.11	6.11	6.11	6.11	6.11	6.12	6.12	6.12	6.12	6.12	6.13	6.13	6.14	6.14	6.16	6.16	6.17	6.18	6.18	6.18	6.19	6.19	6.19	6.20	6.20	6.20	6.21	6.21	6.21	6.21	6.22	6.22	6.22	6.22	6.22	6.23	6.23	6.23	6.24	6.24	6.24	6.25	6.25	6.26	6.27	6.28	6.28	6.28	6.28	6.29	6.30	6.30	6.31	6.31	6.31	6.31	6.31	6.32	6.33	6.33	6.34	6.34	6.35	6.36	6.36	6.36	6.37	6.37	6.38	6.39	6.39	6.39	6.39	6.40	6.40	6.40	6.40	6.41	6.42	6.42	6.42	6.43	6.44	6.44	6.44	6.46	6.47	6.47	6.47	6.48	6.48	6.49	6.49	6.50	6.50	6.50	6.50	6.51	6.51	6.51	6.51	6.51	6.52	6.52	6.54	6.55	6.56	6.57	6.57	6.57	6.59	6.59	6.59	6.60	6.60	6.60	6.60	6.60	6.60	6.61	6.61	6.62	6.62	6.62	6.62	6.63	6.64	6.64	6.66	6.66	6.66	6.67	6.67	6.67	6.67	6.68	6.69	6.70	6.70	6.70	6.70	6.71	6.71	6.72	6.72	6.72	6.73	6.73	6.73	6.73	6.73	6.73	6.74	6.75	6.75	6.77	6.78	6.78	6.78	6.79	6.79	6.79	6.80	6.81	6.82	6.82	6.82	6.82	6.82	6.83	6.84	6.84	6.85	6.85	6.85	6.85	6.86	6.87	6.89	6.90	6.90	6.90	6.90	6.90	6.91	6.92	6.92	6.92	6.92	6.93	6.93	6.93	6.96	6.96	6.96	6.97	6.97	6.99	6.99	6.99	7.00	7.01	7.01	7.01	7.02	7.03	7.05	7.06	7.06	7.07	7.08	7.08	7.09	7.09	7.09	7.11	7.11	7.11	7.12	7.13	7.13	7.13	7.14	7.14	7.15	7.16	7.17	7.18	7.19	7.20	7.21	7.21	7.21	7.21	7.22	7.23	7.24	7.24	7.24	7.24	7.24	7.26	7.27	7.28	7.28	7.29	7.30	7.30	7.30	7.30	7.30	7.31	7.31	7.33	7.33	7.34	7.34	7.35	7.35	7.36	7.37	7.39	7.40	7.41	7.41	7.41	7.41	7.43	7.43	7.43	7.44	7.44	7.44	7.44	7.45	7.46	7.46	7.47	7.47	7.48	7.49	7.50	7.51	7.51	7.52	7.53	7.54	7.55	7.55	7.57	7.57	7.58	7.59	7.60	7.60	7.61	7.61	7.62	7.63	7.64	7.64	7.66	7.66	7.66	7.67	7.70	7.71	7.71	7.72	7.73	7.74	7.74	7.75	7.75	7.77	7.78	7.79	7.81	7.81	7.81	7.81	7.83	7.84	7.85	7.87	7.87	7.89	7.89	7.90	7.90	7.91	7.92	7.92	7.93	7.97	7.97	7.99	8.00	8.01	8.02	8.02	8.02	8.02	8.07	8.09	8.10	8.12	8.16	8.17	8.17	8.21	8.21	8.21	8.22	8.22	8.24	8.28	8.29	8.30	8.32	8.32	8.35	8.41	8.43	8.43	8.50	8.51	8.53	8.61	8.65;
0.0204	0.0229	0.0241	0.0235	0.0302	0.0276	0.0201	0.0371	0.0304	0.0280	0.0276	0.0419	0.0445	0.0376	0.0373	0.0272	0.0361	0.0367	0.0389	0.0297	0.0269	0.0368	0.0431	0.0361	0.0381	0.0352	0.0406	0.0349	0.0318	0.0399	0.0466	0.0365	0.0439	0.0448	0.0452	0.0409	0.0355	0.0394	0.0438	0.0310	0.0447	0.0588	0.0366	0.0635	0.0345	0.0472	0.0514	0.0398	0.0424	0.0596	0.0486	0.0315	0.0373	0.0483	0.0375	0.0470	0.0432	0.0322	0.0441	0.0454	0.0399	0.0406	0.0420	0.0397	0.0444	0.0399	0.0502	0.0443	0.0524	0.0407	0.0446	0.0435	0.0561	0.0585	0.0218	0.0473	0.0504	0.0575	0.0606	0.0584	0.0388	0.0471	0.0554	0.0482	0.0601	0.0570	0.0581	0.0468	0.0566	0.0290	0.0394	0.0608	0.0683	0.0609	0.0601	0.0407	0.0445	0.0629	0.0680	0.0648	0.0465	0.0602	0.0605	0.0489	0.0435	0.0487	0.0576	0.0655	0.0657	0.0519	0.0462	0.0588	0.0657	0.0725	0.0623	0.0656	0.0649	0.0562	0.0649	0.0651	0.0661	0.0532	0.0646	0.0752	0.0949	0.0569	0.0605	0.0747	0.0709	0.0892	0.0777	0.0757	0.1048	0.0917	0.0855	0.0755	0.0919	0.1219	0.1155	0.1077	0.1157	0.1544	0.1365	0.1464	1.50	2.69	2.01	3.15	3.44	3.61	2.30	2.19	3.65	3.30	2.79	2.80	2.99	3.51	5.16	2.50	2.49	3.40	2.90	3.70	4.08	4.46	3.52	3.30	5.59	2.73	2.89	2.60	2.69	2.39	3.60	3.90	3.04	3.52	4.33	3.99	2.79	3.10	3.35	3.09	2.90	3.50	3.11	2.09	2.89	3.79	2.87	2.50	2.68	3.17	2.81	4.13	4.33	4.73	4.02	5.27	5.76	2.57	2.79	3.06	3.09	3.28	3.60	4.17	4.41	4.70	3.79	2.94	3.19	2.89	3.40	4.62	4.18	5.16	5.32	5.64	5.43	4.94	3.38	4.14	3.70	3.93	3.55	2.99	4.54	4.18	3.30	3.99	4.17	2.49	4.33	4.38	4.81	2.79	4.49	3.70	5.61	3.79	4.79	5.89	4.18	4.62	3.40	4.26	3.55	2.90	4.98	4.94	3.21	2.94	3.76	4.26	4.51	5.57	3.66	4.79	5.16	3.30	5.84	4.26	3.50	4.67	3.91	3.09	3.70	3.92	4.51	5.19	3.60	4.55	4.14	4.97	3.29	3.91	4.67	3.83	3.37	5.27	5.51	5.29	4.36	4.69	3.70	4.28	5.01	6.09	3.74	4.26	5.93	3.90	4.59	3.50	3.85	5.63	3.36	4.11	5.08	4.06	5.32	3.81	3.88	6.02	4.49	4.87	5.12	7.05	4.23	3.90	5.07	5.61	6.30	7.47	6.15	6.43	6.91	4.55	3.65	7.72	8.06	4.28	5.88	3.96	4.62	4.08	4.01	5.31	5.67	4.30	4.79	4.76	5.38	5.64	6.45	8.21	6.71	4.97	7.49	7.72	4.96	5.88	3.78	4.62	3.91	4.46	6.30	4.81	5.57	6.57	5.23	5.89	4.18	4.26	4.79	4.05	4.46	4.28	6.19	6.76	7.93	8.31	9.23	4.20	9.90	4.70	4.01	4.98	5.67	7.56	10.08	6.11	8.36	4.66	5.59	6.97	4.54	3.90	7.17	6.53	4.49	4.97	6.97	6.29	5.19	4.23	5.20	6.47	7.56	4.87	6.68	8.07	8.45	9.02	5.72	7.28	4.36	6.30	7.09	4.76	6.57	4.46	4.90	5.04	5.71	3.99	5.27	5.89	5.19	6.67	8.49	9.96	4.62	5.57	7.43	6.80	8.40	4.97	7.72	4.46	8.81	5.47	6.11	6.38	6.09	6.52	7.17	5.26	5.63	4.97	6.33	6.88	10.02	9.56	9.07	8.71	8.40	7.97	7.21	11.47	4.66	5.84	6.81	8.49	8.93	9.61	10.27	7.70	5.35	3.96	7.55	4.97	7.83	6.97	5.29	8.60	5.55	6.15	6.67	8.07	9.56	10.63	13.52	7.07	6.09	7.17	8.71	9.02	12.82	10.19	9.61	8.93	5.51	6.19	8.26	5.26	5.67	6.52	7.17	5.97	5.84	6.76	8.18	6.23	6.76	13.13	5.31	5.74	7.26	10.95	10.20	9.68	9.23	8.71	10.19	11.61	7.43	7.97	8.74	11.13	5.98	6.68	6.29	7.61	9.27	7.56	6.02	5.54	6.30	8.21	3.76	6.62	8.06	6.49	7.83	6.86	9.27	6.05	17.81	5.35	6.38	7.49	8.50	10.44	11.14	11.81	12.38	12.90	11.38	10.81	9.76	13.87	7.34	9.91	10.12	7.88	6.53	6.97	8.96	8.93	7.83	8.43	9.56	7.07	7.79	6.38	8.71	7.17	12.60	11.47	17.71	7.44	6.16	6.49	7.61	9.18	10.95	10.32	11.55	19.85	5.29	8.31	8.12	10.42	9.68	5.84	6.81	8.91	9.27	10.69	6.72	7.39	6.67	7.66	8.40	5.76	10.19	9.54	9.29	6.42	8.02	12.45	5.89	7.17	6.16	7.17	10.02	10.88	11.47	11.81	14.51	13.56	12.61	11.89	11.13	10.65	15.82	8.60	9.56	10.32	9.97	8.68	7.65	7.61	8.01	8.11	11.20	5.84	6.57	7.34	7.83	12.67	12.16	10.44	13.68	9.83	11.55	12.15	13.76	8.55	8.40	11.54	9.85	9.07	7.55	10.88	10.89	14.28	13.08	8.12	6.88	15.93	7.13	10.14	10.27	9.07	7.70	8.96	14.17	12.24	8.26	13.44	12.67	15.66	9.51	10.97	11.88	11.14	14.28	8.81	7.66	8.01	8.18	12.79	13.56	7.39	7.83	9.23	6.97	11.89	10.50	10.26	9.54	8.65	11.21	13.36	12.24	11.40	10.57	8.43	15.20	14.09	9.51	8.68	11.55	14.07	15.59	12.98	9.83	13.66	8.31	8.06	12.33	10.02	7.83	8.30	10.27	13.08	9.02	14.68	11.74	8.93	11.72	14.00	13.36	12.67	15.36	11.01	9.40	12.61	14.60	7.74	8.40	10.32	9.76	12.16	9.79	10.81	13.87	8.21	15.48	16.41	9.41	15.29	14.34	8.86	16.90	13.68	13.05	10.69	10.34	12.98	7.74	15.82	11.46	9.34	9.96	9.51	10.81	11.89	11.01	12.31	14.81	16.41	15.47	11.74	9.97	13.27	18.45	13.28	21.52	8.86	13.84	9.20	15.94	10.32	8.40	11.47	14.42	12.67	11.72	10.69	9.79	9.83	13.37	10.12	9.18	11.81	16.12	16.80	17.81	10.34	18.59	8.65	14.28	15.36	10.08	15.38	12.90	11.21	12.33	17.27	9.40	11.34	13.76	10.44	10.73	11.89	16.65	14.42	18.56	12.89	16.51	13.36	9.62	11.01	14.76	12.02	19.42	13.27	15.57	10.97	12.42	15.03	16.05	18.05	10.50	11.72	9.62	10.14	16.70	17.71	12.53	11.54	13.92	15.12	10.97	10.34	16.90	10.95	16.03	20.29	8.76	13.66	15.48	14.42	11.81	12.98	12.24	16.41	10.97	13.17	21.05	18.72	17.40	11.14	10.75	14.85	12.09	11.55	10.50	14.49	13.52	19.42	16.05	15.75	12.61	22.82	12.53	14.07	21.05	20.15	11.61	17.40	12.98	14.00	23.15	11.27	12.98	22.16	14.34	12.16	11.72	14.17	21.52	18.86	13.28	11.81	15.66	12.42	15.48	20.44	17.79	8.91	16.17	19.42	12.60	14.59	16.41	13.56	23.15	11.67	14.00	18.18	25.10	13.36	17.00	15.20	15.82	13.37	17.10	19.71	22.00	13.68	14.38	25.84	24.55	15.93	16.41	17.50	12.98	14.76	14.92	15.59	20.90	12.60	12.24	17.92	22.98	14.00	17.71	24.91	13.97	17.40	16.31	15.47	13.08	14.00	14.85	16.41	20.44	16.51	14.28	17.66	22.98	12.98	25.10	19.00	14.34	16.31	21.36	17.00	13.76	15.36	24.02	11.27	18.72	17.02	15.93	17.40	15.12	22.82	15.03	21.84	16.70	20.29	16.29	15.84	17.92	25.84	28.01	15.36	23.49	17.02	16.41	18.18	19.71	20.74	22.16	24.55	16.90	18.03	28.42	16.05	16.77	26.81	17.30	25.10	22.65	16.03	15.70	17.66	29.05	27.60	25.84	22.16	18.72	20.44	21.36	24.73	17.40	18.45	28.01	24.02	30.81	20.00	21.05	27.00	29.27	17.92	19.56	23.15	28.01	19.85	26.22	24.91	28.63	23.15	28.63	22.32
]';
units.LW = {'cm', 'g'};   label.LW = {'standard length', 'wet weight'};  
bibkey.LW = {'Giac2016','Ales2014'};

% weight-respiration data
data.WwJO1 = [ ... % ww g, mumol O2 h-1 l-1) in a respiration chamber of 0.135 l
0.0446	0.0482	0.0502	0.0524	0.0623	0.0655	0.0680	0.1544;
1.0400	1.0519	1.2415	1.4407	1.2269	1.2431	1.3200	1.7761]';
data.WwJO1(:,2) = data.WwJO1(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO1 = {'g', 'mumol/h'};     label.WwJO1 = {'wet weight', 'O_2 consumption', '9 C'};  
temp.WwJO1 = C2K(9); units.temp.WwJO1 = 'K'; label.temp.WwJO1 = 'temperature';
bibkey.WwJO1 = 'Giac2016';
% 
data.WwJO2 = [ ... % ww g, mumol O2 h-1 l-1) 
0.0576	0.0584	0.0585	0.0588	0.0651	0.0855	0.1077	0.1464;
3.2624	2.2321	2.6306	2.3341	1.9745	4.4093	4.5503	3.8407]';
data.WwJO2(:,2) = data.WwJO2(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO2 = {'g', 'mumol/h'};     label.WwJO2 = {'wet weight', 'O_2 consumption', '11 C'};  
temp.WwJO2 = C2K(11); units.temp.WwJO2 = 'K'; label.temp.WwJO2 = 'temperature';
bibkey.WwJO2 = 'Giac2016';
%
data.WwJO3 = [ ... % ww g, mumol O2 h-1 l-1)  
0.0576	0.0584	0.0585	0.0588	0.0651	0.0855	0.1077	0.1464;
3.2624	2.2321	2.6306	2.3341	1.9745	4.4093	4.5503	3.8407]';
data.WwJO3(:,2) = data.WwJO3(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO3 = {'g', 'mumol/h'};     label.WwJO3 = {'wet weight', 'O_2 consumption', '13 C'};  
temp.WwJO3 = C2K(13); units.temp.WwJO3 = 'K'; label.temp.WwJO3 = 'temperature';
bibkey.WwJO3 = 'Giac2016';
% 
data.WwJO4 = [ ... % ww g, mumol O2 h-1 l-1) 
0.0432	0.0487	0.0601	0.0602	0.0629	0.0649	0.0683	0.0917;
0.8145	0.7368	2.7439	2.2531	1.1936	3.7159	2.5738	1.7719]';
data.WwJO4(:,2) = data.WwJO4(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO4 = {'g', 'mumol/h'};     label.WwJO4 = {'wet weight', 'O_2 consumption', '15 C'};  
temp.WwJO4 = C2K(15); units.temp.WwJO4 = 'K'; label.temp.WwJO4 = 'temperature';
bibkey.WwJO4 = 'Giac2016';
% 
data.WwJO5 = [ ... % ww g, mumol O2 h-1 l-1)
0.0315	0.0318	0.0365	0.0388	0.0424	0.0465	0.0532	0.0569;
0.5932	2.3477	3.2225	2.2116	3.8932	3.9029	2.3380	3.6161]';
data.WwJO5(:,2) = data.WwJO5(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO5 = {'g', 'mumol/h'};     label.WwJO5 = {'wet weight', 'O_2 consumption', '17 C'};  
temp.WwJO5 = C2K(17); units.temp.WwJO5 = 'K'; label.temp.WwJO5 = 'temperature';
bibkey.WwJO5 = 'Giac2016';
% 
data.WwJO6 = [ ... % ww g, mumol O2 h-1  l-1) 
0.0322	0.0375	0.0394	0.0397	0.0399	0.0489	0.0755	0.0757;
2.3379	2.1192	1.3221	2.5420	2.2115	2.1775	4.2041	3.1349]';
data.WwJO6(:,2) = data.WwJO6(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO6 = {'g', 'mumol/h'};     label.WwJO6 = {'wet weight', 'O_2 consumption', '19 C'};  
temp.WwJO6 = C2K(19); units.temp.WwJO6 = 'K'; label.temp.WwJO6 = 'temperature';
bibkey.WwJO6 = 'Giac2016';
% 
data.WwJO7 = [ ... % ww g, mumol O2 h-1  l-1)
0.0241	0.0368	0.0407	0.0409	0.0444	0.0473	0.0566	0.0657;
2.3583	1.9841	1.6828	3.8406	2.3049	4.7738	3.9767	4.9196]';
data.WwJO7(:,2) = data.WwJO7(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO7 = {'g', 'mumol/h'};     label.WwJO7 = {'wet weight', 'O_2 consumption', '21 C'};  
temp.WwJO7 = C2K(21); units.temp.WwJO7 = 'K'; label.temp.WwJO7 = 'temperature';
bibkey.WwJO7 = 'Giac2016';
% 
data.WwJO8 = [ ... % ww g, mumol O2 h-1  l-1)
0.0229	0.0235	0.0269	0.0389	0.0441	0.0504	0.0570	0.0949
1.8288	2.9369	1.5615	3.4229	4.0692	2.4946	4.3365	3.3014]';
data.WwJO8(:,2) = data.WwJO8(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO8 = {'g', 'mumol/h'};     label.WwJO8 = {'wet weight', 'O_2 consumption', '23 C'};  
temp.WwJO8 = C2K(23); units.temp.WwJO8 = 'K'; label.temp.WwJO8 = 'temperature';
bibkey.WwJO8 = 'Giac2016';
% 
data.WwJO9 = [ ... % ww g, mumol O2 h-1  l-1)
0.0297	0.0439	0.0472	0.0514	0.0596	0.0609	0.0635	0.0777;
1.8343	3.3458	2.9667	3.3847	3.3020	4.7503	3.5936	4.1817]';
data.WwJO9(:,2) = data.WwJO9(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO9 = {'g', 'mumol/h'};     label.WwJO9 = {'wet weight', 'O_2 consumption', '25 C'};  
temp.WwJO9 = C2K(25); units.temp.WwJO9 = 'K'; label.temp.WwJO9 = 'temperature';
bibkey.WwJO9 = 'Giac2016';
% 
data.WwJO10 = [ ... % ww g, mumol O2 h-1  l-1)
0.0349	0.0399	0.0448	0.0468	0.0470	0.0561	0.0649	0.1365;
2.2627	2.5737	1.8447	2.5737	2.3501	2.6563	3.3707	5.9222]';
data.WwJO10(:,2) = data.WwJO10(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO10 = {'g', 'mumol/h'};     label.WwJO10 = {'wet weight', 'O_2 consumption', '27 C'};  
temp.WwJO10 = C2K(27); units.temp.WwJO10 = 'K'; label.temp.WwJO10 = 'temperature';
bibkey.WwJO10 = 'Giac2016';
% 
data.WwJO11 = [ ... % ww g, mumol O2 h-1  l-1)
0.0355	0.0373	0.0381	0.0399	0.0406	0.0452	0.0554	0.0601;
2.4689	2.1238	2.1189	2.1384	2.4737	2.8479	2.6244	2.1530]';
data.WwJO11(:,2) = data.WwJO11(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
temp.WwJO11 = C2K(29); units.temp.WwJO11 = 'K'; label.temp.WwJO11 = 'temperature';
units.WwJO11 = {'g', 'mumol/h'};     label.WwJO11 = {'wet weight', 'O_2 consumption', '29 C'};  
bibkey.WwJO11 = 'Giac2016';
% 
data.WwJO12 = [ ... % ww g, mumol O2 h-1  l-1)
0.0276	0.0304	0.0367	0.0443	0.0454	0.0466	0.0606	0.0725;
2.1591	3.4858	2.8686	3.5636	3.1942	2.6645	3.3060	5.7457]';
data.WwJO12(:,2) = data.WwJO12(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO12 = {'g', 'mumol/h'};     label.WwJO12 = {'wet weight', 'O_2 consumption', '30 C'};  
temp.WwJO12 = C2K(30); units.temp.WwJO12 = 'K'; label.temp.WwJO12 = 'temperature';
bibkey.WwJO12 = 'Giac2016';
% 
data.WwJO13 = [ ... % ww g, mumol O2 h-1  l-1) 
0.0280	0.0352	0.0419	0.0438	0.0445	0.0447	0.0483	0.0486;
1.6317	2.4434	2.1761	3.8916	3.0849	2.6329	3.2744	2.3364]';
data.WwJO13(:,2) = data.WwJO13(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO13 = {'g', 'mumol/h'};     label.WwJO13 = {'wet weight', 'O_2 consumption', '31 C'};  
temp.WwJO13 = C2K(31); units.temp.WwJO13 = 'K'; label.temp.WwJO13 = 'temperature';
bibkey.WwJO13 = 'Giac2016';
% 
data.WwJO14 = [ ... % ww g, mumol O2 h-1  l-1)
0.0276	0.0302	0.0361	0.0398	0.0407	0.0431	0.0575	0.0657;
2.8350	5.0171	4.1569	3.4084	4.0937	4.3659	4.9248	5.8822]';
data.WwJO14(:,2) = data.WwJO14(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO14 = {'g', 'mumol/h'};     label.WwJO14 = {'wet weight', 'O_2 consumption', '32 C'};  
temp.WwJO14 = C2K(32); units.temp.WwJO14 = 'K'; label.temp.WwJO14 = 'temperature';
bibkey.WwJO14 = 'Giac2016';
% 
data.WwJO15 = [ ... % ww g, mumol O2 h-1 l-1)
0.0201	0.0218	0.0361	0.0373	0.0376	0.0462	0.0519	0.0605;
2.3686	5.3186	5.0124	4.0259	3.4767	3.6419	4.7063	4.0696]';
data.WwJO15(:,2) = data.WwJO15(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO15 = {'g', 'mumol/h'};     label.WwJO15 = {'wet weight', 'O_2 consumption', '33 C'};  
temp.WwJO15 = C2K(33); units.temp.WwJO15 = 'K'; label.temp.WwJO15 = 'temperature';
bibkey.WwJO15 = 'Giac2016';
% 
data.WwJO16 = [ ... % ww g, mumol O2 h-1 l-1) 
0.0290	0.0345	0.0366	0.0394	0.0562	0.0605	0.0608	0.0656;
3.7981	4.0751	4.5903	5.4019	4.3181	4.4785	5.5866	6.6023]';
data.WwJO16(:,2) = data.WwJO16(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO16 = {'g', 'mumol/h'};     label.WwJO16 = {'wet weight', 'O_2 consumption', '34 C'};  
temp.WwJO16 = C2K(34); units.temp.WwJO16 = 'K'; label.temp.WwJO16 = 'temperature';
bibkey.WwJO16 = 'Giac2016';
% 
data.WwJO17 = [ ... % ww g, mumol O2 h-1 l-1)
0.0204	0.0272	0.0310	0.0420	0.0435	0.0646	0.0919	0.1157;
0.6257	0.6160	4.2221	1.1506	6.8417	4.1492	9.5535	3.9791]';
data.WwJO17(:,2) = data.WwJO17(:,2) * 0.135; % convert mumol O2 h-1 l-1 to mumol O2 h-1
units.WwJO17 = {'g', 'mumol/h'};     label.WwJO17 = {'wet weight', 'O_2 consumption', '35 C'};  
temp.WwJO17 = C2K(35); units.temp.WwJO17 = 'K'; label.temp.WwJO17 = 'temperature';
bibkey.WwJO17 = 'Giac2016';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'WwJO6','WwJO5','WwJO4','WwJO3','WwJO2','WwJO1'}; subtitle1 = {'Data at 19, 17, 15, 13, 11, 9 C'};
set2 = {'WwJO12','WwJO11','WwJO10','WwJO9','WwJO8','WwJO7'}; subtitle2 = {'Data at 30, 29, 27, 25, 23, 21 C'};
set3 = {'WwJO17','WwJO16','WwJO15','WwJO14','WwJO13'}; subtitle3 = {'Data at 35, 34, 33, 32, 31 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Arrhenius temperature psd.T_A=8 kK was added because the data poorly determines that parameters';
D2 = 'mod_3: added egg energy content and dry weight of a related species as a data point, and revised R_i. Previous version implied offspring size of 8J and almost 400 micrograms. Fixed y-label of L-Ww. Fixed T_A and estimated T_H and T_AH. T_L is infinately low. Zero weight for Wwi because value is not consistent with Li. ';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5YG8Y'; % Cat of Life
metaData.links.id_ITIS = '170106'; % ITIS
metaData.links.id_EoL = '46572214'; % Ency of Life
metaData.links.id_Wiki = 'Chromis_chromis'; % Wikipedia
metaData.links.id_ADW = 'Chromis_chromis'; % ADW
metaData.links.id_Taxo = '46264'; % Taxonomicon
metaData.links.id_WoRMS = '127000'; % WoRMS
metaData.links.id_fishbase = 'Chromis-chromis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chromis_chromis}}';
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
bibkey = 'King1985'; type = 'Article'; bib = [ ... 
'author = {Kingsford, M. J.}, ' ... 
'year = {1985}, ' ...
'title = {The demersal eggs and planktonic larvae of \emph{Chromis dispilus} ({T}eleostei: {P}omacentridae) in north-eastern {N}ew {Z}ealand coastal waters.}, ' ...
'journal = {New Zealand Journal of Marine and Freshwater Research}, ' ...
'volume = {19}, ' ...
'pages = {429--438}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacpRave2005'; type = 'Article'; bib = [ ... 
'author = {Macpherson, E. and Raventos, N.}, ' ... 
'year = {2005}, ' ...
'title = {Settlement patterns and post-settlement survival in two {M}editerranean littoral fishes: influences of early-life traits and environmental variables}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {148}, ' ...
'pages = {167--177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DulcKral1994'; type = 'Article'; bib = [ ... 
'author = {Dulcic, J. and Kraljevic, M. and Cetinic, P.}, ' ... 
'year = {1994}, ' ...
'title = {Length-Weight relationship in Damselfish (\emph{Chromis chromis} {L}. 1758) from the Eastern {A}driatic during spawning.}, ' ...
'journal = {Acta Icthyologica et Piscatoria}, ' ...
'volume = {24}, ' ...
'pages = {147--154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DulcKral1995'; type = 'Article'; bib = [ ... 
'author = {Dulcic, J. and Kraljevic, M.}, ' ... 
'year = {1995}, ' ...
'title = {Age, growth and mortality of damselfish (\emph{Chromis chromis} {L}.) in the eastern middle {A}driatic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {22}, ' ...
'pages = {255--264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VallBayl2003'; type = 'Article'; bib = [ ... 
'author = {Valle, C. and Bayle, J. T. and Ramos, A. A.}, ' ... 
'year = {2003}, ' ...
'title = {Weight-length relationships for selected fish species of the western {M}editerranean {S}ea}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {19}, ' ...
'pages = {261--262}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1706}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ales2014'; type = 'Misc'; bib = [ ...
'author = {Rinaldi Alessandro}, ' ...
'year = {2014}, ' ...
'note = {Field measurement from Marettimo Island}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Giac2016'; type = 'Misc'; bib = [ ...
'author = {Antonio Giacoletti}, ' ...
'year = {2016}, ' ...
'note = {Field measurement from Palermo coast line}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobeColl2015'; type = 'Article'; bib = [ ... 
'author = {Robertson, D. Ross and Collin, Rachel}, ' ... 
'year = {2015}, ' ...
'title = {Inter- and Intra-specific variation in egg size among reef fishes across the {I}sthmus of {P}anama}, ' ...
'journal = {Frontiers in Ecology and Evolution}, ' ...
'volume = {2}, ' ...
'doi = {10.3389/fevo.2014.00084}, ' ...
'pages = {84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%  
bibkey = 'DulcSold2005'; type = 'techreport'; bib = [ ... 
'author = {Dul\v{c}i\''{c}, J. and Soldo, A. and Jardas, I.}, ' ...
'title = {Adriatic Sea Small-Scale Fisheries},' ...
'institution = {AdriaMed Technical Documents, AdriaMed Technical Consultation on Adriatic Sea Small-Scale Fisheries},' ...
'year = {2005},' ...
'number = {15}, ' ...
'pages = {150}, ' ...
'address = {Split, Croatia},' ...
'howpublished = {\url{FAOAdriaMEd.org}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

