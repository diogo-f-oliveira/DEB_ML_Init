function [data, auxData, metaData, txtData, weights] = mydata_Loxodonta_africana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Proboscidea'; 
metaData.family     = 'Elephantidae';
metaData.species    = 'Loxodonta_africana'; 
metaData.species_en = 'African elephant'; 

metaData.ecoCode.climate = {'Aw', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lx'; 'Lp'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'; 'JXi'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 10 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2012 09 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2015 10 12];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};  

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2017 11 20];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};  

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 11];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 670;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 1071;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4018;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 80*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 90;    units.Lb  = 'cm';  label.Lb  = 'shoulder height at birth';   bibkey.Lb  = 'AnAge';
data.Lx  = 135;   units.Lx  = 'cm';  label.Lx  = 'shoulder height at weaning'; bibkey.Lx  = 'AnAge';
data.Lp  = 230;   units.Lp  = 'cm';  label.Lp  = 'shoulder height st puberty'; bibkey.Lp  = 'AnAge';
data.Li  = 250;   units.Li  = 'cm';  label.Li  = 'ultimate shoulder height';   bibkey.Li  = 'ShraFerr2006';

data.Wwb = 105e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 600e3; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 4.8e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 0.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

  
data.JXm  = 4.5e5;  units.JXm  = 'g/d'; label.JXm  = 'daily plant intake at L_m'; bibkey.JXm  = 'Wiki';   
  temp.JXm = C2K(36.2);  units.temp.JXm = 'K'; label.temp.JXm = 'temperature';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (yr), weight^1/3, kg^1/3
 0.000	4.403
 3.194 	8.289
