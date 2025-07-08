function [data, auxData, metaData, txtData, weights] = mydata_Isotoma_viridis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Entognatha'; 
metaData.order      = 'Entomobryomorpha'; 
metaData.family     = 'Isotomidae';
metaData.species    = 'Isotoma_viridis'; 
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

data.tj = 25;       units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'JoosVelt1970';   
  temp.tj = C2K(20); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'from inflection-point in tL data';
data.tp = 40;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JoosVelt1970';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 180;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'JoosVelt1970';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.063;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'JoosVelt1970';
data.Lp  = 0.175;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'JoosVelt1970';
data.Li  = 0.310;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'JoosVelt1970';

data.Wwb = 5.66e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on (Lb/Li)^3*Wwi';
data.Wwp = 1.21e-4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on (Lp/Li)^3*Wwi';
data.Wwi = 6.74e-4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Folsomia candida: (Li/0.238)^3 * 305 mug';

data.Ri  = 12.9;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on reprod investment of Folsomia candida: 19.5 * 1.695/ 305 * Wwi/ Wwb';
 
% uni-variate data
% time-length 
data.tL = [... time since birth (d), length (cm) 
0.041	0.063
5.037	0.071
6.629	0.076
10.036	0.083
11.628	0.088
12.757	0.080
15.719	0.100
17.761	0.100
17.765	0.107
20.038	0.112
20.722	0.118
20.938	0.101
21.407	0.125
22.995	0.125
24.360	0.131
25.264	0.125
25.273	0.138
25.277	0.144
26.184	0.144
28.441	0.126
29.158	0.181
30.045	0.150
31.637	0.157
32.772	0.157
34.149	0.181
34.356	0.151
35.494	0.157
35.502	0.169
36.652	0.193
37.317	0.169
37.545	0.171
38.221	0.163
38.682	0.175
40.047	0.181
40.278	0.186
41.190	0.194
41.870	0.193
42.774	0.187
44.820	0.193
45.039	0.181
45.497	0.188
46.181	0.193
46.401	0.182
48.680	0.198
49.819	0.205
50.496	0.199
50.953	0.205
51.176	0.199
52.541	0.205
53.907	0.212
54.126	0.199
55.496	0.213
59.576	0.208
59.582	0.217
62.533	0.219
64.575	0.219
64.797	0.212
65.490	0.231
72.305	0.245
72.742	0.218
74.111	0.231
75.250	0.237
76.834	0.231
79.791	0.243
80.922	0.238
82.275	0.224
84.557	0.245
87.737	0.251
89.559	0.262
90.913	0.250
94.089	0.250
94.547	0.257
97.038	0.250
97.269	0.256
97.728	0.264
99.539	0.258
103.399	0.263
104.087	0.275
104.545	0.281
112.247	0.262
122.006	0.268
128.141	0.282
135.409	0.295
139.035	0.288];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoosVelt1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 10 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '3QCL6'; % Cat of Life
metaData.links.id_ITIS = '99374'; % ITIS
metaData.links.id_EoL = '203778'; % Ency of Life
metaData.links.id_Wiki = 'Isotoma_viridis'; % Wikipedia
metaData.links.id_ADW = 'Isotoma_viridis'; % ADW
metaData.links.id_Taxo = '17266'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_collembola = 'isotinae.htm#Isotoma'; % collembola

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Isotoma_viridis}}';
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
