function [data, auxData, metaData, txtData, weights] = mydata_Folsomia_candida

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Entognatha'; 
metaData.order      = 'Entomobryomorpha'; 
metaData.family     = 'Isotomidae';
metaData.species    = 'Folsomia_candida'; 
metaData.species_en = 'White Springtail'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biF'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Ap'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Li'; 'Wdb_f'; 'Wwb_f'; 'Wwp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'T-ab'; 't-L_fT'; 't-N_fT'; 'Ww-JO'}; 

metaData.COMPLETE = 5; % using criteria of LikaKear2011

metaData.author   = {'Natanael T. Hamda'};    
metaData.date_subm = [2013 03 21];              
metaData.email    = {'tnatnael@gmail.com'};            
metaData.address  = {'Inst. Environ. Sci. Jagiellonian University, Poland'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2013 07 05];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'akvaplan-niva, Tromso, Norway'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 02 09];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3 = [2016 10 15];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 09]; 

%% set data
% zero-variate data

data.am = 75;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'CromDood1997';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'FounHopk2005 give max lifespan at 15C 240d and 24C of 111d';

data.Lb  = 0.03077; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Hamd2014';
data.Li  = 0.238;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Hamd2014';

data.Wwb = 1.695; units.Wwb = 'mug';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'CromDood1997';
data.Wwp = 30.52; units.Wwp = 'mug';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'CromDood1997';
data.Wdi = 87;    units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Hamd2014';
data.Wwf1 = 305;  units.Wwf1 = 'mug';  label.Wwf1 = 'wet weight at birth';    bibkey.Wwf1 = 'Hamd2014';
  comment.Wwf1 = 'Length 0.238 cm, feeding level f1 at end of experiment 1';
data.Wdf1 = 87;  units.Wdf1 = 'mug';   label.Wdf1 = 'dry weight at birth';    bibkey.Wdf1 = 'Hamd2014';
  comment.Wwf1 = 'Length 0.238 cm, feeding level f1 at end of experiment 1';
data.Wwf2 = 226;  units.Wwf2 = 'mug';  label.Wwf2 = 'wet weight at birth';    bibkey.Wwf2 = 'Hamd2014';
  comment.Wwf2 = 'Length 0.208 cm, feeding level f2 at end of experiment 1';
data.Wdf2 = 76;  units.Wdf2 = 'mug';   label.Wdf2 = 'dry weight at birth';    bibkey.Wdf2 = 'Hamd2014';
  comment.Wwf1 = 'Length 0.208 cm, feeding level f2 at end of experiment 1';
data.Wwf3 = 169;  units.Wwf3 = 'mug';  label.Wwf3 = 'wet weight at birth';    bibkey.Wwf3 = 'Hamd2014';
  comment.Wwf3 = 'Length 0.178 cm, feeding level f3 at end of experiment 1';
data.Wdf3 = 52;  units.Wdf3 = 'mug';   label.Wdf3 = 'dry weight at birth';    bibkey.Wdf3 = 'Hamd2014';
  comment.Wwf1 = 'Length 0.178 cm, feeding level f3 at end of experiment 1';

