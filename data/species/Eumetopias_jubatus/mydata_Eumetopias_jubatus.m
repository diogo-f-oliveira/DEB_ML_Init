function [data, auxData, metaData, txtData, weights] = mydata_Eumetopias_jubatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Eumetopias_jubatus'; 
metaData.species_en = 'Steller''s sea lion'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN','MN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb';  'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 07]; 

%% set data
% zero-variate data

data.tg = 274;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 279;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1780;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2420;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)';bibkey.tpm  = 'AnAge';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 32.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 120;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'AnAge';
  comment.Lb = 'for male, 118 cm for female';
data.Li  = 280;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'Wiki';
  comment.Li = '230-290 cm';
data.Lim  = 263;   units.Lim  = 'cm';  label.Lim  = 'total length male';   bibkey.Lim  = 'Wiki';
   comment.Lim = '282-325 cm';
 
data.Wwb = 19e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 106.61e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 350e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 240-350 kg';
data.Wwim = 1120e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: 450-1120 kg';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter, 1 litter per yr';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
0.000	 94.502
0.642	175.286
0.712	158.230
0.716	149.200
0.725	127.628
1.144	181.817
1.151	166.767
1.269	186.335
1.335	179.815
1.645	191.359
1.773	188.854
1.774	185.843
1.776	180.827
1.779	172.800
1.888	214.943
2.212	194.882
2.217	182.341
2.348	172.812
2.405	187.361
2.649	205.928
2.656	191.380
2.706	220.979
2.836	212.955
2.842	197.403
2.904	200.916
2.905	197.405
3.029	203.427
3.038	183.360
3.158	197.410
3.223	192.394
3.279	208.951
3.281	205.941
3.476	192.901
3.590	220.495
3.600	198.422
3.659	206.450
3.733	180.866
3.790	194.914
3.915	198.930
4.162	212.480
4.222	220.006
4.288	211.981
4.292	203.453
4.476	214.995
4.665	217.507
4.794	209.483
4.799	198.948
4.913	226.542
4.917	218.515
4.918	214.502
4.984	208.483
5.167	224.540
5.422	219.027
5.428	202.974
5.430	198.960
5.737	219.033
5.802	216.025
5.866	213.016
5.917	241.111
5.985	231.078
6.366	225.066
6.505	194.467
6.616	231.091
6.684	218.551
6.813	213.035
6.866	236.113
6.996	228.590
7.190	217.558
7.191	215.049
7.625	233.118
7.627	229.105
7.756	222.084
7.821	217.570
7.877	235.130
8.069	228.110
8.188	245.170
8.320	233.132
8.826	229.129
8.828	225.115
8.888	232.642
9.458	229.643
9.645	234.162
9.780	213.596
9.836	229.651
10.215	229.658
10.655	235.687
10.721	227.662
10.725	218.632
10.970	237.199
11.220	241.719
11.225	231.184
11.228	222.154
11.346	243.728
11.731	227.180
11.986	222.169
12.040	244.243
12.231	239.732
12.236	227.692
12.238	223.177
12.428	221.174
12.673	240.243
12.679	224.691
12.798	243.255
12.869	223.190
12.871	219.177
12.929	232.723
12.990	236.737
13.175	247.276
13.309	228.215
13.753	224.713
13.876	231.237
14.249	244.789
14.257	225.224
14.831	211.691
14.950	229.252
15.138	232.266
15.200	235.277
15.266	229.258
16.023	231.280
16.081	243.321
16.211	234.294
16.911	219.258
19.369	230.845
19.749	226.840
20.186	239.390
21.703	234.404
24.800	225.436];  
data.tL_f(:,1) = data.tL_f(:,1) * 365; % yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length'};  
temp.tL_f    = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WinsTrit2001';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), standard length (cm)
0.000	98.906
0.884	168.458
0.947	158.105
1.135	191.395
1.136	164.768
1.199	200.272
1.389	196.580
1.451	188.446
1.452	191.404
1.453	169.954
1.515	177.353
1.641	202.504
1.768	194.372
1.831	211.386
1.893	178.104
1.894	182.542
1.895	199.553
1.957	188.461
1.958	168.490
2.146	194.383
2.273	178.115
2.274	164.801
2.336	195.129
2.588	176.645
2.715	221.767
2.716	193.660
2.903	215.116
2.904	209.199
2.905	203.281
2.906	199.583
2.967	178.135
3.030	223.995
3.031	196.628
3.534	216.614
3.535	221.791
3.536	194.424
3.597	242.503
3.598	202.562
3.599	207.000
3.788	247.686
3.851	215.144
3.913	222.542
3.914	229.939
3.915	236.595
3.916	239.554
3.917	211.447
4.293	241.784
4.419	217.380
4.544	224.780
4.545	229.957
4.672	255.849
4.734	255.850
4.735	251.413
4.797	272.864
4.798	239.580
4.799	234.403
4.800	231.444
4.861	207.777
5.051	246.984
5.303	238.116
5.366	218.147
5.429	232.942
5.556	241.821
5.619	253.658
5.682	269.192
5.745	275.111
5.808	241.829
5.871	247.008
5.933	252.927
5.934	259.584
5.996	227.042
5.997	265.503
6.060	241.836
6.061	220.387
6.376	251.461
6.503	240.370
6.692	289.192
6.818	282.539
6.880	275.145
6.881	272.186
6.882	263.310
6.944	249.259
7.070	253.701
7.071	251.482
7.072	230.032
7.827	269.256
7.828	280.350
7.829	299.581
7.890	253.725
7.891	258.902
7.892	287.009
7.893	297.364
8.081	270.003
8.270	263.351
8.712	289.252
8.775	304.047
8.838	264.108
8.902	272.246
9.342	277.436
9.343	254.507
9.659	318.866
9.722	304.075
9.723	307.033
9.785	280.408
9.786	313.692
9.847	276.712
9.848	290.765
9.849	292.244
10.038	267.102
10.227	280.421
10.732	273.779
10.794	304.107
10.795	307.805
10.796	312.982
10.797	318.900
10.858	283.398
10.859	301.150
10.860	326.298
10.861	265.647
11.111	289.323
11.679	311.529
11.868	291.564
11.869	283.428
12.437	287.143
12.626	300.463
12.688	309.340
12.689	281.973
13.889	298.281
14.394	282.024
14.646	301.262
15.783	327.183
16.793	330.911
18.750	281.413];  
data.tL_m(:,1) = data.tL_m(:,1) * 365; % yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length'};  
temp.tL_m    = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WinsTrit2001';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), standard length (cm)
0.000	19.394
0.773	81.212
0.838	71.515
0.838	59.394
0.966	81.212
1.031	111.515
1.031	96.970
1.031	70.303
1.160	61.818
1.289	130.909
1.353	130.909
1.482	112.727
1.546	130.909
1.546	98.182
1.804	149.091
1.869	140.606
1.997	132.121
2.062	202.424
2.062	116.364
2.062	100.606
2.191	110.303
2.320	129.697
2.320	126.061
2.577	150.303
2.642	106.667
2.835	191.515
2.835	170.909
2.835	150.303
2.899	136.970
2.964	166.061
2.964	162.424
3.028	136.970
3.028	127.273
3.093	147.879
3.157	180.606
3.286	146.667
3.415	183.030
3.415	168.485
3.415	140.606
3.544	198.788
3.673	175.758
3.737	198.788
3.737	135.758
3.802	218.182
3.802	174.545
3.802	134.545
3.866	169.697
3.930	150.303
4.124	190.303
4.124	169.697
4.124	160.000
4.639	212.121
4.639	164.848
4.704	226.667
4.832	209.697
4.897	218.182
4.897	156.364
5.026	231.515
5.026	149.091
5.090	185.455
5.090	203.636
5.412	155.152
5.541	172.121
5.928	218.182
5.928	203.636
5.992	172.121
5.992	179.394
6.121	156.364
6.314	252.121
6.379	242.424
6.443	276.364
6.443	221.818
6.508	203.636
6.508	210.909
6.701	254.545
6.701	247.273
6.894	180.606
7.088	242.424
7.152	238.788
7.281	193.939
7.345	242.424
7.410	206.061
7.474	265.455
7.474	259.394
7.732	271.515
7.861	247.273
7.861	238.788
7.990	261.818
8.119	158.788
8.119	227.879
8.119	210.909
8.247	252.121
8.312	270.303
8.441	237.576
8.505	266.667
8.505	255.758
8.570	247.273
8.892	261.818
9.021	208.485
9.021	195.152
9.085	227.879
9.085	200.000
9.214	214.545
9.472	237.576
9.536	231.515
10.052	230.303
10.052	218.182
10.374	250.909
10.567	351.515
10.825	256.970
10.954	237.576
11.018	210.909
11.469	351.515
11.469	267.879
11.598	292.121
11.598	284.848
11.791	287.273
11.985	223.030
11.985	253.333
12.371	249.697
12.436	280.000
12.436	240.000
12.564	266.667
12.887	292.121
12.951	193.939
13.080	248.485
13.080	210.909
13.144	261.818
13.144	254.545
13.338	312.727
13.466	235.152
13.918	220.606
14.111	266.667
14.175	223.030
14.433	327.273
14.884	266.667
15.013	286.061
15.399	256.970
16.108	267.879
16.366	372.121
16.495	286.061
16.946	271.515
17.010	280.000
17.075	241.212
17.912	310.303
18.041	300.606
18.041	267.879
19.652	282.424
19.974	300.606
21.907	271.515
25.000	249.697];  
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % yr to d
data.tWw_f(:,2) = data.tWw_f(:,2) * 1e3; % kg to g
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'weight', 'female'};  
temp.tWw_f    = C2K(37);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'WinsTrit2001';
comment.tWw_f = 'Data for females';
% 
data.tWw_m = [ ... % time since birth (yr), standard length (cm)
0.000	24.242
0.764	96.970
0.892	121.212
0.954	151.515
0.958	96.970
1.088	66.667
1.279	103.030
1.340	154.545
1.341	136.364
1.342	124.242
1.537	103.030
1.729	130.303
1.793	127.273
1.852	212.121
1.854	175.758
1.857	130.303
1.859	106.061
2.178	151.515
2.302	227.273
2.307	148.485
2.626	200.000
2.692	175.758
2.693	157.576
2.818	215.152
2.823	139.394
2.824	127.273
2.825	124.242
2.890	100.000
2.946	236.364
3.332	239.394
3.399	200.000
3.400	193.939
3.401	175.758
3.402	160.606
3.461	236.364
3.779	309.091
3.846	272.727
3.848	239.394
3.849	215.152
3.850	212.121
3.851	193.939
3.852	181.818
3.909	284.848
4.231	284.848
4.364	227.273
4.365	212.121
4.426	272.727
4.676	384.848
4.684	257.576
4.738	418.182
4.745	309.091
4.812	272.727
4.872	342.424
4.944	224.242
5.069	284.848
5.130	342.424
5.391	287.879
5.392	272.727
5.397	200.000
5.644	363.636
5.645	345.455
5.835	406.061
5.896	451.515
5.909	242.424
5.959	466.667
5.965	378.788
6.164	287.879
6.418	345.455
6.420	312.121
6.659	609.091
6.738	381.818
6.798	448.485
6.869	345.455
6.926	472.727
6.930	396.970
6.932	369.697
6.936	315.152
6.941	236.364
7.682	730.303
7.707	345.455
7.759	539.394
7.760	527.273
7.768	393.939
7.816	660.606
7.823	548.485
7.825	509.091
7.950	569.697
8.080	551.515
8.156	381.818
8.720	627.273
8.779	700.000
8.780	687.879
8.800	384.848
8.861	442.424
9.431	581.818
9.444	393.939
9.503	466.667
9.742	754.545
9.744	721.212
9.745	709.091
9.755	566.667
9.764	424.242
9.801	845.455
9.815	621.212
9.875	700.000
9.878	657.576
10.015	518.182
10.207	539.394
10.704	830.303
10.706	800.000
10.707	781.818
10.773	754.545
10.775	733.333
10.776	721.212
10.777	709.091
10.780	657.576
10.782	624.242
10.797	384.848
10.830	857.576
10.831	854.545
10.898	824.242
11.802	790.909
11.827	409.091
11.880	581.818
12.092	296.970
12.335	512.121
12.773	727.273
12.845	603.030
12.850	527.273
13.680	648.485
14.330	563.636
14.706	721.212
14.763	839.394
15.853	915.152
16.762	815.152
18.064	596.970
18.780	490.909];  
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % yr to d
data.tWw_m(:,2) = data.tWw_m(:,2) * 1e3; % kg to g
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'weight', 'male'};  
temp.tWw_m    = C2K(37);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'WinsTrit2001';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f'; 'tL_m'}; subtitle1 = {'data for female, male'};
set2 = {'tWw_f'; 'tWw_m'}; subtitle2 = {'data for female, male at Turtle Rock'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males and females are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6H93Y'; % Cat of Life
metaData.links.id_ITIS = '933387'; % ITIS
metaData.links.id_EoL = '46559208'; % Ency of Life
metaData.links.id_Wiki = 'Eumetopias_jubatus'; % Wikipedia
metaData.links.id_ADW = 'Eumetopias_jubatus'; % ADW
metaData.links.id_Taxo = '67403'; % Taxonomicon
metaData.links.id_WoRMS = '254999'; % WoRMS
metaData.links.id_MSW3 = '14001011'; % MSW3
metaData.links.id_AnAge = 'Eumetopias_jubatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eumetopias_jubatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Eumetopias_jubatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Eumetopias_jubatus/}}';
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
bibkey = 'WinsTrit2001'; type = 'Article'; bib = [ ... 
'author = {Arliss J. Winship and Andrew W. Trites and Donald G. Calkins}, ' ... 
'year = {2001}, ' ...
'title = {Growth in Body Size of the {S}teller Sea Lion (\emph{Eumetopias jubatus})}, ' ...
 'journal = {Journal of Mammalogy}, ' ...
'volume = {82(2)}, ' ...
'pages = {500–519}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

