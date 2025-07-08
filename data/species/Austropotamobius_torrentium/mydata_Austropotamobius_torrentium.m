function [data, auxData, metaData, txtData, weights] = mydata_Austropotamobius_torrentium

%% set metaData
metaData.phylum     = 'Arthropoda';
metaData.class      = 'Malacostraca';
metaData.order      = 'Decapoda';
metaData.family     = 'Astacidae';
metaData.species    = 'Austropotamobius_torrentium';
metaData.species_en = 'Stone crayfish';

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iF','0iFc','0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi','jiH'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp

metaData.data_0     = {'ah', 'ab', 'ap', 'am', 'Lh', 'Lp','Li', 'Wwi','Ri', 'E0'};
metaData.data_1     = {'L-Ww', 'L-N'};

metaData.COMPLETE   = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Nina Marn','Sandra Hudina'};  
metaData.date_subm = [2020 08 28];
metaData.email    = {'nina.marn@gmail.com'};
metaData.address  = {'Rudjer Boskovic Institute, Zagreb, Croatia'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'};
metaData.date_acc    = [2020 08 30];

%% set data
% zero-variate data
data.ah = 7*30;  units.ah = 'd'; label.ah = 'age at hatching'; bibkey.ah = 'MaguErbe2002';
temp.ah = C2K(10); units.temp.ah = 'K'; label.temp.ah = 'temperature';
comment.ah = ['Incubation from Oct/Nov to spring, females found carrying eggs latest in May.'...
    'Crayfish hatch in spring and stay attached to mother for a few molts.'];
data.ab = data.ah+10;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'MaguErbe2002';
temp.ab = C2K(10); units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'After molting, feed on live invertebrates';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth';  bibkey.tp = 'Wiki';
temp.tp = C2K(12); units.temp.tp = 'K'; label.temp.tp = 'temperature';
comment.tp = 'Sexual maturity is reached after 3 to 5 years, Parvulescu (2010) on Wiki';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Hold2002';
temp.am = C2K(10);   units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'Data for other freshwater crayfish';

data.Lhc = 0.34; units.Lhc = 'cm';   label.Lhc = 'carapace length at hatching';       bibkey.Lhc = 'HubeSchu2005';
  comment.Lhc = 'Egg diameter is 3mm;Signal and stone crayfish were equal in carapace length of first juvenile stages and showed no significant differences on day 2 after hatching';
data.Lpc  = 2.6;   units.Lpc  = 'cm';  label.Lpc  = 'carapace length at puberty females'; bibkey.Lpc  = 'HubeSchu2005';
  comment.Lpc = 'puberty moult at a carapace length of about 26 mm';
data.Lp  = 6.0;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty females'; bibkey.Lp  = {'MaguErbe2002', 'DakiMagu2016'};
  comment.Lp = ' Length at sexual maturity 3.5-5 cm, Parvulescu (2010) on Wiki, 5.8cm - 6.30cm on Medvednica (Croatia)  [MaguErbe2002], The smallest egg-bearing female was 6.42 cm long in DakiMagu2016 ';
data.Li  = 9.7;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = {'MaguErbe2002', 'VlacVald2015', 'DakiMagu2016'};
  comment.Li = 'Longest female on Medvednica (Croatia) 9.3cm (MaguErbe2002); ultimate total length 60-90 mm in EoL, 9.48 cm in VlacVald2015,  10.37 cm for females in DakiMagu2016';
data.Lim  = 10.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = {'MaguErbe2002', 'VlacVald2015', 'DakiMagu2016'};
  comment.Lim = 'Longest male on Medvednica (Croatia) 10.3 cm (MaguErbe2002); ultimate total length 60-90 cm in EoL, 10.38 mm in VlacVald2015, 11.02 cm for males in DakiMagu2016';

data.Wwi = 40;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'MaguErbe2002', 'DakiMagu2016' };
  comment.Wwi = 'Max wet weight of females on Medvednica (Croatia) 38g in MaguErbe2002, 43g in DakiMagu2016';
data.Wwim = 70;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = {'MaguErbe2002', 'DakiMagu2016' };
  comment.Wwim = 'Max wet weight of males on Medvednica (Croatia) 55g in MaguErbe2002, 72g in DakiMagu2016,  but the reported max wet weight on EoL is 100g (and similar length)!';
 
data.Ri = 80/(2*365); units.Ri  = '#/d';    label.Ri = 'max reprod rate'; bibkey.Ri  = {'EoL', 'MaguErbe2002'};
temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = ['Reproduction in Sep/Oct, eggs of 3mm diameter, 50-100 per brood (EoL); Males can reproduce every year, but females do not reproduce one year after laying eggs (Wiki)', ...
    'The maximal number of eggs per female 104 (average 53.56) [MaguErbe2002]'];

data.E0 = 55.56 * 2.8/2.22; units.E0  = 'J'; label.E0  = 'initial energy content of the egg'; bibkey.E0  = {'RodrGarc2006','MaguKlob2005'};
  comment.E0 = 'Based on Redclaw crayfish (RodrGarc2006): egg diameter (2.22 mm) and energy (55.56 J/egg), egg diameter avg 2.8mm (2.4 to 3.4mm) (MaguKlob2005)';

%% univariate data

