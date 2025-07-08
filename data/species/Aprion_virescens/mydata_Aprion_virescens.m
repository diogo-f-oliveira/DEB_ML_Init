function [data, auxData, metaData, txtData, weights] = mydata_Aprion_virescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Aprion_virescens'; 
metaData.species_en = 'Green jobfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW', 'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 26];

%% set data
% zero-variate data

data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 32*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 45; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 112;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.82 mm: pi/6*0.082^3'; 
data.Wwp = 1e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^2.94, see F1';
data.Wwi = 14.9e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^2.94, see F1';

data.GSI = 0.027; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Etelis_carbunculus';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
0.088	1.611
0.177	3.076
0.264	9.819
0.381	12.896
0.999	26.522
1.147	26.520
1.148	23.148
1.207	24.906
1.235	30.184
1.265	27.544
1.296	25.638
1.296	24.319
1.413	30.328
2.003	38.383
2.062	39.995
2.269	38.673
2.297	46.735
2.415	47.320
2.534	44.680
2.536	40.135
2.563	46.732
2.564	43.946
2.624	41.600
2.803	37.492
3.183	54.200
3.212	55.812
3.213	54.639
3.361	53.904
3.390	55.223
3.449	56.395
3.452	47.746
3.478	58.008
3.510	50.384
3.512	45.106
3.543	41.147
3.599	50.676
3.629	48.916
3.686	58.152
3.689	48.182
3.807	48.621
3.833	59.029
3.837	46.128
3.864	56.830
3.920	66.065
3.922	61.080
3.924	54.043
3.953	55.362
3.982	57.121
3.983	55.215
3.983	53.896
4.013	52.869
4.071	55.947
4.190	55.799
4.191	51.987
4.245	69.872
4.309	54.771
4.337	58.729
4.368	55.503
4.393	68.697
4.396	60.781
4.489	45.679
4.515	59.313
4.546	54.181
4.574	60.778
4.603	62.244
4.607	50.076
4.636	50.808
4.721	64.148
4.750	64.587
4.752	60.189
4.783	54.178
4.784	51.686
4.813	52.272
4.900	58.721
4.902	52.857
4.932	50.511
4.959	59.600
4.988	63.118
4.990	56.374
5.050	54.174
5.167	57.545
5.225	61.795
5.402	64.725
5.406	51.384
5.435	52.850
5.462	62.379
5.464	54.462
5.492	60.766
5.493	59.446
5.493	56.661
5.550	66.189
5.610	63.110
5.639	64.722
5.669	63.988
5.761	52.259
5.762	51.233
5.792	50.059
5.792	49.180
5.819	59.002
5.820	55.043
5.821	52.551
5.879	56.655
5.905	66.917
5.907	62.226
5.963	71.608
5.964	69.262
5.966	60.173
6.024	65.156
6.143	62.662
6.144	60.317
6.263	58.409
6.291	64.713
6.409	66.910
6.410	64.125
6.442	55.475
6.559	60.458
6.560	56.793
6.561	54.300
6.617	65.295
6.618	60.017
6.768	54.151
6.795	64.413
6.824	66.318
6.914	62.945
6.974	60.599
7.035	55.467
7.116	77.896
7.153	54.292
7.241	59.129
7.505	66.016
7.623	69.239
7.712	67.625
7.714	63.081
7.715	57.656
7.716	55.017
7.830	71.436
7.861	64.252
7.889	70.115
7.947	73.780
8.008	68.501
8.009	66.888
8.070	59.411
8.364	68.936
8.392	72.161
8.397	58.233
8.482	69.961
8.601	67.906
8.602	64.535
8.659	72.450
8.689	69.371
8.753	56.176
8.809	66.584
8.811	61.306
8.837	69.956
8.839	65.704
8.872	55.002
8.896	72.007
8.929	60.718
8.955	73.326
8.986	69.221
8.988	62.770
9.019	57.638
9.167	58.223
9.340	73.174
9.342	65.697
9.400	71.414
9.402	65.550
9.430	70.827
9.458	73.905
9.518	71.999
9.520	65.402
9.636	74.783
9.697	69.211
9.759	59.681
9.787	65.398
9.877	63.344
9.905	68.622
9.935	64.809
9.963	72.139
9.964	66.715
9.992	74.191
10.024	64.515
10.025	62.609
10.025	62.316
10.055	61.582
10.112	69.498
10.230	70.083
10.232	63.779
10.257	79.905
10.348	70.815
10.379	68.615
10.412	55.567
10.646	67.292
10.675	69.491
10.677	62.747
10.793	69.489
10.824	66.850
10.854	64.357
10.855	60.105
10.883	65.529
10.885	58.492
10.973	63.036
11.062	60.982
11.091	65.820
11.118	74.029
11.119	71.244
11.121	62.741
11.205	79.599
11.241	60.100
11.356	70.361
11.357	66.842
11.385	72.999
11.447	63.323
11.509	55.552
11.535	66.400
11.651	74.169
11.653	67.718
11.713	65.665
11.741	70.356
11.741	69.623
11.800	72.847
11.828	76.512
11.890	66.688
11.916	79.589
11.947	76.217
11.979	68.446
12.011	60.969
12.036	74.163
12.098	65.953
12.128	65.219
12.156	71.376
12.360	79.143
12.452	69.466
12.632	64.919
12.656	82.071
12.748	71.661
12.748	70.488
12.749	68.729
12.781	61.105
12.781	60.079
12.840	62.570
12.866	72.686
12.868	65.795
12.925	74.151
12.953	78.256
13.047	63.594
13.102	77.374
13.107	61.247
13.194	66.231
13.369	74.292
13.401	69.160
13.428	76.050
13.431	67.840
13.663	81.764
13.786	68.568
13.877	62.556
13.877	61.090
13.903	72.672
13.906	65.341
13.907	59.330
13.965	64.168
13.995	63.581
14.024	67.099
14.024	65.926
14.050	76.481
14.055	62.700
14.078	81.465
14.081	72.376
14.107	84.544
14.112	67.977
14.169	76.626
14.289	71.787
14.411	58.884
14.440	61.229
14.466	73.397
14.496	71.491
14.498	66.946
14.582	82.045
14.704	71.195
14.854	64.888
14.883	66.501
14.886	57.998
14.940	73.390
14.941	69.432
14.968	77.348
14.971	70.018
14.971	67.819
15.116	79.399
15.120	65.178
15.180	65.470
15.298	66.202
15.354	75.877
15.442	77.488
15.445	70.891
15.449	57.550
15.506	65.319
15.596	61.067
15.622	71.915
15.771	70.300
15.773	63.703
15.826	81.881
15.859	71.765
15.977	74.402
16.002	87.010
16.004	80.999
16.215	70.441
16.575	57.095
16.746	76.737
16.807	72.778
16.808	70.139
16.836	74.684
16.895	74.096
16.955	71.750
16.956	70.870
16.957	67.792
17.044	73.508
17.104	70.575
17.159	84.209
17.163	69.695
17.339	76.143
17.371	68.079
17.520	66.758
17.635	76.432
17.637	70.421
17.666	73.206
17.727	67.341
17.847	61.769
17.876	66.606
17.990	78.480
18.024	64.991
18.050	76.720
18.051	73.494
18.228	75.398
18.319	68.946
18.351	61.322
18.375	79.940
18.466	74.075
18.496	72.462
18.527	67.184
18.671	81.842
18.671	80.083
18.673	73.632
18.791	76.709
18.910	75.095
18.912	67.178
18.942	68.058
19.118	73.626
19.355	74.356
19.359	61.161
19.652	71.860
19.861	65.992
19.888	74.788
19.944	84.903
19.949	69.363
20.094	79.624
20.096	71.120
20.245	69.652
20.303	74.783
20.360	79.620
20.422	72.875
20.661	65.395
20.922	83.424
21.194	67.147
21.217	88.551
21.431	66.851
21.607	72.712
21.903	72.122
21.960	81.504
22.229	72.117
22.288	73.729
22.319	69.917
22.345	81.792
22.435	76.513
22.673	76.216
22.850	78.559
22.880	75.627
22.969	76.652
23.261	89.256
23.527	92.917
23.679	79.428
23.798	77.667
23.853	90.860
24.213	77.808
24.897	70.175
25.042	77.796
25.307	82.924
25.755	71.922
26.051	73.238
26.377	73.087
26.403	85.254
27.115	83.485
27.470	83.627
28.243	75.113
29.045	69.238
30.821	73.612
31.919	69.492];
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OMalWake2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01413*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FWQ8'; % Cat of Life
metaData.links.id_ITIS = '168926'; % ITIS
metaData.links.id_EoL = '46580818'; % Ency of Life
metaData.links.id_Wiki = 'Aprion_virescens'; % Wikipedia
metaData.links.id_ADW = 'Aprion_virescens'; % ADW
metaData.links.id_Taxo = '106174'; % Taxonomicon
metaData.links.id_WoRMS = '212546'; % WoRMS
metaData.links.id_fishbase = 'Aprion-virescens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aprion_virescens}}';
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
bibkey = 'OMalWake2021'; type = 'article'; bib = [ ...
'doi = {10.1002/mcf2.10155}, ' ...
'author = {Joseph O''Malley and Corey B. Wakefield and Michael J. Kinney and Stephen J. Newman}, ' ...
'year = {2021}, ' ...
'title = {Markedly Similar Growth and Longevity of Green Jobfish \emph{Aprion virescens} over an Expansive Geographic Range between the {H}awaiian {A}rchipelago and the {E}astern {I}ndian {O}cean}, ' ... 
'journal = {Marine and Coastal Fisheries, Issue 3Jun 2021Pages}, ' ...
'volume = {13}, '...
'pages = {253–262}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Aprion-virescens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
