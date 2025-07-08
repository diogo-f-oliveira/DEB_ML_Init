  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_bathybius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_bathybius'; 
metaData.species_en = 'Yellowbelly threadfin bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 14];

%% set data

% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.9;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 21;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'GranMasu2004';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'GranMasu2004a';
  comment.Wwb = 'GranMasu2004a give ripe oocyte diameter of  0.53 mm, but based on egg diameter of  0.8 mm: pi/6*0.08^3';
data.Wwi = 368;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'GranMasu2004';
    
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), fork length (cm), female, male
    1 13.4 12.4
    2 14.9 16.8
    3 16.1 19.9
    4 17.1 22.1
    5 18.0 23.6
    6 18.8 24.7
    7 19.4 25.5
    8 20.0 26.1
    9 20.4 NaN
   10 20.8 NaN];
data.tL_fm(:,1) = 365 * (0.9 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm = C2K(24);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'female','male'}};
bibkey.tL_fm = 'GranMasu2004';

% time-weight
data.tW_f = [ ... % time (yr), weight (g)
0.995	36.350
0.995	39.313
1.010	28.446
1.226	67.909
1.302	48.141
1.409	55.033
1.424	45.154
1.424	51.080
1.729	42.131
1.730	51.019
1.746	68.794
1.746	75.708
1.777	83.603
1.792	83.600
1.807	61.868
1.822	51.989
1.823	86.557
1.839	109.269
1.868	58.893
1.882	39.137
1.883	47.039
1.884	73.705
1.915	92.464
1.944	51.965
1.944	67.767
1.960	68.752
1.961	103.319
1.976	94.428
2.023	119.110
2.067	83.545
2.082	61.814
2.083	89.468
2.083	95.394
2.129	98.348
2.143	52.913
2.143	60.814
2.159	74.638
2.174	61.796
2.174	69.697
2.174	69.697
2.205	71.666
2.207	136.851
2.220	74.626
2.280	54.861
2.311	50.905
2.311	67.695
2.341	46.948
2.342	70.652
2.343	85.466
2.372	55.831
2.418	51.871
2.434	61.745
2.449	75.569
2.464	59.763
2.465	90.380
2.480	86.427
2.481	115.068
2.495	63.708
2.527	107.158
2.542	101.229
2.543	131.846
2.556	66.659
2.602	74.551
2.603	94.304
2.619	108.128
2.648	82.443
2.664	97.255
2.679	84.412
2.695	98.236
2.724	55.761
2.726	106.131
2.756	87.360
2.756	101.187
2.770	73.530
2.770	73.530
2.785	61.675
2.787	119.946
2.815	47.842
2.817	85.373
2.877	74.496
2.878	95.237
2.879	109.064
2.892	67.580
2.893	88.320
2.894	100.172
2.894	102.148
2.969	78.429
2.984	63.611
3.061	85.324
3.091	67.541
3.153	77.405
3.184	93.201
3.229	63.563
3.229	79.365
3.275	74.418
3.336	77.369
3.337	85.270
3.427	58.585
3.443	78.335
3.444	107.965
3.459	74.382
3.474	71.416
3.519	51.654
3.520	72.394
3.521	98.073
3.535	77.329
3.535	87.206
3.536	94.119
3.551	100.042
3.552	131.647
3.566	85.225
3.614	132.623
3.643	109.901
3.658	88.169
3.690	130.632
3.704	86.185
3.719	78.281
3.734	94.080
3.735	100.006
3.735	105.932
3.735	105.932
3.736	121.734
3.750	91.114
3.750	93.090
3.764	61.482
3.780	76.294
3.782	139.503
3.783	159.256
3.825	68.383
3.826	79.247
3.828	128.630
3.829	158.259
3.841	76.281
3.842	115.787
3.856	69.365
3.856	82.204
3.859	140.475
3.872	96.028
3.902	89.109
3.903	106.886
3.919	128.612
3.933	97.992
3.934	118.732
3.949	104.902
3.978	74.279
3.979	80.205
3.997	155.263
4.009	87.112
4.010	112.791
4.012	148.346
4.024	71.307
4.024	79.208
4.025	85.134
4.041	108.835
4.056	93.029
4.056	97.967
4.056	98.955
4.057	131.547
4.102	120.674
4.117	89.066
4.118	135.486
4.133	128.569
4.146	68.320
4.148	106.838
4.149	128.566
4.149	140.418
4.162	76.218
4.179	119.671
4.180	136.461
4.195	147.323
4.207	64.357
4.208	81.147
4.238	74.228
4.239	80.153
4.239	93.981
4.253	53.484
4.270	99.900
4.285	106.811
4.315	88.040
4.468	88.009
4.468	92.948
4.469	109.738
4.485	134.426
4.515	103.803
4.529	71.207
4.544	61.328
4.560	77.127
4.561	115.645
4.576	97.865
4.590	85.022
4.592	124.528
4.592	126.503
4.592	129.466
4.620	72.177
4.622	107.732
4.636	86.988
4.637	110.692
4.637	114.643
4.682	70.189
4.682	70.189
4.698	94.878
4.699	132.408
4.713	80.060
4.729	118.575
4.744	103.757
4.761	138.322
4.774	84.986
4.790	103.748
4.791	128.439
4.805	107.696
4.806	120.535
4.835	81.023
4.836	102.752
4.853	161.020
4.881	91.878
4.883	132.372
4.883	146.199
4.896	83.974
4.897	112.616
4.945	148.162
4.959	124.456
5.020	135.308
5.081	109.617
5.095	93.811
5.112	142.203
5.142	107.629
5.187	103.670
5.218	96.750
5.232	77.982
5.326	115.494
5.355	92.772
5.493	97.683
5.540	113.477
5.555	117.424
5.555	125.326
5.585	91.739
5.646	90.740
5.647	119.382
5.677	119.375
5.678	130.240
5.692	110.484
5.738	118.376
5.740	151.956
5.740	156.894
5.741	181.585
5.754	136.150
5.767	72.938
5.768	98.617
5.786	148.984
5.786	148.984
5.800	133.178
5.815	116.385
5.815	127.249
5.829	73.914
5.829	84.778
5.862	141.067
5.862	142.055
5.876	107.484
5.876	113.410
5.880	213.163
5.891	96.617
5.892	125.259
5.892	131.185
5.909	170.688
5.909	175.626
5.909	185.502
5.922	119.327
5.952	97.593
5.969	141.046
5.969	141.046
5.969	147.960
5.983	111.414
5.983	116.352
5.998	113.386
5.999	121.287
6.000	164.744
6.016	181.531
6.075	133.124
6.090	114.356
6.135	102.495
6.152	124.220
6.152	138.047
6.168	143.970
6.197	109.396
6.199	163.717
6.211	70.875
6.226	73.835
6.226	78.773
6.226	82.724
6.227	94.576
6.241	66.918
6.242	89.634
6.243	108.400
6.260	148.890
6.274	116.295
6.290	158.761
6.414	178.489
6.549	123.154
6.580	136.975
6.687	119.176
6.701	96.457
6.734	157.685
6.763	131.013
6.764	149.778
6.809	115.201
6.856	141.859
6.856	163.587
6.947	122.088
6.947	144.804
7.009	161.582
7.010	176.396
7.054	139.844
7.116	142.795
7.164	206.983
7.176	118.092
7.223	145.737
7.284	144.737
7.331	182.259
7.590	166.405
7.712	147.616
7.834	126.851
7.849	123.885
7.897	196.962
7.973	162.379
8.109	134.698
8.125	158.398
8.139	114.939
8.216	122.825
8.233	165.290
8.246	104.053
8.277	130.714
8.293	150.464
8.568	148.434
8.812	118.756
8.846	205.663
8.858	132.574
9.256	125.582
9.475	263.811
9.902	245.948];
for i=2:size(data.tW_f,1); if data.tW_f(i,1)<=data.tW_f(i-1,1); data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3;end;end
data.tW_f(:,1) = 365 * (0.9 + data.tW_f(:,1));
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth','weight','female'};  
temp.tW_f = C2K(24);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'GranMasu2004';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (yr), weight (g)
0.926	27.654
0.959	41.481
0.988	33.580
1.143	44.444
1.253	59.259
1.328	41.481
1.406	51.358
1.422	61.235
1.610	90.864
1.700	71.111
1.701	77.037
1.718	87.901
1.730	63.210
1.743	44.444
1.750	101.728
1.751	108.642
1.805	46.420
1.809	81.975
1.824	75.062
1.837	57.284
1.857	94.815
1.890	115.556
1.911	160.988
1.919	99.753
1.920	108.642
1.927	168.889
1.947	76.049
1.969	136.296
1.979	87.901
1.993	71.111
1.997	107.654
2.015	128.395
2.026	93.827
2.031	135.309
2.037	55.309
2.060	118.519
2.085	67.160
2.086	78.025
2.119	95.802
2.121	118.519
2.171	147.160
2.179	86.914
2.182	113.580
2.190	177.778
2.203	163.951
2.209	77.037
2.216	142.222
2.268	60.247
2.285	70.123
2.303	90.864
2.304	99.753
2.329	189.630
2.331	199.506
2.337	122.469
2.343	175.802
2.351	111.605
2.363	81.975
2.372	159.012
2.376	59.259
2.406	182.716
2.427	103.704
2.435	171.852
2.453	195.556
2.460	120.494
2.477	131.358
2.478	144.198
2.486	77.037
2.496	162.963
2.498	181.728
2.504	98.765
2.521	118.519
2.524	144.198
2.533	89.877
2.536	110.617
2.630	128.395
2.658	104.691
2.660	123.457
2.674	109.630
2.693	139.259
2.733	86.914
2.750	96.790
2.813	114.568
2.814	123.457
2.818	160.988
2.819	168.889
2.822	189.630
2.900	200.494
2.929	182.716
2.979	215.309
2.998	113.580
3.092	134.321
3.237	188.642
3.325	148.148
3.329	184.691
3.342	164.938
3.358	173.827
3.416	136.296
3.458	234.074
3.495	154.074
3.496	168.889
3.507	132.346
3.522	256.790
3.526	160.988
3.566	242.963
3.637	188.642
3.651	178.765
3.692	264.691
3.718	222.222
3.726	163.951
3.741	154.074
3.760	184.691
3.781	239.012
3.836	178.765
3.868	194.568
3.870	210.370
3.947	209.383
4.063	147.160
4.086	211.358
4.087	221.235
4.100	204.444
4.115	195.556
4.124	271.605
4.129	181.728
4.134	230.123
4.156	153.086
4.164	220.247
4.188	166.914
4.196	102.716
4.217	151.111
4.248	147.160
4.254	203.457
4.269	195.556
4.271	220.247
4.272	227.160
4.286	209.383
4.297	171.852
4.305	114.568
4.329	186.667
4.340	283.457
4.342	294.321
4.379	217.284
4.409	214.321
4.413	109.630
4.414	124.444
4.420	177.778
4.448	146.173
4.453	191.605
4.470	208.395
4.472	226.173
4.492	132.346
4.511	160.988
4.515	200.494
4.524	139.259
4.535	238.025
4.537	258.765
4.552	251.852
4.579	218.272
4.582	246.914
4.633	155.062
4.646	265.679
4.672	226.173
4.681	173.827
4.683	190.617
4.695	160.988
4.696	296.296
4.703	226.173
4.752	247.901
4.840	214.321
4.845	258.765
4.915	330.864
4.935	240.988
4.964	220.247
4.970	271.605
4.971	284.444
4.989	308.148
5.014	255.802
5.034	296.296
5.111	160.000
5.138	261.728
5.257	224.198
5.316	204.444
5.395	220.247
5.398	253.827
5.425	218.272
5.609	348.642
5.613	250.864
5.619	299.259
5.743	304.198
5.776	328.889
6.053	322.963
6.104	234.074
6.131	335.802
6.138	263.704
6.201	273.580
6.253	192.593
6.267	184.691
6.369	266.667
6.396	368.395
6.471	348.642
6.975	317.037
7.961	332.840
8.127	302.222];
data.tW_m(:,1) = 365 * (0.8 + data.tW_m(:,1));
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth','weight','male'};  
temp.tW_m = C2K(24);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'GranMasu2004';
comment.tW_m = 'Data for males';

