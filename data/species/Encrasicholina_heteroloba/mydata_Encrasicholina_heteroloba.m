  function [data, auxData, metaData, txtData, weights] = mydata_Encrasicholina_heteroloba 
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Encrasicholina_heteroloba'; 
metaData.species_en = 'Shorthead anchovy'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 
metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 19];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.2;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 12;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 1.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00575*Lp^3.15, see F1';
data.Wwi = 14.4;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.15, see F1';

data.Ri  = 2500/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Stolephorus_carpentariae';

% uni-variate data
data.tL_M = [ ... % time since hatch (d), std length (mm)
3.162	3.144
6.607	7.748
22.130	22.831
23.867	21.165
30.490	24.316
30.770	26.615
33.055	32.887
33.090	23.279
33.943	26.624
34.196	36.441
34.814	25.164
35.378	28.716
36.493	39.581
36.517	32.897
36.811	31.227
37.118	26.215
37.399	28.304
37.689	27.678
37.938	38.750
39.078	42.513
39.425	26.430
39.971	34.787
40.219	46.275
40.236	41.471
40.513	44.605
41.399	38.759
41.650	49.413
42.823	43.985
43.405	42.525
43.677	47.121
43.990	40.229
44.549	45.243
44.850	41.693
45.118	47.542
45.993	44.829
46.239	56.527
46.266	49.008
46.269	48.172
46.277	46.083
46.306	38.146
46.574	43.578
47.415	50.473
47.443	42.745
48.589	44.837
48.861	49.433
48.871	46.717
49.984	58.000
49.997	54.449
50.003	52.778
50.014	49.645
50.278	56.538
50.884	48.394
51.169	49.439
51.422	59.257
51.441	53.826
51.448	51.946
51.470	45.889
51.768	43.175
52.303	54.873
52.855	61.768
52.894	50.906
53.134	64.484
53.159	57.382
53.195	47.356
53.241	34.615
53.742	55.713
54.037	54.042
54.043	52.163
54.051	50.074
54.303	60.309
54.312	57.594
54.316	56.550
54.357	45.270
54.619	52.582
55.166	60.939
55.506	46.527
55.729	64.700
55.746	59.896
55.752	58.434
55.785	49.034
56.601	62.822
56.634	53.632
57.201	56.349
57.511	50.501
57.525	46.533
58.057	59.067
58.375	50.921
59.227	54.475
59.784	60.116
59.796	56.774
59.809	53.223
60.352	62.624
60.357	61.162
60.634	64.296
60.654	58.865
61.249	53.854
61.481	69.520
61.819	55.735
62.102	57.198
62.654	64.301
62.667	60.542
62.672	59.288
62.998	48.637
63.040	37.148
63.266	54.486
63.816	61.798
64.139	52.191
64.371	68.066
64.414	56.160
65.841	60.342
66.154	53.450
66.986	62.851
67.020	53.452
67.557	64.524
67.567	61.600
67.852	62.645
69.275	68.080
69.284	65.364
69.900	54.504
70.740	61.609
71.325	59.521
75.053	65.380
76.203	66.637
77.079	63.506
77.359	66.013
78.281	50.350
79.950	67.483
80.246	65.395
81.098	69.157];
data.tL_M(:,2) = data.tL_M(:,2)/10; % convert mm to cm
units.tL_M = {'d', 'cm'};  label.tL_M = {'time since birth', 'std length'};  
  temp.tL_M = C2K(27.9);  units.temp.tL_M = 'K'; label.temp.tL_M = 'temperature'; 
