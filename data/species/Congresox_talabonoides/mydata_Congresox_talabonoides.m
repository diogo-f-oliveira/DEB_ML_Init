function [data, auxData, metaData, txtData, weights] = mydata_Congresox_talabonoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Muraenesocidae';
metaData.species    = 'Congresox_talabonoides'; 
metaData.species_en = 'Indian pike conger'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.8); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 30];

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(6.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(6.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 123.5; units.Lp  = 'cm';  label.Lp  = 'total length puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 250;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.7-2.2 mm: pi/6*0.2^3';
data.Wwp = 1775;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00132*Lp^2.93, see F1';
data.Wwi = 14e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00132*Li^2.93, see F1';
 
data.Ri  = 920000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(6.8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on Nezumia_aequalis from the Atlantic';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
351.026	51.590
365+45.928	54.849
365+105.411	57.506
365+134.090	60.189
365+289.349	64.874
365+321.417	65.148
365+350.953	65.424
730+15.470	69.310
730+46.688	70.788
730+74.526	72.870
730+135.718	71.617
730+195.195	75.477
730+226.425	74.550
730+288.010	78.709
730+321.326	82.291
730+352.144	79.559
1095+13.716	81.943
1095+48.314	82.516
1095+75.318	82.794
1095+105.693	83.972
1095+132.271	85.153
1095+198.512	86.603
1095+227.193	88.985
1095+321.298	87.704
1460+14.501	93.070
1460+47.828	94.546
1460+73.990	94.525
1460+197.181	98.935
1460+227.984	98.909
1460+259.627	99.785
1460+319.532	102.443
1825+14.023	103.597
1825+47.784	102.967
1825+74.785	103.847
1825+106.007	104.423
1825+135.965	104.699
1825+197.143	106.153
1825+228.367	106.428
1825+259.167	107.004
1825+322.456	108.155
2190+15.670	111.415
2190+45.622	112.894
2190+73.892	113.171
2190+107.221	114.347
2190+136.755	114.924
2190+196.670	115.777
2190+229.157	116.653
2190+259.535	117.229
2190+320.278	121.089];  
data.tL(:,1) = data.tL(:,1) + 400; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(6.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BaruLiu2023'; 

% lenght-weight
data.LW = [ ... % total length (cm), weight (g)
42.245	372.715
42.541	290.873
45.790	332.141
47.563	373.259
47.858	250.482
50.812	332.655
52.290	189.532
53.767	455.765
55.539	333.139
58.198	210.605
59.084	272.098
59.970	374.529
60.561	497.396
62.925	374.831
63.220	313.458
63.516	600.037
64.697	334.076
66.470	559.404
66.765	477.563
67.651	620.929
68.833	621.050
69.424	416.432
70.310	1480.850
71.492	621.322
72.969	375.859
72.969	744.280
75.628	437.534
76.219	683.209
76.809	273.912
77.400	806.137
77.400	499.119
78.582	355.965
79.764	990.589
80.355	601.761
80.355	806.440
80.945	1072.582
80.945	888.371
82.718	1052.295
82.718	888.552
83.309	622.531
83.604	827.239
83.900	991.012
85.672	1953.182
85.968	663.739
86.854	970.847
87.149	1216.491
87.740	807.195
88.035	1175.647
89.217	786.878
89.513	2199.190
90.103	1114.455
90.990	950.803
91.285	787.090
91.285	787.090
92.171	1094.198
93.353	664.494
93.648	1012.478
94.239	787.392
94.535	951.165
95.421	1258.273
95.421	746.578
96.603	1074.184
97.193	849.098
98.080	1422.288
98.966	1279.104
99.261	1176.795
99.852	869.838
99.852	1238.259
99.852	1586.212
100.148	1381.564
100.739	1136.010
101.625	992.826
102.511	829.174
103.102	1975.434
103.102	685.960
103.102	1381.867
103.102	1586.545
103.693	1279.588
104.284	1484.327
104.284	1341.052
104.874	2569.183
105.170	829.447
105.761	1218.396
106.352	1627.813
107.533	1095.770
107.533	1034.367
109.601	1525.806
109.897	1382.562
110.192	2303.645
110.192	1239.318
110.487	973.266
110.783	2692.594
112.260	1546.547
113.146	1219.152
113.737	1853.715
114.623	1894.741
114.623	1730.999
114.623	3020.472
115.510	1383.136
119.350	1649.611
119.645	1915.723
119.645	1895.255
119.941	2038.561
119.941	1752.011
119.941	1547.333
123.781	2980.474
126.440	3410.571
128.804	3779.233
129.690	3144.821
130.281	3267.689
130.871	3636.170
131.758	3390.647
133.826	3963.958
134.712	4864.634
135.007	4639.517
137.075	4250.840
137.666	4066.690
139.734	4271.580
139.734	4025.966
140.030	4987.985
145.643	4968.091
145.938	4354.087
146.233	5111.427
147.415	5009.208
152.142	5419.049
152.142	4723.142
152.437	5807.968
156.573	5583.24];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'BaruLiu2023'; 
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00132*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'XLP2'; % Cat of Life
metaData.links.id_ITIS = '635676'; % ITIS
metaData.links.id_EoL = '46561547'; % Ency of Life
metaData.links.id_Wiki = 'Congresox_talabonoides'; % Wikipedia
metaData.links.id_ADW = 'Congresox_talabonoides'; % ADW
metaData.links.id_Taxo = '171624'; % Taxonomicon
metaData.links.id_WoRMS = '220036'; % WoRMS
metaData.links.id_fishbase = 'Congresox-talabonoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Congresox_talabonoides}}';
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
bibkey = 'BaruLiu2023'; type = 'Article'; bib = [ ... 
'doi = {10:1134343}, ' ...
'author = {Barua, S. and Q. Liu and M.S. Alam and P. Schneider and M.M.H. Mozumder and M.A. Rouf}, ' ... 
'year = {2023}, ' ...
'title = {Population dynamics and stock assessment of two major eels (\emph{Muraenesox bagio} and \emph{Congresox talabonoides}) from the marine waters of {B}angladesh}, ' ...
'journal = {Frontiers in Marine Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'howpublished = {\url{https://www.fishbase.de/summary/Congresox-talabonoides.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
