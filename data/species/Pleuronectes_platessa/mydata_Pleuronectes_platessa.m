function [data, auxData, metaData, txtData, weights] = mydata_Pleuronectes_platessa 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Pleuronectes_platessa'; 
metaData.species_en = 'Plaice'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'; 't-N'; 'L-Ww'; 'L-N'; 'Ww-N';  'Ww-pX_T'; 'Ww-JO_T'; 'T-ah'; 'T-dL'}; 

metaData.COMPLETE = 3.2; % using criteria of LikaKear2011

metaData.author   = {'Henk van der Veer';  'Vania Freitas'};    
metaData.date_subm = [2010 10 15];              
metaData.email    = {'Henk.van.der.Veer@nioz.nl'};            
metaData.address  = {'NIOZ, Texel'};   

metaData.author_mod_1   = {'Dina Lika'; 'Bas Kooijman'};    
metaData.date_mod_1 = [2013 08 28];              
metaData.email_mod_1    = {'lika@biology.uoc.gr'};            
metaData.address_mod_1  = {'Crete University'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 10];

%% set data
% zero-variate data

data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'SkjaFinn2003';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'counted as complete yolk resorption';
data.ap = 1735;     units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'RijnIbel1989';
  temp.ap = C2K(10); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'age at 50% maturity of 4.5 yr for North Sea';
data.am = 30 * 365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'Whee1978';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.765;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'SkjaFinn2003';  
  comment.Lb = 'Size of a larvae after complete yolk resorption';
data.Lp  = 34;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'RijnIbel1989'; 
  comment.Lp = 'size at 50% maturity (24-37 cm)';
data.Li  = 78;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'RijnIbel1989';

data.Wwb = 1.6e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'SkjaFinn2003';
data.Wwp = 450;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'RijnIbel1989';
data.Wwi = 5000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'RijnIbel1989';

data.R68  = 2098;   units.R68  = '#/d'; label.R68  = 'reprod rate at 68 cm';  bibkey.R68  = 'KennGeff2007';   
temp.R68 = C2K(10); units.temp.R68 = 'K'; label.temp.R68 = 'temperature';
 
% uni-variate data

