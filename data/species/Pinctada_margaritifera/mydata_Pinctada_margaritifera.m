function [data, auxData, metaData, txtData, weights] = mydata_Pinctada_margaritifera
%% set metaData

metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pterioida'; 
metaData.family     = 'Pteriidae';
metaData.species    = 'Pinctada_margaritifera'; 
metaData.species_en = 'Black-lip pearl oyster'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab';'aj'; 'ap';'am'; 'Lb';'Lj'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-Wd'; 'L-JO_f'; 'Wd-JO_fT'; 'Wd-F'; 'L-F'; 'T-F'; 'X-JX_f'}; 

metaData.COMPLETE = 3.4; % using criteria of LikaKear2011

metaData.author   = {'Nathanael Sangare'}; 
metaData.date_subm = [2019 05 03];
metaData.email    = {'nathanael.sangare@ifremer.fr'}; 
metaData.address  = {'IFREMER, 98719, French Polynesia'};

metaData.author_mod_1   = {'Bas Kooijman'}; 
metaData.date_mod_1     = [2020 11 12];
metaData.email_mod_1    = {'bas.kooijman@vu.nl'}; 
metaData.address_mod_1  = {'VU University Amsterdam'};

metaData.author_mod_2   = {'Cristian Monaco'}; 
metaData.date_mod_2     = [2021 09 22];
metaData.email_mod_2    = {'cristian.monaco@ifremer.fr'}; 
metaData.address_mod_2  = {'IFREMER, 98719, French Polynesia'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 09 22]; 

%% set data

% zero-variate data;
data.ab = 1;      units.ab = 'd';    label.ab = 'age at birth stage';  bibkey.ab = 'SoutLuca2011';
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'observed age at birth is frequently larger than ab, because of diapauzes during incubation; mean value taken from several measurements';
data.aj = 18;      units.aj = 'd';    label.aj = 'age at metamorphosis';  bibkey.aj = 'Sang2019';
  temp.aj = C2K(28.1);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = 'Plantigrade larvae, 23 d, 240 um'; 
data.ap = 365;     units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'Pouv2000';
  temp.ap = C2K(28);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
comment.ap = 'based on a family of maximal length equal to 14 cm';
data.am = 20*365;     units.am = 'd';    label.am = 'ultimate age'; bibkey.am = 'guess';
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Crassostrea gigas';

data.Lb  = 0.006;   units.Lb  = 'cm';   label.Lb  = 'shell diameter';  bibkey.Lb  = 'Sang2019';   
data.Lj  = 0.0180;   units.Lj  = 'cm';   label.Lj  = 'shell diameter';    bibkey.Lj  = 'Sang2019';  
data.Lp  = 4;   units.Lp  = 'cm';   label.Lp  = 'shell height';               bibkey.Lp  = 'Pouv2000'; 
  comment.Lp = 'Based on a family of maximal length equal to 14 cm';
data.Li  = 30;   units.Li  = 'cm';   label.Li  = 'ultimate shell height';    bibkey.Li  = 'guess';
  comment.Li = ['Maximal length data vary from 14 to 25 cm depending on the study; '...
      'Shell height: length from the heel to the furthermost edge of non-nacreous border, ' ...
      'excluding digitate processes without taking into account the curve of the right shell'];

data.Wwb  = 1.6e-7;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Sang2019';  
  comment.Wwb = 'based on egg diameter of 67 mum: pi/6*67e-4^3';

data.GSI  = 0.5;    units.GSI = '-';  label.GSI  = 'Gonado Somatic Index'; bibkey.GSI  = 'Four2011';   
  temp.GSI = C2K(28);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'Calculated from a surface area ratio between total flesh and gonad';
  
%% Uni-variate data

% time - shell height : shell height and wet weights were measured at the same time
data.tL = [236	236	236	236	278	291	292	292	292	305	347	347	347	347	389	417	433	438	438	438	475	480	480	485	514	522	534	535	535	535	535	535	542	548	548	548	555	598	598	657	657	657	657	676	677	677	677	677	677	694	694	705	705	740	740	767	768	787	787	787	816	816	851	851	901	901	917	921	921	922	922	955	955	979	989	989;    
    % d, time since birth
 26.99	27.68	23.09	25.02	35.12	45.45	42.31	41.23	44.77	34.47	42.06	48.57	36.60	34.70	54.59	43.90	49.86	48.24	46.38	49.28	62.27	56.83	58.65	63.04	46.26	77.34	57.91	45.07	52.29	60.08	74.86	58.35	57.00	57.80	57.24	56.96	63.68	70.69	70.39	50.72	66.12	74.11	69.96	70.62	89.66	62.84	50.60	57.64	71.47	71.58	65.60	68.62	69.75	75.61	72.42	56.17	67.61	58.61	59.51	72.19	82.23	73.60	83.94	79.14	68.41	94.07	63.22	96.47	81.76	77.91	92.26	88.32	84.84	80.88	88.00	83.36]';  
       % mm, diameter of the larvae till shell formation, and then shell height
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3; end; end
data.tL(:,2) = data.tL(:,2) * 1e-1; % mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  bibkey.tL = 'CLKy2017';
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'homogenous individual  sacrificed, time mesurement error  +-2mois, f and  T variables (in situ)'; % optional field

