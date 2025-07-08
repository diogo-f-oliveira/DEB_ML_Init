function [data, auxData, metaData, txtData, weights] = mydata_Eriphia_verrucosa 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Eriphiidae';
metaData.species    = 'Eriphia_verrucosa'; 
metaData.species_en = 'Warty crab'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'aj';'ap';'am';'Li';'Wwb';'Wwi';'Ri';'GSI'}; 
metaData.data_1     = {'L-Ww'; 'Ww-JO_T'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Antonio Giacoletti'; 'Gianluca Sara'};    
metaData.date_subm = [2017 06 15];              
metaData.email    = {'anto.giacoletti@gmail.com'};            
metaData.address  = {'Department of Earth and Marine Sciences, University of Palermo'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 12];

%% set data
% zero-variate data

data.tj = 17;  units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'exoticsguide';   
  temp.tj = C2K(25); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'using values from Carcinus maenas';
data.tp = 250;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ADW';
  temp.tp = C2K(15);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'using values from Carcinus maenas';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'exoticsguide';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'using values from Carcinus maenas';

data.Li = 8;   units.Li  = 'cm';  label.Li  = 'carapace max lenght';   bibkey.Li  = 'sealifebase';

data.Wwb = 8.7114e-05;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'KaraAydi2016';
  comment.Wwb = 'computed from egg diameter=550 mum: 4/3*pi*(0.055/2)^3';
data.Wwi = 300;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'KaraAydi2016';

data.Ri = 224165/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'KaraAydi2016';   
  temp.Ri = C2K(22);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is meant for Mediterranen Sea';
data.GSI  = 0.16; units.GSI  = '-'; label.GSI  = 'gonado somatic index';          bibkey.GSI  = 'KaraAydi2016';   
  temp.GSI = C2K(22);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'max value of ovigerous females (mean weight of 300 gr) during the month of May';

% uni-variate data
% L-W data
data.LW = [ ... % total length (cm), wet weight (g) 
7.93	7.93	8.06	8.09	8.21	8.25	8.28	8.33	8.46	8.49	9.59	9.63	9.74	9.76	9.79	9.88	10.07	10.15	10.27	10.36	10.44	10.45	10.65	10.67	10.69	10.88	10.88	11.01	11.06	11.09	11.34	11.67	11.79	11.82	11.89	11.93	12.05	12.06	12.1	12.38	12.63	12.88	12.98	13.02	13.1	13.1	13.1	13.1	13.18	13.22	13.5	13.51	13.52	13.59	13.86	13.88	13.9	13.9	13.92	13.95	14.2	14.24	14.3	14.32	14.4	14.49	14.5	14.51	14.56	14.63	14.72	14.76	14.76	14.79	14.83	14.94	14.96	14.96	14.99	15.09	15.09	15.16	15.16	15.18	15.28	15.29	15.4	15.42	15.48	15.62	15.69	15.72	15.76	15.99	16.02	16.09	16.11	16.2	16.21	16.24	16.37	16.7	16.77	16.81	16.83	16.85	16.91	16.98	17	17.13	17.16	17.23	17.35	17.35	17.4	17.4	17.68	17.76	17.96	17.97	17.99	18.01	18.13	18.2	18.2	18.58	18.68	18.68	18.91	19	19	19.03	19.03	19.59	19.61	20.31	20.41	20.53	20.7	20.8	21.6	21.6	21.9	21.9	22.6	22.6	22.61	22.85	23	23	23	23.44	23.47	23.52	23.59	23.75	23.88	23.97	24.07	24.56	24.97	25.07	25.23	25.4	25.4	25.42	25.59	25.66	25.83	25.93	26.3	26.3	26.3	26.38	26.45	26.5	26.5	27.1	27.1	28.24	28.66	29.44	29.63	29.64	29.73	29.93	30.7	30.7	31	31	31.5	31.5	32.25	32.37	32.8	32.8	32.88	32.98	33.08	33.26	33.29	33.34	33.36	33.36	33.44	33.52	33.6	33.6	33.62	33.62	33.64	33.78	33.8	33.9	33.9	34.01	34.41	34.52	34.57	34.7	34.7	34.82	35.2	35.2	35.27	35.28	36.4	36.4	36.8	36.8	37.5	37.56	37.72	37.81	38.15	38.82	39.3	39.3	39.69	39.87	41	41	41.5	41.5	41.9	41.9	42.19	42.23	42.75	43.16	43.38	43.42	44.05	44.29	51.4	51.4	51.5	51.5	52.1	52.1	55.3	55.3	55.7	55.7	64.4	64.4	77.2	77.2;
2.258	2.173	2.151	2.096	2.175	2.199	2.18	2.171	2.087	2.129	2.28	2.239	2.254	2.359	2.137	2.305	2.337	2.33700001	2.294	2.192	2.157	2.391	2.401	2.403	2.486	2.355	2.351	2.281	2.401	2.432	2.421	2.414	2.491	2.479	2.508	2.452	2.544	2.351	2.503	2.625	2.518	2.664	2.537	2.653	2.605	2.605	2.605	2.605	2.661	2.47	2.559	2.611	2.63	3.153	2.64	2.602	2.672	2.672	2.662	2.714	2.712	2.636	2.742	2.65	2.654	2.661	2.615	2.623	2.692	2.628	2.62	2.661	2.711	2.732	2.625	2.656	2.705	2.678	2.776	2.668	2.594	2.83	2.702	2.703	2.757	2.867	2.806	2.765	2.795	2.811	2.716	2.759	2.774	2.734	2.751	2.8	2.779	2.717	2.717	2.688	3.394	2.75	2.874	2.798	2.66	2.732	2.99	2.919	2.946	2.786	2.766	2.742	2.794	3.092	2.913	2.913	2.878	2.729	3.004	2.912	3.079	3.025	3.047	3.018	3.018	3.026	3.101	3.055	2.893	2.443	2.443	2.906	2.884	2.912	2.858	2.938	3.028	2.745	2.933	2.959	3.211	3.211	3.102	3.102	3.249	3.249	3.279	3.085	2.927	3.136	3.136	3.122	3.086	3.087	3.018	3.061	3.211	3.064	3	3.057	3.04	3.032	2.99	3.367	3.367	3.226	3.25	3.084	3.062	3.151	3.156	3.296	3.296	3.177	3.183	3.06	3.06	3.118	3.118	3.387	3.585	3.56	3.435	3.356	3.399	3.324	3.124	3.124	3.47	3.47	3.331	3.331	3.551	3.472	3.008	3.008	3.528	3.478	3.493	3.481	3.644	3.253	3.332	3.332	3.36	3.643	3.699	3.699	3.51	3.367	3.447	3.467	3.26	3.611	3.611	3.208	3.347	3.454	3.456	3.63	3.63	3.267	3.611	3.611	3.419	3.418	4.021	4.021	3.732	3.732	3.811	3.846	3.668	3.759	3.801	3.773	3.753	3.753	3.765	3.774	3.81	3.81	3.838	3.838	3.954	3.954	3.672	3.793	3.691	3.792	3.788	3.679	3.728	3.676	4.118	4.118	4.117	4.117	3.882	3.882	3.795	3.795	3.392	3.392	4.268	4.268	4.589	4.589
]';
data.LW = data.LW (:,[2,1]);
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Giac2016';
comment.LW = 'records from Isola delle Femmine, Palermo, individuals collected in 2012 and 2015';  

% wet-weight O2 consumption at different temps
% the volume of the rr chamber was 0.550 L
data.WwJO1 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
21.9000	33.9000	35.2000	36.8000	51.5000;
22.1286	16.9000	22.7665	19.6500	19.9045
]';
data.WwJO1(:,2) = data.WwJO1(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO1 = C2K(11); units.temp.WwJO1 = 'K'; label.temp.WwJO1 = 'temperature';
units.WwJO1 = {'g', 'mumol/h'};     label.WwJO1 = {'wet weight', 'O_2 consumption rate', '11 C'};  
bibkey.WwJO1 = 'Giac2016';
% 
data.WwJO2 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
21.9000	33.9000	35.2000	36.8000	51.5000;
46.2334	22.4644	41.9591	36.0100	36.8900
]';
data.WwJO2(:,2) = data.WwJO2(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO2 = C2K(14); units.temp.WwJO2 = 'K'; label.temp.WwJO2 = 'temperature';
units.WwJO2 = {'g', 'mumol/h'};     label.WwJO2 = {'wet weight', 'O_2 consumption rate', '14 C'};  
bibkey.WwJO2 = 'Giac2016';
% 
data.WwJO3 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
17.4000	31.0000	33.6000	34.7000	41.9000;
22.6253	35.1446	46.1333	36.0155	65.6759
]';
data.WwJO3(:,2) = data.WwJO3(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO3 = C2K(17); units.temp.WwJO3 = 'K'; label.temp.WwJO3 = 'temperature';
units.WwJO3 = {'g', 'mumol/h'};     label.WwJO3 = {'wet weight', 'O_2 consumption rate', '17 C'};  
bibkey.WwJO3 = 'Giac2016';
% 
data.WwJO4 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
17.4000	31.0000	33.6000	34.7000	41.9000;
36.0225	36.6356	52.6268	37.7966	48.7856
]';
data.WwJO4(:,2) = data.WwJO4(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO4 = C2K(20); units.temp.WwJO4 = 'K'; label.temp.WwJO4 = 'temperature';
units.WwJO4 = {'g', 'mumol/h'};     label.WwJO4 = {'wet weight', 'O_2 consumption rate', '20 C'};  
bibkey.WwJO4 = 'Giac2016';
% 
data.WwJO5 = [ ... % % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
13.9000	18.2000	26.3000	32.8000	41.5000;
36.5214	45.9278	59.4088	86.0596	121.8184
]';
data.WwJO5(:,2) = data.WwJO5(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO5 = C2K(23); units.temp.WwJO5 = 'K'; label.temp.WwJO5 = 'temperature';
units.WwJO5 = {'g', 'mumol/h'};     label.WwJO5 = {'wet weight', 'O_2 consumption rate', '23 C'};  
bibkey.WwJO5 = 'Giac2016';
% 
data.WwJO6 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
13.9000	18.2000	26.3000	32.8000	41.5000;
51.8924	58.4905	92.2232	80.1848	90.7778
]';
data.WwJO6(:,2) = data.WwJO6(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO6 = C2K(26); units.temp.WwJO6 = 'K'; label.temp.WwJO6 = 'temperature';
units.WwJO6 = {'g', 'mumol/h'};     label.WwJO6 = {'wet weight', 'O_2 consumption rate', '26 C'};  
bibkey.WwJO6 = 'Giac2016';
% 
data.WwJO7 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
	13.1000	19.0000	23.0000	39.3000 41.0000;
	144.6437	43.3148	134.7005	142.9913 109.1401
]';
data.WwJO7(:,2) = data.WwJO7(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO7 = C2K(29); units.temp.WwJO7 = 'K'; label.temp.WwJO7 = 'temperature';
units.WwJO7 = {'g', 'mumol/h'};     label.WwJO7 = {'wet weight', 'O_2 consumption rate', '29 C'};  
bibkey.WwJO7 = 'Giac2016';
% 
data.WwJO8 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
13.1000	21.6000	22.6000	25.4000	51.4000;
77.1378	124.0886	103.4902	115.5696	47.2578
]';
data.WwJO8(:,2) = data.WwJO8(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO8 = C2K(30); units.temp.WwJO8 = 'K'; label.temp.WwJO8 = 'temperature';
units.WwJO8 = {'g', 'mumol/h'};     label.WwJO8 = {'wet weight', 'O_2 consumption rate', '30 C'};  
bibkey.WwJO8 = 'Giac2016';
% 
data.WwJO9 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
13.1000	21.6000	22.6000	25.4000	51.4000;
102.2039	105.1977	112.9535	108.4409	53.1226
]';
data.WwJO9(:,2) = data.WwJO9(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO9 = C2K(31); units.temp.WwJO9 = 'K'; label.temp.WwJO9 = 'temperature';
units.WwJO9 = {'g', 'mumol/h'};     label.WwJO9 = {'wet weight', 'O_2 consumption rate', '31 C'};  
bibkey.WwJO9 = 'Giac2016';
% 
data.WwJO10 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
13.1000	19.0000	23.0000	39.3000	41.0000;
40.0254	68.2102	86.4834	69.0900	81.6248
]';
data.WwJO10(:,2) = data.WwJO10(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO10 = C2K(32); units.temp.WwJO10 = 'K'; label.temp.WwJO10 = 'temperature';
units.WwJO10 = {'g', 'mumol/h'};     label.WwJO10 = {'wet weight', 'O_2 consumption rate', '32 C'};  
bibkey.WwJO10 = 'Giac2016';
% 
data.WwJO11 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
26.5000	27.1000	31.5000	52.1000	77.2000;
54.1969	91.4324	109.0321	71.7000	72.8100
]';
data.WwJO11(:,2) = data.WwJO11(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO11 = C2K(33); units.temp.WwJO11 = 'K'; label.temp.WwJO11 = 'temperature';
units.WwJO11 = {'g', 'mumol/h'};     label.WwJO11 = {'wet weight', 'O_2 consumption rate', '33 C'};  
bibkey.WwJO11 = 'Giac2016';
% 
data.WwJO12 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
26.5000	27.1000	31.5000	52.1000	77.2000;
113.0370	62.2338	139.1442	68.8700	71.4700
]';
data.WwJO12(:,2) = data.WwJO12(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO12 = C2K(34); units.temp.WwJO12 = 'K'; label.temp.WwJO12 = 'temperature';
units.WwJO12 = {'g', 'mumol/h'};     label.WwJO12 = {'wet weight', 'O_2 consumption rate', '34 C'};  
bibkey.WwJO12 = 'Giac2016';
% 
data.WwJO13 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
30.7000	36.4000	55.3000	55.7000	64.4000;
74.6075	111.3912	143.2674	62.3711	162.4371
]';
data.WwJO13(:,2) = data.WwJO13(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO13 = C2K(35); units.temp.WwJO13 = 'K'; label.temp.WwJO13 = 'temperature';
units.WwJO13 = {'g', 'mumol/h'};     label.WwJO13 = {'wet weight', 'O_2 consumption rate', '35 C'};  
bibkey.WwJO13 = 'Giac2016';
%
data.WwJO14 = [ ... % wet weight (g), O2 consumption (mumol O2 l-1 h-1)  
30.7000	36.4000	55.3000	55.7000	64.4000;
59.8613	95.0093	181.4833	110.8100	164.3178
]';
data.WwJO14(:,2) = data.WwJO14(:,2) * 0.550; % convert mumol O2 h-1 l-1 to mumol O2 h-1
  temp.WwJO14 = C2K(36); units.temp.WwJO14 = 'K'; label.temp.WwJO14 = 'temperature';
units.WwJO14 = {'g', 'mumol/h'};     label.WwJO14 = {'wet weight', 'O_2 consumption rate', '36 C'};  
bibkey.WwJO14 = 'Giac2016';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = weights.Wwi * 5;
weights.Ri = weights.Ri * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = weights.psd.p_M * 5;
weights.psd.v = weights.psd.v * 5;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'WwJO5','WwJO4','WwJO3','WwJO2','WwJO1'}; subtitle1 = {'Data at 23, 20, 17, 14, 11 C'};
set2 = {'WwJO10','WwJO9','WwJO8','WwJO7','WwJO6'}; subtitle2 = {'Data at 32, 31, 30, 29, 26 C'};
set3 = {'WwJO14','WwJO13','WwJO12','WwJO11'}; subtitle3 = {'Data at 36, 35, 34, 33 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6H2X2'; % Cat of Life
metaData.links.id_ITIS = '199975'; % ITIS
metaData.links.id_EoL = '46510183'; % Ency of Life
metaData.links.id_Wiki = 'Eriphia_verrucosa'; % Wikipedia
metaData.links.id_ADW = 'Eriphia_verrucosa'; % ADW
metaData.links.id_Taxo = '374413'; % Taxonomicon
metaData.links.id_WoRMS = '107409'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eriphia_verrucosa}}';
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
bibkey = 'KaraAydi2016'; type = 'Article'; bib = [ ...  data on max reproduction rate
'author = {Karadurmus, U. and Aydin, M.}, ' ...
'year = {2016}, ' ...
'title  = {An investigation on some biological and reproduction characteristics of \emph{Eriphia verrucosa} ({F}orsk\r{a}l, 1775) in the {S}outh {B}lack {S}ea ({T}urkey)}, ' ...
'journal = {Turkish Journal of Zoology}, ' ...
'volume = {40}, ' ...
'pages = {461-470}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Giac2016'; type = 'Misc'; bib = ...
'note = {Experimental laboratory measurement from crabs collected in the {P}alermo coast line}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Carcinus_maenas/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'exoticsguide'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.exoticsguide.org/carcinus_maenas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{www.sealifebase.org/summary/Eriphia-verrucosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
