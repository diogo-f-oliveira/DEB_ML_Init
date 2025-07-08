function [data, auxData, metaData, txtData, weights] = mydata_Squalus_acanthias

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Squalidae';
metaData.species    = 'Squalus_acanthias'; 
metaData.species_en = 'Spurdog'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAN', 'MAm', 'MAS'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Le'; 't-VYe'; 'L-N'; 'L-Ww'; 'L-Wwe'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 03 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Starrlight Augustine'};    
metaData.date_mod_2     = [2017 03 13];              
metaData.email_mod_2    = {'sta@akvaplan.niva.no'};            
metaData.address_mod_2  = {'Akvaplan-niva'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 04 01];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 23*30;units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'JoneGeen1977';    
  temp.ab = C2K(9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps of all data are guessed; Avsa2001: 18-24 months; Wiki 22-24 month';
data.ap = 6*365;  units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'Avsa2001';
  temp.ap = C2K(9);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'from text: males and females are sexually mature in their 5th year of life;  wiki 11 yr for males, 18-21 yr for females, Steh2007: >10 yr';
data.am = 80*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Steh2007';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'JoneGeen1977 sample females up to 70 years old - AnDiv: 25-30 yr';

data.Lb  = 24;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'JoneGeen1977';
comment.Lb = 'consistent with Avsa2001, YigiIsme2013 - smaller size at birth must exist because 17 cm long ind. observed in YigiIsme2013, YigiIsme2016';
data.Lp  = 72;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Avsa2001';
  comment.Lp = 'Avsa2001: 82 for males, 88 cm for females is the 50% length at maturation, here we take the smallest size female with embryos';
data.Li  = 136;   units.Li  = 'cm';  label.Li  = 'ultimate total length (fem.)';   bibkey.Li  = 'Avsa2001';
  comment.Li = 'max. observed length of fem. in SE Black sea -  it is NOT the L_inf estimated by pooling male and female data';
data.Li_m  = 121;   units.Li_m  = 'cm';  label.Li_m  = 'ultimate total length (males)';   bibkey.Li_m  = 'Avsa2001';
  comment.Li_m = 'max. observed length of males. in SE Black sea - NOT the L_inf estimated by pooling male and female data';

data.Ww0 = 35; units.Ww0 = 'g';   label.Ww0 = 'wet weight at start (egg)';     bibkey.Ww0 = 'YigiIsme2013';
  comment.Ww0 = 'fig. 7 - the numbers are consistent with volume of egg in JoneGeen1977';
data.Wwp = 950; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Avsa2001';
  comment.Wwp = 'the weigth of 72 cm female is stated in the text';

% data.Wwi = 12021; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Avsa2001';
% data.Ri  = 7/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Avsa2001';   
%   temp.Ri = C2K(9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
%   comment.Ri = 'Avsa2001: 14 per 2 yr';


data.LN = [ ... length-range (cm), mean numer of embryos (#)
 70  74  2.5
 75  79  2.8
 80  84  3.2
 85  89  3.3
 90  94  4.1
 95  99  4.7
100 104  6.6
105 109  7.0
110 114  9.0
115 119 11.4
120 124 13.1
125 129 14.0
130 134 14.0
135 139 14.0];
data.LN = [ .5 * sum(data.LN(:,1:2),2) data.LN(:,3)];
units.LN = {'cm', '#'};     label.LN = {'total length', 'mean numer of embryos'};  
  temp.LN = C2K(9); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Avsa2001';
comment.LN = 'number of embryos in uterus, temp not given SE Black Sea, bottum';

% length-wet weight males
data.LW_m = [ ... Length (cm)	Weight (gr)		
112.5	6400		
98	4300		
32	130		
37	165		
35.5	150		
53	460		
119	5900		
90	2600		
112	4600		
110.5	5700		
115	6400		
117.5	7100		
113	5200		
110	4700		
111	5400		
110	5000		
110	4800		
107	4200		
114	5000		
115	5500		
90	2800		
37	165		
36.5	150		
53	460		
105.5	4300		
107	3300		
108.5	3300		
110.5	3800		
98	2000		
104.5	3500		
103.5	3500		
105.5	2950		
112.5	3850		
110	3900		
116.5	4500		
116	5000		
121	5000		
113.5	4000		
105	2500		
107.5	3000		
123	6000		
107	3000		
113.5	3800		
109.5	3000		
109	4000		
103	2500		
99.5	2200		
107	3600		
110	3700		
97	2150		
104	2750		
98.5	2600		
108.5	3000		
103	2800		
95	2000		
116	4500		
110.5	4000		
121	5200		
116	4400		
94	2100		
121.5	4500		
104.5	3100		
96	2400		
88.5	2100		
112	3800		
119	4800		
117	4800		
114.5	5000		
97	3300		
109	4500		
86	2000		
103	3000		
116	4700		
117	3100		
102	3300		
109.5	4000		
109	3200		
114	5000		
91.5	2600		
115.5	5600		
96	3000		
93.5	2500		
110	5000		
105	4000		
98	3000		
100	3000		
99.5	3100		
115	4600		
106	3850		
87	2100		
96.5	2900		
94.5	3100		
97.5	3200		
114	4600		
115	5000		
112.5	4100		
118	4100		
97.5	2500		
117	4700		
109.5	3500		
113	4200		
115.5	4400		
117	4250		
113	4400		
104.5	3300		
103	3400		
112	4000		
110.5	4000		
116	5000		
117	5200		
102	6000		
104	3000		
106.5	3500		
124	6500		
104.5	3500		
107	3000		
119	4700		
99	2800		
109	3600		
109	3700		
108	3450		
105.5	3800		
113	3500		
41.5	250		
95.5	3150		
39	260		
36.5	300		
33	90		
27	55		
40	150		
34.5	113		
38.5	165		
38.5	165		
37.5	175		
36  	140		
35.5	145			
];
units.LW_m = {'cm', 'g'};     label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'Avsa2001';
comment.LW_m = 'Data for males - pers. comm Avsar 03/13/17 -from publication, SE Black Sea, bottum';


% length-wet weight females
data.LW_f = [ ...  Length (cm)	Weight (gr)		
53	610		
57.5	590		
82	2100		
57.5	590		
112	4000		
132.5	8000		
130.5	7000		
113	4000		
132	8000		
107	4050		
118.5	5700		
121.5	5500		
121	6300		
121	5500		
115	5500		
85	2000		
116	5500		
108	4400		
106	4550		
116	4600		
126.5	7350		
135	9900		
122.5	8000		
132.5	9150		
131	7500		
132	9700		
124.5	6300		
123.5	6200		
134	7600		
128	6300		
118	5500		
135	7000		
114.5	4700		
136	8700		
126	6500		
125	6700		
126	6600		
121.5	6000		
132	7000		
134	7000		
103.5	3500		
124	7000		
67	800		
72	950		
69	1065		
41	248		
43.5	330		
36.5	165		
39	200		
    ];
units.LW_f = {'cm', 'g'};     label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'Avsa2001';
comment.LW_f = 'Data for females - pers. comm Avsar 03/13/17 -from publication, SE Black Sea, bottum';

% embryo development Straight of Georgia, British Columbia
data.tLe = [ ...
1	5.01
3	11.22
4	13.05
5	14.57
6	16.08
7	16.65
8	16.14
9	17.73
10	19.21
11	21.72
13	23.16
14	23.13
15	25.71
16	26.04
];
data.tLe(:,1) = (data.tLe(:,1) + 7) * 30; % d, age
units.tLe = {'d'; 'cm'};     label.tLe = {'age', 'embryo length'};  
bibkey.tLe = 'JoneGeen1977';
comment.tLe= 'Data for embryo; fig. 4A, start is dec. as shown in fig.3 hence the addition of 7 months to make it age since start of development';
subtitle.tLe= 'Data for embryo';

data.tYe = [ ...
1	33.27
3	28.16
4	24.23
5	24.80
6	24.10
7	22.85
8	26.03
9	21.15
10	19.11
11	15.89
13	5.26
14	1.64
15	4.10
16	0.41
];
data.tYe(:,1) = (data.tYe(:,1) + 7) * 30; % d, age
units.tYe = {'d', 'cm^3'};     label.tYe = {'age', 'yolk volume'};  
bibkey.tYe = 'JoneGeen1977';
comment.tYe= 'Data for embryo; fig. 4B, extrnal yolk - start is dec. as shown in fig.3 hence the addition of 7 months to make it age since start of development ';
subtitle.tYe= 'Data for embryo';

% length-wet weight males
data.LW_m2 = [ ... 
20.48	90.72
22.41	90.72
24.17	90.72
26.19	98.97
28.79	123.71
31.73	181.44
33.91	197.94
36.34	255.67
39.20	288.66
42.13	338.14
45.16	437.11
48.51	527.84
52.21	618.56
55.31	717.53
57.66	800.00
60.60	931.96
64.12	676.29
65.30	1228.87
66.98	849.48
69.66	956.70
73.11	1088.66
82.25	1748.45
80.74	2061.86
83.68	2193.81
87.29	2441.24
100.22	4486.60
107.18	5600.00
121.45	5072.16
];
units.LW_m2 = {'cm', 'g'};     label.LW_m2 = {'total length', 'wet weight', 'male'};  
bibkey.LW_m2 = 'YigiIsme2013';
comment.LW_m2 = 'Data for males fig 2 A, North Aegean sea';

data.LW_f2 = [ ...
16.98	50.85
21.97	93.22
23.72	84.75
27.88	110.17
32.63	144.07
37.37	211.86
42.28	313.56
46.53	432.20
50.61	567.80
54.77	728.81
58.85	949.15
62.68	1169.49
66.34	1381.36
68.59	1567.80
70.75	1737.29
73.33	1949.15
66.17	1771.19
69.08	1220.34
74.49	1203.39
77.41	1652.54
73.66	1652.54
70.42	2194.92
68.25	2279.66
75.24	2288.14
77.16	2127.12
76.16	1940.68
81.32	2152.54
78.91	2576.27
89.31	2754.24
94.55	3991.53
99.96	3957.63
101.71	4288.14
98.22	4627.12
113.95	4661.02
110.04	5745.76
111.37	5974.58
117.78	6771.19
117.28	7288.14
];
units.LW_f2 = {'cm', 'g'};     label.LW_f2 = {'total length', 'wet weight', 'female'};  
bibkey.LW_f2 = 'YigiIsme2013';
comment.LW_f2 = 'Data for females, fig 2 B, North Aegean sea';
%
data.LW_e = [ ... cm, g
4.34	1.67
4.77	1.28
12.44	11.29
12.77	11.59
10.32	18.46
10.62	19.84
10.39	22.09
13.60	14.63
14.00	13.85
14.00	16.20
14.42	17.18
14.71	16.99
17.04	16.40
16.74	19.44
15.93	25.43
16.36	27.10
16.38	24.55
19.41	30.34
19.69	31.82
20.07	32.80
18.79	35.74
19.38	36.24
19.69	36.43
20.21	36.92
19.71	41.73
20.23	45.56
21.22	49.89
22.00	50.57
22.29	51.06
21.93	48.41
];
units.LW_e = {'cm', 'g'};     label.LW_e = {'total length', 'wet weight'};  
bibkey.LW_e = 'YigiIsme2013';
comment.LW_e = 'Data for embryos, fig 7, North Aegean sea';
subtitle.LW_e = 'Data for embryos, North Aegean sea';

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
txtData.subtitle = subtitle;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males (South-eastern Black Sea)'};
set2 = {'LW_f2','LW_m2'}; subtitle2 = {'Data for females, males (Aegean sea)'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only - we use the max. observed values of males and females from Avsa2001, not the von Bert paramter that they estimate.';
D2 = 'predictions assume a mean temperature of 9 deg C';
D3 = 't-L data from YigiIsme2013 and Avsa2001 not included because after a lot of testing the age-length relationship is incoherent point to errors in the ageing, possible different type of error of the young ones with respect to the older ones. Possible different type of error between the studies. YigiIsme2016 age free swimming individuals of 17 cm to be ca 300 d old while length at birth is reported at 24-26 cm. These age estimates suggest a very high p_M while the rest of the data do not support this.';
D4 = 'We use the actual length/ weight of smallest mature female in Avsa2001 and not the length where 50% were observed to be mature. We use the age estimate of sexual maturiaty from that study.';
D5 = 'Notice that egg weight is around 30 - 40 g (JoneGeen1977, YigiIsme2013) but that embryo weight around birth is > 50 g or more (YigiImse2013, fig. 6 of this AmP entry). This point to some external source of food from before birth. For this reason the slight discrepancy in predicted embryo length as function of time is acceptable. ';
D6 = 'mod_3: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Facts
F1 = 'main food species: demersal fishes like: whiting (Merlangius merlangus euxinus), red mullet (Mullus barbatus) and black goby (Gobius niger) were the commonest.  Also some common shrip Cragnon cragnon)';
metaData.bibkey.F1 = 'Avsa2001';
F2 = 'Ovoviviparous. Depth around 50-149m, but have been found deeper than 700m.';
metaData.bibkey.F2 = 'Wiki';
F3 = 'spurdogs favor a temp of 7 - 15 C';
metaData.bibkey.F3 = 'Steh2007';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6ZDWC'; % Cat of Life
metaData.links.id_ITIS = '160617'; % ITIS
metaData.links.id_EoL = '46560201'; % Ency of Life
metaData.links.id_Wiki = 'Squalus_acanthias'; % Wikipedia
metaData.links.id_ADW = 'Squalus_acanthias'; % ADW
metaData.links.id_Taxo = '41840'; % Taxonomicon
metaData.links.id_WoRMS = '105923'; % WoRMS
metaData.links.id_fishbase = 'Squalus-acanthias'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Squalus_acanthias}}';  
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
bibkey = 'Steh2007'; type = 'Article'; bib = [ ... 
'author = {L. L. Stehlik.}, ' ...
'year = {1972}, ' ...
'title  = {Spiny Dogfish, \emph{Squalus acanthias}, Life History and Habitat Characteristics.}, ' ...
'journal = {NOAA Technical Memorandum}, ' ...
'volume = {NMFS-NE-203}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Avsa2001'; type = 'Article'; bib = [ ... 
'author = {D. Avsar}, ' ...
'year = {2001}, ' ...
'title  = {Age, Growth, Reproduction and Feeding of the Spurdog (\emph{Squalus acanthias} {L}innaeus, 1758) in the {S}outh-eastern {B}lack {S}ea}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {52}, ' ...
'number = {2}, ' ...
'pages = {269--278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YigiIsme2016'; type = 'Article'; bib = [ ... 
'author = {Yigin, C.C. and Ismen, A.}, ' ...
'year = {2016}, ' ...
'title  = {Age and Growth of Spiny Dogfish \textit{Squalus acanthias} ({S}qualidae: {C}hondrichthyes) in the {N}orth {A}egean {S}ea}, ' ...
'journal = {Pakistan Journal of Zoology}, ' ...
'volume = {48}, ' ...
'number = {4}, ' ...
'pages = {1185--1191}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YigiIsme2013'; type = 'Article'; bib = [ ... 
'author = {Yigin, C.C. and Ismen, A.}, ' ...
'year = {2013}, ' ...
'title  = {Reproductive Biology of Spiny Dogfish \textit{Squalus acanthias}, in the {N}orth {A}egean {S}ea}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {13}, ' ...
'doi = {10.4194/1303-2712-v13_1_20}, ' ...
'pages = {169--177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnDiv'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Squalus_acanthias/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneGeen1977'; type = 'Article'; bib = [ ... 
'author = {Jones, B. C. and Geen, G. H.}, ' ...
'year = {1977}, ' ...
'title  = {Reproduction and Embryonic Development of Spiny Dogfish (\textit{Squalus acanthias} in the {S}trait of {G}eorgia, {B}ritish {C}olumbia}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {34}, ' ...
'number = {9}, ' ...
'doi = {10.1139/f77-190}, ' ...
'pages = {1286--1292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%% all the time-length data is not used:

% % uni-variate data at f
% data.tL_m = [ ... % time since birth (yr), total length (cm)
% 0.936	33.088
% 1.955	43.676
% 2.933	59.118
% 3.952	77.206
% 4.909	87.794
% 5.887	92.206
% 6.927	97.941
% 7.905	103.235
% 8.924	105.882
% 9.902	109.853
% 10.880	112.500
% 11.899	115.588
% 12.877	118.235];data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
% units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length'};  bibkey.tL_m = 'Avsa2001';
%   temp.tL_m = C2K(9); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
% %
% data.tL_f = [ ... % time since birth (yr), length (cm)
% 0.999	39.600
% 2.039	56.368
% 3.016	63.230
% 3.973	86.893
% 4.930	99.787
% 5.929	103.633
% 6.990	106.185
% 7.967	107.878
% 8.987	114.739
% 9.964	119.016
% 10.963	120.278
% 11.961	125.847
% 12.939	129.694
% 13.958	131.817];
% data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
% units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length'};  bibkey.tL_f = 'Avsa2001';
%   temp.tL_f = C2K(9); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
%   comment.tL_f = 'females, South-eastern Black Sea';
% %

% data.tL_m2 = [ ... % time since birth (yr), length (cm)
% 1.08	20.55
% 1.68	22.71
% 2.06	26.07
% 2.17	27.89
% 2.19	30.93
% 2.32	31.54
% 2.48	35.04
% 2.47	33.07
% 2.61	32.47
% 2.62	39.00
% 2.59	37.17
% 2.74	38.55
% 2.75	36.27
% 2.88	35.98
% 2.881	40.83
% 2.8811	50.39
% 3.04	49.49
% 3.03	42.51
% 3.031	38.87
% 3.16	45.55
% 3.19	41.61
% 3.18	38.57
% 3.33	55.12
% 3.32	52.09
% 3.331	48.90
% 3.3311	45.26
% 3.332	39.95
% 3.50	56.95
% 3.49	54.22
% 3.501	50.73
% 3.491	46.03
% 3.48	39.96
% 3.64	53.62
% 3.62	48.31
% 3.63	36.17
% 3.78	56.82
% 3.79	53.17
% 3.80	49.23
% 3.781	45.74
% 3.801	42.55
% 3.93	65.32
% 3.95	57.13
% 3.94	53.03
% 3.941	48.78
% 3.951	45.44
% 3.942	40.13
% 4.10	54.56
% 4.11	51.98
% 4.111	47.58
% 4.1111	44.85
% 4.101	36.80
% 4.26	54.26
% 4.27	50.77
% 4.271	45.61
% 4.43	54.58
% 4.41	47.90
% 4.57	56.56
% 4.59	52.01
% 4.591	54.13
% 4.75	55.51
% 4.74	52.77
% 4.751	48.98
% 4.7511	43.37
% 4.91	56.42
% 5.08	64.17
% 5.081	59.01
% 5.09	54.61
% 5.07	51.27
% 5.10	48.54
% 5.43	50.84
% 5.431	47.50
% 5.60	52.22
% 6.11	44.20
% 6.28	44.52
% 6.46	56.51
% 7.19	88.12
% ];
% [Y,I]=sort(data.tL_m2(:,1)); data.tL_m2 = data.tL_m2(I,:); % sort rows
% data.tL_m2(:,1) = 365 * data.tL_m2(:,1); % convert yr to d
% units.tL_m2 = {'d', 'cm'};     label.tL_m2 = {'time since birth', 'total length'};  bibkey.tL_m2 = 'YigiIsme2016';
% temp.tL_m2 = C2K(9); units.temp.tL_m2 = 'K'; label.temp.tL_m2 = 'temperature';
% comment.tL_m2 = 'males, North Aegean Sea from Saros Bay between February 2005 and September 2008.';
% %
% data.tL_f2 = [ ... % time since birth (yr), length (cm)         
% 0.85	17.08
% 1.29	22.55
% 1.66	24.59
% 1.93	26.23
% 1.77	28.97
% 2.06	30.60
% 2.19	31.28
% 2.20	29.23
% 2.31	29.91
% 2.33	36.07
% 2.331	38.12
% 2.47	42.91
% 2.45	54.67
% 2.60	36.61
% 2.61	34.42
% 2.601	32.51
% 2.74	32.92
% 2.741	35.11
% 2.7411	37.43
% 2.87	59.59
% 2.88	53.84
% 2.89	43.86
% 2.891	42.35
% 2.881	36.20
% 3.04	33.46
% 3.18	31.40
% 3.31	34.00
% 3.16	35.78
% 3.19	37.83
% 3.17	40.16
% 3.161	43.99
% 3.171	45.63
% 3.1711	69.70
% 3.34	59.85
% 3.32	56.16
% 3.33	52.06
% 3.321	47.27
% 3.3211	43.30
% 3.32111	40.16
% 3.50	38.92
% 3.46	45.62
% 3.48	47.40
% 3.49	51.10
% 3.47	60.40
% 3.63	66.96
% 3.64	55.88
% 3.641	53.69
% 3.6411	51.23
% 3.631	47.40
% 3.64111	44.80
% 3.6311	40.29
% 3.62	37.42
% 3.80	76.80
% 3.78	60.80
% 3.781	53.42
% 3.801	50.27
% 3.7811	46.85
% 3.91	69.96
% 3.94	63.26
% 3.941	56.29
% 3.95001	50.68
% 3.96	48.08
% 3.9512	44.93
% 3.930001	39.60
% 3.9411	29.61
% 4.10	43.29
% 4.101	48.21
% 4.11	50.81
% 4.08	53.27
% 4.09	56.97
% 4.26	57.78
% 4.27	51.08
% 4.261	54.23
% 4.2611	45.61
% 4.26111	40.96
% 4.29	35.35
% 4.41	43.69
% 4.43	47.66
% 4.411	51.22
% 4.4111	54.36
% 4.412	57.23
% 4.57	63.39
% 4.56	60.38
% 4.58	57.23
% 4.60	51.76
% 4.59	47.38
% 4.73	65.98
% 4.751	62.97
% 4.74	57.78
% 4.741	54.77
% 4.7411	52.03
% 4.74111	49.71
% 4.90	68.44
% 4.901	63.11
% 4.9012	53.67
% 4.90111	50.52
% 5.06001	72.27
% 5.080001	66.25
% 5.0812001	64.20
% 5.081101	57.91
% 5.092	54.49
% 5.08	50.25
% 5.081	42.45
% 5.05	37.94
% 5.24	75.28
% 5.241	68.03
% 5.2411	65.70
% 5.25	62.55
% 5.242	59.14
% 5.2422	55.31
% 5.26	52.30
% 5.261	49.56
% 5.2611	47.51
% 5.42	50.24
% 5.41	55.58
% 5.411	65.83
% 5.60	71.58
% 5.61	60.91
% 5.94	64.05
% 6.11	76.22
% 6.10	73.07
% 6.12	70.06
% 6.29	69.24
% 6.30	50.50
% 6.46	65.95
% 6.461	61.30
% 6.63	71.83
% 6.631	66.91
% 7.36	62.38
% ];
% [Y,I]=sort(data.tL_f2(:,1)); data.tL_f2 = data.tL_f2(I,:); % sort rows
% data.tL_f2(:,1) = 365 * data.tL_f2(:,1); % convert yr to d
% units.tL_f2 = {'d', 'cm'};     label.tL_f2 = {'time since birth', 'total length'};  bibkey.tL_f2 = 'YigiIsme2016';
% temp.tL_f2 = C2K(9); units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
% comment.tL_f2 = 'females, North Aegean Sea from Saros Bay between February 2005 and September 2008. ';
% 
% 
