function [data, auxData, metaData, txtData, weights] = mydata_Epinephelides_armatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelides_armatus'; 
metaData.species_en = 'Black-arse cod'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 03 11]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 11]; 

%% set data
% zero-variate data

data.am = 25 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30.6;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'MoorHeso2007'; 
data.Lpm  = 25.6;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'MoorHeso2007'; 
data.Li  = 56;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwb = 1.13e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwi = 3e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'MoorHeso2007';
  comment.Wwi = 'based on 0.01023*Li^2.98, see F1, give 1.66 kg';

data.GSI  = 0.03; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI  = 'MoorHeso2007';   
temp.GSI = C2K(23);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.236	3.869
0.345	1.468
0.793	5.156
0.899	14.732
0.997	8.270
1.036	12.077
1.099	5.615
1.134	6.422
1.135	7.230
1.206	8.268
1.209	12.076
1.243	11.498
1.311	9.652
1.767	14.263
1.838	16.454
1.907	15.646
1.910	18.761
1.944	18.300
2.534	18.294
2.707	17.023
2.845	16.099
2.988	20.598
3.125	18.981
3.128	21.981
3.165	24.173
3.275	31.210
3.299	18.633
3.301	21.749
3.302	22.441
3.407	23.594
3.438	19.440
3.478	24.632
3.551	28.439
3.618	25.669
3.651	24.168
3.657	30.284
3.689	27.976
3.712	15.514
3.820	19.090
3.964	24.858
3.966	26.473
4.001	27.627
4.003	29.011
4.098	19.087
4.099	21.164
4.139	25.895
4.178	30.741
4.201	18.048
4.278	26.932
4.343	21.277
4.377	21.277
4.380	24.508
4.415	24.969
4.416	25.546
4.417	26.469
4.453	27.853
4.454	28.776
4.489	29.122
4.518	23.237
4.519	23.930
4.525	30.737
4.587	22.429
4.620	21.275
4.622	23.352
4.665	31.890
4.693	24.505
4.727	23.928
4.729	25.889
4.729	26.466
4.732	29.351
4.733	30.735
4.737	34.543
4.794	21.273
4.797	24.273
4.804	32.235
4.829	21.965
4.935	23.349
4.943	32.118
5.002	20.579
5.042	26.233
5.042	27.040
5.050	35.348
5.074	23.809
5.076	25.309
5.076	25.886
5.080	30.271
5.081	30.848
5.085	36.040
5.177	22.885
5.183	28.885
5.214	24.385
5.214	24.962
5.220	31.192
5.352	23.922
5.355	27.153
5.356	28.422
5.357	28.883
5.357	29.576
5.358	30.268
5.359	31.422
5.365	37.653
5.365	38.230
5.366	38.922
5.389	26.114
5.391	28.306
5.394	32.114
5.395	32.575
5.423	25.652
5.490	23.459
5.500	33.728
5.501	34.421
5.629	22.996
5.636	30.381
5.645	39.958
5.672	31.534
5.700	24.726
5.703	28.419
5.737	27.034
5.739	29.226
5.769	24.149
5.772	27.495
5.813	34.072
5.845	31.648
5.847	33.379
5.879	30.148
5.919	36.724
5.951	33.032
5.982	28.878
5.988	35.455
6.049	26.454
6.050	27.954
6.052	30.262
6.053	30.723
6.053	31.300
6.056	33.954
6.089	32.454
6.162	35.684
6.164	38.568
6.187	25.414
6.188	27.145
6.189	28.299
6.190	28.876
6.201	40.414
6.222	26.222
6.259	28.414
6.300	34.875
6.402	33.258
6.439	35.104
6.477	38.681
6.480	42.027
6.536	27.719
6.544	35.796
6.582	40.064
6.584	42.141
6.609	31.641
6.618	40.872
6.648	36.025
6.655	43.410
6.684	37.179
6.684	37.987
6.745	28.409
6.749	33.024
6.756	39.832
6.780	28.178
6.781	29.793
6.789	38.563
6.852	31.639
6.883	27.254
6.887	32.215
6.891	36.485
6.893	37.985
6.920	30.023
6.923	33.484
6.960	35.330
6.987	27.253
7.026	31.868
7.034	39.945
7.065	36.252
7.107	44.560
7.132	33.598
7.135	37.175
7.141	43.059
7.167	34.405
7.177	45.021
7.198	30.366
7.444	33.480
7.446	34.980
7.449	38.210
7.451	41.326
7.550	34.979
7.592	43.171
7.724	35.554
7.727	38.439
7.791	33.361
7.792	34.399
7.800	43.169
7.825	32.438
7.860	32.091
7.871	44.553
7.895	32.783
7.896	33.937
7.897	35.206
7.937	40.398
8.010	44.090
8.032	31.051
8.076	41.320
8.139	34.281
8.142	36.704
8.176	35.896
8.179	39.242
8.217	42.934
8.243	33.241
8.280	35.895
8.389	41.779
8.428	45.471
8.453	35.086
8.491	39.355
8.703	43.160
8.704	43.622
8.843	44.428
8.873	39.351
8.908	39.005
8.910	41.428
8.975	36.465
9.217	35.886
9.224	43.271
9.258	42.001
9.396	41.308
9.505	46.845
9.538	44.999
9.603	40.498
9.677	44.997
9.816	44.996
9.850	43.842
10.020	40.379
10.123	39.339
10.125	41.301
10.438	41.644
10.645	39.796
10.719	44.757
10.853	39.794
11.031	44.754
11.206	46.022
11.621	43.941
11.796	45.555
12.140	42.436
12.210	43.128
12.316	45.435
15.513	47.367
17.665	47.462
19.231	50.332];
data.tL_f(:,1) = (0.25 + data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MoorHeso2007';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.014	2.194
0.681	11.107
0.750	5.778
0.819	12.032
0.889	9.831
1.063	6.933
1.063	12.030
1.097	6.006
1.097	7.512
1.097	8.207
1.097	9.597
1.097	11.103
1.514	16.427
1.618	15.616
2.486	19.546
2.625	16.649
2.625	20.124
2.625	20.587
2.660	21.745
2.868	18.731
3.042	19.077
3.042	18.498
3.042	25.911
3.076	16.760
3.146	20.119
3.146	25.215
3.181	23.130
3.319	22.550
3.319	23.940
3.389	26.024
3.458	25.212
3.597	24.979
3.632	21.041
3.632	21.273
3.632	22.199
3.806	26.599
3.806	31.927
3.875	28.683
3.875	28.220
3.944	21.270
3.979	20.690
3.979	34.126
4.014	19.300
4.014	26.597
4.014	23.122
4.083	26.365
4.153	17.909
4.153	20.804
4.153	29.723
4.292	24.973
4.292	24.278
4.292	34.355
4.361	19.992
4.361	27.173
4.361	37.250
4.396	25.899
4.431	29.257
4.465	26.361
4.500	28.330
4.535	24.276
4.535	22.886
4.569	29.024
4.569	36.785
4.674	25.780
4.674	26.475
4.674	31.919
4.708	27.286
4.743	39.100
4.778	33.308
4.847	32.381
4.847	37.941
4.951	35.044
4.951	33.886
4.986	32.264
4.986	30.642
4.986	29.368
5.021	27.746
5.021	31.684
5.021	37.708
5.056	30.062
5.056	36.781
5.056	36.086
5.125	29.598
5.194	24.965
5.264	31.914
5.264	32.725
5.264	37.937
5.264	36.547
5.264	41.180
5.299	28.323
5.299	27.512
5.299	27.280
5.299	38.632
5.333	34.230
5.333	42.106
5.368	22.183
5.403	28.785
5.403	34.461
5.438	27.047
5.472	24.730
5.472	32.028
5.507	23.572
5.507	29.132
5.542	42.683
5.576	34.691
5.611	40.598
5.611	43.609
5.646	32.837
5.681	27.393
5.681	28.667
5.681	35.153
5.681	35.501
5.681	36.427
5.681	36.775
5.681	41.292
5.715	29.825
5.715	40.249
5.750	36.079
5.750	37.932
5.819	32.256
5.854	30.866
5.854	42.101
5.889	37.236
5.889	40.132
5.889	41.174
5.924	31.676
5.924	34.340
5.958	28.664
5.958	29.127
5.958	40.710
5.993	32.949
6.028	41.636
6.063	35.034
6.063	35.960
6.063	37.698
6.097	32.485
6.132	33.412
6.236	37.580
6.236	40.129
6.271	33.410
6.306	34.684
6.306	38.043
6.306	42.560
6.375	24.838
6.375	30.629
6.375	29.934
6.479	40.358
6.514	28.659
6.514	40.937
6.549	43.253
6.583	42.905
6.583	41.979
6.653	37.808
6.688	36.070
6.688	40.472
6.722	30.974
6.722	41.167
6.722	43.831
6.722	45.916
6.722	47.306
6.757	32.942
6.826	37.575
6.861	34.911
6.896	36.648
6.896	38.848
6.965	49.041
7.000	28.770
7.000	33.983
7.000	43.597
7.069	33.750
7.069	39.889
7.069	40.353
7.069	42.206
7.069	43.828
7.104	29.928
7.174	34.908
7.174	33.865
7.174	32.591
7.208	45.100
7.313	40.466
7.313	44.868
7.313	44.404
7.347	47.647
7.382	29.230
7.417	41.624
7.625	43.822
7.660	37.451
7.660	46.370
7.694	40.463
7.764	41.041
7.764	41.157
7.764	42.084
7.764	44.864
7.764	44.864
7.764	43.010
7.868	36.060
7.868	36.523
7.903	33.279
7.903	45.673
7.903	43.009
7.903	43.704
7.938	31.889
7.938	48.453
8.007	35.132
8.007	36.522
8.007	44.398
8.007	46.830
8.042	37.448
8.042	38.490
8.042	39.069
8.042	39.880
8.042	42.429
8.319	35.013
8.319	46.596
8.458	38.023
8.632	49.720
8.667	47.635
8.701	37.094
8.840	41.958
9.049	44.620
9.049	40.913
9.153	38.133
9.153	47.283
9.292	43.459
9.431	48.902
9.604	43.920
9.674	49.363
9.674	42.529
9.743	41.949
9.743	45.193
10.056	44.727
10.056	43.337
10.958	42.054
10.958	45.876
11.097	47.497
12.347	45.632
12.347	45.053
12.938	46.206];
data.tL_m(:,1) = (0.25 + data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MoorHeso2007';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';
weights.psd.p_M = 3 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'temperatures are guessed';
D2 = 'Hermaphroditic, so kap_R is reduced ba a factor 2';
D3 = 'Males are assumed to differ from females by {p_Am}, E_Hp and v only';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Facts
F1 = 'length-weight: W in g = 0.01023*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5MH'; % Cat of Life
metaData.links.id_ITIS = '643249'; % ITIS
metaData.links.id_EoL = '46579558'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelides_armatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelides_armatus'; % ADW
metaData.links.id_Taxo = '173875'; % Taxonomicon
metaData.links.id_WoRMS = '280694'; % WoRMS
metaData.links.id_fishbase = 'Epinephelides-armatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelides_armatus}}';
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
bibkey = 'MoorHeso2007'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2007.01614.x}, ' ...
'author = {S. E. Moore and S. A. Hesp and N. G. Hall and I. C. Potter}, ' ... 
'year = {2007}, ' ...
'title = {Age and size compositions, growth and reproductive biology of the breaksea cod \emph{Epinephelides armatus}, a gonochoristic serranid}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {71}, ' ...
'pages = {1407-1429}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelides-armatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

