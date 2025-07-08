function [data, auxData, metaData, txtData, weights] = mydata_Gavia_immer

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Gaviiformes'; 
metaData.family     = 'Gaviidae';
metaData.species    = 'Gavia_immer'; 
metaData.species_en = 'Great northern loon'; 

metaData.ecoCode.climate = {'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', 'xiMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 08 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3  = {'Bas Kooijman'};    
metaData.date_mod_3    = [2022 11 22];              
metaData.email_mod_3   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3 = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 10];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.author_mod_5   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_5     = [2023 06 30];              
metaData.email_mod_5    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_5  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 24.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SnowPerr1998';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from FourKara2007';
data.tx = 73.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'SnowPerr1998';   
  temp.tx = C2K(39.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from Suite101';
data.tp = 220.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from Suite101';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'CramSimm1977';
  temp.tR = C2K(39.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8797;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'TacuCrai2013';   
  temp.am = C2K(39.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 80;     units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SnowPerr1998';

data.Wwb = 79.6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'FourKara2007';
data.Wwi = 4040;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'SnowPerr1998';

data.Ri  = 0.005479452; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'SnowPerr1998';   
  temp.Ri = C2K(39.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
1 84.27919948;
2 94.57874039;
3 104.8822422;
4 115.1897048;
5 131.7315517;
6 162.8123738;
7 195.9554805;
8 216.6694271;
9 239.4456583;
10 274.670854;
11 316.1423166;
12 349.321071;
13 403.2533805;
14 457.1936118;
15 504.9153021;
16 556.7615618;
17 612.7997254;
18 675.0405865;
19 743.515832;
20 816.1631771;
21 884.654266;
22 959.3995434;
23 998.7849562;
24 1067.272084;
25 1123.282522;
26 1193.851739;
27 1312.233746;
28 1370.330233;
29 1436.731311;
30 1498.991977;
31 1565.420781;
32 1613.114745;
33 1696.140848;
34 1748.010873;
35 1831.040937;
36 1899.54390899999;
37 1949.327884;
38 2017.818973;
39 2075.899617;
40 2127.769641;
41 2140.171076;
42 2185.794834;
43 2250.113823;
44 2260.417325;
45 2306.052965;
46 2393.255129;
47 2467.976641;
48 2488.658901;
49 2505.192826;
50 2571.62163;
51 2654.655655;
52 2721.064655;
53 2750.039623;
54 2818.546555;
55 2872.486786;
56 2893.18885;
57 2924.281555;
58 3007.299736;
59 3046.685149;
60 3081.942032;
61 3115.108903;
62 3129.568661;
63 3150.24696;
64 3168.882779;
65 3206.194024;
66 3249.735693;
67 3247.558544;
68 3259.936213;
69 3288.966633;
70 3251.461305;
71 3267.99127;
72 3222.17343;
73 3294.820775;
74 3234.483764;
75 3236.470793;
76 3263.383476;
77 3223.803981;
78 3215.408291;
79 3219.453643;
81 3219.334818;
82 3217.11806;
83 3275.234352;
84 3200.338562;
85 3248.036487];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'FourKara2007';

data.tW_f = [ ... % time since birth (d), weight (g)
0.000	80.515
4.867	98.799
9.317	188.474
15.434	358.652
22.104	618.165
27.245	832.900
32.385	1083.350
38.778	1333.910
43.636	1691.478
47.384	1941.806
50.996	2102.836
55.998	2335.417
60.446	2478.664
64.338	2595.076
68.367	2782.928
76.294	2935.408
80.748	2891.155
85.061	2909.390
89.237	2882.970
93.276	2785.109
96.894	2776.497
101.625	2785.840];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'SchoMenn2020';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
0.000	80.515
4.031	125.511
7.787	170.483
12.236	286.944
15.432	412.224
22.797	707.511
26.964	922.161
32.382	1190.493
38.355	1467.801
43.213	1834.298
46.682	2111.388
50.570	2370.656
54.041	2594.175
57.097	2737.299
60.431	2907.234
63.767	3023.597
68.073	3238.260
72.105	3327.899
76.695	3390.800
80.449	3480.415
84.763	3480.792
89.081	3356.170
92.977	3365.440
97.014	3312.222
101.746	3303.708];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'SchoMenn2020';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: male and female weight data added';
D2 = 'Males are assumed to differ from females by {p_Am} only'; 
D3 = 'mod_3: v is reduced';
D4 = 'mod_4: males have equal state variables at b, compared to females';
D5 = 'mod_5: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '3FFP6'; % Cat of Life
metaData.links.id_ITIS = '174469'; % ITIS
metaData.links.id_EoL = '45508998'; % Ency of Life
metaData.links.id_Wiki = 'Gavia_immer'; % Wikipedia
metaData.links.id_ADW = 'Gavia_immer'; % ADW
metaData.links.id_Taxo = '51431'; % Taxonomicon
metaData.links.id_WoRMS = '137187'; % WoRMS
metaData.links.id_avibase = '7E02237895784E9A'; % avibase
metaData.links.id_birdlife = 'common-loon-gavia-immer'; % birdlife
metaData.links.id_AnAge = 'Gavia_immer'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gavia_immer}}';
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
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CramSimm1977'; type = 'Incollection'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1977}, ' ...
'title = {Ostrich to Ducks.}, ' ...
'booktitle = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {I}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FourKara2007'; type = 'Article'; bib = [ ... 
'author = {Fournier, F. and Karasov, W. H. and Kenow, K. P. and Meyer, M. W.}, ' ... 
'year = {2007}, ' ...
'title = {Growth and energy requirements of captive-reared Common Loon (\emph{Gavia immer}) chicks}, ' ...
'journal = {The Auk}, ' ...
'volume = {124}, ' ...
'number = {4}, '...
'pages = {1158--1167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchoMenn2020'; type = 'Incollection'; bib = [ ... 
'doi = {10.1002/9781119167792}, ' ...
'author = {Ren\''{e}e Schott and Jesse Menne}, ' ... 
'year = {2020}, ' ...
'title = {Loons}, ' ...
'booktitle = {Hand-Rearing Birds}, ' ...
'editor = {Duerr, R. S. and Gage, L. J. }, ' ...
'pages = {151--166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'suite101'; type = 'Misc'; bib = ...
'howpublished = {\url{http://suite101.com/article/the-mystique-of-the-north-american-common-loon-a272832}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

