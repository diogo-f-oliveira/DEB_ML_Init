function [data, auxData, metaData, txtData, weights] = mydata_Smaug_giganteus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Cordylidae';
metaData.species    = 'Smaug_giganteus'; 
metaData.species_en = 'Sungazer'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 28];

%% set data
% zero-variate data

data.ab = 145;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wyk1992';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1900;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Wyk1992';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24.9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 6.5;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Wyk1992';  
data.Lp  = 17.1;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';  bibkey.Lp  = 'Wyk1992';  
data.Lpm  = 16.6;   units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'Wyk1992';  
data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Wyk1992';  
data.Lim = 19.2;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Wyk1992';  

data.Wwb = 7.0;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wyk1992';
data.Wwp = 160; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'Wyk1992';
data.Wwpm = 133; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'Wyk1992';
data.Wwi = 251;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wyk1992';
data.Wwim = 217;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wyk1992';

data.Ri  = 2.5/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wyk1992';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 young per clutch, 1 clutch per 2 yrs';
  
% univariate data
% time-length
data.tL = [ ... % time since borth (yr), SVL (cm)
0.010	6.719
0.031	7.592
0.040	6.847
0.058	7.926
0.096	7.438
0.125	7.669
0.130	7.258
0.244	8.285
0.311	8.028
0.437	8.130
0.456	9.106
0.471	7.950
0.514	7.025
0.564	8.155
0.602	7.616
0.641	9.542
0.685	8.643
0.705	7.051
0.719	8.412
0.744	8.951
0.760	7.718
0.766	7.230
0.770	9.413
0.789	7.898
0.829	9.773
0.851	10.517
0.858	10.029
0.887	10.209
0.897	9.439
0.902	9.079
0.912	10.748
0.977	8.154
1.012	10.389
1.032	11.287
1.035	11.082
1.035	8.539
1.049	9.952
1.110	10.208
1.127	8.873
1.350	11.286
1.443	8.974
1.501	9.411
1.519	10.490
1.540	11.337
1.575	11.131
1.576	11.003
1.589	10.001
1.598	11.773
1.618	12.749
1.633	8.999
1.646	10.515
1.658	12.056
1.663	9.179
1.681	10.232
1.691	9.487
1.710	12.980
1.719	12.261
1.738	10.771
1.739	13.211
1.812	9.923
1.821	11.747
1.823	11.567
1.842	12.595
1.842	12.569
1.857	11.413
1.857	13.904
1.861	13.622
1.893	11.079
1.934	12.877
1.961	13.262
1.973	12.286
1.991	10.847
2.004	12.389
2.030	12.774
2.043	14.315
2.043	11.772
2.070	12.157
2.114	13.698
2.355	12.259
2.458	11.642
2.523	14.031
2.548	12.053
2.572	12.669
2.575	12.412
2.625	13.465
2.632	12.977
2.638	15.006
2.642	12.181
2.692	15.725
2.707	14.569
2.712	14.184
2.725	13.131
2.729	15.314
2.799	12.334
2.821	15.545
2.832	14.723
2.846	13.593
2.857	12.771
2.860	15.031
2.860	12.488
2.880	15.956
2.907	13.824
2.946	13.259
2.986	12.616
3.031	14.080
3.038	13.541
3.447	16.365
3.452	15.928
3.508	14.053
3.510	13.847
3.512	13.693
3.596	14.618
3.597	17.032
3.627	17.160
3.634	14.155
3.647	15.594
3.653	15.105
3.704	16.107
3.738	15.927
3.746	15.311
3.752	14.823
3.753	17.288
3.812	17.596
3.837	15.644
3.887	16.749
3.903	15.490
3.924	16.286
3.949	14.334
4.008	14.719
4.016	16.543
4.025	15.875
4.035	17.596
4.063	15.412
4.099	15.027
4.398	16.490
4.402	16.207
4.417	15.026
4.417	17.492
4.428	16.670
4.455	17.003
4.468	16.053
4.507	15.436
4.510	15.205
4.527	16.387
4.541	17.799
4.569	15.565
4.641	14.897
4.688	16.232
4.703	17.568
4.706	17.285
4.710	17.003
4.713	16.771
4.723	15.975
4.725	15.770
4.761	17.978
4.763	17.773
4.778	16.591
4.876	16.386
4.932	17.027
4.966	16.873
4.973	16.308
4.979	15.846
5.000	16.668
5.012	18.209
5.019	17.695
5.024	17.284
5.048	17.875
5.492	17.925
5.495	17.745
5.500	17.359
5.502	17.205
5.583	18.309
5.593	17.539
5.602	16.845
5.667	16.665
5.744	18.103
5.850	17.333
5.938	17.846
5.964	18.308
5.998	18.128
6.057	18.513
6.122	18.436
6.151	18.616
6.468	18.692
6.476	18.050
6.504	18.383
6.605	17.895
6.729	18.177
6.756	18.511
6.849	18.716
6.954	17.971
6.980	18.382
7.099	19.023
7.104	18.613
7.173	18.227
7.294	18.689
7.297	18.458
7.356	18.817
7.391	18.560
7.494	17.995
7.520	18.406
7.575	19.099
7.612	18.714
7.667	19.381
7.678	18.533
7.799	18.944
7.856	19.458
7.898	18.687
7.967	18.224
7.988	19.097
8.028	18.481
8.057	18.712
8.434	19.019
8.470	18.711
8.472	18.505
8.476	18.197
8.496	19.147
8.690	18.915
8.748	19.326
8.754	18.838
8.814	19.120
8.871	19.634
8.888	18.298
8.917	18.529
9.032	19.479
9.067	19.197
9.093	19.659
9.104	18.811
9.164	19.119
9.391	18.707
9.411	19.632
9.416	19.247
9.452	18.938
9.546	19.066
9.567	19.914
9.569	19.734
9.668	19.477
9.708	18.809
9.830	19.220
9.871	18.449
9.897	18.937
9.900	18.706
9.917	19.836
9.927	19.065
9.984	19.604
10.083	19.270
10.403	19.141
10.461	19.551
10.585	19.833
10.624	19.217
10.654	19.422
10.810	19.602
10.974	19.216
11.063	19.703
11.603	19.727
11.857	19.726
11.949	20.034];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
n=size(data.tL,1);for i=2:n; if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'}; 
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wyk1992';

