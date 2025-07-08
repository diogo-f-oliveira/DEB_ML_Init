function [data, auxData, metaData, txtData, weights] = mydata_Moniliformis_dubius

%% set metaData
metaData.phylum     = 'Acanthocephala'; 
metaData.class      = 'Archiacanthocephala'; 
metaData.order      = 'Moniliformida'; 
metaData.family     = 'Moniliformidae';
metaData.species    = 'Moniliformis_dubius'; 
metaData.species_en = 'Worm'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TA'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Ta'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biTvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Ab'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-M_N'; 't-M_DNA'; 't-M_RNA'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 01 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3 = [2023 04 22];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 04 22]; 

%% set data
% zero-variate data

data.tp = 21;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Crom1972';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp is that of the host: rat';
data.am = 150;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Crom1972';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Largest age mentioned in Crom1972, but its significance is unknown';

data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'Olse1974';
data.Lim  = 8;   units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'Olse1974';

data.Wwb = 2.4e-7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg length 90-125 mum, width 65 mum: pi/6*0.011*0.0065^2';
data.Wwi = 3.9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Olse1974';
  comment.Wwi = 'based on pi del^2 Li^3/ 4 with del = 0.025 from plate 105 of Olse1974';
data.Wwim = 0.25;units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'Olse1974';
  comment.Wwim = 'based on pi del^2 Li^3/ 4 with del = 0.025 from plate 105 of Olse1974';

data.GSI  = 0.28; units.GSI  = '-'; label.GSI  = 'gonado somatic index';      bibkey.GSI  = 'Crom1972';   
  temp.GSI = C2K(37);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'accumulation time is unknown';
 
% uni-variate data

