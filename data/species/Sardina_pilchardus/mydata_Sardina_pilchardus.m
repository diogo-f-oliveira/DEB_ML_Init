  function [data, auxData, metaData, txtData, weights] = mydata_Sardina_pilchardus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Sardina_pilchardus'; 
metaData.species_en = 'European pilchard'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 't-Ww'; 't-GSI'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Cristina Nunes'; 'Goncalo Marques'; 'Tania Sousa'; 'Bas Kooijman'};        
metaData.date_subm = [2013 03 22];                           
metaData.email    = {'cnunes@ipimar.p'};                 
metaData.address  = {'Instituto Nacional de Recursos Biologicos, Instituto Portugues de Investigacao das Pescas e do Mar, Lisboa, Portugal'}; 

metaData.author_mod_1  = {'Bas Kooijman'};                  
metaData.date_mod_1    = [2013 08 26];                      
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_1 = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Quentin Queiros'};    
metaData.date_mod_3     = [2017 06 26];              
metaData.email_mod_3    = {'quentin.queiros@ifremer.fr'};            
metaData.address_mod_3  = {'IFREMER'};   

metaData.author_mod_4   = {'Sebastien Lefebvre'};    
metaData.date_mod_4     = [2019 09 01];              
metaData.email_mod_4    = {'sebastien.lefebvre@univ-lille.fr'};            
metaData.address_mod_4  = {'IFREMER'}; 

metaData.author_mod_5   = {'Elisa Donati','Bas Kooijman'};    
metaData.date_mod_5    = [2025 02 07];              
metaData.email_mod_5    = {'edonati@ogs.it'};            
metaData.address_mod_5  = {'OGS'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2025 02 07];

%% set data
% zero-variate data
data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'ReMene2008'; 
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'average sea surface tempoff West Portuguese coast, Angelico, pers. comm.); 3 d from fertilization to hatching + 5 d between hatching and complete resorption of vitelline sac';

data.ap = 365;    units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'SilvSant2006';
  temp.ap = C2K(15);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'first maturation between 1 and 2 years old';

data.ap2 = 234;    units.ap2 = 'd';    label.ap2 = 'age at puberty';         bibkey.ap2 = 'Dess2015';
  temp.ap2 = C2K(14.4);  units.temp.ap2 = 'K'; label.temp.ap2 = 'temperature';
  comment.ap2 = 'Initial age determined from otoliths, maturation observed in the experiment';
  
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'SilvCarr2008';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'average life span: 7-8 years, though max. age observed is 13 years old';

data.Lb = 0.5;    units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'ReMene2008';
data.Lp = 13;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'SilvSant2006';
data.Lp2 = 12;     units.Lp2 = 'cm';   label.Lp2 = 'total length at puberty';bibkey.Lp2 = 'Dess2015';
  comment.Lp2 = 'Maturation observed in the experiment';
data.Li = 23.8;   units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'SilvCarr2008';

data.Wwb = 2.5e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ReMene2008';
data.Wwp = 20;     units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'ReMene2008';
data.Wwp2 = 16.1;     units.Wwp2 = 'g';    label.Wwp2 = 'wet weight at puberty';  bibkey.Wwp2 = 'Dess2015';
    comment.Wwp2 = 'Maturation observed in the experiment';
data.Wwi = 112;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'ReMene2008';
  
data.Ri = 45000*10/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = {'NuneSilv2011','ICES2012'};   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'season of 8-9 months, an average interval between spawning events of 13-14 days and a batch fecundity of ~ 45000 eggs, about 10 spawnings per yr';
  
% uni-variate data 
data.tL = [ ...
  10	20	28	34	37	60	74	99	118	122	149	172	192 218	233	256	365	704	1460	1825;    % d, time since birth
  1.0	1.6	2.1	2.5	2.5	3.6	4.6	5.6	6.0	6.8	9.3	9.5	10.7	10.5	11.7	11.4	15.4	17.9	20.2	20.8]'; % cm, physical length at f and T
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};
temp.tL = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'SilvCarr2008'};
comment.tL = 'These field data are from Penaz and Tesch (1970) as given in Tesch (2003) p. 173 Table 3.10 last row';

