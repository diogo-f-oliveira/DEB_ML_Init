function [data, auxData, metaData, txtData, weights] = mydata_Hyperoglyphe_antarctica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Centrolophidae';
metaData.species    = 'Hyperoglyphe_antarctica'; 
metaData.species_en = 'Bluenose warehou'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE','MASE','MPS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 05];

%% set data
% zero-variate data

data.ab = 18;   units.ab = 'd';   label.ab = 'life span';                 bibkey.ab = 'guess';   
  temp.ab = C2K(11.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 80*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'HornNeil2010';   
  temp.am = C2K(11.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 70.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 140;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Bael1996';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*.075^3';
data.Wwi = 40e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.10, see F`1';

data.Ri  = 1.24e6/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(11.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
3.581	51.127
4.058	49.437
4.220	51.549
5.018	51.338
5.170	45.211
5.181	53.451
5.491	46.690
5.494	49.014
5.656	50.493
5.657	51.127
5.662	54.930
5.981	54.507
6.293	49.014
6.297	52.394
6.454	50.070
6.772	49.225
6.778	53.873
6.930	47.535
6.935	51.549
7.261	56.408
7.411	49.225
7.896	54.085
7.901	57.254
8.045	45.845
8.052	50.704
8.213	51.761
8.222	58.521
8.369	49.225
8.685	47.113
8.695	54.296
8.852	52.606
8.863	60.211
9.166	48.380
9.332	53.239
9.494	54.930
9.656	56.620
9.658	57.676
9.816	56.620
9.823	62.324
9.980	60.000
10.285	48.803
10.286	50.282
10.450	53.239
10.459	60.000
10.460	61.056
10.610	53.451
10.771	54.718
10.776	58.310
11.087	51.549
11.261	62.324
11.408	53.028
11.413	56.831
11.723	50.070
11.734	58.099
11.744	65.493
12.061	63.803
12.209	55.352
12.214	59.155
12.377	61.056
12.528	54.507
12.687	54.085
12.691	57.254
12.705	67.606
12.847	54.507
13.003	51.761
13.014	60.211
13.164	52.606
13.169	56.408
13.337	62.958
13.492	59.366
13.503	67.606
13.655	61.479
13.661	65.915
13.666	70.141
13.815	62.324
14.119	50.493
14.121	52.183
14.126	55.775
14.137	63.803
14.284	54.296
14.289	58.099
14.289	58.521
14.459	66.127
14.618	65.282
14.765	55.563
14.782	68.873
14.930	59.789
14.934	62.958
15.085	56.197
15.101	68.239
15.258	66.549
15.411	61.690
15.412	61.901
15.565	57.254
15.729	60.634
15.736	65.493
15.885	57.465
15.885	57.676
16.040	53.873
16.047	59.577
16.063	71.408
16.200	54.296
16.212	63.592
16.382	70.986
16.690	62.746
16.704	73.099
16.854	66.127
16.857	68.239
17.005	59.577
17.007	60.634
17.011	63.592
17.013	65.282
17.013	65.282
17.323	58.310
17.335	67.394
17.479	55.775
17.488	62.113
17.504	73.944
17.652	65.704
17.817	69.718
17.961	57.887
17.969	64.014
17.977	69.718
17.979	71.408
18.148	78.380
18.289	64.437
18.293	66.972
18.305	75.845
18.443	59.789
18.600	57.676
18.621	73.310
18.764	61.268
18.773	68.028
18.924	61.479
18.925	61.901
18.931	66.338
18.938	71.831
19.074	54.296
19.087	64.014
19.112	82.394
19.246	63.169
19.409	65.493
19.410	66.338
19.419	73.310
19.574	69.930
19.576	71.197
19.879	58.732
19.881	60.211
20.043	62.535
20.051	68.028
20.200	60.211
20.213	70.141
20.387	81.127
20.390	82.817
20.683	62.958
20.688	67.394
20.850	69.085
20.856	73.310
21.013	70.986
21.020	76.479
21.027	81.549
21.337	74.789
21.654	73.310
21.823	80.282
21.991	86.197
22.140	78.380
22.279	62.958
22.605	67.606
22.772	73.521
23.078	63.169
23.242	66.549
23.255	76.056
23.558	63.803
23.574	76.056
23.589	87.042
23.882	67.183
24.032	60.211
24.040	65.915
24.053	75.634
24.058	79.859
24.527	72.042
24.536	78.592
25.012	76.268
25.018	81.338
25.157	65.282
25.160	68.028
25.181	83.873
25.819	82.606
25.984	86.831
26.145	87.887
26.433	64.225
26.436	66.338
26.442	71.197
26.445	73.310
26.929	77.324
26.949	91.901
27.082	72.465
27.101	86.408
27.253	80.493
27.418	84.930
27.719	70.563
27.725	75.423
28.030	64.648
28.361	73.310
28.524	75.634
28.863	90.211
28.998	71.831
29.011	81.972
29.155	70.141
29.179	87.676
29.334	84.718
29.482	75.634
29.793	69.296
29.955	70.986
30.769	82.817
30.775	87.676
30.778	89.789
30.934	86.620
31.066	66.338
31.419	91.268
31.575	88.521
31.741	93.380
31.880	78.169
32.048	84.085
32.671	72.465
32.690	86.197
32.698	92.324
32.833	73.944
32.837	76.901
32.841	80.070
33.332	89.366
33.975	92.535
34.124	83.873
34.126	85.775
34.747	72.465
35.393	78.169
35.879	83.028
35.887	89.155
36.029	75.845
36.031	77.535
36.052	93.380
36.369	91.268
36.505	73.521
36.835	81.127
37.955	83.239
38.108	77.958
38.126	91.690
38.443	90.211
38.595	84.507
39.231	82.394
39.731	98.028
40.978	74.789
41.157	89.577
41.940	77.535
42.891	72.676
43.263	112.394
43.701	81.549
43.859	79.859
48.033	96.761
48.173	81.972
48.667	93.169
50.744	94.437
51.249	113.662
55.854	94.437
56.808	91.268
59.999	89.366
75.961	84.718];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(11.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HornNeil2010';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
3.239	47.494
4.049	36.587
4.211	46.641
4.372	47.497
4.534	48.995
4.534	42.578
5.182	50.708
5.344	52.634
5.344	51.778
5.344	46.217
5.506	49.640
5.506	41.511
5.830	56.057
5.830	42.154
6.154	54.775
6.316	53.064
6.316	49.214
7.126	49.858
7.287	52.425
7.449	50.928
7.449	45.153
7.773	47.293
7.935	60.341
7.935	59.272
8.097	54.138
8.097	56.705
8.097	47.935
8.745	48.793
8.907	54.568
8.907	57.991
8.907	50.718
9.069	62.483
9.231	61.628
9.231	53.072
9.393	60.345
9.555	49.650
9.717	56.496
9.879	55.213
10.040	57.994
10.040	54.999
10.040	48.368
10.202	53.502
10.364	63.770
10.364	57.995
10.688	62.915
10.688	60.776
10.688	50.723
10.688	55.643
10.850	57.354
10.850	50.082
11.174	61.205
11.174	61.205
11.174	54.361
11.174	52.008
11.336	58.639
11.336	55.217
11.498	65.698
11.660	66.768
11.822	63.132
11.822	53.507
12.146	50.941
12.146	52.652
12.308	60.567
12.470	64.204
12.470	67.840
12.470	57.359
12.470	49.016
12.470	58.000
12.632	60.140
12.632	55.862
12.794	65.702
12.794	53.081
13.441	66.987
13.441	62.709
13.441	60.784
13.441	58.003
13.441	54.581
13.765	69.127
13.927	52.229
14.089	57.149
14.251	71.267
14.251	63.994
14.413	55.867
14.737	57.793
14.899	69.985
14.899	58.007
15.061	67.419
15.061	66.136
15.061	53.301
15.223	59.505
15.385	64.853
15.547	63.142
15.547	54.800
15.870	60.362
15.870	56.726
16.032	53.304
16.194	72.770
16.194	63.572
16.356	70.845
16.356	66.353
16.356	56.300
16.518	67.423
16.518	54.589
16.680	63.359
16.680	58.226
16.680	59.081
16.842	62.504
17.004	69.563
17.004	66.355
17.004	52.023
17.328	56.516
17.490	64.859
17.490	60.367
17.652	58.442
17.814	55.234
17.976	72.133
18.138	74.058
18.138	64.219
18.462	61.011
18.462	56.947
18.623	72.562
18.785	67.429
18.785	62.509
18.785	57.803
18.785	59.515
19.109	79.195
19.109	78.125
19.109	75.986
19.109	65.505
19.433	70.425
19.433	73.848
19.433	67.859
19.433	66.575
19.433	60.800
20.081	61.871
20.081	56.310
20.081	56.737
20.405	63.583
20.405	60.588
20.567	72.995
20.729	59.092
21.053	80.483
21.053	74.494
21.215	75.136
21.215	71.500
21.215	69.147
21.215	65.083
21.215	58.238
21.377	67.008
21.700	61.661
22.024	67.866
22.024	67.866
22.186	62.304
22.348	74.070
22.348	66.583
22.672	64.445
22.672	61.236
22.834	81.344
22.834	74.926
22.834	58.242
22.996	74.285
23.158	70.008
23.806	66.159
23.968	81.774
23.968	62.951
24.130	70.438
24.291	67.658
24.453	65.091
24.615	61.669
24.777	87.552
24.939	73.221
24.939	68.087
25.101	77.499
25.101	66.376
25.263	80.281
25.425	70.655
25.425	64.024
25.425	60.174
25.749	74.079
25.749	68.517
25.749	63.383
25.911	59.320
26.073	72.368
26.073	65.523
26.235	67.449
26.235	67.449
26.235	59.962
26.397	74.936
26.883	71.515
27.206	79.858
27.206	64.243
27.368	78.147
27.368	75.366
28.178	72.588
28.340	70.021
28.664	74.300
28.664	60.824
28.988	68.312
29.150	66.387
29.150	60.184
29.474	67.030
29.636	72.592
29.636	63.822
29.636	62.538
29.960	70.026
30.121	77.085
30.121	69.171
30.121	65.106
30.283	70.454
30.931	71.098
31.093	82.007
31.093	64.681
31.741	79.014
31.741	72.170
31.741	65.325
31.741	60.833
32.065	77.090
32.227	77.518
32.227	73.026
32.227	68.748
33.360	86.719
33.360	72.816
33.684	69.822
33.684	68.538
33.846	67.897
33.846	76.239
34.494	85.439
34.818	75.386
34.980	74.531
35.142	78.810
35.304	66.190
35.466	70.896
35.628	64.479
36.275	68.759
36.761	67.691
36.923	67.691
37.085	65.553
37.247	72.826
37.733	70.688
37.895	68.977
38.057	71.545
38.219	76.251
38.381	73.471
38.381	64.915
39.028	74.328
39.028	63.633
40.486	71.979
40.486	72.193
40.486	70.696
42.105	69.630
42.429	71.343
42.915	70.702
43.887	74.555
45.020	67.285
45.668	84.613
48.907	69.435
51.498	87.196
52.794	80.354
60.243	92.139
60.567	66.899
71.093	76.339
71.255	73.345];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(11.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HornNeil2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assume to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NQPY'; % Cat of Life
metaData.links.id_ITIS = '172514'; % ITIS
metaData.links.id_EoL = '46577419'; % Ency of Life
metaData.links.id_Wiki = 'Hyperoglyphe_antarctica'; % Wikipedia
metaData.links.id_ADW = 'Hyperoglyphe_antarctica'; % ADW
metaData.links.id_Taxo = '177016'; % Taxonomicon
metaData.links.id_WoRMS = '219737'; % WoRMS
metaData.links.id_fishbase = 'Hyperoglyphe-antarctica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyperoglyphe_antarctica}}';
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
bibkey = 'HornNeil2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2010.02787.x}, ' ...
'author = {P. L. Horn and H. L. Neil and L. J. Paul and P. Marriott}, ' ... 
'year = {2010}, ' ...
'title = {Age validation and growth of bluenose \emph{Hyperoglyphe antarctica} using the bomb chronometer method of radiocarbon ageing}, ' ...
'journal = {Fish Biology}, ' ...
'volume = {77(7)}, ' ...
'pages = {1552–1563}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bael1996'; type = 'Article'; bib = [ ... 
'author = {Pascale Baelde}, ' ... 
'year = {1996}, ' ...
'title = {Biology and dynamics of the reproduction of blue-eye trevalla, \emph{Hyperoglyphe antarctica} {C}entrolophidae), off {T}asmania, southern {A}ustralia}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {94}, ' ...
'pages = {199-211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hyperoglyphe-antarctica.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
