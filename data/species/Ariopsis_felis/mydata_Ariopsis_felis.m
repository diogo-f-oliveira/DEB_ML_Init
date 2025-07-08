function [data, auxData, metaData, txtData, weights] = mydata_Ariopsis_felis
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Ariopsis_felis'; 
metaData.species_en = 'Hardhead catfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 09 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data;

data.am = 24*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'FlinMidw2019';
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.6;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 70;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 2.145; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'smithonian'; 
  comment.Wwb = 'based on egg diameter of 16 mm: pi/6*1.6^3';
data.Wwp  = 23.36; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00759*Lp^3.17, see F1';
data.Wwi  = 5.36e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00759*Li^3.17, see F1';

data.Ri  = 65/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'smithonian';   
  temp.Ri = C2K(30); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.740	23.094
1.810	23.724
1.811	24.143
1.882	25.926
2.015	21.209
2.016	22.572
2.087	24.250
2.093	29.492
2.118	20.057
2.120	21.944
2.815	26.038
2.887	27.926
2.986	24.153
3.019	22.056
3.092	26.355
3.128	27.718
3.931	34.539
3.963	32.233
3.996	30.766
4.068	33.911
4.205	32.550
4.310	33.284
4.894	29.934
4.899	34.757
4.927	28.467
4.932	33.604
5.004	35.701
5.066	28.678
5.072	34.653
5.175	33.816
5.211	35.808
5.239	29.727
5.897	30.362
5.902	35.394
5.968	32.354
5.970	33.612
6.005	34.451
6.877	41.692
6.904	34.563
6.911	41.063
7.010	36.137
7.012	37.919
7.115	38.025
7.186	39.283
7.838	34.990
7.946	39.290
7.978	36.669
7.979	37.088
8.046	34.992
8.117	37.299
8.188	38.662
8.845	39.192
9.018	38.669
9.018	39.298
9.019	40.347
9.258	37.203
9.814	39.724
9.843	34.797
9.881	37.418
9.917	39.096
9.919	40.878
10.017	35.637
10.020	38.048
10.023	40.774
10.023	41.298
10.121	35.743
10.159	39.098
10.191	36.372
10.954	38.999
10.955	39.838
10.956	40.572
10.992	42.459
11.025	40.572
11.062	43.089
11.095	41.412
11.163	39.944
11.229	37.324
11.267	40.784
11.961	42.572
11.993	40.790
12.060	38.065
12.063	41.524
12.235	40.163
12.269	39.534
12.271	41.421
12.996	40.798
13.102	43.210
13.168	40.275
13.169	41.114
13.236	38.598
13.276	43.736
13.929	40.701
15.105	41.130
15.245	42.808
17.076	40.726
17.146	42.194
17.248	40.623
18.011	42.306
18.079	41.468
18.321	41.784
18.909	41.160
20.261	45.260
24.134	45.920];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1));
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(30);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FlinMidw2019';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
-0.168	10.314
-0.167	11.153
-0.166	12.411
-0.066	9.684
0.072	9.788
0.073	11.255
0.696	14.918
0.870	17.433
1.074	15.439
1.181	19.212
1.769	22.036
1.907	22.664
1.908	23.502
2.041	19.307
2.115	24.444
2.203	10.499
2.874	27.476
2.976	26.427
3.837	28.410
3.875	32.079
3.911	33.336
3.941	29.142
4.145	26.834
4.221	34.067
4.737	34.586
4.799	28.190
4.938	29.656
4.977	33.535
5.013	35.841
5.701	35.834
5.802	33.841
5.866	29.751
5.900	29.227
5.904	32.896
5.941	35.517
5.976	36.565
6.008	34.153
6.043	34.677
6.072	29.015
6.144	32.789
6.145	33.208
6.764	34.355
6.870	36.241
6.899	31.313
6.903	35.297
6.938	36.030
7.008	36.868
7.109	35.399
7.140	32.464
7.214	36.552
7.216	38.544
7.279	33.301
7.795	33.505
7.797	36.231
7.845	48.916
7.867	36.650
7.968	34.657
7.968	35.495
7.969	36.019
8.039	37.277
8.173	34.130
8.177	38.114
8.762	38.108
8.832	39.994
8.931	36.114
8.963	33.807
8.967	37.372
8.970	40.517
9.002	38.105
9.106	39.153
9.107	39.991
9.135	33.701
9.140	38.523
9.168	32.547
9.205	35.168
9.241	36.111
9.759	39.251
9.825	36.419
9.926	34.741
9.998	37.256
9.999	38.409
10.034	38.828
10.065	36.102
10.135	36.626
10.273	37.882
10.275	39.455
10.791	39.974
10.855	35.046
10.924	35.569
10.957	34.730
10.960	37.666
10.996	39.028
11.063	36.931
11.092	32.317
11.130	35.357
11.165	35.986
11.169	39.970
11.825	42.584
11.959	39.752
11.990	36.606
12.030	41.743
12.131	39.645
12.152	27.064
12.885	38.274
12.919	37.855
13.063	44.039
13.123	35.756
13.124	36.804
13.161	39.215
13.881	37.216
14.155	36.584
15.852	48.413
16.116	38.555
16.877	43.474
16.943	40.329
18.005	37.172];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1));
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(30);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FlinMidw2019';
comment.tL_m = 'Data for males';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
5.132	2.096
5.625	4.243
6.666	8.534
7.159	10.682
7.487	6.291
8.089	6.247
9.349	12.706
9.511	2.590
9.511	2.590
9.949	4.805
9.950	3.929
10.388	0.470
10.609	19.164
10.937	14.774
11.320	16.929
12.414	12.483
12.689	19.013
13.292	25.519
14.714	18.866
15.373	34.102
15.920	29.695
16.413	31.842
17.674	47.035
18.110	36.086
19.427	62.191
19.535	46.899
19.537	64.366
19.647	68.725
20.084	64.326
20.469	77.399
20.741	62.095
21.072	81.722
21.235	77.343
21.564	77.319
21.892	75.112
21.947	72.924
22.114	99.113
22.385	72.893
22.548	61.964
22.661	96.890
22.720	140.554
22.880	94.691
23.428	103.384
23.591	94.639
23.648	109.919
23.754	83.710
23.865	96.802
23.935	229.985
24.088	131.721
24.140	109.883
24.637	142.598
24.690	125.127
24.909	127.294
25.125	105.444
25.511	129.434
25.894	122.855
26.063	166.511
26.067	205.812
26.169	140.303
26.223	133.749
26.338	179.592
26.388	140.287
26.504	199.230
26.671	225.419
27.213	170.794
27.596	168.583
27.649	155.479
27.765	214.422
27.869	164.197
28.255	188.186
28.423	220.925
28.534	238.384
28.586	212.179
28.690	164.137
28.699	240.555
28.858	192.509
29.025	223.064
29.074	166.292
29.146	330.042
29.184	175.018
29.194	262.353
29.240	185.931
29.244	225.232
29.246	242.699
29.300	236.145
29.357	255.791
29.364	319.109
29.626	212.104
29.843	190.254
29.848	236.105
29.851	262.306
29.956	225.180
30.011	227.359
30.077	327.791
30.179	262.282
30.237	290.662
30.286	240.440
30.394	222.965
30.501	198.939
30.570	334.306
30.612	218.582
30.728	277.525
30.732	312.460
30.773	188.003
30.780	251.321
30.842	314.635
30.890	255.680
30.995	216.371
31.002	281.872
31.004	299.339
31.056	275.318
31.057	279.685
31.107	236.013
31.160	222.909
31.175	356.096
31.224	305.874
31.264	168.316
31.386	284.028
31.388	303.678
31.390	321.145
31.391	329.879
31.440	275.290
31.493	262.186
31.610	334.230
31.658	270.908
31.662	310.209
31.769	288.367
31.772	308.017
31.774	327.668
31.825	299.280
32.046	310.181
32.199	211.916
32.209	299.252
32.369	264.306
32.476	240.280
32.598	353.809
32.653	360.355
32.818	364.710
32.875	386.540
33.147	369.052
33.196	318.831
33.199	340.664
33.260	401.795
33.313	388.691
33.362	331.919
33.418	347.199
33.421	375.583
33.470	320.994
33.584	360.287
33.691	340.629
33.699	410.497
33.700	423.597
33.745	334.074
33.753	408.310
33.756	430.144
33.798	316.603
33.798	316.603
33.852	312.233
33.917	401.748
33.979	469.429
34.031	438.857
34.032	454.141
34.080	390.819
34.081	403.919
34.085	434.486
34.147	504.351
34.292	325.301
34.296	364.602
34.300	403.903
34.417	467.213
34.462	379.874
34.462	382.057
34.512	336.202
34.512	340.569
34.515	364.586
34.519	403.887
34.521	416.987
34.576	421.350
34.626	377.678
34.627	390.779
34.683	395.142
34.689	454.093
34.740	414.788
34.749	499.940
34.786	342.732
34.788	360.199
34.794	412.601
34.893	318.707
34.904	412.593
34.907	443.160
34.953	364.554
35.009	375.467
35.067	401.664
35.071	443.148
35.076	484.633
35.121	401.660
35.122	408.210
35.124	427.861
35.125	432.227
35.172	364.538
35.174	379.822
35.174	384.189
35.176	399.473
35.178	421.306
35.228	377.635
35.284	386.364
35.286	403.831
35.289	436.582
35.306	591.603
35.337	368.893
35.339	388.544
35.339	390.727
35.393	386.356
35.505	408.182
35.611	373.240
35.617	430.008
35.618	440.925
35.627	523.894
35.668	390.703
35.669	408.170
35.671	419.087
35.775	375.411
35.829	364.491
35.832	388.508
35.832	390.691
35.942	399.417
35.950	469.285
36.055	432.160
36.068	543.512
36.097	314.253
36.108	412.505
36.165	429.968
36.218	421.231
36.224	471.449
36.234	567.518
36.270	390.659
36.325	399.389
36.344	567.510
36.384	432.136
36.495	449.595
36.550	451.774
36.600	410.286
36.605	449.587
36.610	499.805
36.658	434.299
36.712	432.112
36.764	403.724
36.775	501.976
36.825	460.488
36.838	582.758
36.935	462.663
37.039	414.621
37.051	521.607
37.202	405.875
37.205	432.076
37.212	493.211
37.228	639.498
37.278	600.193
37.379	525.950
37.381	539.050
37.385	573.984
37.390	622.019
37.437	554.330
37.493	558.693
37.493	560.876
37.494	569.609
37.535	447.336
37.602	554.318
37.602	563.051
37.764	534.655
37.821	560.852
37.860	412.378
37.977	480.055
38.008	268.262
38.036	521.535
38.043	584.853
38.097	582.666
38.103	630.701
38.184	375.236
38.200	519.340
38.205	563.008
38.210	613.226
38.362	501.861
38.471	499.669
38.479	571.721
38.571	405.776
38.580	488.744
38.590	582.630
38.628	429.789
38.642	558.609
38.648	613.194
38.697	562.972
38.753	569.518
38.811	602.265
38.814	626.282
38.860	545.493
38.914	538.938
38.918	576.056
38.924	628.457
39.082	580.411
39.133	545.473
39.136	569.490
39.137	580.407
39.238	497.430
39.351	536.723
39.364	652.443
39.409	558.553
39.465	569.466
39.467	591.300
39.524	610.946
39.533	698.282
39.575	578.192
39.579	613.126
39.585	669.894
39.585	669.894
39.636	637.139
39.791	549.792
39.856	643.673
39.871	781.227
39.911	648.036
39.967	656.766
40.026	698.246
40.133	674.221
40.184	639.283
40.294	643.642
40.356	709.139
40.397	584.682
40.409	691.668
40.459	656.730
40.479	831.401
40.524	746.245
40.528	783.362
40.573	689.473
40.606	495.147
40.674	613.046
40.735	671.994
40.840	630.501
40.851	728.754
40.956	691.628
40.961	741.846
40.964	768.047
41.005	643.590
41.125	739.651
41.198	905.584
41.240	785.494
41.244	820.428
41.333	637.016
41.562	728.702
41.566	763.636
41.622	772.366
41.664	654.459
41.665	663.192
41.679	796.379
42.122	842.198
42.166	739.575
42.169	770.143
42.561	855.267
42.666	809.408
42.670	842.159
42.774	796.299
43.058	887.982
43.058	887.982
43.067	975.317
43.159	809.372
43.210	780.984
43.696	719.813
43.926	818.050
44.259	855.143
45.031	911.856
45.631	889.978];
units.LWw   = {'d', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'FlinMidw2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 30 * weights.tL_f;
weights.tL_m = 30 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: W in g = 0.00759 *(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = 'GMX9'; % Cat of Life
metaData.links.id_ITIS = '680665'; % ITIS
metaData.links.id_EoL = '223038'; % Ency of Life
metaData.links.id_Wiki = 'Ariopsis_felis'; % Wikipedia
metaData.links.id_ADW = 'Ariopsis_felis'; % ADW
metaData.links.id_Taxo = '259219'; % Taxonomicon
metaData.links.id_WoRMS = '158709'; % WoRMS
metaData.links.id_fishbase = 'Ariopsis-felis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ariopsis_felis}}';
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
bibkey = 'FlinMidw2019'; type = 'Article'; bib = [ ... 
'doi = {10.1002/mcf2.10089}, ' ...
'author = {Shane Flinn and Stephen Midway and Andrew Ostrowski},'...
'title = {Age and Growth of Hardhead Catfish and Gafftopsail Catfish in Coastal {L}ouisiana, {U}{S}{A}},'...
'journal = {Marine and Coastal Fisheries: Dynamics, Management, and Ecosystem Science}, '...
'volume = {11(1)}, '...
'year = {2019}, '...
'pages = {362-371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ariopsis-felis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'smithonian'; type = 'Misc'; bib = ...
'howpublished = {\url{https://naturalhistory2.si.edu/smsfp/irlspec/Ariops_felis.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