% length-weight
data.LW_f = [ ... % SVL (cm), weight (g)
6.351	6.952
6.776	8.940
6.918	10.914
7.031	9.936
7.315	10.442
7.457	11.433
7.599	10.456
7.882	12.437
7.996	11.459
8.364	13.936
8.816	23.795
8.987	16.426
9.129	18.892
9.299	19.884
9.497	19.894
9.724	23.839
9.979	23.852
10.092	25.333
10.319	24.852
10.489	25.352
10.546	27.814
10.885	30.782
11.112	32.760
11.113	29.809
11.282	35.227
13.064	63.348
13.490	58.451
13.885	72.241
14.081	83.562
14.423	74.234
14.761	87.038
14.763	79.169
14.816	98.844
14.846	90.485
14.957	103.769
15.356	90.510
15.497	99.369
15.580	110.685
15.750	111.185
15.977	110.704
16.141	142.188
16.172	127.435
16.368	142.691
16.456	125.974
16.595	143.194
16.765	140.743
16.822	142.713
16.989	160.426
17.012	184.526
17.023	128.952
17.106	140.268
17.129	169.285
17.158	164.369
17.188	156.993
17.213	175.191
17.221	132.897
17.240	182.078
17.246	149.619
17.327	171.754
17.329	162.410
17.358	158.477
17.439	176.678
17.446	143.727
17.469	169.302
17.473	149.630
17.637	184.556
17.639	173.245
17.664	188.984
17.665	181.607
17.669	165.378
17.726	160.954
17.865	179.158
17.884	224.896
17.887	209.159
17.895	169.815
17.977	185.065
17.983	154.082
18.002	204.246
18.002	201.296
18.007	174.247
18.118	191.465
18.181	157.042
18.230	195.405
18.285	205.736
18.312	213.606
18.317	185.573
18.319	178.688
18.343	201.804
18.458	191.482
18.461	173.777
18.488	182.631
18.570	197.389
18.597	207.227
18.599	193.948
18.657	189.525
18.679	223.460
18.711	203.298
18.738	211.168
18.797	198.384
18.907	216.586
18.936	211.178
18.991	222.000
19.023	205.772
19.023	201.346
19.191	216.600
19.309	192.507
19.386	233.331
19.395	184.151
19.466	260.876
19.475	215.630
19.529	228.912
19.532	211.207
20.038	237.789];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight','females'};  
bibkey.LW_f = 'Wyk1992'; 
comment.LW_f = 'Data for females';
% males
data.LW_m = [ ... % SVL (cm), weight (g)
5.756	3.972
6.351	5.477
6.805	7.958
7.144	11.417
7.486	7.500
7.626	13.408
7.995	14.410
8.166	10.976
8.478	10.008
8.817	15.926
8.988	15.934
9.185	21.846
9.185	21.846
9.355	22.838
9.724	23.348
10.064	21.889
10.120	29.760
10.347	28.788
10.431	31.743
10.857	28.813
10.857	28.813
10.886	26.356
11.170	26.861
11.338	38.181
11.537	35.732
11.622	37.211
11.678	39.673
11.991	37.230
12.386	46.101
12.500	46.107
12.526	57.420
12.811	51.532
12.811	48.581
12.923	56.948
13.037	53.019
13.092	66.300
13.489	63.369
13.602	66.817
13.801	65.351
14.169	68.320
14.253	76.193
14.479	79.155
14.505	90.468
14.956	105.736
14.958	98.359
15.101	89.022
15.155	107.221
15.298	101.327
15.353	110.674
15.353	107.723
15.464	124.450
15.638	102.819
15.664	112.656
15.947	119.063
16.034	109.723
16.314	125.967
16.428	122.530
16.456	128.925
16.649	154.508
16.730	176.151
16.734	154.512
16.792	148.613
16.847	158.452
16.873	171.240
16.906	146.652
17.100	173.710
17.217	152.077
17.356	166.346
17.528	157.994
17.554	171.765
17.580	182.095
17.662	201.771
17.726	163.905
17.748	196.365
17.776	198.826
17.777	193.416
17.831	206.697
17.835	184.074
17.893	179.651
17.942	218.014
17.943	215.063
17.981	164.409
18.093	170.317
18.147	183.598
18.198	218.518
18.234	177.700
18.234	174.258
18.458	192.466
18.568	211.160
18.569	204.274
18.621	228.375
18.791	229.859
18.800	181.663
18.885	183.634
19.026	188.067
19.308	196.442];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight','males'};  
bibkey.LW_m = 'Wyk1992'; 
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwp = 5 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'scaled functional response seems to increase slightly with age';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Called sungazer because of its distinctive thermoregulatory behaviour of elevating the anterior parts of the body by extending its fore limbs, usually near the entrance of its burrow as if looking at the sun';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XVBV'; % Cat of Life
metaData.links.id_ITIS = '1141830'; % ITIS
metaData.links.id_EoL = '1056774'; % Ency of Life
metaData.links.id_Wiki = 'Smaug_giganteus'; % Wikipedia
metaData.links.id_ADW = 'Cordylus_giganteus'; % ADW
metaData.links.id_Taxo = '4684572'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Smaug&species=giganteus'; % ReptileDB
metaData.links.id_AnAge = 'Cordylus_giganteus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Smaug_giganteus}}';
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
bibkey = 'Wyk1992'; type = 'phdthesis'; bib = [ ... 
'author = {J.H. van Wyk}, ' ... 
'year = {1992}, ' ...
'title = {Life history and physiological ecology of the lizard \emph{Cordylus giganteus}}, ' ...
'school = {University of Cape Town, Rondebosch 7700, South Africa}, ' ...
'howpublished = {\url{https://open.uct.ac.za/bitstream/handle/11427/16002/thesis_sci_1992_van_wyk_johannes_h.pdf?sequence=1&isAllowed=y}}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Cordylus_giganteus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
