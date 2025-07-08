function [data, auxData, metaData, txtData, weights] = mydata_Bodianus_frenchii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Bodianus_frenchii'; 
metaData.species_en = 'Foxfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L_f'; 'L-N_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 02 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 12]; 

%% set data
% zero-variate data

data.am = 80*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CossHesp2010';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 24.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'CossHesp2010'; 
data.Li  = 45;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 9.7e-5;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'CossHesp2010';
  comment.Wwb = 'based on egg diameter of 570 mumm: pi/6*0.057^3';
data.Wwp = 207;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'CossHesp2010','fishbase'};
  comment.Wwp = 'based on 0.01202*Lp^3.05, see F1';
data.Wwi = 1.3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'CossHesp2010','fishbase'};
  comment.Wwi = 'based on 0.01202*Li^3.05, see F1';

% univariate data
data.tL = [ ... % time since birth (yr), total length (cm) 
0.935	8.972
1.202	7.967
1.202	9.642
1.870	16.344
2.003	7.550
2.003	11.151
2.938	17.267
3.072	15.592
3.072	18.356
3.205	13.248
3.339	14.504
3.339	16.598
4.007	18.693
4.007	19.196
4.007	19.782
4.007	21.290
4.140	12.831
4.140	18.023
4.942	24.055
6.010	21.796
6.144	22.132
6.811	24.059
8.013	28.417
8.147	24.146
8.681	28.837
9.082	21.300
9.215	27.247
10.818	25.156
10.952	27.418
11.886	27.085
12.020	29.598
12.421	23.485
13.890	30.858
14.558	28.347
14.825	31.446
15.359	27.762
15.760	34.463
15.893	28.768
15.893	27.345
15.893	32.453
16.027	30.025
16.427	26.257
16.561	25.168
16.694	27.346
16.828	28.519
16.828	32.204
16.962	32.791
17.362	27.934
17.629	30.028
17.763	30.615
17.763	31.452
17.763	32.709
17.763	34.551
17.763	35.556
17.763	36.729
18.164	28.187
18.164	30.448
18.297	29.778
18.297	31.118
18.698	27.434
18.831	27.099
18.831	33.883
19.232	30.869
19.232	32.712
19.633	36.146
19.766	26.599
19.900	28.693
19.900	29.279
19.900	31.792
20.033	34.975
20.301	28.108
20.434	30.537
20.434	32.463
20.434	30.118
20.568	27.522
20.701	31.207
20.835	32.799
20.968	33.720
20.968	32.464
20.968	29.449
21.369	30.622
21.369	28.445
21.636	32.465
21.903	31.461
22.170	34.309
22.170	33.723
22.304	28.447
22.705	36.823
22.972	27.778
22.972	26.689
22.972	35.902
23.105	32.971
23.105	32.385
23.105	29.370
23.239	30.543
23.372	33.139
23.506	34.479
23.907	36.825
24.040	27.780
24.040	34.899
24.307	31.634
24.441	30.461
24.574	29.373
24.841	28.285
24.841	32.891
25.109	31.468
25.242	34.651
25.242	33.813
25.242	32.222
25.376	27.197
25.509	30.715
25.776	38.672
25.910	28.203
26.043	33.647
26.043	41.185
26.311	31.219
26.311	31.889
26.311	32.810
26.578	30.466
26.578	33.900
26.845	34.486
26.845	35.324
26.978	30.802
27.112	32.226
27.112	32.058
27.245	29.965
27.245	31.891
27.913	27.872
27.913	29.966
27.913	33.149
27.913	34.489
28.047	38.174
28.447	30.386
28.715	29.381
28.848	32.146
29.115	29.885
29.115	35.077
29.516	31.058
30.050	28.882
30.184	37.760
30.317	36.755
30.451	32.903
30.584	32.317
30.584	35.667
30.985	33.071
30.985	34.914
31.119	34.495
31.252	33.826
31.519	31.146
31.653	32.654
31.653	36.758
31.920	30.142
32.187	32.153
32.721	30.144
32.721	32.656
32.721	33.410
32.721	34.834
32.988	37.179
33.255	31.736
33.255	34.165
33.656	33.161
33.923	33.747
33.923	34.334
33.923	37.098
34.324	28.723
34.324	30.817
34.591	31.571
34.591	38.858
34.858	33.247
35.125	30.065
35.259	38.105
35.392	35.007
35.392	32.411
35.659	40.451
35.659	34.086
35.927	35.845
36.327	33.501
36.728	32.497
37.529	33.839
38.598	37.024
38.998	36.857
39.132	39.202
39.666	35.853
40.200	35.101
40.601	32.589
40.868	34.348
41.269	33.093
41.269	35.773
41.269	36.862
41.536	34.350
41.803	32.256
42.471	38.204
42.738	33.515
43.272	33.516
43.406	36.112
43.406	35.610
43.406	34.856
43.673	38.793
44.073	37.538
45.008	34.022
45.409	35.279
45.409	42.901
46.210	37.961
47.412	37.293
47.679	40.644
48.214	39.054
48.748	39.557
49.816	31.771
50.083	34.870
50.351	36.629
50.618	40.818
51.419	37.553
52.354	36.550
52.621	44.842
52.755	36.132
53.289	40.488
54.224	46.520
54.891	35.801
55.693	39.572
56.227	34.632
57.295	37.230
58.898	37.820
59.032	39.244
62.104	42.600
63.172	38.834];
data.tL(:,1) = 365 * (.75 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'west coast'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CossHesp2010';
comment.tL = 'Data from west coast';
%
data.tL1 = [ ... % time since birth (yr), total length (cm) 
0.935	6.459
1.336	9.475
1.736	12.407
2.003	12.994
2.003	15.255
2.137	13.999
2.137	14.418
2.137	17.600
2.137	18.354
2.404	11.822
2.538	16.512
2.671	10.399
2.671	22.124
3.205	20.701
3.339	16.765
3.472	19.446
3.472	23.801
3.740	26.816
3.873	22.210
3.873	23.299
3.873	25.560
4.140	23.635
4.541	21.458
4.808	27.656
5.342	24.977
5.342	25.480
5.476	26.066
5.609	27.909
5.876	26.486
6.277	28.580
6.411	24.393
6.678	25.482
6.945	22.887
7.078	26.907
7.212	29.504
7.479	28.750
7.613	25.149
7.746	27.662
8.414	22.974
8.414	29.339
8.548	31.768
8.681	32.187
8.948	27.162
9.215	33.193
9.482	29.090
9.482	35.204
9.616	30.849
9.750	28.001
9.750	32.692
9.883	32.106
10.684	29.846
10.684	30.265
10.818	23.900
10.818	27.250
10.818	32.024
10.952	28.506
11.486	29.764
11.886	27.168
12.020	28.592
12.154	30.687
12.688	33.200
12.955	32.447
13.222	27.506
13.222	28.009
13.222	30.438
13.489	33.621
13.890	28.094
14.023	31.360
14.157	33.371
14.558	35.968
15.626	27.846
15.626	36.724
15.760	32.202
15.760	29.605
15.760	34.547
15.893	32.704
15.893	30.946
16.027	28.266
16.427	34.799
16.828	32.539
16.828	31.031
16.828	30.194
16.828	36.726
16.962	26.593
17.229	34.215
17.496	32.875
17.629	36.896
17.629	34.969
17.763	30.531
17.763	36.058
18.297	34.217
18.431	35.390
18.431	34.804
18.564	32.543
18.698	33.380
19.098	33.716
19.232	35.391
19.499	37.067
19.900	32.797
19.900	31.373
20.301	36.147
20.434	33.216
20.835	30.370
20.835	35.395
20.968	36.986
20.968	37.908
21.102	36.484
21.636	40.003
21.636	41.175
22.037	34.979
22.838	33.724
23.506	34.898
23.639	34.563
23.773	38.249
24.040	34.062
24.040	35.737
24.441	34.230
24.708	37.162
24.975	38.000
25.109	33.561
25.242	37.582
25.643	39.006
25.643	34.986
25.776	40.095
25.776	34.065
26.444	36.747
26.711	35.575
26.845	40.600
26.978	37.837
27.112	38.507
27.112	32.644
27.513	35.158
27.913	38.508
28.447	37.253
28.715	36.249
28.848	38.343
28.848	33.485
28.848	32.229
28.982	40.270
29.783	37.005
30.584	38.514
30.718	40.357
30.718	39.436
30.851	37.342
30.851	35.500
30.985	34.579
31.653	38.181
32.321	39.271
32.321	41.282
32.321	41.784
32.454	36.927
32.721	36.257
32.721	40.780
32.988	39.943
33.122	34.583
33.255	37.096
33.523	38.018
33.523	38.855
34.057	40.531
34.324	38.354
34.591	37.601
34.858	35.508
35.259	32.996
35.392	37.352
35.392	38.943
35.392	38.692
35.526	36.598
36.728	39.029
36.728	39.867
36.861	34.675
37.529	41.041
37.529	41.627
37.529	42.967
38.063	40.037
38.331	34.343
38.598	43.472
39.800	40.962
39.800	38.952
40.467	38.954
41.269	38.955
41.536	36.611
42.337	41.470
42.871	39.294
42.871	40.131
43.673	40.468
44.474	40.804
44.741	40.135
44.741	39.633
45.142	42.983
45.409	40.304
45.409	39.634
45.543	37.708
47.145	40.308
47.679	40.644
48.748	40.981
48.748	41.567
50.083	42.659
50.217	41.235
50.351	36.210
50.351	40.063
51.152	43.499
51.285	41.991
53.289	40.488
53.556	37.557
55.693	43.424
56.093	40.913
56.093	41.666
57.028	41.166
57.162	38.653
59.299	37.485
59.432	44.018
60.634	39.163
60.901	39.918
66.644	42.945
71.319	38.851
77.997	39.786];
data.tL1(:,1) = 365 * (.75 + data.tL1(:,1)); % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length', 'south coast'};  
temp.tL1    = C2K(18);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'CossHesp2010';
comment.tL = 'Data from south coast of Australia';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    25  5300
    30 11000
    35 20000
    40 36000];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CossHesp2010';
