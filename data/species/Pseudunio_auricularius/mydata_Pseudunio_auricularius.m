function [data, auxData, metaData, txtData, weights] = mydata_Pseudunio_auricularius

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Margaritiferidae';
metaData.species    = 'Pseudunio_auricularius'; 
metaData.species_en = 'Spengler''s freshwater mussel'; 

metaData.ecoCode.climate = {'BSk','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 03];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 70*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'NakaCuca2018';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .02;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'NakaCuca2018';  
data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'NakaCuca2018'; 
data.Li  = 18;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Wiki';

data.Wwi  = 210; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(18/7.3)^3';

data.Ri = 8e6/365;    units.Ri = '1/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Margaritifera_margaritifera';
 
% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
0.00	0.084
0.256	0.161
0.779	0.341
0.780	0.187
1.303	0.315
1.651	0.598
1.737	0.803
2.519	1.369
2.521	1.009
2.523	0.726
2.524	0.546
2.692	1.651
3.473	2.525
3.476	2.037
3.478	1.651
3.480	1.394
3.481	1.163
3.482	1.034
3.483	0.931
4.426	3.605
4.442	1.239
4.527	1.625
4.607	2.679
4.613	1.831
4.691	3.142
4.693	2.936
4.697	2.345
4.699	2.010
5.561	3.836
5.563	3.527
5.565	3.219
5.566	3.013
5.567	2.833
5.569	2.576
5.570	2.421
5.571	2.190
5.573	1.984
5.573	1.856
5.574	1.701
5.640	5.070
5.643	4.633
5.838	1.521
6.074	5.456
6.328	6.664
6.347	3.835
6.348	3.655
6.425	5.198
6.432	4.195
6.433	4.041
6.436	3.475
6.509	5.815
6.514	5.018
6.515	4.787
6.516	4.607
6.518	4.350
6.529	2.730
6.530	2.550
6.531	2.344
6.533	2.087
6.595	5.970
6.614	3.012
6.700	3.295
7.302	4.761
7.404	2.395
7.474	5.172
7.475	4.992
7.478	4.581
7.482	3.963
7.483	3.706
7.554	6.226
7.556	6.021
7.557	5.763
7.559	5.506
7.566	4.426
7.568	4.169
7.572	3.449
7.639	6.638
7.640	6.483
7.662	3.140
7.664	2.832
7.665	2.678
7.723	7.100
7.804	8.155
8.334	7.203
8.335	7.023
8.336	6.843
8.352	4.400
8.419	7.640
8.420	7.409
8.427	6.406
8.430	5.866
8.431	5.737
8.432	5.634
8.441	4.194
8.501	8.334
8.504	7.897
8.516	6.071
8.533	3.423
8.535	3.114
8.536	2.934
8.608	5.429
8.609	5.223
8.610	5.043
8.611	4.863
8.613	4.657
8.617	3.989
8.672	9.003
9.468	7.485
9.470	7.100
9.472	6.842
9.474	6.560
9.548	8.540
9.553	7.871
9.574	4.605
9.575	4.502
9.631	9.285
9.637	8.334
9.650	6.380
9.652	6.097
9.653	5.839
9.655	5.634
9.656	5.454
9.665	4.091
9.717	9.465
9.720	8.977
9.726	8.077
9.753	3.885
9.755	3.654
9.757	3.371
9.809	8.694
10.268	5.376
10.444	5.093
10.445	4.939
10.521	6.791
10.523	6.482
10.602	7.716
10.615	5.710
10.623	4.450
10.624	4.348
10.673	10.288
10.675	9.979
10.680	9.233
10.681	9.028
10.682	8.796
10.684	8.565
10.691	7.510
10.698	6.302
10.700	6.045
10.763	9.825
10.799	4.219
10.867	7.202
10.939	9.670
10.947	8.359
10.949	8.127
11.037	7.947
11.366	11.110
11.368	10.879
11.369	10.699
11.372	10.262
11.393	6.996
11.394	6.739
11.396	6.430
11.398	6.122
11.400	5.916
11.548	10.056
11.550	9.773
11.551	9.567
11.552	9.336
11.554	9.079
11.556	8.847
11.557	8.616
11.558	8.410
11.559	8.256
11.561	8.050
11.562	7.844
11.666	5.273
11.739	7.510
11.913	7.613
12.184	6.275
12.344	8.512
12.415	10.981
12.417	10.647
12.419	10.415
12.420	10.210
12.498	11.650
12.499	11.495
12.500	11.367
12.509	9.978
12.511	9.747
12.514	9.284
12.515	9.078
12.520	8.255
12.521	8.101
12.523	7.844
12.525	7.561
12.526	7.381
12.531	6.532
12.599	9.592
12.779	8.744
13.393	8.461
13.393	8.332
13.395	8.126
13.404	6.738
13.465	10.723
13.484	7.792
13.550	11.135
13.552	10.878
13.557	10.106
13.566	8.589
13.631	12.060
13.634	11.675
13.636	11.366
13.642	10.466
13.645	9.952
13.649	9.283
13.652	8.795
13.734	9.695
13.817	10.337
13.838	7.072
13.913	9.026
13.997	9.540
14.444	7.920
14.502	12.471
14.510	11.314
14.518	9.951
14.591	12.291
14.592	12.163
14.594	11.803
14.595	11.649
14.602	10.466
14.604	10.234
14.621	7.637
14.686	11.031
14.687	10.877
14.688	10.697
14.783	9.617
14.784	9.411
14.786	9.077
14.875	8.794
15.286	12.831
15.288	12.574
15.305	9.874
15.377	12.265
15.401	8.588
15.482	9.488
15.553	12.085
15.555	11.777
15.556	11.545
15.558	11.262
15.560	11.031
15.567	9.977
15.571	9.282
15.574	8.768
15.735	10.877
15.736	10.748
15.737	10.568
15.739	10.285
15.827	10.156
16.245	13.191
16.356	9.539
16.357	9.308
16.421	12.933
16.425	12.239
16.428	11.905
16.516	11.776
16.517	11.622
16.519	11.313
16.521	11.005
16.522	10.748
16.524	10.516
16.685	12.599
16.700	10.310
16.702	10.002
17.227	9.899
17.298	12.444
17.383	12.804
17.386	12.316
17.394	11.081
17.395	10.876
17.484	10.696
17.484	10.619
17.556	13.036
17.561	12.187
17.640	13.576
17.641	13.396
17.642	13.241
17.737	12.007
17.738	11.827
17.827	11.621
17.828	11.544
18.337	13.781
18.429	13.138
18.430	12.958
18.435	12.187
18.515	13.318
18.519	12.624
18.521	12.392
18.527	11.467
18.530	10.978
18.532	10.669
18.616	11.184
18.709	10.361
18.786	11.981
19.214	13.241
19.300	13.523
19.303	12.983
19.304	12.829
19.568	12.520
19.646	14.037
19.663	11.389
19.832	12.289
19.834	12.032
19.922	11.852
19.923	11.646
20.360	11.723
20.518	14.191
20.521	13.831
20.522	13.626
20.525	13.163
20.526	12.957
20.528	12.777
20.529	12.597
20.530	12.340
20.533	11.980
21.305	14.217
21.306	13.985
21.307	13.805
21.396	13.625
21.397	13.471
21.398	13.265
21.403	12.468
21.489	12.725
21.578	12.519
21.749	12.982
21.754	12.211
21.843	11.954
22.353	14.216
22.354	14.036
22.449	12.905
22.509	12.639
22.535	13.085
22.617	13.882
22.620	13.470
22.621	13.239
22.860	12.296
23.554	13.050
23.556	12.776
23.558	12.501
23.662	14.421
23.663	14.181
23.781	14.044
23.786	13.255
24.016	13.598
24.363	14.078
24.593	14.524
24.594	14.352
24.598	13.701
24.599	13.564
24.601	13.221
24.604	12.809
24.721	12.672
25.527	14.146
25.528	13.940
25.530	13.769
25.532	13.323
25.536	12.843
25.873	14.729
25.875	14.420
26.454	14.866
26.456	14.626
26.457	14.454
26.458	14.214
26.461	13.871
26.580	13.425
27.618	15.071
27.620	14.728
27.621	14.556
27.623	14.214
27.741	13.973
27.976	13.631
28.554	14.282
28.556	14.042
28.669	14.556
28.781	15.242
28.784	14.830
28.790	13.836
29.485	14.556
29.595	15.413
29.599	14.830
29.601	14.624
29.835	14.350
29.837	14.144
30.412	15.172
30.416	14.624
30.769	14.109
31.694	15.137
31.696	14.829
32.392	15.206
32.627	14.965
34.489	15.204
34.490	14.999
35.429	13.867
35.431	13.558
36.474	14.346
36.702	15.101
38.564	15.340
38.566	15.031
39.501	14.619
39.854	14.002
40.663	14.927
40.668	14.276
40.776	15.579
41.587	16.195
41.605	13.487
41.709	15.304
42.407	15.475
43.341	15.200
43.570	15.817
43.572	15.474
43.697	14.103
44.389	15.131
44.630	13.897
45.324	14.651
45.786	15.302
46.369	15.164
46.374	14.479
47.533	15.335
47.653	14.684
48.361	13.278
48.701	14.752
49.746	15.231
51.610	15.230
53.357	15.264
54.404	15.503
55.223	14.920
55.569	15.331
56.271	14.954
57.326	13.890
57.667	15.125
59.761	15.501
61.510	15.294
64.654	15.293
67.579	13.371];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
n = size(data.tL,1); for i=1:n-1; if data.tL(i,1) == data.tL(i+1,1); data.tL(i+1,1) = data.tL(i+1,1) + 1e-3; end; end; % make sure that all times ar different
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NakaCuca2018';
comment.tL = 'Data from River Elbro, Spain; mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.p_M = 0;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Energy conductance is very low, but attemps to increase it affected goodness of fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Facultative hermaphroditic';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'Longest lived invertebrate';
metaData.bibkey.F2 = 'ADW'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4PFFP'; % Cat of Life
metaData.links.id_ITIS = '983845'; % ITIS
metaData.links.id_EoL = '52590443'; % Ency of Life
metaData.links.id_Wiki = 'Margaritifera_auricularia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5626358'; % Taxonomicon
metaData.links.id_WoRMS = '1259936'; % WoRMS
metaData.links.id_molluscabase = '1259936'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Margaritifera_auricularia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
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
bibkey = 'NakaCuca2018'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10750-017-3103-9}, ' ...
'author = {Keiko Nakamura and Laura Cucala and Alexandre Mestre and Francesc Mesquita-Joanes and Eva Elbaile and Carlos Salinas and Miguel \''{A}ngel Mu\~{n}oz-Yanguas}, ' ... 
'year = {2018}, ' ...
'title = {Modelling growth in the critically endangered freshwater mussel \emph{Margaritifera auricularia} ({S}pengler, 1793) in the {E}bro basin}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {810}, ' ...
'pages = {375-391}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baue1987'; type = 'Article'; bib = [ ...
'author = {G. Bauer}, ' ... 
'year = {1987}, ' ...
'title = {Reproductive Strategy of the Freshwater Pearl Mussel \emph{Margaritifera margaritifera}}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {56(2)}, ' ...
'pages = {691-704}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Margaritifera_margaritifera/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

