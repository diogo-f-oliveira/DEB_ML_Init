  function [data, auxData, metaData, txtData, weights] = mydata_Pimephales_promelas

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pimephales_promelas'; 
metaData.species_en = 'Fathead minnow'; 

metaData.ecoCode.climate = {'Cfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wd0'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-Ww'; 't-N'; 't-dC'; 't-WwR'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Julita Stadnicka'};        
metaData.date_subm = [2011 03 17];                           
metaData.email    = {'julita.stadnicka@eawag.ch'};                 
metaData.address  = {'Eawag, Uberlandstrasse 133, 8600 Duebendorf, Switzerland'}; 

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2011 05 29];                           
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 17];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Roland Kuhl'};    
metaData.date_mod_3     = [2017 05 17];              
metaData.email_mod_3    = {'roland.kuhl@ibacon.com'};            
metaData.address_mod_3  = {'ibacon GmbH'}; 

metaData.author_mod_4   = {'Elke Zimmer'};    
metaData.date_mod_4     = [2018 04 17];              
metaData.email_mod_4    = {'elke.zimmer@ibacon.com'};            
metaData.address_mod_4  = {'ibacon GmbH'}; 

metaData.author_mod_5   = {'Elke Zimmer'};    
metaData.date_mod_5     = [2018 07 19];              
metaData.email_mod_5    = {'elke.zimmer@ibacon.com'};            
metaData.address_mod_5  = {'ibacon GmbH'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 20]; 

%% set data
% zero-variate data
data.ab = 5;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'BrauHint1998'; 
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ab_B = 6;         units.ab_B = 'd';  label.ab_B = 'age at birth';          bibkey.ab_B = 'Boeh2012'; 
  temp.ab_B = C2K(23.5); units.temp.ab_B = 'K'; label.temp.ab_B = 'temperature';

data.ap = 90;        units.ap = 'd';  label.ap = 'age at puberty';        bibkey.ap = 'ParrBala2017';
  temp.ap = C2K(24.6); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 365*5;      units.am = 'd';  label.am = 'life span';             bibkey.am = 'GranTonn2002';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.5;      units.Lb = 'cm';     label.Lb = 'total length at birth';  bibkey.Lb = 'Wang1986';
data.Lp = 4.49;     units.Lp = 'cm';     label.Lp = 'total length at first brood';bibkey.Lp = 'ParrBala2017'; %%% in Add my pet length at puberty and length at first brood both are Lp, while age is ap and aR? Can we make up LR?
temp.Lp = C2K(24.6); units.temp.Lp = 'K'; label.temp.Lp = 'temperature';
data.Li_m = 7.7;     units.Li_m = 'cm';     label.Li_m = 'ultimate total length males';  bibkey.Li_m = 'GranTonn2002';
data.Li_f = 7.1;     units.Li_f = 'cm';     label.Li_f = 'ultimate total length females';  bibkey.Li_f = 'GranTonn2002';

data.Ww0 = 11.19e-4;  units.Ww0 = 'g'; label.Ww0 = 'wet egg weight'; bibkey.Ww0 = 'Boeh2012';   
data.Wd0 = 1.629e-4;  units.Wd0 = 'g'; label.Wd0 = 'dry egg weight'; bibkey.Wd0 = 'Boeh2012';   
data.Wwb = 3.3929e-4;units.Wwb = 'g';      label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BrauHint1998';
data.Wwp = 0.8825;   units.Wwp = 'g';      label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'ParrBala2017';  %%n take length at DPH 60 from ParroBala2017?
data.Wwi_m = 4.2;      units.Wwi_m = 'g';      label.Wwi_m = 'ultimate wet weight for male';    bibkey.Wwi_m = 'Wata2007';
data.Wwi_f = 2.07;      units.Wwi_f = 'g';      label.Wwi_f = 'ultimate wet weight for female';    bibkey.Wwi_f = 'PantGlen2012'; 

