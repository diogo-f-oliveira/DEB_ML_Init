function [data, auxData, metaData, txtData, weights] = mydata_Entomobrya_nivalis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Entognatha'; 
metaData.order      = 'Entomobryomorpha'; 
metaData.family     = 'Entomobryidae';
metaData.species    = 'Entomobrya_nivalis'; 
metaData.species_en = 'Cosmopolitan springtail'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TA', 'TP'};
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

data.tj = 40;       units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'JoosVelt1970';   
  temp.tj = C2K(20); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = 'from inflection-point in tL data';
data.tp = 59;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'JoosVelt1970';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 150;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'JoosVelt1970';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.044; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'JoosVelt1970';
data.Lp  = 0.111; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'JoosVelt1970';
data.Li  = 0.180;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'JoosVelt1970';

data.Wwb = 1.93e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on (Lb/Li)^3*Wwi';
data.Wwp = 3.10e-5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on (Lp/Li)^3*Wwi';
data.Wwi = 1.32e-4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Folsomia candida: (Li/0.238)^3 * 305 mug';

data.Ri  = 7.4;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on reprod investment of Folsomia candida: 19.5 * 1.695/ 305 * Wwi/ Wwb';
 
% uni-variate data
% time-length 
data.tL = [... time since birth (d), length (cm) 
0.555	0.044
17.429	0.069
18.786	0.066
22.209	0.072
26.993	0.077
27.654	0.068
32.000	0.080
32.446	0.076
36.100	0.084
37.464	0.084
42.255	0.092
46.345	0.092
51.563	0.088
52.501	0.100
53.872	0.104
55.700	0.108
56.354	0.096
60.272	0.120
60.707	0.111
61.174	0.117
64.364	0.120
72.101	0.124
76.200	0.128
78.028	0.132
80.293	0.129
81.210	0.132
82.128	0.136
85.319	0.140
90.754	0.132
92.590	0.140
93.282	0.144
94.418	0.144
94.618	0.132
96.245	0.148
97.810	0.136
99.646	0.144
104.202	0.149
105.545	0.140
110.355	0.156
113.066	0.149
117.373	0.144
118.527	0.152
122.174	0.157
132.836	0.148
136.500	0.160
139.910	0.160
147.664	0.172
151.727	0.160
155.161	0.171
156.045	0.160
157.216	0.175
170.855	0.176
173.573	0.172];
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
metaData.links.id_CoL = '6FF5L'; % Cat of Life
metaData.links.id_ITIS = '99694'; % ITIS
metaData.links.id_EoL = '1022843'; % Ency of Life
metaData.links.id_Wiki = 'Entomobrya_nivalis'; % Wikipedia
metaData.links.id_ADW = 'Entomobrya_nivalis'; % ADW
metaData.links.id_Taxo = '17270'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_collembola = 'entoinae.htm#Entomobrya'; % collembola

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Entomobrya_nivalis}}';
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
