function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_aurora

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_aurora'; 
metaData.species_en = 'Aurora rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 27];

%% set data
% zero-variate data

data.am = 120*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'ThomHann2010';   
  temp.am = C2K(5.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase gives 75 yrs';

data.Lp  = 28;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 41;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 127.4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 419;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.Ri  = 1.6e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_entomelas: 1.1e6*419/2.8e3';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
3.490	14.334
7.444	22.116
7.742	21.155
7.898	18.359
8.048	17.486
8.628	20.370
10.525	26.052
10.685	22.208
11.104	29.373
11.561	25.005
12.590	25.705
12.729	28.239
13.024	28.152
13.033	25.269
13.610	29.114
14.068	24.309
14.360	25.183
14.652	26.057
15.084	29.029
15.234	28.330
15.673	29.117
15.687	25.097
16.561	27.982
16.586	20.380
16.718	25.011
16.859	27.196
17.009	26.235
17.448	27.109
17.736	29.207
17.880	30.255
18.044	25.275
18.771	28.247
18.774	27.198
19.505	29.121
19.649	30.258
20.688	27.987
20.828	30.172
21.145	23.269
21.548	35.328
21.999	32.445
22.305	29.212
22.596	30.261
23.035	31.310
23.339	28.252
23.615	34.107
23.919	31.311
23.926	29.040
24.797	33.060
24.803	31.313
25.557	25.983
25.980	31.926
25.989	29.217
26.133	30.266
26.860	33.063
27.453	32.102
27.757	29.306
27.889	33.938
28.042	32.278
28.181	34.899
28.501	27.210
28.773	34.114
28.779	32.279
29.516	32.192
29.962	30.969
30.260	30.096
30.859	27.213
30.990	32.194
31.573	33.942
32.315	32.458
32.460	33.332
32.896	35.080
33.047	34.032
33.639	33.246
34.074	35.256
34.228	33.334
34.231	32.285
34.516	35.344
34.963	34.034
34.972	31.063
35.991	34.996
36.007	30.103
36.010	29.229
36.147	32.288
36.292	33.162
37.902	36.397
39.229	36.224
40.127	32.118
40.264	35.176
40.706	35.177
41.296	35.090
41.874	38.499
42.042	32.383
42.182	34.480
42.323	36.315
43.355	36.404
43.801	35.268
44.092	36.142
44.531	37.279
44.688	34.308
45.861	36.057
45.864	35.271
46.015	34.222
46.453	35.359
47.040	36.233
47.045	34.486
47.472	39.118
47.923	36.322
47.931	34.137
48.359	38.245
49.109	34.401
49.698	34.577
50.426	37.199
50.583	34.316
50.861	39.471
50.871	36.238
51.021	35.365
52.047	37.201
52.348	35.366
52.796	33.357
52.930	37.464
53.825	34.145
54.113	36.330
54.699	37.204
54.702	36.418
56.032	35.196
56.185	33.449
56.906	38.343
56.910	37.294
57.069	33.625
57.351	37.470
58.822	38.258
61.921	37.213
61.923	36.339
63.109	34.156
63.686	38.264
64.134	36.167
64.272	39.138
64.572	37.566
64.730	34.246
65.601	38.354
66.041	39.141
66.348	35.296
66.784	37.132
66.934	36.171
67.369	38.443
67.671	36.259
68.116	35.473
68.258	37.134
68.266	34.512
69.291	36.436
69.878	37.311
70.609	39.146
70.909	37.574
71.932	40.284
72.966	39.499
74.299	37.229
74.886	38.103
74.895	35.307
76.952	37.319
77.845	34.524
78.131	37.321
78.862	39.069
79.018	36.448
82.689	40.560
82.850	36.191
82.990	38.463
83.882	36.192
84.772	34.271
85.784	40.389
85.796	36.544
86.825	37.332
86.828	36.545
88.895	35.325
90.067	37.423
91.535	39.260
91.537	38.473
91.842	35.503
93.892	39.438
94.794	34.196
99.941	37.261
101.700	40.234
103.911	40.237
113.784	40.336
117.625	37.370];
data.tL_f(:,1) = 365*(0.8+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f   = C2K(5.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ThomHann2010';  
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
4.371	15.297
5.550	15.386
6.139	15.386
6.428	17.134
7.009	19.756
7.014	18.271
7.166	17.048
7.743	20.806
8.325	22.904
8.336	19.496
8.613	25.001
8.636	18.098
9.081	17.225
9.654	22.294
9.795	24.129
9.945	23.343
10.079	27.275
10.394	21.333
10.544	20.285
10.974	24.218
11.107	28.499
11.259	27.189
12.002	25.267
12.303	23.171
12.441	26.229
12.594	24.394
12.876	28.239
12.883	26.317
13.026	27.541
13.473	25.968
13.629	23.347
14.352	27.455
14.504	26.144
14.648	27.368
14.786	29.989
14.939	28.329
15.250	23.437
15.555	20.117
15.836	24.311
16.269	27.370
16.272	26.321
16.849	30.254
17.000	29.031
17.739	28.245
17.893	26.236
18.474	28.858
18.778	26.062
19.796	30.170
20.841	26.240
20.972	31.133
21.420	29.386
22.304	29.300
22.597	30.086
22.738	32.009
23.200	25.893
23.792	25.107
24.232	25.807
24.511	30.526
24.800	32.186
26.718	31.490
27.017	30.267
27.314	29.481
28.039	33.152
28.045	31.491
28.929	31.318
29.070	33.240
29.954	33.503
30.693	32.893
31.140	31.233
31.277	34.554
31.281	33.243
34.078	34.120
34.818	33.160
35.856	31.152
37.913	32.989
38.067	31.154
40.130	31.244
40.424	31.332
40.859	33.430
43.212	35.093
43.951	34.482
46.755	33.087
47.943	30.205
48.674	32.041
49.260	33.178
52.355	33.182
52.941	34.231
56.772	34.411
57.503	36.247
60.022	32.056
60.309	34.240
65.032	32.237
65.903	36.257
70.619	36.176
77.102	36.358
81.232	35.315];
data.tL_m(:,1) = 365*(0.8+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m   = C2K(5.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ThomHann2010';  

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7KY'; % Cat of Life
metaData.links.id_ITIS = '166709'; % ITIS
metaData.links.id_EoL = '46568120'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_aurora'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_aurora'; % ADW
metaData.links.id_Taxo = '187252'; % Taxonomicon
metaData.links.id_WoRMS = '274774'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-aurora'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_aurora}}';
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
bibkey = 'ThomHann2010'; type = 'article'; bib = [ ... 
'doi = {10.1007/s10641-010-9653-6}, ' ...
'author = {Thompson, J. E. and Hannah, R. W.},' ...
'year = {2010}, ' ...
'title = {Using cross-dating techniques to validate ages of aurora rockfish (\emph{Sebastes aurora}): estimates of age, growth and female maturity}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {88(4)}, ' ...
'pages = {377–388}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-aurora.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