% length-wet weight
% females, Mrzlak:
WwL1 = [18	28	24	10	5	3	15	7	7	5	1	3	3	3.5	11	9	5.5	3	5	3	3.5	15.5	8	6	3	4	2	3.5	5.5	6.5	10	5	5	2.5	2.5	4	12	2.5	3.5	4	5.5	10	2	12	2	4	3.5	3.5	5.5	4	6	4	35	21	13	7	19	3	3	3	11	16	8	7	7	6.5	12	18	27.5	21	9	14	9	5.5	11	6	13	17
    7.8	9.03	8.4	6.27	5.44	4.8	7.28	5.85	5.64	5.38	3.64	4.62	4.57	4.9	7.55	6.18	5.23	4.35	5.04	4.45	4.75	7.65	6	5.35	4.6	4.92	3.7	4.68	5.5	5.72	6.3	5.57	5.5	4.25	4.4	5.16	6.7	4.28	4.86	4.86	5.34	6.15	3.5	6.66	3.87	4.74	4.65	4.61	5.32	5.36	5.77	4.52	9.28	7.84	6.32	6.5	7.43	4.42	4.34	4.14	7	7.45	5.6	5.66	6	5.75	7.03	7.6	8.83	8.1	6.2	6.8	5.85	5.5	6.31	5.85	7.08	7.9
    ]';
data.LWw1 = [WwL1(:,2), WwL1(:,1)]; units.LWw1  =  {'cm', 'g'};    
label.LWw1 = {'total length', 'wet weight', 'females, Mrzlak'}; bibkey.LWw1  = 'MaguKlob2011';
comment.LWw1 = 'Mrzlak stream, females';
% females, Kraljevec:
WwL2 = [8	11	10	13	12	17	20	23	19	9	18	12	13	17	4	16	14	25	15	23	18	19	31	12	19	20	19	23	16	17	17	12	13	11	19	23	25	14	18	27	25	20	18	18	21	7	24	5	12	13	8	12	10	24	5	16	10	11	13	28	6	2	7	7	7	6	29	15	19	21	13	7	8	8	14	16	4	19	19	16	17	23	19	17	9	11	20	22	13	8	14	23	17	14	17	15	23	13	16	6	17	13	17	11	11	11	10	20	14	8	14	10	18	16	5.5	16.5	16	15	16	17	21	16.5	18	24.5	26	7	16	20	15	8	22	19	13	15	11	3	11.5	20	7	16	27	6	7	9	10	11.5	17	23.5	13	20	22	14.5	15.5	15	20	14	14	18	15	24	23	20	21	20	20	18	20	19	22	20	12	12	13	19	13	18.5	16	19	9	23.5	11.5	15.5	18	13.5	21	21	19.5	1	16	9	15	24	17	17.5	2	22.5	22.5	10	17.5	18	24	5	20	1	10	13	10	9.5	4	2	9.5	9	14.5	22.5	24	10	23	6	9	8	25	23	22	20	22	21	16.5
    6	6.57	6.8	7.55	6.4	7.73	8.2	8.1	7.55	5.9	7.1	6.6	6.7	7.3	4.56	7.27	6.98	8.7	6.65	8.2	7.66	7.65	9.29	6.74	7.77	7.9	7.7	8.5	6.93	7.5	7.6	7.16	6.34	5.8	7.38	7.5	8.6	7.06	7.4	8.3	7.93	7.57	6.9	6.93	7.88	5.6	9.2	4.6	6.6	6.7	5.73	6.5	6.35	8.6	4.67	6.8	6.3	6.45	6.92	8.74	4.8	3.5	5.37	5.15	5.02	4.7	8.44	6.4	7.9	7.7	5.87	5.34	5.97	5.84	7.17	7.68	4.82	7.81	8.02	7.68	7.56	8.47	8	8.07	6.22	6.82	8	8.24	6.88	5.72	6.85	8.11	7.89	6.5	7.44	7.16	8.1	6.9	7.16	5.44	7.28	6.7	7.4	6.5	6.77	6.5	6.3	7.97	7.67	6.44	7	6.46	7.57	7.55	5.06	7.37	7.38	7	7.37	7.7	8.31	7.42	7.47	8.7	8.3	5.91	7.8	7.98	7.58	6	8.41	7.76	7	7.33	6.9	4.37	6.74	8	5.94	7.42	8.9	5.8	5.85	6.34	6.4	7.28	7.91	8.3	6.88	8.22	8.27	7.13	7.26	7.23	7.8	7	6.9	7.81	7.58	8.35	8.1	7.65	7.93	7.87	8.2	7.44	8.3	7.96	8.3	8.21	6.94	6.8	7.58	8.1	7.27	7.72	7.91	8.22	6.83	8.4	6.92	7.46	7.98	7.44	8.23	8.07	8.08	3.6	7.75	5.85	7.08	8.38	7.76	7.8	4	8.32	8.6	6.6	7.9	7.76	8.3	4.96	8.13	3.24	6.21	7.15	6.24	6.2	4.73	3.67	6.4	6.01	7.07	8.32	8.25	6.43	8	5.28	6.06	5.94	8.52	8.33	7.65	8.3	8.24	7.98	7.32
    ]';