comment.LN = 'Data from west coast';
%
data.LN1 = [ ... % total length (cm), fecundity (#)
    25  9600
    30 19500
    35 35000
    40 59000];
units.LN1   = {'cm', '#'};  label.LN1 = {'total length','fecundity'};  
temp.LN1    = C2K(18);  units.temp.LN1 = 'K'; label.temp.LN1 = 'temperature';
bibkey.LN1 = 'CossHesp2010';
comment.LN1 = 'Data from south coast of Australia';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tL1 = 10 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from west, south coast of Australia'};
set2 = {'LN','LN1'}; subtitle2 = {'Data from west, south coast of Australia'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures has been guessed on the basis of preferred temperature, as given in fishbase';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length weight: Ww in g = 0.01202*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Protogynous hermaphrodite: females may change to males; all are born as female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'M8RQ'; % Cat of Life
metaData.links.id_ITIS = '613322'; % ITIS
metaData.links.id_EoL = '46571603'; % Ency of Life
metaData.links.id_Wiki = 'Bodianus_frenchii'; % Wikipedia
metaData.links.id_ADW = 'Bodianus_frenchii'; % ADW
metaData.links.id_Taxo = '164322'; % Taxonomicon
metaData.links.id_WoRMS = '273531'; % WoRMS
metaData.links.id_fishbase = 'Bodianus-frenchii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Bodianus_frenchii}}';
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
bibkey = 'CossHesp2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2010.02706.x}, ' ...
'author = {S. Cossington and S. A. Hesp and N. G. Hall and I. C. Potter}, ' ... 
'year = {2010}, ' ...
'title = {Growth and reproductive biology of the foxfish \emph{Bodianus frenchii}, a very long-lived and monandric protogynous hermaphroditic labrid}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {77}, ' ...
'pages = {600-626}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bodianus-frenchii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

