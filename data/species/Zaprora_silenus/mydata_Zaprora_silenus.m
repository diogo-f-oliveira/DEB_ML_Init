function [data, auxData, metaData, txtData, weights] = mydata_Zaprora_silenus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Zaproridae';
metaData.species    = 'Zaprora_silenus'; 
metaData.species_en = 'Prowfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN','MPNE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ww_L'; 'rB_T'; 'R_L'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 01];

%% set data
% zero-variate data

data.ab = 32;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(4.7);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '';
data.am = 22*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'SmitSome2004';   
  temp.am = C2K(4.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbases gives 9 yr';
  
data.Lp  = 57;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 88;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  comment.Li = 'SmitSome2004: > 100 cm';

  
data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
 comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 2851;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
   comment.Wwp = 'based on 0.01738*Lp^2.97, see F2';
data.Wwi = 1e4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.01738*Li^2.97, see F2';

data.Ri  = 1.6e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.8';
 
% univariate data
% time-length
data.tL_f = [ ... % time (yr), total length (cm)
1.938	38.772
3.004	51.823
3.004	50.096
3.004	29.175
3.028	45.873
3.997	52.207
4.046	41.651
4.942	56.622
4.966	42.610
4.990	47.793
4.990	57.390
5.039	50.096
5.039	62.956
5.063	76.967
5.935	50.096
5.959	65.451
5.959	57.006
6.008	69.098
6.008	62.572
6.032	59.501
6.032	48.752
6.056	67.370
6.080	56.238
7.049	58.541
7.049	69.290
7.049	71.401
7.074	54.319
7.074	64.299
7.074	72.553
7.098	56.430
7.122	61.612
7.146	77.351
7.171	74.664
8.018	76.583
8.043	73.896
8.043	67.754
8.043	58.349
8.067	71.593
8.067	71.017
8.067	69.866
8.963	79.655
8.987	75.624
9.036	73.321
9.060	59.693
9.956	74.856
10.005	78.503
10.078	79.271
11.022	81.382
11.047	83.109
11.047	72.361
12.064	81.574
12.064	82.534
13.033	80.806
17.054	83.109
19.041	86.180
20.058	78.887];
data.tL_f(:,1) = 365*(0.3+data.tL_f(:,1)); % convert yr to d
units.tL_f = {'cm', 'g'};  label.tL_f = {'time since birth','total length','females'};  
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-6;end;end
  temp.tL_f = C2K(4.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'SmitSome2004';
%
data.tL_m = [ ... % time (yr), total length (cm)
3.028	41.459
3.028	34.933
3.052	54.319
3.052	43.186
3.077	30.902
3.973	54.127
3.997	56.622
4.021	43.570
4.021	49.904
4.966	51.631
4.990	46.833
5.015	53.743
5.039	61.036
5.039	65.643
5.984	53.935
6.008	74.856
6.008	47.217
7.001	67.562
8.115	78.887
8.963	66.027
8.987	81.958
9.036	84.261
10.029	84.261
11.119	88.868
11.919	74.472
12.088	84.645
13.057	72.745
17.006	87.332
17.006	76.775
17.030	89.443
17.999	87.716];
data.tL_m(:,1) = 365*(0.3+data.tL_m(:,1)); % convert yr to d
units.tL_m = {'cm', 'g'};  label.tL_m = {'time since birth','total length','males'};  
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-6;end;end
  temp.tL_m = C2K(4.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'SmitSome2004';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
11.009	-20.316
29.358	284.424
36.188	548.532
38.838	832.957
41.386	914.221
42.100	832.957
45.056	1015.801
48.012	1218.962
48.930	1422.122
49.847	1279.910
50.153	2194.131
50.255	1564.334
51.172	1828.442
51.376	1523.702
54.332	2051.919
54.944	1808.127
55.454	2214.447
56.881	2600.452
57.187	2722.347
57.187	2011.287
58.410	2214.447
59.021	2458.239
59.327	2844.244
60.652	2437.923
61.468	2437.923
61.876	2945.824
62.080	2762.980
64.016	2681.715
65.138	3250.565
65.240	2783.295
65.953	3534.989
67.482	3697.517
68.400	4632.054
69.215	4550.790
70.133	4286.682
70.642	3941.310
71.050	3291.196
71.967	5261.851
72.273	4205.418
72.273	3697.517
72.477	5018.059
73.496	5485.327
74.516	6094.808
75.331	5200.903
75.331	5282.167
75.841	6196.388
77.064	6643.341
77.268	6033.860
77.370	4896.163
78.084	5810.384
79.103	6846.501
79.103	5221.219
79.307	4408.578
79.817	6562.077
80.530	5404.063
80.938	6866.817
81.142	6623.025
81.651	7313.770
81.651	5871.332
81.855	6582.393
82.263	6968.397
83.180	6237.021
83.384	6033.860
84.302	7293.454
85.831	7821.671];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'SmitSome2004';
%
data.LW_m = [ ... % total length (cm), weight (g)
30.785	386.004
35.168	426.637
41.386	853.273
41.896	934.537
42.915	995.485
43.527	1056.433
44.139	1178.329
44.444	954.853
45.566	1015.801
47.299	1300.225
47.299	1239.277
48.012	1442.437
48.522	1137.697
48.624	1625.282
48.624	1239.277
49.032	1503.386
49.337	1178.329
49.643	1340.857
49.745	1645.598
50.561	1706.546
50.561	1503.386
50.663	1503.386
51.070	1625.282
51.274	1787.810
51.376	1361.174
52.294	1686.230
52.396	1523.702
53.007	2173.815
54.230	2072.235
54.230	1686.230
55.250	2356.659
55.352	1930.022
56.167	2214.447
56.677	2437.923
57.085	2356.659
57.085	2011.287
58.206	2255.079
58.308	2498.871
58.614	2336.343
59.939	2762.980
60.652	2519.187
61.264	2966.140
61.468	3311.512
61.468	2762.980
61.468	2600.452
62.283	2681.715
62.487	3047.404
62.793	3514.673
62.895	3270.880
63.405	3656.885
63.812	3128.668
64.220	3230.248
64.322	3616.253
65.138	3799.097
65.240	3474.040
65.545	3047.404
65.953	3494.357
66.157	3088.036
66.361	3880.361
66.463	3372.460
66.565	3636.569
66.972	3514.673
67.074	2641.083
67.380	3006.772
67.686	3656.885
68.094	3880.361
68.502	4063.205
69.011	4063.205
69.317	3941.310
70.133	2702.032
70.234	3880.361
71.254	3920.993
72.273	4205.418
73.395	5018.059
73.598	4733.634
73.904	5139.955
74.108	4103.837
74.720	4957.111
75.025	5119.639
75.229	4022.573
76.962	5891.648
77.268	5079.007
77.778	5749.436
78.084	3453.725
78.186	5688.488
82.365	7760.723
82.365	5790.068
83.282	6379.233
83.690	6765.237
84.200	7313.770
84.404	7069.977
84.506	6907.449
85.219	6643.341
87.054	7984.199
88.277	7943.567
89.093	7841.987
90.316	7313.770];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'SmitSome2004';
   
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01738*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Young to 7.2 cm are pelagic or bathypelagic, usually associated with jellyfish';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5CX6Q'; % Cat of Life
metaData.links.id_ITIS = '171659'; % ITIS
metaData.links.id_EoL = '46575110'; % Ency of Life
metaData.links.id_Wiki = 'Zaprora_silenus'; % Wikipedia
metaData.links.id_ADW = 'Zaprora_silenus'; % ADW
metaData.links.id_Taxo = '190222'; % Taxonomicon
metaData.links.id_WoRMS = '254353'; % WoRMS
metaData.links.id_fishbase = 'Zaprora-silenus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Zaprora_silenus}}';
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
bibkey = 'SmitSome2004'; type = 'Article'; bib = [ ... 
'author = {Smith, Keith R. and Somerton, David A. and Yang, Mei-Sun and Nichol, Daniel G.}, ' ... 
'year = {2004}, ' ...
'title = {Distribution and biology of prowfish (\emph{Zaprora silenus}) in the northeast {P}acific}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {102}, ' ...
'pages = {168–178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.se/summary/Zaprora-silenus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
