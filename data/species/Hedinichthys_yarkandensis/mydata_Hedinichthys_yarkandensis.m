  function [data, auxData, metaData, txtData, weights] = mydata_Hedinichthys_yarkandensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Hedinichthys_yarkandensis'; 
metaData.species_en = 'Kashgarian loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 17];

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'WangYao2023';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3;       units.Lp = 'cm'; label.Lp = 'std length at puberty';            bibkey.Lp = 'WangYao2023';
data.Li = 18.3;    units.Li = 'cm'; label.Li = 'ultimate std length';              bibkey.Li = 'WangYao2023';
  comment.Li = 'TL 19.5 cm; fishbase gives TL 30 cm';
data.Lim = 16;     units.Lim = 'cm'; label.Lim = 'ultimate std length for males'; bibkey.Lim = 'WangYao2023';

data.Wwb = 1.1e-4; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'WangYao2023';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwi = 114;    units.Wwi = 'g';  label.Wwi = 'ultimate weight';               bibkey.Wwi = 'WangYao2023';
data.Wwim = 50;    units.Wwim = 'g';  label.Wwim = 'ultimate weight for males';  bibkey.Wwim = 'WangYao2023';
 
data.Ri = 56320 /365;  units.Ri = '#/d';  label.Ri = 'Reprod rate max size';       bibkey.Ri = 'WangYao2023';
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tLW = [ ... % time since birth (yr), std length (cm), weight (g)
    1  5.764  2.98
    2  7.391  5.94
    3 10.000 14.58
    4 12.205 25.92
    5 15.908 52.09
    6 17.121 71.73
    7 17.724 72.44];
data.tLW (:,1) = (.5 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'std length', 'weight'};  
temp.tLW = C2K(11);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
treat.tLW = {1, {'total length', 'weight'}};
bibkey.tLW = 'WangChen2023';

