function [data, auxData, metaData, txtData, weights] = mydata_Parajulis_poecilepterus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Parajulis_poecilepterus'; 
metaData.species_en = 'Multicolorfin rainbowfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 02 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 12]; 

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 34;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 9.7e-5;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'CossHesp2010';
  comment.Wwb = 'based on egg diameter of 570 mumm: pi/6*0.057^3';
data.Wwp = 207;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01202*Lp^3.05, see F1';
data.Wwi = 1.3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.05, see F1';

data.Ri = 2e4/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Bodianus frenchii';

% univariate data
data.tLW = [ ... % time since birth (yr), total length (cm) 
1	 6.009  3.364
2	 8.519 10.898
3	10.549 21.570
4	12.285 36.276
5	13.888 53.947];
data.tLW(:,1) = 365 * (0.8 + data.tLW(:,1)); % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(18);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'HashGush1991'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % total length (cm), weight (g)
2.695	0.000
2.837	0.000
3.014	0.000
3.084	0.181
3.332	0.725
3.544	0.906
3.722	0.725
3.863	0.906
3.970	0.906
4.183	0.544
4.253	1.088
4.395	0.906
4.714	1.269
4.856	1.269
4.963	0.725
5.175	1.088
5.422	1.631
5.564	1.994
5.564	1.994
5.776	1.994
5.953	2.356
6.022	3.444
6.236	2.719
6.340	4.169
6.588	3.988
6.730	4.350
6.764	5.076
6.940	5.801
7.224	5.257
7.293	6.707
7.471	5.982
7.506	6.707
7.611	7.432
7.787	7.795
7.895	6.888
7.963	8.701
7.964	8.338
8.036	7.251
8.069	8.882
8.350	10.151
8.493	9.789
8.599	9.970
8.630	12.689
8.634	10.514
8.776	10.151
8.808	12.326
8.810	11.239
8.877	13.051
8.983	13.595
9.090	13.233
9.091	12.689
9.092	12.145
9.092	11.782
9.160	13.776
9.232	13.233
9.369	15.589
9.374	13.051
9.478	13.958
9.651	16.858
9.826	17.764
9.831	15.045
9.864	16.677
9.932	17.946
9.969	17.402
10.142	19.577
10.145	18.127
10.180	18.489
10.247	20.302
10.422	21.752
10.462	19.396
10.601	20.665
10.639	19.215
10.668	23.021
10.738	23.746
10.744	20.302
10.843	24.290
10.952	22.659
10.955	21.390
10.988	22.659
11.123	26.284
11.124	26.103
11.127	24.471
11.264	27.190
11.267	25.378
11.297	28.278
11.442	26.647
11.515	25.196
11.546	27.734
11.578	30.091
11.677	34.079
11.681	31.541
11.721	29.184
11.722	28.459
11.826	29.728
11.957	35.891
11.998	33.172
12.002	30.634
12.108	31.178
12.136	35.347
12.142	31.722
12.202	37.885
12.207	34.804
12.210	33.172
12.238	37.704
12.283	32.266
12.344	37.523
12.346	36.435
12.450	38.066
12.490	35.347
12.516	40.786
12.559	36.798
12.695	39.879
12.733	38.429
12.766	39.517
12.796	42.961
12.868	42.236
12.969	45.498
12.975	41.873
12.978	40.060
13.072	46.949
13.076	44.955
13.080	42.598
13.188	41.511
13.221	43.323
13.289	44.592
13.357	46.224
13.365	41.692
13.396	44.592
13.461	47.855
13.493	50.030
13.523	52.568
13.568	47.674
13.668	51.118
13.677	46.224
13.742	49.124
13.781	47.130
13.815	48.218
13.838	55.287
13.889	46.405
13.947	53.656
13.988	50.755
14.008	59.094
14.016	54.924
14.155	56.375
14.196	53.474
14.253	60.906
14.258	58.550
14.393	62.356
14.467	60.363
14.509	56.737
14.522	69.607
14.533	63.444
14.576	58.731
14.607	61.269
14.821	60.544
14.852	63.444
14.914	68.157
14.919	65.619
15.007	76.133
15.087	70.876
15.220	75.770
15.223	73.776
15.268	68.520
15.447	67.432
15.471	74.139
15.498	78.671
15.547	71.239
15.641	78.127
15.673	80.483
15.682	75.408
15.807	84.471
15.817	79.033
15.911	86.103
15.957	79.940
16.089	85.378
16.127	83.927
16.222	90.453
16.332	88.459
16.614	89.547
16.641	94.079
16.671	97.341
16.850	96.254
16.915	99.517
16.947	101.873
17.055	100.785
17.303	101.148
17.397	107.674
17.680	108.218
17.694	120.181
18.217	125.438
18.337	118.006];    
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'HashGush1991'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 50 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures has been guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length weight: Ww in g = 0.01202*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6TPY9'; % Cat of Life
metaData.links.id_ITIS = '614097'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Parajulis_poecilepterus'; % Wikipedia
metaData.links.id_ADW = 'Parajulis_poecilepterus'; % ADW
metaData.links.id_Taxo = '691505'; % Taxonomicon
metaData.links.id_WoRMS = '282049'; % WoRMS
metaData.links.id_fishbase = 'Parajulis-poecilepterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Parajulis_poecilepterus}}';
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
bibkey = 'HashGush1991'; type = 'Article'; bib = [ ... 
'author = {Hashimoto, H. and K. Gushima and S. Kakuda}, ' ... 
'year = {1991}, ' ...
'title = {On the age and growth of the labroid fish \emph{Halichoeres poecilopterus} from the {S}eto {N}aikai, {J}apan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {57(8)}, ' ...
'pages = {1457-1462}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Parajulis-poecilepterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

