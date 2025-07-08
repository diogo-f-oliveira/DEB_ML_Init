  function [data, auxData, metaData, txtData, weights] = mydata_Osteogeneiosus_militaris
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Osteogeneiosus_militaris'; 
metaData.species_en = 'Soldier catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fb'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 06];

%% set data
% zero-variate data
data.ab = 88; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Pant1963';
data.Li = 48.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
data.Lim = 43.0;     units.Lim = 'cm';   label.Lim = 'ultimate total length for males';  bibkey.Lim = 'fishbase';

data.Wwb = 0.6;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Pant1963';
  comment.Wwb = 'based on egg diameter of 10.45 mm: pi/6*1.045^3';
data.Wwp = 102;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Pant1963'};
  comment.Wwp = 'based on 0.00575*Lp^3.12, see F1';
data.Wwi = 825;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.12, see F1, gives 1 kg';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (mnth), total length (cm)
    1  3.60  3.60
    8  9.15  6.95 
    9  9.45  6.55
   10 10.35  7.55
   11 11.75  8.95
   12 12.95  NaN
   20 19.05 13.75
   21 21.65 14.05
   22 21.75 14.05
   23 23.75 18.45
   24 23.05 19.55
   33 NaN   27.05
   34 32.35 27.45
   35 32.95 28.55
   36 33.45 29.45
   37 34.35 30.25
   45 37.05 33.35
   46 36.35  NaN
   47 37.45  NaN
   48 37.55  NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0)*30.5; % convert mnth to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(28.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'Pant1963';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
5.414	5.138
6.557	5.225
6.644	3.466
7.435	1.759
7.436	5.291
8.404	6.248
9.458	3.679
9.460	8.094
10.603	8.180
10.605	10.829
11.572	11.786
11.573	12.669
12.454	18.033
12.544	21.572
13.510	18.113
13.598	19.886
14.393	26.127
14.479	21.719
14.480	24.368
15.452	35.037
15.538	30.629
15.625	27.986
16.418	32.461
16.420	36.877
16.421	39.526
17.478	43.138
17.480	48.436
17.563	35.197
17.564	39.612
18.363	55.567
18.537	51.165
19.331	57.406
19.417	53.880
19.420	60.062
20.301	63.660
20.391	68.082
20.394	74.263
20.395	76.912
20.397	81.328
21.273	73.447
21.281	92.874
21.368	90.231
21.455	86.706
21.626	77.006
22.333	84.123
22.336	92.070
22.338	95.603
22.421	85.896
22.433	111.504
22.522	115.043
23.308	101.857
23.480	93.040
23.490	116.882
23.576	112.473
23.669	122.193
24.555	138.154
24.639	129.331
24.651	157.588
24.724	123.156
25.530	155.005
25.539	175.315
25.619	158.544
25.623	167.374
25.703	147.954
26.322	155.948
26.496	151.546
26.508	180.686
26.511	186.868
26.584	152.436
26.675	159.507
26.678	166.571
26.874	211.619
27.388	180.753
27.468	162.216
27.473	173.695
27.474	177.228
27.481	193.122
27.491	214.315
27.566	185.181
27.567	188.714
27.669	220.509
28.366	204.668
28.450	195.844
28.451	198.493
28.457	213.505
28.637	222.349
29.258	232.992
29.338	217.104
29.354	251.542
29.355	254.191
29.358	261.255
29.416	192.385
29.506	197.690
29.518	225.064
29.614	244.498
29.635	292.181
29.721	286.890
30.147	256.900
30.335	282.521
30.336	286.053
30.344	304.597
30.346	308.129
30.415	264.867
30.436	313.434
30.472	195.997
30.485	225.138
30.495	246.330
30.667	239.279
31.404	314.390
31.498	327.642
31.578	310.871
31.640	251.715
31.851	332.084
32.286	321.521
32.386	348.902
32.398	374.510
32.452	298.576
32.456	308.289
32.458	312.704
32.537	292.401
32.572	370.108
32.636	316.250
33.303	432.856
33.324	280.982
33.334	303.940
33.420	298.649
33.433	328.672
33.440	344.566
33.534	359.585
34.121	293.404
34.306	315.493
34.335	380.837
34.341	393.200
34.413	357.002
34.417	367.598
34.422	378.195
34.453	449.720
35.414	433.899
35.443	501.009
35.456	329.708
35.539	517.794
36.196	413.649
36.273	388.931
36.404	485.188
36.426	535.521
36.458	409.254
36.476	450.757
36.588	503.745
38.448	533.908
38.459	560.399
38.470	585.124];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Pant1963';

% length-fecundity
data.LN = [ ... % weught (g), fecundity (#)
25.504	17.560
28.039	28.736
29.090	27.015
29.472	31.348
30.003	25.798
30.449	35.073
30.763	30.936
31.031	40.917
31.200	31.236
31.465	37.788
31.620	33.955
31.805	40.005
31.950	25.886
32.139	36.372
32.247	44.842
32.266	43.834
32.562	41.916
32.654	34.957
32.783	44.738
32.972	34.955
33.076	39.996
33.183	46.953
33.194	38.180
33.329	54.011
33.671	38.076
33.794	41.907
33.934	43.318
33.939	48.158
34.025	55.116
34.041	51.082
34.096	46.141
34.512	44.928
34.738	52.893
35.288	45.830
35.299	57.628
35.478	57.829
35.796	57.222
35.949	51.977
36.723	51.064
37.569	62.857
37.916	51.560
38.555	55.186];
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN = C2K(28.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Pant1963';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
132.343	17.923
189.620	29.290
200.782	26.996
210.848	32.413
230.071	26.219
247.115	35.148
253.211	40.963
254.390	31.147
260.708	31.353
269.928	38.172
274.819	34.470
276.966	40.181
285.814	36.382
289.365	26.569
291.001	45.201
291.128	41.996
295.477	31.983
296.805	38.395
306.219	40.306
308.007	35.098
310.813	44.116
311.465	47.622
317.365	38.412
317.526	54.338
338.569	42.136
341.799	40.436
346.914	51.058
348.710	45.650
351.173	43.348
362.172	45.160
365.010	53.376
371.538	48.273
378.758	45.675
388.231	46.084
411.518	57.121
418.829	52.219
440.064	55.142
493.728	57.891
511.896	58.407
526.252	55.314
527.996	51.209
553.615	63.250
579.351	52.353];
units.WN = {'g', '#'};  label.WN = {'weight','fecundity'};  
temp.WN = C2K(28.5);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Pant1963';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Single pair of stiff barbels; traumatogenic'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '75BDP'; % Cat of Life
metaData.links.id_ITIS = '680768'; % ITIS
metaData.links.id_EoL = '46582103'; % Ency of Life
metaData.links.id_Wiki = 'Osteogeneiosus'; % Wikipedia
metaData.links.id_ADW = 'Osteogeneiosus_militaris'; % ADW
metaData.links.id_Taxo = '44047'; % Taxonomicon
metaData.links.id_WoRMS = '281947'; % WoRMS
metaData.links.id_fishbase = 'Osteogeneiosus-militaris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Osteogeneiosus_militaris}}';  
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
bibkey = 'Pant1963'; type = 'Article'; bib = [ ...
'doi = {10.1093/icesjms/28.2.295}, ' ...
'author = {Pantulu, V. R.}, ' ...
'year = {1963}, ' ...
'title = {Studies on the Age and Growth, Fecundity and Spawning of \emph{Osteogeneiosus militaris} ({L}inn.)}, ' ... 
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {28(2)}, '...
'pages = {295–315}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Osteogeneiosus-militaris.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