% L-W data 
% Pond n-1
data.LW_p1 = [ ... % TL (mm) wet weight (g)
110	111	105	120	111	109	122	124	127	104	118	118	120	132	121	118	105	97	117	120	118	121	120	150	114	125	124	115	125	105	108	126	121	104	129	110	109	115	134	128	124	122	124	120	104	130	111	122	125	113	105	115	128	122	117	129	118.2	107.8	112	105.6	110.8	115.2	121.3	128.9	125.4	124.5	113.6	126.3	124.2	121	120.1	106.7	128.7	106.7	117.6	113.7	115	128.7	112.5	103.4	122.7	105.5	116.3	112.1	127.7	127	121.3	125.6	120.6	115.8	114	124.8	98.3	127.1	120.1	108.3	122.8	136.3	120.9	117.7	129.6	115.8	109.3	107.8	119.5	124.5	106.3	120.5	116.6	149.6	128.5	124.8	123.3	127.5	128.1	117.7	115.9	126.5	99.4	125.3	125.3	137	113.1	106.9	119.2	104.1	126.9	108.6	114.7	123.3	117.6	128.1	106.7	131.1	122.6	125.4	122.5	119.5	127.7	114.5	126.3	105.2	115.7	112.2	125	122.3	114.2	112.1	115.8	117.1	125.1	107.5	121.1	117.4	121	110.1	105.8	124.7	112.6	130.3	120.1	106.8	116.8	151.6	129.9	123.8	119.8	126.7	120.7	103.5	105.1	124.7	122.6	123.2	108.1	129.5	103.7	111.7	132.4	128.3	124.5	117.4	123.5	121.4	115.7	128.3	137.6	125.5	134.5	116.9	106.1	112.7	119.7	117	121.8	112.1	151.3	119.6	126.7	115.9	121.4	116.4	128.2	129.2	121	104.9	113.5	119.9	112.2	105.7	108.1	127.7	120.4	96.2	118.5	124.8	125.7	125.8	114.6	117.1	110.9	118.5	128.6	125.4	101.2	110.2	120.8	130.5	123.7	153.7	127.8	117.2	115	143	109.5	135.4	130.7	124.6	107.6	120.6	127.1	119.5	119.5	122.7	116.1	129.5	134	126.2	125.3	113.7	126.2	127.9	110	122.8	130.9	121.5	120.5	130.9	118.9	128.3	116.4	125.5	131.3	125.2	118.7	125.9	110.7	114.5	121.4	118.3	110.9	109	124.5	129.3	118.4	122.7	108.9	121.5	120.8	125.5	101.2	121.4	118.7	127.8	128.3	110	107.6	120.6	126.2	110.7	118.9	110.2	134.4	118.5	130.4	130.8	124.6	130.4	116.3	126.8	123.8	124.8	142.8	114.8	135.9	122	108.8	129.8	125.5	123	111.1	124.2	128.3	126.9	119.3	118.1	113.5	125.5	152.9	115.4	128.1	130.4	123.5	109.4	116.9	114.8	114.9	119.2	117.3	123.2	113.1	125	123.2	134.6	129.8	116.6	127.2	116.3	118.4	126.5	131	126.8	125.2	132.7	116.7	115.3	132.6	110.5	129.1	155	130.1	125	114.5	129.6	124.7	142.1	136.6	108.9	120.3	123.6	110.8	130.2	116.7	115.6	117.5	128.2	123.5	123.2	113.6	116.3	125.9	111.5	104.2	108.2	126.5	115.8	133.7	127.8	129	125.8	121.7	112.4	150.8	126.8	128.7	121.3	124.2	123.9	112.3	125.4	136.8	129.2	110.2;
11.3	12.03	10.67	15.64	10.6	9.97	16.34	16.04	16.02	9.21	12.92	13.99	15.62	18.46	14.7	14.18	9.86	7.15	13.97	13.67	13.49	13.49	13.67	27.89	12.23	16.48	15.48	12.22	16.95	9.38	11.24	16.1	14.27	9.08	16.12	9.97	10.4	13.41	21.91	16.24	14.94	15.56	16.2	15.48	9.68	17.22	10.76	16.23	14.8	11.82	10.06	12.48	18.66	14.77	13.22	17.23	13.38	10.36	10.4	9.04	9.55	11.97	14.88	17.52	14.95	15.4	11.35	15.97	15.01	14.42	15.61	9.33	15.09	9.36	13.32	11.75	11.24	16.61	10.7	8.96	15.54	8.76	12.91	10.61	15.51	15.63	13.08	16.3	14.02	12.65	11.21	14.97	7.48	14.54	12.88	9.12	14.58	22.71	15.3	12.74	17.81	13.3	9.64	10.91	12.48	15.9	9.4	12.99	12.31	27.27	16.87	13.54	14.94	15.36	14.4	12.67	13.33	15.74	6.55	14.77	14.73	23.5	10.87	9.27	13.39	9.16	16.7	9.52	11.31	14.09	12.23	15.11	9.69	17.86	15.52	14.2	14.67	12.99	16.56	11.57	14.88	9.09	11.45	9.6	14.44	14.78	11.78	10.52	11.92	13.12	15.56	10	12.86	13.19	14.26	11.22	8.9	14.92	10.13	16.3	12.91	9.3	12.63	26.85	17	12.59	12.48	11.84	12.42	8.79	9.35	14.93	12.31	15.21	9.44	15.97	9.33	9.38	17.28	16.55	13.89	12.43	15.17	14.65	11.44	15.62	23.45	13.89	18.02	11.86	8.09	11.59	11.47	11.93	13.82	11.08	25.9	12.86	14.61	11.5	13.2	13.81	14.98	15.71	13.99	9.04	11.8	12.97	10.26	9.15	9.93	15.05	14.64	6.46	13.27	14.73	14.18	15.71	11.63	12.67	11.15	12.32	13.21	12.5	6.56	8.77	12.64	13.72	14.27	24.72	14.55	11.68	9.22	23.96	9.22	18.23	16.49	13.34	8.84	12.64	12.95	11.64	12.17	12.38	10.19	16.18	17.07	13.23	14.72	10.78	11.35	12.95	9.35	12.9	14.21	12.31	13.49	14.3	11.45	14.22	11.06	14.75	14.84	13.43	11.4	15.03	8.89	10.41	10.38	11.66	10.34	8.82	11.64	14.64	11.3	12.66	8.53	12.31	12.64	14.75	6.56	10.38	11.4	14.55	14.22	9.35	8.84	12.64	11.35	8.89	11.45	8.77	16.36	10.82	15.98	14.08	12.71	13.09	10.53	12.57	13.97	11.63	22.54	9.03	17.08	11.97	8.63	13.43	14.33	12.21	9.95	14.27	15.35	12.61	12.11	11.12	10.25	13	23.31	10.18	13.17	13.93	13.06	8.95	11.4	9.82	9.38	11.63	10.21	11.47	9.6	12.92	12.74	16.27	12.55	10.02	11.7	9.71	11.07	12.64	14.72	12.41	14.08	13.35	10.14	8.21	15.9	8.61	12.73	21.9	12.89	11.07	9.54	11.99	12.03	21.16	16.28	8.39	11.29	13.87	9.64	14.87	11.12	8.88	10.22	12.54	12.96	8.75	7.76	9.92	11.77	8.85	7.04	7.48	11.09	9.68	14.49	9.91	10.23	11.53	10.66	7.9	18.75	11.14	13.38	10.97	10.76	12.87	8.71	12.05	19.39	11.34	9.05
]';
data.LW_p1(:,1)=data.LW_p1(:,1)/10; % convert mm to cm
units.LW_p1 = {'cm', 'g'};     label.LW_p1 = {'total length', 'wet weight'};
bibkey.LW_p1 = {'Quei2017'};
% Pond n-2
data.LW_p2 = [ ... %TL (mm) wet weight (g)
130	120	117	112	107	132	126	129	130	98	117	124	111	117	105	122	114	103	115	111	123	108	128	119	109	121	128	116	118	123	121	123	115	123	112	131	124	124	112	121	121	133	106	121	126	114	104	110	129	130	113	96	108	106	120	114	137	121	125	125.4	116.5	120.9	125.6	125	122.8	122.3	133.6	111.6	107.2	126.7	133.2	123.2	113.7	125.3	105.5	115.2	124.4	107.6	135.3	110.4	120.5	112.1	119.6	123.5	124.1	135	113.8	118.4	118.9	120.6	128.5	98.1	115.3	127.1	122.6	111.2	129.1	113.4	98.5	132.2	116.9	112.9	103.8	111.2	116.8	128.7	131.3	112.7	112.5	127.6	108.8	128	111	118.9	126.7	125.5	107.5	119.2	123.3	118	127.8	124	134.9	135.2	116.8	113.5	118.7	128.7	111.1	115.2	115.5	124.6	121.8	112	124.7	132.6	114.1	123	122.8	114.2	127.9	119.1	127.3	108.4	138	124.1	115.1	131.2	130.2	123.1	124.9	125.9	131.6	133.1	96.1	108.8	127.9	114.3	116.1	117.3	128.7	124.1	118.5	133.3	130.4	135.6	109.6	101.6	119.8	115.2	120.8	118.4	127.9	125.9	140.1	117	127.6	132	140.7	130.9	137.4	117.3	120.8	111.4	119.9	120	121.4	115.6	127.4	129.7	129.2	131.7	121.1	135.4	113.6	132.5	135	115	128.7	130.8	126.2	128.8	127.7	123.2	119.8	129.2	105.6	139	126.7	136.7	132.9	126.7	123.4	113.4	131.1	121.7	117.2	109.9	118.2	116.8	135.1	134.5	120.4	132.4	104.7	122.9	136.2	127.1	130.5	107.5	142.2	124.4	131.1	124.8	132.2	125.1	136.7	126.9	126.4	123.2	134.2	141.5	132.4	121	140.5	131	127.2	134.3	130.5	139.9	123.3	136.3	141.6	138.9	132.7	131.9	134.5	129.1	134	117.7	132.9	121.5	133.8	141.4	131.7	137.1	123.9	136.2	143.3	120.4	135.5	117.5	123.3	136.2	127.6	115.9	109.9	125.6	132.7	118.2	122.7	140.5	109.9	132.4	123.9	141.5	132.7	136.7	124.4	127.1	134.5	133.8	143.3	137.1	115.9	131.9	126.5	136.9	130.3	128.3	119.8	125.6	136.6	141.6	118.1	131.9	124.7	131.1	130.8	133.4	127.7	130.1	122.3	137.3	138.9	130.2	124.5	125.6	142.1	134	143.1	134.6	134.9	123.5	138	141.6	144	135	128.8	128	134.9	142.7	132.3	129.8	134	118.1	129.7	134.8	142.5	141.4	134.5	123.4	137.6	128.6	142.6	134.1	125.5	137.3	133.7	128.3	129.1	133.5	130.5	134.5	121.7	140.7	138.3	128	136.5	133.9	132	146.1	126.9	127.8	131.9	134.1	136.8	131.9	132.2	140.6	123.4	133.3	127	137.1	134	119.9	144.6	128.4	141.4	137.5	128.8	133.5	138.3	134.5	144.9	138.9	126	122	134.1	134.8	126.2	134.8	132.9	132.9	125.4	130.5	132	143	144.5	126.2;
18.2	15.09	14.29	11.04	9.67	17.8	18.1	17.75	18.41	7.39	12.53	14.42	10.92	13.5	7.98	15.29	13.03	9.23	12.2	11.88	16.56	10.57	18.47	13.7	11.06	14.61	18.91	13.35	12.64	15.8	13.75	16.38	13.02	15.84	11.24	17.92	16.04	12.98	10.67	15.46	14.54	19.39	10.22	14.79	16.7	11.96	8.46	10.33	18.8	19.21	12.95	7.22	9.32	9.94	15.9	12.3	21.02	13.32	16.09	17.21	13.92	16.1	15.86	17.68	16.81	15.6	19.43	11.76	8.17	19.03	18.96	16.23	12.03	16.92	10.01	13.63	15.04	10.16	20.15	11.15	15.99	10.59	16.23	17.3	16.71	20.96	14.04	13.5	14.57	14.88	20.44	7.68	14.18	17.95	15.31	10.56	20.53	11.04	7.66	21.25	14.17	12.73	8.26	11.64	13.22	19.1	19.64	11.64	10.77	17.96	11.54	17.78	10.04	13.15	18.22	16.57	9.73	16.17	17.69	13.07	20.69	18.23	20.79	20.88	14.92	13.45	15.72	18.49	12.52	12.74	12.84	17.58	15.36	12.33	15.25	21.41	12.56	17.91	16.48	12.88	17.68	15.28	19.01	9.05	22.26	17.33	12.37	21.67	20.08	16.09	17.96	18.41	21.08	21.35	8.56	9.32	17.58	11.9	14.77	15.47	19.22	18.66	14.6	21.58	17.98	21.47	11.54	8.82	14.01	10.91	14.05	13.86	19.2	17.14	24.17	14.85	18.9	21.69	23.12	20.68	22.25	14.48	14.64	10.98	16.71	15.97	17.52	13.76	19.1	19.62	17.28	19.38	16.59	23.1	12.5	21.82	23.55	14.24	18.47	18.91	19.05	17.71	19.97	17.74	14.2	19.61	7.87	22.68	16.63	22.38	22.83	18.78	15.47	13.14	21.44	17.55	13.79	11.44	14.62	11.69	22.27	20.18	16.52	20.69	10.33	12.75	22.64	17.76	18.12	6.65	24.78	12.38	20.77	16.3	21.52	18.18	21.44	19.39	18.61	16.29	22.73	24.65	19.24	14.33	25.33	20.46	17.09	20.34	20.28	24.45	17.12	23.44	25.34	26.06	19.62	20.72	20.93	20.72	21.68	13.01	19.81	16.56	20.66	24.33	21.43	24.11	17.15	21.13	25.35	15.88	24.26	12.97	14.78	24.64	17.14	12.94	11.82	16.83	17.87	15.13	11.92	25.33	11.82	19.24	17.15	24.65	19.62	21.44	12.38	17.76	20.93	20.66	25.35	24.11	12.94	20.59	16.66	21.2	19.03	17.65	14.27	17.3	25.04	24.3	13.75	20.63	17.76	20.63	20.7	20.9	17.98	20.55	14.55	24.65	23.32	17.41	17.88	17.2	24.71	21.62	24.49	22.66	19.81	17.01	24.24	27.11	25.76	19.78	21.7	19.2	21.56	26.39	21.45	17.99	22.25	13.57	17.46	22.55	24.1	24.98	21.46	15.39	26.53	19.38	25.28	20.29	18.2	25.53	20.82	19.24	17.62	22.34	19.42	22.46	15.06	26.23	24.59	17.65	21.67	21.63	21.1	25.21	18.24	19.46	22.03	20.12	27.69	21.99	20.92	24.75	15.91	20	17.74	22.31	24.59	14.38	29.07	19.59	26.12	26.73	17.66	22.14	21.93	22.51	26.22	26.52	19.74	15.9	21.96	19.95	19.1	22.3	21.03	21.7	18	16.51	22.98	24	27.66	17.86
]';
data.LW_p2(:,1)=data.LW_p2(:,1)/10; % convert mm to cm
units.LW_p2 = {'cm', 'g'};     label.LW_p2 = {'total length', 'wet weight'};
bibkey.LW_p2 = {'Quei2017'};
% Pond n-3
data.LW_p3 = [ ... %TL (mm) wet weight (g)
130	118	118	99	111	134	123	127	105	116	128	110	94	119	127	114	123	109	114	118	128	108	122	112	129	122	121	123	112	117	117	115	115	118	118	106	117	103	120	142	128	104	126	129	117	117	108	118	131	128	126	109	116	106	112	122	111.6	109	121.1	118.4	115.1	118.5	112.5	95.8	127.4	110.4	135.9	113.8	128.4	116.2	127.5	117.3	107	112.7	112.3	118.8	119.5	122.8	119.8	128.1	131	129	124.9	129.6	117.3	119.3	106.8	110.6	131.6	116.4	122	115.8	117.7	110.4	128.5	122.3	117.3	144	124.5	107.6	119.5	122.3	116.3	123.1	105.5	119.1	114.4	102.4	122.3	124.7	128.2	105.1	118.3	110	127.4	118	122	118.8	117.3	132.3	111.2	124.5	129.8	120.7	115	130.3	130.7	120	121	119	113.1	131.5	117	130.6	116.6	122.8	124.5	121.2	122.1	121.3	130.7	119.3	122.3	138.7	122.3	120.4	113.1	132.2	119.1	110.1	112.6	105.2	125.6	97.8	131	110.3	143.9	117.8	119.1	111	106.8	123.6	113.6	127.3	115.2	114.8	128.9	103.9	132.6	127.4	129.7	114.8	120.7	119.2	132.4	130.5	120.5	139.6	111.9	123.1	105.5	113.2	124.4	124.7	122.1	112.5	119.1	124.4	130.9	110.7	130.7	133.2	112.6	123.7	117.7	123.6	120.2	100.1	121.7	119	120.9	128.4	134.2	143.9	120	130.4	121.3	116.7	122.9	131.4	121.7	117.6	106.8	124.5	116.2	118.5	107.4	127.7	109.2	125.3	110.6	117.6	121.1	113.6	121.2	131.5	120.8	120	131.9	130.1	134.5	127.9	129	143.5	124	133.1	124.9	133.5	123.8	131.2	132.4	134.2	114	104.4	125.9	122.4	117.9	124.9	124.7	115.5	137.9	126.7	122.7	110.1	121.4	115.1	111.5	132.7	126.3	129	134	123.4	129.9	118.3	146.7	124.7	108	113.2	130.2	126.2	122.4	122.2	119	119.1	116.7	133.4	114.2	122.2	110.5	117.7	131.5	131.2	124.7	121.2	116.7	133.1	113.2	126.2	122.2	120.8	124	124.7	110.5	134.5	110.1	120.9	129.2	106.4	130.7	119.4	113.9	129.3	116.1	112.1	125.1	121.3	125.4	134.1	143.6	133	132.2	134.4	118	145.9	122.8	126.4	127.7	138	125.1	132.6	123.6	125.8	123.7	107.9	122.6	122.8	132	130.1	127.8	120.1	122.3	135.3	113.7	126.2	118.9	131.9	129.1	129.8	129.3	116.7	118.3	125.8	124.8	127.1	133.3	125.6	133.6	145.8	123.8	123.6	130.9	134	133.5	119.6	112.5	132	108.9	127.8	131.9	125.8	144	123.8	131.7	114.2	130.2	119.4	140.9	123.7	131.6	130.5	134.3	117.5	125.7	124.5	123.3	129.9	122.5	127.2	129.3	121.7	122.7	115	144.9	120.7	108.2	124.3	113	132.1	117.3	118.8;
17	14.66	13.92	8.2	11	19.68	16.02	17.35	9.06	13.08	16.75	10.8	6.73	14.04	15.95	11.64	15.13	10.75	13.62	14.37	17.8	9.94	15.67	10.6	18.54	13.92	14.07	15.38	12.6	13.02	14.8	12.76	13.78	13.85	13.83	10.86	13.15	8.31	13.07	24.45	17.58	8.49	16.77	18.14	13.68	14.61	10.62	13.7	18.62	18.4	16.65	10.41	13.55	10.63	13.73	15.77	10.27	10.22	14.43	12.56	11.38	13.82	10.5	6.87	16.56	10.89	19.62	13.18	18.09	12.45	16.51	12.68	8.99	11.45	12.26	14.92	13.56	15.12	13.92	17.41	18.3	18.71	16.41	18.58	14.74	14.03	10.54	9.95	18.23	13.54	13.89	13.35	13.27	10.69	16.53	15.98	14.6	24.47	15.05	11.15	13.96	14.55	13.95	14.88	8.39	12.81	13.77	9.35	14.58	14.99	17.32	8.22	13.67	9.76	17.1	13.18	14.92	15.86	12.02	18.52	11.77	15.27	16.72	14.51	13.14	17.62	18.69	13.55	14.07	15.32	10.7	17.23	13.57	17.16	14	14.73	15.51	14.02	13.75	15.82	19.59	13.17	15.53	20.98	13.93	13.65	11.55	18.63	12.81	10.06	10.74	9.25	15.82	7.48	18.24	11.21	24.74	14.13	13.12	10.73	8.7	16.96	11.38	14.68	12.16	13.62	17.49	8.64	18.32	16.06	18.06	11.05	12.64	14.57	20.01	17.49	15.18	21.26	9.87	15.08	9.26	10.67	15.31	17.61	17.03	12.3	12.83	16	16.94	9.19	17.23	18.59	11.74	15.28	13.55	12.64	13.33	7.92	14.05	14.12	13.94	17.12	17.87	24.17	12.64	17.8	13.75	11.97	13.39	16.16	12.36	12.03	8.74	16.32	11.66	13.91	8.53	14.21	9.7	15.83	11.18	14.01	13.06	10.46	14.08	16.61	14.32	11.61	16.17	14.01	18.44	16.42	15.09	21.81	14.2	16.7	14.76	18.07	16.03	17.63	17.49	18.91	11.82	8.59	15.83	14.37	11.43	14.55	12.5	10.78	18.49	15.33	13.24	9.08	11.92	11.68	9.75	17.19	13.02	16.69	19.71	13.41	16.91	12.18	24.29	13.47	9.31	9.34	17.76	17.8	12.67	14.25	12.57	13.26	11.46	16.76	10.49	13.54	9.06	13	16.61	17.63	12.5	14.08	11.46	16.7	9.34	17.8	13.54	14.32	14.2	13.47	9.06	18.44	9.08	12.27	13.76	8.97	17.92	12.21	12.07	14.7	10.82	9.91	14.18	11.89	14.07	16.92	21.09	18.28	15.78	18.61	10.48	23.36	14.15	14.78	15.46	18.03	12.95	17.31	13.36	15.53	15.42	9.46	12.43	12.94	16.43	16.74	14.32	11.83	12.24	17.26	12.07	12.6	9.56	15.46	12.67	15.64	14.21	10.82	11.38	14.08	13.09	14.54	15.7	15.14	17.64	22.81	13.88	12.01	17.72	16.83	18.29	12.06	10.24	16.54	9.09	15.49	16.94	13.99	20.84	13.04	16.6	10.01	14.54	10.98	19.68	14.56	16.4	16.28	15.68	11.14	14.73	10.94	12.93	15	12.96	15.02	17.65	13.43	7.85	7.27	21.74	8.32	8.92	13.55	11.68	17.41	11.56	10.56
]';
data.LW_p3(:,1)=data.LW_p3(:,1)/10; % convert mm to cm
units.LW_p3 = {'cm', 'g'};     label.LW_p3 = {'total length', 'wet weight'};
bibkey.LW_p3 = {'Quei2017'};
% Pond n-4
data.LW_p4 = [ ... %TL (mm) wet weight (g)
113	118	120	115	116	109	127	117	102	124	130	129	112	127	122	129	114	115	130	109	134	111	124	119	101	114	99	114	120	130	111	117	130	119	125	123	119	110	109	133	126	129	111	100	95	120	118	113	131	111	125	130	130	113	112	118	102.9	102.9	127.8	129.7	116.8	115.1	119.8	118.5	114.1	130.9	127.7	125.5	116.3	114.8	109.1	112	129.6	113.7	132.1	133.7	117.6	131.5	98.8	120.7	107	112.6	114.9	102.3	118.3	126.7	128.8	118.6	110.3	121.4	120.3	115.2	134.1	123.5	129.5	118.4	127.9	131	110.2	119.1	117.7	125.4	125	112.1	101.3	131.6	113	118.4	117.4	109.5	133.7	110.6	131	130.3	121	120.1	105	133.7	129.9	116.5	98.3	127.6	109.1	114.7	106.2	136.1	129.7	120.5	120.1	122.8	113.2	119.5	117	127.5	109.3	105.5	117	119	133.5	130.9	102.7	121.8	127.5	121.6	111	113.5	132.6	120	117.5	126.7	121	124.4	117.6	116.5	120.3	128.5	113	113.8	112.6	117	113.1	126.7	131.3	119.6	131.5	127	107.6	113.5	125.7	122.9	135.4	116	134.6	113.9	137.4	118.1	118.2	138.3	115.9	98.6	130.4	116.5	117.7	122.4	124.3	130.1	129.7	124.3	119	121.6	103.4	120.6	123.2	113.4	119.4	132.1	110.4	131.4	137	131.7	115.7	119.7	119.7	133.1	115.8	128.9	125.8	136.2	127.6	128.6	128.7	119	106.8	116.1	123.3	112.6	120.7	110	121.7	134.1	128.6	130.3	113	122.1	116.7	128.4	120.3	126.3	137.5	117.9	118.4	107.7	131.5	122.5	116.4	112.4	124.9	117.1	137.5	119.2	122.4	125.6	127.9	133	137.8	123.2	137	126.1	130.1	134.7	130	122.9	135.2	141.5	110.7	120.9	132.9	123.6	118.3	102	108.2	115.7	134.6	121.5	129.1	116.4	118.6	133.6	136	119.9	130.2	131.3	133.7	123.2	130.7	117.5	122.5	137.5	128.4	134.6	120.3	121.5	122.9	126.3	113	136	119.2	123.6	107.7	116.7	115.7	129.4	141.3	134.6	119.6	136.5	135.6	129.8	139.3	133	116.6	122.1	118.1	117.2	102	117.3	117.3	125.4	124.4	111.3	129.8	129.9	132.4	122.6	133.5	115.8	108.2	122.6	124.8	128.9	121.5	137.6	120.6	131.3	119	117	134.7	125.5	120	136.7	142.3	139.3	126.3	133.6	133	124.5	118.3	118.9	122.5	108	130.5	102.4	129.8	130	137.3	117.1	123.6	133.9	129.3	136	120.2	113.1	117.8	126.1	120.4	112.8	129.7	131.7	133.2	111	116.8	111.5	122.3	101	117.5	123.3	117.4	115.8	128.2	106.3	131.8	122.8	124.7	131.2	134.9	130.5	137.3	130.5	128.2	129.2	117.3	116	127.4	134.8	133.2	119.3	130.3	114.6	119.7	128	120.1	121;
12.68	13.91	12.97	12.36	13.58	9.82	17.9	14.18	8.52	16.13	18.31	18.93	12.67	17.23	15.3	19.5	12.43	12.66	16.14	10.37	20.09	11.33	15.39	13.29	7.59	13.19	7.85	12.27	14.67	18.11	10.4	13.88	17.94	14.43	17.12	15.83	14.03	11.49	9.96	18.77	17.04	18.84	10.43	7.94	6.73	15.06	14.56	11.15	17.39	10.21	15.62	18.43	16.97	12.8	11.85	13.07	8.14	7.78	17.52	17.66	13	12.27	14.8	14.18	10.59	20.23	16.27	16.15	12.06	12.95	9.21	9.83	17.44	11.59	17.39	19.96	14.3	18.04	6.46	14.81	10.58	11.25	12.26	8.47	14.36	16.35	18.97	12.8	9.92	14.79	13.74	12.25	19.12	15.71	19	12.3	17.88	16.57	10.34	13.88	12.41	17.39	16.57	10.98	8.36	18.29	12.13	14.62	13.35	11.48	19.3	9.94	17.68	17.83	13.11	15.33	8.55	20.49	18.72	13.57	6.35	16.64	9.4	12.05	9.58	19.12	18.35	12.36	15.94	15.35	11.71	13.07	13.39	17.75	10.57	8.56	14.57	13.21	21.9	19.04	8.77	15.05	17.81	15.47	12.09	10.85	20.39	17.14	12.1	18.34	14.81	16.85	12.91	13.4	15.15	16.37	11.36	11.89	12.16	12.8	10.55	16.31	17.15	14.79	17.54	17.24	8.83	10.01	15.09	14.89	18.43	11.77	17.51	10.58	19.4	13.29	12.34	22.19	10.97	6.44	17.8	11.72	13.59	15.1	12.7	18.1	15.59	15.58	12.16	14.62	8.12	13.2	15.1	9.75	12.41	19.17	10.24	16.56	20.15	16.87	11.64	14.45	12.52	17.42	11.76	17.4	17.23	16.66	15.7	17.04	16.33	10.86	8.47	11.49	14.95	11.78	14.28	9.04	12.7	17.12	17.39	18.2	10.93	14.19	11.2	15.01	13.75	13.29	19.49	11.74	10.22	8.63	16.65	12.5	12.19	10.18	15.7	12.35	18.45	12.92	13.59	15.32	16.65	17.71	20.62	12.46	18.5	16.03	17.28	18.45	17.88	14.34	17.08	24.25	9.23	13.13	17.68	15.37	12.62	7	9.29	9.86	16.72	14.36	16.42	12.15	12.56	17.96	19.8	13.22	14.71	17.68	17.75	16.22	18.24	11.71	12.5	18.45	15.01	16.72	13.75	14.36	14.34	13.29	10.93	19.8	12.92	15.37	8.63	11.2	9.86	16.45	23.06	17.24	12.32	18.59	16.81	14.35	19.72	17.28	12.52	13.8	12.16	9.58	6.84	11.96	11.56	15.56	14.62	9.52	15.9	17.02	16.68	13.06	17.22	11.78	9.02	11.63	14.58	17.14	12.89	17.46	13.28	16.45	12.74	11.74	16.05	14.15	11.72	16.97	22.38	19.58	15.13	16.57	16.86	12.87	11.99	11.79	13.18	8.94	16.79	6.91	13.78	15.88	17.14	8.52	11.34	17.25	16.89	17	12.8	9.38	11.79	14.08	13.49	9.04	15.93	15.74	14.83	8.1	6.98	7.22	12.41	6.83	11.41	14.61	11.48	12.46	16.15	9.22	16.13	13.78	13.29	16.65	16.09	16.17	21.07	16.05	15.04	14.34	10.95	11.64	12.89	14.88	18.72	12.3	16.35	10.98	13.4	15.06	12.58	10.48
]';
data.LW_p4(:,1)=data.LW_p4(:,1)/10; % convert mm to cm
units.LW_p4 = {'cm', 'g'};  label.LW_p4 = {'total length', 'wet weight'};
bibkey.LW_p4 = {'Quei2017'};