data.Ri  = 19.5;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Hamd2014';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length at 3 food levels
t_L_f = [... time since birth (d), length (cm) at f1, f2 and f3 respectively
5	0.051	0.042	0.042
7	0.057	0.045	0.042
9	0.068	0.048	0.042
10	0.070	0.054	0.042
11	0.079	0.057	0.045
12	0.081	0.061	0.049
13	0.088	0.065	0.057
14	0.089	0.071	0.058
15	0.092	0.077	0.067
16	0.102	0.083	0.071
17	0.107	0.087	0.074
18	0.127	0.097	0.077
19	0.135	0.102	0.079
21	0.148	0.109	0.101
23	0.156	0.115	0.106
25	0.165	0.123	0.111
27	0.172	0.133	0.116
31	0.178	0.143	0.133
34	0.188	0.157	0.137
38	0.192	0.165	0.151
42	0.205	0.174	0.153
46	0.213	0.182	0.166
49	0.221	0.190	0.169
54	0.234	0.194	0.173
60	0.235	0.203	0.176
67	0.237	0.207	0.177
77	0.238	0.208	0.178];
data.tL_f1 = t_L_f(:,[1 2]); % d - cm, first food level
units.tL_f1  = {'d', 'cm'};  label.tL_f1 = {'time since birth', 'length'};  
temp.tL_f1   = C2K(20);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'Hamd2014';
%
data.tL_f2 = t_L_f(:,[1 3]); % d - cm, second food level        
units.tL_f2  = {'d', 'cm'};  label.tL_f2 = {'time since birth', 'length'};  
temp.tL_f2   = C2K(20);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'Hamd2014';
%
data.tL_f3 = t_L_f(:,[1 4]) ;  % d - cm, third food level 
units.tL_f3  = {'d', 'cm'};  label.tL_f3 = {'time since birth', 'length'};  
temp.tL_f3   = C2K(20);  units.temp.tL_f3 = 'K'; label.temp.tL_f3 = 'temperature';
bibkey.tL_f3 = 'Hamd2014';