data.Ri = 30;       units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Wata2007';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tLf = [... % time (d), fork length (cm)
0   0.0001    
163	4.127 
191	4.491
286	4.694];
units.tLf  = {'d', 'cm'};  label.tLf = {'age', 'fork length', 'female'};  
temp.tLf   = C2K(24.95);  units.temp.tLf = 'K'; label.temp.tLf = 'temperature';
L0.tLf = 4.127; units.L0.tLf  = {'cm'};  label.L0.tLf = {'initial fork length'}; 
W0.tLf = 1.254; units.W0.tLf  = {'g'};  label.W0.tLf = {'initial wet weight'}; 
bibkey.tLf = 'SohoTyle2001';
comment.tLf = 'data for female; calculation of f to be used for GSI';

% time-weight for calculation of f to be used for GSI
data.tWwf = [... % time (d), body weight (g)
0   0.0001
163	1.254
191	1.858
286	2.149];
units.tWwf  = {'d', 'g'};  label.tWwf = {'age', 'wet weight', 'female'};  
temp.tWwf   = C2K(24.95);  units.temp.tWwf = 'K'; label.temp.tWwf = 'temperature';
bibkey.tWwf = 'SohoTyle2001';

% time-gonad weight calculated from SohoTyle2001
data.tBG = [... % body weight (g), gonad weight (g)
    0   0.0001
1.254	0.014
1.858	0.151
2.149	0.166];
units.tBG  = {'g', 'g'};  label.tBG = {'wet weight', 'gonad weight'};  
temp.tBG   = C2K(24.95);  units.temp.tBG = 'K'; label.temp.tBG = 'temperature';
bibkey.tBG = 'SohoTyle2001';

% time-length
data.tLm = [... % time (d), fork length (cm)
0   0.0001
163	5.098 
191	5.503
286	6.555];
units.tLm  = {'d', 'cm'};  label.tLm = {'age', 'fork length', 'male'};  
temp.tLm   = C2K(24.95);  units.temp.tLm = 'K'; label.temp.tLm = 'temperature';
L0.tLm = 4.127; units.L0.tLm  = {'cm'};  label.L0.tLm = {'initial fork length'}; 
W0.tLm = 1.254; units.W0.tLm  = {'g'};  label.W0.tLm = {'initial wet weight'}; 
bibkey.tLm = 'SohoTyle2001';

% time-weight
data.tWwm = [... % time (d), wet weight (g)
    0   0.0001
43+120	2.371
71+120	3.161
164+120	6.458];
units.tWwm = {'d', 'g'};  label.tWwm = {'age', 'wet weight', 'male'};  
temp.tWwm   = C2K(24.95);  units.temp.tWwm = 'K'; label.temp.tWwm = 'temperature';
bibkey.tWwm = 'SohoTyle2001';
comment.tWwm = 'data for male';

% time-length; time is a bit shaky...
data.tL_Boro = [... % time (dph), fork length (cm)
2   0.55    
30	1.3 
55	2.71
112	4.03];
units.tL_Boro  = {'d', 'cm'};  label.tL_Boro = {'age', 'total length'};  
temp.tL_Boro   = C2K(23);  units.temp.tL_Boro = 'K'; label.temp.tL_Boro = 'temperature';
L0.tL_Boro   = 0.55;  units.L0.tL_Boro = 'cm'; label.temp.tL_Boro = 'L0';
bibkey.tL_Boro = 'BoroTaly2015';