% weight-fecundity
data.WN = [ ... % weight(log10 g), fecundity (log10 #)
1.739	4.762
1.753	4.732
1.764	4.778
1.776	4.758
1.788	4.751
1.801	4.766
1.804	4.810
1.810	4.751
1.811	4.786
1.813	4.826
1.819	4.742
1.828	4.780
1.831	4.751
1.836	4.867
1.840	4.801
1.850	4.832
1.854	4.799
1.854	4.812
1.855	4.847
1.862	4.854
1.863	4.793
1.869	4.801
1.870	4.849
1.876	4.819
1.878	4.871
1.882	4.766
1.884	4.841
1.889	4.893
1.898	4.799
1.905	4.955
1.916	4.821
1.917	4.801
1.926	4.893
1.931	4.863
1.932	4.922
1.937	4.950
1.942	4.900
1.946	4.825
1.951	4.865
1.954	4.944
1.957	4.970
1.963	4.913
1.966	4.996
1.972	4.891
1.979	4.910
1.985	4.963
1.987	4.922
1.997	4.976
2.002	4.967
2.003	4.950
2.004	5.024
2.005	4.991
2.018	4.897
2.025	5.024
2.027	4.904
2.032	4.904
2.040	4.952
2.041	4.992
2.053	5.018
2.053	5.059
2.059	4.994
2.072	4.989
2.073	5.042
2.079	5.024
2.086	5.070
2.105	5.007
2.114	5.086
2.126	5.074
2.128	5.055
2.128	5.121
2.144	5.083
2.163	5.118
2.185	5.109
2.203	5.201
2.205	5.153
2.207	5.118
2.218	5.177
2.219	5.122
2.225	5.149
2.229	5.173
2.237	5.204
2.265	5.250
2.282	5.232
2.289	5.252
2.292	5.193
2.297	5.243
2.298	5.227
2.304	5.287
2.320	5.247
2.321	5.296
2.325	5.269
2.333	5.300
2.337	5.271
2.339	5.368
2.340	5.227
2.361	5.379];
data.WN = 10.^data.WN; % undo log10 trasformation
units.WN = {'g','#'}; label.WN = {'weight','fecundity'};  
temp.WN = C2K(24);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'RahmSama2021';
comment.WN = 'Data for Nemipterus furcosus';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Data tp and tpm ignored to to inconsistency wqith tL and Lp; Wwi is inconsistent with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Lives in >110 m deep waters';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '467YZ'; % Cat of Life
metaData.links.id_ITIS = '168990'; % ITIS
metaData.links.id_EoL = '46581023'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus_bathybius'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_bathybius'; % ADW
metaData.links.id_Taxo = '180967'; % Taxonomicon
metaData.links.id_WoRMS = '278120'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus-bathybius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus_bathybius}}';  
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
bibkey = 'GranMasu2004'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1444-2906.2004.00831.x}, ' ...
'author = {Vladimir Puentes Granada and Yasuji Masuda and Tatsuro Matsuoka}, ' ...
'year = {2004}, ' ...
'title = {Age and growth of the yellowbelly threadfin bream \emph{Nemipterus bathybius} in {K}agoshima {B}ay, southern {J}apan}, ' ... 
'journal = {Fischeries Science}, ' ...
'volume = {70}, '...
'pages = {497–506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GranMasu2004a'; type = 'article'; bib = [ ...  
'author = {Vladimir Puentes Granada and Yasuji Masuda and Tatsuro Matsuoka}, ' ...
'year = {2004}, ' ...
'title = {Annual Reproductive Cycle and Spawning Frequency of the Female Yellowbelly Threadfin Bream \emph{Nemipterus bathybius} in {K}agoshima {B}ay, Southern Japan}, ' ... 
'journal = {Suisanzoshoku}, ' ...
'volume = {52(4)}, '...
'pages = {4329-340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RahmSama2021'; type = 'article'; bib = [ ...  
'author = {Mustafizur M. Rahman and Amira F. Samat}, ' ...
'year = {2021}, ' ...
'title = {Reproductive cycle, sexual maturity and fecundity of \emph{Nemipterus furcosus} ({V}alenciennes, 1830)}, ' ... 
'journal = {Aquaculture and Fisheries}, ' ...
'volume = {6}, '...
'pages = {424–431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-bathybius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