data.tL3 = [580	620	641	655	682	691	717	745	760	776	799	826	844	882	918	930	945	966	991	1030	1040	1060	1060	1070	1080	1090	1110	1130	1130	1140	1160	1190	1220	1250	1280	1340	1370	1410	1440	1470	1510;    
   % d, time since birth
 8.42	9.67	9.17	8.68	9.23	9.82	10.4	9.79	10.2	10.7	10.2	10.9	10.5	11	11.2	10.8	12.3	11.2	10.9	10.9	12.4	12.1	11.3	11.7	12.5	11.3	11.8	12.5	11.4	11.9	12	12.1	12.2	12.4	12.5	12.5	12.7	12.8	12.7	12.7	12.8]';  
   % cm, diameter of the larvae till shell formation, and then shell height
for i=2:size(data.tL3,1);if data.tL3(i,1)<=data.tL3(i-1,1);data.tL3(i,1)=data.tL3(i-1,1)+1e-3; end; end
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since birth', 'shell height'};  bibkey.tL3 = 'Pouv2001';
temp.tL3    = C2K(28);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
comment.tL3 = 'homogenous individual  sacrificed, time mesurement error  +-2mois, f and  T variables (in situ) from several atool lagoon'; 

% time - shell height
data.tLC4 = [1 9 13	16	18	23; % d, age since birth
  67 99 116 175 210 364]'; % mum, shell height
data.tLC4(:,2) = data.tLC4(:,2) * 1e-4; % mum to cm
units.tLC4   = {'d', 'cm'};  label.tLC4 = {'time since birth', 'shell height'};  bibkey.tLC4 = 'Sang2019';
temp.tLC4    = C2K(29);  units.temp.tLC4 = 'K'; label.temp.tLC4 = 'temperature';
comment.tLC4 = 'data from Vairao raceway; known T & f'; 

data.tLC3 = [1 9 13	16	18 23; %d, age since birth   
  67 92 111 154 188 314]'; % mum, shell height   
data.tLC3(:,2) = data.tLC3(:,2) * 1e-4; % mum to cm
units.tLC3   = {'d', 'cm'};  label.tLC3 = {'time since birth', 'shell height'};  bibkey.tLC3 = 'Sang2019';
temp.tLC3    = C2K(29);  units.temp.tLC3 = 'K'; label.temp.tLC3 = 'temperature';
comment.tLC3 = 'data from Vairao raceway; known T & f'; % optional field
%
data.tLC2 = [1 9 13	16	18	23	27; % d, age since birth
  67 90 97 120 136 173 224]'; % mum, shell height
data.tLC2(:,2) = data.tLC2(:,2) * 1e-4; % mum to cm
units.tLC2   = {'d', 'cm'};  label.tLC2 = {'time since birth', 'shell height'};  bibkey.tLC2 = 'Sang2019';
temp.tLC2    = C2K(29);  units.temp.tLC2 = 'K'; label.temp.tLC2 = 'temperature';
comment.tLC2 = 'data from Vairao raceway; known T & f'; % optional field

data.tLC1 = [1 9 13	16	18	23	27 31 35; % d, age since birth
  67 77 85 94 101 134 174 192 212]'; % mum, shell height
data.tLC1(:,2) = data.tLC1(:,2) * 1e-4; % um to cm
units.tLC1   = {'d', 'cm'};  label.tLC1 = {'time since birth', 'shell height'};  bibkey.tLC1 = 'Sang2019';
temp.tLC1    = C2K(29);  units.temp.tLC1 = 'K'; label.temp.tLC1 = 'temperature';
comment.tLC1 = 'data from Vairao raceway; known T & f';

% length - wet weight
data.LWw = [ 105	115	117	120	124	124	124	125	126	130	130	132	134	134	135	135	135	135	136	138	138	138	140	140	140	140	140	140	142	142	143	143	145	145	145	145	145	145	145	145	145	146	147	148	148	149	149	150	150	150	150	150	150	150	152	153	153	153	154	154	154	155	155	155	155	155	155	157	158	159	160	160	160	160	160	160	161	162	163	165	165	165	165	165	171	179;
  % mm, shell height     
     48	43	46	44	52	54.4	60	58	72	67	71	86	57	77	45.9	53	56	75	73	65	66	100	56	58	64	66	67	72	45.8	66	51	59	49	56	62.7	63	69	72	76	76.5	78	63	68.3	99	78.2	60.6	65.1	71	73.8	75	75	77	78	88	73.6	62	78	91	81.1	83	88	65.2	66	66.4	70.1	84	86	87	66.4	79.1	63	70.9	76.5	76.9	81	116	85	104	110	69.5	78	85.9	86	90	91	105]';
 % g, wet weight
data.LWw(:,1) = data.LWw(:,1) * 1e-1; % mm to cm
units.LWw = {'cm', 'g'};     label.LWw = {'shell height', 'flesh wet weight'};  bibkey.LWw = 'Four2011';
comment.LWw = 'data from Vairao lagoon';

% length-dry weight
data.LWd4 = [147 150 144 145 155 147 136 126 135 128 139 143 150 122 147; % mm, shell height
  6.02	6.34	6.26	5.95	6.10	5.47	4.23	4.66	5.22	4.19	3.77	4.59	5.43	3.72	6.16]'; % g, dry weight
