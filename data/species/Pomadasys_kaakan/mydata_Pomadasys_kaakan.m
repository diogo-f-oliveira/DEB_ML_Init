function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_kaakan
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_kaakan'; 
metaData.species_en = 'Javelin grunt'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE', 'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 23]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 23]; 

%% set data
% zero-variate data

data.ab = 26/24;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(26.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'value for Lutjanus vitta';
data.am = 40*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AlHuAlBa2002';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase: max reprod age is 12 yr';
  
data.Lp  = 35; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 80;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 577; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on length-weight of 0.01445*Lp^2.98, see F1';
data.Wwi = 6.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of 0.01445*Li^2.98, see F1';

data.Ri  = 2e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.85';
  
% uni-variate data
% t-L data for females
data.tL = [ ... % time since birth (yr), total length (cm)
0.042	3.972
0.121	19.669
0.122	18.156
0.124	14.374
0.127	8.511
0.128	7.187
0.171	9.456
0.208	22.317
0.213	12.104
0.214	10.213
0.256	15.130
0.258	10.969
0.260	7.943
0.260	6.998
0.295	23.262
0.338	24.965
0.428	21.939
0.430	18.156
0.435	9.835
0.435	8.889
0.520	15.508
0.560	21.939
0.561	20.615
0.564	15.130
0.602	24.965
0.603	24.019
0.605	19.669
0.607	16.643
0.650	18.156
0.689	27.991
0.773	34.043
0.784	15.130
0.784	13.995
0.785	13.050
0.875	8.889
0.876	7.565
0.951	30.260
0.959	16.454
0.994	32.908
1.042	26.478
1.128	28.747
1.129	27.801
1.129	26.856
1.131	24.019
1.132	22.884
1.132	21.939
1.132	21.182
1.172	29.882
1.172	29.504
1.179	15.887
1.180	14.941
1.215	31.017
1.218	25.343
1.263	24.019
1.263	23.452
1.305	27.991
1.306	24.965
1.394	26.478
1.440	21.560
1.481	28.180
1.484	22.506
1.487	17.400
1.524	30.071
1.531	16.454
1.570	25.910
1.570	25.154
1.611	31.962
1.611	31.206
1.611	30.638
1.657	27.234
1.659	23.452
1.661	21.182
1.661	20.236
1.786	33.286
1.788	28.936
1.865	49.551
1.871	37.825
1.873	34.421
1.883	17.021
1.918	32.530
1.926	18.913
2.007	31.395
2.008	29.314
2.008	28.558
2.012	21.939
2.052	29.693
2.053	27.234
2.088	44.066
2.094	32.530
2.135	38.771
2.135	38.203
2.137	35.556
2.138	33.664
2.177	43.121
2.178	39.716
2.180	35.934
2.183	31.584
2.183	30.449
2.186	25.532
2.218	47.849
2.225	34.799
2.311	37.825
2.358	33.286
2.359	31.206
2.533	34.799
2.580	30.449
2.583	24.019
2.616	44.444
2.628	22.884
2.701	49.173
2.702	48.038
2.705	43.121
2.713	27.045
2.714	26.288
2.714	25.343
2.753	34.232
2.799	31.773
2.834	47.281
2.837	43.121
2.838	40.095
2.839	39.338
2.841	34.988
2.842	32.530
2.844	30.449
2.845	27.991
2.879	45.957
2.880	44.634
2.884	37.447
2.884	36.123
2.887	31.395
2.888	29.693
2.888	28.936
2.921	49.929
2.926	41.229
2.930	33.475
2.931	30.638
2.934	25.721
2.967	46.147
2.979	24.397
3.017	34.232
3.057	41.797
3.058	40.095
3.059	39.149
3.104	36.879
3.106	34.043
3.107	32.151
3.232	44.634
3.268	58.061
3.404	51.064
3.495	46.147
3.535	53.522
3.537	49.173
3.538	48.038
3.540	43.877
3.541	42.742
3.541	42.175
3.542	41.229
3.542	40.095
3.580	51.064
3.588	37.825
3.666	54.846
3.757	50.118
3.802	47.281
3.843	54.090
3.847	46.147
3.849	43.121
3.850	40.473
3.850	39.905
3.851	38.960
3.852	36.312
3.885	57.116
3.890	48.416
3.892	44.255
3.897	35.366
3.930	55.981
3.931	53.522
3.933	50.118
3.936	45.201
3.938	41.040
3.940	37.258
3.942	34.043
3.942	32.908
4.016	58.061
4.115	38.582
4.148	59.764
4.189	64.492
4.190	62.790
4.201	42.364
4.242	47.849
4.332	45.201
4.419	45.579
4.420	44.255
4.502	55.035
4.503	54.090
4.507	46.903
4.546	56.170
4.636	52.388
4.636	51.442
4.642	41.040
4.687	39.905
4.731	38.771
4.773	42.175
4.810	56.170
4.811	53.712
4.811	52.955
4.813	50.118
4.814	48.983
4.814	48.227
4.818	41.040
4.820	37.069
4.856	51.253
4.859	46.147
4.860	45.201
4.860	44.066
4.861	43.310
4.897	57.872
4.897	56.738
4.909	35.556
4.909	34.799
4.910	33.475
4.939	60.331
4.951	38.771
4.986	55.981
4.986	55.414
4.988	52.199
4.994	40.095
5.031	53.901
5.033	50.307
5.038	41.040
5.040	37.258
5.157	65.248
5.165	50.118
5.169	43.121
5.243	68.652
5.293	57.116
5.341	50.496
5.344	44.066
5.513	58.061
5.515	54.279
5.515	53.144
5.519	46.336
5.601	58.061
5.605	50.875
5.652	45.201
5.688	59.764
5.690	55.981
5.690	55.225
5.693	50.118
5.694	47.849
5.698	40.284
5.736	51.820
5.738	48.416
5.740	44.444
5.781	49.362
5.783	46.147
5.820	58.629
5.822	55.225
5.829	42.364
5.865	58.061
5.865	56.738
5.866	55.981
5.867	52.955
5.869	49.929
5.871	47.092
5.875	38.771
5.876	38.014
6.001	50.686
6.005	43.310
6.177	51.064
6.262	55.225
6.264	52.955
6.393	57.872
6.526	55.035
6.533	43.877
6.569	57.116
6.615	53.333
6.705	51.064
6.743	60.520
6.744	59.574
6.744	58.818
6.746	56.548
6.750	48.416
6.790	55.225
6.791	53.144
6.792	52.199
6.795	47.092
6.795	45.957
6.796	45.390
6.831	60.898
6.833	57.116
6.837	50.686
6.837	50.118
6.838	48.416
6.875	61.844
6.922	55.225
7.095	61.466
7.276	52.955
7.277	51.064
7.627	54.090
7.669	57.683
7.672	52.577
7.799	62.033
7.801	58.251
7.801	57.494
7.801	56.927
7.802	56.170
7.802	55.414
7.805	49.929
7.844	58.818
7.885	64.303
7.890	55.225
7.891	53.712
7.892	52.577
7.973	65.816
7.979	53.522
8.325	65.816
8.327	60.898
8.460	60.331
8.506	56.170
8.507	55.035
8.546	63.735
8.637	57.494
8.640	52.199
8.686	49.173
8.766	62.790
8.767	61.844
8.767	61.277
8.770	55.981
8.771	55.035
8.772	53.333
8.817	51.442
8.852	66.761
8.856	59.007
8.857	58.251
8.857	57.116
8.858	56.359
8.860	52.199
8.897	64.870
8.901	57.494
8.903	54.090
8.943	62.033
9.251	62.033
9.383	61.087
9.388	52.009
9.653	51.253
9.692	59.764
9.735	62.033
9.738	56.170
9.739	54.090
9.740	52.009
9.822	62.790
9.826	56.738
9.871	55.225
9.872	53.333
9.912	59.574
9.913	58.061
9.914	55.603
9.953	65.437
9.957	59.007
9.957	58.251
9.959	53.901
10.128	67.707
10.257	72.813
10.264	59.764
10.707	54.279
10.708	53.144
10.744	68.085
10.747	62.411
10.749	59.196
10.794	56.927
10.794	56.359
10.796	53.144
10.797	51.820
10.878	63.168
10.881	59.196
10.881	58.251
10.883	55.414
10.883	54.468
10.923	61.087
10.964	67.329
10.967	62.033
11.366	57.305
11.406	63.357
11.802	63.168
11.803	62.222
11.803	61.277
11.804	59.953
11.805	59.385
11.805	57.872
11.807	54.468
11.845	65.059
11.846	64.113
11.894	56.927
11.894	56.359
11.896	53.144
11.896	52.199
11.934	63.735
11.937	59.007
11.977	65.816
11.983	55.225
12.288	60.142
12.377	58.818
12.597	58.818
12.682	63.735
12.724	67.139
12.731	54.657
12.732	53.901
12.860	61.087
12.862	57.305
12.901	65.816
12.902	64.492
12.902	63.546
12.903	62.790
12.903	62.222
12.905	58.629
12.906	56.170
12.907	55.603
12.908	53.333
12.944	67.139
12.950	57.305
13.168	61.087
13.392	54.090
13.517	66.761
13.656	52.955
13.743	55.414
13.783	62.033
13.786	57.116
13.787	55.981
13.787	55.414
13.827	62.790
13.869	66.005
13.869	65.437
13.870	64.870
13.870	63.735
13.876	53.522
13.916	60.331
13.917	58.061
14.488	61.087
14.705	66.383
14.748	68.085
14.751	61.844
14.843	54.657
14.845	52.388
14.926	64.870
14.926	63.924
14.930	56.738
14.931	55.981
14.969	66.950
14.971	62.979
15.372	54.090
15.413	59.385
15.674	65.059
15.724	52.955
15.765	59.385
15.855	56.359
15.896	60.898
15.897	59.764
15.899	55.225
15.936	67.518
15.937	66.572
15.938	63.924
15.942	58.251
16.779	55.225
16.817	66.005
16.821	59.953
16.906	65.248
16.906	64.303
16.953	59.953
17.037	66.950
17.742	64.681
17.876	62.033
17.876	61.277
17.877	59.953
17.960	69.031
17.961	67.329
18.578	64.303
18.977	59.764
20.121	60.331
20.694	58.251
21.880	62.979
23.817	61.087
24.164	70.165
24.876	55.981
27.154	74.894
27.154	74.137
27.155	71.868
29.931	65.059
30.149	68.652
32.083	73.191
36.310	68.842];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AlHuAlBa2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01445*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4LQLG'; % Cat of Life
metaData.links.id_ITIS = '630273'; % ITIS
metaData.links.id_EoL = '46578439'; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys_kaakan'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_kaakan'; % ADW
metaData.links.id_Taxo = '184494'; % Taxonomicon
metaData.links.id_WoRMS = '218566'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-kaakan'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys_kaakan}}';
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
bibkey = 'AlHuAlBa2002'; type = 'Article'; bib = [ ... 
'author = {M. Al-Husaini and A. Al-Baz and S. Al-Ayoub and S. Safar and Z. Al-Wazan and S. Al-Jazzaf}, ' ... 
'year = {2002}, ' ...
'title = {Age, growth, mortality, and yield-per-recruit for nagroor, \emph{Pomadasys kakaan}, in {K}uwait''s waters}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {59}, ' ...
'pages = {101-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-kaakan.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
