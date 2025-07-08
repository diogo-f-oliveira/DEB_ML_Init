function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_aurimaculatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_aurimaculatus'; 
metaData.species_en = 'Toothy flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

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
  temp.ab = C2K(16.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Cott1999';   
  temp.am = C2K(16.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 30; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Cott1999'; 
data.Li  = 55;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Cott1999';
  comment.Wwb = 'based egg diameter of 0.5 mm: pi/6*0.05^3'; 
data.Wwi = 1953; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.536	26.750
1.822	22.078
1.948	24.916
2.073	27.957
2.135	29.984
2.137	24.506
2.262	28.359
2.323	33.633
2.326	27.546
2.326	25.923
2.386	32.820
2.387	30.994
2.413	44.182
2.417	34.848
2.423	21.051
2.424	18.413
2.446	39.717
2.448	36.877
2.451	29.978
2.454	23.079
2.481	33.832
2.481	32.412
2.512	34.238
2.541	40.527
2.575	35.657
2.576	33.628
2.610	28.352
2.640	30.380
2.734	33.219
2.769	25.305
2.769	24.290
2.797	33.217
2.800	26.116
2.831	26.724
2.863	27.738
2.864	23.680
3.046	40.314
3.052	28.140
3.053	24.893
3.111	37.675
3.114	31.385
3.140	42.949
3.142	39.297
3.148	26.312
3.212	24.484
3.301	36.048
3.302	34.627
3.302	34.627
3.303	31.178
3.331	39.902
3.364	37.264
3.367	29.351
3.369	26.104
3.401	25.292
3.457	40.305
3.488	41.319
3.489	38.884
3.491	36.247
3.492	32.595
3.519	43.753
3.519	42.536
3.522	37.463
3.553	37.057
3.555	32.999
3.581	45.172
3.586	34.825
3.587	33.607
3.611	50.447
3.617	37.259
3.682	32.388
3.710	41.315
3.740	44.358
3.740	43.546
3.740	43.140
3.741	42.126
3.744	34.415
3.745	33.807
3.802	45.980
3.806	38.269
3.808	32.994
3.869	38.877
3.933	35.832
4.027	38.062
4.057	40.699
4.058	39.482
4.118	46.176
4.119	43.538
4.120	41.915
4.121	40.495
4.153	39.885
4.182	43.943
4.183	42.117
4.190	27.914
4.214	42.725
4.217	37.855
4.217	37.246
4.245	45.565
4.246	42.521
4.342	41.099
4.342	39.070
4.367	54.287
4.402	46.170
4.405	39.475
4.433	49.213
4.434	46.373
4.435	43.532
4.436	42.315
4.438	37.039
4.528	47.385
4.530	43.124
4.531	40.892
4.532	38.660
4.534	34.197
4.560	47.790
4.592	45.355
4.594	42.311
4.598	32.978
4.625	42.108
4.751	43.120
4.780	49.206
4.781	47.989
4.782	44.742
4.784	41.496
4.940	46.159
4.943	37.638
4.973	41.492
4.974	39.057
5.005	42.303
5.036	43.520
5.037	39.868
5.098	45.142
5.129	47.576
5.129	46.156
5.225	43.313
5.226	41.081
5.256	45.138
5.257	41.892
5.381	47.571
5.414	45.338
5.414	44.121
5.415	42.903
5.541	43.307
5.570	48.581
5.603	46.349
5.698	46.753
5.729	46.955
5.730	45.129
5.794	43.707
5.794	42.084
5.795	41.475
5.857	43.503
5.918	48.777
5.950	46.748
6.079	41.875
6.080	40.049
6.138	51.410
6.140	45.932
6.329	48.160
6.454	49.984
6.551	46.532
6.552	43.286
6.580	52.416
6.582	47.952
6.772	47.340
6.866	48.149
6.960	50.379
6.962	44.495
6.963	43.481
6.963	43.075
6.992	47.944
6.993	46.321
7.117	50.985
7.151	45.912
7.339	49.357
7.370	51.994
7.370	51.183
7.433	52.804
7.529	48.744
7.530	47.933
7.594	45.497
7.845	49.144
7.847	45.492
7.875	51.781
7.943	42.243
7.974	43.054
8.004	47.517
8.033	53.198
8.349	52.786
8.539	50.550
8.570	52.984
8.697	51.967
8.697	50.750
8.823	51.356
8.854	53.790
8.856	49.326
9.075	54.191
9.076	51.959
9.077	50.133
9.141	47.900
9.203	51.551
9.234	52.971
9.296	54.187
9.299	47.694
9.422	56.213
9.455	52.155
9.455	51.546
9.519	51.139
9.522	43.023
9.581	53.167
9.612	54.586
9.678	48.904
9.769	55.598
9.772	49.916
9.803	51.742
9.803	50.727
9.929	52.348
9.932	45.855
10.120	48.895
10.150	51.938
10.276	53.761
10.340	51.122
10.369	56.194
10.432	57.410
10.434	52.946
10.845	51.721
10.908	53.951
11.320	51.305
11.602	56.575
11.635	53.531
11.696	56.573
11.885	57.787
12.583	52.294
12.614	53.917
12.709	53.306
12.993	54.112
13.307	57.758
14.034	56.728
14.352	52.461
14.604	54.891
14.824	58.133
14.824	56.915
14.982	57.521
14.983	54.883
16.497	59.722
17.638	53.815];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(16.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Cott1999';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.082	33.271
2.150	24.504
2.151	22.361
2.181	25.088
2.214	22.749
2.307	26.254
2.338	27.422
2.369	28.785
2.369	28.785
2.431	29.953
2.436	20.992
2.438	17.680
2.496	26.250
2.526	29.561
2.650	33.650
2.653	28.195
2.717	27.999
2.778	31.894
2.811	27.997
2.845	23.127
2.846	22.737
2.876	25.659
2.902	35.009
2.940	24.099
3.001	27.604
3.003	23.124
3.067	22.928
3.093	32.278
3.161	24.095
3.189	31.497
3.190	29.354
3.219	34.223
3.221	30.522
3.255	26.041
3.287	25.261
3.379	29.155
3.380	27.207
3.411	28.570
3.440	34.219
3.473	30.907
3.504	32.464
3.536	32.659
3.663	31.098
3.725	33.824
3.759	28.953
3.792	25.056
3.821	30.900
3.823	27.199
3.824	25.835
3.852	31.873
3.888	23.301
3.913	35.768
3.914	33.431
4.038	39.077
4.040	33.818
4.041	32.259
4.071	36.350
4.073	32.648
4.106	29.725
4.109	24.076
4.137	30.699
4.198	34.204
4.231	31.476
4.261	35.177
4.325	32.838
4.451	34.979
4.452	32.641
4.576	36.340
4.607	38.287
4.609	33.612
4.640	34.975
4.642	31.273
4.672	34.974
4.705	32.441
4.735	35.752
4.831	32.244
4.859	39.841
4.893	34.580
4.988	34.578
5.053	31.071
5.116	30.680
5.179	32.237
5.209	34.769
5.239	38.664
5.303	36.715
5.304	34.183
5.336	33.208
5.396	39.441
5.492	36.906
5.556	34.957
5.680	40.409
5.683	35.344
5.683	33.786
5.716	31.253
5.779	33.005
5.804	44.108
5.840	36.899
5.901	41.574
5.932	42.547
5.967	35.144
5.968	33.780
5.996	40.403
5.998	35.922
6.029	37.675
6.126	32.608
6.157	34.556
6.282	36.306
6.284	33.190
6.472	35.718
6.566	38.444
6.975	41.553
7.039	39.603
7.071	38.239
7.104	35.901
7.166	38.822
7.167	36.094
7.200	34.341
7.293	36.871
7.419	38.232
7.889	44.652
7.890	43.873
7.954	41.923
7.988	37.637
8.209	37.633
8.649	42.105
8.964	43.462
9.031	36.253
9.092	41.511
9.092	40.732
9.187	40.146
9.216	44.821
9.217	43.067
9.249	42.677
9.282	39.560
9.283	37.417
9.469	45.011
9.567	39.359
9.567	38.580
9.598	40.528
9.628	42.865
9.721	45.980
9.820	38.380
9.849	43.055
9.884	37.210
9.911	45.781
9.975	44.222
10.009	39.351
10.132	46.167
10.354	43.630
10.356	40.123
10.483	38.562
10.640	42.066
11.020	39.915
11.112	45.563
11.586	43.995
11.587	42.632
11.652	38.929
12.470	46.316
12.502	44.952
12.535	43.392
12.563	50.405
12.565	45.730
12.597	44.560
12.627	47.092
12.818	44.361
12.884	39.490
12.915	40.853
13.101	47.278
13.229	43.963
13.639	46.098
13.640	44.735
13.922	48.236
14.081	46.479
14.619	44.910
14.872	44.126
15.627	50.345
15.979	43.325
16.169	41.374
18.287	40.553];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(16.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Cott1999';
comment.tL_m = 'data for males';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
30.281	27427.607
37.336	224167.123
37.561	430992.335
37.711	297254.188
37.936	345971.292
38.161	279147.855
38.311	127166.464
38.762	145546.617
38.912	103024.686
39.962	310100.900
40.188	346655.841
40.788	438054.604
42.139	116168.036
44.390	682393.126
45.741	701047.099
47.317	373147.905
48.968	1170271.530
49.118	373695.545
51.295	611519.438
51.295	903411.330
55.197	1701219.504];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(16.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Cott1999';

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
metaData.links.id_CoL = '4JP37'; % Cat of Life
metaData.links.id_ITIS = '692099'; % ITIS
metaData.links.id_EoL = '46568549'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus'; % Wikipedia
metaData.links.id_ADW = 'Platycephalus_aurimaculatus'; % ADW
metaData.links.id_Taxo = '183984'; % Taxonomicon
metaData.links.id_WoRMS = '274651'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-aurimaculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'h274651owpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus}}';
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
bibkey = 'Cott1999'; type = 'phdthesis'; bib = [ ... 
'howpublished = {\url{10536/DRO/DU:30027977}}, ' ...
'author = {Jason Peter Edward Cottier}, ' ... 
'year = {1999}, ' ...
'title = {Biology of the toothy flathead, \emph{Neoplatycephalus aurimaculatus}, in Eastern Bass Strait}, ' ...
'school = {Deakin University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-aurimaculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
