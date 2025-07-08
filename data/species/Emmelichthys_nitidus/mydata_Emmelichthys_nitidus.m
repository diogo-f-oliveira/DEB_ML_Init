function [data, auxData, metaData, txtData, weights] = mydata_Emmelichthys_nitidus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Emmelichthyidae';
metaData.species    = 'Emmelichthys_nitidus'; 
metaData.species_en = 'Cape bonnetmouth'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPS','MIS','MAS'};
metaData.ecoCode.habitat = {'bpMp','piMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Wi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 12];

%% set data
% zero-variate data
data.ab = 3.75+10; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'NeirKean2008';   
  temp.ab = C2K(13.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '90 h till hatch, assumed 10 d till yolk absorption';
data.am = 22*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'WardIvey2013';   
  temp.am = C2K(13.1);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp =  20.9;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 55;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'NeirKean2008';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 51.1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi = 1.05e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';
 
data.Ri = 77950/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase'; 
  temp.Ri = C2K(13.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since hatch (yr), total length (cm)
0.309	12.101
0.402	11.729
0.424	10.550
0.472	12.722
0.517	11.046
0.542	12.908
0.587	11.170
0.657	12.411
0.680	11.480
0.681	13.218
0.682	13.901
0.749	10.612
0.772	10.922
0.774	13.652
0.843	13.032
0.865	11.356
0.866	12.846
0.868	15.328
0.912	11.232
0.912	11.977
0.912	12.039
0.914	14.335
0.937	15.204
0.960	14.397
1.007	16.011
1.029	14.149
1.030	14.956
1.032	17.438
1.032	17.934
1.054	15.576
1.057	20.044
1.075	12.598
1.098	12.970
1.122	13.777
1.168	13.404
1.262	14.521
1.306	12.163
1.309	16.941
1.330	13.528
1.352	11.480
1.354	14.211
1.355	15.204
1.356	17.500
1.357	18.555
1.357	18.927
1.405	20.479
1.424	15.576
1.426	17.748
1.427	19.238
1.468	10.736
1.468	11.915
1.470	14.211
1.473	18.307
1.474	19.982
1.475	22.278
1.494	15.514
1.495	17.252
1.538	11.977
1.539	13.715
1.540	14.770
1.541	15.824
1.542	18.121
1.544	20.727
1.561	12.349
1.563	15.142
1.566	19.548
1.587	15.824
1.587	16.383
1.611	17.128
1.630	10.612
1.631	13.032
1.637	21.099
1.654	12.225
1.656	15.080
1.657	17.190
1.658	17.810
1.659	19.920
1.682	18.741
1.682	19.610
1.684	22.216
1.724	12.846
1.748	14.025
1.751	19.238
1.774	18.431
1.776	20.541
1.793	12.473
1.799	21.410
1.841	14.645
1.846	21.844
1.887	14.025
2.003	13.963
2.004	14.832
2.026	14.149
2.051	16.259
2.051	16.693
2.052	18.431
2.053	19.548
2.055	22.154
2.098	17.748
2.099	18.803
2.099	19.113
2.100	20.106
2.103	25.257
2.121	17.624
2.122	18.121
2.126	25.009
2.127	25.754
2.142	14.521
2.147	20.789
2.147	21.410
2.170	21.844
2.172	24.264
2.190	17.066
2.217	21.968
2.217	22.713
2.264	23.520
2.285	20.479
2.304	13.528
2.446	18.493
2.519	22.589
2.539	17.624
2.566	23.271
2.584	15.949
2.608	16.941
2.610	20.789
2.612	24.016
2.631	17.252
2.632	17.934
2.636	25.381
2.653	15.390
2.654	16.197
2.655	18.679
2.657	21.223
2.677	16.383
2.681	22.154
2.702	19.113
2.702	19.982
2.703	20.479
2.725	19.362
2.746	15.949
2.750	21.658
2.815	15.514
2.817	17.624
2.839	15.700
2.864	18.555
2.886	16.569
2.886	17.872
3.004	19.610
3.047	14.956
3.071	16.259
3.071	17.066
3.072	18.059
3.072	18.617
3.093	15.328
3.097	20.293
3.098	22.340
3.099	23.706
3.123	24.450
3.123	25.133
3.140	15.887
3.144	21.285
3.144	21.782
3.145	23.333
3.146	25.381
3.167	20.727
3.188	17.438
3.189	19.176
3.258	19.362
3.303	16.755
3.307	22.340
3.353	22.216
3.396	16.817
3.396	17.376
3.398	19.672
3.399	21.472
3.465	16.073
3.466	18.245
3.467	18.865
3.467	19.051
3.512	17.562
3.515	21.658
3.517	25.071
3.534	15.700
3.562	23.271
3.581	16.321
3.583	18.803
3.586	24.264
3.606	19.610
3.607	20.230
3.609	23.085
3.628	17.004
3.628	17.934
3.655	22.589
3.698	18.121
3.701	23.333
3.724	22.527
3.726	24.699
3.975	16.383
3.999	16.817
4.001	20.975
4.022	17.190
4.025	21.844
4.047	20.044
4.050	24.761
4.069	18.431
4.069	18.679
4.072	22.589
4.092	17.438
4.092	17.934
4.094	20.355
4.097	25.381
4.116	19.176
4.117	21.037
4.118	21.472
4.118	22.775
4.119	23.582
4.121	26.684
4.121	27.305
4.140	19.858
4.141	22.030
4.142	23.333
4.143	24.326
4.163	20.479
4.165	23.830
4.166	25.133
4.167	26.188
4.232	19.548
4.238	27.863
4.255	19.548
4.257	22.527
4.280	21.410
4.325	20.355
4.369	16.507
4.371	18.865
4.374	23.147
4.395	20.417
4.445	25.940
4.465	21.596
4.466	22.899
4.467	24.823
4.489	22.465
4.491	24.699
4.513	23.706
4.514	25.443
4.535	22.340
4.561	26.374
4.582	23.457
4.649	19.486
4.675	23.706
4.699	24.264
4.767	21.844
4.975	21.720
4.977	23.395
5.043	19.424
5.047	24.078
5.068	21.161
5.071	26.064
5.090	20.293
5.092	22.030
5.094	25.381
5.096	28.360
5.115	22.527
5.115	22.775
5.118	26.871
5.118	27.615
5.135	18.245
5.136	18.927
5.137	21.285
5.140	24.761
5.159	18.679
5.160	19.920
5.164	25.816
5.185	23.333
5.186	24.078
5.188	27.305
5.188	27.367
5.189	28.794
5.230	20.851
5.233	25.009
5.254	22.092
5.278	23.147
5.370	22.713
5.393	21.720
5.419	25.940
5.489	26.374
5.489	27.801
5.534	24.326
5.534	24.761
5.579	22.465
5.582	28.236
5.625	22.527
5.627	25.319
5.669	19.051
5.789	24.574
6.018	20.665
6.019	21.968
6.043	23.271
6.045	26.436
6.065	21.472
6.066	23.085
6.067	25.071
6.070	28.732
6.090	24.574
6.092	27.491
6.117	29.477
6.134	21.285
6.136	24.078
6.137	26.064
6.139	28.174
6.139	29.105
6.160	25.567
6.181	22.340
6.182	23.147
6.184	26.809
6.184	27.057
6.185	27.926
6.253	24.823
6.298	23.395
6.298	24.016
6.389	21.534
6.440	28.174
6.575	22.402
6.577	24.885
6.646	24.016
6.649	27.677
6.692	23.395
6.715	23.023
7.041	24.761
7.043	27.739
7.064	25.195
7.065	26.064
7.066	27.926
7.132	23.209
7.133	24.016
7.135	27.119
7.157	25.071
7.158	26.622
7.180	25.691
7.181	26.374
7.202	22.589
7.205	27.491
7.226	24.326
7.249	23.644
7.413	27.553
7.435	25.195
7.529	26.312
7.530	27.926
7.643	24.388
8.037	24.016
8.107	24.574
8.108	26.126
8.134	29.849
8.154	25.009
8.155	27.057
8.156	28.174
8.177	25.443
8.178	26.560
8.179	27.615
8.179	29.043
8.200	24.450
8.226	28.608
8.480	28.360
8.989	26.622
9.060	28.980
9.083	28.174
9.127	24.574
9.127	25.319
9.128	26.126
9.128	26.312
9.131	29.973
9.149	23.457
9.152	26.746
9.152	27.367
9.174	25.691
9.176	28.794
9.223	29.477
9.427	22.278
9.476	26.622
9.500	27.429
9.547	29.105
9.592	26.126
9.618	30.284
10.057	27.988
10.078	25.629
10.079	26.746
10.102	27.305
10.103	28.174
10.104	29.415
10.123	23.457
10.147	25.133
10.148	26.126
10.171	25.816
10.566	27.119
10.636	28.050
10.637	29.291
11.031	29.291
11.099	26.622
11.123	28.050
11.146	27.491
11.148	30.284
11.216	28.546
11.240	29.911
11.518	28.794
11.518	29.353
12.003	26.622
12.004	28.732
12.073	27.119
12.073	27.677
12.075	29.787
12.142	26.126
12.164	25.319
12.190	29.229
12.213	28.608
12.607	29.291
12.673	23.706
13.024	28.670
13.094	29.229
13.095	29.973
13.117	28.236
13.163	28.670
13.627	28.484
14.091	29.601
14.158	25.878
14.229	27.988
14.230	29.167
15.065	29.167
15.086	27.057
15.181	30.408
15.203	28.670
16.013	26.498
16.151	24.637
16.686	27.243
16.687	28.546
17.381	26.002
18.146	26.871
21.163	31.897];
data.tL(:,1) = (0.3 + data.tL(:,1)) * 365; % convert yr to d
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13.1); units.temp.tL = 'K'; label.temp.tL = {'age','temperature'};
bibkey.tL = 'WardIvey2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwb = weights.Wwb * 3;
weights.Wwi = weights.Wwi * 3;
weights.Ri = weights.Ri * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39H3S'; % Cat of Life
metaData.links.id_ITIS = '168836'; % ITIS
metaData.links.id_EoL = '994597'; % Ency of Life
metaData.links.id_Wiki = 'Emmelichthys_nitidus'; % Wikipedia
metaData.links.id_ADW = 'Emmelichthys_nitidus'; % ADW
metaData.links.id_Taxo = '192745'; % Taxonomicon
metaData.links.id_WoRMS = '218465'; % WoRMS
metaData.links.id_fishbase = 'Emmelichthys_nitidus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Emmelichthys_nitidus}}';  
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
bibkey = 'WardIvey2013'; type = 'techreport'; bib = [ ...
'author = {Ward, T.M., A. Ivey and D. Gorman}, ' ...
'year = {2013}, ' ...
'title = {Commonwealth small pelagic fishery: Fisheries assessment report 2012. Report to the Australian Fisheries Management Authority. }, ' ... 
'instutution = {South Australian Research and Development Institute (Aquatic Sciences), Adelaide}, ' ...
'volume = {F2010/000270-4. SARDI Report Series No. 696. 100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NeirKean2008'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.ecss.2008.03.013}, ' ...
'author = {Francisco J. Neira and John P. Keane and Jeremy M. Lyle and Sean R. Tracey}, ' ... 
'year = {2008}, ' ...
'title = {Development of eggs and larvae of \emph{Emmelichthys nitidus} ({P}ercoidei: {E}mmelichthyidae) in south-eastern {A}ustralia, including a temperature-dependent egg incubation model}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {79}, ' ...
'pages = {35–44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Emmelichthys-nitidus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

