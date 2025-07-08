function [data, auxData, metaData, txtData, weights] = mydata_Mimachlamys_asperrima
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pectinida'; 
metaData.family     = 'Pectinidae';
metaData.species    = 'Mimachlamys_asperrima'; 
metaData.species_en = 'Austral scallop'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MISE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 21]; 

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on 2 d for Pecten maximus at 18 C';
data.tj = 20;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'guess';
  temp.tj = C2K(14);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'based on Aequipecten_opercularis';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Aequipecten_opercularis';

data.Lp  = 5.75;   units.Lp  = 'cm';  label.Lp  = 'shell height at puberty';   bibkey.Lp  = 'Zach1995';
data.Li  = 11;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Zach1995';
  comment.Li = 'marlin gives 11 cm';

data.Wwb = 1.64e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'marlin';
  comment.Wwb = 'Based on 68 mum egg diameter for Aequipecten_opercularis: pi/6*0.0068^3';

data.GSI = 0.35;    units.GSI = '-';    label.GSI = 'gonadic somatic index'; bibkey.GSI = 'Zach1995';
  temp.GSI = C2K(14);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
   
% uni-variate data
% length-length
data.LL135 = [ ... % initial shell height (cm), shell height (cm)
4.364	4.418
4.907	5.101
5.017	5.389
5.067	5.238
5.264	5.859
5.437	5.587
5.559	6.238
5.621	6.087
5.671	6.132
5.695	6.012
5.757	6.299
5.770	5.936
5.819	6.178
5.831	5.936
5.881	6.073
5.881	5.785
5.954	6.345
5.955	6.133
5.955	6.012
6.090	6.694
6.115	6.240
6.139	6.815
6.152	6.119
6.164	6.528
6.189	6.437
6.225	6.755
6.225	6.679
6.251	6.361
6.275	6.528
6.287	6.770
6.361	6.846
6.361	6.604
6.374	6.725
6.386	6.392
6.435	7.013
6.460	6.786
6.460	6.650
6.484	6.892
6.509	6.937
6.559	6.771
6.595	7.119
6.595	7.043
6.595	6.938
6.620	6.832
6.694	7.331
6.694	7.059
6.694	6.832
6.706	7.286
6.731	7.180
6.768	7.105
6.781	6.984
6.805	7.256
6.891	7.256
6.892	7.105
6.892	6.939
6.965	7.196
7.027	7.620
7.028	6.440
7.113	7.408
7.224	7.938
7.298	7.757
7.298	7.697
7.298	7.621
7.348	7.515
7.618	8.257];
units.LL135   = {'cm', 'cm'};  label.LL135 = {'shell height', 'shell height after 135 d'};  
temp.LL135    = C2K(8);  units.temp.LL135 = 'K'; label.temp.LL135 = 'temperature';
bibkey.LL135 = 'Zach1995';
comment.LL135 = '16/6/92 to 2/11/92 (139 days); temperature between 8 and 21 C';
%
data.LL79 = [ ... % initial shell height (cm), shell height (cm)
1.638	2.774
1.737	3.017
1.823	2.699
1.909	3.032
1.958	3.290
1.996	2.730
2.059	2.277
2.070	3.320
2.144	3.321
2.180	3.442
2.181	3.094
2.205	3.548
2.230	3.624
2.242	3.442
2.329	3.231
2.329	3.064
2.340	3.927
2.365	3.624
2.366	3.125
2.378	3.639
2.440	3.519
2.501	3.625
2.502	3.262
2.514	3.110
2.550	3.791
2.551	3.519
2.588	3.610
2.637	3.323
2.649	3.837
2.661	3.973
2.675	2.778
2.687	3.323
2.699	3.565
2.723	3.701
2.748	3.943
2.798	3.626
2.810	3.399
2.884	3.535
2.908	3.732
2.921	3.430
2.970	3.808
2.970	3.732
2.983	3.339
2.984	3.021
2.994	4.095
2.995	3.702
3.020	3.506
3.031	4.065
3.032	3.808
3.106	3.899
3.118	3.672
3.266	3.945
3.315	4.293
3.316	3.749
3.340	4.384
3.389	4.173
3.451	4.354
3.574	4.294
3.612	4.204
3.636	4.400
3.697	4.627
3.771	4.688];
units.LL79   = {'cm', 'cm'};  label.LL79 = {'shell height', 'shell height after 79 d'};  
temp.LL79    = C2K(18);  units.temp.LL79 = 'K'; label.temp.LL79 = 'temperature';
bibkey.LL79 = 'Zach1995';
comment.LL79 = '16/8/91to23/11/91 (79 days); temperature between 8 and 21 C';

