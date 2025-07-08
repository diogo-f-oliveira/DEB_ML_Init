function [data, auxData, metaData, txtData, weights] = mydata_Paracaesio_caerulea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Paracaesio_caerulea'; 
metaData.species_en = 'Japanese snapper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 24];

%% set data
% zero-variate data

data.am = 60*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'UehaEbis2020';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 30; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate fork length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: pi/6*0.085^3'; 
data.Wwp = 403;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01259*Lp^3.05, see F1';
data.Wwi = 1914; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.05, see F1';

data.Ri  = 1.7e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Lutjanus_carponotatus: 749e3*1914/859';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.133	20.429
1.785	21.161
2.036	25.721
2.171	24.080
2.435	22.622
2.553	28.640
2.692	24.811
2.963	20.435
3.217	23.536
3.463	30.832
3.733	26.820
3.861	28.280
4.135	22.627
4.239	34.481
4.259	25.545
4.260	25.181
4.374	32.476
4.640	30.653
4.642	29.559
4.655	23.723
4.763	33.936
4.892	35.030
5.145	38.861
5.268	42.326
5.297	29.196
5.412	36.309
5.423	31.202
5.682	32.115
5.809	34.121
5.925	40.869
6.060	38.864
6.090	25.186
6.473	29.382
6.586	37.589
6.713	39.231
6.852	35.401
6.999	27.924
7.116	34.125
7.245	34.855
7.763	37.228
7.765	36.316
8.028	35.405
8.041	29.569
8.424	33.947
8.539	40.877
8.682	35.224
9.064	40.150
9.199	38.144
9.321	42.156
9.597	35.227
9.718	39.969
10.249	35.959
10.771	36.690
11.158	39.062
11.413	41.798
11.417	39.974
11.820	34.869
12.077	37.058
12.717	43.443
12.982	41.438
13.511	38.704
14.160	41.077
14.294	39.254
15.599	40.534
16.128	37.618
16.254	39.807
17.036	40.721
18.222	36.348
19.255	42.187
20.952	43.286
22.259	43.290
23.313	39.828
24.219	43.843
29.832	47.507
29.838	44.590
32.973	45.876
33.113	41.317
34.012	48.797
35.056	49.529
36.107	47.344
37.023	46.617
37.027	44.976
38.845	50.635
40.287	48.816
41.994	45.174
44.082	46.639
45.245	52.843
50.098	45.198
53.232	47.031];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(19);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'UehaEbis2020';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.006	17.972
1.255	23.658
1.404	15.583
1.524	20.169
2.027	29.339
2.168	24.751
2.427	25.666
2.564	22.912
2.692	24.379
3.200	30.980
3.209	26.943
3.461	31.344
3.477	24.005
3.718	33.360
3.726	29.507
3.731	27.305
4.244	31.704
4.260	24.365
4.511	29.133
4.520	25.096
4.758	35.736
4.762	34.085
4.778	26.562
5.157	32.980
5.167	28.393
5.440	23.069
5.670	37.196
5.697	25.085
5.830	23.983
6.069	34.073
6.205	31.686
6.216	26.548
6.324	37.190
6.341	29.300
6.457	36.271
7.258	28.557
7.367	38.465
7.373	35.712
7.382	31.492
7.502	36.261
7.514	30.757
7.526	25.252
7.638	33.875
8.018	39.376
8.682	34.966
9.199	37.347
9.208	33.493
9.597	34.958
10.111	38.990
10.246	36.970
10.368	41.006
10.382	34.584
11.283	40.997
11.553	36.958
11.556	35.674
12.060	44.477
12.199	40.439
12.213	33.833
12.351	30.712
12.464	38.968
12.587	42.270
13.125	35.476
13.382	37.308
14.284	43.355
14.419	41.703
14.946	39.679
15.335	40.960
16.383	40.217
16.511	41.316
17.681	44.058
18.081	40.568
18.201	45.521
19.262	38.722
19.395	37.620
20.306	39.263
21.219	40.356
21.474	43.106
21.875	39.065
21.999	42.183
23.970	37.395
25.264	43.438
27.362	40.666
31.020	41.550
32.185	46.861
33.501	42.628
37.420	43.877
38.330	46.437
45.524	44.353
48.398	45.061
49.184	44.503
50.349	49.813
50.485	47.243
59.644	43.123];
data.tL_m(:,1) = 365 * data.tL_m(:,1);  % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(19);  units.temp.tL_m = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_m = 'UehaEbis2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
F1 = 'weight-length relationship: Ww in g = 0.01259*(TL in cm )^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CN9D'; % Cat of Life
metaData.links.id_ITIS = '643076'; % ITIS
metaData.links.id_EoL = '46580823'; % Ency of Life
metaData.links.id_Wiki = 'Paracaesio_caerulea'; % Wikipedia
metaData.links.id_ADW = 'Paracaesio_caerulea'; % ADW
metaData.links.id_Taxo = '182638'; % Taxonomicon
metaData.links.id_WoRMS = '278684'; % WoRMS
metaData.links.id_fishbase = 'Paracaesio-caerulea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paracaesio_caerulea}}';
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
bibkey = 'UehaEbis2020'; type = 'article'; bib = [ ...
'doi = {10.1111/jfb.14332}, ' ...
'author = {Uehara, M. and Ebisawa, A. and Ohta, I.}, ' ...
'year = {2020}, ' ...
'title = {Comparative age-specific demography of four commercially important deepwater snappers: Implication for fishery management of a long-lived lutjanid}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {}, '...
'pages = {1-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Paracaesio-caerulea.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