data.LWw2 = [WwL2(:,2), WwL2(:,1)]; units.LWw2  =  {'cm', 'g'};
label.LWw2 = {'total length', 'wet weight', 'females, Kraljevec'}; bibkey.LWw2  = 'MaguKlob2011';
comment.LWw2 = 'Kraljevec stream, females';
% females, Sarni:
WwL3 = [2.5	4	2.5	2	14	9	14	16	10	9	9	12	16	17	14	10	8	16	9	19	15	8	3	5	5	9	9	5	12	14	11	13	3	4	3	7	8	9	11	17	2	9	2	14	13	15	17	4	5	6	6	7	10	10	13	16	26	6.5	11	14	12	16	18.5	18.5	17.5	18	11	10	18	13	9	14	18	7	9	11	17.5	11	9	12.5	17	20	13.5	19	10.5	10	12	13.5	17.5	1	8.5	2	5	7.5	4	20	4	0.2	0.35	18
    4.2	4.8	4.5	4.38	7.17	6.5	6.72	7.47	6.55	6.09	6.03	7.05	7.38	7.43	6.97	6.42	5.77	7.2	6.46	8.11	8.1	6.19	4.33	4.91	4.87	6.2	6.36	5.25	7.18	7.2	6.8	7.32	4.75	4.9	4.64	6	5.93	6.2	7.04	7.7	4.24	6.11	3.72	6.93	7.15	7.16	7.48	4.77	5.24	5.63	5.49	5.65	6.68	6.22	6.9	7.41	8.63	5.67	6.93	7.3	6.62	7.43	7.83	8.11	7.77	8.03	6.94	6.55	7.26	7.5	6.57	7.26	8.35	6.08	6.53	7.12	8.3	7.06	6.6	7.19	7.7	8.12	7.46	8.03	6.4	6.55	6.99	7.15	7.51	2.76	6.07	3.9	5.35	6.08	4.46	7.37	4.72	1.9	2.07	7.5
    ]';
data.LWw3 = [WwL3(:,2), WwL3(:,1)]; units.LWw3  =  {'cm', 'g'};
label.LWw3 = {'total length', 'wet weight', 'females, Sarni'}; bibkey.LWw3  = 'MaguKlob2011';
comment.LWw3 = 'Sarni stream, females';
% females, Bregana:
WwL4 = [7	3	2	10	15	2	9.5	15	22	14	11	11	21.5	8	5.5
    5.25	4.5	3.66	6.28	6.97	4	6.16	7.3	8.33	7	6.4	6.61	8.25	6	5.03
    ]';
data.LWw4 = [WwL4(:,2), WwL4(:,1)]; units.LWw4  =  {'cm', 'g'};
label.LWw4 = {'total length', 'wet weight', 'females, Bregana'}; bibkey.LWw4  = 'MaguKlob2011';
comment.LWw4 = 'Bregana stream, females';

% males, Mrzlak:
WwL_m1 = [1	20	5	11	0.6	3	4.5	2	7	2	4	12	8	23	12	5	8	11	5	7	9.5	23	14	28	8	20	17	25	30	44	20	40	17	10	0.25	14	4	16	29	11	16	6	25	19	6	17	9	7	6	9	11	15	8	20	3	7	6	31	16	13	23	5	7	7	11	29	37	20	24	8	10	14	15	19	10	20	14	19	13	5	8	6	8	7	7	10	11	16	14	18	37	32	24	8	10	5	12	17	12	4	27	7	9	11	12	17	10	13	11	31	21	38	14	16	15	9	27	31	41	20	26	39	6	5	6	5	4	4	20	29	20	9	8	9	7	6	5	6	25	48	24	18	25	13	21	17	22	10	8	5	15	8	6	5	3	20	3	4	7	12	13	4	15	3	4.5	5	5.5	9	3	8	7	5	5	5	5.5	17	6.5	7.5	11	21	1	2	1	4.5	7.5	22	9	6.5	7.5	3.5	3	4.5	23	25	16	6	5	14.5	9	12.5	4	7	13	11.5	25	7.5	3	3	17	11.5	4	5	6	7.5	3.5	11	4	1	1	1.5	14	4	5.5	3	1	11	10	7	6	5	5	3.5	3	13	14	2.5	2	1	4	6	6	34	32.5	5	5	9	2	2.5	4.5	6	5	8	7.5	34	5	6	7	8	18	1	7.5	29.5	34	8	10	11	6	10	27	8	12	4.5	18
    2.7	7.67	4.87	5.94	2.83	4.55	4.7	3.71	5.13	3.75	5.1	6.65	6.05	7.7	6.5	5.48	5.9	6.43	4.26	5.6	6	8	6.7	8.05	5.38	7.8	6.8	7.76	8	9.04	7.22	9.2	6.88	5.73	2	6.8	4.9	6.84	8.44	5.7	7.19	4.7	8.5	7.67	5.15	7.72	5.84	5.2	4.76	5.5	6.42	6.64	5.4	7.24	4.4	6.17	5.6	7.97	7.1	7.04	8	4.74	5.16	5.06	6.22	8.3	8.7	7.52	8.2	5.38	5.44	6.4	6.65	7.45	5.7	7.24	6.4	6.98	6.1	3.87	5	4.33	5.04	4.96	4.92	5.86	5.75	6.62	6.3	7.64	8.94	8.44	7.65	5.54	6.26	5.2	6.77	5.7	6.53	5.13	8.23	5.9	6	6.8	7	7.65	6.37	7.1	6.45	8.3	7.63	8.75	6.7	6.87	6.8	5.6	8.73	8.84	9	7.27	8.3	8.85	4.92	4.47	4.91	4.1	3.91	3.23	7.26	8	6.91	5.56	5.07	5.33	4.96	4.66	4.36	4.67	7.64	9.42	7.43	7	8.1	6.2	7.41	7	7.66	6.1	5.22	4.5	6.7	5.26	5	4.62	3	7.47	4.22	4.48	5.27	6.44	6.33	4.53	6.71	3.97	4.43	4.86	5.04	6	4.14	5.74	5.51	4.79	4.72	4.54	5.1	6.8	5.31	5.67	6.27	7.45	3.25	4.28	3.3	5.14	6.05	8.02	5.94	5.45	5.93	4.75	4.34	4.97	7.7	8.05	6.71	5.45	4.85	6.6	5.74	6.4	4.87	5.74	6.72	6.48	8.05	6	4.84	4.77	7.35	6.5	5.05	5.2	5.5	5.91	4.77	6.31	4.88	3.44	3.2	3.7	7.62	4.87	5.32	4.68	3.5	6.44	6.63	5.8	5.36	5.31	5.05	4.64	4.38	6.78	6.9	4.4	3.7	3.35	4.86	5.44	5.65	8.93	8.6	4.95	4.93	6.08	3.44	4.22	4.87	5.32	5.15	5.77	5.83	8.65	4.96	5.56	5.55	5.86	7.05	3.35	5.54	8.11	9.07	5.57	6.13	7	5.8	6.2	8.35	5.86	6.73	4.9	7.5
    ]';