% Ingestion rates (kJ/d) as function wet Weight (g) for different temperatures (Fonds et al. 1992), food provided in excess (f=1) 
TpXW = [ ... % ?C, kJ/d, g 
2	0.59	5.00	;
2	1.53	20.00	;
2	2.24	35.00	;
2	2.86	50.00	;
2	3.42	65.00	;
2	3.95	80.00	;
6	0.71	5	;
6	2.55	20	;
6	4.27	35	;
6	5.93	50	;
6	7.55	65	;
6	9.14	80	;
6	11.73	105	;
10	1.96	5	;
10	5.64	20	;
10	8.63	35	;
10	11.32	50	;
10	13.82	65	;
10	16.19	80	;
10	19.91	105	;
10	26.11	150	;
10	38.52	250	;
14	2.32	5	;
14	6.21	20	;
14	9.24	35	;
14	11.91	50	;
14	14.35	65	;
18	3.36	5	;
18	8.62	20	;
18	12.60	35	;
18	16.05	50	;
18	19.18	65	;
18	22.09	80	;
18	26.57	105	;
22	3.12	5	;
22	8.25	20]	;
TpXW(:,2) = TpXW(:,2) * 1000; % convert kJ/d to J/d
data.WpX_2  = TpXW( 1: 6,[3 2]);
units.WpX_2  = {'g', 'J/d'};  label.WpX_2 = {'wet weight', 'ingestion rate', '2 C'};  
temp.WpX_2   = C2K(2); units.temp.WpX_2 = 'K'; label.temp.WpX_2 = 'temperature';
bibkey.WpX_2 = 'FondCron1992';
%
data.WpX_6  = TpXW( 7:13,[3 2]);
units.WpX_6  = {'g', 'J/d'};  label.WpX_6 = {'wet weight', 'ingestion rate', '6 C'};  
temp.WpX_6   = C2K(6); units.temp.WpX_6 = 'K'; label.temp.WpX_6 = 'temperature';
bibkey.WpX_6 = 'FondCron1992';
%
data.WpX_10 = TpXW(14:22,[3 2]);
units.WpX_10  = {'g', 'J/d'};  label.WpX_10 = {'wet weight', 'ingestion rate', '10 C'};  
temp.WpX_10   = C2K(10); units.temp.WpX_10 = 'K'; label.temp.WpX_10 = 'temperature';
bibkey.WpX_10 = 'FondCron1992';
%
data.WpX_14 = TpXW(23:27,[3 2]);
units.WpX_14  = {'g', 'J/d'};  label.WpX_14 = {'wet weight', 'ingestion rate', '14 C'};  
temp.WpX_14   = C2K(14); units.temp.WpX_14 = 'K'; label.temp.WpX_14 = 'temperature';
bibkey.WpX_14 = 'FondCron1992';
%
data.WpX_18 = TpXW(28:34,[3 2]);
units.WpX_18  = {'g', 'J/d'};  label.WpX_18 = {'wet weight', 'ingestion rate', '18 C'};  
temp.WpX_18   = C2K(18); units.temp.WpX_18 = 'K'; label.temp.WpX_18 = 'temperature';
bibkey.WpX_18 = 'FondCron1992';
%
data.WpX_22 = TpXW(35:36,[3 2]);
units.WpX_22  = {'g', 'J/d'};  label.WpX_22 = {'wet weight', 'ingestion rate', '22 C'};  
temp.WpX_22   = C2K(22); units.temp.WpX_22 = 'K'; label.temp.WpX_22 = 'temperature';
bibkey.WpX_22 = 'FondCron1992';

 
% Respiration (mgO2/d) as function of weight at various temperatures
% (Fonds et al. 1992, Table 1, NOT the original values!), f=1
TJOW_1 = [ ... % ?C, mgO2/d, g 
2	10.83	5	;
2	34.12	20	;
2	54.23	35	;
2	72.86	50	;
2	90.54	65	;
2	107.53	80	;
6	16.13	5	;
6	52.20	20	;
6	83.86	35	;
6	113.44	50	;
6	141.67	65	;
6	168.91	80	;
6	212.66	105	;
10	27.05	5	;
10	81.08	20	;
10	126.31	35	;
10	167.54	50	;
10	206.23	65	;
10	243.09	80	;
10	301.51	105	;
10	399.93	150	;
10	599.36	250	;
14	36.60	5	;
14	102.38	20	;
14	155.08	35	;
14	202.06	50	;
14	245.49	65	;
14	286.38	80	;
14	325.33	95	;
14	362.72	110	;
18	46.48	5	;
18	141.69	20	;
18	222.20	35	;
18	295.99	50	;
18	365.50	65	;
18	431.91	80	;
18	537.45	105	;
22	59.27	5	;
22	172.59	20	;
22	265.70	35	;
22	349.80	50	;
22	428.22	65	;
22	502.56	80	;
22	573.77	95]	;
data.WJO1_2  = TJOW_1( 1: 6,[3 2]);
units.WJO1_2  = {'g', 'mgO2/d'};  label.WJO1_2 = {'wet weight', 'O2 consumption', '2 C'};  
temp.WJO1_2   = C2K(2); units.temp.WJO1_2 = 'K'; label.temp.WJO1_2 = 'temperature';
bibkey.WJO1_2 = 'FondCron1992';
%
data.WJO1_6  = TJOW_1( 7:13,[3 2]);
units.WJO1_6  = {'g', 'mgO2/d'};  label.WJO1_6 = {'wet weight', 'O2 consumption', '6 C'};  
temp.WJO1_6   = C2K(6); units.temp.WJO1_6 = 'K'; label.temp.WJO1_6 = 'temperature';
bibkey.WJO1_6 = 'FondCron1992';
%
data.WJO1_10 = TJOW_1(14:22,[3 2]);
units.WJO1_10  = {'g', 'mgO2/d'};  label.WJO1_10 = {'wet weight', 'O2 consumption', '10 C'};  
temp.WJO1_10   = C2K(10); units.temp.WJO1_10 = 'K'; label.temp.WJO1_10 = 'temperature';
bibkey.WJO1_10 = 'FondCron1992';
%
data.WJO1_14 = TJOW_1(23:30,[3 2]);
units.WJO1_14  = {'g', 'mgO2/d'};  label.WJO1_14 = {'wet weight', 'O2 consumption', '14 C'};  
temp.WJO1_14   = C2K(14); units.temp.WJO1_14 = 'K'; label.temp.WJO1_14 = 'temperature';
bibkey.WJO1_14 = 'FondCron1992';
%
data.WJO1_18 = TJOW_1(31:37,[3 2]);
units.WJO1_18  = {'g', 'mgO2/d'};  label.WJO1_18 = {'wet weight', 'O2 consumption', '18 C'};  
temp.WJO1_18   = C2K(18); units.temp.WJO1_18 = 'K'; label.temp.WJO1_18 = 'temperature';
bibkey.WJO1_18 = 'FondCron1992';
%
data.WJO1_22 = TJOW_1(38:44,[3 2]);
units.WJO1_22  = {'g', 'mgO2/d'};  label.WJO1_22 = {'wet weight', 'O2 consumption', '22 C'};  
temp.WJO1_22   = C2K(22); units.temp.WJO1_22 = 'K'; label.temp.WJO1_22 = 'temperature';
bibkey.WJO1_22 = 'FondCron1992';

