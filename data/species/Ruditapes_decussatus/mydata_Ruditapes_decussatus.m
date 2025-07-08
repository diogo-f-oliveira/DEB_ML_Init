function [data, auxData, metaData, txtData, weights] = mydata_Ruditapes_decussatus 

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Veneridae';
metaData.species    = 'Ruditapes_decussatus'; 
metaData.species_en = 'Grooved carpet shell'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Da'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp

metaData.data_0     = {'ab';'aj';'aj28';'tp';'am';'L0';'Lb';'Lj';'Lp';'Li';'Ri'};                      
metaData.data_1     = {'L-Ww','t-L', 't-L_T','t-L_f','t-Wd_T','X-JX_L','Ww-JX_f','t-Ww_f','t-Wd','t-Wd_f','L-dL','t-WwR'};              

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author   = {'Ines Lopes'};    
metaData.date_subm = [2017 05 30];              
metaData.email    = {'ines.estalagem.lopes@tecnico.ulisboa.pt'};            
metaData.address  = {'Universidade de Lisboa - Tecnico Lisboa'};   

metaData.author_mod_1   = {'Merel Lanjouw'};    
metaData.date_mod_1     = [2024 08 01];              
metaData.email_mod_1    = {'merel.lanjouw@wur.nl'};            
metaData.address_mod_1  = {'Wageningen University & Research - Wageningen Netherlands'};  

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 04 02]; 

%% set data
% zero-variate data

% data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Cama1980';   
%   temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
%   comment.ab = 'temps are guessed';
data.ab = 39/24;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'AranBur2014';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 27;     units.aj = 'd';    label.aj = 'age at metamorphosis';       bibkey.aj = 'AranBur2014';  
  temp.aj = C2K(20);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.aj28 = 13;     units.aj28 = 'd';    label.aj28 = 'age at metamorphosis';       bibkey.aj28 = 'Beiras1994'; 
  temp.aj28 = C2K(28); units.temp.aj28 = 'K'; label.temp.aj28 = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Cama1980';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'UrruIbar1999';        
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.L0  = 67.4e-4;  units.L0  = 'cm';  label.L0  = 'egg diameter';            bibkey.L0  = 'AranBur2014';
data.Lb  = 100e-4; units.Lb = 'cm'; label.Lb = 'length at birth'; bibkey.Lb = 'AranBur2014';
data.Lj  = 207.6e-4; units.Lj = 'cm'; label.Lj = 'length at metamorphosis'; bibkey.Lj = 'AranBur2014';
data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Cama1980'; 
data.Li  = 6.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Cama1980';

% data.Wwb  = 5.2e-7;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'Cama1980';      
%   comment.Wwb = 'based on egg diameter of 100 mum: 4/3*pi*(0.01/2)^3';

data.Ri  = 2.2e4;   units.Ri  = '#/d'; label.Ri  = 'daily egg production';    bibkey.Ri  = 'Maynou2021';   
  temp.Ri = C2K(17);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'aprox 1.02+/-0.12 million eggs (0.95 probability) along 6 years of reproductive years (1st egg at 2years old) (Cama1980)';

%% uni-variate data
% Length-weight
data.LWw = [ ... % shell length (mm), wet weight (g)
  7	9	9	11	11	11	11	11	11	11	11	13	13	13	13	13	13	13	15	15	15	15	15	15	15	15	17	17	17	17	17	17	17	17	17	19	19	19	19	19	19	19	19	19	19	19	19	19	21	21	21	21	21	21	21	21	21	21	21	21	23	23	23	23	23	23	23	23	23	23	23	23	23	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	27	27	27	27	27	27	27	27	27	27	27	27	27	27	27	27	27	27	27	27	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	29	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	31	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	33	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	45	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	47	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	49	51	51	51	51	51	51	51	51	51	51	51	51	51	51	51	51	51	51	53	53	53	53	53	53	53	53	53	53	53	53	53	53	55	55	55	55	55	55	55	55	55	55	55	55	55	55	57	57	57	57	57	59	61	65;
  0.09	0.2	0.13	0.4	0.4	0.31	0.44	0.22	0.42	0.38	0.37	0.69	0.49	0.7	0.58	0.61	0.57	0.54	0.6	0.72	0.96	0.94	0.79	0.9	0.83	0.71	1.2	1.24	1.21	1.44	1.2	1.46	1.27	1.27	1.36	1.6	1.56	1.62	1.71	1.79	1.84	1.8	1.9	2	1.84	2.31	1.44	1.45	2.2	2.28	2.17	2.25	2.36	2.33	1.95	2.11	2.44	2.31	2.89	2.13	2.8	3.36	3.08	3.3	2.93	2.99	2.99	2.96	2.92	2.89	3.75	2.43	3.15	3.7	3.79	3.47	3.64	3.44	3.9	4.02	3.31	3.85	3.75	3.75	4	3.92	3.86	3.63	4.05	4.64	3.9	4.48	4.9	4.68	5	4.58	4.81	4.28	4.64	4.8	4.56	5.27	5.02	4.65	5.27	5.69	4.71	4.39	5.83	4.8	5.3	5.1	6.2	5.82	5.72	6.85	6.06	5.95	6.05	5.26	5.83	5.87	5.93	7.11	5.81	5.42	6.4	6.23	5.56	6	6.82	5.59	6.3	7.6	7.72	6.9	7	6.95	8.01	7.46	6.98	6.96	7.09	6.7	6.65	6.2	8.3	8.26	7.69	8.21	7.63	7.87	7.81	7.26	6.83	6.99	7.71	7.13	8.4	8.65	8.94	8.05	9.06	9.71	8.88	9.06	8.77	9.36	9.26	8.3	8	8.9	8.98	8.36	9.49	8.69	8.82	8.79	8.15	8.37	8.22	9.21	8.34	21.1	21.69	19.77	22.12	22.2	22.47	22.35	24.27	21.61	23.04	20.53	21.82	21.22	21.36	22.63	20.79	22.1	22.07	21.29	20.99	21.72	22.23	21.99	21.05	21.66	22.29	23.6	23.28	23.85	25.86	24.84	23.66	23.7	22.82	23.85	23.8	24.45	23.31	25.59	23.5	25.6	25.17	22.9	24.88	25.17	24.17	24.09	23.9	24.11	24.81	24.29	27.5	27.83	27.64	26.87	27.42	27.29	30.43	27.1	26.82	28.03	27.22	26.02	27.72	27.24	27.31	33	27.86	29.1	28.13	26.83	25.99	26.7	27.19	30.6	29.35	30.26	31.15	31.29	32.17	30.64	30.95	29.26	29.17	31.94	30.54	32.92	32.07	31.61	27.76	30.12	30.69	33.8	40.38	34.65	33.55	33.77	35.98	31.48	30.87	34.52	35.68	36.47	31.5	31.79	33.15	36.69	37.07	36.65	35.86	38.67	38.25	41	38.33	37.07	38.15	35.3	45.5	37.44	43.27	51.3	39.43	47.54	32.11	41.66	54.4	55.56	59
]';  
data.LWw(:,1) = data.LWw(:,1)/10; % convert mm to cm
units.LWw   = {'cm', 'g'};  label.LWw = {'length', 'wet weight'}; bibkey.LWw = 'Cama1980';

