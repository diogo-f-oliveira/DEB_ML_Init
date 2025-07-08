function [data, auxData, metaData, txtData, weights] = mydata_Upeneus_moluccensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Upeneus_moluccensis'; 
metaData.species_en = 'Goldband goatfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE', 'MPSW'};
metaData.ecoCode.habitat = {'0pMp', 'piMcb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.6;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Li = 'based on TL of 14 cm, using FL = 0.9 * TL, from foto';
data.Li  = 19.8;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';
  comment.Li = 'based on TL of 22 cm, using FL = 0.9 * TL, from foto';

data.Wwb = 6.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 

data.Ri  = 62e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(27.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [... % time (yr), fork length (cm)
    1 11.30
    2 12.43
    3 13.98
    4 15.35
    5 16.35
    6 17.46]; 
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365;
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(27.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KayaBenl1999';
comment.tL_f = 'data for females'; 
%
data.tL_m = [... % time (yr), fork length (cm)
    1 10.00
    2 11.52
    3 12.90
    4 14.04
    5 15.15]; 
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365;
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(27.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KayaBenl1999';
comment.tL_m = 'data for males'; 

% length-weight
data.LW_f = [... % fork length (cm), weight (g)
8.554	9.916
8.959	9.244
9.087	11.597
9.109	11.261
9.194	11.933
9.258	9.916
9.386	13.613
9.535	10.252
9.578	11.429
9.684	12.941
9.791	12.101
9.855	12.101
9.876	12.941
9.876	14.622
9.940	12.941
9.961	14.622
9.961	15.966
10.004	12.941
10.047	14.958
10.153	13.782
10.196	17.647
10.217	16.134
10.238	14.118
10.238	17.815
10.324	14.286
10.345	17.815
10.388	15.294
10.430	15.126
10.452	16.134
10.473	15.126
10.494	21.681
10.537	15.126
10.537	18.992
10.579	22.857
10.686	16.807
10.729	17.143
10.857	16.303
10.878	21.681
10.942	21.681
10.963	17.143
11.006	23.025
11.048	16.134
11.048	18.992
11.134	18.992
11.155	17.311
11.240	21.176
11.283	21.176
11.326	22.353
11.347	18.992
11.390	22.353
11.411	23.025
11.411	27.059
11.453	22.353
11.496	21.008
11.496	24.034
11.496	24.706
11.539	23.025
11.581	24.034
11.603	24.034
11.709	25.882
11.709	24.874
11.752	23.866
11.795	25.042
11.837	30.924
11.922	22.185
11.922	27.059
11.922	27.731
11.965	32.101
11.986	27.899
12.008	25.210
12.008	26.218
12.008	27.059
12.050	27.899
12.072	27.059
12.072	32.101
12.093	26.050
12.136	28.067
12.221	30.252
12.264	31.933
12.285	25.882
12.349	31.092
12.349	31.933
12.391	29.916
12.391	33.109
12.455	25.042
12.477	33.109
12.498	27.899
12.498	31.933
12.498	33.613
12.498	34.790
12.519	31.092
12.519	37.479
12.541	29.916
12.583	27.059
12.583	26.050
12.626	35.798
12.647	29.916
12.669	30.924
12.690	29.076
12.711	34.118
12.711	32.101
12.733	32.941
12.775	27.059
12.775	34.790
12.775	34.118
12.775	39.160
12.797	37.143
12.797	37.815
12.818	30.924
12.839	33.109
12.839	32.101
12.860	30.084
12.860	35.126
12.882	28.403
12.882	34.118
12.882	40.000
12.946	33.109
12.946	32.269
12.946	30.756
12.967	37.143
12.988	39.328
12.988	40.000
13.010	34.286
13.010	35.126
13.031	36.134
13.031	37.143
13.074	32.269
13.116	33.109
13.116	35.630
13.116	36.134
13.116	37.143
13.180	37.143
13.180	41.345
13.202	37.143
13.202	37.983
13.202	40.000
13.223	28.067
13.223	35.126
13.223	35.294
13.223	39.328
13.244	36.134
13.287	37.143
13.287	37.983
13.287	42.521
13.308	36.134
13.308	39.328
13.308	46.555
13.329	35.126
13.329	34.118
13.372	35.126
13.372	37.143
13.393	35.126
13.393	45.042
13.415	36.134
13.415	38.992
13.415	39.832
13.415	42.857
13.457	33.109
13.457	35.126
13.457	37.143
13.457	41.176
13.479	40.000
13.521	36.303
13.543	41.176
13.564	41.681
13.585	45.210
13.585	45.882
13.585	47.227
13.607	40.168
13.628	34.118
13.628	39.496
13.628	41.176
13.649	37.143
13.692	38.487
13.692	42.689
13.692	52.605
13.713	40.168
13.713	41.681
13.713	43.193
13.756	37.143
13.756	39.496
13.777	38.487
13.777	46.218
13.798	36.134
13.798	40.840
13.798	44.874
13.862	40.840
13.862	41.681
13.862	44.874
13.862	47.059
13.884	37.143
13.884	46.218
13.884	49.076
13.948	44.706
13.969	36.134
13.969	38.151
13.969	42.185
13.969	46.218
13.969	47.059
13.969	49.244
13.990	40.840
13.990	44.706
13.990	47.899
14.012	40.168
14.033	42.185
14.054	38.151
14.054	40.840
14.054	44.706
14.076	47.899
14.097	42.185
14.097	45.210
14.097	49.244
14.118	39.160
14.118	44.706
14.118	51.092
14.140	40.000
14.140	41.008
14.140	47.059
14.161	38.151
14.182	42.185
14.182	44.706
14.182	53.109
14.203	49.244
14.203	53.950
14.225	50.084
14.267	45.210
14.267	50.924
14.289	44.706
14.310	43.529
14.310	46.891
14.310	48.235
14.310	55.798
14.331	49.076
14.353	44.370
14.353	45.210
14.395	42.353
14.395	44.706
14.395	51.261
14.438	41.176
14.438	48.235
14.459	42.353
14.459	49.076
14.459	53.950
14.481	39.160
14.481	44.370
14.481	44.706
14.481	45.210
14.481	47.059
14.481	47.059
14.481	52.605
14.481	62.017
14.502	40.504
14.523	45.882
14.545	43.361
14.545	49.076
14.545	57.311
14.566	40.336
14.566	41.008
14.566	44.370
14.566	48.403
14.566	50.420
14.566	51.261
14.566	53.950
14.587	49.076
14.587	55.294
14.630	53.109
14.651	42.353
14.651	47.059
14.651	48.403
14.651	50.252
14.651	53.950
14.672	57.311
14.694	51.261
14.694	59.160
14.715	49.076
14.736	52.269
14.758	47.059
14.758	55.294
14.779	48.403
14.779	50.252
14.800	49.076
14.822	46.050
14.822	51.261
14.822	52.269
14.843	46.050
14.843	50.252
14.864	44.706
14.864	49.076
14.907	63.361
14.928	46.050
14.928	51.261
14.928	52.101
14.950	55.294
14.971	49.076
14.971	54.286
14.992	44.370
14.992	52.941
14.992	62.017
15.014	50.252
15.014	53.613
15.035	46.050
15.078	49.076
15.078	59.160
15.078	57.983
15.099	48.235
15.099	51.933
15.099	56.975
15.141	50.084
15.141	55.294
15.141	64.034
15.163	51.933
15.163	60.000
15.184	52.941
15.205	50.084
15.205	57.983
15.248	49.244
15.248	49.916
15.248	54.286
15.248	55.966
15.248	58.655
15.248	60.672
15.269	51.092
15.291	58.655
15.333	57.143
15.355	55.966
15.397	52.773
15.397	54.286
15.397	60.000
15.397	62.017
15.419	57.143
15.419	58.655
15.419	60.840
15.461	52.269
15.483	64.034
15.504	49.244
15.504	53.109
15.504	54.622
15.504	73.277
15.504	74.790
15.525	57.143
15.547	60.840
15.568	53.277
15.589	49.244
15.589	54.622
15.589	64.034
15.589	63.361
15.589	64.874
15.610	69.076
15.632	57.311
15.674	60.840
15.717	71.765
15.738	66.050
15.760	56.303
15.781	61.176
15.845	59.160
15.845	66.050
15.888	64.034
15.930	55.294
15.994	64.034
15.994	63.361
16.016	59.160
16.037	70.084
16.058	76.134
16.101	65.378
16.143	65.378
16.143	70.756
16.207	61.176
16.207	67.059
16.229	70.084
16.229	69.244
16.293	61.345
16.484	67.731
16.484	75.126
16.591	74.958
16.676	74.958
16.698	71.261
16.762	74.286
16.911	78.824
16.953	66.050
16.996	75.126
16.996	78.824
17.017	77.143
17.103	76.134
17.273	78.824
17.295	80.000
17.508	89.916
17.614	98.992
17.828	93.445];
units.LW_f   = {'cm','g'};  label.LW_f = {'fork length','wet weight', 'female'};  
bibkey.LW_f = 'KayaBenl1999';
comment.LW_f = 'data for females'; 
%
data.LW_m = [... % time (yr), fork length (cm)
8.485	8.047
8.560	7.920
8.711	9.197
9.011	12.007
9.012	9.836
9.013	8.175
9.069	9.836
9.276	10.858
9.295	9.197
9.312	13.285
9.371	9.197
9.388	12.135
9.389	10.219
9.406	13.285
9.426	11.241
9.484	10.091
9.500	14.307
9.539	12.901
9.615	11.113
9.690	12.263
9.710	9.836
9.728	10.985
9.784	13.923
9.784	12.263
9.993	10.985
10.045	18.011
10.068	10.985
10.086	12.263
10.104	14.818
10.144	10.985
10.180	13.029
10.196	17.883
10.198	14.818
10.199	13.923
10.216	16.989
10.216	15.967
10.256	12.135
10.293	13.029
10.369	13.029
10.423	16.734
10.443	15.073
10.461	18.011
10.482	13.923
10.499	15.839
10.517	19.033
10.519	15.073
10.554	19.927
10.556	15.839
10.594	15.073
10.595	14.051
10.630	19.033
10.630	18.139
10.669	16.861
10.685	20.949
10.724	19.033
10.744	17.372
10.761	19.927
10.781	18.139
10.799	20.949
10.802	14.051
10.803	13.029
10.818	19.033
10.968	21.715
10.968	20.949
10.969	19.927
10.989	16.989
11.023	24.015
11.064	18.905
11.122	16.861
11.139	18.905
11.174	24.015
11.177	18.139
11.195	20.949
11.195	19.927
11.269	22.993
11.274	14.307
11.345	23.120
11.364	21.332
11.401	24.015
11.476	24.015
11.478	21.204
11.478	20.182
11.494	25.036
11.552	22.993
11.553	22.099
11.646	24.015
11.665	23.248
11.666	21.971
11.700	28.102
11.721	25.036
11.741	22.993
11.759	24.015
11.854	24.015
11.873	22.993
11.968	20.821
12.021	27.847
12.022	26.186
12.097	27.847
12.152	29.891
12.172	27.847
12.195	21.332
12.266	28.869
12.269	24.142
12.304	27.847
12.363	24.015
12.379	30.018
12.455	27.847
12.476	25.036
12.492	29.124
12.567	30.018
12.698	32.062
12.699	30.912
12.700	29.124
12.774	32.062
12.794	30.018
12.852	27.080
12.887	32.701
12.946	28.102
12.963	31.040
12.998	36.150
13.018	34.745
13.038	31.040
13.111	36.788
13.112	34.745
13.169	33.084
13.432	36.277
13.488	37.299
13.526	36.277
13.581	39.854
13.582	36.916
14.012	44.964
14.199	48.668
14.241	40.237
14.577	47.391
15.382	58.887
16.097	61.825];
units.LW_m   = {'cm','g'};  label.LW_m = {'fork length','wet weight', 'male'};  
bibkey.LW_m = 'KayaBenl1999';
comment.LW_m = 'data for males'; 

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  


%% Links
metaData.links.id_CoL = '7DLS5'; % Cat of Life
metaData.links.id_ITIS = '620968'; % ITIS
metaData.links.id_EoL = '46578741'; % Ency of Life
metaData.links.id_Wiki = 'Upeneus_moluccensis'; % Wikipedia
metaData.links.id_ADW = 'Upeneus_moluccensis'; % ADW
metaData.links.id_Taxo = '189739'; % Taxonomicon
metaData.links.id_WoRMS = '126989'; % WoRMS
metaData.links.id_fishbase = 'Upeneus-moluccensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Upeneus_moluccensis}}';
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
bibkey = 'KayaBenl1999'; type = 'Article'; bib = [ ... 
'author = {Murat Kaya and H. Avni Benli and Tuncer Katagan and Okan Ozaydin}, ' ... 
'year = {1999}, ' ...
'title = {Age, growth, sex-ratio, spawning season and food of golden banded goatfish, \emph{Upeneus moluccensis} {B}leeker (1855) from the {M}editerranean and south {A}egean {S}ea coasts of {T}urkey}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {41}, ' ...
'pages = {317-328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Upeneus-moluccensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