data.LWd4(:,1) = data.LWd4(:,1) * 1e-1; % mm to cm
units.LWd4 = {'cm', 'g'};     label.LWd4 = {'shell height', 'flesh dry weight'};  bibkey.LWd4 = 'Chav2013';
comment.LWd4 = 'data from Vairao raceway'; % optional field
%
data.LWd41 = [ 160	148	134	140	118	140	124	139	120	145	133	157	150	136	124	153	158	130; % mm, shell height
  7.44	4.99	4.56	6.91	3.66	6.70	3.60	7.50	4.94	4.56	5.71	5.62	5.62	4.58	4.18	4.89	5.63	3.31]'; %  g, dry weight
 data.LWd41(:,1) = data.LWd41(:,1) * 1e-1; % mm to cm
units.LWd41 = {'cm', 'g'};     label.LWd41 = {'shell height', 'flesh dry weight'};  bibkey.LWd41 = 'Chav2013';
comment.LWd41 = 'data from Vairao raceway'; % optional field
%
data.LWd42 = [ 140	135	160	144	140	145	140	150	135	150	155	145	150	133	145	130	130; % mm, shell height  
5.02	4.91	7.04	8.17	5.20	5.64	3.94	5.06	5.58	7.37	5.39	6.65	6.49	5.24	6.65	4.18	4.90]'; %  g, dry weight
data.LWd42(:,1) = data.LWd42(:,1) * 1e-1; % mm to cm
units.LWd42 = {'cm', 'g'};     label.LWd42 = {'shell height', 'flesh dry weight'}; bibkey.LWd42 = 'Chav2013';
comment.LWd42 = 'data from Vairao raceway'; % optional field
%
data.LWd43 = [ 148	142	165	129	155	137	153	147	115	130	127	150	125	135	130	125	135	126; % mm, shell height  
8.36	6.28	7.14	4.29	6.26	6.83	6.98	5.60	4.13	3.61	6.76	7.90	4.81	5.69	4.13	5.05	5.52	3.64]'; %  g, dry weight
data.LWd43(:,1) = data.LWd43(:,1) * 1e-1; % mm to cm
units.LWd43 = {'cm', 'g'};     label.LWd43 = {'shell height', 'flesh dry weight'};  bibkey.LWd43 = 'Chav2013';
comment.LWd43 = 'data from Vairao raceway'; % optional field
%
data.LWd44 = [ 134	150	126	142	125	156	128	140	140	119	120	140	153	130; % mm, shell height  
7.15	4.27	4.91	5.35	4.41	7.13	4.29	6.42	4.58	4.05	4.23	7.73	6.26	4.42]'; %  g, dry weight
data.LWd44(:,1) = data.LWd44(:,1) * 1e-1; % mm to cm
units.LWd44 = {'cm', 'g'};     label.LWd44 = {'shell height', 'flesh dry weight'}; bibkey.LWd44 = 'Chav2013';
comment.LWd44 = 'data from Vairao raceway'; % optional field
%
data.LWd45 = [ 125	140	130	127	107	154	129	127	144	129	120	135	134	114	128	160	139	150	145; % mm, shell height
5.28	5.58	5.77	6.32	3.62	7.83	4.89	3.62	7.05	3.34	4.42	4.94	5.56	4.56	5.64	8.72	5.08	6.13	5.19]'; %  g, dry weight
data.LWd45(:,1) = data.LWd45(:,1) * 1e-1; % mm to cm
units.LWd45 = {'cm', 'g'};     label.LWd45 = {'shell height', 'flesh dry weight'};  bibkey.LWd45 = 'Chav2013';
comment.LWd45 = 'data from Vairao raceway'; 