% Respiration (mgO2/d) as function of weight at various temperatures (Fonds et al. 1992, Table 1, NOT the original values!!), f=0 fasting animals 
TJOW_0 = [ ... % C, mgO2/d, g 
2	6.16	5	;
2	18.42	20	;
2	28.67	35	;
2	38.00	50	;
2	46.75	65	;
2	55.08	80	;
6	9.34	5	;
6	27.32	20	;
6	42.12	35	;
6	55.52	50	;
6	68.02	65	;
6	79.88	80	;
6	98.59	105	;
10	11.72	5	;
10	35.49	20	;
10	55.50	35	;
10	73.79	50	;
10	91.00	65	;
10	107.43	80	;
10	133.50	105	;
10	177.52	150	;
10	266.99	250	;
14	16.22	5	;
14	47.96	20	;
14	74.30	35	;
14	98.20	50	;
14	120.56	65	;
14	141.82	80	;
14	162.22	95	;
14	181.92	110	;
18	18.97	5	;
18	55.79	20	;
18	86.22	35	;
18	113.79	50	;
18	139.56	65	;
18	164.03	80	;
18	202.68	105	;
22	26.45	5	;
22	78.41	20	;
22	121.59	35	;
22	160.83	50	;
22	197.56	65	;
22	232.48	80	;
22	266.01	95]	;
data.WJO0_2  = TJOW_0( 1: 6,[3 2]);
units.WJO0_2  = {'g', 'mgO2/d'};  label.WJO0_2 = {'wet weight', 'O2 consumption', '2 C'};  
temp.WJO0_2   = C2K(2); units.temp.WJO0_2 = 'K'; label.temp.WJO0_2 = 'temperature';
bibkey.WJO0_2 = 'FondCron1992';
%
data.WJO0_6  = TJOW_0( 7:13,[3 2]);
units.WJO0_6  = {'g', 'mgO2/d'};  label.WJO0_6 = {'wet weight', 'O2 consumption', '6 C'};  
temp.WJO0_6   = C2K(6); units.temp.WJO0_6 = 'K'; label.temp.WJO0_6 = 'temperature';
bibkey.WJO0_6 = 'FondCron1992';
%
data.WJO0_10 = TJOW_0(14:22,[3 2]);
units.WJO0_10  = {'g', 'mgO2/d'};  label.WJO0_10 = {'wet weight', 'O2 consumption', '10 C'};  
temp.WJO0_10   = C2K(10); units.temp.WJO0_10 = 'K'; label.temp.WJO0_10 = 'temperature';
bibkey.WJO0_10 = 'FondCron1992';
%
data.WJO0_14 = TJOW_0(23:30,[3 2]);
units.WJO0_14  = {'g', 'mgO2/d'};  label.WJO0_14 = {'wet weight', 'O2 consumption', '14 C'};  
temp.WJO0_14   = C2K(14); units.temp.WJO0_14 = 'K'; label.temp.WJO0_14 = 'temperature';
bibkey.WJO0_14 = 'FondCron1992';
%
data.WJO0_18 = TJOW_0(31:37,[3 2]);
units.WJO0_18  = {'g', 'mgO2/d'};  label.WJO0_18 = {'wet weight', 'O2 consumption', '18 C'};  
temp.WJO0_18   = C2K(18); units.temp.WJO0_18 = 'K'; label.temp.WJO0_18 = 'temperature';
bibkey.WJO0_18 = 'FondCron1992';
%
data.WJO0_22 = TJOW_0(38:44,[3 2]);
units.WJO0_22  = {'g', 'mgO2/d'};  label.WJO0_22 = {'wet weight', 'O2 consumption', '22 C'};  
temp.WJO0_22   = C2K(22); units.temp.WJO0_22 = 'K'; label.temp.WJO0_22 = 'temperature';
bibkey.WJO0_22 = 'FondCron1992';

