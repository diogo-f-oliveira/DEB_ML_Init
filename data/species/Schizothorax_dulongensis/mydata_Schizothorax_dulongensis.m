  function [data, auxData, metaData, txtData, weights] = mydata_Schizothorax_dulongensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Schizothorax_dulongensis'; 
metaData.species_en = 'Snowtrout'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 10];

%% set data
% zero-variate data
data.am = 50*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'MaXie2010';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12;    units.Lp = 'cm'; label.Lp = 'std length at puberty for females'; bibkey.Lp = 'guess'; 
data.Li = 24.6;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Shodhganga';
  comment.Wwb = 'value for Schizothorax richardsonii: based egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwi = 129;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.02, see F1';
    
data.Ri  = 2.25e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Schizothorax_oconnori: 39343*129/2350';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.000	3.707
0.001	2.869
0.002	3.587
0.018	2.589
0.982	4.378
0.990	4.817
0.999	4.577
0.999	5.176
0.999	5.216
0.999	5.376
0.999	6.254
1.000	7.372
1.000	7.971
1.008	6.613
1.008	6.933
1.015	4.178
1.015	5.535
1.016	5.615
1.016	5.815
1.024	6.014
1.033	7.691
1.982	12.953
1.989	9.679
1.996	6.166
1.997	8.482
1.997	8.721
1.997	8.881
1.997	8.881
1.998	10.078
1.998	10.358
2.004	6.565
2.005	7.404
2.005	7.643
2.005	8.003
2.006	9.400
2.006	9.879
2.006	10.557
2.006	10.997
2.007	11.755
2.007	12.314
2.021	7.004
2.022	9.040
2.023	11.555
2.029	6.845
2.031	11.875
2.962	11.787
2.970	10.151
2.970	10.670
2.970	11.069
2.970	12.027
2.970	12.226
2.971	13.544
2.978	9.472
2.978	9.871
2.979	13.903
2.985	7.436
2.985	7.835
2.985	8.234
2.985	8.554
2.986	9.033
2.986	9.152
2.987	11.388
2.987	13.344
2.993	8.035
2.994	9.352
2.995	12.865
3.002	8.833
3.002	9.751
3.003	10.430
3.003	10.869
3.003	10.869
3.003	12.386
3.004	12.625
3.004	13.184
3.004	14.182
3.005	14.941
3.010	7.595
3.013	16.617
3.029	14.501
3.975	10.502
3.975	12.099
3.977	16.330
3.977	16.809
3.983	10.422
3.985	14.494
3.985	16.530
3.991	10.741
3.992	11.859
3.992	12.817
3.992	13.176
3.992	13.376
3.992	13.615
3.993	13.815
3.993	14.055
3.993	15.691
3.993	15.931
3.994	17.049
3.994	17.328
3.999	9.783
4.000	11.100
4.000	12.617
4.001	15.372
4.002	17.887
4.008	12.298
4.009	14.813
4.010	15.092
4.965	14.765
4.972	12.729
4.982	16.162
4.989	13.767
4.989	14.326
4.990	14.925
4.990	15.723
4.991	17.280];
data.tL(:,1) = 365 * (0.9+data.tL(:,1));
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3; end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DingJiang2016';

