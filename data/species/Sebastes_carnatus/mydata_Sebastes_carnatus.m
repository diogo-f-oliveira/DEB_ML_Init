function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_carnatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_carnatus'; 
metaData.species_en = 'Gopher rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 23];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(14.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 39;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 540;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 2.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 425e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(14.9);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
  0  6.9
  1 11.4
  2 17.0
  3 20.8
  4 24.2
  5 27.3
  6 28.8
  7 30.9
  8 31.9
  9 33.3
 10 33.9
 11 34.3
 12 35.3
 13 36.0
 15 35.4];
data.tL(:,1) = 365*(0.9+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(14.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
6.169	7.630
7.350	7.562
8.313	9.504
8.444	13.488
8.663	11.480
8.794	11.472
8.969	9.466
9.101	15.447
9.363	13.436
9.407	15.429
9.538	21.410
9.713	13.416
9.888	17.398
10.195	21.372
10.588	21.350
10.720	25.334
10.895	27.320
11.026	25.317
11.157	25.309
11.245	29.296
11.245	29.296
11.420	33.278
11.464	33.276
11.552	37.263
11.683	33.263
11.989	33.246
12.120	33.238
12.252	39.219
12.296	45.205
12.514	37.208
12.996	49.157
13.565	53.116
13.827	45.117
13.958	47.106
14.221	47.091
14.352	55.067
14.659	61.038
14.966	72.996
15.140	63.006
15.228	70.985
15.404	84.947
15.491	70.970
15.491	78.954
15.841	82.926
16.017	94.893
16.235	76.916
16.366	82.897
16.498	88.877
16.585	92.864
16.717	100.841
16.935	96.836
16.979	92.842
17.155	106.804
17.199	124.765
17.373	102.799
17.505	114.768
17.943	118.735
18.076	156.651
18.118	114.733
18.292	112.727
18.337	138.672
18.425	132.679
18.468	126.689
18.513	152.634
18.642	110.711
18.775	146.631
18.862	124.670
18.950	140.633
18.950	150.613
19.039	166.576
19.213	156.586
19.345	174.543
19.389	168.553
19.475	146.592
19.607	162.552
19.782	156.554
19.825	140.584
20.045	164.523
20.176	156.532
20.221	204.433
20.308	176.484
20.308	188.460
20.438	156.517
20.482	158.510
20.657	170.476
20.658	184.448
20.703	202.410
20.921	192.417
20.964	180.439
21.139	176.437
21.270	176.429
21.271	190.401
21.358	184.408
21.447	218.335
21.534	208.350
21.621	204.353
21.667	234.291
21.839	178.393
21.972	218.305
21.973	230.281
22.017	248.243
22.147	210.311
22.410	224.268
22.411	252.213
22.496	198.315
22.498	238.235
22.586	262.183
22.628	222.260
22.714	176.347
22.716	226.247
22.761	260.177
22.804	242.210
22.889	184.321
22.935	234.219
23.022	212.258
23.022	218.246
23.069	284.111
23.071	330.019
23.110	230.217
23.198	230.212
23.286	250.167
23.329	234.196
23.332	306.052
23.461	254.149
23.592	250.149
23.768	278.083
23.769	296.047
23.855	258.118
23.897	228.176
23.904	379.872
23.944	290.049
23.989	327.971
24.029	242.140
24.074	262.098
24.162	276.065
24.204	232.150
24.249	262.088
24.249	266.080
24.293	276.057
24.295	317.973
24.340	349.907
24.470	309.979
24.472	357.883
24.513	298.001
24.560	363.866
24.601	309.972
24.688	292.003
24.733	333.916
24.776	305.970
24.821	325.927
24.994	295.977
24.996	331.905
25.038	305.955
25.040	353.859
25.169	289.979
25.302	335.880
25.343	274.001
25.433	325.892
25.434	347.848
25.564	329.877
25.610	373.787
25.652	329.872
25.655	389.752
25.785	369.785
25.871	347.824
25.919	431.653
25.959	359.795
26.001	311.888
26.047	357.794
26.050	439.630
26.133	327.849
26.137	417.669
26.179	385.730
26.221	341.816
26.266	367.761
26.267	391.713
26.312	427.639
26.351	313.864
26.399	403.682
26.441	363.759
26.484	349.785
26.485	375.733
26.486	385.713
26.487	425.633
26.488	443.597
26.490	487.509
26.703	351.768
26.744	297.874
26.793	417.631
26.882	455.550
26.922	363.732
26.922	369.720
26.968	413.629
27.011	397.659
27.054	371.708
27.096	341.766
27.099	401.646
27.146	487.471
27.227	329.782
27.231	419.602
27.275	435.568
27.360	381.671
27.361	385.663
27.406	423.584
27.452	463.502
27.452	463.502
27.670	451.513
27.671	481.453
27.672	505.405
27.711	397.619
27.711	403.607
27.712	417.579
27.713	449.515
27.755	389.632
27.759	489.432
27.760	517.377
27.808	607.194
27.844	423.559
27.888	449.505
27.974	415.568
28.107	435.520
28.108	463.464
28.153	503.382
28.237	423.537
28.239	453.477
28.415	477.419
28.457	439.492
28.458	459.453
28.459	499.373
28.543	405.555
28.548	525.316
28.586	395.573
28.633	465.431
28.675	423.512
28.681	565.228
28.719	441.474
28.722	509.338
28.895	465.416
28.899	555.236
28.899	557.232
28.938	435.473
28.940	491.361
28.942	527.289
28.981	425.491
28.982	455.431
29.029	511.316
29.117	533.267
29.156	413.505
29.200	427.474
29.205	541.246
29.247	503.320
29.250	579.168
29.287	413.497
29.296	619.085
29.330	399.523
29.337	551.219
29.337	551.219
29.375	435.448
29.378	495.328
29.379	517.284
29.419	445.426
29.420	461.394
29.421	471.374
29.422	503.310
29.465	489.335
29.469	567.179
29.555	535.238
29.557	581.146
29.685	525.251
29.687	549.203
29.689	617.067
29.767	393.510
29.771	491.314
29.863	591.109
29.904	531.226
29.907	581.126
29.908	621.046
29.946	479.328
29.949	559.168
29.991	497.289
30.032	455.371
30.081	557.164
30.081	561.156
30.127	619.038
30.168	545.183
30.208	479.313
30.254	525.218
30.257	585.098
30.346	617.029
30.387	553.155
30.389	611.039
30.428	505.248
30.431	569.120
30.521	630.991
30.522	646.960
30.558	479.293
30.649	543.160
30.655	676.892
30.701	740.762
30.741	658.923
30.780	535.168
30.822	513.210
30.824	551.134
30.825	561.114
30.871	615.004
31.001	585.056
31.006	706.812
31.047	646.930
31.130	533.152
31.219	571.071
31.265	618.973
31.270	740.729
31.356	704.796
31.395	604.994
31.528	640.914
31.569	573.048
31.655	533.122
31.705	680.824
31.746	620.942
31.793	700.779
31.830	553.073
31.835	650.877
31.874	543.090
31.962	567.037
31.964	594.981
31.964	608.953
32.018	842.483
32.140	632.895
32.445	610.922
32.493	702.735
32.497	780.579
32.541	796.545
32.618	551.032
32.621	626.880
32.889	758.601
33.019	710.689
33.194	726.647
33.195	752.595
33.502	768.546
33.503	790.502
33.506	850.382
33.638	864.347
33.806	716.633
33.851	744.574
34.032	874.304
34.065	630.789
34.775	852.306];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LeaMcAl1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Data Wwp and Wwi are at odds with LW data and ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7LB'; % Cat of Life
metaData.links.id_ITIS = '166767'; % ITIS
metaData.links.id_EoL = '46568125'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_carnatus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_carnatus'; % ADW
metaData.links.id_Taxo = '187258'; % Taxonomicon
metaData.links.id_WoRMS = '274779'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-carnatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_carnatus}}';
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
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-carnatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
