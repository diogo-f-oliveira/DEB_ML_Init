function [data, auxData, metaData, txtData, weights] = mydata_Haemulon_plumierii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Haemulon_plumierii'; 
metaData.species_en = 'White grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2023 11 02]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 02]; 

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'VascTeix2018';   
  temp.am = C2K(25.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 53;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwi = 4.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 312000/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time (D), total length (cm)
0.996	12.372
0.996	10.486
1.956	15.589
1.993	12.864
1.993	15.100
1.993	16.148
1.993	17.685
2.030	14.471
2.030	18.244
2.066	13.773
2.952	19.644
2.952	14.474
2.952	14.125
2.989	15.523
2.989	15.033
3.026	15.872
3.063	18.387
3.063	17.758
3.063	17.060
3.063	16.710
3.063	16.431
3.948	15.805
3.948	16.574
3.948	20.276
3.985	16.155
3.985	19.298
3.985	19.648
4.022	17.133
4.059	17.692
4.059	18.111
4.945	16.577
4.945	16.438
4.982	21.328
4.982	20.839
4.982	19.581
4.982	16.927
5.018	20.350
5.018	18.254
5.018	17.067
5.055	19.302
5.055	18.953
5.055	17.626
5.867	20.632
5.941	17.209
6.015	17.978
6.015	19.725
6.089	18.747
6.125	19.236
6.125	21.541
6.125	22.100
6.937	24.269
6.974	23.710
6.974	19.588
7.011	24.688
7.048	23.291
7.048	20.357
7.048	20.078
7.048	18.052
7.085	20.916
7.085	20.776
7.085	18.890
7.085	18.471
7.122	22.523
7.159	21.685
7.970	20.430
8.007	19.941
8.007	21.967
8.007	22.316
8.044	19.103
8.044	21.129
8.044	23.923
8.044	25.251
8.081	23.225
8.155	24.972
8.930	21.901
8.967	25.743
8.967	23.298
9.004	21.342
9.004	20.504
9.041	27.420
9.041	24.975
9.041	22.879
9.041	20.993
9.077	24.626
9.077	24.206
9.151	22.390
9.963	20.786
10.037	22.254
10.037	23.791
10.074	21.346
10.074	22.673
10.074	25.328
10.074	25.887
10.074	26.166
10.074	26.376
10.074	27.004
10.074	27.284
10.923	23.165
10.923	22.955
10.959	29.453
10.959	28.684
11.033	26.868
11.070	26.100
11.070	24.353
11.070	22.816
11.107	22.048
11.919	29.107
11.993	23.029
12.030	23.728
12.030	24.356
12.030	25.684
12.030	29.596
12.103	22.401
12.103	24.636
12.140	26.942
12.177	25.405
13.026	28.202
13.026	25.128
13.063	27.853
13.063	23.941
13.063	23.731
14.059	22.966
14.059	26.320
14.059	27.158
14.059	28.625
14.059	29.533
14.059	29.813
14.096	24.992
14.170	24.224
14.982	23.598
15.092	26.882
15.092	25.415
15.092	24.227
16.052	28.842
16.052	29.261
16.089	23.113
16.125	23.742
16.125	25.628
16.125	26.746
16.125	27.934
16.162	27.235
17.011	24.234
17.085	26.610
17.122	25.143
17.122	24.863
18.044	27.172
18.081	28.569
18.118	25.705
19.041	29.411
19.114	30.319
19.114	30.110
20.074	30.951
21.107	32.352];
data.tL(:,1) = (data.tL(:,1) + 0.9)*365;  % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VascTeix2018';