% Tissue dry weight vs O2 consumption rate
data.WdJO = [3.927	3.936	4.18	4.895	4.909	5.021	5.064	5.196	5.239	5.391	5.584	5.639	6.493	6.649	6.651	7.041	7.366	8.166; 
%   g, flesh dry weight
0.846430285	0.812388617	0.980659473	1.200243111	1.380189526	1.580613848	1.534479345	0.752195648	1.299362196	1.441316612	1.965617395	1.286230442	0.854091449	1.150397163	1.851861073	1.55154818	0.995305583	1.48094213]';     
%   mgO2/h, oxygen consumption  
temp.WdJO    = C2K(24);  units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature';
units.WdJO = {'g','mg O_2/h'};     label.WdJO = {'flesh dry weight', 'oxygen consumption'};  bibkey.WdJO = 'Chav2013';
comment.WdJO = 'data from Vairao raceway. Iso-Chaeto microalgae mix, 5000 cell ml-1'; 
%
data.WdJO1 = [3.335	3.616	3.621	4.415	4.559	4.885	4.943	5.048	5.08	5.189	5.276	5.561	5.578	5.641	5.774	6.132	6.32	7.052	7.828	8.72; 
%   g, flesh dry weight
1.324592274	1.740449112	1.201434461	1.607317068	1.445713525	2.848695221	1.38317091	3.444779577	2.481232401	0.821829617	1.050729909	2.144309991	2.830652401	1.715019148	2.928004079	2.440858132	1.23994069	3.035318618	3.898366325	1.861630227]'; 
%   mgO2/h, oxygen consumption  
temp.WdJO1    = C2K(24);  units.temp.WdJO1 = 'K'; label.temp.WdJO1 = 'temperature';
units.WdJO1 = {'g','mg O_2/h'};     label.WdJO1 = {'flesh dry weight', 'oxygen consumption'};   bibkey.WdJO1 = 'Chav2013';
comment.WdJO1 = 'data from Vairao raceway. Iso-Chaeto microalgae mix, 30000 cell ml-1'; 
%
data.WdJO2 = [ 2.556	3.306	3.599	3.658	4.18	4.556	4.575	4.887	4.941	4.991	5.124	5.62	5.624	5.71	6.7	7.44	7.5; 
%   g, flesh dry weight
1.084654033	2.907	2.398592636	2.098993919	0.862595523	2.789216611	1.638236141	2.520399682	1.960863021	2.941458212	1.514169182	2.159302978	0.975808976	1.153291889	1.842765031	2.013571771	3.128193976]'; 
%   mgO2/h, oxygen consumption
temp.WdJO2    = C2K(27);  units.temp.WdJO2 = 'K'; label.temp.WdJO2 = 'temperature';
units.WdJO2 = {'g','mg O_2/h'};     label.WdJO2 = {'flesh dry weight', 'oxygen consumption'};   bibkey.WdJO2 = 'Chav2013';
comment.WdJO2 = 'data from Vairao raceway, 5000 cell ml-1'; 
%
data.WdJO3 = [  4.052	4.232	4.273	4.285	4.413	4.423	4.575	4.911	5.349	5.592	6.261	6.424	7.13	7.15	7.727; 
%   g, flesh dry weight
2.071104231	2.249295443	1.304574377	2.158644078	1.924990796	1.359799979	4.155427307	3.472267769	3.613075596	2.784769433	2.108849427	4.116758917	4.35704274	2.330494095	1.952413203]'; 
%   mgO2/h, oxygen consumption
temp.WdJO3    = C2K(27);  units.temp.WdJO3 = 'K'; label.temp.WdJO3 = 'temperature';
units.WdJO3 = {'g','mg O_2/h'};     label.WdJO3 = {'flesh dry weight', 'oxygen consumption'};   bibkey.WdJO3 = 'Chav2013';
comment.WdJO3 = 'data from Vairao raceway, 30000 cell ml-1';
%
data.WdJO4 = [ 3.719	3.773	4.194	4.23	4.273	4.589	4.657	5.218	5.43	5.467	5.952	6.02	6.097	6.157	6.261	6.337; 
%   g, flesh dry weight
1.230214499	1.680144003	2.148188616	2.28240084	2.26180403	2.386501387	1.233173953	1.491915045	2.158118997	1.437943695	2.022984008	1.065753641	3.517004789	1.69488634	2.28238267	1.862921104]'; 
%   mgO2/h, oxygen consumption
temp.WdJO4    = C2K(30);  units.temp.WdJO4 = 'K'; label.temp.WdJO4 = 'temperature';
units.WdJO4 = {'g','mg O_2/h'};     label.WdJO4 = {'flesh dry weight', 'oxygen consumption'};   bibkey.WdJO4 = 'Chav2013';
comment.WdJO4 = 'data from Vairao raceway, 5000 cell ml-1'; 
%
data.WdJO5 = [3.137	3.607	4.13	4.131	4.287	4.807	5.051	5.234111111	5.249285714	5.523	5.6	5.687	6.261	6.279	6.758	6.83	6.975	7.903	8.362; 
%   g, flesh dry weight
1.989561296	2.560904645	1.727880685	1.539668778	3.108739938	3.454331896	1.565514654	3.631168888	2.889305077	2.001499814	3.455217194	3.683687376	4.38	3.696845373	1.777400376	2.502317608	3.254469101	4.305023311	2.29783217]'; 
%   mgO2/h, oxygen consumption
temp.WdJO5    = C2K(30);  units.temp.WdJO5 = 'K'; label.temp.WdJO5 = 'temperature';
units.WdJO5 = {'g','mg O_2/h'};     label.WdJO5 = {'flesh dry weight', 'oxygen consumption'};   bibkey.WdJO5 = 'Chav2013';
comment.WdJO5 = 'data from Vairao raceway, 30000 cell ml-1'; 

% length-O2 consumption
data.LJO4 = [67 99 116 175 210 ;  % mum, shell height  
  0.075 0.467 0.815 2.999 5.819]'; % ng O2/h, oxygen consumption
data.LJO4(:,1) = data.LJO4(:,1) * 1e-4; % mum to cm
units.LJO4   = {'cm', 'ng O_2/h'};  label.LJO4 = {'shell height', 'oxygen consumption'};  bibkey.LJO4 = 'Sang2019';
temp.LJO4    = C2K(29);  units.temp.LJO4 = 'K'; label.temp.LJO4 = 'temperature';
comment.LJO4 = 'Vairao raceway'; 
%
data.LJO3 = [67 99 111 154 188;  % mum, shell height
  0.075 0.588 0.805 1.881 4.138]'; % ng O2/h, oxygen consumption
data.LJO3(:,1) = data.LJO3(:,1) * 1e-4; % mum to cm
units.LJO3   = {'cm', 'ng O_2/h'};  label.LJO3 = {'shell height', 'oxygen consumption'};  bibkey.LJO3 = 'Sang2019';
temp.LJO3    = C2K(29);  units.temp.LJO3 = 'K'; label.temp.LJO3 = 'temperature';
comment.LJO3 = 'Vairao raceway'; 
%
data.LJO2 = [67 90 97 120 136 173; % mum, shell height 
  0.075 0.367 0.510 0.724 1.296 3.170]'; % ng O2/h, oxygen consumption
