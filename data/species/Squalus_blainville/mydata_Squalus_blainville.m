function [data, auxData, metaData, txtData, weights] = mydata_Squalus_blainville

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Squalidae';
metaData.species    = 'Squalus_blainville'; 
metaData.species_en = 'Longnose spurdog'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAm', 'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Wwb';  'Ri'};
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2018 12 10];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 17*30.5;units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'CannRizz1995';    
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5.1*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'CannRizz1995';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3.3*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'CannRizz1995';
  temp.tpm = C2K(17);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 16;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';        bibkey.Lb  = 'CannRizz1995';

data.Wwb = 50; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'CannRizz1995';
  comment.Wwb = '45 to 55 g';

data.Ri  = 2/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter, 1 ltter per 2 yr';
  
% uni-variate data

% length-wet weight
data.LW_f = [ ...  total length (cm), wet weight (g)		
15.519	11.808
15.741	11.830
16.847	32.386
16.848	22.165
17.071	17.077
17.514	17.122
17.955	32.500
18.178	27.412
19.286	27.525
19.508	27.548
19.948	53.146
20.128	334.255
21.056	58.370
21.058	43.038
21.058	43.038
21.503	32.862
22.166	48.262
22.611	38.086
22.829	58.552
23.719	43.310
24.155	94.462
24.380	68.932
25.268	58.801
26.155	58.892
26.598	64.048
27.037	94.757
27.889	329.938
28.146	89.759
29.030	115.403
29.032	100.071
29.693	125.693
29.910	156.379
29.916	120.605
30.581	120.673
31.681	177.003
31.686	146.339
31.922	49.259
32.791	172.006
34.116	207.916
34.119	182.363
35.003	208.007
35.450	182.499
35.887	223.430
36.549	243.940
36.776	213.299
37.433	264.474
37.438	228.699
37.875	274.740
38.089	325.869
38.314	305.449
38.528	356.579
38.764	259.499
39.423	305.563
39.428	269.788
40.307	326.096
41.190	351.740
41.407	382.427
41.415	326.209
41.420	290.435
41.626	397.781
42.083	305.835
42.290	408.071
42.519	362.097
43.162	510.374
43.175	423.493
43.187	336.612
44.068	377.588
44.281	438.938
44.498	469.625
44.949	418.564
45.377	525.933
45.390	433.941
45.394	408.388
45.553	832.595
45.827	479.982
45.831	454.429
45.831	454.429
46.038	551.554
46.062	388.013
46.267	505.581
46.499	434.054
46.717	459.630
46.926	546.534
47.163	439.233
47.587	577.266
47.817	515.961
48.046	469.988
48.053	418.881
48.691	608.043
49.136	597.867
49.348	659.218
49.364	551.894
49.370	511.009
49.374	485.456
50.020	613.290
50.248	572.427
50.461	633.778
51.113	720.727
51.126	633.846
51.324	792.299
51.332	741.192
51.414	184.131
51.570	628.781
51.768	792.344
52.012	639.047
52.671	680.000
52.677	639.115
52.878	777.126
52.889	705.576
52.907	582.921
53.555	700.534
54.209	777.262
54.212	756.819
54.216	726.155
54.660	726.200
54.864	843.768
55.323	741.600
55.522	894.943
55.526	869.389
55.530	838.725
55.534	813.172
55.975	828.549
56.391	1012.578
56.398	966.582
56.621	956.384
56.650	762.179
57.076	879.769
57.522	864.483
57.526	833.819
57.950	966.741
57.958	915.635
58.163	1028.092
58.388	1002.561
58.619	941.256
58.622	920.813
58.829	1023.049
59.048	1043.514
59.481	1109.998
59.508	926.014
59.930	1074.269
60.133	1202.058
60.144	1125.398
60.328	1380.953
60.782	1309.450
60.791	1248.122
60.794	1227.679
61.669	1309.540
61.678	1248.212
62.359	1140.957
62.509	1626.492
62.526	1508.946
62.535	1447.619
63.036	1064.365
63.218	1330.142
63.447	1284.168
63.452	1248.394
63.456	1217.730
63.854	1529.525
63.886	1309.767
64.084	1473.331
64.100	1360.896
64.462	1912.892
64.726	1626.718
64.744	1504.062
65.416	1458.135
65.418	1447.913
65.609	1652.362
65.838	1606.389
66.497	1647.342
67.806	1795.687
67.809	1775.244
67.840	1560.597
68.068	1519.734
68.720	1611.794
68.722	1596.462
68.902	1877.571
68.938	1637.370
69.570	1862.307
69.582	1780.536
70.456	1862.398
71.234	2603.533
71.289	2230.455
71.316	2046.472
71.981	2051.650
73.487	2363.559
73.831	3033.100
73.972	2077.408
77.070	2123.721
91.570	3029.803];
units.LW_f = {'cm', 'g'};     label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'CannRizz1995';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... total length (cm)	wet weight (g)		
16.001	17.413
16.357	22.587
17.425	32.980
17.426	43.237
18.314	33.094
18.847	33.163
19.027	53.699
19.914	33.299
19.916	53.813
20.982	43.693
20.985	74.462
20.992	130.874
22.582	43.898
22.585	69.539
23.830	79.955
24.198	177.438
24.717	59.556
24.720	85.198
25.430	75.032
26.674	75.192
26.677	100.833
27.393	141.951
27.566	95.819
28.276	90.782
28.280	121.551
28.993	142.156
29.880	121.757
30.234	106.417
30.948	137.278
30.949	142.407
30.953	178.304
32.559	224.664
32.729	163.148
32.732	188.789
34.156	199.228
34.329	158.224
34.693	235.194
35.222	194.236
35.225	225.006
35.941	266.123
36.474	255.935
36.646	214.932
37.898	276.631
38.071	230.499
39.141	261.405
39.334	389.635
39.504	322.990
39.852	261.497
39.856	297.395
39.863	353.806
40.211	292.312
40.573	343.640
40.925	312.916
41.994	333.566
42.349	328.483
42.533	379.789
42.718	446.480
43.423	395.288
43.773	344.051
43.792	503.027
44.484	344.142
44.668	395.447
44.673	441.602
45.200	385.259
45.389	477.591
45.394	518.617
45.560	426.331
45.907	354.581
46.100	477.682
47.338	421.431
47.342	462.457
47.352	539.381
47.526	513.763
47.529	539.404
48.248	601.035
48.415	508.748
48.773	529.307
49.310	565.273
49.317	621.684
49.481	508.885
49.501	672.990
50.196	539.746
50.200	575.644
50.206	621.798
50.398	739.772
50.921	657.788
50.935	770.610
51.270	601.422
51.282	703.988
51.285	724.501
51.618	539.928
51.624	586.083
51.630	642.494
51.640	724.546
51.644	755.316
52.357	770.792
52.698	647.759
52.702	683.657
52.710	750.325
53.063	729.857
53.071	796.525
53.235	683.725
53.252	827.317
53.593	704.284
54.135	776.148
54.138	796.661
54.487	745.424
54.499	847.990
54.673	812.115
55.196	725.002
55.203	786.542
55.215	883.979
55.216	899.364
55.563	822.485
56.077	663.577
56.279	863.603
56.603	602.106
56.636	879.033
56.804	791.875
57.704	889.426
57.710	935.581
57.719	1012.505
58.780	966.487
58.788	1033.155
60.756	1141.100
66.280	1244.372
70.828	2121.878
71.488	1686.065
71.667	1701.473
73.137	2106.790];
units.LW_m = {'cm', 'g'};     label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'CannRizz1995';
comment.LW_m = 'Data for males';

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.980	27.529
1.015	22.824
1.015	23.412
1.015	26.941
1.033	28.000
1.033	30.824
1.978	31.412
1.978	31.882
2.013	33.059
2.013	36.941
2.013	37.529
2.013	37.882
2.013	38.941
2.976	42.235
2.976	43.412
2.993	36.941
2.993	37.412
2.993	46.588
2.993	48.118
3.011	41.059
3.028	37.882
3.028	38.353
3.028	41.647
3.028	46.353
3.974	52.000
3.991	48.000
3.991	53.059
4.026	47.294
4.044	43.765
4.954	56.588
4.954	57.176
4.972	63.647
4.989	57.529
4.989	58.588
5.024	52.941
5.952	63.176
5.969	58.000
5.969	58.353
5.969	59.294
5.969	63.412
5.969	64.000
5.969	64.706
5.969	65.059
5.969	66.118
5.987	60.471
5.987	71.294
6.915	64.118
6.950	64.706
7.965	74.118
7.982	70.353
7.982	72.235
8.000	72.824
8.000	77.882];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CannRizz1995';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.963	259.936
0.963	264.614
0.963	273.971
0.980	229.531
0.998	283.338
1.978	318.712
1.978	325.730
1.996	345.618
1.996	367.840
1.996	376.027
2.958	413.736
2.958	417.244
2.958	423.092
2.958	433.619
2.958	466.367
2.958	469.876
2.976	348.244
2.976	358.770
2.976	363.448
2.976	475.729
2.993	371.641
2.993	384.506
3.921	506.415
3.939	486.537
3.939	513.437
3.939	518.116
3.939	520.455
3.956	526.308
3.956	549.700
3.956	555.548
3.956	560.226
3.974	429.237
3.974	463.155
3.974	466.664
3.974	472.512
4.954	519.582
4.954	528.939
5.934	561.974
5.934	573.670
5.934	576.009
5.934	581.857
5.934	598.231
6.950	721.335
6.967	735.376
8.018	722.817];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
data.tL_m(:,2) = data.tL_m(:,2)/ 10; % convert mm to cm
units.tL_m = {'d', 'cm'};     label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(17);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CannRizz1995';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
mmetaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Ovoviviparous. Depth around 50-149m, but have been found deeper than 700m.';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ZDVP'; % Cat of Life
metaData.links.id_ITIS = '160621'; % ITIS
metaData.links.id_EoL = '46560202'; % Ency of Life
metaData.links.id_Wiki = 'Squalus_blainville'; % Wikipedia
metaData.links.id_ADW = 'Squalus_blainville'; % ADW
metaData.links.id_Taxo = '188005'; % Taxonomicon
metaData.links.id_WoRMS = '105924'; % WoRMS
metaData.links.id_fishbase = 'Squalus-blainville'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Squalus_blainville}}';  
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
bibkey = 'CannRizz1995'; type = 'Article'; bib = [ ... 
'author = {L. Cannizzaro and P. Rizzo and D. Levi and S. Gancitano}, ' ...
'year = {1995}, ' ...
'title  = {Age determination and growth of \emph{Squalus blainvillei} ({R}isso, 1826)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {23}, ' ...
'pages = {113-125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Squalus_blainville}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/summary/Squalus-blainville.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