bibkey.tL_M = 'MiltBlab1989';
comment.tL_M = 'Data from Munda, Solomons Islands';
%
data.tL_V = [ ... % time since hatch (d), std length (mm)
6.301	11.023
6.632	5.397
8.026	13.310
8.880	15.600
8.908	11.641
10.055	13.513
10.064	12.263
11.267	6.426
11.489	15.801
13.798	17.461
26.781	27.633
27.346	29.715
29.667	29.708
31.093	33.038
31.109	30.954
31.662	34.703
31.976	31.369
32.529	35.117
32.558	31.159
33.401	34.906
33.451	28.031
33.709	32.406
34.300	30.946
34.586	31.570
34.834	37.402
35.103	40.318
35.128	36.777
35.432	34.901
35.742	32.192
35.944	44.274
36.540	42.189
36.910	31.147
36.916	30.313
37.182	33.646
37.702	41.978
38.604	37.600
38.637	33.017
39.216	33.224
39.681	49.056
40.038	39.888
40.540	50.720
40.878	44.052
40.887	42.802
40.942	35.302
40.966	31.969
40.967	31.760
41.224	36.343
41.712	49.050
42.376	37.590
42.403	33.840
43.192	45.088
43.251	36.962
43.532	38.212
44.355	44.668
44.429	34.459
44.674	40.708
44.694	38.000
44.919	46.958
45.180	50.915
45.301	34.248
45.526	43.206
46.084	46.330
46.382	45.287
46.717	39.036
47.219	49.868
47.234	47.785
47.848	43.200
48.068	52.782
48.092	49.449
48.124	45.074
48.736	40.697
49.221	53.821
49.543	49.445
49.789	55.486
50.184	41.110
50.634	59.025
50.695	50.692
50.743	44.025
50.977	51.733
51.016	46.316
51.353	39.857
51.586	47.773
51.616	43.606
52.129	52.979
52.392	56.729
52.402	55.270
52.717	51.936
53.002	52.560
53.316	49.226
53.350	44.643
53.889	50.266
54.120	58.391
54.453	52.556
54.778	47.764
55.085	45.471
55.100	43.388
55.597	54.845
55.925	49.636
56.160	57.135
56.166	56.302
56.442	58.384
57.094	48.382
57.363	51.298
57.401	46.090
57.424	42.965
57.584	60.881
57.886	59.213
57.947	50.880
58.213	54.212
58.510	53.170
59.059	57.543
59.125	48.377
59.624	59.625
60.244	54.207
60.860	49.205
61.128	52.329
61.392	55.870
61.410	53.370
61.962	57.327
62.241	58.785
62.516	60.867
62.562	54.617
62.610	47.950
62.840	56.283
63.743	51.697
63.946	63.780
63.961	61.697
64.606	52.736
65.418	60.859
66.297	59.607
67.251	48.146
67.428	63.770
69.179	62.307
71.278	52.926
71.503	61.884
71.821	58.133
72.380	61.048
72.945	63.130
72.987	57.296
73.874	55.002
75.875	59.163
77.602	61.034
78.748	63.114];
data.tL_V(:,2) = data.tL_V(:,2)/10; % convert mm to cm
units.tL_V = {'d', 'cm'};  label.tL_V = {'time since birth', 'std length'};  
  temp.tL_V = C2K(27.9);  units.temp.tL_V = 'K'; label.temp.tL_V = 'temperature'; 
bibkey.tL_V = 'MiltBlab1989';
comment.tL_V = 'Data from Munda, Solomons Islands';
%
data.tL_T = [ ... % time since hatch (d), std length (mm)
13.348	14.583
21.794	32.314
22.930	26.880
23.529	32.727
23.826	34.815
24.382	28.756
24.692	34.603
24.953	26.874
24.968	31.052
25.564	35.854
25.815	25.410
25.831	29.796
25.856	36.689
26.115	28.333
27.864	32.506
27.869	33.968
28.449	34.384
28.756	39.396
29.611	36.052
30.202	39.601
30.475	35.214
30.774	37.928
31.042	32.288
31.072	40.643
32.206	34.373
32.508	37.924
32.779	32.910
32.799	38.549
33.075	34.998
33.934	32.698
33.951	37.293
34.542	41.051
35.391	36.036
35.690	38.750
36.561	39.792
36.565	41.045
36.841	37.285
39.148	36.025
39.727	36.232
39.737	38.948
39.741	40.201
40.324	41.453
41.488	43.747
41.784	45.626
42.331	37.061
43.491	38.102
44.695	51.258
44.943	39.978
45.228	38.932
46.093	38.303
46.402	43.942
47.315	56.681
48.419	42.057
48.468	55.634
48.692	37.670
49.022	48.948
49.627	56.466
50.769	52.703
51.320	45.182
51.630	51.030
53.093	56.038
53.948	52.694
54.840	59.376
55.709	60.000
55.993	58.537
57.085	40.988
58.583	55.605
58.851	49.756
61.775	59.147
61.786	62.072
62.952	64.993
63.791	57.262
64.398	65.198
66.688	58.925
66.691	59.760
72.441	51.389
74.207	60.366
84.312	57.414];
data.tL_T(:,2) = data.tL_T(:,2)/10; % convert mm to cm
units.tL_T = {'d', 'cm'};  label.tL_T = {'time since birth', 'std length'};  
  temp.tL_T = C2K(27.9);  units.temp.tL_T = 'K'; label.temp.tL_T = 'temperature'; 
