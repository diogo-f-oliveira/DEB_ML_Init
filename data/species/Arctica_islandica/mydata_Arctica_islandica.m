 function [data, auxData, metaData, txtData, weights] = mydata_Arctica_islandica

%% set metadata
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Arcticidae';
metaData.species    = 'Arctica_islandica'; 
metaData.species_en = 'Ocean quahog'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K. body temperature   
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li';'Ww0'; 'Wdp'; 'Ri'}; 
metaData.data_1     = {'t-L_f', 'L-Wd'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Irene Ballesta Artero'};        
metaData.date_subm = [2015 04 20];                         
metaData.email    = {'irene.ballesta.artero@nioz.nl'}; 
metaData.address  = {'NIOZ, 1797 SH, Netherlands'};     

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 12 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Irene Ballesta Artero'};        
metaData.date_mod_2     = [2017 05 24];                         
metaData.email_mod_2    = {'irene.ballesta.artero@nioz.nl'}; 
metaData.address_mod_2  = {'NIOZ, 1797 SH, Netherlands'};  

metaData.author_mod_3   = {'Irene Ballesta Artero', 'Starrlight Augustine'};        
metaData.date_mod_3     = [2017 11 06];                         
metaData.email_mod_3    = {'irene.ballesta.artero@nioz.nl'}; 
metaData.address_mod_3  = {'NIOZ, 1797 SH, Netherlands'};    

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2017 11 12];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University Amsterdam'};   

metaData.author_mod_5   = {'Irene Ballesta Artero', 'Starrlight Augustine'};    
metaData.date_mod_5     = [2018 09 03];              
metaData.email_mod_5    = {'sta@akvaplan.niva.no'};            
metaData.address_mod_5  = {'Akvaplan-niva, Trosmo, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 09 03];

%% set data
% zero-variate data;

data.ab = 4;       units.ab = 'd';     label.ab = 'age at birth';                      bibkey.ab = 'LutzMann1982';  
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = '4d from Fig.2';
data.tj = 34;       units.tj = 'd';    label.tj = 'time since birth at metamorphosis'; bibkey.tj = 'LutzMann1982';
  temp.tj = C2K(13);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '32-36 days after fertilization';
data.tp = 2190;   units.tp = 'd';    label.tp = 'time since birth at puberty';       bibkey.tp = 'ThomJone1980';
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6 years and average annual temperature from NOAA report (Taylor et al.2009)';
data.am = 185055;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'ButlWana2012';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj = 0.024;    units.Lj  = 'cm';  label.Lj  = 'shell length at metamorphosis';    bibkey.Lj  = 'LutzMann1982'; 
  comment.Lj = 'smallest shell lenght metamorphosed = 240 um;possible 200, this value used so similar to length ';
data.Lp  = 4;     units.Lp  = 'cm';  label.Lp  = 'shell lenght at puberty';          bibkey.Lp  = {'ThomJone1980','Ball2017'};
data.Li  = 14;      units.Li  = 'cm';  label.Li  = 'ultimate shell length';            bibkey.Li  = 'Rope1985';

data.Ww0  = 0.01375 ;  units.Ww0 = 'mg';  label.Ww0  = 'wet weight of an egg.';            bibkey.Ww0 = {'Oerz1972'}; 
  comment.Ww0 = '400000 eggs -5500 mg (fresh weight)- 1egg= 0.01375 mg. 0.0095 oocytes length from Ingoya by Ball2017; ';

data.Wdp = 0.98;     units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';            bibkey.Wdp = 'Ball2017';

data.RL  = 1096;    units.RL  = '#/d'; label.RL  = 'maximum reprod rate';              bibkey.RL  = 'Oerz1972';   
  temp.RL = C2K(10); units.temp.RL = 'K'; label.temp.RL = 'temperature';
  comment.RL = 'mean number eggs per 5 cm length indiv = 400000(/365 days=1096) Annual mean temperature kiel Bay: Begum et al. 2008';

%  data.GSI  = 0.012; units.GSI  = 'g/cm^3';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'Ball2017';   
%  temp.GSI = C2K(9);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
%  comment.GSI = 'max GSI August 2014 Ingoya = AFDW(g)/(length.cm)^3';
   
% uni-variate data 
%%
% food level 3, temperature 3 deg C
% we will apply temp. correction for 3 degrees directly in the predict file
% we will pass experiment duration as auxData

tLWT = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
0	13.7	0.57	NaN	NaN	NaN	3	3
0	14.19	0.64	NaN	NaN	NaN	3	3
0	15.21	0.75	NaN	NaN	NaN	3	3
0	12.63	0.4	NaN	NaN	NaN	3	3
0	11.51	0.43	NaN	NaN	NaN	3	3
0	14.96	0.73	NaN	NaN	NaN	3	3
0	10.45	0.29	NaN	NaN	NaN	3	3
0	13.14	0.51	NaN	NaN	NaN	3	3
0	12.72	0.48	NaN	NaN	NaN	3	3
0	10	NaN	NaN	NaN	NaN	3	3
0	12.79	0.54	NaN	NaN	NaN	3	3
45	13.7	0.58	21.19	8.27	NaN	3	3
45	14.15	0.71	8.97	3.63	NaN	3	3
45	15.11	0.75	21.87	6.56	NaN	3	3
45	12.67	0.4	NaN	NaN	NaN	3	3
45	11.62	0.34	NaN	NaN	NaN	3	3
45	14.8	0.7	NaN	NaN	NaN	3	3
45	10.39	0.28	NaN	NaN	NaN	3	3
45	13.12	0.56	NaN	NaN	NaN	3	3
45	12.9	0.46	NaN	NaN	NaN	3	3
45	10.01	0.24	NaN	NaN	NaN	3	3
45	13.21	0.55	NaN	NaN	NaN	3	3
93	NaN	NaN	NaN	NaN	159	3	3
93	NaN	NaN	NaN	NaN	189.6	3	3
93	NaN	NaN	NaN	NaN	204.7	3	3
93	13.26	0.46	8.5	NaN	145.2	3	3
93	12.43	0.39	11.7	NaN	138	3	3
93	14.83	0.68	7.6	NaN	198.8	3	3
93	10.44	0.27	4.5	NaN	83.6	3	3
93	12.99	0.49	8.1	NaN	146.8	3	3
93	13.81	0.56	12	NaN	191.8	3	3
93	10.81	0.29	6.8	NaN	97	3	3
93	14.3	0.7	31.6	NaN	227.4	3	3
];
data.tL93_3F3 =  [tLWT(4:11,2) tLWT(end-7:end,2)]; bibkey.tL93_3F3 = {'Ball2017'};
units.tL93_3F3 = {'mm', 'mm'};  label.tL93_3F3 = {'initial length', 'final length'};  
expTime.tL93_3F3 = 93; units.expTime.tL93_3F3 = 'd'; label.expTime.tL93_3F3 = 'duration';
comment.tL93_3F3 = '93 days of growth'; 
expLength.tL93_3F3 = 93 * ones(length(data.tL93_3F3),1); units.expLength.tL93_3F3 = 'day'; 
label.expLength.tL93_3F3 = 'experiment duration';

% data.tL45_3F3 =  [tLWT(1:11,2) tLWT(12:22,2)]; bibkey.tL45_3F3 = {'Ball2017'};
% units.tL45_3F3 = {'mm', 'mm'};  label.tL45_3F3 = {'initial length', 'final length'};  
% expTime.tL45_3F3 = 45; units.expTime.tL45_3F3 = 'd'; label.expTime.tL45_3F3 = 'duration';
% comment.tL45_3F3 = '45 days of growth'; 
% 
% data.LWd45_3F3 =  [tLWT(12:14,2) tLWT(12:14,4)]; bibkey.LWd45_3F3 = {'Ball2017'};
% units.LWd45_3F3 = {'mm', 'mg'};  label.LWd45_3F3 = {'initial length', 'final dry weight'};  
% expTime.LWd45_3F3 = 45; units.expTime.LWd45_3F3 = 'd'; label.expTime.LWd45_3F3 = 'duration';
% comment.LWd45_3F3 = ' dry weight of tissue after 45 days of growth for each individual'; 
% 
data.LWd93_3F3 =  [tLWT(26:33,2) tLWT(26:33,4)]; bibkey.LWd93_3F3 = {'Ball2017'};
units.LWd93_3F3 = {'mm', 'mg'};  label.LWd93_3F3 = {'initial length', 'final dry weight'};  
expTime.LWd93_3F3 = 93; units.expTime.LWd93_3F3 = 'd'; label.expTime.LWd93_3F3 = 'duration';
comment.LWd93_3F3 = ' dry weight of tissue after 93 days of growth for each individual'; 
expLength.LWd93_3F3 = 93 * ones(length(data.LWd93_3F3),1); units.expLength.LWd93_3F3 = 'day'; 
label.expLength.LWd93_3F3 = 'experiment duration';

% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93 =  [tLWT(4:9,3) tLWT(26:31,3); tLWT(11,3) tLWT(33:end,3)];
% units.tWw93 = {'g', 'g'};  label.tWw93 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93 = 93; units.expTime.tWw93 = 'd'; label.expTime.tWw93 = 'duration';
% comment.tWw93 = '93 days of growth'; 
% 
% data.tWw45 =  [tLWT(1:9,3) tLWT(12:20,3); tLWT(11,3) tLWT(22,3)];
% units.tWw45 = {'g', 'g'};  label.tWw45 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw45 = 45; units.expTime.tWw45 = 'd'; label.expTime.tWw45 = 'duration';
% comment.tWw45 = '45 days of growth'; 