% time-nitrogen data
% females
data.tM_Nf = [ ... % time since birth (d), nitrogen (mg)
0.000	0.002
2.582	0.002
3.615	0.003
3.615	0.003
4.906	0.004
6.971	0.006
7.488	0.010
7.488	0.011
10.844	0.035
13.684	0.068
13.684	0.074
20.139	0.375
20.656	0.395
20.656	0.599
20.914	0.183
21.172	0.379
23.496	0.786
23.754	0.872
27.369	1.323
27.369	1.394
27.627	0.803
27.885	0.747
27.885	0.999
27.885	1.120
29.176	0.755
31.242	1.485
34.598	1.170
34.598	2.052
34.857	1.549
34.857	1.888
35.115	1.471
35.115	1.632
35.115	1.774
35.373	1.830
35.631	1.566
35.631	1.989
35.889	2.052
36.148	1.702
38.988	1.171
38.988	2.119
39.246	1.273
39.246	1.991
39.762	2.376
41.570	2.665
41.570	3.148
41.570	3.385
41.828	2.142
41.828	3.566
41.828	3.876
42.086	2.557
42.086	2.837
42.344	2.304
42.344	2.402
42.344	2.693
42.602	2.233
42.861	2.427
43.119	2.531
44.926	3.353
45.184	3.532
45.443	2.960
45.443	3.644
45.701	3.920
45.701	4.979
48.283	2.356
48.283	2.456
48.283	2.560
48.283	2.931
48.541	2.669
48.541	2.782
48.541	2.841
48.541	3.185
48.541	3.535
48.541	3.609
48.541	3.723
48.799	1.974
49.057	1.855
49.057	3.842
49.057	4.089
49.574	3.427
52.672	3.188
52.672	3.538
52.672	3.926
56.029	3.468
56.029	3.691
56.029	3.848
56.029	3.970
56.287	4.139
56.287	4.545
56.545	3.191
56.803	2.538
56.803	2.674
59.902	5.659
60.160	5.317
60.160	5.486
60.160	6.968
63.258	2.569
63.516	2.650
63.516	2.910
63.516	3.034
63.516	3.196
63.516	3.367
63.775	5.905
64.033	4.189
64.033	5.158
64.033	5.322
64.033	5.606
66.873	2.466
66.873	4.951
67.648	3.939
69.971	4.108
70.230	5.791
70.230	6.037
70.230	6.769
70.488	4.753
70.488	5.059
70.488	7.590
73.844	5.736
74.877	6.500
77.201	3.273
77.201	3.988
77.717	4.472
77.717	4.760
77.717	5.067
77.717	5.393
83.656	5.748
83.656	6.312
83.914	3.792
84.430	2.954
84.430	6.248
84.430	7.303
91.143	5.298
91.143	5.879
91.402	4.926
91.402	6.258
91.402	6.524
92.176	7.165
98.115	6.012
98.115	7.175
98.889	6.013
104.828	5.598
105.344	5.836
105.602	4.595
105.602	6.022
106.119	3.850
111.541	7.820
112.057	7.122
112.574	6.419
112.832	7.198
118.512	6.361
119.029	7.833
125.742	6.853];
units.tM_Nf   = {'d', 'mg'};  label.tM_Nf = {'time since birth', 'N weight', 'female'};  
temp.tM_Nf   = C2K(37);  units.temp.tM_Nf = 'K'; label.temp.tM_Nf = 'temperature';
bibkey.tM_Nf = 'Crom1972';
comment.tM_Nf = 'Data for females; variation in data is partly due to release of eggs; rats were 150 g on infection with 12 cystacanths after 6 weeks: 72% of N is in bodies of females, 28 % in eggs';
% males
data.tM_Nm = [ ... % time since birth (d), nitrogen (mg) 
0.516	0.002
3.098	0.003
3.357	0.004
5.939	0.004
7.230	0.005
10.586	0.027
13.684	0.069
13.684	0.075
14.201	0.039
20.656	0.185
20.656	0.235
24.271	0.421
27.111	0.189
27.627	0.201
27.627	0.256
27.627	0.498
30.725	0.463
33.824	0.405
34.082	0.520
34.598	0.426
34.598	0.463
34.857	0.589
34.857	0.647
38.988	0.571
41.312	0.526
41.312	0.554
41.312	0.608
41.312	0.647
41.312	0.749
45.959	0.526
45.959	0.933
48.025	0.470
48.025	0.505
48.025	0.538
48.283	0.566
48.283	0.616
48.283	0.655
48.283	0.683
48.283	0.742
48.283	0.859
51.898	0.743
53.447	0.799
54.738	0.925
55.512	0.808
55.771	0.791
56.029	0.728
56.287	0.878
59.127	1.071
61.967	0.605
61.967	0.644
61.967	1.189
62.225	0.671
62.484	0.685
62.742	0.714
63.516	0.714
66.357	1.203
67.131	1.095
69.455	0.693
69.455	0.811
69.455	0.988
69.455	1.019
69.455	1.085
69.713	0.731
73.586	1.296
76.943	0.680
77.201	0.717
83.914	0.991
90.885	0.992
91.143	0.634
91.402	0.885
91.402	1.056
97.857	1.069
98.373	1.211
98.889	1.344
104.828	1.151];
units.tM_Nm   = {'d', 'mg'};  label.tM_Nm = {'time since birth', 'N weight', 'male'};  
temp.tM_Nm   = C2K(37);  units.temp.tM_Nm = 'K'; label.temp.tM_Nm = 'temperature';
bibkey.tM_Nm = 'Crom1972';
comment.tM_Nm = 'Data for males';

