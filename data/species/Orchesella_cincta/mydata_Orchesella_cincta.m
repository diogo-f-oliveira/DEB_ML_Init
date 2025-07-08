function [data, auxData, metaData, txtData, weights] = mydata_Orchesella_cincta

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Entognatha'; 
metaData.order      = 'Entomobryomorpha'; 
metaData.family     = 'Entomobryidae';
metaData.species    = 'Orchesella_cincta'; 
metaData.species_en = 'Hairy-back Girdled Springtail'; 
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

data.tj = 10;       units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'JoosVelt1970';   
  temp.tj = C2K(20); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'from inflection-point in tL data';
data.tp = 61;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JoosVelt1970';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 170;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'JoosVelt1970';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.062;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'JoosVelt1970';
data.Lp  = 0.23;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'JoosVelt1970';
data.Li  = 0.380;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'JoosVelt1970';

data.Wwb = 5.21e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on (Lb/Li)^3*Wwi';
data.Wwp = 2.66e-4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on (Lp/Li)^3*Wwi';
data.Wwi = 1.2e-3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Folsomia candida: (Li/0.238)^3 * 305 mug';

data.Ri  = .3*25;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on reprod investment of Folsomia candida: 19.5 * 1.695/ 305 * Wwi/ Wwb';
 
% uni-variate data
% time-length 
data.tL = [... time since birth (d), length (cm) 
0.000	0.062
9.813	0.080
18.236	0.118
20.513	0.130
25.297	0.156
31.888	0.170
38.251	0.181
42.799	0.193
49.171	0.218
51.437	0.212
53.719	0.231
55.753	0.218
59.162	0.223
60.529	0.231
61.424	0.211
62.575	0.237
65.299	0.237
66.442	0.249
68.034	0.255
70.070	0.243
70.986	0.255
72.109	0.237
72.570	0.248
75.521	0.248
75.526	0.256
76.215	0.268
80.522	0.260
80.527	0.268
81.662	0.268
84.391	0.276
85.508	0.248
86.202	0.268
89.140	0.248
90.300	0.287
91.876	0.268
95.529	0.299
97.104	0.279
97.790	0.286
100.517	0.292
102.548	0.273
105.965	0.292
106.416	0.287
106.865	0.279
108.021	0.311
108.239	0.297
109.151	0.304
110.959	0.292
111.855	0.274
117.095	0.304
118.012	0.317
119.361	0.297
120.051	0.312
122.320	0.310
122.787	0.330
123.679	0.305
125.725	0.310
127.992	0.306
128.226	0.317
132.758	0.306
137.075	0.311
138.210	0.311
141.858	0.337
147.302	0.331
148.902	0.349
150.252	0.330
150.471	0.317
159.773	0.311
169.099	0.341];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JoosVelt1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 100*weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6T5DQ'; % Cat of Life
metaData.links.id_ITIS = '99745'; % ITIS
metaData.links.id_EoL = '346716'; % Ency of Life
metaData.links.id_Wiki = 'Orchesella_cincta'; % Wikipedia
metaData.links.id_ADW = 'Orchesella_cincta'; % ADW
metaData.links.id_Taxo = '17272'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_collembola = 'orchinae.htm#Orchesella'; % collembola

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orchesella_cincta}}';
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