% %%%%%%%%%%%%%%Food 2 Temp3
% tLWT_3F2 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	14.7	0.72	NaN	NaN	NaN	2	3
% 0	15.01	0.77	NaN	NaN	NaN	2	3
% 0	12.58	0.44	NaN	NaN	NaN	2	3
% 0	11.37	0.31	NaN	NaN	NaN	2	3
% 0	12.31	0.4	NaN	NaN	NaN	2	3
% 0	11.42	0.3	NaN	NaN	NaN	2	3
% 0	13.53	0.59	NaN	NaN	NaN	2	3
% 0	10.06	0.26	NaN	NaN	NaN	2	3
% 0	11.27	0.37	NaN	NaN	NaN	2	3
% 0	14.18	0.71	NaN	NaN	NaN	2	3
% 45	14.9	0.7	20.96	5.43	NaN	2	3
% 45	15.15	0.74	14.99	5.12	NaN	2	3
% 45	12.52	0.47	7.31	2.6	NaN	2	3
% 45	13.16	0.52	NaN	NaN	NaN	2	3
% 45	12.33	0.41	NaN	NaN	NaN	2	3
% 45	11.5	0.33	NaN	NaN	NaN	2	3
% 45	13.77	0.56	NaN	NaN	NaN	2	3
% 45	9.97	0.24	NaN	NaN	NaN	2	3
% 45	11.73	0.35	NaN	NaN	NaN	2	3
% 45	14.39	0.71	NaN	NaN	NaN	2	3
% 93	NaN	NaN	NaN	NaN	188.2	2	3
% 93	NaN	NaN	NaN	NaN	214.1	2	3
% 93	NaN	NaN	NaN	NaN	101.3	2	3
% 93	14.32	0.63	14.9	NaN	196.8	2	3
% 93	12.46	0.42	9.3	NaN	125.4	2	3
% 93	11.92	0.37	7.7	NaN	121.3	2	3
% 93	14.64	0.69	22.2	NaN	218.2	2	3
% 93	10.05	0.24	2.9	NaN	87.4	2	3
% 93	12.9	0.44	14.3	NaN	144.5	2	3
% 93	15.45	0.86	27.3	NaN	258	2	3
% ];
% data.tL93_3F2 =  [tLWT_3F2(4:10,2) tLWT_3F2(24:30,2)]; bibkey.tL93_3F2 = {'Ball2017'};
% units.tL93_3F2= {'mm', 'mm'};  label.tL93_3F2 = {'initial length', 'final length'};  
% expTime.tL93_3F2 = 93; units.expTime.tL93_3F2 = 'd'; label.expTime.tL93_3F2 = 'duration';
% comment.tL93_3F2 = '93 days of growth'; 
% 
% data.tL45_3F2 =  [tLWT_3F2(1:10,2) tLWT_3F2(11:20,2)]; bibkey.tL45_3F2 = {'Ball2017'};
% units.tL45_3F2 = {'mm', 'mm'};  label.tL45_3F2 = {'initial length', 'final length'};  
% expTime.tL45_3F2 = 45; units.expTime.tL45_3F2 = 'd'; label.expTime.tL45_3F2 = 'duration';
% comment.tL45_3F2 = '45 days of growth'; 
% 
% data.LWd45_3F2 =  [tLWT_3F2(11:13,2) tLWT_3F2(11:13,4)]; bibkey.LWd45_3F2 = {'Ball2017'};
% units.LWd45_3F2 = {'mm', 'mg'};  label.LWd45_3F2 = {'initial length', 'final dry weight'};  
% expTime.LWd45_3F2 = 45; units.expTime.LWd45_3F2 = 'd'; label.expTime.LWd45_3F2 = 'duration';
% comment.LWd45_3F2 = ' dry weight of tissue after 45 days of growth for each individual'; 
% 
% data.LWd93_3F2 =  [tLWT_3F2(24:30,2) tLWT_3F2(24:30,4)]; bibkey.LWd93_3F2 = {'Ball2017'};
% units.LWd93_3F2 = {'mm', 'mg'};  label.LWd93_3F2 = {'initial length', 'final dry weight'};  
% expTime.LWd93_3F2 = 93; units.expTime.LWd93_3F2 = 'd'; label.expTime.LWd93_3F2 = 'duration';
% comment.LWd93_3F2 = ' dry weight of tissue after 93 days of growth for each individual'; 

% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_3F2 =  [tLWT_3F2(4:10,3) tLWT_3F2(24:30,3); tLWT_3F2(11,3) tLWT_3F2(33:end,3)];
% units.tWw93_3F2 = {'g', 'g'};  label.tWw93 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_3F2 = 93; units.expTime.tWw93_3F2 = 'd'; label.expTime.tWw93_3F2 = 'duration';
% comment.tWw93_3F2 = '93 days of growth'; 
% 
% data.tWw45_3F2 =  [tLWT_3F2(1:10,3) tLWT_3F2(11:20,3); tLWT_3F2(11,3) tLWT_3F2(22,3)];
% units.tWw45_3F2 = {'g', 'g'};  label.tWw45_3F2 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_3F2 = 45; units.expTime.tWw45_3F2 = 'd'; label.expTime.tWw45_3F2 = 'duration';
% comment.tWw45_3F2


%%%%food 1 temp 3
% tLWT_3F1 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	13	0.47	NaN	NaN	NaN	1	3
% 0	14.33	0.68	NaN	NaN	NaN	1	3
% 0	12.99	0.45	NaN	NaN	NaN	1	3
% 0	12.73	0.48	NaN	NaN	NaN	1	3
% 0	11.6	0.4	NaN	NaN	NaN	1	3
% 0	12.85	0.52	NaN	NaN	NaN	1	3
% 0	11.36	0.36	NaN	NaN	NaN	1	3
% 0	15.65	0.87	NaN	NaN	NaN	1	3
% 0	13.56	0.63	NaN	NaN	NaN	1	3
% 0	12.08	0.43	NaN	NaN	NaN	1	3
% 0	13.78	0.66	NaN	NaN	NaN	1	3
% 0	9.62	0.3	NaN	NaN	NaN	1	3
% 45	NaN	NaN	6.77	NaN	NaN	1	3
% 45	14.65	0.67	21.99	5.9	NaN	1	3
% 45	14.88	0.7	20.42	6.62	NaN	1	3
% 45	12.63	0.42	NaN	NaN	NaN	1	3
% 45	11.58	0.36	NaN	NaN	NaN	1	3
% 45	12.86	0.48	NaN	NaN	NaN	1	3
% 45	11.45	0.32	NaN	NaN	NaN	1	3
% 45	15.75	0.79	NaN	NaN	NaN	1	3
% 45	13.97	0.58	NaN	NaN	NaN	1	3
% 45	12.08	0.38	NaN	NaN	NaN	1	3
% 45	13.87	0.57	NaN	NaN	NaN	1	3
% 45	9.5	NaN	NaN	NaN	NaN	1	3
% 93	NaN	NaN	NaN	NaN	NaN	1	3
% 93	NaN	NaN	NaN	NaN	192.2	1	3
% 93	NaN	NaN	NaN	NaN	187.4	1	3
% 93	12.72	0.42	4	NaN	117.4	1	3
% 93	12.2	0.4	7.8	NaN	129.4	1	3
% 93	13.33	0.53	9.9	NaN	150.6	1	3
% 93	11.64	0.36	5.2	NaN	101.4	1	3
% 93	15.78	0.82	14.2	NaN	247.2	1	3
% 93	14.58	0.66	12.4	NaN	227	1	3
% 93	12.09	0.36	4.9	NaN	115	1	3
% 93	13.8	0.57	10	NaN	172	1	3
% 93	NaN	NaN	NaN	NaN	NaN	1	3
% ];
% data.tL93_3F1 =  [tLWT_3F1(4:11,2) tLWT_3F1(28:35,2)]; bibkey.tL93_3F1= {'Ball2017'};
% units.tL93_3F1= {'mm', 'mm'};  label.tL93_3F1= {'initial length', 'final length'};  
% expTime.tL93_3F1= 93; units.expTime.tL93_3F1= 'd'; label.expTime.tL93_3F1= 'duration';
% comment.tL93_3F1= '93 days of growth'; 
% expLength.tL93_3F1 = 93 * ones(length(data.tL93_3F1),1); units.expLength.tL93_3F1 = 'day'; 
% label.expLength.tL93_3F1 = 'experiment duration';
% 
% data.tL45_3F1=  [tLWT_3F1(2:12,2) tLWT_3F1(14:24,2)]; bibkey.tL45_3F1= {'Ball2017'};
% units.tL45_3F1= {'mm', 'mm'};  label.tL45_3F1= {'initial length', 'final length'};  
% expTime.tL45_3F1= 45; units.expTime.tL45_3F1= 'd'; label.expTime.tL45_3F1= 'duration';
% comment.tL45_3F1= '45 days of growth'; 
% 
% data.LWd45_3F1=  [tLWT_3F1(14:15,2) tLWT_3F1(14:15,4)]; bibkey.LWd45_3F1= {'Ball2017'};
% units.LWd45_3F1= {'mm', 'mg'};  label.LWd45_3F1= {'initial length', 'final dry weight'};  
% expTime.LWd45_3F1= 45; units.expTime.LWd45_3F1= 'd'; label.expTime.LWd45_3F1= 'duration';
% comment.LWd45_3F1= ' dry weight of tissue after 45 days of growth for each individual'; 
% 
% data.LWd93_3F1=  [tLWT_3F1(28:35,2) tLWT_3F1(28:35,4)]; bibkey.LWd93_3F1= {'Ball2017'};
% units.LWd93_3F1= {'mm', 'mg'};  label.LWd93_3F1= {'initial length', 'final dry weight'};  
% expTime.LWd93_3F1= 93; units.expTime.LWd93_3F1= 'd'; label.expTime.LWd93_3F1= 'duration';
% comment.LWd93_3F1= ' dry weight of tissue after 93 days of growth for each individual'; 
% expLength.LWd93_3F1 = 93 * ones(length(data.LWd93_3F1),1); units.expLength.LWd93_3F1 = 'day'; 
% label.expLength.LWd93_3F1 = 'experiment duration';
%
% % % the wet weight includes the shell and we don't (yet) model shell growth
% % data.tWw93_3F1=  [tLWT_3F1(28:35,3) tLWT_3F1(28:35)];
% % units.tWw93_3F1= {'g', 'g'};  label.tWw93_3F1 = {'initial wet weight', 'final wet weight'};  
% % expTime.tWw93_3F1= 93; units.expTime.tWw93_3F1 = 'd'; label.expTime.tWw93_3F1 = 'duration';
% % comment.tWw93_3F1= '93 days of growth'; 
% %
% % data.tWw45_3F1 =  [tLWT_3F1(2:11,3) tLWT_3F1(14,23) ];
% % units.tWw45_3F1 = {'g', 'g'};  label.tWw45_3F1 = {'initial wet weight', 'final wet weight'};  
% % expTime.tWw45_3F1 = 45; units.expTime.tWw45_3F1 = 'd'; label.expTime.tWw45_3F1 = 'duration';
% % comment.tWw45_3F1
% 
% 
% %%Food 0 T3
% tLWT_3F0 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	17.06	1.11	NaN	NaN	NaN	0	3
% 0	14.8	0.7	NaN	NaN	NaN	0	3
% 0	14.18	0.64	NaN	NaN	NaN	0	3
% 0	15.44	0.89	NaN	NaN	NaN	0	3
% 0	13.15	0.53	NaN	NaN	NaN	0	3
% 0	14.51	0.75	NaN	NaN	NaN	0	3
% 0	15.1	0.71	NaN	NaN	NaN	0	3
% 0	14.06	0.65	NaN	NaN	NaN	0	3
% 45	17.09	1.09	23.13	9.19	NaN	0	3
% 45	14.86	0.68	15.13	6.08	NaN	0	3
% 45	14.29	0.61	15.46	6.46	NaN	0	3
% 45	15.5	0.95	NaN	NaN	NaN	0	3
% 45	13.18	0.53	NaN	NaN	NaN	0	3
% 45	14.76	0.75	NaN	NaN	NaN	0	3
% 45	15.19	0.67	NaN	NaN	NaN	0	3
% 45	14.17	0.74	NaN	NaN	NaN	0	3
% 93	NaN	NaN	NaN	NaN	289.7	0	3
% 93	NaN	NaN	NaN	NaN	198.8	0	3
% 93	NaN	NaN	NaN	NaN	158.6	0	3
% 93	15.57	0.86	10	NaN	279.2	0	3
% 93	13.31	0.55	8.8	NaN	159	0	3
% 93	15.34	0.84	14.1	NaN	264.4	0	3
% 93	15.11	0.65	6.7	NaN	163.8	0	3
% 93	14.13	0.56	6	NaN	128.4	0	3
% 
% ];
% 
% data.tL93_3F0 =  [tLWT_3F0(4:8,2) tLWT_3F0(20:24,2)]; bibkey.tL93_3F0= {'Ball2017'};
% units.tL93_3F0= {'mm', 'mm'};  label.tL93_3F0= {'initial length', 'final length'};  
% expTime.tL93_3F0= 93; units.expTime.tL93_3F0= 'd'; label.expTime.tL93_3F0= 'duration';
% comment.tL93_3F0= '93 days of growth'; 
% 
% data.tL45_3F0=  [tLWT_3F0(1:8,2) tLWT_3F0(9:16,2)]; bibkey.tL45_3F0= {'Ball2017'};
% units.tL45_3F0= {'mm', 'mm'};  label.tL45_3F0= {'initial length', 'final length'};  
% expTime.tL45_3F0= 45; units.expTime.tL45_3F0= 'd'; label.expTime.tL45_3F0= 'duration';
% comment.tL45_3F0= '45 days of growth'; 
% 
% data.LWd45_3F0=  [tLWT_3F0(9:11,2) tLWT_3F0(9:11,4)]; bibkey.LWd45_3F0= {'Ball2017'};
% units.LWd45_3F0= {'mm', 'mg'};  label.LWd45_3F0= {'initial length', 'final dry weight'};  
% expTime.LWd45_3F0= 93; units.expTime.LWd45_3F0= 'd'; label.expTime.LWd45_3F0= 'duration';
% comment.LWd45_3F0= ' dry weight of tissue after 45 days of growth for each individual'; 
% 
% data.LWd93_3F0=  [tLWT_3F0(20:24,2) tLWT_3F0(20:24,4)]; bibkey.LWd93_3F0= {'Ball2017'};
% units.LWd93_3F0= {'mm', 'mg'};  label.LWd93_3F0= {'initial length', 'final dry weight'};  
% expTime.LWd93_3F0= 93; units.expTime.LWd93_3F0= 'd'; label.expTime.LWd93_3F0= 'duration';
% comment.LWd93_3F0= ' dry weight of tissue after 93 days of growth for each individual'; 

