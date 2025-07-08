function [data, auxData, metaData, txtData, weights] = mydata_Scomber_japonicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomber_japonicus'; 
metaData.species_en = 'Chub mackerel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.7); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 09];

%% set data
% zero-variate data

data.ab = 2;        units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'fishbase';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(20.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 26.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 64;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.05 mm: pi/6*0.105^3';
data.Wwp = 197;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 2900;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 1.86e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(20.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% t-L data
data.tL = [ ... % times ince birth (d), fork length (mm)
24.520	21.861
25.725	28.247
26.326	32.503
26.342	19.206
28.149	28.252
28.158	20.805
29.972	24.001
31.764	45.813
31.772	38.898
31.780	32.515
32.095	22.409
34.188	45.818
34.200	36.244
34.206	31.456
35.104	39.969
35.115	31.458
37.539	31.463
38.137	38.380
38.140	35.188
38.738	42.104
39.053	32.531
39.332	52.212
40.251	44.235
41.153	50.088
41.154	49.024
41.176	30.939
42.064	47.963
43.285	41.050
43.863	64.456
46.304	50.631
51.153	49.578
51.409	88.940
54.752	80.436
58.390	79.380
58.407	65.550
59.595	85.234
62.003	98.537
62.931	82.581
64.120	101.733
64.444	84.712
65.645	93.757
66.877	77.803
67.160	93.761
67.436	116.633
68.375	91.635
68.380	87.912
69.575	101.744
69.862	115.043
69.888	93.766
69.899	84.192
70.209	78.342
70.795	95.364
71.372	119.301
72.287	113.984
74.715	111.330
75.302	126.757
75.584	144.310
76.514	126.759
76.529	114.525
76.538	107.078
77.168	87.399
77.412	135.804
78.665	102.296
78.668	99.636
78.672	96.977
78.677	92.189
78.937	128.360
80.463	118.789
83.182	125.710
87.418	131.570
88.059	102.316
89.214	149.659
89.225	140.084
89.843	130.511
90.167	113.490
94.706	118.819
106.739	191.185
107.962	182.145
109.195	165.127
113.116	180.560
113.122	175.241
116.505	134.823
117.040	193.335
117.653	186.953
120.049	210.362
120.386	182.704
121.274	199.727
121.889	192.281
124.608	199.734
124.924	189.096
125.826	194.949
126.111	209.312
127.932	207.188
127.955	188.571
127.959	184.847
128.240	202.933
128.851	199.211
129.179	178.467
131.900	183.260
132.194	191.239
132.791	198.687
133.076	213.050
134.600	206.138
135.781	231.673
137.037	195.505
138.864	188.062
140.638	224.768
146.410	212.546
150.644	220.002
152.473	210.431
153.989	210.435
154.887	219.479
155.504	210.438
157.020	209.909
157.020	209.909
157.027	203.526
157.626	209.910
160.635	226.938
160.668	200.342
163.664	228.008
165.192	217.905
170.945	221.641
172.442	236.538
173.360	229.093
173.374	217.391
177.019	210.484
181.842	231.239
187.612	221.145
187.903	230.720
189.704	245.617
192.745	236.049
192.755	228.070];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TakaYone2005';
comment.tL = 'Data of 2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.ab = 0.2 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 0.00776*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79XK5'; % Cat of Life
metaData.links.id_ITIS = '172412'; % ITIS
metaData.links.id_EoL = '46577306'; % Ency of Life
metaData.links.id_Wiki = 'Scomber_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Scomber_japonicus'; % ADW
metaData.links.id_Taxo = '187060'; % Taxonomicon
metaData.links.id_WoRMS = '127022'; % WoRMS
metaData.links.id_fishbase = 'Scomber-japonicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomber_japonicus}}';
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
bibkey = 'TakaYone2005'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2005.00868.x}, ' ...
'author = {Masanori Takahashi and Michio Yoneda and Hajime Kitano and Atsushi Kawabata and Mami Saito}, ' ... 
'year = {2005}, ' ...
'title = {Growth of juvenile chub mackerel \emph{Scomber japonicus} in the western {N}orth {P}acific {O}cean: with application and validation of otolith daily increment formation}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {67}, ' ...
'pages = {1619-1630}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Scomber-japonicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