data.LJO2(:,1) = data.LJO2(:,1) * 1e-4; % mum to cm
units.LJO2   = {'cm', 'ng O_2/h'};  label.LJO2 = {'shell height', 'oxygen consumption'};  bibkey.LJO2 = 'Sang2019';
temp.LJO2    = C2K(29);  units.temp.LJO2 = 'K'; label.temp.LJO2 = 'temperature';
comment.LJO2 = 'Vairao raceway'; 
%
data.LJO1 = [67 77 85 94 101 134 174 192; % um, shell height
  0.075 0.099 0.229 0.294 0.439 1.061 2.100 2.590]'; % ng O2/h, oxygen consumption
data.LJO1(:,1) = data.LJO1(:,1) * 1e-4; % mum to cm
units.LJO1   = {'cm', 'ng O_2/h'};  label.LJO1 = {'shell height', 'oxygen consumption'};  bibkey.LJO1 = 'Sang2019';
temp.LJO1    = C2K(29);  units.temp.LJO1 = 'K'; label.temp.LJO1 = 'temperature';
comment.LJO1 = 'Vairao raceway sample volume, 0.32l'; 

% Dry weight - filtering rate
data.WdF = [0.59	0.75	0.91	1.02	1.08	1.30	1.45	1.52	1.60	1.73	1.77	1.91	1.94	1.97	1.99	2.02	2.03	2.05	2.07	2.17	2.20	2.24	2.25	2.29	2.34	2.36	2.50	2.63	2.73	2.78	2.80	3.13	3.62	3.80	3.92	4.17	4.17	4.42	4.53	4.59	4.61	4.67	4.75	4.79	4.85	4.95	5.01	5.02	5.23	5.24	5.25	5.31	5.32	5.43	5.45	5.59	5.72	5.74	5.77	5.80	5.84	5.97	6.07	6.14	6.23	6.43	6.45	6.52	6.52	6.59	6.66	6.75	6.92	6.92	6.95	7.28	7.29	7.35	7.46	7.52	7.57	7.57	7.63	7.69	7.82	7.86	7.94	7.97	8.03	8.04	8.29	8.38	8.42	8.43	8.53	8.62	8.68	8.82	8.87	9.05	9.07	9.16	9.44	9.78	9.95	10.29	10.44;
  % g, dry flesh weight
30.24	24.05	18.75	31.92	26.31	26.34	44.33	26.52	41.31	23.14	28.91	52.37	38.84	61.10	46.24	38.63	35.82	42.63	45.88	43.46	35.48	45.98	29.12	56.71	38.97	33.20	33.89	35.45	38.87	41.54	37.25	49.64	48.59	33.68	54.84	36.39	66.33	57.42	74.07	48.27	70.09	60.11	50.22	55.10	83.20	59.71	50.99	77.53	68.10	80.52	50.28	50.44	68.11	55.03	78.33	66.66	76.73	62.25	58.70	71.57	63.81	68.19	78.26	79.23	45.89	73.64	67.88	71.59	81.12	67.75	53.34	78.05	70.82	85.91	74.08	53.12	80.85	69.84	80.65	84.43	76.38	103.07	95.68	100.35	74.12	76.71	71.10	80.49	65.12	94.92	64.64	95.33	76.12	88.24	66.44	84.27	86.43	74.47	77.58	95.86	69.03	76.58	105.52	66.60	114.83	110.07	86.72]';
  % filtering rate, l/h
units.WdF = {'g', 'l/h'};    label.WdF = {'dry flesh weight' , 'Filtering rate'};  bibkey.WdF = 'Pouv2000a';
temp.WdF    = C2K(28);  units.temp.WdF = 'K'; label.temp.WdF = 'temperature';
comment.WdF = 'experiment conduct during austral winter on 107 oysters from 50 to 180 mm shell height; lagoon of Takapoto shows extremely low food level'; 

% Larvae length - filtering rate
data.LF1 = [82	80	79	84	81	80	85	84	83	87	88	86	87	86.6	87.55	91.45	91.87	89.69	104.16	100.3	99.1	106.12	102.65	101.5	134	135.34	132.66	174	175.74	172.26;
 % mum, shell height
8.009749891	7.515545254	7.762647572	8.770544515	4.534166905	6.65235571	20.37629229	4.047894252	8.164199018	20.50946193	1.194818067	10.85214	19.3510844	8.382817964	13.86695118	10.09283362	7.755329348	8.924081486	20.55206272	7.100298271	13.82618049	36.29652067	30.53683647	33.41667857	81.83888326	50.33515246	66.08701786	83.30400722	69.85224278	76.578125]';
  % filtering rate, l/h
      data.LF1(:,1) = data.LF1(:,1) * 1e-4; % mum to cm 
      data.LF1(:,2) = (data.LF1(:,2) / 2500e3); % cell/h to l/h 
units.LF1 = {'cm', 'l/h '};    label.LF1 = {'shell height' , 'Filtering rate'};  bibkey.LF1 = 'Sang2019';
temp.LF1    = C2K(29);  units.temp.LF1 = 'K'; label.temp.LF1 = 'temperature';
comment.LF1 = 'Vairao raceway, microalgae concentration = 2500e3 cell/L'; 
%
data.LF2 = [80	79	81	84	83	89	86	90	90	94	92	94	92	91.4	89.8	96	107	107.28	115.45	118	112.99	136	137.54	134.56	173	174.73	171.27;
 % mum, shell height
41.54130309	22.59705529	32.06917919	25.54189415	19.63553443	22.58871429	38.35450064	33.12788498	35.74119281	41.86688739	18.64027174	30.25357957	33.39594063	24.16932498	28.78263281	33.06888229	18.55095601	25.80991915	84.54555596	39.81461278	62.18008437	156.0631916	67.53950139	111.8013465	221.4800536	115.1425616	168.3113076]';
 % filtering rate, l/h      
      data.LF2(:,1) = data.LF2(:,1) * 1e-4; % mum to cm 
      data.LF2(:,2) = (data.LF2(:,2)/ 7500e3); % cell/h to l/h 