% % % the wet weight includes the shell and we don't (yet) model shell growth
% % data.tWw93_3F0=  [tLWT_3F0(4:8,3) tLWT_3F0(20:24,3) ];
% % units.tWw93_3F0= {'g', 'g'};  label.tWw93_3F0 = {'initial wet weight', 'final wet weight'};  
% % expTime.tWw93_3F0= 93; units.expTime.tWw93_3F0 = 'd'; label.expTime.tWw93_3F0 = 'duration';
% % comment.tWw93_3F0= '93 days of growth'; 
% % 
% % data.tWw45_3F0=  [tLWT_3F0(1:8,3) tLWT_3F0(9:16,3)];
% % units.tWw45_3F0= {'g', 'g'};  label.tWw45_3F0= {'initial wet weight', 'final wet weight'};  
% % expTime.tWw45_3F0= 45; units.expTime.tWw45_3F0= 'd'; label.expTime.tWw45_3F0= 'duration';
% % comment.tWw45_3F0
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Temperature 8
%%%%%%%%%%T8 FOOD 3

tLWT_8F3 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
0	16.9	0.98	NaN	NaN	NaN	3	8
0	17.22	1.14	NaN	NaN	NaN	3	8
0	15.73	0.86	NaN	NaN	NaN	3	8
0	13.36	0.64	NaN	NaN	NaN	3	8
0	9.22	0.29	NaN	NaN	NaN	3	8
0	11.95	0.38	NaN	NaN	NaN	3	8
0	13.08	0.48	NaN	NaN	NaN	3	8
0	10.83	0.3	NaN	NaN	NaN	3	8
0	12.38	0.43	NaN	NaN	NaN	3	8
0	14.06	0.83	NaN	NaN	NaN	3	8
0	10.15	0.23	NaN	NaN	NaN	3	8
0	12.44	0.41	NaN	NaN	NaN	3	8
45	18.84	1.38	NaN	NaN	NaN	3	8
45	17.27	1.18	37.78	14.6	NaN	3	8
45	17.2	1.07	45.5	9.95	NaN	3	8
45	13.5	0.61	NaN	NaN	NaN	3	8
45	12.4	0.49	NaN	NaN	NaN	3	8
45	12.11	0.41	NaN	NaN	NaN	3	8
45	13.14	0.57	NaN	NaN	NaN	3	8
45	11.89	0.39	NaN	NaN	NaN	3	8
45	12.75	0.47	NaN	NaN	NaN	3	8
45	16.77	1	NaN	NaN	NaN	3	8
45	10.94	0.28	NaN	NaN	NaN	3	8
45	13.01	0.48	NaN	NaN	NaN	3	8
93	NaN	NaN	NaN	NaN	433.8	3	8
93	NaN	NaN	NaN	NaN	303.2	3	8
93	NaN	NaN	NaN	NaN	362.4	3	8
93	13.96	0.65	21.9	NaN	241.6	3	8
93	13.37	0.54	25.2	NaN	189.8	3	8
93	12.17	0.42	5.2	NaN	130.9	3	8
93	13.25	0.51	10	NaN	175.2	3	8
93	12.73	0.49	20.3	NaN	183.8	3	8
93	12.96	0.5	11.8	NaN	172.3	3	8
93	18.18	1.28	39.7	NaN	451	3	8
93	12.65	0.41	12.7	NaN	138.4	3	8
93	14.68	0.64	22.4	NaN	204.6	3	8
];
data.tL93_8F3 =  [tLWT_8F3(4:12,2) tLWT_8F3(28:36,2)]; bibkey.tL93_8F3 = {'Ball2017'};
units.tL93_8F3= {'mm', 'mm'};  label.tL93_8F3 = {'initial length', 'final length'};  
expTime.tL93_8F3 = 93; units.expTime.tL93_8F3 = 'd'; label.expTime.tL93_8F3 = 'duration';
comment.tL93_8F3 = '93 days of growth'; 
expLength.tL93_8F3 = 93 * ones(length(data.tL93_8F3),1); units.expLength.tL93_8F3 = 'day'; 
label.expLength.tL93_8F3 = 'experiment duration';

% data.tL45_8F3 =  [tLWT_8F3(1:12,2) tLWT_8F3(13:24,2)]; bibkey.tL45_8F3 = {'Ball2017'};
% units.tL45_8F3 = {'mm', 'mm'};  label.tL45_8F3 = {'initial length', 'final length'};  
% expTime.tL45_8F3 = 45; units.expTime.tL45_8F3 = 'd'; label.expTime.tL45_8F3 = 'duration';
% comment.tL45_8F3 = '45 days of growth'; 
% 
% data.LWd45_8F3 =  [tLWT_8F3(14:15,2) tLWT_8F3(14:15,4)]; bibkey.LWd45_8F3 = {'Ball2017'};
% units.LWd45_8F3 = {'mm', 'mg'};  label.LWd45_8F3 = {'initial length', 'final dry weight'};  
% expTime.LWd45_8F3 = 93; units.expTime.LWd45_8F3 = 'd'; label.expTime.LWd45_8F3 = 'duration';
% comment.LWd45_8F3 = ' dry weight of tissue after 45 days of growth for each individual'; 
% 
data.LWd93_8F3 =  [tLWT_8F3(28:36,2) tLWT_8F3(28:36,4)]; bibkey.LWd93_8F3 = {'Ball2017'};
units.LWd93_8F3 = {'mm', 'mg'};  label.LWd93_8F3 = {'initial length', 'final dry weight'};  
expTime.LWd93_8F3 = 93; units.expTime.LWd93_8F3 = 'd'; label.expTime.LWd93_8F3 = 'duration';
comment.LWd93_8F3 = ' dry weight of tissue after 93 days of growth for each individual'; 
expLength.LWd93_8F3 = 93 * ones(length(data.LWd93_8F3),1); units.expLength.LWd93_8F3 = 'day'; 
label.expLength.LWd93_8F3 = 'experiment duration';

% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_8F3 =  [tLWT_8F3(4:12,3) tLWT_8F3(28:36,3)];
% units.tWw93_8F3 = {'g', 'g'};  label.tWw93 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_8F3 = 93; units.expTime.tWw93 = 'd'; label.expTime.tWw93 = 'duration';
% comment.tWw93_8F3 = '93 days of growth'; 
% 
% data.tWw45_8F3 =  [tLWT_8F3(1:12,3) tLWT_8F3(13:24,3); tLWT_8F3(11,3) tLWT_8F3(22,3)];
% units.tWw45_8F3 = {'g', 'g'};  label.tWw45_8F3 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_8F3 = 45; units.expTime.tWw45_8F3 = 'd'; label.expTime.tWw45_8F3 = 'duration';
% comment.tWw45_8F3


%%%%%%% T8 food 2

