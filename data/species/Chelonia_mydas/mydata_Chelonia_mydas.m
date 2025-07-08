 function [data, auxData, metaData, txtData, weights] = mydata_Chelonia_mydas 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Cheloniidae';
metaData.species    = 'Chelonia_mydas'; % 
metaData.species_en = 'Green turtle'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0bTd', 'biMcp', 'biMr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'piHa'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwh'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'};  
metaData.data_1     = {'T-ah'; 't-WwYe_T'; 't-WwVe_T'; 't-JOe_T'; 't-JCe_T'; 'L0-Lt'; 'L-Ww'};   

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Jessica Stubbs'};           
metaData.date_subm = [2017 06 30];                       
metaData.email    = {'jessica.stubbs@research.uwa.edu.au'};     
metaData.address  = {'The University of Western Australia, 6009, Australia'};  

metaData.author_mod_1 = {'Bas Kooijman'};
metaData.date_mod_1   = [2017 07 04]; 
metaData.email_mod_1  = {'bas.kooijman@vu.nl'}; 

metaData.author_mod_2   = {'Jessica Stubbs', 'Starrlight Augustine'};           
metaData.date_mod_2     = [2017 12 01];                      
metaData.email_mod_2    = {'jessica.stubbs@research.uwa.edu.au'};             
metaData.address_mod_2  = {'The University of Western Australia, 6009, Australia'};

metaData.author_mod_3   = {'Jessica Stubbs'}; 
metaData.date_mod_3     = [2018 05 29];           
metaData.email_mod_3    = {'jessica.stubbs@research.uwa.edu.au'};  
metaData.address_mod_3  = {'The University of Western Australia, 6009, Australia'};  


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 06 11]; 


%% set data
% zero-variate data;
%% zero-variate data
data.ah = 47.69; units.ah = 'd';    label.ah = 'age at hatch';  bibkey.ah = 'StubMitc';  
  temp.ah = C2K(30.22);  units.temp.ah = 'K'; label.temp.ah = 'temperature'; %used only 30degree treatment (others used for univariate data)