data.LWw_m1 = [WwL_m1(:,2), WwL_m1(:,1)]; units.LWw_m1  =  {'cm', 'g'};  
label.LWw_m1 = {'total length', 'wet weight', 'males, Mrzlak'}; bibkey.LWw_m1  = 'MaguKlob2011';
comment.LWw_m1 = 'Mrzlak stream, males';
% males, Kraljevec:
WwL_m2 = [13	3	14	1.5	22	38	22	26	29	24	25	24	18	15	13	28	20	18	14	14	15	21	30.411	5.756	20	28	29	13	14	17	24	34	31	31	12	33	24	16	28	29	3	27	23	32	20	28	32	19	27	14	30	35	19	27	26	22	18	26	25	33	34	17	23	16	10	36	31	9	20	11	11	22	13	21	29	16	45	25	29	30	22	22	34	30	22	12	7	6	15	5	7	7	7	9	9	8	12	11	13	9	12	16	10	10	14	11	6	9	7	12	15	18	14	12	16	19	12	8	5	12	9	18	9	10	11	11	18	22	12	6	13	13	39	22	9	20	10	29	16	15	11	10	11	6	15	11	24	15	13	14	14	14	21	14	15	2	17	21	24	18	20	20	22	7	17	25	15	24	30	18	15	16	20	21	23	22	30	38	25	19	28	31	43	21	25.5	32	17	15	2	5	42	45	49	8.5	17	23	9	32	19	19	14	30	1.5	30	12.5	21	12	14	14	11.5	19.5	14	2	1.5	15	25	24	7	19	4	2	3.5	20	18	17	2.5	13.5	12.5	16	12	14	23	16	10	15	22	12	8	7	13.5	2.5	4.5	19	17.5	18	16	28	6	8	11	5	27	25	13	32
    6.9	4.5	6.9	3.8	7.62	8.78	7.67	8.1	8.16	8	7.74	8	7.22	6.97	6.53	8.14	7.37	6.9	6.87	6.6	6.8	7.57	8.57	5.5	7.4	7.83	8.55	6.3	6.6	7.37	7.77	8.7	8.04	8.4	6.6	8.56	7.84	7.15	8.1	8.64	4.14	8.07	7.7	8.7	7.55	7.26	8.8	7.2	8.45	6.16	8.22	8.62	7.2	7.8	7.77	7.3	7.1	8	7.86	8.5	9	7.4	7.95	6.94	5.88	8.8	8.37	5.88	8	6.3	6.18	7.5	6.22	7.3	8.32	7.1	9.37	8.04	7.7	8.75	7.28	7.56	8.2	9.3	7.8	6.48	5.35	4.8	6.82	5.08	5.62	5.6	5.67	6.1	5.6	5.57	6.65	6.05	6.64	5.87	6.6	7.1	6.33	5.73	6.32	6	4.6	5.43	4.82	6.46	6.4	6.6	6.5	5.63	6.45	6.4	5.9	5.65	4.56	6.47	6.35	7.26	5.66	6.13	6.26	6.34	7.02	7.67	6.15	5.15	6.27	6.13	8.9	7.46	5.54	7.22	6.2	8.2	6.87	6.55	6.77	6.46	6.94	5.38	6.6	6.43	8.5	6.52	6.74	6.4	6.48	6.33	7.27	6.47	6.87	4.3	6.96	7.63	7.83	7.17	7.61	7.44	7.5	5.33	7.16	7.95	6.8	7.6	8.55	7	6.6	7	7.53	7.84	7.74	7.71	8.31	9.04	7.72	7.4	8.13	8.26	9.12	7.47	8.12	8.4	7.16	6.84	3.88	5.4	9.22	8.9	9.3	6.1	6.98	7.61	5.75	8.45	7.27	7.4	7.04	8.23	3.98	8.67	6.43	7.86	6.9	7	6.48	6.8	7.74	6.62	3.84	3.64	7.2	7.74	7.72	5.76	7.36	4.8	3.7	4.54	7.5	7.5	7.2	3.85	6.45	6.44	6.96	6.35	6.95	7.5	7.1	6.28	6.8	7.62	6.51	5.7	5.57	6.57	3.82	4.7	7.17	7.2	6.98	7.01	8.17	5.37	5.77	6.33	5.34	8.18	7.8	6.63	8.29
    ]';