%Data from Dessier 2015 ALW, AGSI and Temperature
AWL=[194.0000  4.1438    8.4407;   197.0000    4.0986    8.3400;   198.0000    4.7145    8.6867;   214.0000    5.2263    8.3000;   217.0000    5.8701    9.1800;  220.0000    5.2613    8.7400;
  225.0000    8.0754    9.9400;   228.0000    8.2417    9.7542;   233.0000    8.5842   10.5800;   241.0000    9.6547   10.5800;   248.0000   13.2300   11.3067;   262.0000   10.7976   11.2600;
  269.0000   14.4033   11.8600;   278.0000   14.3812   12.0000;   290.0000   16.8900   12.5700;   304.0000   15.5194   12.6600;   311.0000   20.2125   13.4063;   332.0000   20.1427   13.5167;
  334.0000   18.9200   13.3600;   353.0000   21.6903   13.8645;   366.0000   24.4600   14.5200;   374.0000   24.6367   14.5233;   396.0000   25.0600   14.4200;   397.0000   26.0200   14.7300];%Age (d), Weight (g), Length (cm)
AGSI=[234	0.16; 250	0.46; 264	1.02; 276	1.24; 306	3.16; 338	4.34; 368	3.22];%Age (d),GSI %

tT=[0.00 17.9;1.94 18.0;7.56 17.9;15.42 17.9;24.40 17.7;26.65 17.5;31.14 17.3;37.88 17.1;44.61 16.9;49.11 16.7;53.63 15.1;58.12 14.7;61.49 14.3;
69.35 13.9;74.96 13.7;76.09 13.4;86.19 13.0;98.55 12.3;114.27 11.9;125.50 11.6;132.24 11.4;142.34 11.3;154.70 11.2;164.80 11.1;174.91 11.1;186.14 11.4;194 11.6; 195 17; 400 17];%age, Temperature C
% tT(:,2) = C2K(tT(:,2)); 

