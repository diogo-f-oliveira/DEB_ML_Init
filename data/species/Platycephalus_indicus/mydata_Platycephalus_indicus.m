function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_fuscus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_indicus'; 
metaData.species_en = 'Bartail flathead'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 1;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MasuOzaw2000';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 40; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 100;  units.Li  = 'cm';  label.Li  = 'ultimate total length of female'; bibkey.Li  = 'fishbase';
data.Lim  = 80;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = {'fishbase','MasuOzaw2000'};

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.9 mm: pi/6*0.09^3'; 
data.Wwi = 3500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.GSI  = 0.08;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'MasuOzaw2000';   
  temp.GSI = C2K(22);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.179	7.044
0.183	16.289
0.253	14.969
0.499	17.610
0.955	18.050
1.134	26.195
1.343	23.774
1.378	24.874
1.491	40.283
1.523	34.119
1.593	33.459
1.697	32.799
1.803	34.119
1.980	38.522
2.083	34.340
2.084	36.321
2.156	40.283
2.192	40.943
2.194	44.465
2.299	44.465
2.331	39.843
2.365	37.642
2.366	39.623
2.367	41.384
2.367	41.604
2.471	38.302
2.509	44.906
2.576	39.623
2.684	45.566
2.755	47.107
2.929	44.025
2.929	44.025
2.931	47.987
2.963	41.824
3.002	49.528
3.206	39.182
3.211	47.767
3.315	46.226
3.525	45.566
3.737	48.648
3.737	50.189
3.909	42.925
3.911	47.327
3.947	48.868
3.984	52.390
4.017	49.308
4.017	50.189
4.053	51.289
4.155	44.686
4.194	53.711
4.263	51.950
4.470	45.126
4.893	50.189
4.893	51.069
4.960	44.465
4.960	44.906
4.962	48.428
4.998	50.629
5.031	46.667
5.032	47.767
5.032	48.648
5.103	49.308
5.104	51.730
5.172	47.767
5.243	49.969
5.874	50.409
5.876	56.132
5.944	51.950
5.981	54.371
5.981	54.811
6.012	47.547
6.016	55.472
6.081	44.906
6.786	55.031
6.787	55.692
6.857	56.132
6.894	60.094
6.926	54.371
6.960	51.950
6.963	57.233
6.963	57.233
6.998	57.673
6.998	58.113
7.031	53.270
7.733	57.673
7.838	57.673
7.908	56.792
8.886	52.610
8.962	63.396
9.623	55.472
11.548	53.491];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MasuOzaw2000';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.107	3.302
0.213	5.503
0.213	6.164
0.214	6.604
0.214	7.264
0.216	12.327
0.250	8.805
0.251	11.226
0.252	13.868
0.253	15.189
0.319	8.145
0.391	11.447
0.394	17.610
0.533	15.849
0.811	11.006
0.884	17.610
0.959	27.516
0.960	28.396
0.962	33.239
1.098	25.535
1.240	28.176
1.275	29.277
1.312	31.918
1.345	27.296
1.346	30.818
1.416	29.717
1.522	31.698
1.522	32.579
1.696	29.057
1.802	30.818
1.836	29.497
1.943	33.459
1.976	28.836
1.978	32.799
2.047	31.698
2.049	35.440
2.120	37.642
2.151	29.717
2.188	33.459
2.259	35.000
2.292	31.258
2.397	30.157
2.433	32.799
2.434	35.660
2.435	37.642
2.436	39.182
2.471	38.522
2.505	36.761
2.608	31.918
2.609	34.340
2.642	30.377
2.783	33.019
2.786	38.742
2.787	39.843
2.787	40.943
2.789	44.686
2.789	45.566
2.822	40.503
2.854	35.440
2.858	42.264
2.893	43.145
2.924	33.679
2.995	36.761
3.034	44.686
3.066	37.862
3.066	39.182
3.067	40.943
3.068	42.264
3.070	46.447
3.098	32.579
3.174	43.805
3.205	35.220
3.520	36.761
3.591	38.082
3.592	40.283
3.694	34.340
3.698	41.604
3.770	45.786
3.839	44.465
3.840	46.447
3.871	37.642
3.908	40.503
3.910	45.566
3.942	39.843
3.944	42.925
3.978	41.824
3.982	49.969
4.011	38.302
4.012	38.962
4.016	46.447
4.051	47.107
4.051	47.987
4.083	41.824
4.820	43.805
4.821	46.006
4.959	42.044
4.959	42.264
4.993	40.723
5.028	39.403
5.100	43.365
5.133	39.623
5.449	42.264
5.589	41.384
5.729	42.264
5.730	43.805
5.836	44.465
5.868	38.742
5.870	42.264
5.871	46.226
5.903	39.623
6.009	40.723
6.782	46.226
6.848	38.742
6.850	42.484
6.884	39.623
6.921	44.906
6.955	42.925
6.989	40.503
6.990	41.604
7.061	43.145
7.097	46.006
7.132	45.126
7.796	44.025
7.902	44.025
7.969	38.522
7.969	39.182
8.075	41.164
8.111	42.704
8.672	43.365
8.708	45.566
8.846	42.704
8.952	44.245
8.988	45.786
9.025	49.308
9.056	42.484
9.235	48.648
10.915	47.327
11.017	42.264
11.054	44.906
11.194	45.126
12.033	42.704
12.035	45.786
12.036	47.547
12.735	45.786
13.015	45.786
13.120	44.906
15.957	46.667
15.990	42.264];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MasuOzaw2000';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
0.385	21.264
0.455	28.334
1.122	113.102
1.366	85.028
1.367	127.282
1.369	169.536
1.370	204.748
1.476	247.043
1.478	282.255
1.517	401.988
1.791	240.124
1.896	254.249
2.038	310.643
2.076	395.165
2.082	578.266
2.215	367.050
2.222	592.405
2.247	303.683
2.285	381.162
2.293	620.602
2.353	338.935
2.424	367.132
2.426	409.386
2.462	451.654
2.503	613.642
2.634	381.299
2.674	522.160
2.779	508.116
2.781	564.455
2.783	641.920
2.820	684.188
2.821	705.315
2.822	747.569
2.846	430.677
2.883	479.987
2.886	578.580
2.922	620.848
2.927	740.568
2.959	656.074
3.059	522.310
3.068	789.919
3.069	825.131
3.092	458.942
3.092	473.027
3.092	480.070
3.094	529.366
3.103	782.891
3.129	529.380
3.201	585.746
3.306	592.829
3.343	656.224
3.350	853.410
3.411	592.870
3.766	762.023
3.880	1015.589
3.903	684.612
3.908	811.374
3.970	607.174
3.976	776.190
3.981	909.995
4.007	642.399
4.042	642.413
4.045	726.921
4.049	846.641
4.087	945.247
4.151	776.258
4.153	818.513
4.155	874.851
4.182	649.510
4.190	881.907
4.192	952.331
4.333	973.513
4.459	593.280
4.860	1044.141
4.882	684.995
4.891	945.562
4.955	783.615
4.958	875.166
4.988	713.205
4.990	783.629
4.991	818.841
4.995	917.434
5.001	1086.450
5.020	628.711
5.023	734.346
5.027	847.024
5.031	959.701
5.060	783.656
5.095	783.670
5.101	945.644
5.167	847.078
5.875	1107.919
5.877	1143.131
5.883	1340.316
6.011	995.296
6.016	1143.185
6.020	1241.778
6.023	1326.286
6.023	1340.371
6.025	1389.668
6.046	988.267
6.047	1016.437
6.071	692.502
6.854	1101.259
6.876	1728.029
6.930	1277.346
6.991	1023.848
6.994	1101.314
6.995	1143.568
7.001	1319.627
7.007	1481.601
7.009	1530.897
7.010	1566.109
7.144	1404.190
7.706	1495.959
7.926	1784.778
7.985	1453.815
8.989	1186.602
9.022	2137.319
9.657	1292.497
11.606	1060.865];
data.tW_f(:,1) = 365 * data.tW_f(:,1);  % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(22);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MasuOzaw2000';
comment.tW_f = 'data for females';
% males
data.tW_m = [ ... % time since birth (yr), wet weight (g)
0.315	28.279
0.456	49.461
0.945	49.652
1.158	134.242
1.196	225.806
1.229	169.481
1.301	239.932
1.367	113.197
1.404	190.677
1.440	211.818
1.547	261.155
1.580	225.957
1.789	197.870
1.929	183.840
1.998	169.782
2.035	240.219
2.038	303.601
2.139	219.133
2.212	282.542
2.279	205.103
2.382	155.848
2.422	303.751
2.454	226.299
2.528	346.046
2.664	240.466
2.767	170.083
2.768	205.295
2.773	339.099
2.848	479.974
2.912	310.985
2.916	423.662
2.919	529.298
3.015	282.856
3.025	564.550
3.026	578.635
3.053	367.378
3.054	388.505
3.055	402.590
3.059	515.268
3.092	458.942
3.155	268.826
3.192	332.221
3.580	445.049
3.611	311.258
3.644	254.933
3.856	339.523
3.859	416.989
3.865	578.963
3.902	649.400
3.933	522.652
3.968	536.750
4.031	339.592
4.033	395.931
4.035	452.269
4.042	649.455
4.045	741.006
4.045	748.048
4.050	867.768
4.078	684.681
4.085	881.866
4.118	818.499
4.144	557.946
4.176	487.536
4.776	649.742
4.814	734.264
4.880	621.614
4.904	325.849
4.908	424.442
4.909	466.696
4.979	466.723
4.980	501.935
4.983	572.358
5.086	530.145
5.151	389.326
5.401	523.226
5.646	558.534
5.710	375.460
5.789	629.012
5.857	593.827
5.894	650.180
5.927	579.770
5.931	685.405
5.959	488.233
5.959	502.318
5.960	537.530
5.992	431.908
6.095	389.695
6.869	530.843
6.870	566.055
6.938	502.701
6.941	594.251
6.970	418.206
6.971	453.418
7.078	502.755
7.081	615.433
7.083	657.687
7.111	453.473
7.113	530.939
7.887	650.959
7.948	418.589
7.951	503.097
7.987	531.280
8.058	566.519
8.513	580.782
8.653	587.879
8.690	630.147
9.002	552.804
9.040	658.453
9.042	707.749
9.043	742.961
9.074	637.340
9.185	799.355
11.028	525.428
11.032	652.190
11.137	652.231
11.140	722.655
12.006	518.768
12.015	758.208
12.017	821.589
12.709	638.762
13.092	596.658
13.097	730.463
16.026	541.468
16.031	682.315];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(22);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MasuOzaw2000';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Marine; brackish; demersal; depth range 0 - 30 m. Subtropical';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JP4M'; % Cat of Life
metaData.links.id_ITIS = '167159'; % ITIS
metaData.links.id_EoL = '46568548'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus_indicus'; % Wikipedia
metaData.links.id_ADW = 'Platycephalus_indicus'; % ADW
metaData.links.id_Taxo = '44962'; % Taxonomicon
metaData.links.id_WoRMS = '127234'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-indicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus_indicus}}';
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
bibkey = 'MasuOzaw2000'; type = 'article'; bib = [ ... 
'author = {Y. Masuda and T. Ozawa and O. Onoue and T. Hamada}, ' ... 
'year = {2000}, ' ...
'title = {Age and growth of the flathead, \emph{Platycephalus indicus}, from the coastal waters of west {K}yushu, {J}apan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {46}, ' ...
'pages = {113-121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-indicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
