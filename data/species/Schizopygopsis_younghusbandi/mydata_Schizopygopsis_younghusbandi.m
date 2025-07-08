  function [data, auxData, metaData, txtData, weights] = mydata_Schizopygopsis_younghusbandi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Schizopygopsis_younghusbandi'; 
metaData.species_en = 'Brahmaputra carb'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 12];

%% set data
% zero-variate data
data.tp = 7*365;      units.tp = 'd';  label.tp = 'age at puberty for females';  bibkey.tp = 'DuanHuos2018';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4.4*365;      units.tpm = 'd';  label.tpm = 'age at puberty for males';  bibkey.tpm = 'DuanHuos2018';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 17*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'DuanXie2014';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30.8;    units.Lp = 'cm'; label.Lp = 'std length at puberty for females'; bibkey.Lp = 'DuanHuos2018';
data.Lpm = 22.2;    units.Lpm = 'cm'; label.Lpm = 'std length at puberty for males'; bibkey.Lpm = 'DuanHuos2018';
data.Li = 35.8;    units.Li = 'cm'; label.Li = 'ultimate std length for females';            bibkey.Li = 'DuanXie2014';
data.Lim = 30.3;    units.Lim = 'cm'; label.Lim = 'ultimate std length for males';            bibkey.Lim = 'DuanXie2014';
  comment.Lim = 'based on Li*28.05/33.2 from tL data';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwi = 598.1;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';               bibkey.Wwi = 'DuanXie2014';
 
data.Ri = 18682/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'DuanHuos2018';
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length-weight
data.tL_fm = [ ... % time since birth (yr), std length (cm), female, male
    1  2.86  2.86
    2 10.63 10.33
    3 17.40 16.20
    4 24.42 22.42
    5 27.28 24.98
    6 29.28 25.91
    7 30.38 25.83
    8 31.43 28.85
    9 33.01 28.53
   10 33.20 28.05
   12 NaN   26.40
   13 34.27 NaN
   17 35.80 NaN];
data.tL_fm (:,1) = (.5 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm = C2K(10);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'female', 'male'}};
bibkey.tL_fm = 'DuanXie2014';