% LW data from Deniel 1981
% Lenght-weight relationships for plaice from France (tail to snout),somatic wet mass, Females
data.LW_f = [ ... % cm, g
33.50	486.4	;
37.50	600.1	;
38.50	684.6	;
38.50	716.5	;
40.50	738.3	;
41.50	905.9	;
43.00	1012.3	;
45.00	1104.1	;
48.50	1218.8	;
50.00	1322.3	;
51.50	1717.6	;
52.00	1827.6	;
54.00	1624.9	;
55.00	1768.7	;
56.50	2067.2	;
68.00	3417]	;
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'female wet weight'};  
bibkey.LW_f = 'Deni1981';

% Length-at-age from France (Deniel 1981), 
%  length (cm), age (days, time from birth), 
Lt = [... % cm, d
10.70	275	;
22.80	640	;
37.50	1005	;
42.90	1370	;
47.10	1735	;
51.90	2100]	;
data.tL = Lt(:,[2 1]);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(10); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Deni1981';

%  Fecundity (number eggs) as function of body length (cm), wet weight(g) and age(d) from France (Deniel 1981)
NLWa =[... % # eggs, cm, g, d
156100	33.50	538	    1077	;
169600	37.50	643	    1077	;
156200	38.50	737	    1077	;
184600	38.50	784	    1077	;
167000	40.50	825	    1442	;
240600	41.50	1007	1442	;
239400	43.00	1179	1807	;
288300	45.00	1275	1807	;
354400	48.50	1460	2172	;
271000	50.00	1580	2172	;
481300	51.50	2165	1807	;
634500	52.00	2370	2537	;
325200	54.00	1865	2537	;
452900	55.00	2115	2537	;
604500	56.50	2390	3267	;
765900	68.00	4000	5822]	;
data.LN = NLWa(:,[2 1]); 
units.LN  = {'cm', '#'};  label.LN = {'total length', 'number of eggs'};  
temp.LN   = C2K(10); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Deni1981';
%
data.WN = NLWa(:,[3 1]); 
units.WN  = {'g', '#'};  label.WN = {'wet weight', 'number of eggs'};  
temp.WN   = C2K(10); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Deni1981';
%
data.aN = NLWa(:,[4 1]); 
units.aN  = {'d', '#'};  label.aN = {'age', 'number of eggs'};  
temp.aN   = C2K(10); units.temp.aN = 'K'; label.temp.aN = 'temperature';
bibkey.aN = 'Deni1981';

% Growth rates (mm/d) in relation to temperature at maximum food
% conditions (Glazenburg 1983 unpublished data), fish with size range: 1.3-4 cm
data.TdL1 = [...% C, mm/d
2	0.14	;
6	0.32	;
10	0.49	;
14	0.66	;
18	0.84	;
22	1.01]	;
data.TdL1(:,2) = data.TdL1(:,2)/10;  % convert mm to cm 
units.TdL1  = {'C', 'cm/d'};  label.TdL1 = {'temperature', 'growth rate', '1.3-4 cm'};  
bibkey.TdL1 = 'Glaz1983';
comment.TdL1 = 'fish at 1.3-4 cm';
 
% Growth rates (mm/d) in relation to temperature at maximum food conditions (Fonds et al. 1992), fish with size range: 5-15 cm
data.TdL2 = [...% C, mm/d
2	0.04	;
6	0.20	;
10	0.42	;
14	0.67	;
18	0.83	;
22	0.72]	;
data.TdL2(:,2) = data.TdL2(:,2)/10;  % convert mm to cm 
units.TdL2  = {'C', 'cm/d'};  label.TdL2 = {'temperature', 'growth rate', '5-15 cm'};  
bibkey.TdL2 = 'FondCron1992';
comment.TdL2 = 'fish at 5-15 cm';
 
