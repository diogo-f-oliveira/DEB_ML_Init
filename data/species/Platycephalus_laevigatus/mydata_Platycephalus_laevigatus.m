function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_laevigatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_laevigatus'; 
metaData.species_en = 'Rock flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
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
  temp.ab = C2K(17.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulHall2017';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 26.4; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.9 mm of P indicus: pi/6*0.09^3'; 
data.Wwi = 767; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.04, see F1';

data.GSI  = 0.06;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'CoulHall2017';   
  temp.GSI = C2K(17.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.234	11.780
0.881	19.484
1.010	21.297
2.573	34.891
2.699	37.611
2.826	40.482
2.843	32.472
2.964	38.063
3.234	36.097
3.357	40.479
3.751	42.140
3.891	38.965
4.028	36.849
4.548	41.985
4.551	40.625
4.805	45.913
4.812	42.890
4.825	36.845
4.936	46.668
4.941	44.552
5.340	43.946
5.352	38.505
5.482	40.015
5.753	37.294
5.863	47.872
6.006	42.884
6.009	41.524
6.134	44.999
6.147	39.256
6.276	40.918
6.403	43.789
6.531	45.904
6.676	40.160
6.785	50.739
6.927	46.809
6.935	42.880
6.939	41.368
7.076	39.554
7.080	37.438
7.189	48.168
7.464	43.784
7.730	43.631
7.850	49.525
7.984	48.920
7.998	42.421
8.131	42.722
8.253	47.407
8.256	45.896
8.378	50.882
8.520	46.499
8.527	43.476
8.531	41.662
8.657	44.685
9.040	51.484
9.312	48.762
9.459	42.262
9.576	49.365
9.584	45.587
9.720	44.075
10.104	50.874
10.509	47.849
10.515	44.977
10.522	41.955
10.631	52.534
10.768	50.719
10.910	46.487
11.309	46.182
11.424	53.890
11.435	49.053
11.439	47.391
11.563	51.320
11.580	43.612
11.990	38.320
12.362	50.107
12.367	47.991
12.370	46.479
12.497	49.199
12.617	54.639
12.627	50.256
12.633	47.385
13.285	52.974
13.287	52.218
13.311	41.336
13.554	51.310
13.966	45.262
14.213	53.422
14.476	54.781
14.489	48.736
14.619	49.793
14.760	46.316
15.282	50.394
15.938	53.867
15.946	50.240
15.953	46.915
16.999	54.013
17.272	50.989
17.530	54.010
17.533	52.650
17.541	49.023
18.596	52.191
18.600	50.378
19.269	48.107
20.714	55.052
24.696	55.032];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(17.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHall2017';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.133	12.368
0.533	17.497
1.867	32.277
2.000	24.590
2.267	36.953
3.067	34.695
3.333	39.069
3.867	37.865
3.868	34.549
4.000	36.811
4.267	32.742
4.533	39.376
4.667	33.196
4.800	35.307
4.933	34.102
5.067	37.268
5.068	38.625
5.200	40.133
5.201	35.912
6.000	39.534
6.001	37.122
6.002	35.012
6.400	34.260
6.667	40.442
6.800	42.101
6.801	37.880
7.067	36.072
7.200	41.199
7.867	45.272
7.868	38.036
8.000	37.283
8.001	35.776
8.267	42.712
8.268	38.943
8.400	40.149
8.667	41.960
8.933	36.986
9.067	43.922
9.467	41.210
9.600	36.387
9.733	38.799
10.133	39.706
10.267	38.500
10.533	43.778
10.667	37.598
10.800	40.312
11.467	41.522
11.468	38.356
11.733	39.563
11.867	43.333
11.868	35.946
12.000	42.429
12.667	44.995
12.800	39.418
13.200	41.681
13.600	43.643
13.733	36.558
13.867	39.272
14.000	34.298
14.133	41.987
14.267	44.249
14.268	37.616
14.267	40.179
14.933	42.444
15.067	45.007
15.068	40.635
15.067	38.374
16.000	44.710
16.001	42.449
16.002	39.434
16.533	45.617
16.800	41.699
18.000	47.132
18.267	41.857
19.200	46.686
19.733	40.659
19.734	45.633
19.867	42.770
20.267	46.541
20.800	40.212
21.067	45.037
22.133	40.821];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(17.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
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
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic to southern Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '77PMW'; % Cat of Life
metaData.links.id_ITIS = '167160'; % ITIS
metaData.links.id_EoL = '46568557'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus_laevigatus'; % Wikipedia
metaData.links.id_ADW = 'Platycephalus_laevigatus'; % ADW
metaData.links.id_Taxo = '183992'; % Taxonomicon
metaData.links.id_WoRMS = '274659'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-laevigatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus_laevigatus}}';
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
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-laevigatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