% length - weight
data.LWw = [ ... % somatic wet weight (g), shell height (cm)
0.503	2.493
0.694	2.435
0.985	2.869
1.367	2.724
1.947	3.275
1.948	3.391
2.332	3.506
2.715	3.477
3.005	3.796
5.022	4.433
5.600	4.780
5.889	4.954
7.231	5.098
8.672	5.562
11.736	5.618
14.047	6.893
14.712	6.342
14.719	7.037
15.286	6.313
15.865	6.747
16.341	6.486
16.919	6.805
17.106	6.370
17.109	6.660
17.686	6.891
17.879	7.094
18.455	7.239
18.548	6.949
18.650	7.587
18.936	7.499
19.409	6.862
19.896	7.702
20.082	7.122
20.469	7.499
20.470	7.673
20.562	7.209
21.229	6.919
21.320	6.455
21.418	6.687
21.430	7.904
21.524	7.730
21.530	8.368
21.616	7.324
23.058	7.962
23.062	8.309
23.628	7.411
23.912	7.063
24.016	7.932
24.101	6.860
24.211	8.309
24.493	7.787
24.680	7.323
24.683	7.642
24.963	6.859
24.966	7.207
25.262	8.048
25.350	7.265
25.353	7.526
25.547	7.787
25.644	8.018
25.933	8.163
26.118	7.439
26.216	7.699
26.223	8.453
26.409	7.902
26.500	7.380
26.502	7.525
26.796	8.308
26.889	7.960
27.174	7.728
27.186	9.003
27.359	7.090
27.467	8.308
27.552	7.177
27.658	8.249
27.752	8.104
27.936	7.293
27.940	7.786
27.943	8.017
28.143	8.887
28.235	8.568
28.616	8.336
28.702	7.321
28.714	8.568
28.894	7.321
28.995	7.872
29.084	7.176
29.183	7.553
29.185	7.756
29.285	8.162
29.285	8.220
29.293	9.060
29.378	7.901
29.860	8.278
29.952	7.814
29.962	8.886
30.336	7.987
30.430	7.814
30.533	8.567
30.915	8.364
30.917	8.654
31.101	7.813
31.194	7.494
31.301	8.712
31.400	9.060
31.402	9.291
31.773	7.958
31.869	8.074
31.872	8.364
32.065	8.537
32.159	8.277
32.262	9.059
32.264	9.320
32.436	7.262
32.441	7.784
32.729	7.842
32.832	8.624
33.018	8.073
33.207	7.783
33.216	8.682
33.218	8.943
33.309	8.392
33.319	9.465
33.321	9.696
33.508	9.233
33.596	8.334
33.695	8.711
33.781	7.667
33.790	8.682
34.075	8.421
34.082	9.116
34.166	7.899
34.362	8.421
34.558	8.855
34.740	7.899
34.757	9.609
34.844	8.710
34.937	8.449
35.031	8.246
35.042	9.435
35.219	7.898
35.221	8.043
35.325	8.971
35.418	8.652
35.515	8.768
35.608	8.507
35.703	8.449
35.796	8.101
35.812	9.753
36.084	8.246
36.091	8.884
36.177	7.956
36.281	8.739
36.373	8.333
36.383	9.463
36.475	9.028
36.759	8.680
37.037	7.695
37.043	8.304
37.048	8.825
37.328	8.130
37.428	8.564
37.529	9.057
37.532	9.434
37.713	8.361
37.909	8.738
37.999	8.187
38.010	9.289
38.293	8.883
38.294	9.028
38.571	7.955
38.865	8.622
39.058	8.795
39.062	9.172
39.243	8.042
39.437	8.390
39.441	8.766
39.451	9.810
39.536	8.679
39.731	9.056
39.820	8.331
39.830	9.375
40.012	8.418
40.027	9.925
40.117	9.317
40.217	9.809
40.405	9.462
40.589	8.650
40.592	8.998
40.681	8.302
40.686	8.766
40.871	8.070
40.971	8.592
40.975	8.940
40.980	9.490
41.158	8.070
41.162	8.476
41.455	9.084
41.541	8.070
41.548	8.765
41.558	9.809
41.641	8.534
41.644	8.794
41.830	8.244
41.933	9.026
42.118	8.301
42.128	9.403
42.408	8.562
42.412	8.997
42.601	8.765
42.691	8.156
42.702	9.287
42.785	7.982
42.792	8.707
42.891	9.084
43.081	8.939
43.172	8.388
43.367	8.736
43.373	9.344
43.472	9.692
43.560	8.881
43.648	8.069
43.937	8.243
43.941	8.677
43.946	9.170
44.231	8.967
44.428	9.576
44.708	8.764
44.714	9.402
44.806	9.025
44.910	9.837
44.994	8.648
45.287	9.286
45.289	9.460
45.376	8.503
45.571	8.880
45.579	9.720
45.668	9.083
45.851	8.126
45.957	9.198
46.143	8.677
46.334	8.619
46.338	8.966
46.342	9.459
46.427	8.329
46.522	8.242
46.531	9.169
46.720	8.937
46.821	9.459
47.099	8.502
47.197	8.705
47.201	9.082
47.489	9.256
47.576	8.299
47.676	8.763
47.875	9.516
48.444	8.965
48.641	9.516
48.644	9.835
48.824	8.646
48.835	9.719
48.923	8.965
48.926	9.255
49.012	8.241
49.027	9.777
49.301	8.385
49.789	9.429
49.985	9.834
50.261	8.646
50.264	8.965
50.266	9.226
50.376	10.646
50.552	9.052
50.641	8.385
50.751	9.863
50.836	8.733
51.033	9.312
51.598	8.355
51.603	8.848
51.799	9.283
51.983	8.500
52.182	9.341
52.187	9.776
52.274	8.848
52.659	9.109
52.748	8.355
53.420	8.558
53.427	9.311
53.521	9.166
53.806	8.876
54.094	8.992
54.287	9.108
55.052	9.021
55.055	9.311
55.825	9.687
55.913	8.933
56.104	8.846
56.401	9.919
56.580	8.527
57.159	9.049
57.161	9.252
57.347	8.614
57.732	8.846
58.020	8.962
58.118	9.135
58.318	10.092
58.984	9.570
59.935	8.932
60.223	9.048
60.225	9.164
60.514	9.424
60.995	9.569
61.184	9.366
61.278	9.134
61.562	8.873
61.572	9.830
61.854	9.279
62.143	9.482
62.716	9.365
63.095	8.959
63.195	9.365
64.734	10.118
67.600	9.421];
data.LWw = data.LWw(:,[2 1]); % reverse columns to LWw
units.LWw   = {'cm', 'g'};  label.LWw = {'shell height', 'tissue wet weight'};  
bibkey.LWw = 'Zach1995';
    
%% set weights for all real data
weights = setweights(data, []);
weights.LL135 = 5 * weights.LL135;
weights.LL79 = 5 * weights.LL79;
weights.GSI = 5 * weights.GSI;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Incidental hermaphroditic';
metaData.bibkey.F1 = 'Zach1995';
F2 = 'Sports jet propulsion swimming';
metaData.bibkey.F2 = 'Zach1995';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '43DZZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46468066'; % Ency of Life
metaData.links.id_Wiki = 'Mimachlamys'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3967468'; % Taxonomicon
metaData.links.id_WoRMS = '393724'; % WoRMS
metaData.links.id_molluscabase = '393724'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mimachlamys}}';
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
bibkey = 'Zach1995'; type = 'phdthesis'; bib = [ ... 
'author = {William F. Zacharin}, ' ... 
'year = {1995}, ' ...
'title = {Growth, reproduction and recruitment of the doughboy scallop, \emph{Mimachlamys asperrima} (Lamarck) in the D''Entrecasteaux Channel, Tasmania, Australia}, ' ...
'school = {University of Tasmania, Hobart}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6178}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

