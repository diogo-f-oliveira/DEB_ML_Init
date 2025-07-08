function [data, auxData, metaData, txtData, weights] = mydata_Hemiramphus_brasiliensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Hemiramphus_brasiliensis'; 
metaData.species_en = 'Ballyhoo halfbeak'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 16];

%% set data
% zero-variate data

data.ab = 7;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'BerkHoud1978';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19.3;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 34;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 8e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BerkHoud1978';
  comment.Wwb = 'based on egg diameter of 2.48 mm: pi/6*0.248^3';
data.Wwp = 34.6;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00380*Lp^3.08, see F1';
data.Wwi = 200;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max. published weight: 200.00 g; 0.00380*Li^3.08, see F1; gives 871 g for TL 55';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
89.535	16.806
125.556	18.994
154.886	19.310
187.065	19.945
217.328	19.940
246.685	20.987
277.886	20.754
305.338	21.435
338.437	21.384
368.730	22.157
399.003	22.426
431.186	23.153
459.572	23.514
488.941	24.881
551.377	25.329
641.259	26.321
736.775	26.215];
data.tL(:,1) = data.tL(:,1) + 100; % set origin to birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BerkHoud1978';

% length-weight
data.LW = [ ... ^fork length (cm), weight (g)
13.463	20.507
15.120	26.731
15.472	24.258
15.521	28.597
16.374	34.499
16.475	33.261
16.826	35.436
17.378	42.572
17.479	40.404
17.780	39.479
17.829	45.988
18.280	49.714
18.632	51.269
18.681	55.299
18.683	48.791
18.733	50.651
18.983	53.754
19.184	54.997
19.334	59.028
19.735	61.204
19.986	62.757
20.287	67.721
20.338	64.312
20.486	73.612
20.586	76.403
20.589	65.246
20.736	82.294
20.986	83.847
21.036	88.807
21.038	78.579
21.087	85.398
21.089	72.692
21.189	75.483
21.242	64.016
21.289	77.344
21.540	79.517
21.640	82.618
21.742	77.970
21.840	86.340
21.841	84.480
21.892	77.973
21.940	87.891
22.143	82.315
22.240	98.123
22.340	99.674
22.489	105.255
22.595	81.083
22.694	86.353
22.744	90.383
22.944	94.725
23.196	91.009
23.240	117.663
23.345	99.999
23.696	103.104
23.743	115.501
24.041	131.312
24.046	110.857
24.296	114.890
24.995	135.356
25.543	155.509
25.647	140.324
25.649	133.506
25.698	137.536
25.895	157.064
26.250	142.813
26.301	138.475
26.549	153.045
27.344	193.966
27.345	189.627
27.599	174.755
27.896	196.764
28.343	220.325
28.452	181.587
28.849	202.667
28.895	222.503
29.104	187.795
29.951	219.110
30.195	252.585
30.201	227.172
30.551	232.136];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'BerkHoud1978';

% weight-fecundity
data.WN = [ % weight (g), fecundity
70.303	1009.138
71.848	772.042
73.028	1116.974
73.421	631.952
80.038	1149.445
80.470	793.764
87.015	1074.130
87.581	1165.757
90.362	1462.218
92.368	966.448
93.970	923.366
94.088	1316.781
94.152	1532.351
96.359	1710.238
97.275	1171.333
97.419	1650.977
101.863	2109.146
102.326	1855.862
106.895	929.004
111.806	1144.667
112.017	1850.659
114.627	1575.859
117.342	1651.360
118.886	1414.264
124.292	1484.428
134.811	2449.301
136.744	1711.015
136.759	1759.518
137.387	2061.327
158.407	2126.402
176.528	1501.601
181.245	1070.554
197.421	1146.315
197.696	2062.488
221.140	1232.999
261.542	1293.058];
units.WN   = {'g', '#'};  label.WN = {'weight','fecundity'};  
temp.WN    = C2K(27.3);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'BerkHoud1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Grouped plots
% set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00380*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6LQPQ'; % Cat of Life
metaData.links.id_ITIS = '165460'; % ITIS
metaData.links.id_EoL = '46566989'; % Ency of Life
metaData.links.id_Wiki = 'Hemiramphus_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Hemiramphus_brasiliensis'; % ADW
metaData.links.id_Taxo = '176443'; % Taxonomicon
metaData.links.id_WoRMS = '159279'; % WoRMS
metaData.links.id_fishbase = 'Hemiramphus-brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hemiramphus_brasiliensis}}'];
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
bibkey = 'BerkHoud1978'; type = 'Article'; bib = [ ... 
'author = {Steven A. Berkeley and Edward D. Houde}, ' ... 
'year = {1987}, ' ...
'title = {Biology of two speices of halfbeaks, \emph{Hemiramphus brasiliensis} and \emph{H. balao} from southeast {F}lorida}, ' ...
'journal = {Bull. Mar. Sci.}, '...
'volume = {28(4)}, ' ...
'pages = {624-644}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hemiramphus-brasiliensis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