% time-DNA data
data.tM_DNAf = [ ... % time since birth (d), DNA (mug) for females
0.110	0.041
0.213	0.022
3.233	0.113
4.903	0.212
6.072	0.180
6.913	0.233
11.199	0.351
13.484	0.440
13.501	0.367
13.960	1.288
20.235	2.666
20.563	1.746
22.830	2.667
25.990	3.013
34.478	16.928
34.533	9.386
34.536	9.106
34.816	9.972
41.656	23.297
41.665	21.276
41.878	47.426
41.899	37.801
41.929	27.515
41.938	25.128
42.011	11.445
48.806	43.384
48.813	40.225
49.042	75.924
49.076	52.814
49.086	47.508
55.450	37.924
55.467	31.630
55.688	65.372
56.287	51.329
56.293	48.316
56.587	45.483
56.595	41.537
62.322	63.525
62.604	67.491
62.640	46.243
62.650	41.598
63.248	33.160
69.533	61.739
69.558	47.026
69.565	43.601
69.776	100.177
69.783	92.881
76.190	47.101
76.749	56.481
76.755	53.166
77.022	66.709
77.083	34.814
77.094	30.847
77.129	21.458
83.412	40.560
83.662	61.019
83.665	59.201
83.673	54.066
83.678	51.668
83.739	26.965
83.905	99.008
84.054	20.232
90.028	47.978
90.269	79.034
90.295	60.199
90.306	53.339
90.568	71.100
97.168	99.324
97.889	21.241
98.124	37.739
98.153	27.470
104.779	29.230
105.011	53.528
111.342	60.504
111.617	70.387
111.886	85.686
111.893	79.445
118.802	89.812
118.816	77.206
125.709	103.078];
units.tM_DNAf   = {'d', 'mug'};  label.tM_DNAf = {'time since birth', 'DNA weight', 'female'};  
temp.tM_DNAf   = C2K(37);  units.temp.tM_DNAf = 'K'; label.temp.tM_DNAf = 'temperature';
bibkey.tM_DNAf = 'Crom1972';
comment.tM_DNAf = 'Data for females; after 6 weeks: 20% of DNA is in bodies of females, 80 % in eggs.';
% males
data.tM_DNAm = [ ... % time since birth (d), DNA (mug) for males
-0.132	0.041
0.213	0.022
2.674	0.092
3.264	0.081
3.272	0.074
4.923	0.172
4.967	0.108
7.246	0.143
7.256	0.129
11.245	0.216
12.083	0.288
13.439	0.714
20.011	1.350
20.286	1.547
21.124	2.062
21.131	1.912
21.982	2.224
21.986	2.126
24.877	1.972
25.963	4.016
26.581	2.590
27.165	2.402
27.385	4.964
27.418	3.506
27.425	3.251
27.435	2.924
27.442	2.711
27.474	1.915
27.987	3.782
34.604	4.406
34.609	4.211
34.614	3.964
34.620	3.731
34.627	3.459
34.887	4.681
41.242	4.154
41.284	2.639
41.519	4.689
41.523	4.481
42.072	5.973
48.171	3.743
48.701	6.166
48.704	5.983
48.707	5.804
49.015	4.697
49.309	4.422
55.558	12.016
55.571	10.487
55.866	9.723
55.876	8.747
56.186	6.972
56.206	5.642
62.249	6.376
62.261	5.650
62.779	10.505
62.806	7.881
69.385	13.813
69.402	11.521
69.436	8.014
69.445	7.319
69.450	6.889
69.749	6.198
69.780	4.444
76.906	10.701
77.160	15.385
83.848	8.415
89.890	9.656
90.117	18.504
90.151	12.871
90.734	12.117
97.443	5.283
97.634	15.000
97.715	6.334
105.195	7.494];
units.tM_DNAm   = {'d', 'mug'};  label.tM_DNAm = {'time since birth', 'DNA weight', 'male'};  
temp.tM_DNAm   = C2K(37);  units.temp.tM_DNAm = 'K'; label.temp.tM_DNAm = 'temperature';
bibkey.tM_DNAm = 'Crom1972';
comment.tM_DNAm = 'Data for males';