bibkey.tL_T = 'MiltBlab1989';
comment.tL_T = 'Data from Tulagi, Solomons Islands';
%
data.tL_t = [ ... % time since hatch (d), std length (mm)
62.185	54.068
63.653	49.251
63.947	48.204
65.367	56.614
65.642	60.606
66.829	53.477
68.239	64.618
69.687	65.470
70.032	50.144
70.886	54.771
72.296	66.121
73.495	55.423
73.760	62.354
73.775	58.155
74.040	65.086
77.233	64.693
77.276	52.725
78.688	63.445
79.829	68.914
80.713	65.142
81.308	61.158
83.909	63.909
84.213	60.132
84.799	58.457
85.080	60.979
85.941	63.506
87.086	67.925
87.717	53.863
87.962	66.463
89.408	67.735
90.577	65.435
90.901	55.989
91.148	67.750
92.048	59.778
92.292	72.379
92.347	57.261
92.857	76.583
93.465	69.029
94.344	66.727
94.349	65.257
95.772	72.828
96.364	69.683
96.945	69.478
98.712	62.354
99.547	72.020
103.903	70.796
107.675	70.828
108.527	75.875
110.285	71.060
110.566	73.792
112.600	72.759
119.282	70.296
127.111	71.621
136.382	75.479
139.847	79.917];
data.tL_t(:,2) = data.tL_t(:,2)/10; % convert mm to cm
units.tL_t = {'d', 'cm'};  label.tL_t = {'time since birth', 'std length'};  
  temp.tL_t = C2K(27.9);  units.temp.tL_t = 'K'; label.temp.tL_t = 'temperature'; 
bibkey.tL_t = 'MiltBlab1989';
comment.tL_t = 'Data from Thinadhoo, Maladives';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_M', 'tL_V', 'tL_T', 'tL_t'}; subtitle1 = {'Data from Munda, Vona Vona, Tulagi, Thinadhoo'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.15'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6F89N'; % Cat of Life
metaData.links.id_ITIS = '161880'; % ITIS
metaData.links.id_EoL = '46562675'; % Ency of Life
metaData.links.id_Wiki = 'Encrasicholina_heteroloba'; % Wikipedia
metaData.links.id_ADW = 'Encrasicholina_heteroloba'; % ADW
metaData.links.id_Taxo = '173694'; % Taxonomicon
metaData.links.id_WoRMS = '219980'; % WoRMS
metaData.links.id_fishbase = 'Encrasicholina-heteroloba'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Encrasicholina_heteroloba}}';  
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
bibkey = 'MiltBlab1989'; type = 'Incollection'; bib = [ ... 
'author = {D.A. Milton and S.J.M. Blaber and N.J.F. Rawlinson and A. Hafiz and G. Tiroba}, ' ...
'booktitle = {Tuna Baitfish in the Indo-Pacific Region: Proceedings of a Workshop held in Honiara, Solomon Islands, 11–13 December 1989)}, ' ...
'editor = {’S. J. M. Blaber and J. W. Copeland}, ' ...
'year = {1989}, ' ...
'series = {ACIAR Proceedings}, ' ...
'volume = {30}, ' ...
'title = {Age and Growth of Major Baitfish Species in {S}olomon {I}slands and {M}aldives}, ' ... 
'pages = {134–140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Encrasicholina-heteroloba.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  