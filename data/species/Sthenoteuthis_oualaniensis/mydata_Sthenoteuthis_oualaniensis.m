function [data, auxData, metaData, txtData, weights] = mydata_Sthenoteuthis_oualaniensis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Ommastrephidae';
metaData.species    = 'Sthenoteuthis_oualaniensis'; 
metaData.species_en = 'Purpleback flying squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.am = 6*30.5;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'LiuLin2017';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18.3;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'LiuLin2017';
  comment.Lp = '195 to 330 mm';
data.Lpm  = 15.6;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male'; bibkey.Lpm  = 'LiuLin2017';
  comment.Lpm = '142 to 250 mm';
data.Li  = 24; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'LiuLin2017';
data.Lim = 18; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'LiuLin2017';

data.Wwb  = 2.7e-4; units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';       bibkey.Wwb  = 'Wiki';
  comment.Wwb = 'based on egg diameter of 0.8 mm for Sthenoteuthis_pteropus: pi/6*0.08^3';

data.Ni  = 2e6; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'Snij1998';   
  temp.Ni = C2K(26); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length 
data.tL_f = [ ... % time since birth (d), mantle length (cm)
51.939	11.428
67.116	11.575
69.949	12.117
71.771	13.594
73.187	12.708
75.008	15.563
76.627	15.366
77.032	16.105
77.234	13.742
77.639	15.858
78.044	14.726
79.056	13.446
79.865	15.218
79.866	13.791
80.472	14.726
80.473	14.923
82.091	16.646
84.317	17.434
84.519	15.612
85.531	13.545
89.376	17.040
91.602	17.828
92.007	16.794
93.221	16.400
94.840	17.434
96.256	16.252
96.863	17.778
99.089	16.695
99.292	18.763
99.293	17.877
101.315	16.400
102.934	17.582
103.946	19.846
104.148	18.369
105.160	17.286
106.577	17.828
107.791	18.960
108.600	18.665
112.445	18.369
114.671	19.354
117.909	19.698
119.730	19.157
127.015	20.486
154.536	23.046];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LiuLin2017';
comment.tL_f = 'Data for females, autumn group)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm)
61.653	11.477
69.342	12.905
69.747	13.791
71.366	12.018
72.378	13.249
73.187	14.037
73.794	13.495
75.008	14.185
75.413	13.348
75.616	13.988
76.223	14.332
76.830	14.086
77.234	14.283
78.853	14.135
79.460	15.022
79.663	14.480
79.865	14.578
80.877	14.234
81.484	15.711
81.686	15.071
82.496	14.529
83.305	14.529
84.518	14.578
84.519	14.332
84.722	14.923
85.734	15.760
86.543	14.874
86.544	14.382
86.745	15.662
87.554	14.874
87.555	15.662
87.556	15.908
88.364	15.366
88.567	16.105
89.174	14.726
89.376	15.858
89.377	15.514
90.793	15.514
90.794	15.809
91.197	14.775
91.804	15.169
91.805	15.415
93.828	15.022
96.661	15.169
124.992	17.138
127.825	17.828
129.848	17.975];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LiuLin2017';
comment.tL_m = 'Data for males, autumn group)'; 

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
54.241	63.552
67.071	67.672
70.731	88.269
71.544	94.448
72.971	88.269
74.190	98.567
75.387	185.075
78.034	187.134
78.252	139.761
79.072	119.164
79.865	193.313
82.301	220.090
84.330	246.866
84.359	148.000
89.440	183.015
90.037	230.388
90.845	255.104
91.655	269.522
93.089	242.746
93.300	218.030
94.510	259.224
95.749	201.552
96.538	286.000
98.192	203.612
98.574	288.060
98.599	205.672
100.197	310.716
102.668	218.030
103.272	242.746
103.856	335.433
104.891	277.761
106.123	242.746
107.339	265.403
107.527	316.896
108.961	288.060
112.838	263.343
115.262	333.373
117.915	314.836
119.350	281.881
127.463	395.164
154.888	634.090];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(26);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'LiuLin2017';
comment.tWw_f = 'Data for females from Western Sahara)'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
62.377	102.687
68.893	106.806
69.296	121.224
71.332	121.224
72.556	115.045
73.976	133.582
74.175	152.119
74.592	117.104
76.217	131.522
76.222	117.104
77.630	174.776
77.844	141.821
78.244	164.478
78.862	141.821
79.268	145.940
79.470	152.119
80.289	135.642
80.907	112.985
81.096	164.478
81.508	145.940
82.933	148.000
83.143	127.403
83.743	164.478
83.750	139.761
84.752	197.433
85.375	156.239
85.788	135.642
86.404	119.164
86.595	162.418
87.212	143.881
88.012	191.254
88.017	176.836
89.637	207.731
89.645	178.896
89.847	185.075
89.859	143.881
90.861	199.493
91.275	176.836
92.092	170.657
94.534	176.836
97.181	178.896
125.072	218.030
128.530	230.388
130.528	362.209];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(26);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'LiuLin2017';
comment.tWw_m = 'Data for males from Western Sahara)'; 
    
%% set weights for all real data
weights = setweights(data, []);
% weights.tL_f = 3 * weights.tL_f;
% weights.tL_m = 3 * weights.tL_m;
% weights.tWw_f = 3 * weights.tWw_f;
% weights.tWw_m = 3 * weights.tWw_m;
% weights.Wwb = 3 * weights.Wwb;
% weights.Ni = 5 * weights.Ni;
% weights.Lpm = 5 * weights.Lpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Data concerns the small form of this species';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '52HL3'; % Cat of Life
metaData.links.id_ITIS = '556284'; % ITIS
metaData.links.id_EoL = '492079'; % Ency of Life
metaData.links.id_Wiki = 'Sthenoteuthis_oualaniensis'; % Wikipedia
metaData.links.id_ADW = 'Sthenoteuthis_oualaniensis'; % ADW
metaData.links.id_Taxo = '158111'; % Taxonomicon
metaData.links.id_WoRMS = '342066'; % WoRMS
metaData.links.id_molluscabase = '342066'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sthenoteuthis_oualaniensis}}';
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
bibkey = 'LiuLin2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s11802-017-3184-0}, ' ...
'author = {Liu, Bilin1 and Lin, Jingyuan and Feng, Chunlei and  Li, Jianhua1) and Su, Hang}, ' ... 
'year = {2017}, ' ...
'title = {Estimation of Age, Growth and Maturation of Purpleback Flying Squid, \emph{Sthenoteuthis oualaniensis}, in {B}ashi {C}hannel, {C}entral {P}acific {O}cean}, ' ...
'journal = {J. Ocean Univ. China (Oceanic and Coastal Sea Research)}, ' ...
'volume = {16(3)}, ' ...
'pages = {525-531}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Snij1998'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s11802-017-3184-0}, ' ...
'author = {R. Snijder}, ' ... 
'year = {1998}, ' ...
'title = {ASPECTS OF THE BIOLOGY OF THE GIANT FORM OF \emph{Sthenoteuthis oualaniensis} ({C}EPHALOPODA: {O}MMASTREPHIDAE) FROM THE {A}RABIAN {S}EA}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {64}, ' ...
'pages = {21-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Sthenoteuthis-oualaniensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