% Length-weight Ojea
data.LWw_Ojea    = [4.879	4.309	4.556	5.091	5.057	5.282	4.595	4.399	4.879	4.537	4.17	4.711	4.754	4.786;
    26.47	19.68	22.29	29.62	27.78	33.27	24.19	20.83	24.83	20.85	18.02	23.35	24.82	25.16]'; 
temp.LWw_Ojea = C2K(20); units.temp.LWw_Ojea = 'K'; label.temp.LWw_Ojea = 'temperature';
units.LWw_Ojea   = {'cm', 'g'};   label.LWw_Ojea = {'Total length', 'Wet weight'};  bibkey.LWw_Ojea = 'Ojea2004';

%  Length-weight Erdal
data.LWw_Erdal = [2.772	2.871	2.888	2.93	3.172	3.499  2.772	2.836	2.873	2.935	3.139	3.65 2.772	2.809	2.887	2.94	3.368	3.693;
    4.032	4.471	4.76	4.777	6.395	8.626  4.032	4.402	4.475	4.818	5.73	9.097   4.032	4.344	4.696	4.852	7.802	9.813]';
units.LWw_Erdal = {'cm', 'g'}; label.LWw_Erdal = {'length','live weight'}; bibkey.LWw_Erdal = {'Erdal2020'};

% Length-weight Sousa
data.LWw_Sousa = [3.36	6.58	9.57	5.7	11.53	17.55	4.27	13.05	18.32; 
  0.01	0.05	0.16	0.05	0.36	1.12	0.03	0.54	1.34]';  
data.LWw_Sousa(:,1) = data.LWw_Sousa(:,1) / 10; %from mm to cm
units.LWw_Sousa   = {'cm', 'g'};  label.LWw_Sousa = {'length', 'wet weight'}; bibkey.LWw_Sousa = 'Sousa2011'; 

%% Larval development

% Beiras data different temperatures
% time length 
    % 28 C
    data.tL_Beir28 = [2	10	13	17;
        105.20	202.60	223.05	273.61]';
    units.tL_Beir28 = {'d','um'}; label.tL_Beir28 = {'Age','Length'};
    temp.tL_Beir28   = C2K(28);  units.temp.tL_Beir28 = 'K'; label.temp.tL_Beir28 = 'temperature';
    bibkey.tL_Beir28 = {'Beiras1994'};
    
    % 22 C
    data.tL_Beir22 = [2	10	13	17;
        105.58	179.17	203.53	230.67]';
    units.tL_Beir22 = {'d','um'}; label.tL_Beir22 = {'Age','Length'};
    temp.tL_Beir22   = C2K(22);  units.temp.tL_Beir22 = 'K'; label.temp.tL_Beir22 = 'temperature';
    bibkey.tL_Beir22 = {'Beiras1994'};
    
    % 16 C
    data.tL_Beir16 = [2	13	20;
        105.75	150.64	207.71]';
    units.tL_Beir16 = {'d','um'}; label.tL_Beir16 = {'Age','Length'};
    temp.tL_Beir16   = C2K(16);  units.temp.tL_Beir16 = 'K'; label.temp.tL_Beir16 = 'temperature';
    bibkey.tL_Beir16 = {'Beiras1994'};
    
    % 10 C
    data.tL_Beir10 = [2	8 13;
        105.05	115 123.15]';
    units.tL_Beir10 = {'d','um'}; label.tL_Beir10 = {'Age','Length'};
    temp.tL_Beir10   = C2K(10);  units.temp.tL_Beir10 = 'K'; label.temp.tL_Beir10 = 'temperature';
    bibkey.tL_Beir10 = {'Beiras1994'};
    
    % time dry weight
    % 28 C
    data.tWd_Beir28 = [2	10	13	17;
        0.21	1.31	2.50	3.65]';
    units.tWd_Beir28 = {'d','ug'}; label.tWd_Beir28 = {'Age','Dry weight'};
    temp.tWd_Beir28   = C2K(28);  units.temp.tWd_Beir28 = 'K'; label.temp.tWd_Beir28 = 'temperature';
    bibkey.tWd_Beir28 = {'Beiras1994'};
    
    % 22 C
    data.tWd_Beir22 = [2	10	13	17;
        0.21	0.97	1.18	2.39]';
    units.tWd_Beir22 = {'d','ug'}; label.tWd_Beir22 = {'Age','Dry weight'};
    temp.tWd_Beir22   = C2K(22);  units.temp.tWd_Beir22 = 'K'; label.temp.tWd_Beir22 = 'temperature';
    bibkey.tWd_Beir22 = {'Beiras1994'};
    
    % 16 C
    data.tWd_Beir16 = [2	13	20;
        0.21	0.62	1.94]';
    units.tWd_Beir16 = {'d','ug'}; label.tWd_Beir16 = {'Age','Dry weight'};
    temp.tWd_Beir16   = C2K(16);  units.temp.tWd_Beir16 = 'K'; label.temp.tWd_Beir16 = 'temperature';
    bibkey.tWd_Beir16 = {'Beiras1994'};
    
    % 10 C
    data.tWd_Beir10 = [2	13;
        0.21	0.40]';
    units.tWd_Beir10 = {'d','ug'}; label.tWd_Beir10 = {'Age','Dry weight'};
    temp.tWd_Beir10   = C2K(10);  units.temp.tWd_Beir10 = 'K'; label.temp.tWd_Beir10 = 'temperature';
    bibkey.tWd_Beir10 = {'Beiras1994'};