data.LWw_m2 = [WwL_m2(:,2), WwL_m2(:,1)]; units.LWw_m2  =  {'cm', 'g'};    
label.LWw_m2 = {'total length', 'wet weight', 'males, Kraljevec'}; bibkey.LWw_m2  = 'MaguKlob2011';
comment.LWw_m2 = 'Kraljevec stream, males';
% males, Sarni:
WwL_m3 = [2	4	4	19	15	13	10	16	27	27	20	2	6	13	17	36	21	24	33	24	18	5	9	6	28	27	22	21	5	20	14	11	20	10	6	6	5	6	12	9	17	27.5	21	6	5	8	9	9	20	18	29	8	9.5	22	5	13	35	17	46	12	6	24.5	15	30	8.5	28	9	19.5	6	5	25	12	6	35	3	5	8.5	8	9	16.5	12	8	12	5.5	6	20	9	8	14	15.5	4	4	15	21	20	13	8	9	3.5	12	14.5	26	19.5
    3.83	4.65	4.75	7.8	6.64	6.84	5.86	6.98	8.07	8.46	7.4	4.03	5.47	6.9	7.05	9.33	7.76	8.25	8.9	7.7	7.5	4.37	6.05	4.82	8.6	8.05	7.82	7.82	5.2	7.36	7	6.63	8.12	6.63	5.29	5.24	5.11	5.33	6.84	6.38	6.88	7.88	7.43	4.96	4.97	5.46	5.6	6.5	7.31	7.44	7.95	5.77	5.8	7.79	5.1	6.76	9.3	7.2	9.94	6.44	5.37	8.27	6.87	8.81	6	8.9	6.11	7.71	5.61	5	8.74	6.88	5.66	9.7	4.35	5.03	5.97	5.73	6.22	7.06	6.42	6	6.57	5.35	5.27	7.61	6.22	5.65	6.96	7.13	4.68	4.17	7.22	7.75	7.28	6.62	5.77	5.87	4.71	6.5	6.97	8.07	7.38
    ]';
data.LWw_m3 = [WwL_m3(:,2), WwL_m3(:,1)]; units.LWw_m3  =  {'cm', 'g'};
label.LWw_m3 = {'total length', 'wet weight', 'males, Sarni'}; bibkey.LWw_m3  = 'MaguKlob2011';
comment.LWw_m3 = 'Sarni stream, males';
% males, Bregana:
WwL_m4 = [11	10	34	34	26	21	21	19	17.5	2	12	9	7.5
    6.32	6.8	8.71	8.7	8.34	7.35	7.89	7.46	6.87	3.41	6.38	5.99	5.84
    ]';
data.LWw_m4 = [WwL_m4(:,2), WwL_m4(:,1)]; units.LWw_m4  =  {'cm', 'g'};
label.LWw_m4 = {'total length', 'wet weight', 'males, Bregana'}; bibkey.LWw_m4  = 'MaguKlob2011';
comment.LWw_m4 = 'Bregana stream, males';