% length-weight
data.LWw = [ ... % std length (cm), wet weight (g)
3.358	0.947
3.704	1.363
4.050	3.197
4.347	0.255
4.446	2.030
4.544	5.459
4.792	0.865
5.039	6.576
5.236	6.565
5.484	1.970
5.681	6.539
5.830	4.240
6.225	4.218
6.374	1.919
6.769	3.042
7.263	9.884
7.412	3.005
7.560	6.431
7.906	7.557
8.104	7.545
8.450	12.106
8.796	9.796
9.340	13.200
9.390	7.472
9.735	13.177
9.933	16.601
10.082	8.577
10.229	17.729
10.476	20.005
10.576	14.274
10.823	15.405
11.070	19.971
11.267	23.395
11.614	17.650
11.712	18.789
12.207	23.341
12.552	25.611
13.739	26.688
14.034	42.702
14.035	33.542
14.579	39.236
14.727	34.647
14.875	43.799
15.221	39.199
15.468	48.345
16.060	65.487
16.061	46.021
16.208	60.898
16.654	54.002
16.851	67.732
17.246	73.434
17.593	64.254
18.431	91.687
18.529	104.277
18.679	85.948
18.926	79.063
19.073	99.665
19.467	112.238
19.666	103.067
19.814	107.638
19.912	121.373
20.160	107.618
20.258	116.773
20.260	97.307
20.355	141.958
20.356	124.783
20.504	130.500
20.506	112.179
20.798	167.124
20.947	155.665
21.146	137.333
21.198	117.864
21.244	148.778
21.297	107.553
21.345	131.596
21.492	140.748
21.740	129.284
21.741	117.833
21.887	155.611
21.935	165.914
22.038	122.396
22.135	140.711
22.231	173.912
22.381	159.018
22.478	179.623
22.528	173.895
22.530	147.559
22.727	156.708
22.728	141.823
22.873	191.051
22.970	210.511
22.975	147.534
23.119	205.922
23.121	179.586
23.169	193.324
23.219	185.306
23.223	141.794
23.270	164.692
23.370	156.671
23.467	183.002
23.563	213.912
23.667	147.494
23.710	232.224
23.713	187.568
23.714	177.262
23.715	162.377
24.005	243.658
24.007	226.482
24.008	216.177
24.010	189.841
24.303	233.335
24.354	208.142
24.358	170.355
24.454	204.701
24.504	190.958
24.556	165.764
24.599	240.189
24.701	206.977
24.798	225.292
24.799	217.277
24.900	187.500
24.944	250.474
25.000	178.334
25.050	172.606
25.094	239.015
25.147	195.501
25.295	200.073
25.445	180.598
25.491	216.092
25.540	224.104
25.637	244.709
25.782	283.632
25.790	190.884
25.929	296.219
25.935	229.807
25.935	225.227
25.979	296.217
25.987	196.598
26.033	237.817
26.131	252.696
26.184	204.602
26.185	192.006
26.278	261.848
26.281	230.932
26.327	273.296
26.431	211.458
26.528	233.208
26.622	292.745
26.623	281.294
26.678	214.879
26.772	267.545
26.819	299.604
26.928	181.658
27.023	220.584
27.071	244.627
27.165	304.164
27.167	273.248
27.169	253.782
27.220	234.313
27.221	227.443
27.320	217.132
27.321	212.552
27.364	284.687
27.365	281.252
27.453	410.636
27.457	354.529
27.466	250.330
27.468	228.574
27.609	311.009
27.704	359.095
27.761	267.489
27.800	399.166
27.854	344.201
27.999	380.834
28.057	278.922
28.060	239.991
28.100	359.072
28.108	256.018
28.151	339.604
28.153	308.688
28.201	332.731
28.201	328.150
28.402	285.773
28.447	339.587
28.454	266.304
28.455	253.708
28.505	235.385
28.545	354.467
28.590	405.991
28.593	368.204
28.601	282.326
28.695	340.718
28.696	328.122
28.796	312.086
28.797	292.620
28.800	259.414
28.846	300.633
28.886	415.134
28.895	310.935
28.901	239.942
28.940	362.459
28.989	370.472
29.139	353.288
29.235	385.343
29.240	320.076
29.242	300.610
29.334	378.467
29.383	389.915
29.387	339.533
29.389	318.922
29.485	348.688
29.488	309.756
29.490	289.145
29.491	281.130
29.685	323.485
29.777	400.198
29.779	385.312
29.824	431.111
29.828	391.034
29.835	301.721
29.917	505.533
29.924	419.655
29.928	369.273
29.929	358.968
29.981	325.758
29.983	304.003
30.023	424.229
30.125	379.567
30.127	360.101
30.173	396.740
30.215	495.211
30.226	353.225
30.230	312.004
30.271	410.475
30.273	382.994
30.319	434.518
30.373	370.393
30.421	389.855
30.425	339.474
30.476	325.730
30.566	434.504
30.618	401.295
30.623	336.027
30.672	344.040
30.773	316.553
30.817	385.253
30.819	356.627
30.821	332.581
30.822	321.130
30.863	429.906
30.910	452.805
30.911	440.209
31.058	455.086
31.061	424.170
31.065	381.803
31.104	500.885
31.158	445.920
31.214	362.329
31.266	337.135
31.352	496.291
31.402	488.273
31.410	389.799
31.411	376.058
31.450	505.445
31.506	428.725
31.548	513.455
31.709	357.721
31.790	578.708
31.812	307.333
31.852	419.544
31.905	379.465
31.999	444.727
32.007	349.688
32.053	382.892
32.087	575.256
32.100	412.660
32.148	433.268
32.153	368.001
32.243	477.919
32.243	477.919
32.244	467.614
32.247	427.537
32.250	398.911
32.300	385.168
32.391	484.781
32.437	522.564
32.448	394.320
32.493	450.424
32.494	429.813
32.537	516.834
32.546	408.054
32.591	460.724
32.593	434.388
32.738	472.166
32.782	545.445
32.930	539.712
32.979	546.579
33.039	419.477
33.077	558.024
33.181	497.331
33.184	456.109
33.188	410.308
33.229	514.504
33.432	457.240
33.479	485.864
33.483	435.482
33.524	539.678
33.641	310.663
33.725	498.445
33.774	507.602
34.215	547.653
34.222	470.936
34.267	519.025
34.365	527.034
34.567	475.496
34.866	453.723
35.011	490.356
35.646	581.923
35.695	588.790
36.041	597.931
36.384	624.247
42.326	523.143];
units.LWw = {'cm', 'g'}; label.LWw  = {'std length', 'wet weight'};  
bibkey.LWw = 'DuanXie2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.tp = 3 * weights.tp;
weights.tpm = 3 * weights.tpm;
weights.Wwb = 3 * weights.Wwb;
weights.Lp = 0 * weights.Lp;
weights.Lpm = 0 * weights.Lpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic species found only in the middle reaches of the Yarlung Tsangpo River';
metaData.bibkey.F1 = 'DuanXie2014'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VCNC'; % Cat of Life
metaData.links.id_ITIS = '690040'; % ITIS
metaData.links.id_EoL = '217813'; % Ency of Life
metaData.links.id_Wiki = 'Schizopygopsis_younghusbandi'; % Wikipedia
metaData.links.id_ADW = 'Schizopygopsis_younghusbandi'; % ADW
metaData.links.id_Taxo = '186926'; % Taxonomicon
metaData.links.id_WoRMS = '1018489'; % WoRMS
metaData.links.id_fishbase = 'Schizopygopsis-younghusbandi'; % fishbase

%% References
bibkey = 'DuanXie2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12439}, ' ...
'author = {Duan, Y.-J. and Xie, C.-X. and Zhou, X.-J. and Ma, B.-S. and Huo, B.}, ' ...
'year = {2014}, ' ...
'title = {Age and growth characteristics of \emph{Schizopygopsis younghusbandi} {R}egan, 1905 in the {Y}arlung {T}sangpo {R}iver in {T}ibet, {C}hina}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {30(5)}, '...
'pages = {948–954}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DuanHuos2018'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00343-018-7115-8}, ' ...
'author = {Duan, Youjian.-J. and Huos, Bin and Ma, Baoshan and Yang, Xin and Xie, Congxin}, ' ...
'year = {2018}, ' ...
'title = {Reproductive biology of \emph{Schizopygopsis younghusbandi} {R}egan 1905 ({C}yprinidae: {S}chizothoracinae) in the middle  reaches of {Y}arlung {T}sangpo {R}iver, {C}hina}, ' ... 
'journal = {Journal of Oceanology and Limnology}, ' ...
'volume = {36(5)}, '...
'pages = {1825-1834}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Schizopygopsis-younghusbandi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
