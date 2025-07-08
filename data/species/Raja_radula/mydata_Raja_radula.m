function [data, auxData, metaData, txtData, weights] = mydata_Raja_radula

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_radula'; 
metaData.species_en = 'Rough skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 05];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 6*30.5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'KadrMaro2013';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'based on smallest captured with TL 13.5 cm';
data.Lp  = 56.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'KadrMaro2013';
data.Lpm  = 47;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'KadrMaro2013';
data.Li  = 75; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'KadrMaro2013';

data.Wwi = 3.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'KadrMaro2013';

data.Ri  = 117/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '80-154 eggs per yr';

% uni-variate data
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.081	18.869
2.016	28.969
2.981	39.285
4.031	48.323
5.053	55.864
6.045	55.711
6.045	57.420
6.045	59.557
7.038	63.678
7.038	65.601
8.045	68.440
8.045	70.363
8.059	65.663
8.059	67.159
9.052	73.843
9.052	74.698
9.052	76.194
9.065	70.212
9.066	72.135
9.080	68.717
10.058	72.409
10.058	74.973
10.058	76.255
10.058	78.178
11.079	76.745
11.079	80.164
11.093	78.241
12.071	78.728
12.071	79.797
12.071	81.292];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
  temp.tL_f = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KadrMaro2013';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.009	21.429
1.010	24.207
1.052	17.372
2.016	24.482
2.016	25.337
2.016	26.619
2.017	31.320
2.017	32.388
2.017	32.602
2.017	34.098
2.059	27.904
2.060	30.040
3.023	34.373
3.024	36.723
3.053	40.998
3.081	32.667
4.016	43.194
4.045	45.546
4.059	41.487
4.980	44.107
4.980	45.176
5.023	46.674
5.052	48.172
5.052	49.667
5.052	50.522
6.015	45.666
6.015	47.376
6.015	48.658
6.015	50.795
6.030	52.291
6.030	53.787
7.095	59.407
7.095	60.903
8.058	59.894
8.073	62.672
9.050	62.091
9.050	62.946
9.050	64.655];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
  temp.tL_m = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KadrMaro2013';
comment.tL_m = 'data for males';


% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
18.791	50.154
26.791	112.210
27.163	119.791
28.465	90.250
30.047	98.170
30.233	158.035
31.163	135.866
31.163	218.109
32.000	218.344
32.279	158.609
33.023	338.257
33.023	121.434
33.116	196.227
33.674	159.000
33.860	331.015
34.419	241.452
34.698	331.250
35.070	346.307
35.256	226.733
35.535	271.671
36.093	354.071
36.465	234.549
36.651	294.414
37.116	234.732
37.395	332.006
37.395	272.193
38.047	272.376
38.605	309.915
38.791	362.304
39.163	332.501
39.814	355.114
39.814	422.404
40.000	557.035
40.465	377.726
41.209	557.374
41.302	475.158
41.860	572.510
41.860	355.688
42.233	475.418
42.884	535.414
42.977	610.206
43.349	408.442
43.535	543.073
43.535	774.849
43.721	460.882
44.186	618.022
44.279	498.422
45.023	805.173
45.023	446.294
45.395	580.978
45.674	842.739
45.953	768.050
46.047	446.581
46.326	984.977
46.605	700.943
46.698	581.343
46.791	783.238
47.256	417.014
47.349	544.143
47.442	932.954
47.907	1239.626
48.186	1239.704
48.186	738.770
48.186	671.480
48.186	806.059
48.372	985.551
48.651	1344.508
48.837	1142.691
48.837	1217.457
48.837	843.625
49.116	1337.162
49.209	1284.851
49.395	948.454
49.674	843.860
49.860	597.183
49.953	1449.546
50.233	784.203
50.233	574.858
50.419	1008.555
50.512	903.908
51.070	567.615
51.070	507.803
51.163	1188.203
51.628	1098.613
51.814	993.992
51.814	911.750
52.093	1293.136
52.279	844.590
52.372	754.897
52.465	1196.044
52.465	934.362
52.558	1121.304
52.930	1285.894
53.023	1054.145
53.023	1196.201
53.209	964.477
53.581	1136.544
53.953	1248.798
54.047	934.806
54.047	860.039
54.140	1301.187
54.140	785.299
54.419	987.246
54.605	1099.448
54.698	1181.717
54.884	1368.685
54.977	1271.515
54.977	882.730
55.256	965.051
55.256	1047.294
55.628	1107.211
55.721	1226.864
56.186	1443.816
56.186	1309.237
56.186	1122.321
56.279	1204.590
56.465	1354.175
56.744	1825.281
57.023	1272.089
57.116	1189.872
57.209	1354.384
57.860	1190.080
57.953	2274.219
57.953	1242.443
58.047	1294.806
58.047	1362.095
58.047	1451.815
59.070	1661.447
59.163	2282.034
60.000	1325.260
60.000	1250.493
60.093	1863.603
60.093	1564.538
60.186	2297.274
60.186	1758.957
60.186	1130.919
61.116	1878.844
62.140	1759.504
63.163	2582.221
64.000	2657.222
64.186	1946.994
64.837	2664.934
65.023	2455.640
65.116	1865.012
65.488	2762.312
66.047	2515.740
66.140	2448.476
66.140	2710.159
66.977	2261.795
67.070	2874.905
67.163	2000.165
67.256	2792.715
67.256	2493.649
67.256	2471.219
67.535	2202.139
67.907	2239.626
68.000	2695.727
68.093	2284.538
68.093	2105.099
68.186	2419.144
68.279	2785.525
68.279	2576.179
68.279	2523.843
68.744	3286.590
68.837	2359.513
69.023	2546.481
69.023	2135.266
69.116	1903.517
69.209	2905.412
69.302	2494.223
69.395	2269.950
69.581	2120.469
70.047	3309.385
70.047	3481.347
70.047	2486.955
70.233	2928.129
70.233	2217.848
70.233	2247.755
70.326	3578.622
70.419	2673.975
71.163	2741.474
72.000	3766.007
72.093	3167.903
72.186	2689.424
72.279	2629.637
72.465	3332.493
72.930	2891.502
73.023	2854.145
73.023	2712.089
73.116	2659.778
73.302	3213.101
73.395	3504.716
73.395	2629.950
73.674	2884.234
74.140	3273.149
74.233	3639.530
74.233	3534.858
74.419	2779.769
74.977	3407.963
75.442	3677.253];
units.LWw_f = {'d', 'cm'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f = 'KadrMaro2013';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
13.488	18.761
13.953	18.892
14.605	19.074
15.163	11.754
16.093	4.538
16.651	12.171
17.395	27.333
20.000	28.063
20.930	20.848
21.860	21.109
22.419	21.265
22.977	28.898
23.442	29.028
24.093	36.687
24.465	51.745
25.209	44.477
25.767	52.110
25.767	37.157
26.791	59.874
27.163	67.455
28.093	67.716
29.116	68.003
29.767	60.708
30.605	90.850
31.535	98.587
32.186	166.059
33.581	144.021
34.605	226.551
35.070	219.204
35.814	204.460
36.186	286.807
36.558	369.154
37.116	257.161
37.674	317.131
38.233	421.960
38.698	294.988
39.907	414.953
40.930	475.053
41.488	415.397
42.140	632.401
42.884	662.517
42.977	445.720
43.535	520.643
43.721	528.172
44.000	700.213
44.558	498.500
44.651	580.769
45.395	603.408
45.953	655.901
46.605	581.317
47.442	574.075
47.907	634.018
48.000	716.288
48.837	798.765
48.930	499.726
49.488	746.611
49.674	694.327
49.767	784.073
50.605	694.588
50.698	672.184
50.977	791.889
51.256	881.686
51.628	724.781
51.907	1001.495
51.907	665.047
52.186	1016.527
52.465	867.072
53.023	971.902
53.209	1203.730
54.233	1204.017
54.233	1009.624
54.326	1121.800
55.256	1204.303
55.721	1152.097
55.814	1234.366
56.000	1002.643
56.372	1092.467
56.558	1010.276
56.651	1227.125
56.930	1324.399
57.488	1474.088
57.581	1541.404
57.767	1571.363
57.767	1362.017
58.233	1638.783
58.233	1399.530
58.419	1579.022
60.186	1549.611
60.186	1482.321
61.116	1706.881
61.116	1669.498
62.047	1707.142
62.047	1647.329
62.326	1647.407
62.605	1789.541];
units.LWw_m = {'d', 'cm'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m = 'KadrMaro2013';
comment.LWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00295*(PL in cm)^3.23';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '78RBX'; % Cat of Life
metaData.links.id_ITIS = '160898'; % ITIS
metaData.links.id_EoL = '46560553'; % Ency of Life
metaData.links.id_Wiki = 'Raja_radula'; % Wikipedia
metaData.links.id_ADW = 'Raja_radula'; % ADW
metaData.links.id_Taxo = '101385'; % Taxonomicon
metaData.links.id_WoRMS = '105889'; % WoRMS
metaData.links.id_fishbase = 'Raja-radula'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Raja_radula}}'; 
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
bibkey = 'KadrMaro2013'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF12218}, ' ...
'author = {Hasna Kadri and Sondes Marouani and Mohamed Nejmeddine Bradai and Abderrahmen Boua\"{i}n}, ' ...
'year = {2013}, ' ...
'title  = {Age, growth and reproductive biology of the rough skate, \emph{Raja radula} ({C}hondrichthyes: {R}ajidae), off the {G}ulf of {G}abes (southern {T}unisia, central {M}editerranean)}, ' ...
'journal = {Marine and Freshwater Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Raja-radula.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