% food density - ingestion rate I. galbana Perez
    % 108um
    data.XJX108 = [10 50 100 200 300;            % cells / ul
        17.22   50.33   39.74   92.72   67.55]'; % cells / h
    %one cell weighs ~20pg (dry weight)
    data.XJX108(:,2) = data.XJX108(:,2)*20e-12; % transform cells to g /h
    units.XJX108 = {'cells /ul','g C /h'}; label.XJX108 = {'Concentration','Ingestion rate'}; bibkey.XJX108 = 'Perez1994';
    temp.XJX108   = C2K(20);  units.temp.XJX108 = 'K'; label.temp.XJX108 = 'temperature';
    % 172 um
    data.XJX172 =[10 50 100 200 300;
        41.34 139.37 167.72 259.84 249.21]';
    % one cell weighs ~20pg
    data.XJX172(:,2) = data.XJX172(:,2)*20e-12; % transform cells to g
    units.XJX172 = {'cells /ul','g C /h'}; label.XJX172 = {'Concentration','Ingestion rate'}; bibkey.XJX172 = 'Perez1994';
    temp.XJX172   = C2K(20);  units.temp.XJX172 = 'K'; label.temp.XJX172 = 'temperature';
   % 196 um
    data.XJX196 =[10 50 100 200 300;
        43.99 144.20 199.19 274.95 450.92]';
    %one cell weighs ~20pg
    data.XJX196(:,2) = data.XJX196(:,2)*20e-12; % transform cells to g
    units.XJX196 = {'cells /ul','g C /h'}; label.XJX196 = {'Concentration','Ingestion rate'}; bibkey.XJX196 = 'Perez1994';
    temp.XJX196   = C2K(20);  units.temp.XJX196 = 'K'; label.temp.XJX196 = 'temperature';
    % 228 um
    data.XJX228 =[10 50 100 200 300;
        37.88 171.08 217.52 602.44 479.02]';
    % one cell weighs ~20pg
    data.XJX228(:,2) = data.XJX228(:,2)*20e-12; % transform cells to g
    units.XJX228 = {'cells /ul','g C /h'}; label.XJX228 = {'Concentration','Ingestion rate'}; bibkey.XJX228 = 'Perez1994';
    temp.XJX228   = C2K(20);  units.temp.XJX228 = 'K'; label.temp.XJX228 = 'temperature';

% wet weight - ingestion rate Albentosa three diets
    %I. galbana
    data.WwJX_f1 = [0.15	0.15	0.15	0.17	0.17	0.17	0.19	0.19	0.19	0.20	0.20	0.20	0.23	0.22	0.24	0.25	0.26	0.26	0.28	0.28	0.30	0.30	0.29	0.31	0.33	0.34	0.33	0.35	0.35	0.37	0.38	0.40	0.46	0.40	0.41	0.42	0.43	0.43	0.43	0.45	0.49	0.51	0.51	0.53	0.56	0.56	0.56	0.60	0.61	0.60	0.64	0.64	0.66	0.67	0.68	0.70	0.71	0.73	0.72	0.75	0.76	0.76	0.80	0.80	0.82	0.85	0.82	0.83	0.84	0.78	0.84	0.88;
        2.11	2.20	2.36	2.61	2.48	2.33	2.64	2.51	2.39	1.99	1.80	1.68	1.52	1.52	2.48	2.61	2.95	3.07	2.67	3.04	2.95	2.48	3.10	3.22	3.32	3.81	3.01	2.82	2.45	2.85	2.42	2.57	2.33	4.09	4.49	4.74	4.09	4.06	3.94	4.49	6.72	5.88	5.91	6.22	6.44	5.70	5.54	5.30	5.23	4.49	4.71	5.02	4.21	6.28	5.36	4.92	4.06	5.54	6.25	5.36	5.20	4.65	6.16	5.88	5.11	4.49	6.13	5.85	5.60	9.53	9.07	9.78]';
    data.WwJX_f1(:,1)=data.WwJX_f1(:,1)*1e-3; %from mg to g
    units.WwJX_f1 = {'g','ug DW d-1'}; label.WwJX_f1 = {'Wet weight','Ingestion rate'}; bibkey.WwJX_f1 = 'Albentosa1996';
    temp.WwJX_f1   = C2K(20);  units.temp.WwJX_f1 = 'K'; label.temp.WwJX_f1 = 'temperature';
    
    %T. suecica
    data.WwJX_f2 = [0.15	0.15	0.16	0.17	0.17	0.18	0.17	0.18	0.20	0.20	0.18	0.20	0.19	0.21	0.22	0.21	0.22	0.23	0.23	0.25	0.25	0.27	0.26	0.27	0.30	0.32	0.31	0.34	0.37	0.43	0.51	0.53	0.48	0.48	0.41	0.37	0.36	0.40	0.45	0.44	0.50	0.55	0.59	0.72	0.61	0.56	0.62	0.68	0.74	0.83	0.76	0.68	0.65	0.60	0.65	0.65	0.70	0.75	0.79	0.79	0.77	0.77	0.85	0.85	0.93	0.96	1.02	1.03	0.91	0.79	0.89	0.89	1.09	0.96	0.98	1.02;
        2.39	2.91	2.00	1.70	2.79	2.91	3.45	3.82	3.61	4.30	4.79	5.27	2.18	2.15	2.39	2.82	2.73	2.70	2.73	2.64	2.52	2.76	3.24	3.21	4.12	3.64	5.36	5.12	4.39	4.00	3.45	3.73	4.94	4.64	5.30	6.39	7.21	6.61	5.73	7.79	6.27	5.09	4.73	4.76	6.67	8.82	8.06	6.88	6.70	6.48	8.09	8.73	9.24	11.61	10.67	11.36	10.09	9.03	8.97	8.64	10.61	10.61	9.55	9.36	8.12	7.55	9.03	8.76	11.06	13.06	15.30	16.33	14.67	13.15	12.27	12.18]';
    data.WwJX_f2(:,1)=data.WwJX_f2(:,1)*1e-3;
    units.WwJX_f2 = {'g','ug DW d-1'}; label.WwJX_f2 = {'Wet weight','Ingestion rate'}; bibkey.WwJX_f2 = 'Albentosa1996';
    temp.WwJX_f2   = C2K(20);  units.temp.WwJX_f2 = 'K'; label.temp.WwJX_f2 = 'temperature';
    
    %P. tricornutum
    data.WwJX_f3 = [0.15	0.16	0.16	0.15	0.16	0.18	0.19	0.19	0.19	0.20	0.20	0.17	0.17	0.18	0.20	0.21	0.21	0.22	0.21	0.22	0.22	0.23	0.25	0.27	0.26	0.29	0.30	0.29	0.32	0.32	0.34	0.35	0.36	0.37	0.38	0.40	0.40	0.44	0.46	0.49	0.48	0.43	0.41	0.44	0.46	0.47	0.48	0.50	0.50	0.52	0.51	0.48	0.49	0.51	0.52	0.52	0.53	0.55	0.57;
        2.48	2.57	2.30	2.90	3.22	3.07	3.07	3.73	3.49	3.43	3.19	4.51	4.78	5.16	4.45	4.63	4.84	4.57	4.03	3.91	3.76	3.13	3.52	3.46	3.19	4.72	5.22	5.64	5.40	5.85	5.16	5.58	5.25	5.67	3.25	3.07	3.31	3.43	3.61	3.70	4.06	4.90	5.10	5.43	5.31	5.61	4.69	5.25	4.78	4.72	4.39	6.00	6.00	6.24	6.57	7.13	7.22	6.81	7.25]';
    data.WwJX_f3(:,1)=data.WwJX_f3(:,1)*1e-3;
    units.WwJX_f3 = {'g','ug DW d-1'}; label.WwJX_f3 = {'Wet weight','Ingestion rate'}; bibkey.WwJX_f3 = 'Albentosa1996';
    temp.WwJX_f3   = C2K(20);  units.temp.WwJX_f3 = 'K'; label.temp.WwJX_f3 = 'temperature';