% length-weight
data.LWw = [ ... % std length (cm), wet weight (g)
4.289	1.390
4.631	2.884
4.711	1.847
4.752	0.958
4.913	2.299
4.973	1.707
5.054	2.006
5.134	2.602
5.356	0.976
5.436	3.205
5.456	4.393
5.557	1.427
5.597	1.725
5.617	3.359
5.779	3.066
5.960	4.259
6.020	2.332
6.040	4.855
6.081	1.888
6.121	4.709
6.141	3.671
6.242	3.525
6.342	3.528
6.383	5.904
6.483	3.533
6.544	5.167
6.604	5.020
6.745	3.540
6.846	5.473
6.906	4.436
7.007	3.400
7.027	3.697
7.047	6.073
7.087	6.222
7.268	7.415
7.289	4.447
7.369	6.527
7.510	5.344
7.591	7.276
7.651	5.052
7.651	9.801
7.711	6.686
7.752	8.617
7.792	9.212
7.812	5.947
7.953	4.764
7.993	9.811
8.013	6.695
8.054	8.032
8.215	5.662
8.336	7.001
8.376	10.713
8.416	8.488
8.557	7.305
8.577	4.634
8.617	9.236
8.658	10.722
8.738	11.763
8.738	12.653
8.779	11.022
8.799	7.757
8.839	9.391
8.940	9.988
9.000	11.919
9.040	13.553
9.040	8.507
9.081	10.586
9.101	16.226
9.141	12.220
9.181	14.744
9.201	9.253
9.221	10.738
9.242	9.106
9.322	12.819
9.342	8.070
9.362	10.297
9.383	10.001
9.483	15.792
9.564	10.303
9.604	9.117
9.624	14.164
9.705	16.986
9.725	12.831
9.785	17.434
9.826	14.912
9.846	18.030
9.926	15.954
9.946	11.353
9.987	15.214
10.027	11.950
10.087	17.740
10.087	12.842
10.107	15.069
10.188	16.555
10.228	18.486
10.268	17.894
10.309	12.403
10.329	14.185
10.349	15.670
10.409	11.219
10.470	19.978
10.470	17.158
10.570	17.606
10.611	13.451
10.631	20.428
10.691	22.507
10.691	14.641
10.691	10.633
10.711	16.274
10.792	19.097
10.812	21.769
10.872	18.357
10.913	15.538
10.933	20.437
10.973	17.469
10.993	26.078
11.034	21.330
11.074	20.144
11.094	23.113
11.114	24.153
11.134	21.778
11.154	18.959
11.154	16.436
11.215	14.953
11.295	21.635
11.315	17.776
11.336	24.604
11.336	22.823
11.356	28.019
11.416	20.154
11.456	24.460
11.517	26.094
11.557	23.127
11.638	24.910
11.658	23.130
11.658	19.419
11.718	28.623
11.819	25.064
11.859	22.245
11.859	20.612
11.980	23.288
11.980	24.030
12.000	27.444
12.121	26.260
12.141	30.417
12.161	21.957
12.181	32.496
12.383	35.322
12.383	24.339
12.403	33.245
12.403	30.128
12.463	26.270
12.544	35.475
12.664	30.135
12.664	27.167
12.664	26.128
12.685	22.418
12.705	32.066
12.725	35.777
12.805	31.179
12.826	28.508
12.846	31.922
12.866	33.110
12.866	26.728
12.966	29.996
12.987	26.583
13.007	42.465
13.128	32.524
13.148	30.743
13.248	31.934
13.329	29.710
13.349	35.944
13.631	27.047
13.651	33.133
13.792	39.074
13.872	35.960
13.872	32.695
14.034	35.519
14.134	41.905
14.134	35.077
14.799	44.002
15.201	51.287
15.342	53.369
15.544	48.625
15.685	49.520
15.705	54.567
15.745	52.639
15.805	53.828
16.027	55.912
16.188	50.722
16.248	53.841
16.913	57.423
17.054	58.169
17.154	72.124
17.718	72.883];
units.LWw = {'cm', 'g'}; label.LWw  = {'std length', 'wet weight'};  
bibkey.LWw = 'WangChen2023';

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic to the Tarim River system';
metaData.bibkey.F1 = 'WangYao2023'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6LH8D'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '209525'; % Ency of Life
metaData.links.id_Wiki = 'Hedinichthys_yarkandensis'; % Wikipedia
metaData.links.id_ADW = 'Barbatula_yarkandensis'; % ADW
metaData.links.id_Taxo = '1802822'; % THedinichthys_yarkandensisaxonomicon
metaData.links.id_WoRMS = '1026803'; % WoRMS
metaData.links.id_fishbase = 'Hedinichthys-yarkandensis'; % fishbase

%% References
bibkey = 'WangChen2023'; type = 'Article'; bib = [ ... 
'doi = {10.3390/w15162948}, ' ...
'author = {Xin-Yue Wang and Sheng-Ao Chen and Yong Song and Cheng-Xin Wang and Fei Liu}, ' ...
'year = {2023}, ' ...
'title = {Age and Growth of \emph{Hedinichthys yarkandensis} ({D}ay, 1877) in the {H}otan {R}iver}, ' ... 
'journal = {Water}, ' ...
'volume = {15}, '...
'pages = {2948}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WangYao2023'; type = 'Article'; bib = [ ... 
'doi = {10.17582/journal.pjz/20230217050218}, ' ...
'author = {Xinyue Wang and Na Yao and Chengxin Wang and Shengao Chen and Yong Song and Fangze Zi and Jianmin Ge and Congxin Xie}, ' ...
'year = {2023}, ' ...
'title = {Reproductive Biology of \emph{Triplophysa (Hedinichthys) Yarkandensis} ({D}ay) in the {T}arim {R}iver, {C}hina}, ' ... 
'journal = {Pakistan J. Zool.}, ' ...
'volume = {15}, '...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hedinichthys-yarkandensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
