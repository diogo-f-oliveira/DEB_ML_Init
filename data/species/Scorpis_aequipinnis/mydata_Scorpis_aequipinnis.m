function [data, auxData, metaData, txtData, weights] = mydata_Scorpis_aequipinnis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Kyphosidae';
metaData.species    = 'Scorpis_aequipinnis'; 
metaData.species_en = 'Sea sweep'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MISE', 'MPSW'};
metaData.ecoCode.habitat = {'0iMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ap = 10 * 365;  units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = 'CoulPott2012';
  temp.ap = C2K(17);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'based on intepolation of Lp in tL_f data';
data.am = 70*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulPott2012';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 36.3;  units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for females'; bibkey.Lp  = 'CoulPott2012'; 
data.Lpm = 37.9;  units.Lpm  = 'cm';  label.Lpm  = 'fork length at puberty for males'; bibkey.Lpm  = 'CoulPott2012'; 
data.Li  = 43;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'CoulPott2012';
data.Lim = 45;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'CoulPott2012';

data.Wwb = 5.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 to 1.4 mm: pi/6*0.1^3';
data.Wwp = 1100;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'CoulPott2012';
  comment.Wwi = 'based on  exp(2.62*log(10*Lp) - 8.44), see F2';
data.Wwpm = 1232;     units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'CoulPott2012';
  comment.Wwim = 'based on  exp(2.62*log(10*Lpm) - 8.44), see F2';
data.Wwi = 1715;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'CoulPott2012';
  comment.Wwi = 'based on  exp(2.62*log(10*Li) - 8.44), see F2';
data.Wwim = 1932;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'CoulPott2012';
  comment.Wwim = 'based on  exp(2.62*log(10*Lim) - 8.44), see F2';

data.Ri  = 6e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since hatch (d), fork length (cm)
0.380	6.931
1.171	15.859
1.171	16.369
1.487	15.433
1.646	11.011
1.804	8.204
2.595	17.812
2.753	21.893
2.753	22.233
2.753	22.914
2.911	17.386
2.911	18.322
3.228	19.341
3.703	25.973
3.861	19.170
3.861	20.701
4.177	24.442
4.177	26.993
4.177	28.949
4.335	21.891
4.494	27.758
4.494	28.183
4.494	28.608
4.810	30.988
4.968	29.373
4.968	31.328
4.968	33.114
5.127	22.144
5.601	30.732
5.759	31.327
5.759	33.623
5.918	32.007
6.076	31.582
6.234	28.095
6.392	30.646
6.551	28.605
6.551	30.135
6.551	34.132
6.709	34.046
6.867	33.706
7.025	26.393
7.025	28.349
7.025	32.600
7.025	33.196
7.184	29.029
7.500	30.389
7.500	33.025
7.658	33.790
7.816	30.048
7.975	26.731
7.975	35.405
8.133	32.173
8.608	32.343
8.766	30.301
8.766	29.451
8.924	31.066
8.924	35.148
9.557	34.807
9.557	37.953
9.873	31.150
9.873	30.725
9.873	32.681
9.873	32.170
10.032	30.384
10.032	37.612
10.190	34.211
10.190	33.615
10.190	36.166
10.348	35.741
10.665	32.169
10.823	34.720
10.823	37.866
10.823	37.526
11.297	36.505
11.456	33.783
11.456	39.566
11.930	37.524
12.089	32.592
12.089	34.718
12.089	36.078
12.405	40.925
12.880	32.845
12.880	33.101
12.880	36.077
13.196	39.903
13.354	37.096
13.829	37.521
13.829	39.306
14.146	41.177
14.304	33.268
14.304	39.901
14.620	36.329
14.620	36.924
14.620	38.965
14.778	37.774
14.937	33.522
15.570	40.239
15.728	36.327
15.728	37.943
15.886	37.092
15.886	39.558
16.044	34.711
16.361	35.816
16.361	38.707
16.519	37.771
17.468	38.535
17.468	38.875
17.943	39.214
18.734	38.193
18.734	38.533
18.734	39.468
18.892	37.002
18.892	40.573
18.892	40.233
19.051	33.770
19.051	41.253
19.209	37.597
19.367	36.321
19.525	34.960
19.684	37.766
19.684	40.317
19.684	39.552
19.684	39.382
19.842	40.317
20.158	37.510
20.316	36.744
20.475	42.101
20.791	40.825
20.949	39.294
20.949	39.124
21.266	38.528
21.582	41.079
21.741	40.058
21.741	39.378
21.741	39.208
21.899	41.419
22.215	40.228
22.215	42.268
22.532	38.441
22.848	37.931
23.006	38.100
23.165	42.267
23.481	38.270
23.639	39.460
23.797	39.204
23.797	41.075
23.797	41.926
24.114	37.843
24.589	37.162
24.747	37.587
24.747	40.223
24.905	41.669
25.222	41.243
26.013	42.262
26.013	40.391
26.013	39.796
26.329	38.435
26.804	41.410
27.437	41.919
27.437	39.623
27.911	39.282
28.386	37.581
28.544	39.366
28.703	42.938
28.861	41.577
29.019	40.046
29.494	40.045
29.494	40.555
29.494	40.725
29.494	42.936
29.652	41.235
29.652	42.511
30.443	41.744
31.076	43.529
31.392	40.552
31.392	41.232
31.867	46.419
32.500	41.230
32.816	41.655
32.975	42.250
32.975	42.845
33.133	40.209
34.082	44.289
34.240	40.887
34.240	41.228
34.240	42.928
34.715	42.247
34.873	43.607
34.873	43.948
35.032	41.991
35.190	41.226
35.506	40.120
35.665	42.416
36.139	42.670
37.089	40.457
37.405	39.862
38.513	41.475
39.146	43.175
39.778	42.068
40.570	43.173
41.203	41.641
41.361	43.596
41.361	44.277
42.627	41.383
43.101	43.848
43.101	42.913
43.734	39.766
44.051	44.952
44.525	42.826
46.266	41.377
46.582	43.502
48.639	42.053
48.797	45.029
53.861	45.531
54.810	46.975
54.968	42.468
57.816	43.823
59.240	42.290
68.892	43.039];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulPott2012';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since hatch (d), fork length (cm)
0.036	9.671
0.195	10.010
0.672	10.604
0.674	11.198
1.001	14.419
1.304	10.013
1.311	12.386
1.319	14.674
1.799	16.455
1.940	10.862
1.949	13.574
1.950	14.167
1.955	15.692
2.096	10.269
2.262	12.388
2.270	15.015
2.270	15.185
2.764	20.948
2.767	21.965
2.773	23.830
2.774	24.338
2.910	17.220
2.923	21.203
3.073	18.492
3.079	20.610
3.252	25.187
3.579	28.323
3.865	18.494
3.877	22.477
3.880	23.409
3.888	25.951
3.894	27.646
4.029	20.528
4.044	25.274
4.064	31.545
4.526	27.224
5.014	31.462
5.156	26.293
5.163	28.327
5.478	27.735
5.647	31.294
5.811	32.990
5.814	34.091
5.955	28.329
5.960	30.024
5.961	30.448
6.289	33.923
6.622	39.009
6.754	30.873
6.764	33.840
7.079	33.332
7.090	36.806
7.547	31.214
8.012	27.910
8.186	32.741
8.188	33.419
8.349	34.437
8.356	36.470
8.656	31.217
8.672	36.387
8.824	34.183
8.959	26.726
8.982	34.099
9.008	42.235
9.136	32.744
9.310	37.829
9.625	37.152
9.650	44.948
9.925	31.813
9.930	33.423
9.950	39.864
10.093	34.949
10.111	40.458
10.402	32.408
10.407	34.103
10.559	31.900
10.569	35.120
10.733	36.815
11.227	43.003
11.357	33.935
11.360	34.783
11.378	40.461
11.511	32.665
11.537	40.715
11.682	36.479
11.837	35.462
11.844	37.665
12.155	35.802
12.178	43.259
12.491	41.904
12.492	42.413
12.643	40.125
12.789	36.142
12.804	40.803
13.108	36.821
13.110	37.414
13.114	38.770
13.260	34.703
13.440	41.483
13.603	43.009
13.903	37.670
13.910	40.128
14.057	36.484
14.065	38.772
14.069	40.213
14.077	42.586
14.370	35.299
14.542	39.536
14.558	44.706
14.561	45.384
14.696	38.181
14.847	35.808
14.864	41.232
15.036	45.554
15.323	36.064
15.326	37.165
15.332	38.860
15.653	40.302
15.823	44.031
15.976	42.336
16.133	41.744
16.137	42.930
16.298	44.032
16.455	43.439
16.597	38.185
16.598	38.609
16.616	44.372
17.084	42.085
17.388	38.187
17.396	40.560
17.398	41.238
17.550	39.205
17.551	39.374
17.552	39.798
17.712	40.307
17.722	43.358
17.724	44.036
17.859	36.832
17.884	44.714
17.885	44.883
18.344	39.969
18.509	41.834
18.672	43.360
18.675	44.292
19.142	41.751
19.146	43.022
19.310	44.972
19.613	40.650
19.770	40.142
19.778	42.600
19.922	38.193
19.931	40.905
19.932	41.244
19.939	43.278
20.084	39.211
20.101	44.635
20.403	39.889
20.736	45.145
20.890	43.619
21.037	40.230
21.202	42.095
21.206	43.281
21.355	40.570
21.362	42.604
21.370	45.231
21.525	44.045
21.668	39.384
21.670	39.893
21.680	42.943
21.843	44.639
21.990	40.910
22.155	43.029
22.305	40.403
22.452	36.759
22.785	41.929
22.794	44.726
22.947	43.116
22.950	43.963
22.954	45.319
22.955	45.658
22.956	45.997
23.252	39.388
23.259	41.591
23.275	46.676
23.566	38.626
23.888	40.067
23.890	40.661
24.045	39.898
24.215	43.289
24.218	44.305
24.381	45.916
24.530	42.781
24.842	41.256
24.853	44.816
24.853	44.985
24.999	40.833
25.007	43.375
25.146	37.359
25.332	46.003
25.471	39.817
25.642	43.885
25.647	45.580
25.793	41.513
25.796	42.445
26.098	37.954
26.107	40.751
26.110	41.598
26.594	44.481
26.733	38.464
26.746	42.617
26.757	46.007
27.384	43.889
27.385	44.313
27.529	39.568
27.531	40.330
27.691	40.839
28.016	43.298
28.328	41.943
28.637	39.655
28.807	43.130
28.818	46.605
29.136	47.199
29.270	39.487
29.439	42.708
29.440	43.047
29.768	46.607
29.769	47.031
29.908	40.929
29.922	45.252
30.380	39.914
30.536	39.151
30.543	41.355
31.177	41.272
31.645	39.154
31.822	44.917
32.453	44.156
34.509	43.483
34.829	44.501
34.831	44.924
34.973	39.925
35.470	46.790
35.616	42.723
35.625	45.689
35.936	43.910
37.510	40.694
37.518	43.321
38.792	45.527
38.799	47.731
39.420	44.003
39.890	42.225
40.374	45.192
40.840	42.312
41.312	41.127
42.103	41.044
46.557	46.987
59.695	44.900];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulPott2012';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-length im mm: TL = 1.13FL ? 13.11 for females, TL = 1.13FL ? 12.79 for males';
metaData.bibkey.F1 = 'CoulPott2012'; 
F2 = 'length-weight: ln TW in g = 2.62 ln FL in mm ? 8.44';
metaData.bibkey.F2 = 'CoulPott2012'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4VX39'; % Cat of Life
metaData.links.id_ITIS = '169533'; % ITIS
metaData.links.id_EoL = '46578644'; % Ency of Life
metaData.links.id_Wiki = 'Scorpis'; % Wikipedia
metaData.links.id_ADW = 'Scorpis_aequipinnis'; % ADW
metaData.links.id_Taxo = '187227'; % Taxonomicon
metaData.links.id_WoRMS = '282728'; % WoRMS
metaData.links.id_fishbase = 'Scorpis-aequipinnis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpis}}';
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
bibkey = 'CoulPott2012'; type = 'Article'; bib = [ ... 
'author = {Peter G. Coulson and Ian C. Potter and Norman G. Hall}, ' ... 
'year = {2012}, ' ...
'title = {The biological characteristics of \emph{Scorpis aequipinnis} ({K}yphosidae), including relevant comparisons with those of other species and particularly of a heavily exploited congener}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {125-126}, ' ...
'pages = {272-282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Scorpis-aequipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

