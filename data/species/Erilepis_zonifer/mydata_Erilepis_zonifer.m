function [data, auxData, metaData, txtData, weights] = mydata_Erilepis_zonifer

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Anoplopomatidae';
metaData.species    = 'Erilepis_zonifer'; 
metaData.species_en = 'Skilfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 14];

%% set data
% zero-variate data

data.ab = 49;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(4.1);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 80*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'OrloTokra2003';   
  temp.am = C2K(4.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 83;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'OrloTokra2003'; 
  comment.Lp = 'fishbased gives 12.3 cm; ZoloSpir2014: at 70-90 cm  mass settling of skilfish takes place';
data.Li  = 188;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'ZoloSpir2014';
  
data.Wwb = 4.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm of Anoplopoma fimbria: pi/6*0.2^3';
data.Wwp = 7.6e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 88.5e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = 'ZoloSpir2014';
  comment.Wwi = 'based on 0.01905*Li^2.99, see F1, gives 120 kg; fishbase reports max of 57 kg';

data.Ri  = 1.26e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.75';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.208	13.308
0.830	43.520
0.900	35.246
1.107	40.281
1.730	55.745
2.007	46.031
3.253	56.815
3.875	60.408
5.952	90.972
6.990	97.440
7.751	92.759
7.752	89.162
7.820	79.090
7.958	94.916
8.166	102.469
10.865	121.158
11.003	119.358
12.803	129.779
12.872	125.103
54.048	184.208];
data.tL(:,1) = (0.8+data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(4.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OrloTokra2003';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
68.219	5230.769
69.918	7384.615
70.094	5230.769
71.224	6153.846
72.158	5538.462
72.340	4615.385
73.483	7692.308
73.844	5230.769
74.983	7692.308
75.533	5538.462
77.050	8615.385
77.597	5846.154
78.175	8615.385
79.844	5230.769
79.873	10461.538
81.741	9230.769
82.102	6769.231
83.246	10153.846
83.639	13230.769
84.944	12000.000
85.665	6769.231
86.620	9846.154
87.356	7384.615
87.396	14461.538
88.863	8615.385
88.894	14153.846
89.068	11692.308
90.557	9846.154
90.972	16923.077
92.441	11384.615
93.205	13846.154
94.863	8615.385
95.092	16000.000
95.255	11692.308
96.927	8923.077
97.153	15692.308
97.887	12923.077
98.246	10153.846
99.592	16000.000
99.795	18769.231
100.128	11384.615
101.283	16615.385
101.455	13846.154
101.812	10769.231
103.154	16000.000
103.736	19384.615
104.074	12923.077
105.022	14769.231
105.422	19076.923
106.552	20000.000
107.286	17230.769
108.026	15384.615
108.595	16615.385
110.462	15076.923
110.486	19384.615
110.512	24000.000
112.923	19384.615
112.937	21846.154
114.403	15692.308
115.401	26461.538
115.547	19076.923
117.432	20923.077
117.644	25230.769
119.144	25230.769
123.472	28000.000
123.506	34153.846
124.198	23692.308
126.097	28000.000
126.442	22769.231
127.800	30769.231
129.267	24923.077
129.685	32615.385
130.593	27384.615
131.038	39692.308
132.855	29538.462
133.777	26769.231
134.397	36923.077
135.611	19384.615
136.039	28923.077
137.183	32307.692
137.590	37846.154
138.477	28923.077
140.553	31384.615
142.633	34461.538
145.265	35692.308
146.947	34769.231
148.862	41846.154
149.015	35692.308
149.586	37230.769
151.669	40923.077
153.258	56615.385
153.791	51384.615
155.643	47384.615
157.549	52923.077
158.227	40000.000
160.008	56615.385
160.338	48615.385
162.468	60615.385
163.004	56000.000
180.886	68307.692
188.686	88307.692];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'ZoloSpir2014';
%
data.LW_m = [ ... % total length (cm), weight (g)
69.000	5372.121
69.571	3993.631
70.429	6408.656
70.714	4167.687
71.286	6754.715
71.571	6755.126
72.286	5204.428
72.857	6239.732
73.571	4344.206
74.000	7275.856
74.714	5725.159
75.714	6761.078
76.286	5555.003
76.714	7969.411
77.857	5040.019
77.857	8315.881
78.714	6937.802
79.286	5904.141
79.571	9007.999
80.286	8146.957
80.571	6940.471
82.000	8839.075
82.714	5391.825
83.000	7116.374
83.571	8841.333
84.286	8325.118
84.714	11601.595
86.143	9534.682
86.571	11776.677
88.143	8158.246
88.143	11261.694
89.143	9021.751
89.857	12643.467
89.857	11091.743
90.857	13679.387
91.000	9024.420
91.000	8334.765
91.714	12301.308
92.857	9716.743
93.286	14889.773
93.429	11614.116
94.857	9892.031
95.000	14202.581
95.143	12478.648
96.429	10583.943
96.571	14894.494
97.714	12309.929
98.857	16104.674
99.286	13863.911
99.714	10761.078
100.286	16968.796
101.000	12659.477
102.143	14040.430
103.571	12490.758
103.571	14904.551
104.429	17319.576
104.429	19388.541
105.000	13872.121
105.571	16803.976
107.571	14048.229
107.714	20427.745
109.571	20085.586
110.286	19569.370
111.143	19570.602
112.000	20778.730
112.143	23365.142
113.429	23194.576
114.429	25092.564
115.000	22507.178
115.857	26129.099
116.571	20785.298
116.571	16819.781
117.143	26475.774
117.857	22166.456
118.857	22167.893
119.286	32168.508
120.000	20962.638
120.143	25618.016
121.143	27688.418
121.286	21481.727
121.714	28723.722
122.714	21483.779
123.571	28209.149
125.000	28900.856
125.143	22349.338
128.143	28043.303
129.857	27356.111
131.143	37013.131
131.857	30117.605
132.000	34255.742
132.000	28048.845
132.571	35118.631
132.714	27015.388
136.000	32364.937
139.143	46162.556
140.286	29784.888
140.429	36164.403
140.429	33233.369
146.000	38068.960
147.429	55657.219
150.429	36868.426
150.571	49972.080
158.571	55155.988];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'ZoloSpir2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'legnth-weight: Ww in g = 0.01905*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3B286'; % Cat of Life
metaData.links.id_ITIS = '167125'; % ITIS
metaData.links.id_EoL = '46569741'; % Ency of Life
metaData.links.id_Wiki = 'Erilepis_zonifer'; % Wikipedia
metaData.links.id_ADW = 'Erilepis_zonifer'; % ADW
metaData.links.id_Taxo = '153433'; % Taxonomicon
metaData.links.id_WoRMS = '280700'; % WoRMS
metaData.links.id_fishbase = 'Erilepis-zonifer'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Erilepis_zonifer}}';
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
bibkey = 'ZoloSpir2014'; type = 'Article'; bib = [ ... 
'author = {O. G. Zolotov and I. Yu. Spirin and and S. M. Zudina}, ' ... 
'year = {2014}, ' ...
'title = {New Data on the Range, Biology, and Abundance of Skilfish \emph{Erilepis zonifer} ({A}noplopomatidae)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {54(4)}, ' ...
'pages = {251–265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrloTokra2003'; type = 'inproceedings'; bib = [ ... 
'author = {A. M. Orlov and A. M. Tokranov and B. A. Megrey}, ' ... 
'year = {2003}, ' ...
'title = {A REVIEW OF THE KNOWLEDGE RELATED TO THE NOMENCLATURE, ETYMOLOGY, MORPHOLOGY, DISTRIBUTION, AND BIOLOGICAL CHARACTERISTICS OF THE SKILFISH, \emph{Erilepis zonifer} ({A}NOPLOPOMATIDAE), IN THE {N}ORTH {P}ACIFIC {O}CEAN}, ' ...
'booktitle = {International Symposium on the North Pacific Transition Areas (La Paz, Mexico, 23-25 April 2002) and the 10th Deep-Sea Biology Symposium (Coos Bay, Oregon, USA, 25 29 August 2003.)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Erilepis-zonifer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