% time-length
data.tL = [... % time since birth(d), total length (cm)
31	1.70
60	3.26
88	4.49
108	4.41
157	5.085];
units.tL  = {'d', 'cm'};  label.tL = {'age', 'total length'};  
temp.tL   = C2K(24.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
L0.tL = 1.7; units.L0.tL = {'cm'}; label.L0.tL = 'initial lenght';
bibkey.tL = 'ParrBala2017';
  
% time-weight
data.tW = [... % time since birth(d), body weight (g)
31  0.0396
60  0.2911
88	0.8825
108	0.9606
157 1.70];
units.tW  = {'d', 'g'};  label.tW = {'age', 'wet weight'};  
temp.tW   = C2K(24.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
W0.tW = 0.0396; units.W0.tW = {'g'}; label.W0.tW = 'initial lenght';
bibkey.tW = 'ParrBala2017';
  
% length-weight
data.LWwf1 = [ ... % total length (cm), body weight (g)
0.8	0.02655
1.9	0.02655
2.8	0.292
3.0	0.3717
3.9	0.823
4.0	0.7168
4.1	0.7168
4.6	1.168
4.6	1.354
4.8	1.434];
units.LWwf1  = {'cm', 'g'};  label.LWwf1 = {'total length', 'wet weight', 'female'}; 
temp.LWwf1   = C2K(25);  units.temp.LWwf1 = 'K'; label.temp.LWwf1 = 'temperature';
bibkey.LWwf1 = 'AerlRunn2004';
comment.LWwf1 = 'Females. Same f as for the data from ParrBala2017 is used in the predictions since data are very similar';

% length-weight
data.LWwm1 = [ ... % total length (cm), body weight (g)
1.167	0.02655
1.767	0.0531
2.100	0.1062
2.533	0.1593
3.267	0.3717
3.533	0.4248
3.800	0.531
4.433	0.9027
4.933	1.248
5.433	2.363
5.667	2.442
5.933	2.894];
units.LWwm1  = {'cm', 'g'};  label.LWwm1 = {'total length', 'wet weight', 'male'}; 
temp.LWwm1   = C2K(25);  units.temp.LWwm1 = 'K'; label.temp.LWwm1 = 'temperature';
bibkey.LWwm1 = 'AerlRunn2004';
comment.LWwm1 = 'Males';

% time-cum reprod
% 550.7 eggs in 70 days equals 7.87 eggs/day. Compare value above 34 eggs/day?
data.tN = [ ... % time since birth (f), cum # of eggs
31 0 
90	1.4
% 90	2.9
91	5.2
92	5.9
% 92	6.6
% 92	13
93	15.3
94	20.7
95	23.7
96	25
% 96	26.6
97	27.4
98	29.9
% 98	32.4
99	36.6
% 99	41.5
100	44.3
% 100	46.3
101	46.9
% 101	53.9
102	54.5
103	56.9
% 103	61
104	65.7
% 104	65.8
% 104	73.6
% 104	78.7
105	80.2
% 105	82
% 105	86.4
106	91.8
% 106	97.4
107	99.1
% 107	100.3
108	102
% 108	105.2
% 108	111.5
109	111.9
% 109	116.8
% 109	117.9
110	121.1
% 110	122.8
111	127.8
112	128.3
113	131
% 113	134.4
% 113	136.7
% 113	139.6
% 113	145.4
114	146.5
% 114	148.4
% 114	156.1
115	158.1
% 115	160.4
% 115	164.3
116	165.9
% 116	170.8
% 116	173.4
117	175.1
% 117	181.2
% 117	182.1
% 117	184.2
118	189.3
% 118	194.1
% 118	198.9
% 118	199.1
% 118	199.4
% 118	200.1
% 119	200.7
% 119	202
119	206.7
120	206.9
% 120	210.4
% 120	210.6
% 120	212.5
% 120	216.3
121	216.6
% 121	217.2
% 121	224.1
% 121	226.3
% 121	231.1
122	238.4
% 122	240.8
% 122	241.2
% 122	256
% 122	256.3
% 122	256.6
% 122	257.4
123	260.5
% 123	261.9
% 123	267.4
124	270.9
% 124	275.9
% 124	276.2
% 124	279.4
% 124	279.8
125	281.4
% 125	286.8
% 125	288
% 125	290.1
% 125	296.5
126	297.8
% 126	298.2
% 126	303
% 126	303.3
127	304.9
% 127	310.5
% 127	322.5
% 127	322.8
% 127	328.5
128	339.1
% 128	341.7
129	343
% 129	349.6
% 129	355.5
% 129	358.8
130	363.5
% 130	363.9
% 130	364.6
% 130	367.3
% 130	371
131	375.1
% 131	376.1
% 131	380.3
% 131	383.3
132	384.5
% 132	385.1
% 132	387.3
133	392.4
% 133	397.8
% 133	398.6
% 133	400.7
% 133	407.8
134	412.5
% 134	412.8
% 134	414.2
135	417.5
136	420
% 136	423.5
% 136	429.2
137	429.4
138	429.7
% 138	433.1
139	434.5
% 139	434.6
% 139	434.7
140	436.1
% 140	438.8
% 140	439.1
141	441.8
142	444.9
% 142	445.3
143	449.5
% 143	450.2
% 143	454.1
144	455.9
% 144	460.6
% 144	460.8
145	463.5
% 145	469.2
% 145	470.6
146	478.2
% 146	481.3
147	488.4
% 147	489.1
% 147	490.6
% 147	492
148	496.2
% 148	496.4
% 148	497.3
% 148	497.6
% 148	502.1
% 148	510.8
149	519.7
% 149	520.5
% 149	522.5
% 149	523.2
% 149	524.6
150	524.9
% 150	530.7
151	530.9
% 151	535.3
153	535.6
155	545.5
% 155	548.2
156	548.6
158	549.7
159	550.2
160	550.7];
units.tN  = {'d', '#'};  label.tN = {'time since birth', 'cumulative # of eggs'}; 
temp.tN   = C2K(24.6);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'ParrBala2017';

% inital age not given
% Fork length [mm]	
% time [days]	fed (black circles)	starved (open circles)
tLL = [... % days, length fed mm, length starved mm
0	44.04	48.51
4	47.52	41.23
8	40.73	39.90
16	43.87	39.57
28	43.21	41.23];
data.u5_tL1 = [... % Time (days), length (cm)
tLL(:,1), tLL(:,2)/10]; %convert mm to cm 
units.u5_tL1= {'d', 'cm'};  label.u5_tL1= {'time', 'length'};  bibkey.u5_tL1 = {'WebeHigg2003'};
 temp.u5_tL1= C2K(25); units.temp.u5_tL1= 'K'; label.temp.u5_tL1= 'temperature';
W0.u5_tL1= 1.19; units.W0.u5_tL1= 'g';  label.W0.u5_tL1 = 'wet weight at t = 0';
L0.u5_tL1= 4.404; units.L0.u5_tL1= 'cm';  label.L0.u5_tL1 = 'length at t = 0';
%
data.u5_tL2 = [... % Time (days), length (cm)
tLL(:,1), tLL(:,3)/10];
units.u5_tL2= {'d', 'cm'};  label.u5_tL2= {'time', 'length'};  bibkey.u5_tL2 = {'WebeHigg2003'};
L0.u5_tL2= 4.851; units.L0.u5_tL2= 'cm';  label.L0.u5_tL2 = 'length at t = 0';
W0.u5_tL2= 1.43; units.W0.u5_tL2= 'g';  label.W0.u5_tL2 = 'wet weight at t = 0';


% time-condition factor	
tCF = [... % time (d)	fed (black circles)	starved (open circles)
0	1.40	1.25
4	1.20	1.09
8	1.15	1.06
16	1.23	1.04
28	1.28	0.91];
data.u5_tCF1 = [... % Time (days), condition factor
tCF(:,1), tCF(:,2)];
units.u5_tCF1= {'d', '-'};  label.u5_tCF1= {'time', 'condition factor'};  bibkey.u5_tCF1 = {'WebeHigg2003'};
data.u5_tCF2 = [... % Time (days), condition factor
tCF(:,1), tCF(:,3)];
units.u5_tCF2= {'d', '-'};  label.u5_tCF2= {'time', 'condition factor'};  bibkey.u5_tCF2 = {'WebeHigg2003'};

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 20;
weights.ap = weights.ap * 20;
weights.am = weights.am * 0.5;
weights.Lb = weights.Lb * 15;
weights.Lp = weights.Lp * 15;
weights.Li_m = weights.Li_m * 15;
weights.Li_f = weights.Li_f * 15;
weights.Ww0 = weights.Ww0 * 30;
weights.Wd0 = weights.Wd0 * 30;
weights.Wwb = weights.Wwb * 10;
weights.Wwp = weights.Wwp * 10;
weights.Wwi_f = weights.Wwi_f * 30; % differs highly between male and female
weights.Wwi_m = weights.Wwi_m * 30; % differs highly between male and female
weights.tLf = weights.tLf * 20;
weights.tLm = weights.tLm * 20;
weights.tWwf = weights.tWwf * 20;
weights.tWwm = weights.tWwm * 20;
weights.tW = weights.tW * 20;
weights.tL = weights.tL * 20;
weights.tN = weights.tN * 30;
weights.tL_Boro = weights.tL_Boro * 30;

weights.LWwf1 = weights.LWwf1 * 30;
weights.LWwm1 = weights.LWwm1 * 30;

weights.tBG = weights.tBG * 30;
weights.u5_tL1 = weights.u5_tL1 * 0.5 ;
weights.u5_tL2 = weights.u5_tL2 * 0.5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.L0 = L0;
auxData.W0 = W0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% grouped plots
set1 = {'u5_tL1', 'u5_tL2'}; subtitle1 = {'Weber 2003'; 'control fed, starved'}; % univar 13
set2 = {'u5_tCF1', 'u5_tCF2'}; subtitle2 = {'Weber 2003'; 'control fed, starved'}; % univar 13
set3 = {'LWwf1', 'LWwm1'}; subtitle3 = {'AerlRunn2004'; 'female, male'}; % univar 13
set4 = {'tLf', 'tLm'}; subtitle4 = {'Soho'; 'female, male'}; % univar7
set5 = {'tWwf', 'tWwm'}; subtitle5 = {'Soho'; 'female, male'}; % univar7
metaData.grp.sets = {set1, set2, set3, set4, set5}; metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3, subtitle4, subtitle5};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'EZ: Puberty information is froma study where they measured the females "just before" puberty (female values)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4HWST'; % Cat of Life
metaData.links.id_ITIS = '163517'; % ITIS
metaData.links.id_EoL = '211492'; % Ency of Life
metaData.links.id_Wiki = 'Pimephales_promelas'; % Wikipedia
metaData.links.id_ADW = 'Pimephales_promelas'; % ADW
metaData.links.id_Taxo = '43662'; % Taxonomicon
metaData.links.id_WoRMS = '567543'; % WoRMS
metaData.links.id_fishbase = 'Pimephales-promelas'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Fathead_minnow}}';  
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
bibkey = 'Wang1986'; type = 'Techreport'; bib = [ ...  
'author = {Wang, J. C. S.}, ' ...
'year = {1986}, ' ...
'title = {Fishes of the Sacramento-San Joaquin Estuary and Adjacent Waters, California: A Guide to the Early Life Histories.}, ' ... 
'institution = {Interagency Ecological Program}, ' ...
'volume = {9}, '...
'pages = {1--690}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrauHint1998'; type = 'Book'; bib = [ ...    
'author = {Braunbeck, T. and Hinton, D. E. and Streit, B.}, ' ...
'year  = {1998}, ' ...
'title = {Fish ecotoxicology.}, ' ...  
'publisher = {Birku\"{a}ser}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'mblaquaculture'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.mblaquaculture.com/content/organisms/pimephales_promelas.php}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'genomics'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pimephales_promelas}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'GranTonn2002'; type = 'Article'; bib = [ ...    
'author = {Grant, S.C.H. and Tonn, W.M.}, ' ...
'year  = {2002}, ' ...
'title = {Effects of nutrient enrichment on recruitment of age-0 fathead minnows (Pimephales promelas): potential impacts of environmental change on the Boreal Plains}, ' ...  
'journal = {Canadian Journal of Fisheries and Aquatic Sciences},'...
'volume = {59}, '...
'pages = {759--767}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wata2007'; type = 'Article'; bib = [ ...    
'author = {Watanabe, K.H. and Jensen, K.M. and Orlando, E.F. and Ankley G.T.}, ' ...
'year  = {2007}, ' ...
'title = {What is normal? A characterization of the values and variability in reproductive endpoints of the fathead minnow, \emph{Pimephales promelas}}, ' ...  
'journal = {Comparative Biochemistry and Physiology, Part C: Toxicology and Pharmacology},'...
'volume = {146}, '...
'pages = {348--356}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParrBala2017'; type = 'Article'; bib = [ ...    
'author = {Parrott, J.L. and Balakrishnan, V.K.}, ' ...
'year  = {2017}, ' ...
'title = {Life-cycle exposure of fathead minnows to environmentally relevant concentrations of the $\beta$-blocker drug propranolol}, ' ...  
'journal = {Environmental Toxicology and Chemistry},'...
'volume = {36}, '...
'pages = {1644--1651}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WebeHigg2003'; type = 'Article'; bib = [ ...    
'author = {Weber, L.P. and Higgins, P.S. and Carlson, R.I. and Janz, D.M.}, ' ...
'year  = {2003}, ' ...
'title = {Development and validation of methods for measuring multiple biochemical indices of condition in juvenile fishes}, ' ...  
'journal = {Journal of fish biology}, '...
'volume = {63}, '...
'pages = {637--658}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'SohoTyle2001'; type = 'Article'; bib = [ ...    
'author = {Sohoni, P. and Tyler, C.R and Hurd, K. and Caunter, J. and Hetheridge, M. and Williams, T. and Woods, C. and Evans, M. and Toy, R. and Gargas, M. and Sumpter, J.P.}, ' ...
'year  = {2001}, ' ...
'title = {Reproductive effects of long-term exposure to Bisphenol A in the fathead minnow (\emph{Pimephales promelas})}, ' ...  
'journal = {Environ Sci Technol}, '...
'volume = {35}, '...
'number = {14}, '...
'pages = {2917--2925}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'AerlRunn2004'; type = 'Article'; bib = [ ...    
'author = {Van Aerle, R. and Runnalis, T.J. and Tyler, C. R.}, ' ...
'year  = {2004}, ' ...
'title = {Ontogeny of gonadal sex development relative to growth in fathead minnow}, ' ...  
'journal = {Journal of fish biology}, '...
'volume = {64}, '...
'number = {2}, '...
'pages = {355--369}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Boeh2012'; type = 'Article'; bib = [ ...    
'author = {Boehler, S}, ' ...
'year  = {2012}, ' ...
'title = {The fathead minnow embryo as a model for the development of alternative testing methods in ecotoxicology}, ' ...  
'journal = {Diplomarbeit, University of Heidelberg}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

% 
bibkey = 'PantGlen2012'; type = 'Article'; bib = [ ...    
'author = {G.H. Panter and Y.C. Glennon and J. Robinson and A. Hargreaves and R. Murray-Smith},' ...
'year  = {2012}, ' ...
'title = {Effects of the anti-androgen, bicalutamide, in a reduced life-cycle study with the fathead minnow (\emph{Pimephales promelas})}, ' ...  
'journal = {Aquatic toxicology},'...
'volume = {114-115}, '...
'pages = {31-38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

% 
bibkey = 'BoroTaly2015'; type = 'Article'; bib = [ ...    
'author = {Gergely Boros and P\''{e}ter S\''{a}ly and Michael J. Vanni},' ...
'year  = {2015}, ' ...
'title = {Ontogenetic variation in the body stoichiometry of two fish species}, ' ...  
'journal = {Oecologia},'...
'volume = {179}, '...
'pages = {329-341}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