units.LF2 = {'cm', 'l/h '};    label.LF2 = {'shell height' , 'Filtering rate'};  bibkey.LF2 = 'Sang2019';
temp.LF2    = C2K(29);  units.temp.LF2 = 'K'; label.temp.LF2 = 'temperature';
comment.LF2 = 'Vairao raceway, microalgae concentration = 7500e3 cell/L'; 
%
data.LF3 = [88	89	89	89	91	89	89	93	92	92	92	91	94.1 97.6 96.7 111	110	105.72	122	119	115.45	188.88	189	186;
    % mum, shell height
    48.46232489	42.53018674	45.49625581	71.63377267	30.05096418	50.84236842	88.41529246	65.62188347	77.01858796	113.6470646	48.27220033	80.95963246	125.9609669	47.53000892	86.74548789	154.23252	133.295012	143.763766	320.4768957	122.0260336	221.2514647	302.8549107	228.162355	265.5086329]';
% filtering rate, l/h
data.LF3(:,1) = data.LF3(:,1) * 1e-4; % mum to cm
data.LF3(:,2) = (data.LF3(:,2)/ 15000e3); % cell/h to l/h
units.LF3 = {'cm', 'l/h '};    label.LF3 = {'shell height' , 'Filtering rate'};  bibkey.LF3 = 'Sang2019';
temp.LF3    = C2K(29);  units.temp.LF3 = 'K'; label.temp.LF3 = 'temperature';
comment.LF3 = 'Vairao raceway, microalgae concentration = 15000e3 cell/L';
%
data.LF4 = [82	79	79	82	80	82	82	84	80	80	83	79	83.6	88.9	87.2 115	119	111.95	139.65	130.12	130.44;
    % mum, shell height
24.38035641	12.34676034	13.36355837	42.6438824	31.07653054	36.86020647	57.54822788	36.54271656	47.04547222	73.92385486	37.45094514	55.6874	106.9566993	40.31436186	73.63553056	176.9346866	63.62634923	120.2805179	366.3550777	192.0182177	279.1866477]';
    % filtering rate, l/h         
      data.LF4(:,1) = data.LF4(:,1) * 1e-4; % mum to cm 
      data.LF4(:,2) = (data.LF4(:,2)/ 30000e3); % cell/h to l/h 
units.LF4 = {'cm', 'l/h '};    label.LF4 = {'shell height' , 'Filtering rate'};  bibkey.LF4 = 'Sang2019';
temp.LF4    = C2K(29);  units.temp.LF4 = 'K'; label.temp.LF4 = 'temperature';
comment.LF4 = 'Vairao raceway, microalgae concentration = 30000e3 cell/L';

% Functional response - mono-specific diet of Amphidinium sp microalgae cells 
data.xf_amph = [ ... % algae density (cell/ml), ingestion rate (cell/h/ind)
0.01	0
1000	222222.2222
2000	250000
11000	750000
11000	888888.8889
30000	2250000
32000	2500000
36000	2571428.571
51000	3000000
63000	3000000
130000	3250000
163000	3000000
];
data.xf_amph(:,2) = data.xf_amph(:,2)*24; % convert to d
data.xf_amph = data.xf_amph * pi/6 * (0.0015)^3 * 0.1 * 1e3; % convert cells to dry weight (mg) based on empirically-determined L = 0.0015 cm, wet to dry weight = 0.1.
units.xf_amph  = {'mg/ml', 'mg/d'};  label.xf_amph = {'algae density', 'ingestion rate'};  
temp.xf_amph   = C2K(28.5);  units.temp.xf_amph = 'K'; label.temp.xf_amph = 'temperature';
bibkey.xf_amph = 'IFRE2021';
comment.xf_amph = 'ingestion rate by ~ 1.3cm individuals, P margaritifera spats. Mean volume of Amphidinium calculated from empirical measurements of diameter';

% Functional response - mono-specific diet of Nitzschia closterium microalgae cells 
data.xf_nitz = [ ... % algae density (cell/ml), ingestion rate (cell/h/ind)
0.1     0
43000	4400000
86000	3600000
156000	7818181.818
460000	16000000
876000	13600000
1664000	19200000
2880000	14545454.55
];
data.xf_nitz(:,2) = data.xf_nitz(:,2)*24; % convert to d
data.xf_nitz = data.xf_nitz * pi/6 * (0.00038)^3 * 0.1 * 1e3; % convert cells to dry weight (mg) based on empirically-determined L = 0.00038 cm, wet to dry weight = 0.1.
units.xf_nitz  = {'mg/ml', 'mg/d'};  label.xf_nitz = {'algae density', 'ingestion rate'};  
temp.xf_nitz   = C2K(28.5);  units.temp.xf_nitz = 'K'; label.temp.xf_nitz = 'temperature';
bibkey.xf_nitz = 'IFRE2021';
comment.xf_nitz = 'ingestion rate by ~ 1.3cm individuals, P margaritifera spats. Mean volume of Nitzschia calculated from empirical measurements of diameter';