% tLWT_8F2 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	11.33	0.28	NaN	NaN	NaN	2	8
% 0	15.91	0.88	NaN	NaN	NaN	2	8
% 0	11.29	NaN	NaN	NaN	NaN	2	8
% 0	13.04	0.52	NaN	NaN	NaN	2	8
% 0	15.34	0.82	NaN	NaN	NaN	2	8
% 0	14.77	0.69	NaN	NaN	NaN	2	8
% 0	12.45	0.44	NaN	NaN	NaN	2	8
% 0	14.52	0.64	NaN	NaN	NaN	2	8
% 0	12.31	0.4	NaN	NaN	NaN	2	8
% 0	11.27	0.33	NaN	NaN	NaN	2	8
% 0	14.76	0.68	NaN	NaN	NaN	2	8
% 0	13.13	0.53	NaN	NaN	NaN	2	8
% 0	13.27	0.58	NaN	NaN	NaN	2	8
% 0	12.94	0.46	NaN	NaN	NaN	2	8
% 45	12.9	0.42	17.89	4.11	NaN	2	8
% 45	16.5	1.06	40.9	13.07	NaN	2	8
% 45	12.67	0.44	14.32	4.02	NaN	2	8
% 45	13.14	0.53	NaN	NaN	NaN	2	8
% 45	15.6	0.78	NaN	NaN	NaN	2	8
% 45	15.14	0.75	NaN	NaN	NaN	2	8
% 45	13.06	0.5	NaN	NaN	NaN	2	8
% 45	15.65	0.81	NaN	NaN	NaN	2	8
% 45	12.71	0.51	NaN	NaN	NaN	2	8
% 45	12.3	0.45	NaN	NaN	NaN	2	8
% 45	14.86	0.66	NaN	NaN	NaN	2	8
% 45	13.96	0.62	NaN	NaN	NaN	2	8
% 45	15.19	0.78	NaN	NaN	NaN	2	8
% 45	13.06	0.5	NaN	NaN	NaN	2	8
% 93	NaN	NaN	NaN	NaN	140.9	2	8
% 93	NaN	NaN	NaN	NaN	326.7	2	8
% 93	NaN	NaN	NaN	NaN	145.2	2	8
% 93	13.18	0.55	5.2	NaN	188.7	2	8
% 93	16.17	0.91	9.5	NaN	295.6	2	8
% 93	16.51	0.77	16.5	NaN	294.7	2	8
% 93	14.69	0.67	18.9	NaN	226	2	8
% 93	17.7	1.12	22.2	NaN	373.6	2	8
% 93	13.33	0.51	11.2	NaN	194.6	2	8
% 93	14.17	0.59	14.6	NaN	219.6	2	8
% 93	14.97	0.7	10.7	NaN	244.5	2	8
% 93	14.39	0.69	11.2	NaN	244.4	2	8
% 93	17.21	1.12	23.7	NaN	409.6	2	8
% 93	15.27	0.74	20.9	NaN	265.3	2	8
% 
% 
% ];
% data.tL93_8F2=  [tLWT_8F2(4:14,2) tLWT_8F2(32:42,2)]; bibkey.tL93_8F2= {'Ball2017'};
% units.tL93_8F2= {'mm', 'mm'};  label.tL93_8F2= {'initial length', 'final length'};  
% expTime.tL93_8F2= 93; units.expTime.tL93_8F2= 'd'; label.expTime.tL93_8F2= 'duration';
% comment.tL93_8F2= '93 days of growth'; 
% 
% data.tL45_8F2=  [tLWT_8F2(1:14,2) tLWT_8F2(15:28,2)]; bibkey.tL45_8F2= {'Ball2017'};
% units.tL45_8F2= {'mm', 'mm'};  label.tL45_8F2= {'initial length', 'final length'};  
% expTime.tL45_8F2= 45; units.expTime.tL45_8F2= 'd'; label.expTime.tL45_8F2= 'duration';
% comment.tL45_8F2= '45 days of growth'; 
% 
% data.LWd45_8F2=  [tLWT_8F2(15:17,2) tLWT_8F2(15:17,4)]; bibkey.LWd45_8F2= {'Ball2017'};
% units.LWd45_8F2= {'mm', 'mg'};  label.LWd45_8F2= {'initial length', 'final dry weight'};  
% expTime.LWd45_8F2= 93; units.expTime.LWd45_8F2= 'd'; label.expTime.LWd45_8F2= 'duration';
% comment.LWd45_8F2= ' dry weight of tissue after 45 days of growth for each individual'; 
% 
% data.LWd93_8F2=  [tLWT_8F2(32:42,2) tLWT_8F2(32:42,4)]; bibkey.LWd93_8F2= {'Ball2017'};
% units.LWd93_8F2= {'mm', 'mg'};  label.LWd93_8F2= {'initial length', 'final dry weight'};  
% expTime.LWd93_8F2= 93; units.expTime.LWd93_8F2= 'd'; label.expTime.LWd93_8F2= 'duration';
% comment.LWd93_8F2= ' dry weight of tissue after 93 days of growth for each individual'; 
% 
% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_8F2=  [tLWT_8F2(4:14,3) tLWT_8F2(32:42,3)];
% units.tWw93_8F2= {'g', 'g'};  label.tWw93 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_8F2= 93; units.expTime.tWw93 = 'd'; label.expTime.tWw93 = 'duration';
% comment.tWw93_8F2= '93 days of growth'; 
% 
% data.tWw45_8F2=  [tLWT_8F2(1:2,3) tLWT_8F2(4:14,3); tLWT_8F2(15:16,3) tLWT_8F2(18:28,3)];
% units.tWw45_8F2= {'g', 'g'};  label.tWw45_8F2= {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_8F2= 45; units.expTime.tWw45_8F2= 'd'; label.expTime.tWw45_8F2= 'duration';
% comment.tWw45_8F2


%%%%%T8 food 1
% tLWT_8F1 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	15.41	0.89	NaN	NaN	NaN	1	8
% 0	13.76	0.63	NaN	NaN	NaN	1	8
% 0	14.44	0.67	NaN	NaN	NaN	1	8
% 0	14.1	0.66	NaN	NaN	14.29	1	8
% 0	14.08	0.71	NaN	NaN	14.84	1	8
% 0	14.2	0.61	NaN	NaN	14.35	1	8
% 0	14.69	0.78	NaN	NaN	14.77	1	8
% 0	13.99	0.57	NaN	NaN	14.03	1	8
% 0	10.48	0.29	NaN	NaN	10.56	1	8
% 0	12.9	0.51	NaN	NaN	13.28	1	8
% 45	15.66	0.91	21.2	7.36	NaN	1	8
% 45	13.87	0.61	13.46	4.95	NaN	1	8
% 45	14.51	0.68	14.77	5.85	NaN	1	8
% 45	14.17	0.61	NaN	NaN	NaN	1	8
% 45	14.29	0.68	NaN	NaN	NaN	1	8
% 45	14.36	0.61	NaN	NaN	NaN	1	8
% 45	14.84	0.72	NaN	NaN	NaN	1	8
% 45	13.88	0.57	NaN	NaN	NaN	1	8
% 45	10.54	0.32	NaN	NaN	NaN	1	8
% 45	12.98	0.52	NaN	NaN	NaN	1	8
% 93	NaN	NaN	NaN	NaN	267.8	1	8
% 93	NaN	NaN	NaN	NaN	170.2	1	8
% 93	NaN	NaN	NaN	NaN	151	1	8
% 93	14.29	0.63	7.2	NaN	200.8	1	8
% 93	14.84	0.69	8.6	NaN	195.6	1	8
% 93	14.35	0.61	4.8	NaN	184	1	8
% 93	14.77	0.71	6.5	NaN	186.4	1	8
% 93	14.03	0.59	5.9	NaN	190.2	1	8
% 93	10.56	0.26	3	NaN	84.6	1	8
% 93	13.28	0.53	7.4	NaN	160	1	8
% ];


% data.tL93_8F1=  [tLWT_8F1(4:10,2) tLWT_8F1(24:30,2)]; bibkey.tL93_8F1= {'Ball2017'};
% units.tL93_8F1= {'mm', 'mm'};  label.tL93_8F1= {'initial length', 'final length'};  
% expTime.tL93_8F1= 93; units.expTime.tL93_8F1= 'd'; label.expTime.tL93_8F1= 'duration';
% comment.tL93_8F1= '93 days of growth'; 
% expLength.tL93_8F1 = 93 * ones(length(data.tL93_8F1),1); units.expLength.tL93_8F1 = 'day'; 
% label.expLength.tL93_8F1 = 'experiment duration';


% data.tL45_8F1=  [tLWT_8F1(1:10,2) tLWT_8F1(11:20,2)]; bibkey.tL45_8F1= {'Ball2017'};
% units.tL45_8F1= {'mm', 'mm'};  label.tL45_8F1= {'initial length', 'final length'};  
% expTime.tL45_8F1= 45; units.expTime.tL45_8F1= 'd'; label.expTime.tL45_8F1= 'duration';
% comment.tL45_8F1= '45 days of growth'; 
% 
% data.LWd45_8F1=  [tLWT_8F1(11:13,2) tLWT_8F1(11:13,4)]; bibkey.LWd45_8F1= {'Ball2017'};
% units.LWd45_8F1= {'mm', 'mg'};  label.LWd45_8F1= {'initial length', 'final dry weight'};  
% expTime.LWd45_8F1= 93; units.expTime.LWd45_8F1= 'd'; label.expTime.LWd45_8F1= 'duration';
% comment.LWd45_8F1= ' dry weight of tissue after 45 days of growth for each individual'; 

% data.LWd93_8F1=  [tLWT_8F1(24:30,2) tLWT_8F1(24:30,4)]; bibkey.LWd93_8F1= {'Ball2017'};
% units.LWd93_8F1= {'mm', 'mg'};  label.LWd93_8F1= {'initial length', 'final dry weight'};  
% expTime.LWd93_8F1= 93; units.expTime.LWd93_8F1= 'd'; label.expTime.LWd93_8F1= 'duration';
% comment.LWd93_8F1= ' dry weight of tissue after 93 days of growth for each individual'; 
% expLength.LWd93_8F1 = 93 * ones(length(data.LWd93_8F1),1); units.expLength.LWd93_8F1 = 'day'; 
% label.expLength.LWd93_8F1 = 'experiment duration';

% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_8F1=  [tLWT_8F1(4:10,3) tLWT_8F1 (24:30,3)];
% units.tWw93_8F1= {'g', 'g'};  label.tWw93_8F1 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_8F1= 93; units.expTime.tWw93_8F1 = 'd'; label.expTime.tWw93_8F1 = 'duration';
% comment.tWw93_8F1= '93 days of growth'; 
% 
% data.tWw45_8F1=  [tLWT_8F1(1:10,3) tLWT_8F1(11:21,3)];
% units.tWw45_8F1= {'g', 'g'};  label.tWw45_8F1= {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_8F1= 45; units.expTime.tWw45_8F1= 'd'; label.expTime.tWw45_8F1= 'duration';
% comment.tWw45_8F1



%%%%t8 food 0

% tLWT_8F0 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	11.18	0.37	NaN	NaN	NaN	0	8
% 0	15.03	0.73	NaN	NaN	NaN	0	8
% 0	10.4	0.39	NaN	NaN	NaN	0	8
% 0	11.66	0.36	NaN	NaN	11.77	0	8
% 45	11.25	0.32	7.85	2.46	NaN	0	8
% 45	15.15	0.71	17.06	6.07	NaN	0	8
% 45	12.17	0.42	9.47	0.74	NaN	0	8
% 45	11.76	0.32	NaN	NaN	NaN	0	8
% 93	NaN	NaN	NaN	NaN	99.3	0	8
% 93	NaN	NaN	NaN	NaN	212.4	0	8
% 93	NaN	NaN	NaN	NaN	104.7	0	8
% 93	11.77	0.33	4.8	NaN	102	0	8
% 
% ];

% data.tL93_8F0=  [tLWT_8F0(4,2) tLWT_8F0(12,2)]; bibkey.tL93_8F0= {'Ball2017'};
% units.tL93_8F0= {'mm', 'mm'};  label.tL93_8F0= {'initial length', 'final length'};  
% expTime.tL93_8F0= 93; units.expTime.tL93_8F0= 'd'; label.expTime.tL93_8F0= 'duration';
% comment.tL93_8F0= '93 days of growth'; 

% data.tL45_8F0=  [tLWT_8F0(1:4,2) tLWT_8F0(5:8,2)]; bibkey.tL45_8F0= {'Ball2017'};
% units.tL45_8F0= {'mm', 'mm'};  label.tL45_8F0= {'initial length', 'final length'};  
% expTime.tL45_8F0= 45; units.expTime.tL45_8F0= 'd'; label.expTime.tL45_8F0= 'duration';
% comment.tL45_8F0= '45 days of growth'; 
% 
% data.LWd45_8F0=  [tLWT_8F0(5:7,2) tLWT_8F0(5:7,4)]; bibkey.LWd45_8F0= {'Ball2017'};
% units.LWd45_8F0= {'mm', 'mg'};  label.LWd45_8F0= {'initial length', 'final dry weight'};  
% expTime.LWd45_8F0= 93; units.expTime.LWd45_8F0= 'd'; label.expTime.LWd45_8F0= 'duration';
% comment.LWd45_8F0= ' dry weight of tissue after 45 days of growth for each individual'; 

% data.LWd93_8F0=  [tLWT_8F0(12,2) tLWT_8F0(12,4)]; bibkey.LWd93_8F0= {'Ball2017'};
% units.LWd93_8F0= {'mm', 'mg'};  label.LWd93_8F0= {'initial length', 'final dry weight'};  
% expTime.LWd93_8F0= 93; units.expTime.LWd93_8F0= 'd'; label.expTime.LWd93_8F0= 'duration';
% comment.LWd93_8F0= ' dry weight of tissue after 93 days of growth for each individual'; 

% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_8F0=  [tLWT(4,3) tLWT_8F0 (12,3)];
% units.tWw93_8F0= {'g', 'g'};  label.tWw93_8F0 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_8F0= 93; units.expTime.tWw93_8F0 = 'd'; label.expTime.tWw93_8F0 = 'duration';
% comment.tWw93_8F0= '93 days of growth'; 
% 
% data.tWw45_8F0=  [tLWT_8F0(1:4,3) tLWT_8F0(5:8,3)];
% units.tWw45_8F0= {'g', 'g'};  label.tWw45_8F0= {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_8F0= 45; units.expTime.tWw45_8F0= 'd'; label.expTime.tWw45_8F0= 'duration';
% comment.tWw45_8F0



%%%%%%%%%%%%%%%%%%%%%%%%%TEMPERATURE 13

%%%%%%%%%%%%%%%%%%%T13 FOOD 3
tLWT_13F3 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
0	14.66	0.73	NaN	NaN	NaN	3	13
0	14.06	0.65	NaN	NaN	NaN	3	13
0	15.7	0.99	NaN	NaN	NaN	3	13
0	11.13	0.33	NaN	NaN	NaN	3	13
0	12.53	0.44	NaN	NaN	NaN	3	13
0	14.88	0.9	NaN	NaN	NaN	3	13
0	9.58	0.28	NaN	NaN	NaN	3	13
0	11.34	0.42	NaN	NaN	NaN	3	13
0	11.93	0.36	NaN	NaN	NaN	3	13
0	14.53	0.72	NaN	NaN	NaN	3	13
0	11.54	0.44	NaN	NaN	NaN	3	13
45	15.81	0.83	28.76	6.68	NaN	3	13
45	15.28	0.69	30.31	7.83	NaN	3	13
45	16.96	1.15	47.58	10.21	NaN	3	13
45	13.66	0.62	NaN	NaN	NaN	3	13
45	13.77	0.65	NaN	NaN	NaN	3	13
45	16.6	1.07	NaN	NaN	NaN	3	13
45	9.88	0.26	NaN	NaN	NaN	3	13
45	13.07	0.59	NaN	NaN	NaN	3	13
45	12.21	0.46	NaN	NaN	NaN	3	13
45	15.09	0.87	NaN	NaN	NaN	3	13
45	14.3	0.72	NaN	NaN	NaN	3	13
93	NaN	NaN	NaN	NaN	205.3	3	13
93	NaN	NaN	NaN	NaN	209.4	3	13
93	NaN	NaN	NaN	NaN	378.6	3	13
93	13.8	0.55	13.4	NaN	214.8	3	13
93	13.93	0.6	23.2	NaN	222.2	3	13
93	17.07	1.18	33.5	NaN	384.6	3	13
93	10.01	0.22	7.2	NaN	77.3	3	13
93	14.13	0.67	32.9	NaN	252.4	3	13
93	13.42	0.51	10.8	NaN	186	3	13
93	18.02	1.16	29.5	NaN	380.9	3	13
93	17.73	1.07	49.5	NaN	366.6	3	13
];

data.tL93_13F3=  [tLWT_13F3(4:11,2) tLWT_13F3(26:33,2)]; bibkey.tL93_13F3= {'Ball2017'};
units.tL93_13F3= {'mm', 'mm'};  label.tL93_13F3= {'initial length', 'final length'};  
expTime.tL93_13F3= 93; units.expTime.tL93_13F3= 'd'; label.expTime.tL93_13F3= 'duration';
comment.tL93_13F3= '93 days of growth T13F3'; 
expLength.tL93_13F3 = 93 * ones(length(data.tL93_13F3),1); units.expLength.tL93_13F3 = 'day'; 
label.expLength.tL93_13F3 = 'experiment duration';

% data.tL45_13F3=  [tLWT_13F3(1:11,2) tLWT_13F3(12:22,2)]; bibkey.tL45_13F3= {'Ball2017'};
% units.tL45_13F3= {'mm', 'mm'};  label.tL45_13F3= {'initial length', 'final length 45d T13F3'};  
% expTime.tL45_13F3= 45; units.expTime.tL45_13F3= 'd'; label.expTime.tL45_13F3= 'duration';
% comment.tL45_13F3= '45 days of growth'; 

% data.LWd45_13F3=  [tLWT_13F3(12:14,2) tLWT_13F3(12:14,4)]; bibkey.LWd45_13F3= {'Ball2017'};
% units.LWd45_13F3= {'mm', 'mg'};  label.LWd45_13F3= {'initial length', 'final dry weight 45d T13F3'};  
% expTime.LWd45_13F3= 93; units.expTime.LWd45_13F3= 'd'; label.expTime.LWd45_13F3= 'duration';
% comment.LWd45_13F3= ' dry weight of tissue after 45 days of growth for each individual'; 

data.LWd93_13F3=  [tLWT_13F3(26:33,2) tLWT_13F3(26:33,4)]; bibkey.LWd93_13F3= {'Ball2017'};
units.LWd93_13F3= {'mm', 'mg'};  label.LWd93_13F3= {'initial length', 'final dry weight'};  
expTime.LWd93_13F3= 93; units.expTime.LWd93_13F3= 'd'; label.expTime.LWd93_13F3= 'duration';
comment.LWd93_13F3= ' dry weight of tissue after 93 days of growth for each individual'; 
expLength.LWd93_13F3= 93 * ones(length(data.LWd93_13F3),1); units.expLength.LWd93_13F3 = 'day'; 
label.expLength.LWd93_13F3 = 'experiment duration';


% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_13F3=  [tLWT(4:11,3) tLWT_13F3 (26:33,3)];
% units.tWw93_13F3= {'g', 'g'};  label.tWw93_13F3 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_13F3= 93; units.expTime.tWw93_13F3 = 'd'; label.expTime.tWw93_13F3 = 'duration';
% comment.tWw93_13F3= '93 days of growth'; 
% 
% data.tWw45_13F3=  [tLWT_13F3(1:11,3) tLWT_13F3(12:22,3)];
% units.tWw45_13F3= {'g', 'g'};  label.tWw45_13F3= {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_13F3= 45; units.expTime.tWw45_13F3= 'd'; label.expTime.tWw45_13F3= 'duration';
% comment.tWw45_13F3


%%%%%%%%%%%%%%%%%%%%%%%%%%%T13 FOOD 2

% tLWT_13F2 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	15.72	0.91	NaN	NaN	NaN	2	13
% 0	10.94	0.28	NaN	NaN	NaN	2	13
% 0	12.26	0.34	NaN	NaN	NaN	2	13
% 0	12.34	0.45	NaN	NaN	NaN	2	13
% 0	16.46	0.93	NaN	NaN	NaN	2	13
% 0	13.37	0.55	NaN	NaN	NaN	2	13
% 0	12.68	0.48	NaN	NaN	NaN	2	13
% 0	15.72	0.82	NaN	NaN	NaN	2	13
% 0	11.81	0.34	NaN	NaN	NaN	2	13
% 0	15.78	0.76	NaN	NaN	NaN	2	13
% 0	15.62	0.9	NaN	NaN	NaN	2	13
% 0	13.92	0.59	NaN	NaN	NaN	2	13
% 0	11.59	0.35	NaN	NaN	NaN	2	13
% 45	15.78	0.98	NaN	NaN	NaN	2	13
% 45	11.4	0.35	13.33	3.22	NaN	2	13
% 45	13.44	0.48	21.82	5.3	NaN	2	13
% 45	12.6	0.55	NaN	NaN	NaN	2	13
% 45	16.86	1.12	NaN	NaN	NaN	2	13
% 45	14.33	0.8	NaN	NaN	NaN	2	13
% 45	13.29	0.6	NaN	NaN	NaN	2	13
% 45	15.75	0.84	NaN	NaN	NaN	2	13
% 45	12.62	0.4	NaN	NaN	NaN	2	13
% 45	16.48	0.97	NaN	NaN	NaN	2	13
% 45	15.89	0.96	NaN	NaN	NaN	2	13
% 45	15.36	0.77	NaN	NaN	NaN	2	13
% 45	11.84	0.37	NaN	NaN	NaN	2	13
% 93	NaN	NaN	NaN	NaN	198.4	2	13
% 93	NaN	NaN	NaN	NaN	114.1	2	13
% 93	NaN	NaN	NaN	NaN	159.6	2	13
% 93	12.71	0.49	6.5	NaN	165.4	2	13
% 93	18.5	1.4	27.1	NaN	437.8	2	13
% 93	16.59	0.94	24.2	NaN	329.8	2	13
% 93	14.75	0.7	18.8	NaN	239.6	2	13
% 93	16.11	0.9	19.6	NaN	281.4	2	13
% 93	12.99	0.45	10.6	NaN	148.5	2	13
% 93	18.33	1.26	32.8	NaN	418.2	2	13
% 93	16.75	1.12	18.3	NaN	361.8	2	13
% 93	16.51	0.93	17.7	NaN	302.2	2	13
% 93	12.58	0.44	14.3	NaN	152.8	2	13
% ];
% 
% 
% data.tL93_13F2=  [tLWT_13F2(4:13,2) tLWT_13F2(30:39,2)]; bibkey.tL93_13F2= {'Ball2017'};
% units.tL93_13F2= {'mm', 'mm'};  label.tL93_13F2= {'initial length', 'final length'};  
% expTime.tL93_13F2= 93; units.expTime.tL93_13F2= 'd'; label.expTime.tL93_13F2= 'duration';
% comment.tL93_13F2= '93 days of growth T13F2'; 
% 
% data.tL45_13F2=  [tLWT_13F2(1:13,2) tLWT_13F2(14:26,2)]; bibkey.tL45_13F2= {'Ball2017'};
% units.tL45_13F2= {'mm', 'mm'};  label.tL45_13F2= {'initial length', 'final length 45d T13F2'};  
% expTime.tL45_13F2= 45; units.expTime.tL45_13F2= 'd'; label.expTime.tL45_13F2= 'duration';
% comment.tL45_13F2= '45 days of growth'; 
% 
% data.LWd45_13F2=  [tLWT_13F2(15:16,2) tLWT_13F2(15:16,4)]; bibkey.LWd45_13F2= {'Ball2017'};
% units.LWd45_13F2= {'mm', 'mg'};  label.LWd45_13F2= {'initial length', 'final dry weight 45d T13F2'};  
% expTime.LWd45_13F2= 93; units.expTime.LWd45_13F2= 'd'; label.expTime.LWd45_13F2= 'duration';
% comment.LWd45_13F2= ' dry weight of tissue after 45 days of growth for each individual'; 
% 
% data.LWd93_13F2=  [tLWT_13F2(30:33,2) tLWT_13F2(30:33,4)]; bibkey.LWd93_13F2= {'Ball2017'};
% units.LWd93_13F2= {'mm', 'mg'};  label.LWd93_13F2= {'initial length', 'final dry weight 93d T13F2'};  
% expTime.LWd93_13F2= 93; units.expTime.LWd93_13F2= 'd'; label.expTime.LWd93_13F2= 'duration';
% comment.LWd93_13F2= ' dry weight of tissue after 93 days of growth for each individual'; 

% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_13F2=  [tLWT(4:13,3) tLWT_13F2 (30:39,3)];
% units.tWw93_13F2= {'g', 'g'};  label.tWw93_13F2 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_13F2= 93; units.expTime.tWw93_13F2 = 'd'; label.expTime.tWw93_13F2 = 'duration';
% comment.tWw93_13F2= '93 days of growth'; 
% 
% data.tWw45_13F2=  [tLWT_13F2(1:13,3) tLWT_13F2(14:26,3)];
% units.tWw45_13F2= {'g', 'g'};  label.tWw45_13F2= {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_13F2= 45; units.expTime.tWw45_13F2= 'd'; label.expTime.tWw45_13F2= 'duration';
% comment.tWw45_13F2

%%%%%%%%%%%%%%%%%%%T13 FOOD 1

% tLWT_13F1 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	16.07	0.92	NaN	NaN	NaN	1	13
% 0	15.97	0.97	NaN	NaN	NaN	1	13
% 0	15.71	0.93	NaN	NaN	NaN	1	13
% 0	11.87	0.44	NaN	NaN	NaN	1	13
% 0	13.83	0.56	NaN	NaN	NaN	1	13
% 0	12.97	0.53	NaN	NaN	NaN	1	13
% 0	NaN	NaN	NaN	NaN	NaN	1	13
% 0	12.46	0.41	NaN	NaN	NaN	1	13
% 0	13.07	0.44	NaN	NaN	NaN	1	13
% 0	14.53	0.73	NaN	NaN	NaN	1	13
% 45	16.26	0.93	23.76	10.58	NaN	1	13
% 45	16.07	0.99	25.81	10.1	NaN	1	13
% 45	15.84	0.99	26.59	11.13	NaN	1	13
% 45	12.94	0.48	NaN	NaN	NaN	1	13
% 45	13.89	0.62	NaN	NaN	NaN	1	13
% 45	14.25	0.72	NaN	NaN	NaN	1	13
% 45	11.93	0.36	NaN	NaN	NaN	1	13
% 45	12.5	0.47	NaN	NaN	NaN	1	13
% 45	13.12	0.51	NaN	NaN	NaN	1	13
% 45	15.57	0.82	NaN	NaN	NaN	1	13
% 93	NaN	NaN	NaN	NaN	229.5	1	13
% 93	NaN	NaN	NaN	NaN	267.5	1	13
% 93	NaN	NaN	NaN	NaN	277.7	1	13
% 93	12.83	0.43	3.8	NaN	139.9	1	13
% 93	13.91	0.57	9.5	NaN	171.8	1	13
% 93	14.76	0.7	12.9	NaN	249.6	1	13
% 93	11.83	0.33	2.8	NaN	104.7	1	13
% 93	12.56	0.4	4.8	NaN	107.8	1	13
% 93	13.12	0.43	8.1	NaN	121.2	1	13
% 93	15.57	0.74	7.6	NaN	194.2	1	13
% ];

