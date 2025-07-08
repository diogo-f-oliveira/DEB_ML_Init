function [data, auxData, metaData, txtData, weights] = mydata_Potamalosa_richmondia

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Potamalosa_richmondia'; 
metaData.species_en = 'Freshwater herring'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 21];

%% set data
% zero-variate data
data.ab = 4.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
data.Li = 32;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 4.5e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'RenjSanj2017';
  comment.Wwb = 'based on egg diameter of  0.91 to 0.98 mm: pi/6*0.095^3';
data.Wwi = 522; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.15, see F1';

data.Ri  = 56480/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'BrooButl2019';  
  temp.Ri = C2K(27.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity applies to TL 26.5 cm';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.591	7.206
0.591	7.206
0.596	6.070
0.609	8.570
1.568	12.068
1.568	12.068
1.574	10.931
1.574	10.931
1.661	13.508
1.705	9.835
1.705	9.835
1.844	12.147
2.370	12.192
2.414	13.405
2.414	13.405
2.557	9.771
2.557	9.771
2.633	14.734
2.670	12.159
2.670	12.159
2.763	13.599
2.763	13.599
2.959	14.663
2.959	14.663
2.989	13.527
2.989	13.527
3.285	14.629
3.285	14.629
3.340	13.532
3.340	13.532
3.497	12.132
3.497	12.132
3.541	13.383
3.685	14.635
3.685	14.635
3.823	17.175
3.867	13.463
3.867	13.463
3.879	11.039
3.879	11.039
3.886	14.675
3.954	16.040
4.167	13.505
4.167	13.505
4.186	14.793
4.205	15.930
4.461	14.797
4.512	14.760
4.518	13.510
4.530	16.048
4.762	14.877
4.794	13.400
4.794	13.400
4.812	14.840
4.856	15.977
4.856	15.977
4.876	17.075
4.876	17.075
5.112	14.882
5.119	13.480
5.119	13.480
5.182	16.019
5.377	17.120
5.413	14.886
5.413	14.886
5.432	16.022
5.471	18.371
5.471	18.371
5.489	19.660
5.638	14.927
5.658	16.063
5.664	19.776
5.739	19.777
5.746	18.489
5.752	17.163
5.752	17.163
5.915	19.665
5.965	14.780
6.009	15.993
6.009	15.993
6.072	13.456
6.072	13.456
6.234	16.034
6.247	13.420
6.297	18.497
6.304	17.095
6.315	14.860
6.316	19.671
6.316	19.671
6.517	19.674
6.535	16.000
6.535	16.000
6.598	18.463
6.598	18.463
6.629	17.175
6.785	16.041
6.785	16.041
6.855	17.216
6.855	17.216
6.943	19.642
6.974	18.468
7.112	15.970
7.112	15.970
7.117	14.909
7.199	18.585
7.206	17.183
7.218	19.797
7.387	16.049
7.506	17.187
7.506	17.187
7.525	18.513
7.550	18.514
7.619	19.689
7.749	18.668
7.782	17.229
7.782	17.229
7.869	19.768
7.869	19.768
8.039	20.869
8.058	17.157
8.058	17.157
8.126	18.522
8.220	19.697
8.295	14.888
8.308	17.198
8.308	17.198
8.339	21.025
8.339	21.025
8.396	19.700
8.402	18.488
8.559	17.126
8.596	19.816
8.596	19.816
8.653	18.415
8.690	21.067
8.690	21.067
8.922	19.707
8.953	18.571
8.966	20.995
8.966	20.995
9.191	21.036
9.191	21.036
9.247	19.749
9.498	19.753
9.604	18.618
9.899	19.758
9.905	18.470
10.175	19.611
10.193	21.050
10.863	22.347
11.227	19.701];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.4); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Pidg1989';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
6.298	3.104
6.928	3.330
6.928	3.330
7.231	10.095
7.231	10.095
7.312	3.295
7.312	3.295
7.505	10.070
7.505	10.070
7.806	9.760
7.806	9.760
8.107	9.450
8.792	10.237
9.284	9.626
9.613	9.879
9.640	9.594
10.051	9.839
10.270	8.971
10.299	16.893
10.544	9.512
10.545	16.870
10.846	16.277
10.846	16.277
11.202	17.094
11.202	17.094
11.504	16.500
11.504	17.066
11.697	23.558
11.697	23.558
11.805	16.190
11.805	16.190
12.053	24.092
12.053	24.092
12.133	15.594
12.133	15.594
12.354	23.499
12.381	23.496
12.627	23.191
12.627	23.191
12.684	32.526
12.956	23.444
12.956	23.444
13.012	31.930
13.012	31.930
13.230	24.269
13.230	24.269
13.286	31.622
13.286	31.622
13.449	22.834
13.449	22.834
13.479	39.246
13.479	39.246
13.560	31.597
13.560	31.597
13.780	39.219
13.780	39.219
13.806	31.575
13.806	31.575
14.054	38.345
14.054	38.345
14.190	31.540
14.190	31.540
14.275	47.098
14.275	47.098
14.301	38.606
14.301	38.606
14.491	32.079
14.491	32.079
14.575	39.713
14.575	39.713
14.603	47.069
14.603	47.069
14.628	32.066
14.628	32.066
14.906	54.966
14.906	54.966
14.932	47.322
14.932	47.322
15.011	31.183
15.011	31.183
15.013	39.390
15.013	39.390
15.150	39.378
15.150	39.378
15.178	47.017
15.178	47.017
15.262	54.934
15.262	54.934
15.454	55.199
15.454	55.199
15.533	38.777
15.533	38.777
15.562	48.397
15.562	48.397
15.728	56.023
15.728	56.023
15.756	63.096
15.756	63.096
15.836	47.240
15.836	47.240
15.952	87.135
16.030	62.506
16.030	62.506
16.109	47.498
16.109	47.498
16.111	55.423
16.111	55.423
16.135	38.439
16.303	55.405
16.305	71.254
16.305	71.254
16.359	62.476
16.359	62.476
16.385	55.681
16.520	47.178
16.520	47.178
16.553	80.005
16.578	63.022
16.665	88.769
16.686	56.786
16.687	63.295
16.713	55.934
16.716	71.783
16.716	71.783
16.794	48.285
16.910	80.539
16.910	80.539
16.935	72.046
16.935	72.046
16.960	55.912
16.960	55.912
16.961	63.836
16.961	63.836
17.180	63.250
17.237	72.302
17.237	72.302
17.239	87.585
17.239	87.585
17.241	94.660
17.241	94.660
17.261	55.602
17.261	55.602
17.290	63.524
17.348	80.216
17.348	80.216
17.459	87.848
17.459	87.848
17.535	55.860
17.535	55.860
17.538	71.709
17.538	71.709
17.564	64.065
17.564	64.065
17.567	80.763
17.567	80.763
17.597	94.628
17.597	94.628
17.762	102.820
17.762	102.820
17.842	86.964
17.842	86.964
17.892	62.337
17.892	62.337
17.898	94.884
17.898	94.884
17.921	71.957
17.921	71.957
17.950	81.011
17.950	81.011
18.116	87.505
18.116	87.505
18.118	102.505
18.118	102.505
18.120	111.845
18.195	72.215
18.195	72.215
18.196	80.140
18.196	80.140
18.226	94.571
18.226	94.571
18.417	86.912
18.417	86.912
18.420	103.044
18.420	103.044
18.421	111.534
18.421	111.534
18.473	94.548
18.473	94.548
18.523	71.619
18.523	71.619
18.525	81.242
18.525	81.242
18.636	86.609
18.636	86.609
18.666	102.738
18.666	102.738
18.722	110.941
18.722	110.941
18.725	126.507
18.801	94.519
18.801	94.519
18.907	71.868
18.907	71.868
18.965	87.711
18.967	102.145
18.967	102.145
19.018	80.065
19.024	112.046
19.075	94.777
19.075	94.777
19.186	102.691
19.186	102.691
19.217	119.387
19.246	127.309
19.246	127.309
19.297	110.889
19.297	110.889
19.431	94.462
19.544	111.433
19.544	111.433
19.545	119.357
19.570	102.940
19.570	102.940
19.650	94.159
19.903	126.683
20.069	135.442
20.146	111.378
20.203	119.297
20.231	126.936
20.335	94.097
20.420	110.787
21.958	134.705];
units.LW = {'cm', 'g'};  label.LW = {'total length','weight'}; 
bibkey.LW = 'Pidg1989';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '56NJZ'; % Cat of Life
metaData.links.id_ITIS = '551286'; % ITIS
metaData.links.id_EoL = '46562548'; % Ency of Life
metaData.links.id_Wiki = 'Potamalosa_richmondia'; % Wikipedia
metaData.links.id_ADW = 'Potamalosa_richmondia'; % ADW
metaData.links.id_Taxo = '184625'; % Taxonomicon
metaData.links.id_WoRMS = '282325'; % WoRMS
metaData.links.id_fishbase = 'Potamalosa-richmondia'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Potamalosa_richmondia}}';  
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
bibkey = 'Pidg1989'; type = 'article'; bib = [ ... 
'author = {R. W. J. Pidgeon}, ' ...
'year = {1989}, ' ...
'title = {Age and Growth of Freshwater Herring, \emph{Potamalosa richmondia} {M}acleay ({C}lupeidae: {H}yperlophinae), in the {B}ellinger {R}iver, {N}ew {S}outh {W}ales}, ' ... 
'journal = {Aust. J. Mar. Freshwater Res.}, ' ...
'volume = {40}, ' ...
'pages = {679-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrooButl2019'; type = 'misc'; bib = [ ... 
'author = {Brooks, S. and Butler, G. and Gilligan, D. and Raadik, T.}, ' ...
'year = {2019}, ' ...
'title = {\emph{Potamalosa richmondia}. {T}he {IUCN} Red List of Threatened Species 2019}, ' ... 
'doi = {10.2305/IUCN.UK.2019-3.RLTS.T98821820A123381878.en}, ' ...
'pages = {e.T98821820A123381878}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Potamalosa-richmondia.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