% time weight three diets Albentosa
    % I. galbana
    data.tWw_f1 = [0 7 14 21 26;
        0.16	0.27	0.47	0.76	0.89]';
    units.tWw_f1 = {'d','mg'}; label.tWw_f1 = {'Time','Wet weight'}; bibkey.tWw_f1 = 'Albentosa1996';
    temp.tWw_f1   = C2K(20);  units.temp.tWw_f1 = 'K'; label.temp.tWw_f1 = 'temperature';
   
    % T. suesica
    data.tWw_f2 = [0 7 14 21 26;
        0.16	0.24	0.56	0.82	1.10]';
    units.tWw_f2 = {'d','mg'}; label.tWw_f2 = {'Time','Wet weight'}; bibkey.tWw_f2 = 'Albentosa1996';
    temp.tWw_f2   = C2K(20);  units.temp.tWw_f2 = 'K'; label.temp.tWw_f2 = 'temperature';
    
    %P. tricornutum
    data.tWw_f3 = [0 7 14 21 26;
        0.22	0.23	0.45	0.56	0.67]';
    units.tWw_f3 = {'d','mg'}; label.tWw_f3 = {'Time','Wet weight'}; bibkey.tWw_f3 = 'Albentosa1996';
    temp.tWw_f3   = C2K(20);  units.temp.tWw_f3 = 'K'; label.temp.tWw_f3 = 'temperature';

% Matias tL data at starvation
    data.tL_Matias = [2	5	8	10	12	14	19	23;
        96.71	100.18	99.18	101.36	102.31	102.27	104.53	103.750]';
    data.tL_Matias(:,2)=data.tL_Matias(:,2)*1e-4;
    units.tL_Matias = {'d', 'cm'}; label.tL_Matias = {'Days after fertilisation','length'};
    temp.tL_Matias = C2K(22);  units.temp.tL_Matias = 'K'; label.temp.tL_Matias = 'temperature';
    bibkey.tL_Matias = 'Matias2010';

% Matias tL data at food type 1 (T. iso)
    data.tL_Matias1 = [2	5	8	10	12	14	19	23;
        96.71	103.53	112.48	119.21	129.81	150.14	179.25	184.03]';
    data.tL_Matias1(:,2)=data.tL_Matias1(:,2)*1e-4;
    units.tL_Matias1 = {'d', 'cm'}; label.tL_Matias1 = {'Days after fertilisation','length'};
    temp.tL_Matias1 = C2K(22);  units.temp.tL_Matias1 = 'K'; label.temp.tL_Matias1 = 'temperature';
    bibkey.tL_Matias1 = 'Matias2010';

% Matias tL data at food type 2 (C. cal)
    data.tL_Matias2 = [2	5	8	10	12	14	19	23;
        96.71	104.27	134.81	153.88	161.53	168.48	174.39	199.67]';
    data.tL_Matias2(:,2)=data.tL_Matias2(:,2)*1e-4;
    units.tL_Matias2 = {'d', 'cm'}; label.tL_Matias2 = {'Days after fertilisation','length'};
    temp.tL_Matias2 = C2K(22);  units.temp.tL_Matias2 = 'K'; label.temp.tL_Matias2 = 'temperature';
    bibkey.tL_Matias2 = 'Matias2010';