data.tL2=[AWL(:,1) AWL(:,3)];%Age (d), physical Length (cm)
units.tL2 = {'d', 'cm'};     label.tL2 = {'Age', 'Total length'};
temp.tL2 = tT; units.temp.tL2 = {'d','C'}; label.temp.tL2 = {'age','temperature'};
bibkey.tL2 = {'Dess2015'}; %bibkey.temp.tL2 = 'GattPeti2017';
%comment.tL2 = 'Mean temp in the field for tb is 17 C, otherwise time series for temperature vs age';
comment.tL2 = ['Temperature in the experiment was 17 C. The ontogeny from birth (assumed at 17 C) and the beginning of the experiment was reconstructed'...
    'using temperature data in [Ref: GattPeti2017]'];

data.tW=[AWL(:,1) AWL(:,2)];%Age (d), Wet weight (g)
units.tW = {'d', 'g'};     label.tW = {'Age', 'Wet weight'};
temp.tW = tT; units.temp.tW = {'d','C'}; label.temp.tW = {'age','temperature'};
bibkey.tW = {'Dess2015'};
comment.tW = ['Temperature in the experiment was 17 C. The ontogeny from birth (assumed at 17 C) and the beginning of the experiment was reconstructed'...
    'using temperature data in [Ref: GattPeti2017]'];