% time-reproduction data for three feeding conditions :
data.tN_f1 = [... time since birth (d) - Cummilative reproduction (#eggs) at f1 
16	22
19	51
26	104
34	167
40	220
44	295
51	355
60	452
68	555
80	657];
units.tN_f1  = {'d', '#'};  label.tN_f1 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_f1   = C2K(20);  units.temp.tN_f1 = 'K'; label.temp.tN_f1 = 'temperature';
bibkey.tN_f1 = 'Hamd2014';
%
data.tN_f2 = [ ... time since birth (d) - Cummilative reproduction (#eggs) at f2 
18	17
27	45
35	97
44	171
52	251
59	312
67	367
73	413
81	451];
units.tN_f2  = {'d', '#'};  label.tN_f2 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_f2   = C2K(20);  units.temp.tN_f2 = 'K'; label.temp.tN_f2 = 'temperature';
bibkey.tN_f2 = 'Hamd2014';
%
data.tN_f3 = [ ... time since birth (d) - Cummilative reproduction (#eggs) at f3 
23	19
34	59
47	106
55	171
63	209
69	265
78	306];
units.tN_f3  = {'d', '#'};  label.tN_f3 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_f3   = C2K(20);  units.temp.tN_f3 = 'K'; label.temp.tN_f3 = 'temperature';
bibkey.tN_f3 = 'Hamd2014';

%Length (in cm) at at differnt timess (in day) for three temperature conditions. 
% The 3 temperatures represented as T1 = 288 (second column),
% T2 = 293 (third column) and T3 = 298 (fourth column)
t_L_T = [ ... time since birth (d) - length (cm)
7	0.048	0.061	0.059
9	0.055	0.072	0.087
11	0.062	0.086	0.111
14	0.066	0.102	0.136
16	0.071	0.110	0.148
18	0.081	0.130	0.186
21	0.093	0.146	0.188
25	0.114	0.166	0.194
28	0.137	0.176	0.198
32	0.142	0.197	0.204
35	0.148	0.202	0.205
39	0.171	0.204	0.209
42	0.175	0.206	0.222
49	0.192	0.209	0.225
53	0.192	0.212	0.227
56	0.193	0.216	0.229
60	0.196	0.219	0.239
64	0.200	0.224	0.242
67	0.203	0.228	0.244
71	0.206	0.231	0.246
78	0.207	0.235	0.250];
data.tL_T1 = t_L_T(:,[1 2]); % d - cm,  288 K
units.tL_T1  = {'d', 'cm'};  label.tL_T1 = {'time since birth', 'length', '15 C'};  
temp.tL_T1   = C2K(15);  units.temp.tL_T1 = 'K'; label.temp.tL_T1 = 'temperature';
bibkey.tL_T1 = 'Hamd2014';
%
data.tL_T2 = t_L_T(:,[1 3]); % d - cm,  293 K
units.tL_T2  = {'d', 'cm'};  label.tL_T2 = {'time since birth', 'length', '20 C'};  
temp.tL_T2   = C2K(20);  units.temp.tL_T2 = 'K'; label.temp.tL_T2 = 'temperature';
bibkey.tL_T2 = 'Hamd2014';
%
data.tL_T3 = t_L_T(:,[1 4]); % d - cm,  298 K 
units.tL_T3  = {'d', 'cm'};  label.tL_T3 = {'time since birth', 'length', '25 C'};  
temp.tL_T3   = C2K(25);  units.temp.tL_T3 = 'K'; label.temp.tL_T3 = 'temperature';
bibkey.tL_T3 = 'Hamd2014';

data.tN_T1 = [ ... time since birth (d) - Cummilative reproduction (#eggs) at T = 288 K
26	19
33	30
40	42
47	88
54	134
61	183
68	218
75	281
82	333];
units.tN_T1  = {'d', '#'};  label.tN_T1 = {'time since birth', 'cumulative # of eggs', '15 C'};  
temp.tN_T1   = C2K(15);  units.temp.tN_T1 = 'K'; label.temp.tN_T1 = 'temperature';
bibkey.tN_T1 = 'Hamd2014';
%
data.tN_T2 = [... time since birth (d) - Cummilative reproduction (#eggs) at T = 293 K
 16	5
17	10
22	40
25	62
32	120
39	187
46	260
53	337
60	416
67	498
74	580
82	675];
units.tN_T2  = {'d', '#'};  label.tN_T2 = {'time since birth', 'cumulative # of eggs', '20 C'};  
temp.tN_T2   = C2K(20);  units.temp.tN_T2 = 'K'; label.temp.tN_T2 = 'temperature';
bibkey.tN_T2 = 'Hamd2014';
%
data.tN_T3 = [ ... time since birth (d) - Cummilative reproduction (#eggs) at T = 298 K
14	6
21	28
28	43
35	84
42	131
49	182
56	236
63	291
70	348
77	406
82	472];
units.tN_T3  = {'d', '#'};  label.tN_T3 = {'time since birth', 'cumulative # of eggs', '25 C'};  
temp.tN_T3   = C2K(25);  units.temp.tN_T3 = 'K'; label.temp.tN_T3 = 'temperature';
bibkey.tN_T3 = 'Hamd2014';

% temperature - age at birth data
data.Tab = [ ... temperature (C) - age since conception (d)
     5 90;
    14 17;
    15 15;
    20 9;
    25 7]; 
units.Tab  = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Hamd2014';
		

% weight - respiration data
data.WJO = [ ... % wet weight (mug), O2 consumption (mul/h)
 59.88	63.08	65.69	68.98	87.25	87.62	89.37	92.48	94.77	103.06	104.02	107.17	107.68	110.33	112.53	114.16	118.12	120.49	121.70	126.55	128.96	130.32	132.14	132.21	138.12	141.53	141.57	142.30	144.37	146.42	146.53	149.42	151.70	156.94	158.42	161.41	164.05	164.84	168.00	168.02	170.56	175.59	175.70	175.71	176.38	176.49	178.26	178.30	187.93	188.01	190.84	192.65	195.55	196.38	201.48	203.53	208.11	209.32	209.60	211.35	212.74	216.84	218.84	218.87	224.22	224.35	232.23	233.21	234.49	238.99;
 0.0381	0.0129	0.0337	0.0327	0.0442	0.0293	0.0321	0.0326	0.0346	0.0563	0.0415	0.0589	0.0529	0.0498	0.0554	0.0476	0.0441	0.0529	0.0635	0.0606	0.0408	0.0634	0.0384	0.0528	0.0461	0.0447	0.0536	0.0653	0.0553	0.0372	0.0615	0.0633	0.0846	0.0737	0.0552	0.0319	0.0912	0.0858	0.0587	0.0643	0.0795	0.0683	0.1014	0.1061	0.0535	0.0807	0.0897	0.1045	0.0496	0.0642	0.0806	0.0642	0.0759	0.0496	0.1092	0.1372	0.0329	0.0613	0.1480	0.0551	0.1672	0.1214	0.0843	0.0910	0.0769	0.1108	0.1392	0.0869	0.1290	0.0909]'; 
units.WJO  = {'mug', 'mul/h'};  label.WJO = {'wet weight', 'O_2 consumption'};  
temp.WJO   = C2K(18.5);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO = 'StamLeem1996';
comment.WJO = 'The experiment started after the animals reached a weight of above 50 micro gram (which is around 26-30 days old individuals)';

% time - weight data
data.tW = [...  time since birth (d), wet weight (g), number of indivduals observed    
    0    1.8e-6              20
   16    7.29e-5             15
   23    0.0001656           15
   30    0.0002255           15
   37    0.0002419           15
   44    0.0002498           15
   51    0.0002631           15
   58    0.0002774           15
   65    0.0002935           15
   72    0.0002715           15
   86    0.0003098           12
  100    0.0002987            6
  114    0.0002865            4];
data.tW = data.tW(:, [1 2]);
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'CromDood1997';
    
% time - reproduction
data.tN = [   ... % time since birth (d), cumulative number of eggs (#), number of indivduals observed     
            0            0           15
           22       31.067           15
           29       127.67           15
           36       255.80           15
           43       347.01           14
           50       376.73           14
           57       451.09           11
           64       490.73           11
           71       543.09           11
           78       588.19           10
           85       654.89           10
           92       716.14            8
           99       758.54            5
          106       789.74            5
          113       840.99            4
          120       888.33            3];
data.tN = data.tN(:, [1 2]);
units.tN  = {'d', '#'};  label.tN = {'time since birth', 'cum # of eggs'};  
temp.tN   = C2K(20);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'CromDood1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tN_T3 = 0 * weights.tN_T3;
weights.tW(12:13) = 0; % avoid decrease in weight due to ageing       

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f1','tL_f2','tL_f3'}; subtitle1 = {'Data at 3 food levels'};
set2 = {'tN_f1','tN_f2','tN_f3'}; subtitle2 = {'Data at 3 food levels'};
set3 = {'tL_T3','tL_T2','tL_T1'}; subtitle3 = {'Data at 25, 20, 15 C'};
set4 = {'tN_T3','tN_T2','tN_T1'}; subtitle4 = {'Data at 25, 20, 15 C'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = [ ...
'A laboratory culture of F. candida was used for these experiments, which ' ...
'has been kept for more than 10 years at the Institute of Environmental ' ...
'Sciences of Jagiellonian University, Poland. The animals were maintained ' ...
'as stock cultures in plastic boxes filled with moist plaster of paris, ' ...
'mixed with charcoal, at a constant temperature of 20C, and with dried ' ...
'baker''s yeast (Dr. Oetker) as food. Prior to the experiments, adult ' ...
'animals were transferred to a plastic boxes (10 cm in diameter) with ' ...
'plastic screw top lids, and filled with moist plaster of paris to lay ' ...
'eggs. After 7 days, the adults were removed and the eggs were allowed to ' ...
'hatch. Emerging juveniles of age between 1 and 3 days were used in the ' ...
'experiments. ' ...
'Two sets of experiments were designed. EXPERIMENT 1: growth and ' ...
'reproduction of individuals was observed at three feeding conditions. ' ...
'EXPERIMENT 2: growth and reproduction of individuals observed at three ' ...
'different temperatures with ad libitum food. Both experiments were ' ...
'carried out in plastic containers (3. 5 cm in diameter) with plastic ' ...
'screw top lids. 1--3 days old juveniles were individually kept in ' ...
'plastic vessels (diameter 3.5 cm) filled with moist plaster of paris at ' ...
'three feeding regimes. Baker''s yeast solution (0.2 g/ml) was used as food ' ...
'source. Body lengths (i.e. the distance from the posterior end of the ' ...
'abdomen to the anterior end of the head between the antennae) were ' ...
'determined using the free image analysis software ImageJ (v.1.47p); ' ...
'(National Institute of Health, USA, http://imagej.nih.gov).'  ...
'EXPERIMENT 1: ' ...
'Growth and Reproduction at three food regimes. ' ...
'In the highest food regime, food was supplied ad libitum. In the ' ...
'medium food regime, the yeast solution was available for 24 hours, ' ...
'followed by 48 hours without food. In the lowest food regime, the yeast ' ...
'solution was available for 24 hours, followed by 96 hours without food. ' ...
'EXPERIMENT 2: ' ...
'three constant temperature % chambers set at 15, 20 and 25 oC were used. ' ...
'The humidity of the plaster of paris was kept constant by regularly ' ...
'spraying with distilled water. 10 individuals per feeding and temperature ' ...
'regime were used.  Body length and reproduction of the individuals were ' ...
'observed for 11 - 12 weeks. ' ...
'The three temperature conditions are T1 = 288 K, T2 = 293 K and T3 = 298K.'];    
D2 = 'Egg production at treatment T3 did not follow the expected pattern for unknown reasons';
D3 = 'Respiration is overestimated; this might suggest product formation coupled to maintenance';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '6JBFM'; % Cat of Life
metaData.links.id_ITIS = '99403'; % ITIS
metaData.links.id_EoL = '1025638'; % Ency of Life
metaData.links.id_Wiki = 'Folsomia_candida'; % Wikipedia
metaData.links.id_ADW = 'Folsomia_candida'; % ADW
metaData.links.id_Taxo = '1045058'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_collembola = 'anurinae.htm#Folsomia'; % collembola

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Folsomia_candida}}';
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
bibkey = 'CromDood1997'; type = 'Incollection'; bib = [ ... 
'author = {Crommentuijn, T. and Doodeman, C. J. A. M. and Doornekamp, A. and Van Gestel, C. A. M.}, ' ... 
'year = {1997}, ' ...
'title = {Life-table study with the springtail \emph{Folsomia candida} ({W}illem) exposed to cadmium, chlorpyrifos and triphenyltin hydroxide}, ' ...
'booktitle = {Ecological risk assessment of contaminants in soil}, ' ...
'editor = {N. M. Van Straalen and  H. L{\o}kke}, ' ...
'publisher = {Chapman \& Hall}, '...
'pages = {275--291}, ' ...
'address = {London, UK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FounHopk2005'; type = 'Article'; bib = [ ... 
'author = {Fountain, M. T. and Hopkin, S. P.}, ' ... 
'year = {2005}, ' ...
'title = {\emph{Folsomia candida} ({C}ollembola): {A} "standard" soil arthropod}, ' ...
'journal = {Annual Review of Entomology}, ' ...
'volume = {50}, ' ...
'pages = {201--222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StamLeem1996'; type = 'Article'; bib = [ ... 
'author = {Stam, E. M. and van de Leemkule, M.A. and Ernsting, G.}, ' ... 
'year = {1996}, ' ...
'title = {Trade-offs in the life history and energy budget of the parthenogenetic collembolan \emph{Folsomia candida} ({W}illem)}, ' ...
'journal = {Oecologia}, ' ...
'volume = {107}, ' ...
'number = {3}, '...
'pages = {283-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hamd2014'; type = 'Phdthesis'; bib = [ ... 
'author = {Hamda, N. T.}, ' ... 
'year = {2014}, ' ...
'title = {Mechanistic models to explore combined effects of toxic chemicals and natural stressing factors: case study on springtails}, ' ...
'school = {VU University, Amsterdam}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