%% ADULT GROWTH
% time-length
    data.tL_Juric = [365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	365	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	730	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1095	1460	1460	1460	1460	1460	1460	1460	1460	1460	1460	1460	1460	1460	1460	1460	1460	1460	1825	1825	1825	1825	1825	1825	1825	2190	2190	2190	2190;
        2.52	2.45	2.16	2.10	2.02	1.93	1.89	1.86	1.80	1.74	1.70	1.65	1.61	1.57	1.52	1.50	1.44	1.40	1.35	1.29	1.18	1.15	1.11	1.04	0.95	0.94	0.86	0.99	3.43	3.32	3.19	3.07	3.02	2.89	2.84	2.82	2.79	2.76	2.73	2.64	2.59	2.51	2.46	2.38	2.30	2.41	2.21	2.15	2.07	2.04	2.11	1.89	1.73	3.76	3.55	3.44	3.39	3.35	3.25	3.17	3.14	3.07	3.03	3.00	3.00	2.97	2.91	2.87	2.77	2.71	2.67	2.64	2.59	3.95	3.75	3.57	3.53	3.46	3.37	3.32	3.27	3.21	3.14	3.10	3.08	3.07	3.14	2.99	2.94	2.93	3.98	3.87	3.65	3.59	3.55	3.34	3.18	4.00	3.72	3.66	3.28]';
    units.tL_Juric = {'d', 'cm'}; label.tL_Juric = {'time since start experiment', 'length'};  
    temp.tL_Juric = C2K(17.5);  units.temp.tL_Juric = 'K'; label.temp.tL_Juric = 'temperature';
    bibkey.tL_Juric = 'Juric2012';

% weight age classes 0 to 7 Urratia 
 % age class 0
    % t = 1 is January 1st 1987
    data.tWd_Urr0 = [606.1679 634.1342 658.1053 684.7399 719.3648 744.6677 771.3023;
        0.33	0.83	1.49	4.96	9.6	14.23	10.76]';
    data.tWd_Urr0(:,2)=data.tWd_Urr0(:,2)/1000;
    units.tWd_Urr0 = {'d', 'g'};  label.tWd_Urr0 = {'time since start experiment', 'tissue dry weight'};
    temp.tWd_Urr0 = [1     32   60    91    121    152  182  213   244   274   305  335  366    397   425   456   486   517   547   578   609   639   670   700 731         762         790;
                     12.85 12.5	12.65 13.8	16.15  18.8	20.3 21.25 20.65 18.85 16.4	14.3 12.85	12.5	12.65	13.8	16.15	18.8	20.3	21.25	20.65	18.85	16.4	14.3 12.85	12.5	12.65]';  units.temp.tWd_Urr0 = 'K'; label.temp.tWd_Urr0 = 'temperature';
    temp.tWd_Urr0(:,2)=C2K(temp.tWd_Urr0(:,2));
    bibkey.tWd_Urr0 = {'UrruIbar1999'};
% age class 1
    data.tWd_Urr01 = [263.9135 282.5577 310.5240 342.4855 386.4326 417.0623 442.3652 461.0094 484.9805 515.6103 543.5766 566.2160 608.8313 635.4659 658.1053 684.7399 716.7014 743.3359 772.6340;
        0.83	0.83	1.49	2.65	11.92	11.92	10.76	20.03	33.94	50.16	53.64	52.48	54.8	54.8	62.91	68.7	77.97	82.61	75.66]';
    data.tWd_Urr01(:,2)=data.tWd_Urr01(:,2)/1000;
    units.tWd_Urr01 = {'d', 'g'};  label.tWd_Urr01 = {'time since start experiment', 'tissue dry weight'};
    bibkey.tWd_Urr01 = {'UrruIbar1999'};
% age class 2
    data.tWd_Urr02 = [265.2452 283.8894 310.5240 339.8220 382.4374 417.0623 443.6969 457.0142 480.9853 518.2737 544.9083 567.5477 610.1630 632.8024 656.7736 683.4081 719.3648 740.6725 772.6340;
        53.64	58.27	66.39	71.02	72.18	75.66	73.34	91.88	127.81	157.94	167.21	146.35	152.14	150.99	160.26	175.32	185.75	200.82	177.64]';
    data.tWd_Urr02(:,2)=data.tWd_Urr02(:,2)/1000;
    units.tWd_Urr02 = {'d', 'g'};  label.tWd_Urr02 = {'time since start experiment', 'tissue dry weight'};
    bibkey.tWd_Urr02 = {'UrruIbar1999'};
% age class 3
    data.tWd_Urr03 = [264 285 312 340 380 414 446 458 480 517 546 569 609 634 661 685 717 739 770;
        145.19	157.94	171.85	173	169.53	179.96	177.64	200.82	254.13	294.69	307.44	261.08	270.35	259.92	272.67	298.17	306.28	330.62	293.53]';
    data.tWd_Urr03(:,2)=data.tWd_Urr03(:,2)/1000;
    units.tWd_Urr03 = {'d', 'g'};  label.tWd_Urr03 = {'time since start experiment', 'tissue dry weight'};
    bibkey.tWd_Urr03 = {'UrruIbar1999'};
% age class 4
    data.tWd_Urr04 = [264 285 312 342 380 416 444 454 482 517 544 568 610 634 659 682 715 741 771;
        254.13 276.15 293.53 293.53 280.78 299.32 294.69 315.55 380.45 429.12 445.35 380.45 383.92 364.22 382.77 411.74 421.01 449.98 403.63]';
    data.tWd_Urr04(:,2)=data.tWd_Urr04(:,2)/1000;
    units.tWd_Urr04 = {'d', 'g'};  label.tWd_Urr04 = {'time since start experiment', 'tissue dry weight'};
    bibkey.tWd_Urr04 = {'UrruIbar1999'};
% age class 5
    data.tWd_Urr05 = [264 283 313 342 380 414 444 454 485 518 545 569 607 633 661 685 717 741 773;
        360.75 390.88 412.90 408.26 386.24 409.42 401.31 425.65 494.02 548.49 567.03 480.11 478.95 456.94 478.95 509.09 520.68 557.76 495.18]';
    data.tWd_Urr05(:,2)=data.tWd_Urr05(:,2)/1000;
    units.tWd_Urr05 = {'d', 'g'};  label.tWd_Urr05 = {'time since start experiment', 'tissue dry weight'};
    bibkey.tWd_Urr05 = {'UrruIbar1999'};
