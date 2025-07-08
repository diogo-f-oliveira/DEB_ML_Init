function [data, auxData, metaData, txtData, weights] = mydata_Plectropomus_areolatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Plectropomus_areolatus'; 
metaData.species_en = 'Squaretail coralgrouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 01];

%% set data
% zero-variate data

data.ab = 3.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 34 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 36.6;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 80;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 650;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^3.04, see F1';
data.Wwi = 7e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.04, see F1';
 
data.GSI = 0.025; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'RhodTayl2013';
  temp.GSI = C2K(28.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.987	42.389
2.003	24.336
2.018	43.740
2.950	47.311
2.966	43.995
2.981	38.469
2.996	43.013
2.996	36.504
3.011	42.522
3.011	37.610
3.011	31.347
3.011	29.996
3.011	28.522
3.011	27.908
3.011	27.171
3.027	42.031
3.027	30.610
3.042	29.259
3.057	40.435
3.959	44.988
3.990	33.690
3.990	38.234
3.990	39.216
3.990	40.199
4.005	31.357
4.005	42.901
4.020	28.532
4.020	29.392
4.020	32.217
4.036	41.673
4.968	40.946
4.968	30.998
4.983	39.963
4.999	39.349
4.999	35.297
4.999	34.806
4.999	33.086
4.999	31.981
5.029	44.139
5.029	42.174
5.029	38.490
5.029	37.139
5.045	45.122
5.977	33.342
5.977	34.202
5.977	34.816
5.977	37.763
5.977	41.079
5.977	46.114
5.977	50.535
5.992	35.307
5.992	47.342
6.008	43.658
6.008	44.763
6.023	42.062
6.940	46.738
6.986	34.580
6.986	32.247
7.001	43.668
7.001	31.633
7.017	40.107
7.017	27.089
7.032	41.826
7.047	32.984
7.093	36.546
7.980	41.468
7.980	39.994
7.995	48.713
8.025	32.503
8.041	33.854
8.958	47.618
8.973	40.373
8.989	34.846
8.989	44.057
9.019	30.180
9.050	45.900
9.967	31.172
9.982	50.453
10.013	32.401
10.013	41.488
10.991	35.604
11.022	46.779
11.985	42.491];
data.tL_f(:,1) = (0.3+data.tL_f(:,1)) * 365;
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'RhodTayl2013'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.306	8.231
0.306	12.529
0.321	9.091
0.352	17.688
0.352	14.126
0.352	10.565
0.367	15.600
0.397	12.162
0.428	14.004
0.443	12.531
0.443	9.583
0.474	10.812
0.489	18.303
0.504	19.900
0.520	11.918
0.550	14.006
0.566	15.234
0.611	18.796
0.627	16.585
0.657	24.814
0.657	21.498
0.657	19.779
0.780	23.096
0.841	25.552
1.009	26.414
2.966	56.030
2.966	50.995
2.981	48.908
2.996	49.768
2.996	46.697
2.996	45.346
3.027	30.119
3.027	26.680
3.944	50.391
3.975	45.602
3.975	46.462
3.975	51.865
3.975	53.216
3.975	54.321
3.990	35.041
3.990	36.637
3.990	48.918
3.990	52.479
4.005	34.550
4.005	27.427
4.005	28.041
4.005	43.883
4.005	55.427
4.020	41.059
4.020	56.655
4.020	58.497
4.953	56.419
4.953	54.454
4.953	52.244
4.953	48.314
4.968	50.033
4.999	46.104
5.014	50.771
5.014	42.665
5.029	55.560
5.029	53.473
5.029	49.666
5.029	47.701
5.029	46.964
5.029	43.402
5.977	51.640
6.023	53.114
6.023	55.448
6.023	57.044
6.038	47.957
6.955	56.931
6.971	55.457
6.986	58.036
6.986	51.773
7.047	50.423
7.047	48.949
7.047	48.212
7.964	60.380
7.980	47.117
7.995	55.468
7.995	52.520
8.010	51.907
8.025	46.012
8.041	48.223
8.989	53.145
9.019	52.162
9.050	49.707
9.997	47.629
10.013	46.769
10.991	54.393
11.006	48.744
12.000	59.684];
data.tL_m(:,1) = (0.3+data.tL_m(:,1)) * 365;
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'RhodTayl2013'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4K5TY'; % Cat of Life
metaData.links.id_ITIS = '551114'; % ITIS
metaData.links.id_EoL = '46579753'; % Ency of Life
metaData.links.id_Wiki = 'Plectropomus_areolatus'; % Wikipedia
metaData.links.id_ADW = 'Plectropomus_areolatus'; % ADW
metaData.links.id_Taxo = '105915'; % Taxonomicon
metaData.links.id_WoRMS = '218263'; % WoRMS
metaData.links.id_fishbase = 'Plectropomus-areolatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plectropomus_areolatus}}';
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
bibkey = 'RhodTayl2013'; type = 'article'; bib = [ ... 
'doi = {10.1111/jfb.12076}, ' ...
'author = {Rhodes, K.L. and B.M. Taylor and C.B. Wichilmel and E. Joseph and R.J. Hamilton and G.R. Almany}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive biology of squaretail coralgrouper \emph{Plectropomus areolatus} using age-based techniques}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {82(4)}, ' ...
'pages = {1333-1350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Plectropomus-areolatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

