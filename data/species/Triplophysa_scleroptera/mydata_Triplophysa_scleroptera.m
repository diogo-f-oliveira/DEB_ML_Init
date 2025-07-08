  function [data, auxData, metaData, txtData, weights] = mydata_Triplophysa_scleroptera
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Triplophysa_scleroptera'; 
metaData.species_en = 'Crested loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 12];

%% set data
% zero-variate data
data.tp = 3*365;      units.tp = 'd';  label.tp = 'age at puberty for females';  bibkey.tp = 'guess';
  temp.tp = C2K(12.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(12.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 22.3;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwi = 160;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';               bibkey.Wwi = 'fishbase';
 
data.Ri = 4000/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'guess';
  temp.Ri = C2K(12.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tLW = [ ... % time since birth (yr), total length (cm), weight (g)
    1  5.83  1.81
    2  8.19  4.58
    3 10.25  8.23
    4 11.62 13.20
    5 13.59 20.14
    6 14.92 25.72
    7 16.32 32.75];
data.tLW (:,1) = (.5 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(12.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
treat.tLW = {1, {'total length', 'weight'}};
bibkey.tLW = 'LiLiu2023';

% length-weight
data.LWw = [ ... % total length (cm), wet weight (g)
5.710	1.645
5.900	1.974
6.384	2.303
6.532	1.974
6.637	2.413
6.869	2.633
6.953	3.071
7.122	2.413
7.290	3.071
7.374	3.510
7.542	3.839
7.774	4.388
7.922	2.742
8.091	2.852
8.132	4.388
8.196	3.510
8.216	5.046
8.321	5.046
8.343	4.278
8.364	3.839
8.406	4.497
8.490	4.936
8.574	5.484
8.638	4.497
8.722	4.936
8.847	6.581
8.870	4.168
8.870	4.058
8.870	3.510
8.911	5.923
8.931	7.459
9.079	6.801
9.143	4.717
9.205	6.143
9.290	5.594
9.331	7.239
9.375	5.155
9.416	6.910
9.436	8.446
9.500	6.362
9.586	4.388
9.690	6.691
9.752	7.678
9.814	9.324
9.837	7.239
9.837	7.239
10.005	8.665
10.006	6.362
10.027	6.910
10.068	8.007
10.088	9.433
10.108	11.079
10.109	10.311
10.131	8.665
10.132	7.239
10.171	12.176
10.217	6.691
10.257	8.665
10.319	10.750
10.319	10.750
10.320	8.885
10.321	7.569
10.342	7.898
10.360	12.614
10.362	9.762
10.449	5.923
10.487	11.408
10.510	9.653
10.574	8.336
10.592	11.956
10.615	9.872
10.638	6.801
10.657	10.420
10.679	9.214
10.720	9.872
10.760	12.943
10.761	11.298
10.762	10.969
10.764	8.007
10.826	9.104
10.827	7.788
10.846	10.201
10.931	9.324
10.972	11.627
10.973	10.091
11.033	14.260
11.035	11.188
11.036	9.653
11.140	12.395
11.204	11.627
11.268	10.640
11.351	11.627
11.372	11.408
11.456	12.395
11.498	13.053
11.560	14.698
11.582	13.053
11.626	10.091
11.645	14.040
11.667	11.956
11.691	8.007
11.750	13.821
11.751	12.724
11.790	16.673
11.793	12.505
11.806	24.241
11.814	13.272
11.878	12.066
11.879	10.311
12.022	16.563
12.024	13.382
12.046	12.176
12.067	13.272
12.086	15.356
12.087	14.260
12.107	15.466
12.130	12.943
12.190	17.770
12.233	16.563
12.257	11.846
12.300	11.298
12.317	16.234
12.341	13.382
12.381	15.247
12.402	15.247
12.467	14.040
12.548	17.660
12.635	13.821
12.654	17.331
12.655	15.686
12.656	14.808
12.740	15.247
12.743	10.311
12.823	16.234
12.884	19.196
12.885	18.318
12.991	16.892
13.034	16.234
13.035	15.247
13.117	18.537
13.117	17.770
13.261	22.925
13.287	16.563
13.412	18.099
13.429	23.254
13.455	16.673
13.474	19.415
13.557	21.828
13.560	17.770
13.561	15.686
13.601	18.757
13.626	13.711
13.768	21.389
13.769	19.525
13.811	20.293
14.018	25.777
14.063	21.060
14.105	22.267
14.254	19.634
14.275	19.854
14.312	27.422
14.357	22.815
14.507	20.073
14.548	21.280
14.591	19.744
14.673	23.583
14.770	35.320
15.115	24.461
15.241	25.009
15.346	25.338
15.427	29.945
15.428	27.751
15.639	27.751
15.679	30.713
16.713	29.506
16.763	47.276
16.850	44.205
17.129	37.294
17.195	33.675
17.842	42.669
18.405	50.018];
units.LWw = {'cm', 'g'}; label.LWw  = {'total length', 'wet weight'};  
bibkey.LWw = 'XuJing2023';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 2 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'unique fish species in the Qinghai–Tibet Plateau, only distributed in the upper Yellow River and Qinghai Lake in China';
metaData.bibkey.F1 = 'LiLiu2023'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58YTB'; % Cat of Life
metaData.links.id_ITIS = '688273'; % ITIS
metaData.links.id_EoL = '213635'; % Ency of Life
metaData.links.id_Wiki = 'Triplophysa_scleroptera'; % Wikipedia
metaData.links.id_ADW = 'Triplophysa_scleroptera'; % ADW
metaData.links.id_Taxo = '189574'; % Taxonomicon
metaData.links.id_WoRMS = '1019752'; % WoRMS
metaData.links.id_fishbase = 'Triplophysa-scleroptera'; % fishbase

%% References
bibkey = 'LiLiu2023'; type = 'Article'; bib = [ ... 
'doi = {10.3390/fishes8090457}, ' ...
'author = {Peilun Li and Jiacheng Liu and Tai Wang and Jilong Wang}, ' ...
'year = {2023}, ' ...
'title = {Estimates of the Age, Growth, and Mortality of \emph{Triplophysa scleroptera} ({H}erzenstein, 1888) in the Upper Reaches of the {Y}ellow {R}iver, {C}hina}, ' ... 
'journal = {Fishes}, ' ...
'volume = {8}, '...
'pages = {457}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Triplophysa-scleroptera}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
