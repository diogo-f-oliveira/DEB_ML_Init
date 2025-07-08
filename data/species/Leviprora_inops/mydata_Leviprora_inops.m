function [data, auxData, metaData, txtData, weights] = mydata_Leviprora_inops
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Leviprora_inops'; 
metaData.species_en = 'Longhead flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 04];

%% set data
% zero-variate data

data.ab = 10;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(17.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 21*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulHall2017';   
  temp.am = C2K(17.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 27; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 52.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.9 mm of P indicus: pi/6*0.09^3'; 
data.Wwi = 767; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

data.GSI  = 0.05;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'CoulHall2017';   
  temp.GSI = C2K(17.7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.535	13.917
0.536	13.008
0.936	24.518
1.604	21.631
2.674	34.042
2.941	28.736
3.209	36.006
3.342	43.580
3.476	38.730
3.610	44.940
3.743	41.908
3.744	40.090
3.745	39.029
3.746	36.454
3.747	33.423
4.144	49.327
4.145	35.237
4.278	43.871
4.412	38.112
4.813	40.532
4.814	34.622
4.947	45.530
4.948	46.287
5.214	43.102
5.348	53.252
5.481	47.342
5.482	40.372
5.615	52.795
5.616	42.037
5.617	39.310
5.882	41.125
6.016	49.911
6.150	38.546
6.283	48.544
6.551	43.389
6.552	37.632
6.684	55.660
6.685	42.479
6.952	49.900
6.953	46.566
6.954	43.990
7.218	52.927
7.219	45.199
7.353	48.076
7.487	36.257
7.754	54.587
8.021	54.129
8.022	51.705
8.023	47.462
8.155	59.279
8.156	44.733
8.289	48.368
8.422	50.488
8.824	52.150
8.957	57.451
8.958	45.633
9.091	47.601
9.225	55.933
9.758	55.017
9.759	50.775
9.893	49.409
10.027	53.499
10.028	50.923
10.160	55.467
10.161	52.133
10.162	48.497
10.294	56.980
10.829	56.065
10.963	50.457
11.096	52.122
11.497	53.178
11.765	58.629
11.898	57.264
12.166	48.321
13.102	58.916
13.503	64.366
14.037	54.814
14.038	59.662
14.171	57.388
14.305	53.598
14.706	62.230
14.707	53.896
15.241	63.132
15.775	65.247
16.043	56.001
16.176	57.667
16.578	62.813
16.845	61.749
17.380	65.531
18.182	63.248
20.455	63.069
20.989	62.305];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(17.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHall2017';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.598	13.116
0.724	14.623
1.466	27.286
2.777	31.508
3.174	31.960
3.566	33.467
3.847	30.151
3.950	36.935
4.093	34.673
4.880	37.085
5.016	36.332
5.034	32.412
5.159	34.221
5.562	33.166
5.683	35.879
5.780	44.020
5.804	38.593
5.832	32.261
5.943	37.387
6.050	43.266
6.225	33.769
6.329	40.251
6.613	36.181
6.616	35.427
6.738	37.839
6.990	41.156
7.022	33.920
7.380	43.116
7.396	39.497
7.812	35.578
7.817	34.523
8.072	37.085
8.191	40.101
8.314	42.362
8.463	38.744
8.831	45.829
8.873	36.181
8.968	44.774
8.972	43.869
8.997	38.291
9.001	37.387
9.247	41.910
9.250	41.156
9.259	39.196
10.040	43.116
10.187	39.950
10.286	47.487
10.300	44.472
10.310	42.211
10.563	45.075
10.855	39.196
10.978	41.307
11.089	46.432
11.367	43.568
11.788	38.744
11.902	42.965
11.907	41.759
12.155	45.980
12.278	48.090
12.293	44.774
12.401	50.352
12.694	44.322
12.817	46.432
12.835	42.362
13.611	47.487
15.057	51.256
15.360	42.814
15.481	45.528
15.716	52.613
15.748	45.377
16.942	45.829];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(17.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulHall2017';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic to southern Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6Q6ZK'; % Cat of Life
metaData.links.id_ITIS = '644097'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Leviprora_inops'; % Wikipedia
metaData.links.id_ADW = 'Leviprora_inops'; % ADW
metaData.links.id_Taxo = '178814'; % Taxonomicon
metaData.links.id_WoRMS = '281347'; % WoRMS
metaData.links.id_fishbase = 'Leviprora-inops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leviprora_inops}}';
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
bibkey = 'CoulHall2017'; type = 'article'; bib = [ ... 
'doi = {10.1016/j.ecss.2017.03.028}, ' ...
'author = {Peter G. Coulson and Norman G. Hall and Ian C. Potter}, ' ... 
'year = {2017}, ' ...
'title = {Variations in biological characteristics of temperate gonochoristic species of {P}latycephalidae and their implications: {A} review}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {190(5)}, ' ...
'pages = {50-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Leviprora-inops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