% age class 6
    data.tWd_Urr06 = [264 284 313 341 380 416 444 457 485 520 546 568.8 569 607 633 659 685 715 741 770;
        454.62 490.54 512.56 507.93 475.48 502.13 494.02 512.56 590.21 651.63 669.01 631.93 563.55 556.60 533.42 555.44 591.37 597.16 645.84 572.83]';
    data.tWd_Urr06(:,2)=data.tWd_Urr06(:,2)/1000;
    units.tWd_Urr06 = {'d', 'g'};  label.tWd_Urr06 = {'time since start experiment', 'tissue dry weight'};
    bibkey.tWd_Urr06 = {'UrruIbar1999'};

% time - dry weight starvation Albentosa 2007
    data.tWd_Alb = [1       15       28       42       70	   85;
                   1264.10  1082.91  1108.21  1060.68  954.36  950.71]';
    data.tWd_Alb(:,2)=data.tWd_Alb(:,2)/1000;
    units.tWd_Alb = {'d', 'g'};  label.tWd_Alb = {'time since start starvation', 'tissue dry weight'};
    temp.tWd_Alb = C2K(17); units.temp.tWd_Alb = 'K'; label.temp.tWd_Alb = 'temperature';
    bibkey.tWd_Alb = {'Albentosa2007'};

% time - length Erdal 2020
% Station SA: f1
    data.tL_Erdal_f1 = [0 60	121	182	243	304;
        2.772	2.871	2.888	2.93	3.172	3.499]';
    units.tL_Erdal_f1 = {'d','cm'}; label.tL_Erdal_f1 = {'time since start experiment','length'};
    temp.tL_Erdal_f1 = [0 60 121 182 243 304;
        12.9	10.1	10.7	23.5	24.3	22.3]';
    temp.tL_Erdal_f1(:,2)= C2K(temp.tL_Erdal_f1(:,2)); units.temp.tL_Erdal_f1 = {'d','K'}; label.temp.tL_Erdal_f1 = {'time since start experiment','temperature'};
    bibkey.tL_Erdal_f1 = {'Erdal2020'};
 % Station SB: f2   
    data.tL_Erdal_f2 = [0 60	121	182	243	304;
        2.772	2.836	2.873	2.935	3.139	3.65]';
    units.tL_Erdal_f2 = {'d','cm'}; label.tL_Erdal_f2 = {'time since start experiment','length'};
    temp.tL_Erdal_f2 = C2K([12.9	10.1	10.7	23.5	24.3	22.3]);
    bibkey.tL_Erdal_f2 = {'Erdal2020'};
 % Station SC: f3   
    data.tL_Erdal_f3 = [0 60	121	182	243	304;
        2.772	2.809	2.887	2.94	3.368	3.693]';
    units.tL_Erdal_f3 = {'d','cm'}; label.tL_Erdal_f3 = {'time since start experiment','length'};
    temp.tL_Erdal_f3 = C2K([12.9	10.1	10.7	23.5	24.3	22.3]);
    bibkey.tL_Erdal_f3 = {'Erdal2020'};

% time - weight Erdal 2020
% Station SA: f1
    data.tWd_Erdal_f1 = [0 60	121	182	243	304;
        4.032	4.471	4.76	4.777	6.395	8.626]';
    units.tWd_Erdal_f1 = {'d','g'}; label.tWd_Erdal_f1 = {'time since start experiment','weight'};
    bibkey.tWd_Erdal_f1 = {'Erdal2020'};
 % Station SB: f2   
    data.tWd_Erdal_f2 = [0 60	121	182	243	304;
        4.032	4.402	4.475	4.818	5.73	9.097]';
    units.tWd_Erdal_f2 = {'d','g'}; label.tWd_Erdal_f2 = {'time since start experiment','weight'};
    temp.tWd_Erdal_f2 = C2K([12.9	10.1	10.7	23.5	24.3	22.3]);
    bibkey.tWd_Erdal_f2 = {'Erdal2020'};
% Station SC: f3    
    data.tWd_Erdal_f3 = [0 60	121	182	243	304;
        4.032	4.344	4.696	4.852	7.802	9.813]';
    units.tWd_Erdal_f3 = {'d','g'}; label.tWd_Erdal_f3 = {'time since start experiment','weight'};
    temp.tWd_Erdal_f3 = C2K([12.9	10.1	10.7	23.5	24.3	22.3]);
    bibkey.tWd_Erdal_f3 = {'Erdal2020'};

