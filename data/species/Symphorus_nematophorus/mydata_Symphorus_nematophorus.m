function [data, auxData, metaData, txtData, weights] = mydata_Symphorus_nematophorus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Symphorus_nematophorus'; 
metaData.species_en = 'Chinamanfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 21];

%% set data
% zero-variate data
data.ab = 2.5;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(27.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 37*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'HeupCurr2009';  
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 53.3;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'HeupCurr2009';
data.Li = 100;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 6.6e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 2017;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'HeupCurr2009','fishbase'};  
  comment.Wwp = 'based on 0.01230*Lp^3.02, see F1';
data.Wwi = 13487; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01230*Li^3.02, see F1;max. published weight: 13.2 kg';

data.GSI = 0.0167; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length        
data.tL = [ ... % age (yrs), fork length (cm) 
0.730	33.669
0.733	35.320
0.821	31.360
1.872	33.019
1.878	36.319
1.963	31.039
1.976	37.970
2.075	39.951
2.080	42.591
2.733	35.336
2.738	37.976
2.836	39.297
2.918	32.037
2.935	41.278
2.951	49.529
3.034	43.259
3.135	46.230
3.794	42.276
3.799	44.586
3.903	49.207
3.916	56.468
3.981	40.297
4.002	51.188
4.168	38.648
4.185	47.229
4.653	42.943
4.768	53.505
4.847	45.255
4.848	45.255
4.946	46.906
5.028	39.975
5.049	51.197
5.056	54.827
5.065	59.448
5.141	49.547
5.154	56.148
5.800	45.592
5.807	49.223
5.811	51.203
5.919	57.805
5.924	60.445
6.022	61.766
6.104	55.166
6.122	64.407
6.936	41.971
6.964	56.493
6.983	66.394
7.044	48.243
7.085	70.025
8.230	71.025
8.889	67.070
8.987	68.721
9.855	74.009
10.210	60.480
11.836	64.124
12.227	69.408
12.241	76.669
13.948	73.052
13.951	74.373
14.029	65.792
14.999	75.041
16.144	75.711
17.090	72.748
17.095	75.059
18.052	77.377
18.986	68.143
23.008	79.398
23.191	75.439
24.265	89.639
25.101	78.425
27.004	77.451
30.353	85.729
31.863	78.481
36.247	79.837];
data.tL(:,1) = 365 * (0.8+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(27.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeupCurr2009'; 

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
30.998	630.251
32.358	680.672
33.570	605.041
33.869	756.302
34.931	655.462
35.229	831.933
36.591	781.512
37.496	907.563
38.855	1008.403
39.761	1084.033
40.060	1235.294
40.965	1336.134
40.978	831.933
41.276	983.193
41.725	1184.874
42.325	1386.554
42.774	1588.235
43.686	1411.764
43.691	1210.084
43.982	1663.866
44.439	1563.025
45.193	1663.866
45.652	1436.974
45.808	1235.294
46.098	1764.705
47.011	1563.025
47.155	1840.336
47.318	1386.554
47.448	2193.277
48.059	1991.597
48.070	1563.025
48.965	2042.017
49.125	1689.075
49.871	2117.646
51.077	2294.117
51.083	2042.017
51.527	2445.377
53.038	2495.798
54.390	2899.159
54.991	3050.420
55.434	3504.202
55.903	2899.159
58.153	3655.462
58.615	3327.731
59.507	3932.773
61.175	3781.512
64.795	4235.294
66.599	4689.075
67.945	5319.327
68.106	4915.966
69.150	5521.008
69.296	5722.689
69.761	5268.907
69.899	5823.529
70.071	4991.596
71.546	6504.201
72.464	6075.630
72.603	6579.831
73.323	8016.807
73.957	6857.143
74.084	7815.126
74.554	7184.874
76.504	7865.546
76.633	8722.689
76.674	7109.244
77.276	7235.294
78.017	7840.336
78.899	8873.949
85.511	10638.655];
units.LW = {'cm', 'g'}; label.LW = {'fork length', 'weight'};  
bibkey.LW = 'HeupCurr2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01230*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53PQJ'; % Cat of Life
metaData.links.id_ITIS = '550957'; % ITIS
metaData.links.id_EoL = '46580841'; % Ency of Life
metaData.links.id_Wiki = 'Symphorus_nematophorus'; % Wikipedia
metaData.links.id_ADW = 'Symphorus_nematophorus'; % ADW
metaData.links.id_Taxo = '106176'; % Taxonomicon
metaData.links.id_WoRMS = '282915'; % WoRMS
metaData.links.id_fishbase = 'Symphorus-nematophorus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Symphorus_nematophorus}}';
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
bibkey = 'HeupCurr2009'; type = 'techreport'; bib = [ ...
'author = {Michelle R. Heupel and Leanne M. Currey and Ashley J. Williams and Colin A. Simpfendorfer and Aaron C. Ballagh and Ann L. Penny}, ' ...
'year = {2009}, ' ...
'title = {The Comparative Biology of Lutjanid Species on the Great Barrier Reef}, ' ... 
'institution = {Dept Environ., Water, Heritage and Arts, James Cook University}, ' ...
'howpublished = {\url{https://www.rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Heupel-M-2008-Comparative-Biology-of-Lutjanid-Species-on-GBR.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Symphorus-nematophorus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