% length-weight
data.LW = [ ... % total length (cM), weight (g)
10.444	21.543
12.847	38.452
13.549	42.957
13.586	45.228
13.993	46.341
14.104	46.335
14.510	51.993
14.621	50.851
14.732	67.890
14.769	55.388
14.769	47.433
14.880	57.654
15.065	67.871
15.471	59.893
15.471	56.484
15.545	65.571
15.730	64.424
15.804	74.647
15.878	71.234
16.174	78.035
16.322	76.890
16.433	71.202
16.506	74.607
16.728	76.867
16.802	82.545
16.839	87.088
17.024	90.487
17.098	99.574
17.135	79.117
17.394	84.784
17.394	79.102
17.579	108.637
17.726	81.356
17.726	101.811
17.911	101.800
18.096	91.562
18.170	106.331
18.244	96.099
18.392	94.955
18.429	104.043
18.503	111.994
18.651	100.622
18.688	123.347
18.872	109.700
18.872	119.927
18.909	124.471
18.946	102.878
19.057	111.962
19.131	108.549
19.168	117.638
19.316	127.857
19.353	123.309
19.427	132.396
19.427	110.805
19.723	132.379
19.760	128.968
19.908	165.323
19.982	125.546
20.018	150.544
20.203	142.579
20.277	125.529
20.351	123.252
20.388	130.068
20.388	139.159
20.425	145.975
20.536	149.378
20.573	160.740
20.610	133.465
20.721	167.550
20.758	138.002
20.795	143.682
20.869	147.087
20.980	165.262
21.017	155.033
21.017	139.124
21.201	142.522
21.238	139.111
21.275	160.700
21.275	145.927
21.423	148.191
21.497	164.096
21.497	172.051
21.571	153.865
21.645	168.633
21.682	151.586
21.830	149.305
21.867	161.803
21.941	154.980
21.978	162.933
22.052	191.338
22.089	169.745
22.163	177.695
22.200	172.011
22.274	174.280
22.421	183.362
22.421	166.317
22.458	191.314
22.495	175.403
22.606	191.306
22.791	171.977
22.828	184.475
22.865	174.246
22.902	193.562
22.976	218.558
22.976	176.512
23.050	209.463
23.050	178.781
23.161	194.684
23.309	204.903
23.346	198.082
23.383	199.217
23.530	192.390
23.567	217.388
23.863	232.144
23.863	232.144
23.900	201.460
23.937	209.412
24.085	242.358
24.085	218.495
24.122	235.538
24.159	210.536
24.196	191.216
24.196	200.307
24.233	212.805
24.307	198.028
24.344	234.389
24.381	215.069
24.492	225.290
24.566	225.286
24.566	217.331
24.640	245.736
24.713	221.868
24.824	216.180
24.861	230.951
24.861	216.178
24.898	277.539
24.898	246.858
24.935	254.810
24.972	241.172
24.972	213.899
25.157	224.116
25.194	265.023
25.342	290.014
25.342	222.969
25.564	244.547
25.564	244.547
25.638	261.588
25.675	253.632
25.786	285.444
25.896	291.119
26.155	277.468
26.266	270.644
26.266	259.280
26.525	289.947
26.599	300.170
26.599	276.307
26.710	314.937
26.784	304.705
26.821	317.203
26.895	288.790
26.932	350.151
27.153	328.548
27.301	291.039
27.375	312.626
27.745	344.423
28.152	420.536
28.299	335.301
28.521	358.015
28.558	368.241
28.632	335.282
28.669	363.689
29.002	401.170
29.335	376.151
29.482	378.415
29.593	409.091
29.815	424.987
30.111	398.834
30.591	432.898
31.072	413.552
32.255	487.349];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'VascTeix2018';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01047*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3J97L'; % Cat of Life
metaData.links.id_ITIS = '613026'; % ITIS
metaData.links.id_EoL = '46578469'; % Ency of Life
metaData.links.id_Wiki = 'Haemulon_plumierii'; % Wikipedia
metaData.links.id_ADW = 'Haemulon_plumierii'; % ADW
metaData.links.id_Taxo = '691030'; % Taxonomicon
metaData.links.id_WoRMS = '158808'; % WoRMS
metaData.links.id_fishbase = 'Haemulon-plumierii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haemulon_plumierii}}';
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
bibkey = 'VascTeix2018'; type = 'Article'; bib = [ ... 
'doi = {10.20950/1678-2305.2018.44.4.406}, ' ...
'author = {Jonas Eloi de Vasconcelos-Filho and Rosangela Paula Teixeira Lessa and Francisco Marcante Santana}, ' ... 
'year = {2018}, ' ...
'title = {GROWTH AND MORTALITY OF WHITE GRUNT CAUGHT IN {P}ERNAMBUCO STATE, {B}RAZIL}, ' ...
'journal = {Bol. Inst. Pesca}, ' ...
'volume = {44(4)}, ' ...
'pages = {e406}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Haemulon-plumierii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
