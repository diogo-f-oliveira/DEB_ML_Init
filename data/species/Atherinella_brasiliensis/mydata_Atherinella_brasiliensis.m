function [data, auxData, metaData, txtData, weights] = mydata_Atherinella_brasiliensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Atherinella_brasiliensis'; 
metaData.species_en = 'Brazilian silversides'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 08];

%% set data
% zero-variate data

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'fishbase';
  temp.ab = C2K(27.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temerature is guessed';
data.am = 8*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.6;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 17.7;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
 
data.Wwb = 2.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based of egg diameter of 1.6 mm of  Leuresthes_tenuis : pi/6*0.16^3';
data.Wwp = 2.8; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';          bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00537*Lp^3.09, see F1';
data.Wwi = 38.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.09, see F1';
  
data.Ri  = 3000/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Leuresthes_tenuis';

% uni-variate data
% time-length
data.tL = [ ... time since birth (d), total length (cm)
0.081	1.937
0.164	2.916
0.251	3.585
0.334	5.803
0.416	6.275
0.499	6.859
0.586	7.782
0.667	8.789
0.749	9.007
0.834	9.958
0.918	9.444
1.001	10.423];
data.tL(:,1) = data.tL(:,1) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(27.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Carv2014';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
1.330	0.190
1.489	0.458
1.529	0.120
1.569	0.390
1.728	0.659
1.807	0.253
1.807	0.018
1.946	0.454
1.986	0.116
2.125	0.182
2.184	0.519
2.204	0.0224
2.304	0.383
2.363	0.518
2.383	0.112
2.423	0.382
2.542	0.313
2.562	0.380
2.582	0.853
2.601	0.025
2.661	0.447
2.740	0.784
2.740	0.108
2.800	0.0365
2.820	0.378
2.879	0.513
2.979	0.106
2.979	0.512
2.999	0.106
2.999	0.0299
3.157	0.375
3.157	0.037
3.177	0.645
3.257	0.0369
3.296	0.914
3.376	0.170
3.416	0.0439
3.535	0.236
3.555	0.776
3.614	0.0170
3.654	0.978
3.694	0.370
3.833	0.0172
3.872	0.0308
3.872	0.435
3.892	0.503
4.011	0.637
4.011	0.0242
4.051	1.042
4.051	1.312
4.091	0.040
4.111	0.501
4.270	1.040
4.349	0.498
4.369	0.025
4.428	0.025
4.468	1.578
4.488	1.646
4.488	0.767
4.548	1.037
4.607	0.699
4.667	1.847
4.667	0.090
4.726	1.103
4.845	0.629
4.865	0.764
4.925	1.439
4.965	1.574
4.965	0.290
5.004	0.762
5.004	1.438
5.044	0.492
5.203	1.774
5.203	0.625
5.243	1.233
5.362	1.705
5.362	0.894
5.461	0.352
5.481	1.636
5.521	0.892
5.600	1.432
5.640	1.905
5.660	0.756
5.699	1.499
5.719	2.107
5.719	1.431
5.779	0.349
5.858	0.687
5.898	1.632
5.898	2.173
5.938	2.307
5.957	1.023
6.037	0.752
6.136	1.562
6.156	2.643
6.176	0.548
6.235	2.102
6.235	1.291
6.295	2.101
6.295	1.155
6.374	2.844
6.494	0.816
6.494	1.018
6.494	1.491
6.494	2.234
6.593	2.031
6.613	2.909
6.633	1.287
6.672	1.760
6.791	2.772
6.831	3.110
6.831	1.420
6.851	2.299
6.891	1.622
6.930	1.149
6.930	2.636
6.990	3.513
7.010	1.892
7.010	2.162
7.089	3.242
7.089	2.161
7.109	2.972
7.129	1.417
7.149	3.309
7.169	3.174
7.248	3.714
7.248	1.687
7.268	1.822
7.288	2.632
7.288	2.429
7.387	1.888
7.407	3.307
7.487	2.765
7.487	1.752
7.526	3.846
7.546	4.049
7.546	2.427
7.586	3.170
7.685	2.628
7.705	4.115
7.705	1.952
7.725	2.696
7.824	3.843
7.864	2.897
7.884	2.424
7.923	4.180
7.963	4.585
8.043	2.760
8.062	3.503
8.062	3.098
8.142	4.448
8.221	3.704
8.241	2.893
8.241	3.772
8.281	3.501
8.321	4.717
8.380	5.392
8.479	4.445
8.519	3.972
8.519	3.634
8.539	4.242
8.539	3.566
8.579	5.322
8.638	3.835
8.738	4.848
8.797	5.455
8.857	4.104
8.896	3.563
8.936	6.265
8.976	5.183
8.976	5.859
8.976	4.305
9.075	4.507
9.174	6.736
9.214	5.924
9.234	4.708
9.274	5.248
9.313	4.505
9.333	5.923
9.413	7.274
9.472	6.733
9.472	5.584
9.512	7.678
9.512	4.976
9.572	5.988
9.611	7.745
9.671	6.866
9.671	5.177
9.711	5.176
9.750	5.852
9.770	7.878
9.790	5.513
9.810	8.351
9.830	6.189
9.889	7.202
9.909	5.445
9.909	6.391
9.929	8.080
9.949	6.525
9.989	5.984
10.009	6.795
10.009	7.741
10.048	8.754
10.068	7.065
10.108	8.213
10.187	9.226
10.207	6.320
10.227	7.131
10.267	6.387
10.287	8.819
10.306	9.562
10.346	10.643
10.346	7.670
10.346	6.386
10.406	9.832
10.445	9.696
10.445	7.331
10.505	10.101
10.505	8.615
10.505	6.723
10.525	9.223
10.584	7.600
10.604	9.762
10.604	8.208
10.684	10.437
10.684	7.870
10.704	10.910
10.743	9.356
10.763	8.612
10.763	7.734
10.803	10.166
10.803	9.287
10.803	9.085
10.823	10.166
10.882	9.354
10.902	9.151
10.902	8.341
10.902	8.341
10.922	11.043
10.942	8.408
10.982	11.651
11.021	8.812
11.021	10.231
11.061	10.771
11.101	9.352
11.121	8.811
11.220	11.513
11.220	10.229
11.240	12.324
11.240	9.148
11.260	8.405
11.299	9.485
11.319	12.391
11.339	9.688
11.359	11.444
11.399	10.430
11.418	12.390
11.438	9.619
11.498	11.646
11.498	10.092
11.518	9.213
11.538	8.672
11.557	9.753
11.557	11.780
11.557	11.307
11.577	12.591
11.617	13.131
11.617	10.563
11.657	13.333
11.677	10.293
11.677	11.914
11.696	12.792
11.696	12.252
11.716	13.265
11.736	11.373
11.776	9.954
11.855	12.183
11.855	12.588
11.855	10.696
11.875	13.872
11.895	13.871
11.895	11.236
11.915	11.912
11.974	12.722
11.994	11.371
11.994	10.965
12.034	12.316
12.054	13.127
12.074	15.221
12.074	14.545
12.133	12.991
12.153	12.382
12.173	11.707
12.213	11.571
12.213	11.166
12.272	13.665
12.332	15.354
12.332	13.259
12.332	12.043
12.352	14.813
12.352	13.191
12.352	12.516
12.391	15.623
12.451	12.515
12.471	13.866
12.511	11.703
12.530	12.649
12.570	15.216
12.570	13.865
12.610	14.270
12.630	16.229
12.630	13.594
12.689	12.918
12.729	14.742
12.789	16.903
12.789	15.282
12.828	13.457
12.848	15.214
12.848	14.268
12.868	15.416
12.928	16.834
12.948	16.294
12.987	17.847
13.007	14.199
13.067	14.941
13.087	16.630
13.126	15.751
13.126	15.481
13.146	18.522
13.146	14.400
13.186	16.021
13.226	17.845
13.245	17.169
13.245	16.088
13.265	16.493
13.285	18.250
13.325	16.763
13.424	19.532
13.424	15.343
13.444	20.073
13.464	17.302
13.464	16.221
13.484	17.640
13.504	18.248
13.543	17.031
13.563	20.409
13.623	19.193
13.623	18.585
13.662	17.976
13.702	20.881
13.702	20.881
13.762	19.394
13.782	21.083
13.841	19.055
13.861	21.285
14.000	22.635
14.099	20.539
14.119	22.093
14.119	21.620
14.199	22.903
14.278	21.957];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'}; 
bibkey.LWw = 'Carv2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% facts
F1 = 'length-weight: WW in g = 0.00537*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6899D'; % Cat of Life
metaData.links.id_ITIS = '630647'; % ITIS
metaData.links.id_EoL = '46566709'; % Ency of Life
metaData.links.id_Wiki = 'Atherinella'; % Wikipedia
metaData.links.id_ADW = 'Atherinella_brasiliensis'; % ADW
metaData.links.id_Taxo = '162520'; % Taxonomicon
metaData.links.id_WoRMS = '279797'; % WoRMS
metaData.links.id_fishbase = 'Atherinella-brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Atherinella}}'];
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
bibkey = 'Carv2014'; type = 'phdthesis'; bib = [ ...
'howpublished = {\url{https://escholarship.org/uc/item/1q77x56q}}, ' ...
'author = {de Carvalho, B.M.}, ' ... 
'year = {2014}, ' ...
'title = {Mudan\c{c}a ontog\''{e}netica no uso de habitat e crescimento de \emph{Atherinella brasiliensis} ({A}therinopsidae) e \emph{Anchoa tricolor} ({E}ngraulidae) em um estuario subtropical}, ' ...
'institution = {Universidade Federal do Paran\''{a}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Atherinella-brasiliensis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