% length-wet weight
% Berger 2018, males
data.LW_m = [ ... % total length (cm), wet weight (g)
    5.7	5.7	5.8	5.8	6.0	6.0	6.0	6.1	6.2	6.3	6.4	6.5	5.8	6.1	6.6	6.6	6.6	7.0	7.1	7.6	8.0	8.7	8.9	9.0	5.5	5.7	5.8	5.9	6.0	6.1	6.1	6.1	6.2	6.3	6.3	6.3	6.6	6.7	6.9	7.2	7.3	7.5	7.5	7.5	7.6	7.7	7.8	7.8	7.9	7.9	8.0	8.0	8.0	8.1	8.2	8.2	8.2	8.5	8.6	8.6	8.7	8.8	5.5	5.7	5.8	5.9	5.9	5.9	5.9	5.9	6.0	6.0	6.1	6.3	6.4	6.4	6.5	6.8	6.8	7.0	7.0	7.1	7.1	7.3	7.6	7.6	7.7	8.3	7.0	7.0	7.3	7.4	7.4	7.9	8.0	8.1	8.1	8.2	8.3	8.5	8.5	8.6	8.8	8.8	8.8	8.8	8.8	9.0	9.0	9.1	9.1	9.2	9.3	9.5	9.6	9.6	9.6	9.7	9.7	9.7	9.8	9.8	9.9	10.0	10.0	10.0	10.1	10.1	10.2	10.5	5.5	5.6	5.6	5.8	6.0	6.1	6.2	6.4	6.5	6.8	6.8	6.9	7.1	7.2	7.3	7.5	7.6	7.6	7.8	8.0	8.5	8.7	8.8	8.8	8.9	6.0	6.2	6.2	6.7	6.8	6.9	7.1	7.7	8.0	8.1	8.1	8.7	8.8	9.3	5.7	5.9	6.0	6.1	6.3	6.3	6.5	6.6	7.1	7.5	7.7	7.8	8.3	5.5	5.6	5.7	5.8	5.9	5.9	6.0	6.0	6.0	6.2	6.3	6.3	6.3	6.6	7.1	7.4	7.8	8.2	8.8	5.8	5.8	5.9	6.0	6.4	6.5	6.6	6.6	6.7	6.8	6.9	6.9	7.1	7.3	7.5	7.6	7.6	7.9	8.2	5.8	6.1	6.1	6.4	6.4	6.5	6.6	6.6	6.7	6.7	6.8	6.8	6.9	7.1	7.2	7.2	7.6	7.6	8.0	8.1	8.2	8.4	6.5	6.6	6.9	6.9	7.5	7.9	7.9	7.9	8.0	8.2	8.2	8.4	8.4	8.5	8.5	8.6	8.6	8.7	9.0	9.3	9.5	5.8	6.1	6.4	6.5	6.7	6.8	6.9	7.1	7.3	7.4	7.6	7.8	8.0	8.3	8.3	8.4	8.6	8.6	9.7	5.5	6.0	6.2	6.3	6.3	6.3	6.5	7.3	8.0	8.3
    6.3	6.8	7.4	8.1	8.3	8.2	8.0	8.9	8.7	9.7	10.2	8.3	7.5	8.7	9.8	10.7	9.8	13.7	14.6	20.5	21.0	30.6	27.9	33.3	6.4	7.1	6.5	7.6	8.2	9.2	9.9	9.0	8.6	10.4	10.6	9.7	11.4	12.4	13.6	16.5	16.9	17.9	17.0	15.9	21.4	21.0	22.2	28.6	19.2	23.3	23.4	18.5	26.6	28.4	25.7	27.1	24.4	30.5	29.0	30.7	32.0	29.3	6.7	7.0	6.7	8.7	8.1	8.8	8.6	7.9	8.7	8.0	8.1	10.1	11.1	10.1	11.8	12.5	14.3	14.4	14.8	15.3	15.8	18.5	19.4	18.0	20.3	25.9	14.9	12.9	15.3	16.8	15.9	20.6	23.8	22.0	26.4	22.9	24.6	29.3	23.1	31.1	32.3	25.1	29.9	32.1	27.3	33.2	34.8	35.4	34.9	35.6	35.9	39.3	36.9	40.7	40.1	43.6	42.2	37.8	44.9	42.3	47.6	45.2	44.6	46.3	47.6	50.4	46.8	51.5	6.2	6.9	7.2	7.9	8.3	9.0	9.5	10.4	10.0	13.3	13.8	14.1	17.3	17.3	17.7	20.1	19.5	20.8	22.8	23.7	26.9	32.5	31.4	33.9	34.1	8.5	8.7	9.5	10.6	12.6	13.8	15.3	20.4	24.8	24.0	24.0	30.4	27.6	41.3	6.6	8.1	8.3	9.2	10.5	10.2	10.3	12.2	17.0	18.4	17.3	18.6	27.2	6.6	7.7	7.6	7.6	7.7	7.2	8.3	7.9	8.0	9.9	10.6	9.0	10.7	12.2	16.8	18.3	21.6	25.8	34.7	7.2	6.4	7.7	9.0	10.9	10.4	10.7	11.4	12.0	11.1	14.0	14.0	15.7	15.7	18.9	17.3	20.1	20.1	25.1	7.0	8.8	9.9	10.3	8.5	10.1	12.0	11.9	11.4	13.3	12.7	12.9	13.8	13.9	18.1	17.1	17.6	16.3	23.1	24.2	25.3	31.8	11.6	11.6	12.6	12.9	17.4	23.3	21.8	23.1	24.4	27.6	23.1	27.6	22.3	36.6	27.0	28.5	32.7	30.2	37.8	38.3	47.9	7.5	8.8	10.2	11.0	13.1	14.5	14.0	14.0	16.2	18.0	18.0	22.0	22.0	28.0	21.2	27.9	32.1	30.9	41.0	6.9	8.3	9.5	9.3	9.7	9.0	10.1	17.9	23.4	25.7
    ]';
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight', 'males, Berger 2018'};
bibkey.LW_m = 'BergStam2018'; comment.LW_m = 'Unpublished data associated with the article';

% reproduction output:
% wet weight - total length -- number of eggs
% Mrzlak:
WwLN1 = [8	6	8	9	10	22	18	13	18	12	9	13	14	13	19	20	12	9	20	8	26	15	21	8	14	18	10	14	12	11	15	21	13	19	11	16	8	12	18
    6.1	5.8	6.18	6.1	6.3	8.4	7.66	7	7.6	6.8	5.4	6.6	6.9	6.57	7.66	7.61	6.44	6.3	8.4	NaN	8.74	7.13	8.1	NaN	7.2	7.6	6.14	7.4	6.7	6.31	NaN	7.84	6.32	7.43	7	7.45	5.6	7.03	7.6
    60	50	40	60	70	80	60	1	65	5	55	1	55	70	11	60	1	57	75	42	1	43	3	39	73	10	48	2	54	30	90	3	64	86	31	69	50	62	44
    ]'; index = ~isnan(WwLN1(:,2));
