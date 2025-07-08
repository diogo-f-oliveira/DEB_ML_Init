function [data, auxData, metaData, txtData, weights] = mydata_Istigobius_decoratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Istigobius_decoratus'; 
metaData.species_en = 'Decorated goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 22];

%% set data
% zero-variate data

data.ab = 5;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 266;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'Krit2002';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 1.7;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00891*Lp^2.92, see F1';
data.Wwi = 16;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^2.92, see F1';

data.Ri  = 1.5e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL = [ ... %  time since birth (d), total length (cm)
38.925	1.495
41.409	1.822
42.418	1.641
43.432	1.351
45.409	1.823
55.407	1.861
59.900	2.007
63.894	2.117
66.872	2.552
69.394	2.118
72.367	2.662
75.318	3.641
75.354	2.917
76.376	2.482
77.820	3.606
77.841	3.171
77.867	2.664
79.350	2.990
82.331	3.389
83.370	2.593
86.358	2.847
87.840	3.210
88.820	3.608
93.318	3.646
93.329	3.428
94.348	3.030
97.821	3.574
99.839	3.213
104.845	3.105
105.803	3.939
109.310	3.795
120.817	3.652
121.792	4.160
123.808	3.834
126.325	3.509
127.779	4.415
127.799	4.016
131.745	5.104
136.803	3.946
138.759	4.816
143.756	4.890
145.274	4.528
147.158	6.847
148.255	4.891
149.275	4.493
149.716	5.688
163.224	5.510
177.194	6.130
186.090	8.197
188.740	5.191
191.635	7.293
194.652	6.967
204.133	7.332
215.131	7.371
264.082	8.361];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Krit2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00891*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3QDB7'; % Cat of Life
metaData.links.id_ITIS = '637525'; % ITIS
metaData.links.id_EoL = '46575581'; % Ency of Life
metaData.links.id_Wiki = 'Istigobius_decoratus'; % Wikipedia
metaData.links.id_ADW = 'Istigobius_decoratus'; % ADW
metaData.links.id_Taxo = '177599'; % Taxonomicon
metaData.links.id_WoRMS = '219504'; % WoRMS
metaData.links.id_fishbase = 'Istigobius_decoratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Istigobius_decoratus}}';
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
bibkey = 'Krit2002'; type = 'Article'; bib = [ ... 
'doi = {10.1023/A:1014278319097}, ' ...
'author = {Kritzer, J.P.}, ' ... 
'year = {2002}, ' ...
'title = {Stock Structure, Mortality and Growth of The Decorated Goby, \emph{Istigobius decoratus} ({G}obiidae), at {L}izard {I}sland, {G}reat {B}arrier {R}eef}, ' ...
'journal = {Environmental Biology of Fishes ,  (). https://doi-org.vu-nl.idm.oclc.org/}, ' ...
'volume = {63}, ' ...
'pages = {223–237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Istigobius-decoratus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