data.ab = 54; units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = {'BalaRoss1974','Chri1990','StubMitc','Hend1958','PereBoot2011','SalmHama2009'};  
  temp.ab = C2K(30.22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  comment.ab = 'mean time to hatch + days to emerge + days to start feeding'; 
data.ap = 29*365;     units.ap = 'd';    label.ap = 'time since birth at puberty'; bibkey.ap = {'BalaChal2004', 'BellPars2005', 'ChalLimp2004', 'FrazEhrh1985', 'FrazLadn1986', 'GoshAven2010', 'VanHHarg2014', 'ZuriHerr2012'};
  temp.ap = C2K(23);  units.temp.ap = 'K'; label.temp.ap = 'temperature'; 
data.am = 80*365;     units.am = 'd';    label.am = 'life span'; bibkey.am = {'BalaChal2004','CSIRO'};   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';  

data.Lh  = 4.55;   units.Lh  = 'cm';   label.Lh  = 'SCL at hatch';    bibkey.Lh  = 'StubMitc';  comment.Lh = 'assumed no growth between hatch and onset of feeding';
data.Lp = 91; units.Lp = 'cm';   label.Lp = 'CCL at puberty';   bibkey.Lp = 'CSIRO'; comment.Lp = 'Length of smallest nesting female at Ningaloo encountered during CSIRO fieldtrips';
data.Li = 115; units.Li = 'cm';   label.Li = 'ultimate CCL';      bibkey.Li = 'Prin2017'; comment.Li = 'approximate length of the largest green turtles at Ningaloo';
data.Li_ref = 143; units.Li_ref = 'cm';   label.Li_ref = 'ultimate CCL';      bibkey.Li_ref = 'MoreBapt1995'; comment.Li_ref = 'largest published record of curved carapace length';

data.Wwh = 27.02; units.Wwh = 'g';    label.Wwh = 'wet weight at hatch';             bibkey.Wwh = 'StubMitc'; comment.Wwh = 'average wet weight of Ningaloo hatchlings (including yolk)';
data.Wwp = 97*1000; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'CSIRO'; comment.Wwp = 'weight of smallest nesting turtle (or turtle observed with vitellogenic follicles) at Ningaloo encountered during CSIRO fieldtrips';
data.Wwi = 130*1000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'CSIRO'; comment.Wwi = 'weight of largest turtle at Ningaloo encountered during CSIRO fieldtrips';

data.E0 = 226*1000; units.E0  = 'J'; label.E0  = 'initial energy content of the egg'; bibkey.E0  = {'VenkKann2005', 'Wine2016', 'RuslBoot2016'};  % average energy density of refs multiplied by average yolk mass from Ningaloo eggs
data.Ri  = 0.3; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = {'BjorCarr1989', 'BrodGlen2003', 'EkanKapu2016', 'Guin2009', 'Limp1993', 'Limp2009','LimpMill2003', 'LimpNich1988', 'TroeChal2007'};   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; comment.Ri = 'based on 105 eggs per clutch, 4 clutches per season and nesting every 4 years (averages of values found in references cited)';
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% uni-variate data %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% HATCHLINGS %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% data for hatchlings incubated at 30 degrees is excluded here as it is used for the zero-variate data
% temp (C), age at hatch (d), mass at hatch (g), yolk-free mass at hatch(g), yolk mass (g), length (SCL) at hatch (mm)
hatchlings = [
26.96	63.73	27.50	25.40	1.75	45.67
26.96	64.73	29.55	26.65	2.00	45.59
26.96	66.39	26.45	24.30	1.00	45.39
26.96	66.39	26.60	24.80	1.05	46.33
26.96	66.69	26.00	23.30	1.40	46.28
26.96	66.54	28.15	25.60	1.60	46.19
27.09	64.40	24.80	22.55	1.50	46.27
27.09	65.40	27.75	25.60	1.35	46.17
27.09	65.40	29.90	27.25	2.05	46.72
27.09	67.40	24.65	23.00	1.20	44.40
28.94	49.40	27.95	24.50	2.25	46.21
28.94	50.40	25.25	22.80	1.30	44.52
28.94	50.52	30.05	26.50	2.10	46.57
28.94	50.67	28.00	24.55	1.35	44.62
28.94	51.40	26.25	23.80	1.25	44.93
28.99	50.52	28.40	25.20	1.65	45.97
28.99	50.40	29.80	26.75	1.80	46.24
28.99	50.67	30.60	26.05	2.10	45.76
28.99	51.40	25.10	23.00	1.35	44.96
28.99	51.46	26.35	23.10	1.50	45.91
28.99	51.81	27.25	25.30	1.20	47.72
31.29	44.50	29.65	25.75	2.45	46.93
31.29	45.48	22.95	20.00	1.75	44.58
31.29	45.66	30.80	25.95	2.75	46.98
31.29	45.66	25.00	22.15	1.55	44.51
31.29	45.73	29.90	25.85	2.95	45.75
31.29	45.75	25.95	21.35	3.85	44.42
31.29	46.50	26.65	22.05	3.60	42.92
30.46	44.79	27.45	23.90	2.00	46.82
31.45	45.56	24.80	22.40	1.60	44.43
31.45	45.73	24.80	21.75	1.90	45.30
31.45	45.83	28.20	25.50	1.65	47.08
31.45	45.48	29.30	25.15	2.65	44.98
30.48	44.38	30.35	26.85	1.90	46.06
30.48	45.48	23.25	20.20	1.60	44.13
30.48	46.38	24.10	21.55	1.65	43.05
30.48	45.66	26.85	23.35	2.65	46.11
30.48	46.38	27.00	21.20	4.40	43.66
30.48	46.38	27.75	24.75	2.10	44.16
32.48	43.38	29.65	23.95	3.05	46.31
32.48	43.38	27.40	23.65	2.40	46.08
32.48	44.38	23.70	19.70	2.60	42.23
32.48	44.50	22.50	18.50	2.90	38.73
31.66	42.39	28.1	23.50	2.55	44.01
31.66	43.45	29.30	24.50	2.95	47.38
31.66	44.38	23.20	20.50	1.60	41.62
31.66	44.38	30.20	26.00	2.75	45.74    
];

%incubation temperature vs age at hatch
data.Tah=[hatchlings(:,1),hatchlings(:,2)]; 
units.Tah = {'degrees C', 'd'}; label.Tah={'temperature','time at hatch'}; bibkey.Tah='StubMitc';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% EMBRYOS AT 27 DEGREES %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% CLUTCH B %%%
%time(d), temp_resp(C), O2(mL/hr), CO2(mL/hr), temp_size(C), mass(g),length - SCL (mm), yolk mass (g), egg mass(g)
T27B = [
13.5258	26.37	0.1914	0.1130	27.39	0.13	NaN     NaN     48.90
22.5987	26.62	0.2946	0.1679	27.56	0.40	11.02	16.63	48.80
28.6374	26.38	0.5457	0.2822	27.68	1.00	16.15	16.60	49.85
32.3634	26.74	0.7561	0.3870	27.50	1.80	19.10	16.85	50.85
35.3887	26.46	1.0345	0.5387	26.57	2.45	22.35	17.75	52.65
39.6455	26.52	1.8006	0.9758	27.38	4.80	28.18	14.65	50.45
43.5715	27.66	2.1503	1.3919	27.41	6.35	33.58	14.05	48.50
47.5121	26.85	3.1641	2.2156	27.25	11.78	39.82	12.80	51.08
49.5683	27.65	3.7255	2.8566	27.31	13.80	41.03	11.95	54.25
51.5714	26.41	4.1643	3.4078	26.52	17.15	43.95	9.40	51.05
53.5793	27.00	3.7310	3.3710	27.41	18.28	45.41	7.98	51.08
55.5773	27.46	4.2232	3.4694	26.58	19.23	44.70	6.68	50.95
57.6056	27.33	3.6891	2.3974	27.29	21.70	46.06	5.65	49.10
59.5817	26.44	3.7028	2.9988	26.66	23.70	45.68	4.40	51.80
61.5705	27.12	2.7529	3.3965	27.44	24.33	45.04	3.33	50.25
63.5857	26.81	4.1358	2.8977	27.10	26.00	45.88	2.45	52.90
];
%%%%%%%%%% time vs yolk mass 27
data.tWwe_Y_T27B = [T27B(2:end,1), T27B(2:end,8)];
units.tWwe_Y_T27B = {'d','g'}; label.tWwe_Y_T27B={'time','yolk mass'}; bibkey.tWwe_Y_T27B='StubMitc';
temp.tWwe_Y_T27B =C2K(mean(T27B(:,5))); units.temp.tWwe_Y_T27B = 'K'; label.temp.tWwe_Y_T27B='temperature';
%%%%%%%%%% time vs embryo mass (no yolk) 27
data.tWwe_T27B = [T27B(:,1), T27B(:,6)];
units.tWwe_T27B = {'d','g'}; label.tWwe_T27B={'time','embryo weight'}; bibkey.tWwe_T27B='StubMitc';
temp.tWwe_T27B =C2K(mean(T27B(:,5))); units.temp.tWwe_T27B = 'K'; label.temp.tWwe_T27B='temperature';
%%%%%%%%%%% time vs embryo O2 consumption 27
data.tJOe_T27B = [T27B(:,1), T27B(:,3)];
units.tJOe_T27B = {'d','mL/h'}; label.tJOe_T27B={'time','oxygen consumption'}; bibkey.tJOe_T27B='StubMitc';
temp.tJOe_T27B =C2K(mean(T27B(:,2))); units.temp.tJOe_T27B = 'K'; label.temp.tJOe_T27B='temperature';
%%%%%%%%%%% time vs embryo CO2 production 27
data.tJCe_T27B = [T27B(:,1), T27B(:,4)];
units.tJCe_T27B = {'d','mL/h'}; label.tJCe_T27B={'time','carbon dioxide production'}; bibkey.tJCe_T27B='StubMitc';
temp.tJCe_T27B =C2K(mean(T27B(:,2))); units.temp.tJCe_T27B = 'K'; label.temp.tJCe_T27B='temperature';

%%% CLUTCH F %%%
%time(d), temp_resp(C), O2(mL/hr), CO2(mL/hr), temp_size(C), mass(g),length - SCL (mm), yolk mass (g), egg mass(g)
T27F = [
13.5207	26.48	0.2295	0.1394	27.39	0.15	NaN     NaN     43.83
22.6014	27.60	0.3258	0.1737	27.56	0.45	11.61	15.78	46.53
28.6447	26.63	0.5663	0.2918	27.68	1.15	16.96	14.60	45.50
32.3569	26.97	0.7347	0.3744	27.50	1.78	19.50	15.63	48.08
35.3867	26.33	1.1498	0.6027	26.57	2.80	24.02	14.63	50.85
39.6520	26.79	1.9501	1.0364	27.38	5.35	30.53	13.93	48.40
43.5682	26.94	2.3622	1.5100	27.41	6.88	34.11	14.03	47.95
49.5739	26.60	4.2996	3.1383	27.31	15.45	43.29	9.58	49.95
51.5766	26.39	4.2889	3.3577	26.52	16.58	43.67	8.88	50.90
53.5716	26.46	5.3128	3.8863	27.41	19.05	46.90	6.75	47.65
55.5695	27.17	5.8000	4.1022	26.58	20.25	45.71	5.65	49.48
57.6067	27.07	6.1891	2.5628	27.29	22.35	46.46	4.70	49.15
59.5656	26.81	5.1820	3.1594	26.66	23.13	45.10	3.40	48.75
61.5641	26.41	4.2362	3.6814	27.44	22.85	44.87	2.53	50.78
63.5824	26.46	3.2015	2.9981	27.10	25.73	45.76	2.60	51.55
];
%%%%%%%%%% time vs yolk mass 27
data.tWwe_Y_T27F = [T27F(2:end,1), T27F(2:end,8)];
units.tWwe_Y_T27F = {'d','g'}; label.tWwe_Y_T27F={'time','yolk mass'}; bibkey.tWwe_Y_T27F='StubMitc';
temp.tWwe_Y_T27F =C2K(mean(T27F(:,5))); units.temp.tWwe_Y_T27F = 'K'; label.temp.tWwe_Y_T27F='temperature';
%%%%%%%%%% time vs embryo mass (no yolk) 27
data.tWwe_T27F = [T27F(:,1), T27F(:,6)];
units.tWwe_T27F = {'d','g'}; label.tWwe_T27F={'time','embryo weight'}; bibkey.tWwe_T27F='StubMitc';
temp.tWwe_T27F =C2K(mean(T27F(:,5))); units.temp.tWwe_T27F = 'K'; label.temp.tWwe_T27F='temperature';
%%%%%%%%%%% time vs embryo O2 consumption 27
data.tJOe_T27F = [T27F(:,1), T27F(:,3)];
units.tJOe_T27F = {'d','mL/h'}; label.tJOe_T27F={'time','oxygen consumption'}; bibkey.tJOe_T27F='StubMitc';
temp.tJOe_T27F =C2K(mean(T27F(:,2))); units.temp.tJOe_T27F = 'K'; label.temp.tJOe_T27F='temperature';
%%%%%%%%%%% time vs embryo CO2 production 27
data.tJCe_T27F = [T27F(:,1), T27F(:,4)];
units.tJCe_T27F = {'d','mL/h'}; label.tJCe_T27F={'time','carbon dioxide production'}; bibkey.tJCe_T27F='StubMitc';
temp.tJCe_T27F =C2K(mean(T27F(:,2))); units.temp.tJCe_T27F = 'K'; label.temp.tJCe_T27F='temperature';

%%% CLUTCH H %%%
%time(d), temp_resp(C), O2(mL/hr), CO2(mL/hr), temp_size(C), mass(g),length - SCL (mm), yolk mass (g), egg mass(g)
T27H = [
13.5172	27.03	0.1703	0.1301	27.39	0.05	NaN     NaN     45.33
22.6007	27.00	0.2693	0.1553	27.56	0.37	10.77	12.35	46.40
28.6375	26.73	0.4766	0.2492	27.68	0.90	14.20	12.23	47.48
32.3562	26.49	0.6948	0.3636	27.50	1.38	17.71	13.03	49.68
35.3878	26.84	0.9519	0.5154	26.57	2.33	20.98	12.47	47.92
39.6429	27.18	1.5039	0.8557	27.38	3.85	26.65	11.43	51.05
43.5742	26.94	1.5139	1.2461	27.41	6.05	32.63	11.28	51.43
47.5111	26.35	1.7052	1.7707	27.25	9.90	38.72	9.70	51.40
49.5639	26.34	2.7560	2.6196	27.31	12.78	40.26	9.08	52.70
51.5821	27.00	2.2763	2.7589	26.52	14.88	42.64	7.58	52.60
53.5793	26.89	2.6803	2.9395	27.41	16.70	44.08	5.53	50.18
55.5697	27.33	2.4917	3.0662	26.58	17.77	45.08	4.95	50.75
57.6066	26.89	4.3878	2.4537	27.29	20.25	46.39	3.58	50.83
59.5692	26.71	3.1161	2.6822	26.66	21.53	45.61	2.45	51.50
61.5716	26.17	1.8511	2.6094	27.44	21.30	44.35	2.00	49.72
63.5894	26.75	2.5452	2.4188	27.10	21.00	43.84	1.55	48.77
];
%%%%%%%%%% time vs yolk mass 27
data.tWwe_Y_T27H = [T27H(2:end,1), T27H(2:end,8)];
units.tWwe_Y_T27H = {'d','g'}; label.tWwe_Y_T27H={'time','yolk mass'}; bibkey.tWwe_Y_T27H='StubMitc';
temp.tWwe_Y_T27H =C2K(mean(T27H(:,5))); units.temp.tWwe_Y_T27H = 'K'; label.temp.tWwe_Y_T27H='temperature';
%%%%%%%%%% time vs embryo mass (no yolk) 27
data.tWwe_T27H = [T27H(:,1), T27H(:,6)];
units.tWwe_T27H = {'d','g'}; label.tWwe_T27H={'time','embryo weight'}; bibkey.tWwe_T27H='StubMitc';
temp.tWwe_T27H =C2K(mean(T27H(:,5))); units.temp.tWwe_T27H = 'K'; label.temp.tWwe_T27H='temperature';
%%%%%%%%%%% time vs embryo O2 consumption 27
data.tJOe_T27H = [T27H(:,1), T27H(:,3)];
units.tJOe_T27H = {'d','mL/h'}; label.tJOe_T27H={'time','oxygen consumption'}; bibkey.tJOe_T27H='StubMitc';
temp.tJOe_T27H =C2K(mean(T27H(:,2))); units.temp.tJOe_T27H = 'K'; label.temp.tJOe_T27H='temperature';
%%%%%%%%%%% time vs embryo CO2 production 27
data.tJCe_T27H = [T27H(:,1), T27H(:,4)];
units.tJCe_T27H = {'d','mL/h'}; label.tJCe_T27H={'time','carbon dioxide production'}; bibkey.tJCe_T27H='StubMitc';
temp.tJCe_T27H =C2K(mean(T27H(:,2))); units.temp.tJCe_T27H = 'K'; label.temp.tJCe_T27H='temperature';

%%% CLUTCH X %%%
%time(d), temp_resp(C), O2(mL/hr), CO2(mL/hr), temp_size(C), mass(g),length - SCL (mm), yolk mass (g), egg mass(g)
T27X = [
13.5185	27.36	0.2031	0.1378	27.39	0.05	NaN     NaN     43.90
22.6056	27.88	0.3287	0.1866	27.56	0.45	10.76	15.80	51.50
39.6452	27.53	1.5850	0.8705	27.38	4.15	27.13	13.85	50.80
43.5626	26.30	2.5008	1.5804	27.41	7.40	33.36	14.25	47.10
47.5089	26.20	3.1243	2.1366	27.25	10.50	37.50	13.15	52.75
49.5620	27.33	3.9507	3.0326	27.31	14.80	40.99	10.60	51.85
51.5881	26.29	3.0036	3.0039	26.52	15.75	41.85	9.50	52.95
53.5793	27.05	3.9428	3.3560	27.41	17.60	42.94	7.58	52.10
57.6118	26.99	4.4137	2.4595	27.29	21.98	44.89	5.25	51.00
59.5751	26.68	3.5053	2.9560	26.66	22.23	45.23	4.15	55.20
61.5741	27.52	2.9044	3.3871	27.44	23.40	44.49	2.95	52.00
63.5973	26.22	2.6958	2.6748	27.10	24.70	44.12	1.90	48.85
];
%%%%%%%%%% time vs yolk mass 27
data.tWwe_Y_T27X = [T27X(2:end,1), T27X(2:end,8)];
units.tWwe_Y_T27X = {'d','g'}; label.tWwe_Y_T27X={'time','yolk mass'}; bibkey.tWwe_Y_T27X='StubMitc';
temp.tWwe_Y_T27X =C2K(mean(T27X(:,5))); units.temp.tWwe_Y_T27X = 'K'; label.temp.tWwe_Y_T27X='temperature';
%%%%%%%%%% time vs embryo mass (no yolk) 27
data.tWwe_T27X = [T27X(:,1), T27X(:,6)];
units.tWwe_T27X = {'d','g'}; label.tWwe_T27X={'time','embryo weight'}; bibkey.tWwe_T27X='StubMitc';
temp.tWwe_T27X =C2K(mean(T27X(:,5))); units.temp.tWwe_T27X = 'K'; label.temp.tWwe_T27X='temperature';
%%%%%%%%%%% time vs embryo O2 consumption 27
data.tJOe_T27X = [T27X(:,1), T27X(:,3)];
units.tJOe_T27X = {'d','mL/h'}; label.tJOe_T27X={'time','oxygen consumption'}; bibkey.tJOe_T27X='StubMitc';
temp.tJOe_T27X =C2K(mean(T27X(:,2))); units.temp.tJOe_T27X = 'K'; label.temp.tJOe_T27X='temperature';
%%%%%%%%%%% time vs embryo CO2 production 27
data.tJCe_T27X = [T27X(:,1), T27X(:,4)];
units.tJCe_T27X = {'d','mL/h'}; label.tJCe_T27X={'time','carbon dioxide production'}; bibkey.tJCe_T27X='StubMitc';
temp.tJCe_T27X =C2K(mean(T27X(:,2))); units.temp.tJCe_T27X = 'K'; label.temp.tJCe_T27X='temperature';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% EMBRYOS AT 31 DEGREES %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% CLUTCH B %%%%
% %time(d), temp_resp(C), O2(mL/hr), CO2(mL/hr), temp_size(C), mass(g),length - SCL (mm), yolk mass (g), egg mass (g)
T31B = [
9.8452	31.19	0.2776	0.1804	31.60	NaN     NaN     NaN     45.50
16.5783	31.44	0.3798	0.2182	31.54	0.68	12.11	NaN     48.68
23.6353	30.37	1.1473	0.7288	31.75	2.50	22.23	15.50	48.03
25.6354	31.31	1.6377	0.9784	31.28	3.45	26.08	15.55	48.05
27.6477	30.78	2.0501	1.3806	30.53	4.98	29.00	15.93	48.45
30.6054	30.56	3.9080	2.5685	31.52	8.63	37.02	14.78	48.83
32.6470	31.05	4.3278	3.0812	31.62	10.58	40.20	13.23	49.03
34.6844	31.08	4.0320	3.0579	31.40	12.70	40.90	10.08	49.00
36.5232	30.25	3.7682	3.7124	31.53	14.80	42.98	10.35	47.75
38.5516	30.56	4.7443	3.7253	30.71	17.95	44.23	7.75	49.80
40.5019	31.09	4.8710	4.3098	31.52	19.60	44.12	5.40	48.33
42.5307	30.96	6.0598	4.6901	31.52	21.28	45.62	4.35	52.48
44.5065	30.37	5.1726	3.3683	31.43	24.35	46.66	3.40	53.65
45.4726	30.52	4.4875	3.1262	30.45	25.75	46.83	2.35	47.53
];
%%%%%%%%%%%%%% time vs yolk mass 31
data.tWwe_Y_T31B = [T31B(3:end,1), T31B(3:end,8)];
units.tWwe_Y_T31B = {'d','g'}; label.tWwe_Y_T31B={'time','yolk mass'}; bibkey.tWwe_Y_T31B='StubMitc';
temp.tWwe_Y_T31B =C2K(mean(T31B(:,5))); units.temp.tWwe_Y_T31B = 'K'; label.temp.tWwe_Y_T31B='temperature';
%%%%%%%%%%%%%% time vs embryo mass (no yolk) 31
data.tWwe_T31B = [T31B(2:end,1), T31B(2:end,6)];
units.tWwe_T31B = {'d','g'}; label.tWwe_T31B={'time','embryo weight'}; bibkey.tWwe_T31B='StubMitc';
temp.tWwe_T31B =C2K(mean(T31B(:,5))); units.temp.tWwe_T31B = 'K'; label.temp.tWwe_T31B='temperature';
%%%%%%%%%%%%% time vs embryo O2 consumption 31
data.tJOe_T31B = [T31B(:,1), T31B(:,3)];
units.tJOe_T31B = {'d','mL/h'}; label.tJOe_T31B={'time','oxygen consumption'}; bibkey.tJOe_T31B='StubMitc';
temp.tJOe_T31B =C2K(mean(T31B(:,2))); units.temp.tJOe_T31B = 'K'; label.temp.tJOe_T31B='temperature';
%%%%%%%%%%%% time vs embryo CO2 production 31
data.tJCe_T31B = [T31B(:,1), T31B(:,4)];
units.tJCe_T31B = {'d','mL/h'}; label.tJCe_T31B={'time','carbon dioxide production'}; bibkey.tJCe_T31B='StubMitc';
temp.tJCe_T31B =C2K(mean(T31B(:,2))); units.temp.tJCe_T31B = 'K'; label.temp.tJCe_T31B='temperature';

%%%%% CLUTCH F %%%%
% %time(d), temp_resp(C), O2(mL/hr), CO2(mL/hr), temp_size(C), mass(g),length - SCL (mm), yolk mass (g), egg mass (g)
T31F = [
9.8329	31.57	0.3169	0.1883	31.60	0.05	NaN     NaN     42.40
16.5714	31.73	0.4958	0.2822	31.54	0.55	12.59	NaN     44.10
21.3801	30.51	0.9067	0.5089	30.62	1.60	18.97	14.30	43.20
23.6398	30.49	1.2927	0.7968	31.75	2.60	23.17	14.15	48.35
25.6297	31.18	1.7858	1.1057	31.28	4.00	26.05	14.60	47.00
27.6539	30.43	2.2292	1.4623	30.53	4.85	30.56	14.30	45.55
30.6192	30.39	3.8479	2.4955	31.52	7.60	35.43	14.05	45.30
32.6509	31.25	4.9270	3.2567	31.62	11.35	41.22	12.20	48.20
34.6780	30.84	5.6774	3.6156	31.40	14.15	45.15	9.65	50.30
36.5065	30.16	6.5031	4.6352	31.53	15.45	44.35	8.70	47.85
38.5453	30.90	6.9056	4.3431	30.71	19.50	44.13	5.10	48.35
40.5115	30.58	6.4207	4.8607	31.52	21.30	46.12	4.70	46.95
42.5212	31.36	6.6837	5.0486	31.52	21.70	44.86	3.40	52.75
44.5071	31.28	5.7322	3.7922	31.43	24.15	46.24	2.45	52.25
];
%%%%%%%%%%%%%% time vs yolk mass 31
data.tWwe_Y_T31F = [T31F(3:end,1), T31F(3:end,8)];
units.tWwe_Y_T31F = {'d','g'}; label.tWwe_Y_T31F={'time','yolk mass'}; bibkey.tWwe_Y_T31F='StubMitc';
temp.tWwe_Y_T31F =C2K(mean(T31F(:,5))); units.temp.tWwe_Y_T31F = 'K'; label.temp.tWwe_Y_T31F='temperature';
%%%%%%%%%%%%%% time vs embryo mass (no yolk) 31
data.tWwe_T31F = [T31F(:,1), T31F(:,6)];
units.tWwe_T31F = {'d','g'}; label.tWwe_T31F={'time','embryo weight'}; bibkey.tWwe_T31F='StubMitc';
temp.tWwe_T31F =C2K(mean(T31F(:,5))); units.temp.tWwe_T31F = 'K'; label.temp.tWwe_T31F='temperature';
%%%%%%%%%%%%% time vs embryo O2 consumption 31
data.tJOe_T31F = [T31F(:,1), T31F(:,3)];
units.tJOe_T31F = {'d','mL/h'}; label.tJOe_T31F={'time','oxygen consumption'}; bibkey.tJOe_T31F='StubMitc';
temp.tJOe_T31F =C2K(mean(T31F(:,2))); units.temp.tJOe_T31F = 'K'; label.temp.tJOe_T31F='temperature';
%%%%%%%%%%%% time vs embryo CO2 production 31
data.tJCe_T31F = [T31F(:,1), T31F(:,4)];
units.tJCe_T31F = {'d','mL/h'}; label.tJCe_T31F={'time','carbon dioxide production'}; bibkey.tJCe_T31F='StubMitc';
temp.tJCe_T31F =C2K(mean(T31F(:,2))); units.temp.tJCe_T31F = 'K'; label.temp.tJCe_T31F='temperature';

%%%%% CLUTCH H %%%%
% %time(d), temp_resp(C), O2(mL/hr), CO2(mL/hr), temp_size(C), mass(g),length - SCL (mm), yolk mass (g), egg mass (g)
T31H = [
9.8355	30.40	0.2362	0.1761	31.60	NaN     NaN     NaN     45.10
16.5715	31.42	0.3629	0.2117	31.54	0.60	11.18	NaN     45.75
23.6353	30.60	1.0179	0.6932	31.75	2.18	21.26	12.58	46.55
27.6510	31.64	1.6683	1.2679	30.53	4.23	28.30	12.40	45.75
30.6138	30.92	2.3804	1.7183	31.52	5.83	32.54	13.25	45.38
32.6479	30.68	3.6898	2.5848	31.62	9.00	37.65	11.08	46.73
34.6840	30.47	3.0730	2.5903	31.40	10.82	39.75	8.27	46.88
36.5128	30.67	2.9573	3.4196	31.53	13.28	41.48	6.70	48.02
38.5548	30.28	4.4484	3.1486	30.71	15.63	43.21	4.98	45.70
40.5014	30.33	4.4249	4.0752	31.52	17.83	43.70	4.13	49.05
42.5272	30.70	3.9909	3.7801	31.52	18.00	42.01	3.40	48.30
44.5087	30.09	3.9396	2.8873	31.43	20.12	43.54	1.83	48.98
45.4703	30.21	3.4754	2.8910	30.45	21.28	44.03	1.55	46.50
];
%%%%%%%%%%%%%% time vs yolk mass 31
data.tWwe_Y_T31H = [T31H(3:end,1), T31H(3:end,8)];
units.tWwe_Y_T31H = {'d','g'}; label.tWwe_Y_T31H={'time','yolk mass'}; bibkey.tWwe_Y_T31H='StubMitc';
temp.tWwe_Y_T31H =C2K(mean(T31H(:,5))); units.temp.tWwe_Y_T31H = 'K'; label.temp.tWwe_Y_T31H='temperature';
%%%%%%%%%%%%%% time vs embryo mass (no yolk) 31
data.tWwe_T31H = [T31H(2:end,1), T31H(2:end,6)];
units.tWwe_T31H = {'d','g'}; label.tWwe_T31H={'time','embryo weight'}; bibkey.tWwe_T31H='StubMitc';
temp.tWwe_T31H =C2K(mean(T31H(:,5))); units.temp.tWwe_T31H = 'K'; label.temp.tWwe_T31H='temperature';
%%%%%%%%%%%%% time vs embryo O2 consumption 31
data.tJOe_T31H = [T31H(:,1), T31H(:,3)];
units.tJOe_T31H = {'d','mL/h'}; label.tJOe_T31H={'time','oxygen consumption'}; bibkey.tJOe_T31H='StubMitc';
temp.tJOe_T31H =C2K(mean(T31H(:,2))); units.temp.tJOe_T31H = 'K'; label.temp.tJOe_T31H='temperature';
%%%%%%%%%%%% time vs embryo CO2 production 31
data.tJCe_T31H = [T31H(:,1), T31H(:,4)];
units.tJCe_T31H = {'d','mL/h'}; label.tJCe_T31H={'time','carbon dioxide production'}; bibkey.tJCe_T31H='StubMitc';
temp.tJCe_T31H =C2K(mean(T31H(:,2))); units.temp.tJCe_T31H = 'K'; label.temp.tJCe_T31H='temperature';

%%%%% CLUTCH X %%%%
% %time(d), temp_resp(C), O2(mL/hr), CO2(mL/hr), temp_size(C), mass(g),length - SCL (mm), yolk mass (g), egg mass (g)
T31X = [
9.8325	30.62	0.1871	0.1171	31.60	NaN     NaN     NaN     42.35
16.5717	31.29	0.3410	0.2154	31.54	0.40	11.07	NaN     41.83
21.3795	30.44	0.6213	0.3720	30.62	1.20	14.66	14.80	45.55
23.6328	31.57	0.9009	0.6875	31.75	2.30	21.42	15.25	49.25
32.6450	31.09	4.6817	3.1655	31.62	10.05	40.38	13.90	52.35
38.5521	31.38	3.1849	2.8895	30.71	15.05	41.93	7.90	45.00
40.5077	30.52	3.4988	3.6105	31.52	17.00	40.99	6.95	47.50
42.5279	31.33	3.0485	3.3747	31.52	16.45	40.65	6.40	53.20
44.5008	30.92	2.9514	3.0876	31.43	20.25	41.81	5.30	49.70
45.4695	29.79	4.0407	2.7392	30.45	22.15	43.24	3.15	47.05
];
%%%%%%%%%%%%%% time vs yolk mass 31
data.tWwe_Y_T31X = [T31X(3:end,1), T31X(3:end,8)];
units.tWwe_Y_T31X = {'d','g'}; label.tWwe_Y_T31X={'time','yolk mass'}; bibkey.tWwe_Y_T31X='StubMitc';
temp.tWwe_Y_T31X =C2K(mean(T31X(:,5))); units.temp.tWwe_Y_T31X = 'K'; label.temp.tWwe_Y_T31X='temperature';
%%%%%%%%%%%%%% time vs embryo mass (no yolk) 31
data.tWwe_T31X = [T31X(2:end,1), T31X(2:end,6)];
units.tWwe_T31X = {'d','g'}; label.tWwe_T31X={'time','embryo weight'}; bibkey.tWwe_T31X='StubMitc';
temp.tWwe_T31X =C2K(mean(T31X(:,5))); units.temp.tWwe_T31X = 'K'; label.temp.tWwe_T31X='temperature';
%%%%%%%%%%%%% time vs embryo O2 consumption 31
data.tJOe_T31X = [T31X(:,1), T31X(:,3)];
units.tJOe_T31X = {'d','mL/h'}; label.tJOe_T31X={'time','oxygen consumption'}; bibkey.tJOe_T31X='StubMitc';
temp.tJOe_T31X =C2K(mean(T31X(:,2))); units.temp.tJOe_T31X = 'K'; label.temp.tJOe_T31X='temperature';
%%%%%%%%%%%% time vs embryo CO2 production 31
data.tJCe_T31X = [T31X(:,1), T31X(:,4)];
units.tJCe_T31X = {'d','mL/h'}; label.tJCe_T31X={'time','carbon dioxide production'}; bibkey.tJCe_T31X='StubMitc';
temp.tJCe_T31X =C2K(mean(T31X(:,2))); units.temp.tJCe_T31X = 'K'; label.temp.tJCe_T31X='temperature';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% FIELD DATA %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%length vs weight (juveniles and sub-adult)LWw (CCL)
data.LWw =[36.50	42.10	43.40	43.40	43.70	44.10	44.40	44.45	44.95	45.30	45.90	46.00	46.30	47.60	48.60	48.65	48.95	49.00	50.10	51.65	51.90	52.25	53.70	54.25	54.30	55.00	55.00	55.65	55.80	56.00	56.55	56.80	57.10	58.00	58.90	59.05	60.05	60.55	61.00	61.20	61.40	61.65	62.05	62.10	63.05	63.45	64.25	67.60	68.05	68.40	68.60	70.85	71.20	72.30	72.50	73.05	73.25	73.90	73.95	74.00	74.30	74.60	74.70	74.70	74.90	75.00	75.20	75.20	76.15	76.40	77.15	77.60	77.60	77.80	77.95	78.10	78.15	78.35	78.65	78.70	79.00	79.25	79.70	79.80	80.05	80.25	80.30	80.55	80.65	80.70	81.30	81.40	81.45	81.85	81.90	82.15	83.00	83.65	83.85	84.55	85.00	85.20	86.50	87.45	87.60	88.25	88.80	88.95	89.30	89.50	89.80	90.00	90.15	90.40	90.55	91.35	91.35	91.70	92.75	94.00	94.40	95.20	95.70	96.00	96.05	99.25	104.15	108.70	71.45;% CCL
           5.56     8.30	9.30	8.64	10.70	9.64	9.50	10.40	7.86	8.05	10.60	11.48	11.15	12.30	13.10	13.80	12.80	13.92	15.10	17.20	14.50	18.30	17.40	21.65	17.64	19.90	20.90	23.55	19.50	25.85	21.60	24.80	23.50	25.55	27.10	21.90	29.90	26.30	24.70	22.05	29.50	28.85	29.90	28.60	27.00	28.50	29.25	38.90	39.00	48.10	34.30	42.45	41.55	44.95	43.90	46.30	46.50	49.95	44.60	51.60	49.00	47.40	51.20	47.90	43.95	50.20	49.95	45.10	54.30	49.80	52.15	59.40	54.30	53.40	54.35	58.50	53.50	65.80	60.45	54.80	60.45	54.15	60.00	63.00	58.35	67.50	60.89	63.70	64.00	59.05	62.60	55.50	62.00	60.95	69.40	64.15	64.45	64.30	79.20	69.65	68.80	77.90	79.60	70.45	80.00	78.10	81.50	81.00	83.60	84.00	79.60	69.20	93.70	93.50	84.00	84.90	85.90	78.55	87.90	90.50	94.75	96.40	93.00	102.60	98.50	126.70	125.10	115.75	41.45]'; % weight
data.LWw(:,2) = data.LWw(:,2) * 1e3; % kg to g
units.LWw = {'cm','g'}; label.LWw ={'CCL','weight'}; bibkey.LWw='CSIRO';
temp.LWw =C2K(23); units.temp.LWw= 'K'; label.temp.LWw='temperature'; %average Ningaloo water temperature


L0Lt = [ ... first capture (CCL, cm)	second capture	 (CCL, cm), time between captures (days)
43.7	48.8	1673
46.0	47.6	476
47.6	47.6	124
52.3	54.2	841
53.7	61.1	1430
55.1	55.8	123
56.8	59.1	1674
58.1	58.3	119
90.2	90.3	360
96.0	96.1	3056
97.5	99.2	11158
101.0	103.8	9066
];

% L0Lt = sortrows(L0Lt); % sort by first column in ascending order 
data.L0Lt = L0Lt(:,[1,2]);
units.L0Lt = {'cm','cm'}; label.L0Lt={'CCL at first capture','CCL at second capture'}; bibkey.L0Lt='CSIRO';
temp.L0Lt =C2K(23); units.temp.L0Lt = 'K'; label.temp.L0Lt='temperature'; %average Ningaloo water temperature
time.L0Lt = L0Lt(:,3); units.time.L0Lt = 'd'; label.time.L0Lt = 'time between captures';
treat.L0Lt = {0}; units.treat.L0Lt = ''; label.treat.L0Lt = '';
comment.L0Lt ='time between captures varies, see mydata file.';


%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights (remove these remarks after editing the file)
% the weights were set automatically with the function setweigths,
% we empirically found that the following weight settings for the
% zero-variate helped:

% uni-variate data: 
weights.ap = 0.9 * weights.ap;
weights.am = 0.1 * weights.am;
weights.L0Lt = 5 * weights.L0Lt;
weights.LWw = 5 * weights.LWw;
weights.Tah = 2 * weights.Tah;
weights.ah = 2 * weights.ah;

% the water in yolk was less than the amount of water that would enter the embryo so we could not get a good fit for the yolk:
weights.tWwe_Y_T31B = 0.1 * weights.tWwe_Y_T31B;
weights.tWwe_Y_T27F = 0.1 * weights.tWwe_Y_T27F;
weights.tWwe_Y_T31F = 0.1 * weights.tWwe_Y_T31F;
weights.tWwe_Y_T27H = 0.1 * weights.tWwe_Y_T27H;
weights.tWwe_Y_T31H = 0.1 * weights.tWwe_Y_T31H;
weights.tWwe_Y_T27X = 0.1 * weights.tWwe_Y_T27X;
weights.tWwe_Y_T31X = 0.1 * weights.tWwe_Y_T31X;


%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weights.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; 
weights.psd.k = 0.5; data.psd.k = 0.75; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'L0Lte_T27B','L0Lte_T27F','L0Lte_T27H','L0Lte_T27X','L0Lte_T31B','L0Lte_T31F','L0Lte_T31H','L0Lte_T31X'}; comment1 = {'embryo length for different temperatures'};
set2 = {'tWwe_Y_T27B','tWwe_Y_T27F','tWwe_Y_T27H','tWwe_Y_T27X','tWwe_Y_T31B','tWwe_Y_T31F','tWwe_Y_T31H','tWwe_Y_T31X'}; subtitle2 = {'yolk mass for different temperatures'};
set3 = {'tWwe_T27B','tWwe_T27F','tWwe_T27H','tWwe_T27X','tWwe_T31B','tWwe_T31F','tWwe_T31H','tWwe_T31X'}; subtitle3 = {'embryo mass (yolk free) for different temperatures'};
set4 = {'tJOe_T27B','tJOe_T27F','tJOe_T27H','tJOe_T27X','tJOe_T31B','tJOe_T31F','tJOe_T31H','tJOe_T31X'}; subtitle4 = {'embryo oxygen consumption for different temperatures'};
set5 = {'tJCe_T27B','tJCe_T27F','tJCe_T27H','tJCe_T27X','tJCe_T31B','tJCe_T31F','tJCe_T31H','tJCe_T31X'}; subtitle5 = {'embryo carbon dioxide production for different temperatures'};
metaData.grp.sets = {set2,set3,set4,set5};
metaData.grp.subtitle = {subtitle2,subtitle3,subtitle4,subtitle5};