% length - change in length
    data.LdL_Juric = [ 8.91E-01	1.01E+00	1.05E+00	1.05E+00	1.15E+00	1.17E+00	1.07E+00	1.16E+00	1.31E+00	1.31E+00	1.29E+00	1.10E+00	1.13E+00	1.20E+00	1.24E+00	1.34E+00	1.20E+00	1.29E+00	1.32E+00	1.29E+00	1.34E+00	1.34E+00	1.32E+00	1.31E+00	1.44E+00	1.52E+00	1.56E+00	1.57E+00	1.57E+00	1.46E+00	1.48E+00	1.43E+00	1.46E+00	1.45E+00	1.49E+00	1.46E+00	1.63E+00	1.66E+00	1.91E+00	1.65E+00	1.63E+00	1.44E+00	1.42E+00	1.43E+00	1.46E+00	1.48E+00	1.58E+00	1.57E+00	1.56E+00	1.43E+00	1.53E+00	1.62E+00	1.69E+00	1.75E+00	1.74E+00	1.79E+00	1.83E+00	1.83E+00	1.74E+00	1.69E+00	1.74E+00	1.71E+00	1.80E+00	1.80E+00	1.85E+00	1.87E+00	1.93E+00	2.03E+00	1.93E+00	1.89E+00	1.84E+00	1.85E+00	1.89E+00	1.87E+00	1.90E+00	1.96E+00	2.00E+00	2.01E+00	2.00E+00	1.99E+00	1.96E+00	2.00E+00	2.08E+00	2.11E+00	2.14E+00	2.18E+00	2.17E+00	2.19E+00	2.21E+00	2.29E+00	2.22E+00	2.10E+00	2.10E+00	2.17E+00	2.19E+00	2.16E+00	2.15E+00	2.14E+00	2.13E+00	2.15E+00	2.24E+00	2.25E+00	2.27E+00	2.25E+00	2.30E+00	2.30E+00	2.74E+00	2.34E+00	2.51E+00	2.54E+00	2.42E+00	2.42E+00	2.43E+00	2.44E+00	2.51E+00	2.51E+00	2.53E+00	2.66E+00	2.69E+00	2.77E+00;
        1.54E-03	1.59E-03	2.01E-03	2.19E-03	1.86E-03	1.64E-03	1.18E-03	1.20E-03	1.18E-03	8.66E-04	5.70E-04	2.32E-03	2.88E-03	2.68E-03	2.66E-03	3.73E-03	2.27E-03	2.29E-03	2.60E-03	2.86E-03	1.44E-03	1.37E-03	1.39E-03	1.96E-03	3.09E-03	3.19E-03	2.99E-03	3.02E-03	2.95E-03	2.93E-03	2.71E-03	2.52E-03	2.51E-03	2.46E-03	2.46E-03	2.35E-03	2.56E-03	2.73E-03	2.67E-03	1.99E-03	1.94E-03	1.94E-03	1.84E-03	1.75E-03	1.64E-03	1.71E-03	1.59E-03	1.50E-03	1.46E-03	1.12E-03	1.16E-03	1.75E-03	1.73E-03	1.83E-03	1.87E-03	1.91E-03	2.10E-03	2.17E-03	1.46E-03	9.38E-04	8.53E-04	4.32E-04	3.01E-04	1.11E-03	1.38E-03	1.52E-03	1.57E-03	1.57E-03	1.27E-03	1.06E-03	9.91E-04	9.25E-04	7.94E-04	6.95E-04	6.49E-04	7.87E-04	8.92E-04	8.53E-04	6.42E-04	5.57E-04	5.37E-04	3.40E-04	9.78E-04	8.73E-04	8.27E-04	8.33E-04	1.07E-03	1.17E-03	1.13E-03	1.02E-03	6.56E-04	5.96E-04	4.12E-04	5.44E-04	5.37E-04	3.86E-04	3.53E-04	3.47E-04	2.09E-04	2.15E-04	5.90E-04	5.90E-04	3.66E-04	2.15E-04	2.48E-04	1.23E-04	3.14E-04	4.06E-04	6.49E-04	4.26E-04	4.72E-04	4.32E-04	4.06E-04	1.82E-04	2.15E-04	1.43E-04	1.17E-04	2.28E-04	3.99E-04	6.40E-05]';
    data.LdL_Juric(:,1)=1.504 * data.LdL_Juric(:,1) - 1.128e-1; % change from height to length (Juric, 2012)
    units.LdL_Juric = {'cm', 'cm/d'};  label.LdL_Juric = {'shell length', 'change in shell length'};
    temp.LdL_Juric = C2K(17.5);  units.temp.LdL_Juric = 'K'; label.temp.LdL_Juric = 'temperature';
    bibkey.LdL_Juric = 'Juric2012';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0.5;
weights.L0 = 5;
weights.Lb = 5;
weights.ab = 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% group plots
 set1 = {'tL_Beir28','tL_Beir22','tL_Beir16','tL_Beir10'}; subtitle1 = {' length at 28, 22, 16, 10 C'};
 set2 = {'tWd_Beir28','tWd_Beir22','tWd_Beir16','tWd_Beir10'}; subtitle2 = {'dry weight 28, 22, 16, 10 C'};
 set3 = {'tWd_Urr0','tWd_Urr01','tWd_Urr02','tWd_Urr03','tWd_Urr04','tWd_Urr05','tWd_Urr06'}; subtitle3 = {'dry weight 0','dry weight 1','dry weight 2','dry weight 3','dry weight 4','dry weight 5','dry weight 6'};
 set4 = {'tL_Matias','tL_Matias1','tL_Matias2'}; subtitle4 = {'length starvation', 'length food type 1', 'length food type 2'};
 set5 = {'XJX108','XJX172','XJX196','XJX228'}; subtitle5 = {'Ingestion rate 108 um','Ingestion rate 172 um','Ingestion rate 196 um','Ingestion rate 228 um'};
 set6 = {'tL_Erdal_f1','tL_Erdal_f2','tL_Erdal_f3'}; subtitle6 = {'Length at three food concentration'};
 set7 = {'tWd_Erdal_f1','tWd_Erdal_f2','tWd_Erdal_f3'}; subtitle7 = {'Length at three food concentration'};
 set8 = {'WwJX_f1','WwJX_f2','WwJX_f3'}; subtitle8 = {'Ingestion rate for three diets'};
 set9 = {'tWw_f1','tWw_f2','tWw_f3'}; subtitle9 = {'Wet weight for three diets'};
 metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7,set8,set9}; 
 metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7,subtitle8,subtitle9}; 

%% Discussion points
 D1 = 'mod_1: birth at 2 days changed to age at veliger stage (39 h), added length at birth, egg diameter and length and age at metamorphosis : https://doi-org.ezproxy.library.wur.nl/10.1093/mollus/eyt044';
 D2 = 'mod_1: added age at metamorphosis at 28C, retrieved from: http://hdl.handle.net/10261/312659';     
 D3 = 'mod_1: commented out weight at birth, since age at birth changed';
 D4 = 'mod_1: all uni-variate data was added expect for LWw from Camacho1980'; 
 metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);
 