% Functional response - mono-specific diet of Isochrysis microalgae cells 
data.xf_isoc = [ ... % algae density (cell/ml), ingestion rate (cell/h/ind)
0.1         0
58000       9555555.556
124000      11000000
172000      14857142.86
440000      35250000
920000      40000000
990000      71500000
1600000     30000000
1940000     65000000
2800000     75000000
4700000     100000000
5600000     175000000
7750000     137500000
9400000     150000000
13100000	228571428.6
16900000	133333333.3
19100000	137500000
];
data.xf_isoc(:,2) = data.xf_isoc(:,2)*24; % convert to d
data.xf_isoc = data.xf_isoc * pi/6 * (0.00052)^3 * 0.1 * 1e3; % convert cells to dry weight (mg) based on empirically-determined L = 0.00052 cm, wet to dry weight = 0.1.
units.xf_isoc  = {'mg/ml', 'mg/d'};  label.xf_isoc = {'algae density', 'ingestion rate'};  
temp.xf_isoc   = C2K(28.5);  units.temp.xf_isoc = 'K'; label.temp.xf_isoc = 'temperature';
bibkey.xf_isoc = 'IFRE2021';
comment.xf_isoc = 'ingestion rate by ~ 1.3cm individuals, P margaritifera spats. Mean volume of Isochrysis calculated from empirical measurements of diameter';


%% set weights for all real data
weights = setweights(data, []);
weights.xf_nitz = 5 * weights.xf_nitz;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; 
weights.psd.k = 0.2; data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';

weights.ab = 5;
% weights.Lb = 5;
weights.Lj = 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plot
sets1 = {'tL','tL3'};  subtitle1 = {'In-situ growth at different food'};
sets2 = {'tLC1','tLC2','tLC3','tLC4'}; subtitle2 = {'Larvae growth at different food'};
sets3 = {'LWd4','LWd41','LWd42','LWd43','LWd44','LWd45'}; subtitle3 = {'Length vs dry weight, Chav2013'};
sets4 = {'LWw'}; subtitle4 = {'Length vs wet weight, Four2011'};
sets5 = {'LJO4','LJO3','LJO2','LJO1'}; subtitle5 = {'Respiration at larvae stage, different food levels'};
sets6 = {'WdJO','WdJO1'}; subtitle6 = {'Respiration at 24C adult stage, 2 food levels'};
sets7 = {'WdJO2','WdJO3'}; subtitle7 = {'Respiration at 27C adult stage, 2 food levels'};
sets8 = {'WdJO4','WdJO5'}; subtitle8 = {'Respiration at 30C adult stage, 2 food levels'};
sets9 = {'LF1','LF2','LF3','LF4'};  subtitle9 = {'Filtering rate at larvae stage, different food levels'};
sets10 = {'xf_amph','xf_nitz','xf_isoc'};  subtitle10 = {'Functional response juveniles, different food types'};
sets11 = {'WdF'}; subtitle11 = {'Filtering rate at different dry weights'};
metaData.grp.sets = {sets1, sets2, sets3, sets4, sets5, sets6, sets7, sets8, sets9, sets10, sets11};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4, subtitle5, subtitle6, subtitle7, subtitle8, subtitle9, subtitle10, subtitle11};