% data.tL93_13F1=  [tLWT_13F1(4:6,2) tLWT_13F1(24:26,2); tLWT_13F1(8:10,2) tLWT_13F1(28:30,2)]; bibkey.tL93_13F1= {'Ball2017'};
% units.tL93_13F1= {'mm', 'mm'};  label.tL93_13F1= {'initial length', 'final length'};  
% expTime.tL93_13F1= 93; units.expTime.tL93_13F1= 'd'; label.expTime.tL93_13F1= 'duration';
% comment.tL93_13F1= '93 days of growth  T13F1'; 
% expLength.tL93_13F1 = 93 * ones(length(data.tL93_13F1),1); units.expLength.tL93_13F1 = 'day'; 
% label.expLength.tL93_13F1 = 'experiment duration';

% 
% data.tL45_13F1=  [tLWT_13F1(1:6,2) tLWT_13F1(11:16,2);  tLWT_13F1(8:10,2) tLWT_13F1(18:20,2)]; bibkey.tL45_13F1= {'Ball2017'};
% units.tL45_13F1= {'mm', 'mm'};  label.tL45_13F1= {'initial length', 'final length 45d T13F1'};  
% expTime.tL45_13F1= 45; units.expTime.tL45_13F1= 'd'; label.expTime.tL45_13F1= 'duration';
% comment.tL45_13F1= '45 days of growth'; 

% data.LWd45_13F1=  [tLWT_13F1(11:13,2) tLWT_13F1(11:13,4)]; bibkey.LWd45_13F1= {'Ball2017'};
% units.LWd45_13F1= {'mm', 'mg'};  label.LWd45_13F1= {'initial length', 'final dry weight 45d T13F1'};  
% expTime.LWd45_13F1= 93; units.expTime.LWd45_13F1= 'd'; label.expTime.LWd45_13F1= 'duration';
% comment.LWd45_13F1= ' dry weight of tissue after 45 days of growth for each individual'; 

% data.LWd93_13F1=  [tLWT_13F1(24:30,2) tLWT_13F1(24:30,4)]; bibkey.LWd93_13F1= {'Ball2017'};
% units.LWd93_13F1= {'mm', 'mg'};  label.LWd93_13F1= {'initial length', 'final dry weight 93d T13F1'};  
% expTime.LWd93_13F1= 93; units.expTime.LWd93_13F1= 'd'; label.expTime.LWd93_13F1= 'duration';
% comment.LWd93_13F1= ' dry weight of tissue after 93 days of growth for each individual'; 
% expLength.LWd93_13F1 = 93 * ones(length(data.tL93_13F1),1); units.expLength.LWd93_13F1 = 'day'; 
% label.expLength.LWd93_13F1 = 'experiment duration';

% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_13F1=  [tLWT_13F1(4:6,3) tLWT_13F1 (24:26,3); tLWT_13F1 (8:10,3) tLWT_13F1 (28:30,3)];
% units.tWw93_13F1= {'g', 'g'};  label.tWw93_13F1 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_13F1= 93; units.expTime.tWw93_13F1 = 'd'; label.expTime.tWw93_13F1 = 'duration';
% comment.tWw93_13F1= '93 days of growth'; 
% 
% data.tWw45_13F1=  [tLWT_13F1(1:6,3) tLWT_13F1(11:16,3); tLWT_13F1(8:10,3) tLWT_13F1(18:20,3)];
% units.tWw45_13F1= {'g', 'g'};  label.tWw45_13F1= {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_13F1= 45; units.expTime.tWw45_13F1= 'd'; label.expTime.tWw45_13F1= 'duration';
% comment.tWw45_13F1

% %%%%%%%%%%%%%%%T13 FOOD 0
% tLWT_13F0 = [ ... Time	L_mm	WW_total_g	Wd_tissue_mg	W_ash_mg	W_shell_mg	Food	Temperature
% 0	12.17	0.43	NaN	NaN	NaN	0	13
% 0	16.05	0.91	NaN	NaN	NaN	0	13
% 0	15.49	0.87	NaN	NaN	NaN	0	13
% 0	13.33	0.58	NaN	NaN	NaN	0	13
% 0	15	0.81	NaN	NaN	NaN	0	13
% 0	14.75	0.64	NaN	NaN	NaN	0	13
% 0	15.06	0.86	NaN	NaN	NaN	0	13
% 0	11.56	0.52	NaN	NaN	NaN	0	13
% 0	13.4	0.59	NaN	NaN	NaN	0	13
% 0	15.72	0.92	NaN	NaN	NaN	0	13
% 0	12.62	0.46	NaN	NaN	NaN	0	13
% 45	12.28	0.46	6.77	2.2	NaN	0	13
% 45	16.17	0.94	20.86	9.31	NaN	0	13
% 45	15.45	0.8	16.37	NaN	NaN	0	13
% 45	13.34	0.63	NaN	NaN	NaN	0	13
% 45	15.01	0.87	NaN	NaN	NaN	0	13
% 45	14.78	0.67	NaN	NaN	NaN	0	13
% 45	14.91	0.83	NaN	NaN	NaN	0	13
% 45	12.89	0.54	NaN	NaN	NaN	0	13
% 45	13.38	0.57	NaN	NaN	NaN	0	13
% 45	15.79	0.87	NaN	NaN	NaN	0	13
% 45	12.65	0.42	NaN	NaN	NaN	0	13
% 93	NaN	NaN	NaN	NaN	118.6	0	13
% 93	NaN	NaN	NaN	NaN	209.1	0	13
% 93	NaN	NaN	NaN	NaN	212.2	0	13
% 93	13.4	0.54	5.8	NaN	158.4	0	13
% 93	15.04	0.79	8.5	NaN	219.4	0	13
% 93	14.61	0.61	3.8	NaN	172.3	0	13
% 93	15.05	0.77	7.8	NaN	222.3	0	13
% 93	12.97	0.47	5.7	NaN	149.6	0	13
% 93	13.5	0.5	6.9	NaN	138.4	0	13
% 93	15.66	0.84	6.6	NaN	222.5	0	13
% 93	12.63	0.41	5.4	NaN	129.8	0	13
% 
% 
% ];
% 
% data.tL93_13F0=  [tLWT_13F0(4:11,2) tLWT_13F0(26:33,2)]; bibkey.tL93_13F0= {'Ball2017'};
% units.tL93_13F0= {'mm', 'mm'};  label.tL93_13F0= {'initial length', 'final length'};  
% expTime.tL93_13F0= 93; units.expTime.tL93_13F0= 'd'; label.expTime.tL93_13F0= 'duration';
% comment.tL93_13F0= '93 days of growth  T13F0'; 
% 
% data.tL45_13F0=  [tLWT_13F0(1:11,2) tLWT_13F0(12:22,2)]; bibkey.tL45_13F0= {'Ball2017'};
% units.tL45_13F0= {'mm', 'mm'};  label.tL45_13F0= {'initial length', 'final length 45d T13F0'};  
% expTime.tL45_13F0= 45; units.expTime.tL45_13F0= 'd'; label.expTime.tL45_13F0= 'duration';
% comment.tL45_13F0= '45 days of growth'; 
% 
% data.LWd45_13F0=  [tLWT_13F0(12:14,2) tLWT_13F0(12:14,4)]; bibkey.LWd45_13F0= {'Ball2017'};
% units.LWd45_13F0= {'mm', 'mg'};  label.LWd45_13F0= {'initial length', 'final dry weight 45d T13F0'};  
% expTime.LWd45_13F0= 93; units.expTime.LWd45_13F0= 'd'; label.expTime.LWd45_13F0= 'duration';
% comment.LWd45_13F0= ' dry weight of tissue after 45 days of growth for each individual'; 
% 
% data.LWd93_13F0=  [tLWT_13F0(26:33,2) tLWT_13F0(26:33,4)]; bibkey.LWd93_13F0= {'Ball2017'};
% units.LWd93_13F0= {'mm', 'mg'};  label.LWd93_13F0= {'initial length', 'final dry weight 93d T13F0'};  
% expTime.LWd93_13F0= 93; units.expTime.LWd93_13F0= 'd'; label.expTime.LWd93_13F0= 'duration';
% comment.LWd93_13F0= ' dry weight of tissue after 93 days of growth for each individual'; 

% % the wet weight includes the shell and we don't (yet) model shell growth
% data.tWw93_13F0=  [tLWT(4:11,3) tLWT_13F0 (26:33,3)];
% units.tWw93_13F0= {'g', 'g'};  label.tWw93_13F0 = {'initial wet weight', 'final wet weight'};  
% expTime.tWw93_13F0= 93; units.expTime.tWw93_13F0 = 'd'; label.expTime.tWw93_13F0 = 'duration';
% comment.tWw93_13F0= '93 days of growth'; 
% 
% data.tWw45_13F0=  [tLWT_13F0(1:11,3) tLWT_13F0(12:22,3)];
% units.tWw45_13F0= {'g', 'g'};  label.tWw45_13F0= {'initial wet weight', 'final wet weight'};  
% expTime.tWw45_13F0= 45; units.expTime.tWw45_13F0= 'd'; label.expTime.tWw45_13F0= 'duration';
% comment.tWw45_13F0



% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% only Maddie age data(more accurate )
data.tL = [  ... % time since birth (d), shell length (cm)
  1825	3650	3650	3650	3650	3650	4015	4015	4380	4745	4745	4745	4745	4745	4745	4745	4745	4745	4745	4745	5110	5110	5110	5110	5110	5110	5110	5110	5110	5110	5475	5475	5475	5840	5840	6205	6205	7300	7300	8030	9125	9490	10950	11680	18250	31025	31025	32120	33945	36135	43070	43435	48910	49640	55845	55845	58400	101470	102565	105850
  3.87	4.81	6.93	6.25	4.99	3.53	4.83	6.52	6.8	6.99	7.04	6.97	6.95	6.79	7.83	6.78	6.54	6.33	6.86	6.76	7.1	5.01	6.6	5.97	7.14	6.68	6.74	6.44	7.49	7.42	6.88	6.5	7.51	6.82	7.79	8.21	5.19	9.04	7.79	7.72	8.99	8.47	8.46	8.81	8.35	8.4	8.69	8.77	8.06	8.45	8.77	7.9	9.12	8.81	7.45	7.31	8.41	7.96	8.5	8.65
]';  
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(6.00);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MettWana2016';

% % t-L data Maddie+ Irene Ingoya
% data.tL = [  ... % time since birth (d), shell length (cm)
%   5840	8213	7118	5658	7665	6570	2555	6935	7300	5840	8121	2920	7300	7665	28835	7300	6570	5475	8395	12410	6570	9125	9125	8395	8760	8030	10220	7300	9855	1825	3650	3650	3650	3650	3650	4015	4015	4380	4745	4745	4745	4745	4745	4745	4745	4745	4745	4745	4745	5110	5110	5110	5110	5110	5110	5110	5110	5110	5110	5475	5475	5475	5840	5840	6205	6205	7300	7300	8030	9125	9490	10950	11680	18250	31025	31025	32120	33945	36135	43070	43435	48910	49640	55845	55845	58400	101470	102565	105850
% 
%   6.42	6.64	7.79	6.84	7.53	7.98	6.68	7.37	7.76	7.87	8.51	5.82	8.59	8.72	8.06	8.27	8.23	7.72	7.49	8.44	7.09	7.61	7.55	8.20	7.84	8.03	7.81	7.08	8.467	3.874	4.805	6.929	6.245	4.985	3.528	4.829	6.515	6.795	6.989	7.044	6.973	6.947	6.79	7.834	6.777	6.541	6.33	6.858	6.763	7.095	5.013	6.6	5.974	7.135	6.681	6.739	6.437	7.487	7.421	6.876	6.501	7.513	6.819	7.793	8.21	5.187	9.04	7.79	7.72	8.99	8.47	8.46	8.81	8.35	8.4	8.694	8.767	8.06	8.45	8.768	7.9	9.12	8.81	7.449	7.31	8.412	7.956	8.501	8.648
% ]';  
% units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
% temp.tL    = C2K(6.00);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
% bibkey.tL = 'Ball2017';

% 
%t-L2 data Oysterground 
data.tL2 = [  1460	1825	2190	2190	2190	2190	2190	2555	2555	2555	2555	2555	2555	2555	2555	2920	2920	2920	2920	2920	2920	3285	3285	3285	3285	3285	3650	3650	3650	3650	3650	3650	4015	4015	4015	4015	4015	4015	4015	4015	4015	4015	4015	4015	4015	4015	4015	4015	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4380	4745	4745	4745	4745	4745	4745	4745	4745	4745	4745	4745	4745	5110	5110	5110	5110	5110	5110	5110	5110	5110	5110	5110	5110	5110	5110	5110	5475	5475	5475	5475	5475	5475	5475	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	5840	6205	6205	6205	6205	6205	6205	6205	6205	6205	6205	6205	6570	6570	6570	6570	6570	6570	6570	6570	6570	6570	6570	6570	6935	6935	6935	6935	7300	7300	7300	7665	8395	8395	8395	8395	8760	9125	9125	9490	9490	9490	9855	9855	9855	9855	9855	10220	10220	10220	10585	10585	10585	10950	10950	10950	11315	11315	11315	11315	11680	11680	12045	12045	13140	13140	13140	13140	13140	13505	14600	14965	14965	15330	16060	16060	16790	17155	17885	18250	18250	18615	19710	20440	21170	21900	22995	24090	24455	24455	24455	28105	28105	28835	29200	32120	33215	38325	38690	38690	39055	39420	39785	40515	40880;
	3.747	1.906	1.983	2.72	5.242	2.007	1.811	1.666	1.783	1.964	3.01	2.374	2.325	2.546	5.653	2.522	6.833	3.773	4.456	3.553	5.19	4.267	2.98	3.09	2.47	5.118	7.042	2.576	4.85	2.93	6.12	6.273	6.166	5.2	6.95	2.814	4.205	5.286	5.708	5.593	5.725	5.805	5.205	5.214	5.7	5.874	6.903	7.313	4.427	6.017	4.54	7.053	4.033	4.188	4.604	5.344	5.782	6.181	5.971	5.188	5.301	5.162	5.238	5.535	6	4.81	5.76	7.02	6.026	5.88	5.33	8.077	4.124	4.836	5.836	5.93	5.76	5.45	5.9	6.32	7.529	6.43	5.832	6.439	5.8	6.34	5.38	5.69	5.99	5.7	5.94	5.7	5.7	5.94	5.515	5.591	5.949	5.86	6.06	5.45	5.2	5.67	5.06	5.87	6.575	6.17	6.885	6.434	6.91	6.22	6.026	6.24	5.96	5.5	6.26	5.24	6.03	6.04	5.78	5.81	5.7	5.91	5.87	6.63	7.084	6.451	6.754	6.993	5.14	5.68	5.7	6.11	7.208	6.061	5.76	6.504	6.658	6.748	6.759	6.672	6.688	6.38	5.74	5.54	5.967	6.5	7.015	5.9	7.062	6.48	5.06	7.057	6.24	7.09	7.1	7.78	7.128	7.11	7.367	7.222	6.43	6.99	6.66	7.446	7.011	7.36	7.26	6.808	7.402	6.73	7.461	7.402	7.69	7.482	7.532	7.67	7.413	7.024	7.061	6.8	7.662	7.143	7.115	6.65	7.58	6.73	7.44	6.153	6.233	7.73	5.674	6.747	5.934	7.92	7.323	7.795	9.204	7.511	7.78	7.828	10.436	8.842	10.385	8.748	8.02	7.58	8.62	8.54	7.89	10.057	10.504	8.13	8.65	8.02	8.2	10.41	8.397	8.16	8.828	8.34	8.49	8.46	8.03	7.54	8.35
  ]';  % physical length at f and T
units.tL2 = {'d', 'cm'};  label.tL2 = {'time since birth', 'shell length'};  
temp.tL2    = C2K(10.00);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = {'Witb1997'};

%t-L3 data Monkey Bank
data.tL3 = [  24455	16790	19710	18250	24455	32120	20440	18615	4745	4380	4015	3650	3650; % time since birth
10.057	9.204	10.385	10.436	10.504	10.41	8.748	8.842	8.077	7.053	6.95	6.12	6.273
  ]';  % physical length at f and T
units.tL3 = {'d', 'cm'};  label.tL3 = {'time since birth', 'shell length'};  
temp.tL3    = C2K(7.40);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = {'Witb1997'};


%t-L4 data Fladen Ground
data.tL4 = [  34310	34310	38325	41975	36135	40515	41245	7300	9490	39055	39055	40515	42340	42340	44530	42340	35770	36500	43435	43435	40515	44165	34310	21535	10585	10950	10950	10585	9490	8030	9490	9855	8760	6205	8030	8030	5840	5475	4745	4380	5110	6205	5475	4380	5110; % time since birth
6.525	6.275	6.112	7.158	7.094	6.545	6.385	3.145	3.958	6.742	6.512	6.329	6.962	6.672	7.907	7.269	6.741	6.534	7.037	6.167	6.891	7.445	6.285	5.566	5.405	5.006	5.078	4.777	4.151	3.671	4.881	4.578	4.14	3.443	4.255	4.254	3.073	2.551	2.635	2.543	3.22	4.2	3.79	2.65	3.35
  ]';  % physical length at f and T
units.tL4 = {'d', 'cm'};  label.tL4 = {'time since birth', 'shell length'};  
temp.tL4    = C2K(7.25);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = {'Witb1997'};


%t-L5 data Silver Point
data.tL5 = [  1825	3285	2920	4015	3285	3650	1825	1825	4015	33945	56575	6935	3285	2920	2920	3285	3650	4015	2555	4745	4015	8395	10585	4015	8760	4015	9490	13505	2920; % time since birth
3.761	3.662	3.52	3.81	2.222	3.978	1.713	1.631	4.632	8.65	9.91	7.108	4.647	4.733	3.512	3.952	5.83	3.983	3.167	5.023	5.023	8.398	8.632	5.835	6.86	6.115	8.509	8.397	4.546
  ]';  % physical length at f and T
units.tL5 = {'d', 'cm'};  label.tL5 = {'time since birth', 'shell length'};  
temp.tL5    = C2K(9.90);  units.temp.tL5 = 'K'; label.temp.tL5 = 'temperature';
bibkey.tL5 = {'Witb1997'};


%t-L6 data Fisher Bank
data.tL6 = [  31390	16425	16425	15695	14600	14235	14235	13140	12775	11680	10220	9855	9490	8760	8030	7665	7300	6935	6935	7300	7300	6205	4015	3650	35770	33580 ; % time since birth
8.468	8.468	7.477	7.615	6.774	7.051	6.32	5.601	5.091	4.207	4.181	3.8	4.446	3.597	2.695	2.408	3.185	6.027	6.59	7.398	9.225	6.42	6.489	3.765	10.095	9.956
  ]';  % physical length at f and T
units.tL6 = {'d', 'cm'};  label.tL6 = {'time since birth', 'shell length'};  
temp.tL6    = C2K(6.65);  units.temp.tL6 = 'K'; label.temp.tL6 = 'temperature';
bibkey.tL6 = {'Witb1997'};


%t-L7 data Faroe(very small speciemns)
data.tL7 = [  13140	14965	13140	2190	5110	5110	2190; % time since birth
6.15	5.93	6.23	2.01	5.52	5.59	1.81  ]';  % physical length at f and T
units.tL7 = {'d', 'cm'};  label.tL7 = {'time since birth', 'shell length'};  
temp.tL7    = C2K(7.9);  units.temp.tL7 = 'K'; label.temp.tL7 = 'temperature';
bibkey.tL7 = {'Witb1997'};
comment.tL7 = 'data Faroe(very small specimens)';


% t-L8 data Iceland (only last point from SchoFieg2005)
data.tL8 = [  2555    4015  4015   4015   4380    4380    4745  5840   9490   13870 136510  ; % time since birth
             4.77    6.233 6.455  4.982  6.195   5.34    6.551 5.934  7.431  7.849 10.7 ]';  % physical length at f and T
units.tL8 = {'d', 'cm'};  label.tL8 = {'time since birth', 'shell length'};  
temp.tL8    = C2K(4.7);  units.temp.tL8 = 'K'; label.temp.tL8 = 'temperature';
bibkey.tL8 = {'Witb1997','SchoFieg2005'};
comment.tL8 = 'Iceland (only last point from SchoFieg2005). the mean temperature of the area is 4.7 (sd 2.6). the oldest individual came from an area with mean temperature 6.2.';

% 
% L-Wd data (fieldwork Ingoya without gonads)
data.LW = [ ... % shell length (cm), gonad free dry weight (g)
	7.99	8.24	7.55	7.50	6.61	6.84	7.90	7.53	8.36	7.37	7.98	7.14	6.83	7.15	6.52	6.67	6.29	6.48	5.98	7.57	8.27	6.54	6.28	8.43	6.18	7.13	5.42	9.10	8.99	8.85	9.07	8.61	8.22	6.68	8.30	7.37	7.76	8.20	7.92	8.64	7.05	6.05	7.60	6.18	6.93	4.92	5.46	6.27	6.15	8.40	7.93	8.03	7.64	5.99	6.37	6.48	6.07	8.54	6.58	6.02	8.22	8.07	7.46	7.96	8.43	8.09	7.98	7.94	7.98	9.59	7.49	7.71	8.71	7.65	8.71	8.32	9.11	7.87	8.51	5.82	9.07	7.65	8.68	8.59	7.53	7.72	7.31	7.16	7.18	7.53	7.33	8.59	8.72	6.47	7.96	8.06	7.57	6.32	6.43	6.00	8.39	7.04	7.67	6.80	7.48	4.81	7.71	7.92	6.96	4.47	8.21	7.56	6.34	7.48	8.27	7.37	8.23	7.39	7.72	7.36	7.25	6.80	7.67	5.53	8.51	8.33	8.45	8.56	6.54	6.41	7.72	8.02	6.66	7.96	8.01	7.46	7.78	6.61	7.94	8.58	7.84	8.31	5.26	8.18	8.26	7.58	7.31	7.30	6.64	8.30	7.77	8.09	8.15	8.71	8.28	7.36	5.67	7.93	8.22	8.38	8.89	5.70	7.60	7.58	7.29	7.74	7.79	8.07	8.15	8.26	7.63	7.83	8.03	7.79	8.13	5.56	7.56	7.17	8.10	7.51	8.66	7.62	8.96	7.70	7.53	5.64	7.90	8.56	8.93	8.05	8.18	7.46	6.62	6.98	8.17	6.26	6.76	7.93	8.32	8.65	7.95	7.20	8.68	7.82	8.75	8.51	8.09	7.91	7.44	6.71	8.03	4.82	8.72	8.51	7.26	6.55	6.48	6.85	8.55	6.18	9.04	6.55	7.98	8.52	8.52	8.05	7.71	5.82	8.10	6.98	5.80	8.60	8.11	8.20	8.35	5.92	7.64	8.07	6.44	6.25	7.77	8.61	8.37	7.96	8.37	8.60	7.67	7.98	8.55	8.20	8.12	6.88	7.12	6.57	6.27	7.80	6.88	7.53	6.36	6.60	8.33	7.94	4.49	8.59	7.68	6.94	6.84	6.31	6.79	7.01	7.04	6.36	8.22	7.15	6.30	7.87	8.46	8.45	7.34	8.00	5.88	7.47	6.82	8.44	6.29	5.51	7.71	7.20	8.04	6.40	8.28	6.04	8.26	7.23	6.54	5.16	8.13	8.16	6.54	7.57	7.96	6.97	6.44	6.28	7.76	7.95	8.27	6.16	6.81	8.30	7.23	6.43	8.00	8.03	6.36	8.03	7.75	6.40	7.12	4.87	9.35	7.81	8.01	5.22	8.65	8.68	5.22	8.00	8.51	7.50	7.34	7.29	7.41	6.34	8.00	8.44	7.28	6.30	8.47	8.60	7.66	7.55	7.03;
	5.48	6.94	5.22	4.76	2.19	3.88	5.76	4.19	6.14	4.03	5.00	3.62	2.98	3.67	2.68	2.32	2.43	2.91	1.60	4.09	4.89	2.19	1.64	5.68	2.23	3.61	1.22	5.54	5.60	6.16	5.60	5.26	4.37	2.28	5.04	2.92	4.53	4.00	4.07	4.64	2.96	1.80	3.82	1.70	1.92	0.78	1.22	1.54	1.63	4.65	3.29	3.74	3.21	1.61	2.15	3.98	1.72	5.98	2.03	1.80	5.33	5.56	4.26	5.01	7.26	5.23	5.13	5.13	5.03	9.84	5.29	5.31	5.90	3.67	6.59	5.69	8.35	6.38	5.93	2.06	7.62	4.58	8.23	6.08	4.63	2.04	4.41	3.99	3.77	4.14	3.39	5.51	5.91	2.19	4.19	4.85	3.83	2.16	1.84	1.58	4.94	2.69	4.02	2.38	4.04	0.97	3.78	3.90	2.65	0.69	4.22	3.91	1.92	3.27	4.80	3.69	4.64	3.81	3.66	4.02	3.89	2.79	3.34	1.40	3.75	4.18	5.37	4.75	2.55	1.93	3.70	4.44	2.16	4.47	4.26	3.99	3.99	2.48	4.20	5.11	2.71	3.76	0.95	4.65	5.67	3.89	2.97	3.29	2.24	2.94	4.62	3.00	3.13	5.56	2.56	2.58	1.08	3.28	5.24	4.56	5.70	1.15	4.04	3.31	2.20	3.71	3.61	4.83	4.80	3.50	4.19	3.72	4.65	4.01	2.94	1.24	2.34	2.97	3.82	3.14	3.23	2.97	5.39	3.42	3.88	1.40	3.59	4.92	5.76	3.65	5.30	3.73	2.09	2.96	4.75	1.95	2.23	3.63	4.64	5.80	5.29	3.71	6.18	3.71	4.82	4.84	4.00	4.02	3.23	2.35	4.33	0.30	4.49	4.44	2.49	1.66	1.86	1.91	5.10	1.60	6.81	1.90	4.34	4.92	5.25	3.97	4.26	1.37	3.86	2.82	1.43	5.39	3.68	3.98	4.60	1.55	2.80	4.15	2.11	1.43	3.00	3.55	3.75	2.86	3.24	3.57	3.04	3.57	4.36	2.65	4.55	2.44	2.74	2.86	1.96	3.40	2.70	3.58	1.94	2.36	4.95	3.80	0.82	5.42	3.69	2.32	3.26	2.33	1.73	2.68	2.76	2.10	4.35	2.84	2.22	4.94	5.58	5.59	3.20	4.40	1.64	3.60	2.34	4.80	2.51	1.48	3.36	1.63	6.33	3.23	4.51	1.63	3.70	3.01	2.46	1.23	4.46	4.12	2.16	3.85	4.16	2.81	2.01	2.06	4.07	4.29	4.74	1.88	3.10	4.36	2.86	1.79	3.55	4.33	1.76	4.61	3.79	2.11	3.13	0.82	6.89	4.89	3.36	1.13	5.24	4.68	1.06	4.20	5.76	2.94	3.95	2.39	3.90	1.86	4.09	4.75	2.54	1.93	4.04	5.46	4.08	3.34	1.96
  ]';
units.LW = {'cm', 'g'}; label.LW = {'shell length', 'gonad-free dry weight'};  bibkey.LW = 'Ball2017';

%% set weights for all real data
weights = setweights(data, []);
% weights.tL(end-17:end) = 0.1 * weights.tL(end-17:end);
% weights.Ri = 80 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.expTime = expTime; 
auxData.expLength = expLength; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
  
%% Group plots
set1 = {'tL93_13F3','tL93_8F3','tL93_3F3'};    subtitle1 = {' 13, 8, 3 C (93d)'};
set2 = {'LWd93_13F3','LWd93_8F3','LWd93_3F3'}; subtitle2 = {' 13, 8, 3 C (93d)'};
set3 = {'tL', 'tL2', 'tL3', 'tL4', 'tL5', 'tL6', 'tL7', 'tL8'}; subtitle3 = {'growth curves at different sites'};

metaData.grp.sets = {set1,set2,set3}; 
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3}; 

