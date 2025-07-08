function [data, auxData, metaData, txtData, weights] = mydata_Rhinecanthus_aculeatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Balistidae';
metaData.species    = 'Rhinecanthus_aculeatus'; 
metaData.species_en = 'White-banded triggerfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 27];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'VaitMala2015: 2.5 yrs';

data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 30;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.95e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MacK2008';
  comment.Wwb = 'based on egg diameter of 0.62 mm of Balistes_capriscus: pi/6*0.062^3';
data.Wwi = 762.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.03236*Li^2.96, see F1';

data.Ri  = 6.5e4/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Odonus_niger: 3e5*(30/50)^3';
  
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm)
    0    4.52  5.32 % settlement
    0.5  6.57  6.87
    1.5 11.35 11.74
    2.5 13.01 13.44
    3.5 13.47 14.80
    4.5 14.36 16.35
    5.5 14.83 17.59
    6.5 15.06 17.03
    7.5 15.09 18.25
    8.5 15.05 18.14
    9.5 15.34 19.22
   10.5 NaN   19.34
   11.5 NaN   NaN
   12.5 NaN   18.60
   13.5 NaN   19.54];
data.tL_fm(:,1) = 365*(data.tL_fm(:,1)+0.5); 
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm    = C2K(27.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'KunzTach2012'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'this data set is the means of tL_f and tL_m over time';
%
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.001	3.355
0.002	6.195
0.015	2.434
0.016	3.835
0.045	5.494
0.476	8.926
0.489	6.382
0.490	8.410
0.503	4.722
0.504	5.497
0.532	7.046
0.533	7.414
0.534	9.811
1.478	8.710
1.480	11.770
1.493	9.779
1.508	10.443
1.509	12.914
1.510	13.577
1.524	12.692
1.525	13.135
2.455	13.988
2.468	12.218
2.483	12.587
2.484	14.725
2.497	13.251
2.510	10.670
2.511	11.186
3.472	15.210
3.498	10.564
3.499	12.629
3.500	13.846
3.514	14.215
3.529	14.620
4.515	12.671
4.516	13.077
4.517	13.925
4.518	15.584
4.519	16.322
4.531	14.958
5.475	13.119
5.491	16.474
5.506	17.064
5.516	13.783
5.517	14.115
5.518	14.631
5.519	14.852
5.533	15.147
5.563	16.807
6.507	15.595
6.520	14.341
6.521	15.115
6.536	16.332
7.480	14.494
7.495	16.153
7.523	15.121
7.538	15.674
7.551	14.826
8.496	14.573
8.497	15.826
8.511	16.122
8.525	15.384
8.539	13.872
9.527	15.094
9.541	14.578
9.542	15.906];
data.tL_f(:,1) = 365*(data.tL_f(:,1)+0.5); 
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(27.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KunzTach2012';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.028	2.249
0.029	3.134
0.014	2.692
0.013	4.277
0.002	4.535
0.016	5.052
0.017	6.711
0.044	3.651
0.420	10.105
0.447	8.041
0.448	9.221
0.460	5.718
0.475	6.677
0.517	5.202
1.466	12.508
1.482	14.204
1.493	9.447
1.509	12.139
1.523	11.365
2.484	15.647
2.485	15.869
2.497	13.324
3.484	12.150
3.501	15.985
3.502	18.455
3.513	11.449
3.530	17.201
4.490	17.833
4.491	18.202
4.515	11.786
4.519	18.755
4.532	16.949
4.533	19.014
4.546	16.064
5.478	18.760
5.479	19.350
5.491	17.286
5.507	19.056
5.508	20.272
5.534	17.065
5.535	18.503
6.465	16.959
6.479	17.143
6.509	18.581
6.522	17.512
6.535	15.226
6.537	17.881
6.538	18.176
6.539	18.840
7.509	15.121
7.511	18.771
7.524	16.743
7.525	18.255
7.553	18.476
7.568	19.030
7.583	20.320
8.484	17.744
8.498	18.629
8.512	18.297
8.513	19.330
8.526	17.449
8.527	18.076
8.569	17.007
9.487	20.662
9.499	16.901
9.516	20.330
10.560	19.340
12.492	18.429
12.549	17.618
12.550	19.978
13.538	19.577];
data.tL_m(:,1) = 365*(data.tL_m(:,1)+0.5); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(27.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KunzTach2012';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
2.037	0.904
2.652	1.808
3.299	0.904
3.622	0.000
4.334	3.617
4.883	3.617
5.239	5.425
5.789	9.042
6.241	10.850
6.726	12.658
7.308	18.987
7.632	16.275
8.181	21.700
8.343	24.412
8.763	28.933
9.538	49.729
9.700	41.591
10.087	52.441
10.443	45.208
10.604	67.812
10.605	54.250
10.992	59.674
11.088	77.758
11.089	67.812
11.347	68.716
11.542	63.291
11.800	78.662
11.831	91.320
12.220	75.045
12.381	82.278
12.445	100.362
12.511	80.470
12.607	88.608
12.867	70.524
12.898	99.457
12.994	117.541
13.028	90.416
13.253	106.691
13.317	114.828
13.769	132.911
13.802	125.678
13.803	102.170
13.868	98.553
13.926	200.723
13.930	141.049
13.932	110.307
13.994	152.803
14.124	137.432
14.125	122.061
14.254	130.199
14.256	109.403
14.448	139.240
14.547	106.691
14.770	160.940
14.773	116.636
14.967	105.787
15.095	132.007
15.158	151.899
15.220	192.586
15.255	162.749
15.286	170.886
15.290	121.157
15.512	190.778
15.580	139.240
15.640	212.477
15.705	196.203
15.868	174.503
15.869	160.940
15.870	155.515
15.898	214.286
15.964	195.298
16.096	158.228
16.226	145.570
16.253	224.231
16.320	187.161
16.418	175.407
16.512	220.615
16.580	172.694
16.742	162.749
16.770	229.656
16.902	198.915
16.930	260.398
16.967	188.969
17.031	207.957
17.065	173.599
17.158	236.890
17.194	179.928
17.351	256.781
17.385	229.656
17.419	207.052
17.454	155.515
17.480	263.110
17.610	250.452
17.643	242.315
17.872	199.819
18.031	245.027
18.129	230.561
18.131	196.203
18.159	258.590
18.290	238.698
18.320	267.631
18.450	255.877
18.711	226.944
18.803	308.318
18.806	257.685
18.870	271.248
18.905	231.465
19.063	290.235
19.094	307.414
19.289	299.277
19.322	286.618
19.323	267.631
19.518	256.781
19.835	345.389
20.000	300.181
20.091	397.830
20.191	344.485
20.257	330.018
20.291	303.797
20.548	326.401
20.927	465.642];
units.LW   = {'cm', 'g'};  label.LW = {'fork length', 'weight'};  
bibkey.LW = 'KunzTach2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 50 * weights.tL_fm;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.03236*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S7KL'; % Cat of Life
metaData.links.id_ITIS = '173203'; % ITIS
metaData.links.id_EoL = '46570689'; % Ency of Life
metaData.links.id_Wiki = 'Rhinecanthus_aculeatus'; % Wikipedia
metaData.links.id_ADW = 'Rhinecanthus_aculeatus'; % ADW
metaData.links.id_Taxo = '47015'; % Taxonomicon
metaData.links.id_WoRMS = '219890'; % WoRMS
metaData.links.id_fishbase = 'Rhinecanthus-aculeatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinecanthus_aculeatus}}';
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
bibkey = 'KunzTach2012'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10872-012-0137-5}, ' ...
'author = {K\"{u}nzli, F. and Tachihara, K.}, ' ... 
'year = {2012}, ' ...
'title = {Validation of age and growth of the {P}icasso triggerfish ({B}alistidae: \emph{Rhinecanthus aculeatus}) from {O}kinawa {I}sland, {J}apan, using sectioned vertebrae and dorsal spines}, ' ...
'journal = {J Oceanogr}, ' ...
'volume = {68}, ' ...
'pages = {817–829}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacK2008'; type = 'Phdthesis'; bib = [ ... 
'author = {C. MacKichan Simmons}, ' ... 
'year = {2008}, ' ...
'title = {Gray triggerfish \emph{Balistes capriscus}, reproductive behaviour, early life history, and competitive iteractions between red snapper, \emph{Lutjanus campechanus}, in the nothern {G}ulf of {M}exico}, ' ...
'school = {Auburn University}, ' ...
'volume = {59}, ' ...
'pages = {231--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhinecanthus-aculeatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