data.LN1 = [WwLN1(index,2), WwLN1(index,3)]; units.LN1  =  {'cm', '#'};    
label.LN1 = {'total length', 'number of eggs', 'Mrzlak'}; bibkey.LN1  = 'MaguKlob2005';
temp.LN1 = C2K(10.7);  units.temp.LN1 = 'K'; label.temp.LN1 = 'temperature';
comment.LN1 = 'Mrzlak stream, temp info in MaguErbe2002'; 
% Kraljevec:
WwLN2 = [17	20	23	19	12	17	16	14	25	15	23	18	19	31	19	20	19	23	16	17	23	13	19	23	25	14	18	25	20	18	18	21	24	12	24	20	22	20	22	14.5	22.5	24	23	16	22	21	16.5	25
    7.73	8.2	8.1	7.55	6.6	7.3	7.27	6.98	8.7	6.65	8.2	7.66	7.65	9.29	7.77	7.9	7.7	8.5	6.93	7.5	8.33	6.34	7.38	7.5	8.6	7.06	7.4	7.93	7.57	6.9	6.93	7.88	9.2	6.6	8.6	8.13	7.65	8.3	8.24	7.07	8.32	8.25	8	NaN	NaN	7.98	7.32	8.52
    70	60	70	8	50	53	55	60	70	60	70	70	75	3	65	75	52	13	65	55	71	53	77	60	65	10	38	60	3	43	65	5	1	2	60	74	81	43	104	50	52	75	80	60	62	80	11	88
    ]'; index = ~isnan(WwLN2(:,2));
data.LN2 = [WwLN2(index,2), WwLN2(index,3)]; units.LN2  =  {'cm', '#'};    
label.LN2 = {'total length', 'number of eggs', 'Kraljevec'}; bibkey.LN2  = 'MaguKlob2005';
temp.LN2 = C2K(9.8);  units.temp.LN2 = 'K'; label.temp.LN2 = 'temperature';
comment.LN2 = 'Kraljevec stream, , temp info in MaguErbe2002'; 
% Sarni:
WwLN3 = [14	14	10	18	20	16
    7.17	6.72	6.55	7.5	7.37	7.47
    70	50	60	100	94	4
    ]'; index = ~isnan(WwLN3(:,2));
data.LN3 = [WwLN3(index,2), WwLN3(index,3)]; units.LN3  =  {'cm', '#'};    
label.LN3 = {'total length', 'number of eggs', 'Sarni'}; bibkey.LN3  = 'MaguKlob2005';
temp.LN3 = C2K(9.8);  units.temp.LN3 = 'K'; label.temp.LN3 = 'temperature';
comment.LN3 = 'Sarni stream, , temp info in MaguErbe2002'; 


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
set1 = {'LWw1', 'LWw2', 'LWw3', 'LWw4'}; subtitle1 = {'Females from 4 locations, MaguKlob2011'};
set2 = {'LWw_m1', 'LWw_m2', 'LWw_m3', 'LWw_m4', 'LW_m'}; subtitle2 = {'Males from 4 locations MaguKlob2011, and BergStam2018'};
set3 = {'LN1', 'LN2', 'LN3'}; subtitle3 = {'Females from 3 locations, MaguKlob2005'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males have larger claws than females, but females have a noticeably larger abdomen (Wiki); males and females differ in z and E_Hp';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = ['A freshwater crayfish species native to Central and Southeast Europe. Typical habitat are small fast streams with rocky (stone) bottom (esp in Croatia), but can be found in rivers and high altitude cold lakes. ', ...
    'Summer water temperature optimum is between 14C and 18C, but can tolerate temperature between 8C and 23 C.'];