% time-RNA data 
data.tM_RNAf = [ ... % time since birth (d), RNA (mg) for females
0.001	0.001
0.259	0.001
4.126	0.001
5.374	0.002
6.634	0.004
6.948	0.006
10.795	0.010
13.037	0.015
19.738	0.101
20.064	0.089
20.691	0.146
20.696	0.128
21.982	0.141
22.628	0.132
23.905	0.188
24.227	0.191
26.474	0.243
27.436	0.278
27.757	0.287
28.076	0.313
28.086	0.239
34.518	0.346
34.836	0.390
34.838	0.364
40.944	0.595
40.946	0.557
41.259	0.729
41.270	0.529
41.596	0.478
42.562	0.495
47.705	0.718
47.706	0.682
48.026	0.743
48.036	0.557
48.038	0.521
48.044	0.440
55.118	0.683
55.119	0.660
55.121	0.628
55.437	0.743
55.448	0.558
55.450	0.512
61.885	0.695
61.889	0.618
61.893	0.549
62.224	0.426
62.550	0.385
68.973	0.732
69.599	1.216
69.602	1.117
69.605	1.044
69.936	0.810
76.066	0.651
76.381	0.797
76.384	0.745
76.386	0.697
76.394	0.559
77.021	0.913
83.158	0.609
83.463	1.011
83.492	0.434
83.780	1.158
83.782	1.101
90.557	0.884
90.561	0.786
90.563	0.734
90.566	0.675
90.570	0.610
97.325	0.870
97.643	0.980
97.988	0.507
97.993	0.443
104.104	0.611
104.432	0.525
104.762	0.421
105.103	0.245
111.502	0.917
111.829	0.801
118.598	0.762
119.246	0.689
126.000	1.000];
units.tM_RNAf   = {'d', 'mg'};  label.tM_RNAf = {'time since birth', 'RNA weight', 'female'};  
temp.tM_RNAf   = C2K(37);  units.temp.tM_RNAf = 'K'; label.temp.tM_RNAf = 'temperature';
bibkey.tM_RNAf = 'Crom1972';
comment.tM_RNAf = 'Data for females; RNA was measured by orcinol method: very indirect after 6 weeks: 62% of N is in bodies of females, 38 % in eggs.';
% males
data.tM_RNAm = [ ... % time since birth (d), RNA (mg) for males
0.001	0.001
0.001	0.001
3.829	0.001
4.116	0.001
4.127	0.001
4.129	0.001
5.373	0.002
5.384	0.001
6.948	0.006
6.960	0.004
10.473	0.010
10.476	0.009
11.762	0.010
12.399	0.012
13.670	0.021
13.964	0.047
16.539	0.051
20.079	0.058
20.390	0.079
20.721	0.063
21.047	0.057
22.325	0.077
24.247	0.108
25.207	0.130
26.827	0.101
27.457	0.151
27.461	0.137
27.473	0.096
27.477	0.087
27.483	0.072
33.920	0.093
34.252	0.068
34.915	0.041
35.559	0.041
41.325	0.112
41.327	0.106
41.642	0.130
42.292	0.112
48.402	0.157
48.405	0.144
48.730	0.135
48.732	0.126
55.163	0.189
55.165	0.180
55.170	0.157
55.818	0.139
55.821	0.128
62.261	0.149
62.586	0.137
62.588	0.128
62.592	0.116
69.349	0.155
69.353	0.137
69.356	0.128
69.990	0.171
70.307	0.199
76.440	0.150
76.443	0.138
83.198	0.193
90.288	0.190
90.617	0.158
90.621	0.140
90.951	0.114
97.371	0.233
97.404	0.089
98.036	0.129
104.487	0.109];
units.tM_RNAm   = {'d', 'mg'};  label.tM_RNAm = {'time since birth', 'RNA weight', 'male'};  
temp.tM_RNAm   = C2K(37);  units.temp.tM_RNAm = 'K'; label.temp.tM_RNAm = 'temperature';
bibkey.tM_RNAm = 'Crom1972';
comment.tM_RNAm = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tM_Nf','tM_Nm'}; subtitle1 = {'Data for females, males'};
set2 = {'tM_DNAf','tM_DNAm'}; subtitle2 = {'Data for females, males'};
set3 = {'tM_RNAf','tM_RNAm'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'This entry only considers stages in the final host';     
D3 = 'Assumed accumulation time for GSI is 30 d';     
D4 = 'mod_3: DNA linked to structure, RNA to reserve (since RNAm dominates); N quantified via n_NE and n_NV';
D5 = 'mod_3: Wwd data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'Acanthocephalans do not have digestive tracts; parasitic in mammals, with insects as intermediary hosts';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '73NKS'; % Cat of Life
metaData.links.id_ITIS = '196584'; % ITIS
metaData.links.id_EoL = '47261319'; % Ency of Life
metaData.links.id_Wiki = 'Moniliformis_moniliformis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '14700'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/https://en.wikipedia.org/wiki/Moniliformis_moniliformis}}';
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
bibkey = 'Crom1972'; type = 'Article'; bib = [ ... 
'author = {Crompton, D. W. T.}, ' ... 
'year = {1972}, ' ...
'title = {The growth of \emph{Moniliformis dubius} ({A}canthocepgala) in the intestines of male rats}, ' ...
'journal = {J. Exp. Biol.}, ' ...
'volume = {56}, ' ...
'pages = {19--29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Olse1974'; type = 'Book'; bib = [ ... 
'author = {Olsen, O. W.}, ' ... 
'year = {1974}, ' ...
'title = {Animal parasites; thier life cycles and ecology}, ' ...
'publisher = {Dover Pub.}, ' ...
'address = {New York}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