% Egg development(stage 1-5) at various temperatures (Bolle et al. 2009)
data.Tah = [...% C, d
5	25	;
6	21	;
7	18	;
8	16	;
10	12	;
11	10	;
12	9]	;
units.Tah  = {'C', 'd'};  label.Tah = {'temperature', 'age at hatch'};  
bibkey.Tah = 'BollDick2009';

% % Maternal effect on egg size (average egg dry weight as a function of female weight Wet?) (Kennedy et al. 2007)
% data.WW = [...% g, mg
% 150.2	0.21	;
% 160.9	0.23	;
% 182.4	0.23	;
% 182.4	0.27	;
% 257.5	0.26	;
% 343.3	0.27	;
% 364.8	0.27	;
% 343.3	0.28	;
% 397.0	0.29	;
% 332.6	0.32	;
% 332.6	0.32	;
% 482.8	0.29	;
% 461.4	0.32	;
% 622.3	0.29	;
% 708.2	0.28	;
% 912.0	0.26	;
% 869.1	0.27	;
% 890.6	0.30	;
% 944.2	0.33	;
% 1030.0	0.30	;
% 1588.0	0.34	;
% 1598.7	0.31	;
% 2199.6	0.33]	;
% data.WW(:,2)= data.WW(:,2)/ 1000; % convert mg to g
% units.WW  = {'g', 'g'};  label.WW = {'female wet weight', 'egg dry weight'};  
% bibkey.WW = 'KennGeff2007';
% comment.WW = 'Bas Kooijman: not sure that these female weights reflect nutritional status, probably water content'; 

%%Larval size as a function of development time (at 7?C) (Skjaerven et al. 2003, Fig.2)
% Age (in DPF days post-fertilization) vs larvae size (mm)  
data.aL = [...% DPF, mm
13.3	5.529282255;
15.0	6.048840827;
17.0	6.667157063;
19.0	7.38500246;
21.0	7.481754193;
24.0	7.7761757;
26.0	7.69917553;
28.0	7.647019109];
data.aL(:,2) = data.aL(:,2)/ 10;  % convert mm to cm 
units.aL  = {'d', 'cm'};  label.aL = {'age', 'length'};  
temp.aL   = C2K(7); units.temp.aL = 'K'; label.temp.aL = 'temperature';
bibkey.aL = 'SkjaFinn2003';
comment.aL = 'Fig.2, not the same larvae as aW data'; 

% Larval Dry mass (without yolk) as a function of development time (at 7?C) (Skjaerven etal. 2003, Fig.3, not the same larvae as in previous data)
% Age (in DPF days post-fertilization) vs larvae Dry mass (microg) 
data.aW = [...% DPF, microg
13.3	70.0020871;
15.0	80.00485687;
17.0	92.87164742;
19.0	105.7726188;
21.0	118.656484;
24.0	131.437753;
26.0	145.8091957;
28.0	138.2515796];
units.aW   = {'d', 'mug'};  label.aW = {'age', 'dry weight'};  
temp.aW    = C2K(7);  units.temp.aW = 'K'; label.temp.aW = 'temperature';
bibkey.aW = 'SkjaFinn2003';
comment.aW = 'Fig.3, not the same larvae as aL data'; 
  
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
set1 = {'WpX_22','WpX_18','WpX_14','WpX_10','WpX_6','WpX_2'}; subtitle1 = {'FondCron1992 data at 22, 18, 14, 10, 6, 2 C'};
set2 = {'WJO1_22','WJO1_18','WJO1_14','WJO1_10','WJO1_6','WJO1_2'}; subtitle2 = {'FondCron1992 data at 22, 18, 14, 10, 6, 2 C, adundant food'};
set3 = {'WJO0_22','WJO0_18','WJO0_14','WJO0_10','WJO0_6','WJO0_2'}; subtitle3 = {'FondCron1992 data at 22, 18, 14, 10, 6, 2 C, no food'};
set4 = {'LW_f'}; subtitle4 = {'Deni1981 data for females'};
set5 = {'TdL2','TdL1'}; subtitle5 = {'Glaz1983 data for 1.3-4 cm, 5-15 cm'};
metaData.grp.sets = {set1,set2,set3,set4,set5};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5};