%% Discussion points
D1 = 'mod_1: converted Lb to Wwb, Ri adapted conform source, Ls and GSI ignored and kap_R fixed at 0.95, pseudo-data point k = 0.3 added, k_J released';
D2 = 'mod_2: model abj is used, rather than asj; Ri is removed and GSI used; improved estimates for kap_X and kap';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4HY7T'; % Cat of Life
metaData.links.id_ITIS = '568098'; % ITIS
metaData.links.id_EoL = '46467327'; % Ency of Life
metaData.links.id_Wiki = 'Pinctada_margaritifera'; % Wikipedia
metaData.links.id_ADW = 'Pinctada_margaritifera'; % ADW
metaData.links.id_Taxo = '39257'; % Taxonomicon
metaData.links.id_WoRMS = '207899'; % WoRMS
metaData.links.id_molluscabase = '207899'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pinctada_margaritifera}}, '...
'note = {Accessed : 2017-05-21}'];
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
bibkey = 'SoutLuca2011'; type = 'book'; bib = [ ...  % used for the estimation method
'author = {Southgate, Paul and Lucas, John},'...
'title = {The pearl oyster},'...
'year = {2011},'...
'publisher = {Elsevier},'...
'howpublished = {\url{https://books.google.com/books?hl=en&lr=&id=SzkhMsW7Q14C&oi=fnd&pg=PP1&dq=southgate+lucas+2011&ots=570eZNNrv6&sig=W16EQRdbyCmBKDu8xPKYg3fUhxc#v=onepage&q=southgate lucas 2011&f=false}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CLKy2017'; type = 'Article'; bib = [ ...
'title = {Shell Growth Performance of Hatchery Produced \emph{Pinctada margaritifera}: {F}amily Effect and Relation with Cultured Pearl Weight},'...
'author = {Ky, Chin-Long and Le Moullac, Gilles},'...
'journal = {Journal of Aquaculture Research and Development},'...
'volume = {8},'...
'number = {480},'...
'pages = {1--6},' ...
'year = {2017}, '...
'publisher = {OMICS International}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chav2013'; type = 'Article'; bib = [ ...
'title = {Physiological responses of female and male black-lip pearl oysters (\emph{Pinctada margaritifera}) to different temperatures and concentrations of food},'...
'author = {Chavez-Villalba, Jorge and Soyez, Claude and Aurentz, Hermann and Le Moullac, Gilles},'...
'journal = {Aquatic Living Resources},'...
'volume = {26},'...
'number = {3},'...
'pages = {263--271},' ...
'year = {2013}, '...
'publisher = {EDP Sciences}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tean2014'; type = 'phdthesis'; bib = [ ...
'title = {Reproduction de l''huitre perliere \emph{Pinctada margaritifera} etude des determinants du sexe femelle chez l''adulte},'...
'author = {Teaniniuraitemoana, Vaihiti},'...
'year = {2014}, '...
'school = {Polynesie francaise}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Four2011'; type = 'phdthesis'; bib = [...
'title = {Etude du regime alimentaire et du determinisme environnemental de la reproduction des huitres perlieres \emph{Pinctada margaritifera} sur l''atoll d''{A}he, {A}rchipel des {T}uamotu-{G}ambier, {P}olynesie fran\c{c}aise},'...
'author = {Fournier, Jonathan},'...
'year = {2011},'...
'school = {Universite de Polynesie fran\c{c}aise}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pouv2000'; type = 'article'; bib = [...
'title = {Gametogenic cycle and reproductive effort of the tropical blacklip pearl oyster, \emph{Pinctada margaritifera} ({B}ivalvia: {P}teriidae), cultivated in {T}akapoto atoll ({F}rench {P}olynesia)},'...
'author = {Pouvreau, Stephane and Gangnery, Aline and Tiapari, Jerome and Lagarde, Franck and Garnier, Matthieu and Bodoy, Alain},'...
'journal = {Aquatic Living Resources},'...
'volume = {13},'...
'number = {1},'...
'pages = {37--48},'...
'year = {2000},'...
'publisher = {EDP Sciences}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pouv2000a'; type = 'article'; bib = [...
'title = {In situ suspension feeding behaviour of the pearl oyster, \emph{Pinctada margaritifera}: combined effects of body size and weather-related seston composition},'...
'author = {Pouvreau, Stephane and Bodoy, Alain and Buestel, Dominique},'...
'journal = {Aquaculture},'...
'volume = {181},'...
'number = {1},'...
'pages = {91--113},'...
'year = {2000},'...
'publisher = {Elsevier}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pouv2001'; type = 'article'; bib = [...
'title = {Growth of the black-lip pearl oyster, "\emph{Pinctada margaritifera}, at nine culture sites of French Polynesia: synthesis of several sampling designs conducted between 1994 and 1999},'...
'author = {Pouvreau, Stephane and Prasil, Vincent},'...
'journal = {Aquatic Living Resources},'...
'volume = {14}, '...
'number = {3}, '...
'pages = {155--163}, '...
'year = {2001}, '...
'publisher = {EDP Sciences}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Yuki2000'; type = 'article'; bib = [...
'doi = {10.1111/j.1365-2095.2010.00821.x}, ' ...
'title = {Proximate and fatty acid composition of the gonads of wild versus hatchery-conditioned \emph{Pinctada margaritifera} broodstock},'...
'author = {Ehteshami, F and Christianus, A and Rameshi, H and Harmin, SA and Saad, CR},'...
'journal = {Aquaculture Nutrition},'...
'volume = {17},'...
'pages = {179--188},'...
'year = {2000}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sang2019'; type = 'article'; bib = [...
'doi = {10.1016/j.jembe.2018.12.008}, ' ...
'title = {Estimation of physical and physiological performances of blacklip pearl oyster larvae in view of DEB modeling and recruitment assessment},'...
'author = {Sangare, N and Lo-Yat, A and Le Moullac, G and Pecquerie, L and Thomas, Y and Beliaeff, B and Andrefouet, S},'...
'journal = {Journal of Experimental Marne Biology and Ecology},'...
'volume = {512},'...
'pages = {42--50},'...
'year = {2019}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brun2012'; type = 'Misc'; bib = [...
'year = {2012}, '...
'note = {Unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IFRE2021'; type = 'Misc'; bib = [...
'year = {2021}, '...
'note = {Ifremer Tahiti, unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Yuki2000'; type = 'article'; bib = [...
'doi = {10.3354/meps195179}, ' ...
'title = {Comparative effects of temperature on suspension feeding and energy budgets of the pearl oysters \emph{Pinctada margaritifera} and \emph{P. maxima}},'...
'author = {Yukihira, H. and Lucas, J.S. and Klumpp, D.W.},'...
'journal = {Marine Ecology Progress Series},'...
'volume = {195},'...
'number = {3},'...
'pages = {e675--e682},'...
'year = {2011},'...
'publisher = {Wiley Online Library}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Alag1989'; type = 'article'; bib = [...
'doi = {10.1016/0044-8486(89)90250-0}, ' ...
'title = {Larval and juvenile rearing of black-lip pearl oyster, \emph{Pinctada margaritifera} ({L}innaeus)},'...
'author = {Alagarswami, K. and Dharmaraj, S. and Chellam, A. and Velayudhan, T.S.},'...
'journal = {Aquaculture},'...
'volume = {76},'...
'number = {1-2},'...
'pages = {43-56},'...
'year = {1989}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