% %% Discussion points
D1 = 'Mod_1: In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.75';
D2 = 'Mod_2: data from the Ningaloo population are calculated for f=0.8 based on the ratio of the size attained by the Ningaloo population and the size of the largest published green turtle record';
D3 = ['Mod_2: we assume that the density of yolk is different than that of the density of reserve and structure. ', ...
'So the yolk density d_Y is introduced as an extra parameter.'];
D4 = ['These parameter values and model predictions are presented and discussed in the paper: ',...
    'Stubbs et al, "A full life cycle Dynamic Energy Budget (DEB) model for the green sea turtle (Chelonia mydas) fitted to data on embryonic development"', ...
    'submitted to the Journal of Sea Research, DEB special issue 2018 '];
D5 = 'Mod_3: Mod_3: 3-parameter Arrhenius function describing upper boundary for thermal tolerance has been added to capture the slower rate of change of development rate at high temperatures more accurately. Additionally, pseudodata point k has been modified to k=0.75 to be more in line with other sea turtle models in the collection. See StubMitc2018 for a full discussion of this entry.';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);


%% Links
metaData.links.id_CoL = 'TVGD'; % Cat of Life
metaData.links.id_ITIS = '173833'; % ITIS
metaData.links.id_EoL = '46559469'; % Ency of Life
metaData.links.id_Wiki = 'Chelonia_mydas'; % Wikipedia
metaData.links.id_ADW = 'Chelonia_mydas'; % ADW
metaData.links.id_Taxo = '48475'; % Taxonomicon
metaData.links.id_WoRMS = '137206'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chelonia&species=mydas'; % ReptileDB
metaData.links.id_AnAge = 'Chelonia_mydas'; % AnAge


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
bibkey = 'BalaChal2004'; type = 'Article'; bib = [ ...  
'author = {Balazs, G.H. and Chaloupka, M.},'...
'year = {2004},'...
'title = {Spatial and temporal variability in the somatic growth of green sea turtles \emph{Chelonia mydas} resident in the Hawaiian Archipelago},'...
'journal = {Marine Biology},'...
'volume = {145},'...
'number = {5},'...
'pages = {1043-1059}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BalaRoss1974'; type = 'Article'; bib = [ ...  
'author = {Balazs, G.H. and Ross, E.},'...
'year = {1974},'...
'title = {Observations on the preemergence behaviour of the green turtle},'...
'journal = {Copeia},'...
'volume = {1974},'...
'number = {4},'...
'pages = {986-988}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'BellPars2005'; type = 'Article'; bib = [ ...  
'author = {Bell, C.D.L and Parsons, J. and Austin, T.J. and Broderick, A.C. and Ebanks-Petrie, G. and Godley, B.J.},'...
'year = {2005},'...
'title = {Some of them came home: the Cayman Turtle Farm headstarting project for the green turtle \emph{Chelonia mydas}},'...
'journal = {Oryx},'...
'volume = {39},'...
'number = {2},'...
'pages = {137-148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BjorCarr1989'; type = 'Article'; bib = [ ...  
'author = {Bjorndal, K.A. and Carr, A.},'...
'year = {1989},'...
'title = {Variation in clutch size and egg size in the green turtle nesting population at Torteguero, Costa Rica},'...
'journal = {Herpetologica},'...
'volume = {45},'...
'number = {2},'...
'pages = {181--189}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrodGlen2003'; type = 'Article'; bib = [ ...  
'author = {Broderick, A.C and Glen, F. and Godley, B.J. and Hays, G.C.},'...
'year = {2003},'...
'title = {Variation in reproductive output of marine turtles},'...
'journal = {Journal of Experimental Marine Biology and Ecology},'...
'volume = {288},'...
'number = {1},'...
'pages = {95--109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChalLimp2004'; type = 'Article'; bib = [ ...  
'author = {Chaloupka, M. and Limpus, C. and Miller, J.},'...
'year = {2004},'...
'title = {Green turtle somatic growth dynamics in a spatially disjunct Great Barrier Reef metapopulation},'...
'journal = {Coral Reefs},'...
'volume = {23},'...
'pages = {325-335}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Chri1990'; type = 'Article'; bib = [ ...  
'author = {Christens, E.},'...
'year = {1990},'...
'title = {Nest emergence lag in loggerhead sea turtles},'...
'journal = {Journal of Herpetology},'...
'volume = {24},'...
'number = {4},'...
'pages = {400-402}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'CSIRO'; type = 'Misc'; bib = [ ...  
'author = {CSIRO},'...
'note = {unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'EkanKapu2016'; type = 'Article'; bib = [ ...  
'author = {Ekanayake, E.M.L and Kapurusinghe, T. and Saman, M.M. and Rathankumara, D.S. and Samaraweera, P. and Rajakaruna, R.S.},'...
'year = {2016},'...
'title = {Reproductive output and morphometrics of green turtle, \emph{Chelonia mydas} nesting at the Kosgoda rookery in Sri Lanka},'...
'journal = {Ceylon Journal of Science},'...
'volume = {45},'...
'number = {3},'...
'pages = {103--116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'FrazEhrh1985'; type = 'Article'; bib = [ ...  
'author = {Frazer, N.B and Ehrhart, L.M.},'...
'year = {1985},'...
'title = {Preliminary growth models for green, \emph{Chelonia mydas}, and loggerhead, \emph{Caretta caretta}, turtles in the wild},'...
'journal = {Copeia},'...
'volume = {1985},'...
'pages = {73-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'FrazLadn1986'; type = 'Article'; bib = [ ...  
'author = {Frazer, N.B and Ladner, R.C.},'...
'year = {1986},'...
'title = {A growth curve for green sea turtles, \emph{Chelonia mydas}, in the US Virgin Islands, 1913-14 },'...
'journal = {Copeia},'...
'volume = {1986},'...
'number = {3},'...
'pages = {789-802}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'GoshAven2010'; type = 'Article'; bib = [ ...  
'author = {Goshe, L.R. and Avens, L. and Scharf, F.S. and Southwood, A.L},'...
'year = {2010},'...
'title = {Estimation of age at maturitaion and growth of Atlantic green turtles \emph{Chelonia mydas} using skeletochronology},'...
'journal = {Marine Biology},'...
'volume = {157},'...
'number = {8},'...
'pages = {1725-1740}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Guin2009'; type = 'Misc'; bib = [ ...  
'author = {Guinea, M. L.},'...
'year = {2009},'...
'title = {Long term marine turtle monitoring at Scott Reef},'...
'note = {Unpublished report to Sinclair Knight Merz}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hend1958'; type = 'Article'; bib = [ ...  
'author = {Hendrickson, J.R.},'...
'year = {1958},'...
'title = {The green sea turtle, \emph{Chelonia mydas} (Linn) in Malaya and Sarawak},'...
'journal = {Journal of Zoology},'...
'volume = {130},'...
'number = {4},'...
'pages = {455-535}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Limp1993'; type = 'Article'; bib = [ ...  
'author = {Limpus, C.J.},'...
'year = {1993},'...
'title = {The green turtle,\emph{Chelonia mydas}, in Queensland: breeding males in the southern Great Barrier Reef},'...
'journal = {Wildlife Research},'...
'volume = {20},'...
'number = {4},'...
'pages = {513--523}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Limp2009'; type = 'Book'; bib = [ ... 
'author = {Limpus, C.J. and Fien, L.}, ' ... 
'year = {2009}, ' ...
'title = {A Biological Review of Australian Marine Turtles}, ' ...
'publisher = {Environmental Protection Agency}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'LimpMill2003'; type = 'Techreport'; bib = [ ...  
'author = {Limpus, C. J. and Limpus, D. J. and Arthur, K.E. and Parmenter, J. C.},'...
'year = {2005}, '...
'title = {Monitoring green turtle population dynamics in Shoalwater Bay: 2000-2004}, '...
'institution = {Queensland Environmenal Protection Agency},'...
'number = {83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LimpNich1988'; type = 'Article'; bib = [ ...  
'author = {Limpus, C.J. and Nicholls, N.},'...
'year = {1988},'...
'title = {The southern oscillation regulates the annual numbers of green turtles (\emph{Chelonia mydas}) breeding around northern Australia},'...
'journal = {Wildlife Research},'...
'volume = {15},'...
'number = {2},'...
'pages = {157--161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'MoreBapt1995'; type = 'Article'; bib = [ ...  
'author = {Moreira, L. and Baptistotte, C. and Scalfone, J. and Thom\''{e}, J.C. and De Almeida, A.P.L.S},'...
'year = {1995},'...
'title = {Occurrence of \emph{Chelonia mydas} on the Island of Trindade, Brazil},'...
'journal = {Marine Turtle Newsletter},'...
'pages = {},' ...
'volume = {70},'...
'number = {2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'PereBoot2011'; type = 'Article'; bib = [ ...  
'author = {Pereia, C.M and Booth, D.T. and Limpus, C.J.},'...
'year = {2011},'...
'title = {Locomotor activity during the frenzy swim: analysig early swimming behaviour in hatchling sea turtles},'...
'journal = {Journal of Experimental Biology},'...
'volume = {214},'...
'number = {23},'...
'pages = {3972-3976}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Prin2017'; type = 'Misc'; bib = [...
'author = {Prince, R.I.T.},'...
'year = {2017},'...
'howpublished = {personal communication}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

bibkey = 'RuslBoot2016'; type = 'Article'; bib = [ ...  
'author = {Rusli, M.U. and Booth, D.T. and Joseph, J.},'...
'year = {2016},'...
'title = {Synchronous activity lowers the energetic cost of nest escapt for sea turtle hatchlings},'...
'journal = {Journal of Experimental Biology},'...
'volume = {219},'...
'number = {10},'...
'pages = {1505-1513}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 
bibkey = 'SalmHama2009'; type = 'Article'; bib = [ ...  
'author = {Salmon, M. and Hamann, M. and Wyneken, J. and Schauble, C.},'...
'year = {2009},'...
'title = {Early swimming activity by hatchling Flatback sea turtles \emph{Natator depressus}: a test of the "Predation Risk" hypothesis },'...
'journal = {Endangered Species Research},'...
'volume = {9},'...
'pages = {41-47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'StubMitc'; type = 'Misc'; bib = [ ...  
'author = {Stubbs, J.L. and Mitchell, N.J.},'...
'note = {in review},'...
'title = {The influence of temperature on embryonic respiration, growth, and sex determination in a Western Australian population of green turtle \emph{Chelonia mydas}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'TroeChal2007'; type = 'Article'; bib = [ ...  
'author = {Troeng, S. and Chaloupka, M.},'...
'year = {2007},'...
'title = {Variation in adult annual survival probability and remigration intervals of sea turtles},'...
'journal = {Marine Biology},'...
'volume = {151},'...
'number = {5},'...
'pages = {1721--1730}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'VanHHarg2014'; type = 'Article'; bib = [ ...  
'author = {Van Houtan K.S. and Hargrove, S.K. and Balazs, G.H.},'...
'year = {2014},'...
'title = {Modelling sea turtle maturity age from partial life history records},'...
'journal = {Pacific Science},'...
'volume = {68},'...
'number = {4},'...
'pages = {465-477}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'VenkKann2005'; type = 'Article'; bib = [ ...  
'author = {Venkatesan, S. and Kannan, P. and Rajagopalan, M. and Vivekanandan, E.},'...
'year = {2005},'...
'title = {Embryonic energetics in the egg of the green turtle \emph{Chelonia mydas}},'...
'journal = {Journal of the Marine Biological Association of India},'...
'volume = {47},'...
'number = {2},'...
'pages = {193-197}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

 bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelonia_mydas}},'...% replace my_pet by latin species name
'note = {Accessed : 2015-04-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'Wine2016'; type = 'Article'; bib = [ ...  
'author = {Wine, C.},'...
'year = {2016},'...
'title = {Sea turtle energectis},'...
'journal = {Hohonu},'...
'volume = {14},'...
'pages = {82-88}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'ZuriHerr2012'; type = 'inproceedings'; bib = [ ...  
'author = {Zurita, J.C. and Herrera, R. and Arenas, A. and Negrete, A.C. and Gomez, L. and Prezas, B. and Sasso, C.R.},'...
'year = {2012},'...
'title = {Age at first nesting of green turtles in the Mexican Caribbean},'...
'booktitle = {Proceedings of the thirty-first annual symposium on sea turtle biology and conservation},'...
'pages = {75},'...
'publisher = {National Oceanic and Atmospheric Administration Fisheries Service, Southeast Fisheries Science Centre},'...
'address = {Miami, Florida}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'StubMitc2018'; type = 'article'; bib = [ ...  
'author = {Jessica L Stubbs snf Nicola J Mitchell1 and Nina Marn and Mathew A Vanderklift and Richard D Pillans and Starrlight Augustine},'...
'year = {2018},'...
'title = {A full life cycle Dynamic Energy Budget (DEB) model for the green sea turtle (\emph{Chelonia mydas}) fitted to data on embryonic development },'...
'journal = {Journal of Sea Research},'...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