%% Links
metaData.links.id_CoL = '4KBX3'; % Cat of Life
metaData.links.id_ITIS = '172902'; % ITIS
metaData.links.id_EoL = '46570118'; % Ency of Life
metaData.links.id_Wiki = 'Pleuronectes_platessa'; % Wikipedia
metaData.links.id_ADW = 'Pleuronectes_platessa'; % ADW
metaData.links.id_Taxo = '46963'; % Taxonomicon
metaData.links.id_WoRMS = '127143'; % WoRMS
metaData.links.id_fishbase = 'Pleuronectes-platessa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleuronectes_platessa}}';
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
bibkey = 'RijnIbel1989'; type = 'Article'; bib = [ ... 
'author = {Rijnsdorp, A. D. and Ibelings, B.}, ' ... 
'year = {1989}, ' ...
'title = {Sexual dimorphism in the energetics of reproduction and growth of {N}orth {S}ea plaice, \emph{Pleuronectes platessa} {L}.}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {35}, ' ...
'doi = {10.1111/j.1095-8649.1989.tb02992.x}, '...
'pages = {401-415}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SkjaFinn2003'; type = 'Incollection'; bib = [ ... 
'author = {Skj{\ae}rven, K. H. and Finn, R. N. and Kryvi, H. and Fyhn, H. J.}, ' ... 
'year = {2003}, ' ...
'title = {Yolk resorption in developing plaice (\emph{Pleuronectes platessa}}, ' ...
'journal = {Proc. 26 Annual Larval Fish Conference.}, ' ...
'booktitle = {The Big Fish Bang.}, ' ...
'publisher = {Institute of Marine Research, Bergen Norway}, ' ...
'editor = {Browman, H. I. and Skifsrevik, A. B.}, '...
'pages = {193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'Whee1978'; type = 'Book'; bib = [ ... 
'author = {Wheeler, A.}, ' ... 
'year = {1978}, ' ...
'title = {Key to the  fishes  of  {N}orthern  {E}urope.}, ' ...
'publisher = {Frederick Warne Ltd.}, ' ...
'address = {London, UK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'Russ1976'; type = 'Book'; bib = [ ... 
'author = {Russel, F. S.}, ' ... 
'year = {1976}, ' ...
'title = {The eggs and planktonic stages of {B}ritish marine fishes.}, ' ...
'publisher = {Academic Press}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'KennGeff2007'; type = 'Article'; bib = [ ... 
'author = {Kennedy, J. and Geffen, A. J. and Nash, R. D. M.}, ' ... 
'year = {2007}, ' ...
'title = {Maternal influences on egg and larval characteristics of plaice (\emph{Pleuronectes platessa} {L}.)}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {58}, ' ...
'pages = {65--77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'FondCron1992'; type = 'Article'; bib = [ ... 
'author = {Fonds, M. and Cronie, R. and Vethaak, A. D. and Puyl, P. van der}, ' ... 
'year = {1992}, ' ...
'title = {Metabolism, food consumption and growth of plaice (\emph{Pleuronectes  platessa}) and flounder (\emph{Platichthys flesus})  in  relation  to  fish  size  and  temperature}, ' ...
'journal = {Neth.   J.   Sea   Res.}, ' ...
'volume = {29}, ' ...
'doi = {10.1016/007}, '...
'pages = {127-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'Deni1981'; type = 'Phdthesis'; bib = [ ... 
'author = {Deniel, C.}, ' ... 
'year = {1981}, ' ...
'title = {Les poisons plats (T\''{e}l\''{e}ost\''{e}ens-{P}leuronectiformes) en {B}aie de {D}ouarnenez}, ' ...
'school = {Universit\''{e} de Bretagne Occidentale}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'BollDick2009'; type = 'Article'; bib = [ ... 
'author = {Bolle, L. J. and Dickey-Collas, M. and van Beek, J. K. L. and Erftemeijer, P. L. A. and Witte, J. IJ. and van der Veer, H. W. and Rijnsdorp, A. D.}, ' ... 
'year = {2009}, ' ...
'title = {Variability in transport of fish eggs and larvae. III. {E}ffects of hydro-dynamics and larval behaviour on recruitment in plaice}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {390}, ' ...
'pages = {195-211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Glaz1983'; type = 'Techreport'; bib = [ ...
'author = {Glazenburg, B.}, ' ... 
'year = {1983}, ' ...
'title = {Een experimenteel onderzoek naar de groei van 0-groep schol en bot in relatie tot de watertemperatuur}, ' ...
'institution = {NIOZ, Texel}, ' ...
'note = {unpublished data, internal report}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