%% Links
metaData.links.id_CoL = '4TMNH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46469873'; % Ency of Life
metaData.links.id_Wiki = 'Ruditapes_decussatus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '139552'; % Taxonomicon
metaData.links.id_WoRMS = '231749'; % WoRMS
metaData.links.id_molluscabase = '231749'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ruditapes_decussatus}}';
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
bibkey = 'Cama1980'; type = 'phdthesis'; bib = [ ... 
'author = {Camacho, Alejandro}, ' ... 
'year = {1980}, ' ...
'title = {Biologia de \emph{Venerupis pullastra} ({M}ontagu, 1803) y \emph{Venerupis decussata} ({L}inne. 1767) (Mollusca, Bivalvia), con especial referenciaa, los factores determinantes de la produccion}, ' ...
'school = {Facultad de Biologia -Universidad de Santiago}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Juric2012'; type = 'Article'; bib = [ ... 
'author = {Juri\''{c}, I. and Bu\v{s}eli\''{c}, I. and Ezgeta-Bal\''{i}c. D. and Vrgo\v{c}, N. and Peharda, M.}, ' ... 
'year = {2012}, ' ...
'title = {Age, Growth and Condition Index of \emph{Venerupis decussata} ({L}innaeus, 1758) in the Eastern {A}driatic {S}ea}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences},' ...
'volume = {12}, ' ...
'pages = {613-618}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ojea2004'; type = 'Article'; bib = [ ... 
'author = {Ojea, J. and Pazos, A. J. and Mart\''{i}nez, D. and Novoa, S. and S\''{a}nchez, J. L. and Abad, M.}, ' ... 
'year = {2004}, ' ...
'title = {Seasonal variation in weight and biochemical composition of the tissues of \emph{Ruditapes decussatus} in relation to the gametogenic cycle}, ' ...
'journal = {Aquaculture},' ...
'volume = {238}, ' ...
'Issues = {1-4},' ...
'pages = {451-468}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Matias2010'; type = 'Article'; bib = [ ... 
'author = {Matias, D. and Joaquim, S. and Ramos, M. and Sobral, P. and Leit\~{a}o , A.}, ' ... 
'year = {2011}, ' ...
'title = {Biochemical compounds’ dynamics during larval development of the carpet-shell clam \emph{Ruditapes decussatus} ({L}innaeus, 1758): effects of mono-specific diets and starvation}, ' ...
'journal = {Helgoland Marine Research},' ...
'volume = {65}, ' ...
'pages = {369-379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beiras1994'; type = 'Article'; bib = [ ... 
'author = {Beiras, R. and P\''{e}rez Camacho, A. and Albentosa, M.}, ' ... 
'year = {1994}, ' ...
'title = {Influence of temperature on the physiology of growth in \emph{Ruditapes decussatus} ({L}) larvae}, ' ...
'journal = {Journal of Shellfish Research},' ...
'volume = {13}, ' ...
'No. = {1},' ...
'pages = {77-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Perez1994'; type = 'Article'; bib = [ ... 
'author = {P\''{e}rez-Camacho, A. and Beiras, R. and Albentosa, M.}, ' ... 
'year = {1994}, ' ...
'title = {Effects of algal food concentration and body size on the ingestion rates of \emph{Ruditapes decussatus} ({B}ivalvia) veliger larvae}, ' ...
'journal = {Marine Ecology Progress Series},' ...
'volume = {115}, ' ...
'pages = {87-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Albentosa1996'; type = 'Article'; bib = [ ... 
'author = {Albentosa, M. and P\''{e}rez-Camacho, A. and Labarta, U. and Fern\''{a}ndez-Reiziz, M. J.}, ' ... 
'year = {1996}, ' ...
'title = {Evaluation of live microalgal diets for the seed culture of \emph{Ruditapes decussatus} using physiological and biochemical parameters}, ' ...
'journal = {Aquaculture},' ...
'volume = {148}, ' ...
'issue = {1}, ' ...
'pages = {11-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Albentosa2007'; type = 'Article'; bib = [ ... 
'author = {Albentosa, M. and Fern\''{a}ndez-Reiziz, M. J. and Labarta, U. and P\''{e}rez-Camacho, A.}, ' ... 
'year = {2007}, ' ...
'title = {Response of two species of clams, \emph{Ruditapes decussatus} and \emph{Venerupis pullastra}, to starvation: {P}hysiological and biochemical parameters}, ' ...
'journal = {Comparative Biochemistry and Physiology},' ...
'volume = {146}, ' ...
'issue = {2}, ' ...
'pages = {241-249}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AranBur2014'; type = 'Article'; bib = [ ... 
'author = {Aranda-Burgos, J. A. and Da Costa, F. and N\''{o}voa, S. and Ojea, J. and Martínez-Pati\~{n}o, D.}, ' ... 
'year = {2014}, ' ...
'title = {Embryonic and larval development of \emph{Ruditapes decussatus} ({B}ivalvia: {V}eneridae): a study of the shell differentiation process}, ' ...
'journal = {Journal of Molluscan Studies},' ...
'volume = {80}, ' ...
'issue = {1}, ' ...
'pages = {8-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UrruIbar1999'; type = 'Article'; bib = [ ... 
'author = {Urrutia, M.B. and Ibarrola, I. and Iglesias, J.I.P and Navarro, E.}, ' ... 
'year = {1999}, ' ...
'title = {Energetics of growth and reproduction in a high-tidal population of the clam \emph{Ruditapes decussatus} from {U}rdaibai {E}stuary ({B}asque {C}ountry, {N}. {S}pain}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {42}, ' ...
'pages = {35-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Erdal2020'; type = 'Article'; bib = [ ... 
'author = {Erdal, H. and \"{O}nal, U.}, ' ... 
'year = {2020}, ' ...
'title = {The Growth and Survival of Carpet Clam, \emph{Ruditapes decussatus} in \c{C}ardak Estuary (\c{C}anakkale {S}trait, Northwest {T}urkey)},' ...
'journal = {Journal of Marine Science and Fisheries}, ' ...
'volume = {2}, ' ...
'pages = {120-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Maynou2021'; type = 'Article'; bib = [ ... 
'author = {Maynou, F. and Costa, S. and Freitas, R. and Sol\''{e}, M.}, ' ... 
'year = {2021}, ' ...
'title = {Effects of triclosan exposure on the energy budget of \emph{Ruditapes philippinarum} and \emph{R. decussatus} under climate change scenarios)},' ...
'journal = {Science of The Total Environment}, ' ...
'volume = {777}, ' ...
'no. = {146068}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sousa2011'; type = 'Article'; bib = [ ... 
'author = {de Sousa, J. T. and Matias, D. and Joaquim, S. and Ben-Hamadou, R. and Leit\tilde{a}o, A.}, ' ... 
'year = {2011}, ' ...
'title = {Growth variation in bivalves: New insights into growth, physiology and somatic aneuploidy in the carpet shell \emph{R. decussatus}},' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {406}, ' ...
'issue = {1-2}, ' ...
'pages = {46-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

