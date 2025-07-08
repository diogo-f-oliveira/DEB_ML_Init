function [data, auxData, metaData, txtData, weights] = mydata_Liopsetta_pinnifasciata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Liopsetta_pinnifasciata'; 
metaData.species_en = 'Far Eastern smooth flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 25]; 

%% set data
% zero-variate data

data.am = 11.7*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'guess';
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 0.95 mm: 4/3*pi*0.0475^3';
  
data.Ri  = 2e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.94 as found typically for this taxon';
 
% uni-variate data
% time-length-weight
data.tLW = [... % time since birth (yr), total length (cm), weight (g)
    1 15.9  38
    2 21.2 100
    3 25.5 163
    4 28.6 273
    5 30.5 339
    6 32.5 387
    7 33.9 418
    8 36.6 468
    9 38.7 517];
data.tLW(:,1) = 365 * (.5 + data.tLW(:,1)); 
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(4); units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'VdovChet2017'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % standard length (cm), weight (g)
2.543	3.640
3.230	3.661
3.505	3.669
4.055	3.685
4.330	3.694
4.948	3.712
6.254	6.127
6.667	6.140
7.148	6.154
7.560	7.354
7.835	7.363
8.454	10.946
8.660	5.010
9.141	9.778
9.553	10.979
9.691	10.983
10.103	14.560
10.997	15.775
11.134	20.532
11.340	11.032
11.753	20.550
12.027	32.441
12.165	24.127
12.234	18.188
12.302	31.261
12.371	13.439
12.509	18.196
12.852	27.713
13.127	22.968
13.196	21.781
13.402	31.294
13.402	24.164
13.746	30.116
13.883	24.178
13.952	37.252
14.089	34.879
14.158	34.881
14.158	32.505
14.502	27.762
14.708	39.651
14.983	33.717
15.120	45.605
15.189	33.724
15.326	44.422
15.464	39.673
15.601	42.054
15.601	40.866
15.670	34.926
16.082	48.010
16.151	40.882
16.426	61.091
16.426	55.150
16.495	37.327
16.838	39.714
16.976	53.978
17.113	51.605
17.251	38.538
17.320	51.611
17.732	62.318
17.869	61.134
17.869	80.147
18.007	54.008
18.076	76.588
18.419	80.163
18.557	51.648
18.557	68.284
18.557	75.414
18.900	94.437
18.900	63.541
18.969	51.660
19.038	70.675
19.175	80.186
19.244	180.005
19.244	101.577
19.244	90.882
19.244	75.435
19.588	101.587
19.588	86.139
20.000	102.788
20.000	73.080
20.206	108.736
20.206	88.534
20.275	76.654
20.412	107.553
20.412	111.118
20.550	151.525
20.550	70.720
20.756	121.823
20.756	93.304
20.825	137.273
20.825	92.118
20.893	102.814
21.031	144.409
21.031	70.734
21.100	121.833
21.100	118.268
21.168	87.375
21.237	113.519
21.375	142.043
21.375	128.971
21.375	121.842
21.512	85.008
21.581	140.860
21.581	108.776
21.718	140.865
21.924	140.871
21.993	99.282
22.062	114.732
22.062	119.485
22.199	161.080
22.199	142.067
22.268	112.362
22.337	143.260
22.405	125.437
22.543	159.902
22.543	136.136
22.680	167.036
22.749	131.389
22.749	111.188
22.955	153.973
22.955	146.843
23.024	130.209
23.093	170.613
23.299	124.275
23.368	174.186
23.505	146.859
23.986	194.405
23.986	175.393
23.986	174.204
23.986	146.873
24.055	180.148
24.055	164.700
24.124	132.618
24.192	197.976
24.192	158.763
24.330	177.779
24.399	202.736
24.399	187.288
24.399	138.568
24.467	183.725
24.536	175.409
24.674	138.576
24.742	161.156
24.811	194.430
24.948	117.195
25.017	219.390
25.017	211.072
25.086	222.957
25.086	199.191
25.223	222.961
25.223	184.936
25.223	154.040
25.361	142.161
25.361	123.148
25.430	201.578
25.498	232.476
25.498	149.295
25.704	218.222
25.704	189.703
25.773	151.680
25.911	189.709
26.048	201.596
26.117	151.690
26.323	226.559
26.529	152.890
26.735	219.441
26.735	179.039
26.873	249.153
26.873	232.517
26.873	199.244
27.079	184.991
27.148	255.103
27.148	251.538
27.148	242.031
27.148	194.499
27.216	214.703
27.216	218.267
27.216	225.397
27.354	151.727
27.423	207.579
27.560	256.303
27.698	227.788
27.766	270.569
27.766	215.907
27.904	290.774
27.973	270.575
28.041	239.681
28.110	265.826
28.385	280.094
29.072	293.185
29.072	232.582
29.141	301.506
29.278	258.731
29.416	223.086
30.103	335.995
30.172	347.880
30.172	264.699
30.241	360.953
31.134	289.682
31.340	264.734
31.546	404.959
31.615	328.910
31.821	439.428
31.821	390.708
31.821	371.695
32.027	471.518
32.027	410.915
32.027	321.792
32.096	443.001
32.096	420.423
32.165	450.133
32.302	446.572
32.302	328.930
32.509	462.026
32.646	350.330
32.852	432.329
32.921	375.292
33.196	489.377
33.196	482.248
33.196	471.553
33.333	376.493
33.402	422.839
33.402	405.014
33.471	448.983
33.814	546.434
34.089	563.079
34.089	484.651
34.227	545.258
34.296	375.333
34.433	527.440
34.502	487.040
34.639	498.927
35.120	605.888
35.739	554.809
35.739	465.687
36.151	460.946
36.289	583.345
37.113	475.234
37.182	527.521
38.694	518.060];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'VdovChet2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Ri = 0 * weights.Ri;

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
F1 = 'Length-weight: Ww in g = 0.00933*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3V7KF'; % Cat of Life
metaData.links.id_ITIS = '1007832'; % ITIS
metaData.links.id_EoL = '46570131'; % Ency of Life
metaData.links.id_Wiki = 'Liopsetta_pinnifasciata'; % Wikipedia
metaData.links.id_ADW = 'Liopsetta_pinnifasciata'; % ADW
metaData.links.id_Taxo = '178922'; % Taxonomicon
metaData.links.id_WoRMS = '275845'; % WoRMS
metaData.links.id_fishbase = 'Liopsetta-pinnifasciata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liopsetta_pinnifasciata}}';
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
bibkey = 'VdovChet2017'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945217030110}, ' ...
'author = {A. N. Vdovin and A. N. Chetyrbotsky and M. I. Boiko}, ' ... 
'year = {2017}, ' ...
'title = {Growth Dynamics of the Barfin Plaice \emph{Liopsetta pinnifasciata} ({P}leuronectidae) in {P}eter the {G}reat {B}ay ({S}ea of {J}apan)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {365-371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Liopsetta-pinnifasciata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