11.726	11.262
11.825	10.755
11.954	11.846
14.005	11.060
16.751	12.649
19.906	12.795
22.076	12.594
22.300	12.943
22.844	12.981
24.911	13.091
25.008	12.468
27.745	13.550
27.870	14.407
31.766	13.498
31.766	13.498
32.087	13.225
33.180	13.533
35.702	14.772
35.989	12.589
36.220	13.368
37.743	13.441
37.974	14.141
41.653	13.234
41.874	13.428
41.898	14.753
41.992	13.934
45.909	14.195
46.021	14.350
46.670	14.192
48.726	13.679
50.687	13.946
54.919	13.504];
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
data.tW_f(:,2) = 1e3 * data.tW_f(:,2).^3; % remove root transformation
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f   = C2K(36.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Laws1966';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), weight^1/3, kg^1/3
0.000	 4.325
8.572	11.194
8.889	10.648
10.645	11.616
10.766	12.278
13.406	13.984
13.488	12.542
13.816	12.658
19.714	14.237
21.780	14.231
21.872	13.334
21.892	14.464
21.991	13.880
22.761	14.384
27.790	16.004
27.892	15.614
32.691	16.534
33.512	13.883
36.051	16.018
42.272	17.401
47.810	17.111];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
data.tW_m(:,2) = 1e3 * data.tW_m(:,2).^3; % remove root transformation
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m   = C2K(36.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Laws1966';
comment.tW_m = 'Data for males';

% time-length
data.tL_f = [ ... % age (a), shoulder height (cm)
0.03	92.57
0.06	98.29
0.06	103.43
0.02	109.14
1.02	97.75
0.98	104.03
0.98	106.89
0.90	113.17
1.01	117.18
0.94	122.32
0.90	128.60
2.01	102.35
1.89	125.78
2.04	130.92
1.97	136.64
1.96	138.92
1.96	152.06
2.96	123.53
2.92	132.67
2.99	138.95
2.92	146.38
2.92	152.10
2.92	159.52
3.95	141.27
3.95	147.56
3.95	149.27
3.95	153.27
3.95	156.13
3.91	160.13
3.83	163.55
3.94	166.99
3.90	173.84
4.94	147.59
4.98	152.16
4.97	157.88
4.97	164.16
4.97	172.16
4.97	175.59
4.90	181.87
5.01	203.02
5.81	155.05
5.97	162.48
5.96	176.19
6.00	181.34
6.00	189.91
6.88	167.08
7.03	174.52
6.99	178.51
6.95	183.08
6.88	187.65
6.88	195.08
7.95	174.55
7.95	177.97
7.95	181.40
7.94	185.40
7.94	189.97
7.87	195.69
7.94	230.54
8.98	158.58
8.97	182.58
8.97	197.44
8.97	204.29
10.04	193.47
9.96	197.47
9.96	203.18
9.96	215.75
9.96	225.47
10.92	202.64
10.92	207.21
10.92	210.64
10.91	219.21
10.91	226.07
11.87	204.96
11.87	208.96
11.94	214.68
12.06	221.54
12.98	203.28
12.97	209.57
12.97	214.71
12.94	218.14
12.93	222.71
13.01	253.57
13.93	205.03
13.93	210.17
14.00	215.31
14.00	220.46
14.00	223.89
14.00	232.46
14.96	210.77
14.88	215.34
14.88	219.91
14.88	227.34
14.91	242.77
15.83	213.09
15.95	220.52
15.95	224.52
15.94	239.95
16.90	195.41
17.02	211.98
17.02	216.56
17.01	221.70
16.97	231.98
17.97	224.02
17.97	233.16
18.92	211.48
18.92	216.62
18.92	218.90
18.92	222.90
18.92	229.76
18.92	235.47
18.88	246.33
18.88	253.76
19.95	248.65
20.03	213.80
19.99	204.08
20.98	214.97
20.98	219.54
20.98	223.54
20.98	227.54
20.98	236.11
21.86	210.43
21.93	216.72
21.93	219.57
21.97	223.00
21.97	228.72
21.97	233.86
23.04	200.75
23.00	209.32
22.96	216.18
22.89	222.46
22.92	249.89
23.96	208.78
23.99	213.93
23.95	219.07
23.95	222.50
23.95	226.50
23.91	231.07
23.84	243.06
24.95	213.39
24.95	217.39
24.94	220.24
24.94	225.39
24.94	231.10
24.94	235.10
24.98	250.53
24.98	255.10
26.01	228.85
27.99	232.91
27.99	240.34
29.02	225.52
28.98	232.38
28.94	244.95
29.83	219.26
29.82	227.26
30.97	218.73
31.04	225.01
31.04	232.44
32.00	227.90
31.96	246.76
32.99	229.08
33.90	223.96
33.94	232.54]; 
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert a to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'shoulder height', 'female'};  
temp.tL_f   = C2K(36.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShraFerr2006';
comment.tL_f = 'Data for females from Amboseli National Park in Kenya';
%
data.tL_m = [ ... % age (a), shoulder height (m)
0.11	86.08
0.15	90.62
0.23	99.11
0.23	101.94
0.15	108.74
1.05	102.52
1.05	106.49
1.01	113.85
1.05	118.95
1.05	123.48
0.98	129.71
0.98	139.90
2.06	111.60
2.06	116.70
2.06	121.23
2.06	126.89
2.06	133.69
2.03	141.05
2.14	149.55
3.08	120.68
3.08	139.37
3.11	146.73
3.04	150.70
3.04	158.06
3.04	165.99
4.13	130.32
3.98	149.01
3.98	154.67
3.98	157.51
3.98	163.74
4.01	169.40
4.01	179.03
5.03	141.67
5.03	147.33
5.03	151.29
5.06	157.52
5.06	164.32
5.06	172.82
5.03	186.97
5.03	193.77
6.08	165.47
6.08	170.57
6.08	176.23
6.08	181.89
6.11	186.99
6.11	193.22
6.98	181.34
6.98	187.57
6.94	196.07
6.98	217.02
7.99	198.35
9.00	171.18
9.00	175.14
9.12	188.74
9.04	197.23
8.97	204.59
8.97	211.39
10.09	175.16
10.02	185.36
10.02	189.32
10.02	217.07
11.07	192.17
10.92	207.46
12.00	203.51
12.08	236.36
12.98	259.59
13.95	227.33
13.99	238.66
14.97	277.18
16.02	223.40
16.02	229.06
16.02	256.25
16.96	234.17
16.99	247.77
17.93	251.18
18.01	260.24
18.94	246.10
18.98	253.46
18.94	259.12
19.02	267.05
19.02	273.85
20.93	274.45
21.98	278.43
21.83	213.30
24.05	267.70
25.02	266.02
24.95	295.47
28.06	304.58
31.02	296.70]; 
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'shoulder height', 'male'};  
temp.tL_m   = C2K(36.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShraFerr2006';
comment.tL_m = 'Data for males from Amboseli National Park in Kenya';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1; weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_4: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3W9KV'; % Cat of Life
metaData.links.id_ITIS = '584939'; % ITIS
metaData.links.id_EoL = '289808'; % Ency of Life
metaData.links.id_Wiki = 'Loxodonta_africana'; % Wikipedia
metaData.links.id_ADW = 'Loxodonta_africana'; % ADW
metaData.links.id_Taxo = '69361'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11500009'; % MSW3
metaData.links.id_AnAge = 'Loxodonta_africana'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Loxodonta_africana}}';
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
bibkey = 'Laws1966'; type = 'Article'; bib = [ ... 
'author = {R. M. Laws}, ' ... 
'year = {1966}, ' ...
'title = {Age criteria for the {A}frican elephant, \emph{Loxodonta a. africana} {E}.}, ' ...
'journal = {Afr. Wildl.}, ' ...
'volume = {4}, ' ...
'pages = {1--37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShraFerr2006'; type = 'Article'; bib = [ ... 
'author = {A. M. Shrader and S. M. Ferreira and M. E. McElveen and P. C. Lee and C. J. Moss and R. J. van Aarde}, ' ... 
'year = {2006}, ' ...
'title = {Growth and age determination of {A}frican savanna elephants}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {270}, ' ...
'pages = {40-48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Loxodonta_africana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