% length-weight
data.LW = [ ... % std length (cm), weight (g)
2.582	0.006
2.885	0.789
3.560	0.992
3.700	0.603
4.096	0.607
4.282	1.584
4.305	0.805
4.515	1.392
4.678	1.978
4.818	1.980
5.213	2.374
5.376	3.155
5.446	2.182
5.563	3.547
5.772	2.575
5.935	4.331
5.982	2.772
6.168	4.334
6.308	2.776
6.308	4.140
6.448	2.777
6.517	5.507
6.541	4.338
6.680	5.119
6.890	3.757
6.983	5.512
7.076	6.293
7.100	4.539
7.123	5.709
7.239	5.905
7.402	5.906
7.472	7.272
7.519	6.493
7.682	7.079
7.775	8.250
7.868	6.301
7.961	5.718
8.008	7.862
8.147	9.813
8.217	7.865
8.241	9.619
8.450	8.647
8.450	10.596
8.473	6.503
8.567	7.479
8.660	10.404
8.683	8.844
8.799	13.914
8.846	14.889
8.846	10.600
8.893	12.550
8.962	8.847
8.986	10.602
9.009	16.255
9.102	10.993
9.125	11.968
9.172	12.943
9.265	11.775
9.335	15.674
9.358	13.335
9.358	11.191
9.428	14.116
9.568	13.337
9.568	15.677
9.591	12.558
9.638	10.414
9.708	11.584
9.731	15.093
9.847	14.120
9.964	12.367
9.987	17.046
9.987	20.554
10.034	16.071
10.150	19.971
10.266	17.244
10.290	15.489
10.383	18.804
10.406	22.508
10.429	13.347
10.476	15.491
10.523	17.051
10.546	18.221
10.686	14.909
10.732	21.537
10.732	22.902
10.755	19.978
10.895	18.420
10.988	21.345
11.035	19.786
11.058	25.439
11.175	20.762
11.221	28.755
11.268	22.712
11.291	24.272
11.291	18.619
11.338	22.128
11.384	26.222
11.431	22.909
11.524	27.394
11.547	31.292
11.547	22.326
11.617	24.666
11.664	25.251
11.664	21.157
11.757	26.032
11.803	27.786
11.850	29.152
11.920	31.297
11.920	23.694
11.990	29.543
11.990	22.525
11.990	27.789
12.036	28.179
12.036	32.078
12.083	21.357
12.129	30.714
12.199	23.892
12.223	29.740
12.223	23.113
12.269	31.300
12.292	28.961
12.339	34.420
12.362	24.089
12.386	25.454
12.409	37.345
12.455	30.912
12.549	36.177
12.549	28.964
12.572	32.473
12.618	34.813
12.618	30.719
12.712	37.153
12.735	33.450
12.781	35.789
12.851	39.884
12.898	38.909
12.898	31.307
13.038	37.352
13.038	39.691
13.061	40.861
13.061	43.979
13.084	33.843
13.177	29.361
13.201	43.006
13.224	31.311
13.247	38.523
13.270	40.863
13.294	44.567
13.340	33.456
13.364	40.084
13.433	38.136
13.573	31.314
13.596	39.697
13.620	43.791
13.620	36.773
13.666	39.892
13.690	42.037
13.759	38.334
13.783	35.215
13.853	51.980
13.853	49.251
13.876	50.226
13.876	43.403
13.922	47.498
13.946	45.354
13.946	34.437
14.016	40.481
14.062	48.474
14.062	42.821
14.109	45.355
14.179	50.619
14.248	47.696
14.295	40.679
14.318	43.798
14.365	37.561
14.411	51.986
14.411	38.926
14.458	53.936
14.481	48.868
14.528	41.656
14.551	52.378
14.574	47.310
14.644	49.260
14.668	55.303
14.691	45.362
14.691	47.506
14.761	52.770
14.994	61.739
14.994	55.891
15.087	52.383
15.203	58.623
15.343	61.548
15.366	63.887
15.483	60.380
15.599	55.508
15.855	66.427
15.902	58.630
15.925	73.055
15.972	66.428
16.298	65.652
16.344	84.561
16.367	70.526
16.437	77.349
16.484	83.978
16.507	57.662
16.530	75.791
16.763	64.487
16.856	76.574
16.996	79.110
17.182	75.603
17.299	80.088
17.322	78.723
18.044	86.723];
units.LW = {'cm', 'g'}; label.LW = {'std length', 'wet weight'};  
bibkey.LW = 'DingJiang2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 2 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79WNC'; % Cat of Life
metaData.links.id_ITIS = '690075'; % ITIS
metaData.links.id_EoL = '46581731'; % Ency of Life
metaData.links.id_Wiki = 'Schizothorax_oconnori'; % Wikipedia
metaData.links.id_ADW = 'Schizothorax_oconnori'; % ADW
metaData.links.id_Taxo = '186968'; % Taxonomicon
metaData.links.id_WoRMS = '1017625'; % WoRMS
metaData.links.id_fishbase = 'Schizothorax-oconnori'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Schizothorax_oconnori}}';  
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
bibkey = 'DingJiang2016'; type = 'article'; bib = [ ...  
'doi = {10.1111/jai.13102}, ' ...
'author = {Ding, C.-Z. and Jiang, X.-M. and Chen, L. Q. and Juan, T. and Chen, Z. M.}, ' ...
'year = {2016}, ' ...
'title = {Growth variation of \emph{Schizothorax dulongensis} {H}uang, 1985 along altitudinal gradients: implications for the {T}ibetan {P}lateau fishes under climate change}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'pages = {1–5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaXie2010'; type = 'article'; bib = [ ...  
'author = {Bao-Shan Ma and Cong-Xin Xie and Bin Huo and Xue-Feng Yang and Hai-Ping Huang}, ' ...
'year = {2010}, ' ...
'title = {Age and Growth of a Long-Lived Fish \emph{Schizothorax o''connori} in the {Y}arlung {T}sangpo {R}iver, {T}ibet}, ' ... 
'journal = {Zoological Studies}, ' ...
'volume = {49(6)}, '...
'pages = {749-759}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shodhganga'; type = 'Misc'; bib = ...
'howpublished = {\url{http://shodhganga.inflibnet.ac.in/bitstream/10603/68389/14/14_chapter 7.pdf}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Schizothorax-oconnori.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