%%  Discussion
D1 = 'mod_3: included growth curves from different sites, revised Ri, included wet weight of an egg, revised the way experimental data was included.';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_5: the total weight in the LW is replace by soma weight (gonad free weight), an outlier point was removed from Oysterground.';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%%  Aknowlegements 
metaData.acknowledgment  = 'mod_5: This work was funded by the EU within the framework (FP7) of the Marie Curie Initial Training Network ARAMACC (604802). SA was supported by the Research Council of Norway ("FRamework for integrating Eco-physiological and Ecotoxicological data into marine ecosystem-based management tools" NFR 255295.';

%% Links
metaData.links.id_CoL = '5VRMB'; % Cat of Life
metaData.links.id_ITIS = '81343'; % ITIS
metaData.links.id_EoL = '46469215'; % Ency of Life
metaData.links.id_Wiki = 'Arctica_islandica'; % Wikipedia
metaData.links.id_ADW = 'Arctica_islandica'; % ADW
metaData.links.id_Taxo = '39737'; % Taxonomicon
metaData.links.id_WoRMS = '138802'; % WoRMS
metaData.links.id_molluscabase = '138802'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arctica_islandica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S. A. L. M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ball2017'; type = 'Misc'; bib = [ ...
'author = {Irene Ballesta Artero}, ' ... 
'year = {2017}, ' ...
'note = {Own measurements}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ButlWana2012'; type = 'Article'; bib = [ ... 
'author = {Butler, P. G. and Wanamaker, A. D. and Scourse, J. D. and Richardson, C. A. and Reynolds, D. J.}, ' ... 
'year = {2012}, ' ...
'title = {Variability of marine climate on the {N}orth {I}celandic {S}helf in a 1357-year proxy archive based on growth increments in the bivalve \emph{Arctica islandica}}, ' ...
'journal = {Palaeogeography, Palaeoclimatology, Palaeoecology}, ' ...
'volume = {373}, ' ...
'pages = {141--151}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LutzMann1982'; type = 'Article'; bib = [ ... 
'author = {Lutz, R. A. and Mann, R. and Goodsell, J. G. and Castagna, M.}, ' ... 
'year = {1982}, ' ...
'title = {Larval and early post-larval development of \emph{Arctica islandica}}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {62}, ' ...
'pages = {745--769}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MettWana2016'; type = 'Article'; bib = [ ... 
'author = {Mette, M. J. and Wanamaker, A. D. and Carroll,  M. L. and Ambrose, W. G. and Retelle, M. J.}, ' ... 
'year = {2016}, ' ...
'title = {Linking large scale climate variability with \emph{Arctica islandica} shell growth and geochemistry in northern {N}orway}, ' ...
'journal = {Limnology and Oceanography}, ' ...
'volume = {61}, ' ...
'pages = {748--764}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Oerz1972'; type = 'Article'; bib = [ ... 
'author = {Oertzen, J. A.}, ' ... 
'year = {1972}, ' ...
'title = {Cycles and rates of reproduction of six {B}altic {S}ea bivalves of different zoogeographical origin}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {14}, ' ...
'pages = {143--149}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rope1985'; type = 'Article'; bib = [ ... 
'author = {Ropes, J. W.}, ' ... 
'year = {1985}, ' ...
'title = {Modern methods used to age oceanic bivalves}, ' ...
'journal = {The Nautilus}, ' ...
'volume = {99}, ' ...
'pages = {53-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchoFieg2005'; type = 'Article'; bib = [ ... 
'author = {Schone, B. R. and Fiebig, J. and Pfeiffer, M. and Gle{\ss}, R. and Hickson, J. and Johnson, A. L. and Oschmann, W.}, ' ... 
'year = {2005}, ' ...
'title = {Climate records from a bivalved {M}ethuselah (\emph{Arctica islandica}, {M}ollusca; {I}celand)}, ' ...
'journal = {Palaeogeography, Palaeoclimatology, Palaeoecology}, ' ...
'volume = {228}, ' ...
'number = {1}, '...
'pages = {130--148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThomJone1980'; type = 'Article'; bib = [ ... 
'author = {Thompson, I. and Jones, D. S. and Ropes, J. W.}, ' ... 
'year = {1980}, ' ...
'title = {Advanced age for sexual maturity in the ocean quahog \emph{Arctica islandica} ({M}ollusca: {B}ivalvia)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {57}, ' ...
'number = {1}, '...
'pages = {35--39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'Witb1997'; type = 'Phdthesis'; bib = [ ... 
'author = {Witbaard, R.}, ' ... 
'year = {1997}, ' ...
'title = {Tree of the sea: the use of the internal growth lines in the shell of \emph{Arctica islandica} ({B}ivalvia, {M}ollusca) for the retrospective assessment of marine environmental change}, ' ...
'school = {University Library Groningen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


