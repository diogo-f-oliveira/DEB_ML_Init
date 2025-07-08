function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_thompsoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_thompsoni'; 
metaData.species_en = 'Goldeye rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 29];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(17.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Sebastes_inermis';

data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 30;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 66.9;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00912*Lp^3.21, see F1';
data.Wwi = 503;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00912*Li^3.21, see F1';

data.Ri  = 49e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_inermis: 62e3*503/640';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm) 
11.916	0.614
17.885	0.725
26.676	0.984
26.994	0.909
28.564	0.965
29.493	1.245
34.531	1.113
35.468	1.225
37.347	1.374
37.358	1.168
39.519	1.934
39.549	1.373
41.445	1.186
43.930	1.784
44.885	1.559
45.195	1.634
45.812	1.877
46.748	2.007
47.384	1.876
48.348	1.483
48.947	2.063
48.963	1.745
49.588	1.819
51.154	1.950
51.465	2.006
51.770	2.193
51.789	1.838
52.724	1.987
53.017	2.398
53.658	2.174
53.963	2.342
54.295	2.005
55.561	1.855
56.164	2.360
56.181	2.023
56.805	2.117
57.106	2.378
58.070	1.986
58.073	1.930
58.692	2.116
60.264	2.135
60.567	2.340
60.880	2.377
61.512	2.321
62.753	2.639
63.990	3.031
64.660	2.246
64.924	3.218
64.964	2.451
67.136	3.011
67.141	2.918
67.151	2.731
67.166	2.432
68.404	2.805
69.324	3.254
69.330	3.142
69.652	3.011
70.574	3.403
72.465	3.328
72.471	3.216
72.773	3.459
72.811	2.730
74.066	2.785
74.347	3.421
75.333	2.617
75.939	3.047
76.545	3.476
76.853	3.607
77.513	3.009
77.798	3.569
77.836	2.859
77.848	2.616
78.107	3.682
79.085	3.027
79.995	3.662
79.999	3.588
80.040	2.803
80.618	3.774
81.270	3.326
81.861	4.054
82.811	3.923
83.473	3.306
84.080	3.717
84.746	3.007
85.016	3.848
85.033	3.530
85.045	3.306
85.638	3.997
87.196	4.259
87.201	4.165
87.862	3.548
87.870	3.399
88.847	2.763
90.037	4.052
90.381	3.492
90.996	3.753
91.933	3.884
92.907	3.304
94.134	3.883
95.694	4.126
96.059	3.154
96.332	3.939
97.285	3.770
97.580	4.144
97.587	3.994
98.539	3.845
99.814	3.508
100.110	3.863
100.705	4.517
102.284	4.386
102.287	4.330
102.581	4.722
103.534	4.535
103.867	4.180
105.738	4.478
105.751	4.235
106.353	4.740
107.294	4.796
107.911	5.020
107.962	4.048
110.755	4.758
112.014	4.739
112.972	4.458
115.476	4.682
116.093	4.906
116.715	5.036
117.665	4.924
118.005	4.419
119.228	5.092
120.493	4.961
122.100	4.287
122.389	4.773
123.013	4.867
124.897	4.922
126.134	5.333
127.083	5.221
127.403	5.109
131.483	5.276
137.457	5.274
139.968	5.367];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(16.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KokiOmor1998'; 
comment.tL = 'Data for juveniles in drifting weed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Data Wwp and Wwi are at odds with LW data and ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00912*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7QF'; % Cat of Life
metaData.links.id_ITIS = '644602'; % ITIS
metaData.links.id_EoL = '46568203'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_thompsoni'; % ADW
metaData.links.id_Taxo = '187342'; % Taxonomicon
metaData.links.id_WoRMS = '274860'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-thompsoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
bibkey = 'KokiOmor1998'; type = 'article'; bib = [ ... 
'doi = {10.1007/s002270050423}, ' ...
'author = {Kokita, T. and Omori, M.},' ...
'year = {1998}, ' ...
'title = {Early life history traits of the gold-eye rockfish, \emph{Sebastes thompsoni}, in relation to successful utilization of drifting seaweed}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {132(4)}, ' ...
'page = {579–589}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-thompsoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
