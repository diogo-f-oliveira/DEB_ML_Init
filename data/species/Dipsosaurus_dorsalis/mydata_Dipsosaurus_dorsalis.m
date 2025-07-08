function [data, auxData, metaData, txtData, weights] = mydata_Dipsosaurus_dorsalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Iguanidae';
metaData.species    = 'Dipsosaurus_dorsalis'; 
metaData.species_en = 'Common Desert Iguana';  

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'T-ab'; 'L-Ww'; 'T-JO'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Urtzi Enriquez-Urzelai', 'Michael Kearney'};    
metaData.date_subm = [2021 10 29];              
metaData.email    = {'urtzi.enriquez@gmail.com'};            
metaData.address  = {'Czech Academy of Sciences'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 10 30];

%% set data
% zero-variate data

data.ab = 44.6;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Muth1980';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '44 to 86 d';
data.tp = 33*30;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Howl1988';
  temp.tp = C2K(28.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '33 to 45 months';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'Krek1984';   
  temp.am = C2K(28.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 4.74;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'Muth1977';  
data.Lp  = 11.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'Howl1988';  
data.Lpm  = 12.5;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'Howl1988';  
data.Li  = 13.3;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'Howl1988';  
data.Lim  = 14.3;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'Howl1988';  

data.Wwb = 4.62;   units.Wwb = 'g';  label.Wwb = 'wet weight of hatchlings'; bibkey.Wwb = 'Muth1977';
  comment.Wwb = 'Body mass of hatchlings';
data.Wwi = 82;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Minn1971';
  comment.Wwi = 'ultimate body mass';
data.Wwim = 91;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Minn1971';
  comment.Wwim = 'ultimate body mass of males';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Howl1988';   
  temp.Ri = C2K(28.1);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year; ranging from 2 to 8';

% univariate data
  
% length-weight
data.LW_f = [ ... % SVL (mm), wet weight (g) 
97.03   26.25
96.03   30.78
98.05   33.90
99.09   29.72
99.84   28.42
100.15  28.33
100.01  32.42
101.97  30.06
102.00  28.06
102.16  29.46
103.02  37.02
101.97  38.41
102.03  42.50
103.06  44.58
104.08  36.32
104.99  28.14
106.01  45.01
106.03  48.05
105.05  49.54
109.08  44.83
110.06  45.52
110.03  39.09
111.05  45.96
110.04  49.09
109.05  55.18
108.08  59.01
108.06  62.05
111.07  60.13
112.03  62.13
112.05  50.91
113.98  41.08
116.15  43.77
115.10  47.25
116.09  48.29
117.15  48.46
117.17  53.42
114.08  54.47
115.10  55.51
114.06  58.82
114.04  63.17
114.05  64.90
115.13  60.64
116.11  60.29
116.08  62.90
116.10  66.55
118.10  66.46
118.10  56.98
118.13  55.42
120.11  50.02
121.10  60.71
121.12  64.97
120.11  74.98
122.11  74.97
123.14  76.71
125.09  79.40
124.03  64.36];   
data.LW_f(:,1) = data.LW_f(:,1) / 10; % convert mm to cm
units.LW_f = {'cm', 'g'};     label.LW_f = {'SVL', 'wet weight'};  
bibkey.LW_f = 'Minn1971';
comment.LW_f = 'Data for females'; 
% males
data.LW_m = [ ... % SVL (mm), wet weight (g) 
97.03 24.69
97.03 25.21
97.03 25.73
98.03 29.20
98.09 33.55
101.97 29.37
104.06 32.76
104.07 34.84
104.08 35.62
105.02 35.71
106.01 37.10
103.02 36.67
101.04 41.02
104.11 43.80
104.98 42.49
106.07 40.40
107.05 41.18
107.04 46.40
108.06 46.83
109.09 47.44
109.10 50.83
110.10 53.00
111.08 53.00
111.05 46.65
112.01 41.61
112.09 58.21
114.06 59.77
118.13 55.94
120.08 51.85
118.16 61.85
117.18 62.64
119.08 63.94
120.10 65.50
121.12 64.63
123.05 64.19
125.05 62.79
124.99 67.31
124.05 67.40
124.05 68.01
120.08 68.72
122.13 69.93
123.11 70.10
123.13 72.79
123.13 73.58
125.05 72.27
125.04 69.14
126.08 72.27
127.05 70.09
127.09 71.57
128.08 71.22
129.04 67.56
130.04 71.30
129.98 74.43
129.98 74.95
129.08 74.87
130.03 77.56
131.14 79.04
133.04 73.38
133.06 76.77
134.17 79.38
136.01 86.15];   
data.LW_m(:,1) = data.LW_m(:,1) / 10; % convert mm to cm
units.LW_m = {'cm', 'g'};     label.LW_m = {'SVL', 'wet weight'};  
bibkey.LW_m = 'Minn1971';
comment.LW_m = 'Data for males'; 
% juveniles
data.LW_j = [ ... % SVL (mm), wet weight (g) 
50.04 3.78
95.17 30.55
83.14 21.28
51.04 4.00
51.01 4.34
51.05 4.53
52.03 5.05
54.04 5.47
53.05 4.20
53.09 3.88
55.02 4.18
55.03 4.82
57.05 5.66
57.99 3.62
61.06 5.48
64.05 7.66
67.10 7.88
69.08 8.47
70.12 9.10
71.09 9.61
71.09 9.84
73.17 9.88
75.15 10.62
75.15 11.61
74.15 12.55
77.21 14.55
78.21 14.55
79.14 13.50
79.14 13.23
79.16 10.14
80.12 10.11
80.14 13.83
79.18 15.43
80.16 17.45
81.16 18.24
81.16 16.08
82.19 14.13
83.12 16.20
83.13 17.58
84.14 19.41
85.14 17.59
85.10 18.51
85.14 20.03
86.19 21.67
86.19 21.37
86.15 20.87
86.18 18.77
86.18 17.72
86.17 15.25
87.19 19.30
88.19 19.50
88.19 19.24
89.20 20.26
89.16 21.32
89.16 22.36
90.16 20.40
91.17 22.22
91.17 22.45
90.21 24.61
92.21 22.08
93.22 23.56
93.22 25.49
94.23 25.93
94.23 25.15
94.19 24.30
94.26 23.33
95.19 22.86
95.16 26.30
95.20 27.68
95.20 28.25];   
data.LW_j(:,1) = data.LW_j(:,1) / 10; % convert mm to cm
units.LW_j = {'cm', 'g'};     label.LW_j = {'SVL', 'wet weight'};  
bibkey.LW_j = 'Minn1971';
comment.LW_j = 'Data for juveniles'; 

% temperature-age at birth
data.Tab = [ ... temperature C, age at birth (incubation duration)
27.9598 82.5503
30.0161 66.3112
32.0269 56.1354
34.0706 49.0302
35.094 46.4224
36.1188 44.6021
38.1459 44.1901
40.0375 45.8264];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'incubation duration'};  
bibkey.Tab = 'Muth1980';

% temperature-Oxygen consumption
data.TO = [ ... % Body temperature (C), O2 consuption (cc/g/h = ml/g/h)
19.523 0.020
19.286 0.032
19.044 0.033
20.064 0.036
19.484 0.042
24.436 0.045
25.553 0.044
24.149 0.062
25.024 0.070
24.297 0.074
25.901 0.086
26.969 0.086
26.871 0.082
27.453 0.081
27.208 0.068
28.420 0.058
28.953 0.053
30.117 0.047
30.070 0.057
28.472 0.076
28.474 0.087
28.232 0.093
28.135 0.097
28.572 0.097
28.379 0.107
30.025 0.073
30.462 0.073
31.484 0.093
30.076 0.091
29.786 0.096
30.077 0.100
29.933 0.109
29.934 0.117
30.226 0.128
30.421 0.133
30.955 0.137
31.342 0.125
32.120 0.133
32.411 0.137
33.820 0.143
34.014 0.149
33.044 0.160
32.997 0.172
34.840 0.154
35.229 0.161
34.792 0.165
35.181 0.171
35.667 0.174
35.859 0.156
36.830 0.154
37.463 0.171
37.996 0.170
37.996 0.158
39.015 0.158
39.307 0.169
39.211 0.177
39.938 0.169
40.909 0.162
40.958 0.174
37.077 0.207
36.932 0.226
37.807 0.239
38.242 0.219
38.920 0.192
39.358 0.198
39.358 0.212
39.747 0.219
40.184 0.222
39.942 0.233
40.185 0.244
41.980 0.221
41.933 0.242
42.516 0.260
42.809 0.285
43.440 0.287
43.390 0.255
43.389 0.242
44.362 0.284
44.460 0.301
44.364 0.334
42.229 0.351
42.666 0.354
43.151 0.354
43.978 0.414
44.609 0.402
44.902 0.459
44.903 0.487];
units.TO = {'C','mlO2/gwet/h'}; label.TO = {'temperature','O_2 consumption rate'};  
bibkey.TO = 'DawsBart1958';

%% set weights for all real data
weights = setweights(data, []);
weights.Tab = 2 * weights.Tab;
weights.ab = 2 * weights.ab;
weights.tp = weights.tp * 0.5; % limit importance of tp because only have age at first eggs laid
weights.Lp = weights.Lp * 0.5; % limit importance of Lp because only have age at first eggs laid

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m','LW_j'}; subtitle1 = {'Data for females, males and juveniles (Minn1971)'};
set2 = {'Tab'}; subtitle2 = {'Developmental time at different Ts (Muth1980)'};
set3 = {'TO'}; subtitle3 = {'Oxygen consumption at different Ts (DawsBart1958)'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3}; 

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '36QKD'; % Cat of Life
metaData.links.id_ITIS = '173921'; % ITIS
metaData.links.id_EoL = '795002'; % Ency of Life
metaData.links.id_Wiki = 'Dipsosaurus_dorsalis'; % Wikipedia
metaData.links.id_ADW = 'Dipsosaurus_dorsalis'; % ADW
metaData.links.id_Taxo = '49085'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Dipsosaurus&species=dorsalis'; % ReptileDB
metaData.links.id_AnAge = 'Dipsosaurus_dorsalis'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Muth1980'; type = 'Article'; bib = [ ... 
    'author = {Muth, A.}, ' ...
    'title = {Physiological ecology of desert iguana (\emph{Dipsosaurus dorsalis}) eggs: temperature and water relationships}, ' ...
    'journal = {Ecology}, ' ...
    'volume = {61}, ' ...
    'pages = {1335-1343}, ' ...
    'year = {1980}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Muth1977'; type = 'Article'; bib = [ ... 
    'author = {Muth, A.}, ' ...
    'title = {Eggs and hatchlings of captive \emph{Dipsosaurus dorsalis}}, ' ...
    'journal = {Copeia}, ' ...
    'volume = {-}, ' ...
    'pages = {189-190}, ' ...
    'year = {1977}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Howl1988'; type = 'Article'; bib = [ ... 
    'author = {Howland, J. M.}, ' ...
    'title = {Natural history of the desert iguana, \emph{Dipsosaurus dorsalis}}, ' ...
    'journal = {Proceedings of the Conference on California Herpetology. Southwestern Herpetologists Society Special Publication}, ' ...
    'volume = {4}, ' ...
    'pages = {51-59}, ' ...
    'year = {1988}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Krek1984'; type = 'Article'; bib = [ ... 
    'author = {Krekorian, C. O.}, ' ...
    'title = {Life history of the desert iguana, \emph{Dipsosaurus dorsalis}}, ' ...
    'journal = {Herpetologica}, ' ...
    'volume = {40}, ' ...
    'pages = {415-424}, ' ...
    'year = {1984}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Minn1971'; type = 'Article'; bib = [ ... 
    'author = {Minnich, J. E.}, ' ...
    'title = {Seasonal variation in weight-length relationships and fat body size in the desert iguana, \emph{Dipsosaurus dorsalis}}, ' ...
    'journal = {Copeia}, ' ...
    'volume = {1971}, ' ...
    'pages = {359-362}, ' ...
    'year = {1971}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsBart1958'; type = 'Article'; bib = [ ... 
    'author = {Dawson, W. R. and Bartholomew, G. A.}, ' ...
    'title = {Metabolic and cardiac responses to temperature in the lizard \emph{Dipsosaurus dorsalis}}, ' ...
    'journal = {Physiological Zoology}, ' ...
    'volume = {31}, ' ...
    'pages = {100-111}, ' ...
    'year = {1958}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
