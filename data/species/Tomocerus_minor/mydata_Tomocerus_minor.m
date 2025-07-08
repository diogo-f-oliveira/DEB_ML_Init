function [data, auxData, metaData, txtData, weights] = mydata_Tomocerus_minor

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Entognatha'; 
metaData.order      = 'Entomobryomorpha'; 
metaData.family     = 'Tomoceridae';
metaData.species    = 'Tomocerus_minor'; 
metaData.species_en = 'Springtail'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biF'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 29]; 

%% set data
% zero-variate data

data.tj = 30;       units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'JoosVelt1970';   
  temp.tj = C2K(20); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'from inflection-point in tL data';
data.tp = 50;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JoosVelt1970';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 200;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'JoosVelt1970';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.069;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'JoosVelt1970';
data.Lp  = 0.28;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'JoosVelt1970';
data.Li  = 0.36;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'JoosVelt1970';

data.Wwb = 7.46e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on (Lb/Li)^3*Wwi';
data.Wwp = 4.99e-4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on (Lp/Li)^3*Wwi';
data.Wwi = 1.06e-3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Folsomia candida: (Li/0.238)^3 * 305 mug';

data.Ri  = .4*15;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on reprod investment of Folsomia candida: 19.5 * 1.695/ 305 * Wwi/ Wwb';
 
% uni-variate data
% time-length 
data.tL = [... time since birth (d), length (cm) 
0.183	0.069
3.234	0.075
5.969	0.082
9.158	0.087
11.665	0.093
14.395	0.093
15.313	0.105
16.682	0.112
17.824	0.118
20.323	0.112
20.791	0.132
22.155	0.130
24.894	0.143
27.177	0.155
28.092	0.163
28.554	0.174
28.997	0.155
30.830	0.174
32.200	0.182
33.117	0.192
33.569	0.187
34.028	0.193
34.939	0.194
35.633	0.212
35.853	0.200
36.299	0.187
37.229	0.218
37.449	0.207
37.680	0.212
39.731	0.217
40.191	0.224
40.878	0.231
41.784	0.224
42.921	0.223
44.527	0.243
45.201	0.230
45.221	0.262
45.892	0.243
47.489	0.249
48.176	0.256
49.305	0.244
49.544	0.261
51.129	0.249
52.044	0.256
52.722	0.249
53.181	0.256
54.087	0.249
54.322	0.261
54.554	0.268
55.448	0.243
56.590	0.249
56.829	0.267
58.191	0.262
59.101	0.262
59.109	0.274
59.113	0.281
60.011	0.262
61.839	0.274
62.302	0.286
62.525	0.278
64.345	0.278
64.566	0.269
66.171	0.287
67.089	0.300
67.531	0.280
69.364	0.300
69.815	0.293
71.863	0.293
72.997	0.288
75.280	0.299
75.967	0.306
77.324	0.293
79.830	0.299
80.517	0.306
83.017	0.300
89.171	0.317
90.077	0.310
93.486	0.305
100.105	0.336
100.324	0.324
103.059	0.330
112.404	0.355
112.843	0.330
113.757	0.337
115.126	0.343
125.604	0.361
126.283	0.355
128.095	0.342
138.119	0.361];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoosVelt1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7CGXP'; % Cat of Life
metaData.links.id_ITIS = '99889'; % ITIS
metaData.links.id_EoL = '1175608'; % Ency of Life
metaData.links.id_Wiki = 'Tomocerus_minor'; % Wikipedia
metaData.links.id_ADW = 'Tomocerus_minor'; % ADW
metaData.links.id_Taxo = '102816'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_collembola = 'tomoceri.htm#Tomocerus'; % collembola

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tomocerus_minor}}';
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
bibkey = 'JoosVelt1970'; type = 'Article'; bib = [ ... 
'author = {Joosse, E. and Veltkamp, E.}, ' ... 
'year = {1970}, ' ...
'title = {Some aspects of growth, moulting and reproduction in five species of surface dwelling collembola}, ' ...
'journal = {Neth. J. Zool.}, ' ...
'volume = {20}, ' ...
'pages = {315--328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