metaData.bibkey.F1 = {'EoL'};
F2 = 'The stone crayfish \textit{Austropotamobius torrentium} (Schrank, 1803) is the smallest species of freshwater crayfish in the family Astacidae; Sexual dimorphism present between males and females'; 
metaData.bibkey.F2 = {'VlacVald2015', 'MaguMarn2017'};
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7RCBB'; % Cat of Life
metaData.links.id_ITIS = '1133570'; % ITIS
metaData.links.id_EoL = '4261116'; % Ency of Life
metaData.links.id_Wiki = 'Austropotamobius_torrentium'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '747445'; % Taxonomicon
metaData.links.id_WoRMS = '885720'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
    'title = {Wikipedia},' ...
    'note = {Last accessed 2020-08-25},' ...
    'howpublished = {\url{http://en.wikipedia.org/wiki/Austropotamobius_torrentium}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib =  [...
    'title = {Encyclopedia of Life},' ...
    'note = {Last accessed 2020-08-25},' ...
    'howpublished = {\url{https://eol.org/pages/4261116/articles}}'];
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
bibkey = 'BergStam2018'; type = 'Article'; bib = [ ...
    ' title = {Integrating genetics and morphometrics in species conservation -- A case study on the stone crayfish, \emph{Austropotamobius torrentium}},'...
    ' author = {Berger, Christian and Stambuk, Anamaria and Maguire, Ivana and Weiss, Steven and F{\''''u}reder, Leopold},'...
    'journal = {Limnologica},'...
    'volume = {69},' ...
    'pages = {28--38},' ...
    'year = {2018},'...
    'note = {Unpublished data associated with the article} ,'...
    'doi = {10.1016/j.limno.2017.11.002}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DakiMagu2016'; type = 'Article'; bib = [ ...
  'title = {Year cycle and morphometrical characteristics of \textit{Austropotamobius torrentium} from two karstic rivers in {C}roatia},'...
  'author = {Dakic, Leopoldina and Maguire, Ivana},'...
  'journal = {Natura Croatica},'...
  'volume = {25},'...
  'number = {1},'...
  'pages = {87},'...
  'year = {2016},'...
  'doi = {10.20302/NC.2016.25.5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hold2002'; type = 'Book'; bib = [ ...
    'author = {Holdich, David Malcolm and others}, ' ...
    'year = {2002}, ' ...
    'editor = {David M Holdich }, '...
    'title  = {Biology of freshwater crayfish}, ' ...
    'isbn = {978-0-632-05431-2}, '...
    'publisher = {Blackwell Science Oxford}, ' ...
    'pages = {720 Pages}, ' ...
    'howpublished = {\url{https://www.wiley.com/en-us/Biology+of+Freshwater+Crayfish-p-9780632054312}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HubeSchu2005'; type = 'Article'; bib = [ ...
  'title = {Distribution and reproductive biology of \textit{Austropotamobius torrentium} in {B}avaria and documentation of a contact zone with the alien crayfish \textit{Pacifastacus leniusculus}},'...
  'author = {Huber, MGJ and Schubart, CD},'...
  'journal = {Bulletin Francais de la Pche et de la Pisciculture},'...
  'number = {376-377},'...
  'pages = {759--776},'...
  'year = {2005},'...
  'doi = {10.1051/kmae:2005031}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaguErbe2002'; type = 'Article'; bib = [ ...
    'title = {Year cycle of \textit{Austropotamobius torrentium} (Schrank) in streams on {M}edvednica {M}ountain ({C}roatia).},'...
    'author = {Maguire, Ivana and Erben, Radovan and Klobucar, GIV and Lajtner, Jasna},'...
    'journal = {Bulletin Francais de la Peche et de la Pisciculture},'...
    'volume = {367},'...
    'pages = {943--957},'...
    'year = {2002},' ...
    'doi = {10.1051/kmae:2002077}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaguKlob2005'; type = 'Article'; bib = [ ...  %
    'title = {The relationship between female size and egg size in the freshwater crayfish \textit{Austropotamobius torrentium}},'...
    'author = {Maguire, Ivana and Klobucar, GIV and Erben, R},'...
    'journal = {Bulletin Francais de la Peche et de la Pisciculture},'...
    'volume = {376-377},'...
    'pages = {777--785},'...
    'year = {2005},'...
    'doi = {10.1051/kmae:2005032}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaguKlob2011'; type = 'Article'; bib = [ ...  % 2011 paper za LWw males i females
    'title = {Size structure, maturity size, growth and condition index of stone crayfish (\textit{Austropotamobius torrentium}) in {N}orth-{W}est {C}roatia},'...
    'author = {Maguire, Ivana and Klobucar, Goran},'...
    'journal = {Knowledge and Management of Aquatic Ecosystems},'...
    'volume = {401},'...
    'pages = {12},'...
    'year = {2011},'...
    'doi = {10.1051/kmae/2011026}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaguMarn2017'; type = 'Article'; bib = [ ...   
  'title = {Morphological evidence for hidden diversity in the threatened stone crayfish \textit{Austropotamobius torrentium} ({S}chrank, 1803)({D}ecapoda: {A}stacoidea: {A}stacidae) in {C}roatia},'...
  'author = {Maguire, Ivana and Marn, Nina and Klobucar, Goran},'...
  'journal = {The Journal of Crustacean Biology},'...
  'volume = {37},'...
  'number = {1},'...
  'pages = {7--15},'...
  'year = {2017},'...
  'doi = {10.1093/jcbiol/ruw012}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrGarc2006'; type = 'Article'; bib = [ ...
'author = {Rodriguez-Gonzalez, Hervey and Garcia-Ulloa, Manuel and Hernandez-Llamas, Alfredo and Villarreal, Humberto}, ' ...
'year = {2006}, ' ...
'title = {Effect of dietary protein level on spawning and egg quality of redclaw crayfish \textit{Cherax quadricarinatus}},' ...
'journal = {Aquaculture}, ' ...
'volume = {257}, ' ...
'pages = {412--419}, ' ...
'doi = {10.1016/j.aquaculture.2006.01.020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'VlacVald2015'; type = 'Article'; bib = [ ...  % max size, sex dimorphism
  'title = {Morphometry of the stone crayfish (\textit{Austropotamobius torrentium}) in the {C}zech {R}epublic: allometry and sexual dimorphism},'...
  'author = {Vlach, P and Valdmanova, L},'...
  'journal = {Knowledge and Management of Aquatic Ecosystems},'...
  'volume = {416},'...
  'pages = {16},'...
  'year = {2015},'...
  'doi = {10.1051/kmae/2015012}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
