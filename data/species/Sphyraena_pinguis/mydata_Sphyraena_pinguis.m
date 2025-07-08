function [data, auxData, metaData, txtData, weights] = mydata_Sphyraena_pinguis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sphyraeniformes'; 
metaData.family     = 'Sphyraenidae';
metaData.species    = 'Sphyraena_pinguis'; 
metaData.species_en = 'Red barracuda'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMm', 'jiMr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 23];

%% set data
% zero-variate data

data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MasuSako2003';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24.9; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'Wiki'; 
  comment.Lp = 'based on Sphyraena_barracuda: 84.7*125/200';
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.45 mm: pi/6*0.145^3'; 
data.Wwp = 93.6; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on W = 0.00661*Lp^2.94, see F1';
data.Wwi = 4038; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on W = 0.00661*Li^2.94, see F1';

data.Ri  = 4e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AllaFalt2004';   
  temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on S. flavicauda';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.366	27.581
0.368	26.571
0.369	26.105
0.380	28.668
0.533	26.885
0.651	29.139
0.774	27.588
0.787	28.754
0.840	23.862
0.920	30.698
0.951	29.922
0.982	29.379
1.059	28.604
1.084	32.099
1.164	28.994
1.283	30.084
1.418	30.552
1.570	30.012
1.780	31.181
1.826	30.250
1.898	32.426
1.975	31.495
1.977	30.641
2.050	31.807
2.123	33.362
2.142	31.032
2.429	31.038
2.443	31.815
2.549	31.118
2.699	31.820
2.731	30.889
2.744	32.442
2.848	33.532
2.850	32.056
2.909	32.678
3.014	33.146
3.028	34.389
3.120	33.149
3.137	31.751
3.149	34.003
3.163	34.547
3.378	32.299
3.591	31.138
3.845	32.619
3.878	31.222
3.932	35.106
3.951	32.310
4.009	34.409
4.011	32.933
4.052	35.652
4.073	31.769
4.115	34.255
4.132	32.392
4.191	33.480
4.286	30.841
4.329	32.240
4.348	29.755
4.357	33.483
4.420	31.931
4.465	31.854
4.477	34.029
4.751	32.792
4.857	32.173
4.871	32.950
4.915	33.960
4.916	33.106
4.989	35.049
5.022	33.185
5.066	33.963
5.143	33.032
5.202	34.121
5.306	34.822
5.399	33.503
5.504	33.816
5.535	33.040
5.747	32.734
5.774	35.064
5.928	32.970
6.289	33.987
6.320	33.211
6.335	33.522
6.440	33.524
6.802	34.074
6.956	31.980
7.136	32.372
7.162	35.091
7.287	32.686
7.288	32.064
8.056	33.244
8.465	32.243];
data.tL_f(:,1) = 365 * (0.5+data.tL_f(:,1));  % set origin at birth
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(28.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MasuSako2003'; 
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.357	23.774
0.371	24.474
0.384	25.484
0.385	25.018
0.504	26.263
0.596	25.410
0.610	26.110
0.788	28.055
0.844	30.774
0.862	28.911
0.881	26.581
0.929	24.640
0.937	29.456
0.943	25.495
0.955	27.204
0.969	28.214
1.021	23.710
1.027	29.923
1.046	26.972
1.056	30.856
1.074	28.682
1.075	27.827
1.093	25.964
1.124	25.576
1.125	25.110
1.129	32.100
1.163	29.382
1.195	28.296
1.213	26.277
1.242	27.054
1.317	27.521
1.330	29.153
1.364	26.435
1.389	29.697
1.409	26.824
1.422	28.067
1.497	28.068
1.511	28.923
1.524	30.399
1.541	29.157
1.575	26.983
1.799	28.307
1.813	29.084
1.846	26.988
1.849	25.435
1.910	24.892
1.931	30.951
1.932	30.019
1.938	26.291
1.951	27.844
1.980	28.699
2.051	31.652
2.083	30.177
2.084	29.478
2.104	26.139
2.105	25.517
2.118	27.071
2.125	32.197
2.162	28.159
2.418	28.475
2.446	29.407
2.459	30.883
2.506	30.030
2.508	28.554
2.689	28.791
2.690	27.936
2.795	28.482
2.796	27.705
2.809	29.414
2.865	31.823
2.898	30.193
2.918	26.698
2.927	30.892
2.946	28.330
2.986	32.214
2.995	26.156
3.023	27.399
3.046	31.904
3.049	30.040
3.066	28.953
3.086	26.002
3.113	28.022
3.123	31.285
3.124	30.819
3.129	26.935
3.136	32.372
3.277	28.880
3.425	31.368
3.439	32.145
3.820	29.434
3.821	28.424
3.876	32.076
3.910	29.746
3.967	31.767
3.972	28.738
3.975	26.952
4.014	30.603
4.049	27.807
4.075	30.138
4.088	31.925
4.092	29.051
4.102	32.469
4.119	31.071
4.138	28.663
4.146	33.479
4.170	27.344
4.352	27.037
4.468	29.835
4.486	28.360
4.529	29.370
4.562	28.050
4.772	28.909
4.799	31.006
4.801	29.531
4.830	30.308
4.921	30.154
4.999	28.602
5.030	27.516
5.058	29.458
5.069	31.633
5.086	30.779
5.132	30.158
5.159	32.411
5.165	28.450
5.191	31.247
5.238	30.083
5.342	31.405
5.374	29.697
5.434	30.164
5.478	30.864
5.480	29.544
5.643	31.722
5.753	28.772
5.826	30.638
5.934	29.087
5.945	31.417
5.978	29.787
6.020	32.117
6.036	31.419
6.037	30.720
6.114	29.556
6.159	29.790
6.186	32.043
6.206	28.937
6.248	30.646
6.277	31.423
6.310	30.104
6.341	29.172
6.382	31.814
6.417	28.785
6.489	31.195
6.506	29.797
6.593	32.129
6.611	30.576
6.624	32.052
7.003	30.350
7.035	29.186
7.112	28.566
7.151	32.683
7.183	31.363
7.365	30.979
7.559	32.536
8.138	28.663
8.315	31.696
8.316	30.842
8.317	29.910
8.452	30.611
8.541	31.778
8.953	28.835
9.042	30.079
9.086	30.934
9.149	29.149
9.162	30.314
9.493	30.865
10.215	32.432
10.264	30.103
11.157	28.800];
data.tL_m(:,1) = 365 * (0.5+data.tL_m(:,1));  % set origin at birth
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(28.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MasuSako2003'; 

% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)
0.363	115.566
0.392	128.113
0.393	135.377
0.393	155.849
0.406	107.642
0.507	133.396
0.521	112.264
0.535	120.189
0.637	161.792
0.824	166.415
0.878	89.811
0.910	154.528
0.910	176.321
0.939	183.585
0.954	194.811
0.955	219.245
0.983	209.340
1.010	147.264
1.023	126.132
1.039	170.377
1.052	140.000
1.053	157.170
1.065	105.660
1.068	161.792
1.084	204.717
1.097	177.642
1.127	213.962
1.127	218.585
1.137	98.396
1.183	188.868
1.198	194.811
1.226	181.604
1.254	168.396
1.326	173.679
1.369	176.321
1.398	171.038
1.455	175.660
1.570	173.019
1.757	188.208
1.771	180.943
1.800	184.906
1.800	194.811
1.858	217.264
1.872	205.377
1.886	200.755
1.916	231.792
2.003	237.736
2.044	206.038
2.045	229.811
2.047	265.472
2.059	219.245
2.060	243.019
2.061	255.566
2.088	233.774
2.101	194.811
2.159	204.717
2.188	223.208
2.217	213.302
2.345	186.226
2.373	172.359
2.430	161.132
2.445	190.189
2.531	185.566
2.559	166.415
2.559	178.962
2.631	173.679
2.702	157.170
2.705	237.075
2.761	192.830
2.817	170.377
2.832	177.642
2.849	252.264
2.862	212.642
2.905	221.887
2.906	236.415
2.908	297.170
2.920	227.830
2.921	252.925
2.921	258.208
2.948	219.245
2.977	231.792
3.050	256.887
3.063	226.509
3.064	251.604
3.092	236.415
3.150	248.962
3.179	255.566
3.221	221.226
3.363	196.132
3.477	184.245
3.507	208.679
3.548	165.755
3.706	178.302
3.925	260.189
3.937	221.226
3.997	281.321
3.998	309.717
4.023	216.604
4.038	230.472
4.042	317.642
4.053	252.925
4.167	234.434
4.167	239.717
4.195	216.604
4.196	224.528
4.211	245.000
4.211	256.226
4.296	221.887
4.312	256.226
4.439	228.491
4.468	221.226
4.854	203.396
4.927	232.453
4.957	257.547
4.986	262.170
4.998	219.906
4.998	225.849
5.027	234.434
5.059	311.038
5.086	268.774
5.102	291.887
5.172	254.245
5.184	204.717
5.199	219.906
5.400	233.113
5.471	215.943
5.486	239.717
5.501	231.792
5.858	215.283
5.860	258.208
5.960	244.340
6.302	205.377
6.331	202.736
6.489	219.245
6.490	242.358
6.618	215.943
6.791	232.453
6.949	233.113
7.179	253.585
7.250	233.113
7.334	186.887
8.095	211.321];
data.tW_f(:,1) = 365 * (0.5+data.tW_f(:,1));  % convert yr to d
for i=2:size(data.tW_f,1); if data.tW_f(i,1)<=data.tW_f(i-1,1);data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3;end;end
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'females'};  
temp.tW_f    = C2K(28.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MasuSako2003'; 
%
data.tW_m = [ ... % time since birth (yr), weight (g)
0.405	97.075
0.434	105.000
0.435	114.906
0.448	87.830
0.520	97.736
0.535	105.660
0.535	120.189
0.549	113.585
0.593	130.094
0.693	107.642
0.693	113.585
0.867	169.057
0.895	150.566
0.907	105.000
0.910	158.491
0.936	98.396
0.937	136.698
0.951	123.491
0.994	116.887
0.996	171.698
1.009	143.962
1.010	167.736
1.024	158.491
1.040	181.604
1.065	96.415
1.080	109.623
1.081	150.566
1.096	166.415
1.108	90.472
1.109	126.132
1.110	147.264
1.138	135.377
1.183	178.962
1.195	117.547
1.211	156.509
1.237	110.283
1.240	163.774
1.353	122.170
1.353	138.679
1.382	132.736
1.395	112.264
1.454	144.623
1.468	149.906
1.483	155.189
1.540	145.283
1.553	124.151
1.569	164.434
1.583	138.019
1.842	180.283
1.856	151.226
1.897	102.358
1.912	134.717
1.913	142.642
1.926	126.792
1.928	170.377
1.940	108.962
1.942	164.434
1.943	190.189
1.955	120.849
1.956	153.868
1.957	177.642
1.998	136.038
2.042	160.472
2.058	187.547
2.069	111.604
2.072	194.811
2.086	165.094
2.099	146.604
2.112	118.868
2.113	124.151
2.142	136.698
2.143	170.377
2.144	196.132
2.172	176.981
2.173	204.717
2.185	151.887
2.187	184.245
2.372	157.170
2.387	173.019
2.400	140.000
2.400	149.245
2.401	165.755
2.457	132.736
2.530	159.151
2.545	173.679
2.687	145.943
2.730	136.698
2.759	149.906
2.859	141.321
2.860	162.453
2.860	165.755
2.887	130.094
2.904	194.151
2.917	152.547
2.918	186.226
2.934	226.509
2.945	147.925
2.946	171.038
2.962	203.396
2.973	139.340
2.992	234.434
3.003	157.170
3.033	187.547
3.045	127.453
3.047	176.321
3.063	218.585
3.074	135.377
3.076	192.830
3.103	160.472
3.105	211.981
3.118	166.415
3.131	143.962
3.132	149.906
3.133	173.679
3.145	118.868
3.147	182.925
3.163	214.623
3.191	198.774
3.217	129.434
3.290	159.151
3.360	134.057
3.492	195.472
3.776	141.321
3.806	154.528
3.820	166.415
3.834	159.811
3.863	146.604
3.905	125.472
3.922	189.528
3.922	199.434
3.934	133.396
3.964	173.019
3.977	143.302
3.981	225.849
3.993	180.283
4.021	166.415
4.035	148.585
4.037	203.396
4.078	158.491
4.079	184.245
4.121	145.283
4.122	169.717
4.123	194.811
4.149	138.679
4.152	210.000
4.165	187.547
4.179	165.094
4.180	202.736
4.193	153.208
4.194	177.642
4.407	141.981
4.421	138.679
4.509	171.698
4.522	153.208
4.565	145.943
4.623	165.094
4.795	152.547
4.810	176.321
4.824	165.755
4.825	183.585
4.852	158.491
4.868	182.925
4.910	164.434
4.939	173.019
4.983	197.453
5.011	185.566
5.026	191.509
5.052	140.000
5.053	157.170
5.054	178.962
5.068	169.717
5.070	211.321
5.081	147.925
5.125	163.774
5.183	179.623
5.183	184.245
5.185	227.830
5.196	156.509
5.198	190.189
5.212	196.792
5.226	175.000
5.340	151.887
5.369	182.925
5.370	197.453
5.412	160.472
5.442	197.453
5.442	204.717
5.484	175.660
5.498	164.434
5.513	192.830
5.555	161.132
5.700	192.170
5.812	145.943
5.872	192.170
5.985	167.075
5.988	223.208
5.999	155.189
6.057	162.453
6.058	186.226
6.058	195.472
6.071	153.208
6.072	176.321
6.073	208.019
6.144	189.528
6.200	168.396
6.273	179.623
6.300	140.660
6.301	169.057
6.316	190.849
6.359	183.585
6.415	160.472
6.430	173.019
6.474	192.170
6.486	146.604
6.486	147.925
6.503	202.736
6.515	156.509
6.560	196.132
6.573	166.415
6.574	184.906
6.633	231.792
7.018	175.000
7.074	156.509
7.103	147.264
7.175	162.453
7.190	180.943
7.205	189.528
7.220	211.981
7.420	192.170
7.621	202.075
8.207	153.208
8.295	198.774
8.308	175.660
8.336	153.868
8.336	161.792
8.481	188.208
8.624	181.604
8.996	169.717
9.068	173.679
9.097	184.906
9.169	182.925
9.181	140.660
9.527	174.340
10.260	211.981
10.330	175.660
11.175	165.755];
data.tW_m(:,1) = 365 * (0.5+data.tW_m(:,1));  % convert yr to d
for i=2:size(data.tW_m,1); if data.tW_m(i,1)<=data.tW_m(i-1,1);data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3;end;end
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'males'};  
temp.tW_m    = C2K(28.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MasuSako2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

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
D2 = 'Data Wwi and Wwp were ignored due to inconsistency with tL and tW data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00661*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Z2MX'; % Cat of Life
metaData.links.id_ITIS = '170442'; % ITIS
metaData.links.id_EoL = '46577236'; % Ency of Life
metaData.links.id_Wiki = 'Sphyraena_pinguis'; % Wikipedia
metaData.links.id_ADW = 'Sphyraena_pinguis'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '273985'; % WoRMS
metaData.links.id_fishbase = 'Sphyraena-pinguis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyraena_pinguis}}';
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
bibkey = 'MasuSako2003'; type = 'Article'; bib = [ ... 
'author = {Masuda, Y. and T. Sako and G. Matsushita and T. Shiraishi and J. Kirizushi and Y. Kamimura and T. Ozawa}, ' ... 
'year = {2003}, ' ...
'title = {Age, growth and year-class composition of brown barracuda \emph{Sphyraena pinguis} in {K}agoshima {B}ay, southern {J}apan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {69(5)}, ' ...
'pages = {709-716}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AllaFalt2004'; type = 'Article'; bib = [ ... 
'author = {Sohair M. Allam and Samir N. Faltas and Evelyn Ragheb}, ' ... 
'year = {2004}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF SPHYRAENA SPECIES IN THE {E}GYPTIAN {E}DITERRANEAN WATERS OFF {A}LEXANDRIA}, ' ...
'journal = {EGYPTIAN  JOURNAL  OF  AQUATIC  RESEARCH}, ' ...
'volume = {30(B)}, ' ...
'pages = {255-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Sphyraena-pinguis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

