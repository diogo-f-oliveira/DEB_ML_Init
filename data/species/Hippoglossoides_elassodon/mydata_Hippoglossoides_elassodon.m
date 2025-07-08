function [data, auxData, metaData, txtData, weights] = mydata_Hippoglossoides_elassodon
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Hippoglossoides_elassodon'; 
metaData.species_en = 'Flathead sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 27*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(7.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 32.9;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'Stra2004';
data.Li  = 52;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 49;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'fishbase';
  comment.Lim = 'based on StarSome2002: males stay smaller than females';

data.Wwb = 4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Forr1964';
  comment.Wwb = 'based on egg diameter 0.92 mm : pi/6*0.092^3';
data.Wwp = 349;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00813*Lp^3.08, see F2';
data.Wwi = 1.4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00692*Li^3.10, see F2';
  
data.GSI  = 0.09; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'Stra2004';   
  temp.GSI = C2K(7.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length data 
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.974	13.445
2.860	15.337
2.860	14.284
2.860	13.020
2.923	18.917
2.955	18.180
2.955	16.284
3.873	18.070
3.873	17.438
3.873	16.280
3.905	27.338
3.905	25.126
3.905	23.231
3.905	22.177
3.905	21.019
3.905	20.176
3.905	19.229
4.823	27.123
4.854	18.487
4.886	24.174
4.886	21.330
4.918	28.386
4.918	26.069
4.918	25.227
4.918	23.015
4.918	22.383
5.867	35.333
5.867	26.276
5.867	25.222
5.867	24.275
5.867	21.010
5.899	30.278
5.899	29.014
6.880	28.272
6.880	27.219
6.912	37.118
6.912	29.325
6.944	26.060
6.944	24.901
7.893	34.060
7.893	32.058
7.893	29.215
7.925	31.216
7.925	28.267
8.811	33.845
8.843	38.268
8.843	37.320
8.843	36.372
8.843	31.001
8.843	30.158
8.843	27.209
8.875	35.424
8.875	29.105
8.875	28.157
8.906	33.949
8.906	32.370
9.824	34.156
9.824	35.209
9.824	36.262
9.856	37.104
9.888	29.205
9.888	30.259
9.888	31.312
9.888	33.418
9.951	39.948
10.806	38.258
10.806	33.203
10.837	35.099
10.837	31.307
10.837	27.305
10.869	42.155
10.869	39.206
10.869	37.205
10.869	36.152
10.869	34.361
10.869	32.255
10.869	30.254
11.882	43.309
11.882	34.251
11.914	42.045
11.914	41.097
11.914	40.254
11.914	39.201
11.945	36.252
11.945	29.090
12.832	38.144
12.832	39.197
12.895	31.403
12.895	33.404
12.895	34.246
12.895	36.248
12.895	37.195
12.895	39.934
12.895	44.252
13.845	40.140
13.876	43.299
13.876	39.297
13.908	38.349
13.908	37.401
13.908	36.243
13.908	34.136
13.908	32.135
14.858	46.243
14.889	40.135
14.921	44.347
14.921	42.452
14.984	41.188
15.839	43.290
15.871	47.503
15.871	42.447
15.871	39.077
15.902	45.291
15.902	37.181
15.934	46.238
15.934	41.078
15.934	38.234
16.820	41.179
16.852	36.018
16.852	43.285
16.852	47.077
16.884	40.336
16.884	44.128
16.915	38.230
16.915	45.286
16.915	46.128
16.947	50.341
17.042	33.174
17.833	46.229
17.833	43.912
17.833	42.227
17.865	49.283
17.865	48.125
17.896	41.490
18.783	46.120
18.814	44.118
18.846	45.277
18.846	49.279
18.909	41.169
18.941	47.277
18.941	52.227
18.941	54.228
19.859	45.272
19.859	43.376
19.922	42.112
20.872	43.266
20.872	44.109
20.872	45.372
20.872	46.110
20.872	49.164
20.904	51.270
21.885	41.260
21.885	44.104
22.866	42.203
24.943	53.294];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Stra2004';
comment.tL_f = 'Data for females in eastern Bering Sea';
% t-L data males 
data.tL_m = [ ... % time since birth (yr), total length (cm)
3.050	13.440
3.082	16.810
3.082	15.862
3.082	14.598
3.145	17.863
4.031	26.916
4.063	17.859
4.063	17.227
4.063	15.858
4.126	25.020
4.126	24.072
4.126	23.124
4.126	21.650
4.126	21.123
4.126	19.859
5.076	29.228
5.076	18.064
5.108	27.754
5.139	24.173
5.139	23.014
5.139	21.961
5.139	21.329
5.139	19.855
5.171	25.963
5.171	25.226
6.121	25.853
6.121	24.800
6.121	23.957
6.121	20.903
6.152	22.904
7.134	33.115
7.134	29.850
7.134	29.113
7.134	27.323
7.134	25.532
7.134	19.319
7.165	31.957
7.165	24.058
7.165	23.110
8.052	29.004
8.052	28.266
8.083	26.370
8.083	24.791
8.115	31.110
8.115	29.740
8.147	32.689
8.147	31.741
9.033	26.998
9.065	32.895
9.065	31.316
9.096	34.054
9.096	30.262
9.096	23.417
9.128	38.161
9.128	35.949
9.128	35.002
9.128	28.893
9.128	27.945
9.160	26.049
10.046	29.205
10.078	31.206
10.078	30.047
10.109	37.209
10.109	33.207
10.109	32.048
10.109	25.834
10.141	38.156
11.027	34.045
11.091	33.202
11.122	32.149
11.122	31.201
11.122	30.042
12.040	38.253
12.104	31.196
12.135	36.041
12.135	34.987
12.135	34.145
13.053	31.086
13.053	29.928
13.085	33.824
13.116	37.300
13.116	32.982
13.116	31.928
13.116	29.401
13.148	39.090
13.180	35.930
13.180	35.088
14.035	37.085
14.098	35.294
14.129	34.135
15.079	39.081
15.111	35.184
15.142	36.974
15.142	34.236
15.174	32.235
15.237	36.026
16.060	40.340
16.124	37.075
16.124	36.127
16.124	33.915
17.137	37.070
17.137	34.964
17.200	39.071
18.086	40.225
18.118	38.013
18.118	37.171
18.118	35.170
18.118	34.116
18.118	32.958
19.068	35.902
19.099	40.010
19.131	42.011
20.112	36.108
20.144	42.216
20.144	40.110
20.144	37.898
21.094	33.997
21.125	39.052
21.125	37.999
22.138	37.889
23.151	35.040
24.164	38.090];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Stra2004';
comment.tL_m = 'Data for males in eastern Bering Sea';

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
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Preferred temperature 7.6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00692*(TL in cm)^3.10';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6LWHZ'; % Cat of Life
metaData.links.id_ITIS = '172875'; % ITIS
metaData.links.id_EoL = '46570098'; % Ency of Life
metaData.links.id_Wiki = 'Hippoglossoides_elassodon'; % Wikipedia
metaData.links.id_ADW = 'Hippoglossoides_elassodon'; % ADW
metaData.links.id_Taxo = '46940'; % Taxonomicon
metaData.links.id_WoRMS = '274289'; % WoRMS
metaData.links.id_fishbase = 'Hippoglossoides-elassodon'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippoglossoides_elassodon}}';
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
bibkey = 'Stra2004'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2004.00356.x}, ' ...
'author = {J. W. Stark}, ' ... 
'year = {2004}, ' ...
'title = {A comparison of the maturation and growth of female flathead sole in the central {G}ulf of {A}laska and south-eastern {B}ering {S}ea}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {64}, ' ...
'pages = {876-889}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hippoglossoides-elassodon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