data.tGSI=[AGSI(:,1) AGSI(:,2)]; %Age (d), Gonado somatic index (%)
units.tGSI = {'d', '-'};     label.tGSI = {'Age', 'Gonado somatic index'};
bibkey.tGSI = {'Dess2015'};
temp.tGSI = tT; units.temp.tGSI = {'d','C'}; label.temp.tGSI = {'age','temperature'};
comment.tGSI = ['Temperature in the experiment was 17 C. The ontogeny from birth (assumed at 17 C) and the beginning of the experiment was reconstructed'...
    'using temperature data in [Ref: GattPeti2017]'];

%% set weights for all real data
weights = setweights(data, []);

weights.ap    = 0 * weights.ap;
weights.Lp    = 0 * weights.Lp;
weights.Wwp    = 0 * weights.Wwp;

weights.ap2    = 3 * weights.ap2;
weights.Lp2    = 3 * weights.Lp2;
weights.Wwp2   = 3 * weights.Wwp2;
weights.tL2    = 3 * weights.tL2;
weights.tW    = 5 * weights.tW;
weights.tGSI    = 0 * weights.tGSI;
weights.tGSI(end,:) = 0;
weights.Ri    = 3 * weights.Ri;
weights.Wwi    = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                           
%% Group plots
set1 = {'LW_p1','LW_p2','LW_p3','LW_p4'}; subtitle1 = {'Data for pond 1,2,3,4'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Scaled functional responses in the 4 ponds exceed 1; this is possible if supplied food is more nutritious than average in the field';
D2 = ['New in version 2019/09/16 (difference to version 2017/07/06): integration of data and new parameter estimates to include the data.'  ...
    'Zero variate data on puberty (ap2, Lp2, Wwp2) and three univariate data sets were introduced from a control experiment that lasted'...
    '6 months in which age, weight, and maturation of 250 individuals (at start of experiment) were monitored accurately, with some individuals attaining puberty'...
    '[a thesis work, Dessier 2015]. Age at the beginning of the experiment was determined via otoliths and the ontogeny before the experiment was reconstructed'...
    'using temperature data in Gatti et all 2017 [Ref: GattPeti2017]. Other data has been kept identical from the last entry.'];
D3 = 'Data for age - GSI: The last data point was given weight zero in parameter estimation. The fish may have released some reproductive material but it is not certain.'; 
D4 = 'mod_5: assume 10 spawnings per season, which also affects tGSI predictions';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '79MLD'; % Cat of Life
metaData.links.id_ITIS = '161813'; % ITIS
metaData.links.id_EoL = '46562411'; % Ency of Life
metaData.links.id_Wiki = 'Sardina_pilchardus'; % Wikipedia
metaData.links.id_ADW = 'Sardina_pilchardus'; % ADW
metaData.links.id_Taxo = '42663'; % Taxonomicon
metaData.links.id_WoRMS = '126421'; % WoRMS
metaData.links.id_fishbase = 'Sardina-pilchardus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/European_pilchard}},'...
'note = {Last accessed: 2019-09-16}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation},' ...
'publisher = {Cambridge Univ. Press, Cambridge},' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)},' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dess2015'; type = 'phdthesis'; bib = [ ...
'author = {Dessier, A.}, ' ...
'year  = {2015}, ' ...
'title = {Analyse du compartiment m\''{e}sozooplanctonique et \''{e}cologie alimentaire printani\`{e}re de la sardine, \emph{Sardina pilchardus} ({W}albaum, 1782), et de l''anchois, \textit{Engraulis encrasicolus} ({L}inn\''{e}, 1758) adultes dans le {G}olfe de {G}ascogne },'... 
'school = {Univ. La Rochelle}, ' ...
'address = {La Rochelle}, '...
'pages = {319}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GattPeti2017'; type = 'Article'; bib = [ ...    
 'title = {Comparing biological traits of anchovy and sardine in the {B}ay of {B}iscay: A modelling approach with the {D}ynamic {E}nergy {B}udget},'...
 'author = {Gatti, Paul and Petitgas, Pierre and Huret, Martin},'...
 'journal = {Ecological Modelling},'...
 'volume = {348},'...
 'pages = {93--109},'...
 'year = {2017},'...
 'doi = {10.1016/j.ecolmodel.2016.12.018},'...
 'publisher = {Elsevier}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ICES2012'; type = 'Techreport'; bib = [ ...    
'author = {ICES}, ' ...
'year  = {2012}, ' ...
'title = {Report of the Working Group on Acoustic and Egg Surveys for Sardine and Anchovy in {I}{C}{E}{S} Areas {V}{I}{I}{I} and {I}{X} ({WGACEGG}), {F}uengirola ({M}alaga), {S}pain, 26-30 {N}ovember 2012.}, ' ...  
'institution = {ICES}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
% bibkey = 'Mene2003'; type = 'Book'; bib = [ ...    
% 'author = {Meneses, I.}, ' ...
% 'year  = {2003}, ' ...
% 'title = {Estima\c{c}\~{a}o de Factores que Condicionam a Variabilidade do Recrutamento de Peixes na Costa {A}tl\^{a}ntica da {P}en\''{i}nsula {I}b\''{e}rica. {D}isserta\c{c}\~{a}o apresentada para acesso \`{a} categoria de Investigador Auxiliar.}, ' ...  
% 'publisher = {INIAP-IPIMAR}, ' ...
% 'address = {Lisboa}, '...
% 'note = {324 p}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NuneSilv2011'; type = 'Article'; bib = [ ...    
'author = {Nunes, C. and A. Silva and V. Marques and K. Ganias}, ' ...
'year  = {2011}, ' ...
'title = {Integrating fish size, condition, and population demography in the estimation of {A}tlantic sardine annual fecundity.}, ' ...  
'journal = {Ciencias Marinas}, ' ...
'volume = {37.4B}, ' ...
'pages = {565--584}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Quei2017'; type = 'Misc'; bib = [ ...
'author = {Q. Queiros, 2017}, ' ...
'year  = {2017}, ' ...
'howpublished = {Experimental data not yet published: 4 ponds}'];  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReMene2008'; type = 'Book'; bib = [ ...    
'author = {R\''{e}, P. and Meneses, I.}, ' ...
'year  = {2008}, ' ...
'title = {Early Stages of Marine Fishes Occurring in the {I}berian {P}eninsula}, ' ...  
'publisher = {IPIMAR}, ' ...
'address = {Lisboa}, '...
'note = {283 p}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilvSant2006'; type = 'Article'; bib = [ ...    
'author = {Silva, A. and M. B. Santos and B. Caneco and G. Pestana and C. Porteiro and P. Carrera and Y. Stratoudakis}, ' ...
'year  = {2006}, ' ...
'title = {Temporal and geographic variability of sardine maturity at length in the north-eastern {A}tlantic and the western {M}editerranean}, ' ...  
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {63}, ' ...
'pages = {663--676}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilvCarr2008'; type = 'Article'; bib = [ ...  
'author = {Silva, A. and P. Carrera and J. Mass\''{e} and A. D. Uriarte and M. B. Santos and P. B. Oliveira and E. Soares and C. Porteiro and Y. Stratoudakis}, ' ...
'year = {2008}, ' ...
'title = {Geographic variability of sardine growth across the northeastern {A}tlantic and the {M}editerranean {S}ea}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = 90, '...
'pages = {56--69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];