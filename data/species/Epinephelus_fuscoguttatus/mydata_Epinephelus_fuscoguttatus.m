  function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_fuscoguttatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_fuscoguttatus'; 
metaData.species_en = 'Brown-marbled grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 27];

%% set data
% zero-variate data
data.ab = 6; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 45*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'MaplCurr2009';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 48;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 120;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.49e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 1.3e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01047*Lp^3.03, see F1';
data.Wwi = 20887;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.03, see F1; max reported weight 11 kg';

data.Ri  = 3287515/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(28.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.706	43.235
0.909	27.515
1.021	29.480
1.023	31.664
1.572	30.793
1.807	45.204
1.899	28.829
1.903	32.759
1.909	38.218
1.915	43.021
2.011	30.358
2.014	33.633
2.016	34.943
2.017	36.253
2.018	36.690
2.128	37.564
2.241	40.184
2.568	37.347
2.575	43.461
2.676	35.601
2.791	40.624
2.792	41.715
2.796	45.427
2.905	44.336
2.907	46.301
3.003	32.983
3.004	34.074
3.009	39.096
3.019	47.830
3.118	38.223
3.451	41.063
3.679	48.488
3.776	36.698
3.779	39.973
3.782	41.938
3.783	43.030
3.791	50.890
3.793	51.982
3.884	35.170
3.888	38.445
3.906	55.257
3.992	32.987
3.995	35.825
4.005	44.777
4.007	46.961
4.105	36.044
4.108	39.319
4.116	46.088
4.764	35.610
4.872	34.519
4.896	56.135
4.994	45.218
5.010	59.629
5.096	38.014
5.099	41.070
5.102	43.035
5.102	43.909
5.103	44.345
5.106	46.747
5.107	48.057
5.109	50.022
5.115	55.044
5.117	57.228
5.208	39.542
5.208	39.979
5.210	42.162
5.219	49.586
5.221	51.551
5.222	52.861
5.443	53.954
5.553	54.173
5.665	55.702
5.670	60.723
5.770	51.554
5.773	53.737
5.775	56.357
5.874	46.096
5.877	48.279
5.884	55.484
5.887	57.449
5.976	39.109
5.980	42.603
5.985	46.969
5.988	49.371
5.989	50.681
5.992	53.301
6.095	47.407
6.098	49.808
6.108	58.542
6.222	62.473
6.308	40.857
6.336	65.967
6.644	46.536
6.650	52.212
6.660	61.164
6.761	52.868
6.872	54.615
6.970	43.480
6.974	47.410
6.978	50.467
6.982	54.179
6.991	62.258
7.082	45.664
7.085	48.284
7.095	56.800
7.196	49.158
7.206	57.892
7.319	60.949
7.655	66.627
7.975	58.113
7.979	61.389
7.983	64.882
7.987	68.812
7.989	70.341
8.078	51.564
8.080	53.092
8.080	53.747
8.087	59.642
8.191	54.621
8.192	55.713
8.304	57.460
8.843	48.074
8.867	69.471
8.961	55.279
8.966	60.083
8.968	61.393
8.969	62.703
8.971	64.013
8.975	67.725
9.067	51.786
9.072	56.590
9.080	63.140
9.082	65.105
9.083	66.197
9.198	71.001
9.839	53.755
9.956	60.524
9.958	62.052
9.959	63.581
9.962	65.982
10.061	56.157
10.175	60.088
10.184	68.385
10.282	57.687
10.290	64.455
10.303	76.028
10.627	70.789
10.837	62.493
10.848	71.881
10.943	59.218
10.960	74.502
11.064	68.607
11.168	63.368
11.171	66.643
11.720	66.208
11.826	62.497
11.933	59.877
12.164	69.485
12.817	64.248
13.149	66.215
13.151	67.743
13.161	77.568
13.703	70.802
14.030	68.184
14.034	71.895
14.133	61.852
14.138	66.001
14.682	61.636
15.024	72.336
15.132	70.372
15.140	78.014
15.238	67.315
16.011	70.812
16.018	77.144
16.997	68.196
18.211	73.005
18.865	67.986
20.081	74.760
20.954	68.650
21.836	71.274
21.851	85.030
23.048	74.336
23.053	78.922
24.264	80.455
25.132	70.852
25.145	82.424
25.257	84.826
25.913	81.554
26.020	78.716
26.129	77.843
26.135	83.302
27.011	80.467
27.014	83.306
27.016	84.834
27.021	90.074
27.217	68.459
28.004	84.620
28.108	78.725
28.117	87.241
29.101	82.441
29.972	74.803
29.982	84.192
30.087	79.607
30.093	85.284
30.094	86.594
30.196	78.734
30.963	77.428
30.972	85.070
31.076	79.830
31.080	83.323
32.173	77.651
32.947	82.677
33.055	80.712
33.936	82.244
33.937	83.554
33.938	84.646
34.044	80.935
34.816	83.121
34.933	89.454
35.038	84.869
36.018	77.013
36.028	86.184
36.794	83.348
37.018	87.061
37.895	84.882
38.000	80.734
38.123	92.743
38.889	89.253
40.200	82.927
40.324	95.154
40.973	85.768
42.072	85.773]; 
data.tL(:,1) = 365 * (0.5+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
23.299	249.423
24.840	290.993
27.262	332.564
28.582	374.134
30.120	540.416
31.661	581.986
32.542	581.986
33.417	831.409
34.081	706.697
34.739	831.409
35.400	789.838
35.617	956.120
36.936	1039.261
37.600	914.550
38.035	1163.972
38.479	997.691
39.353	1288.684
41.116	1247.113
41.553	1413.395
42.209	1579.677
42.870	1579.677
42.879	1205.543
43.754	1454.965
44.417	1371.824
45.060	2120.092
45.064	1953.811
45.069	1745.958
45.519	1330.254
45.737	1454.965
45.941	2120.092
47.039	2244.804
47.269	1829.099
47.486	1995.381
47.492	1745.958
47.921	2203.233
48.357	2369.515
49.235	2494.226
50.120	2369.515
50.335	2577.367
50.342	2286.374
50.545	2993.072
51.211	2785.219
51.646	2993.072
52.098	2535.797
52.745	3076.212
52.984	2327.945
53.174	3575.058
53.197	2618.938
53.851	2909.931
54.283	3242.494
54.951	2951.501
55.164	3242.494
55.587	3949.192
56.043	3325.635
56.716	2826.790
56.921	3450.346
57.125	4115.473
57.579	3575.058
58.014	3782.910
58.665	4198.614
59.320	4448.037
59.750	4863.741
59.995	3866.051
59.998	3741.339
60.191	4863.741
60.847	5030.023
60.861	4489.607
61.738	4655.889
61.948	5071.594
62.377	5528.868
62.409	4240.185
62.846	4364.896
63.260	5445.727
63.286	4406.467
63.486	5196.305
64.123	6193.995
65.015	5736.721
65.230	5944.573
65.693	5030.023
65.885	6193.995
65.919	4822.171
66.125	5404.157
66.543	6318.707
67.001	5612.009
67.008	5321.016
67.013	5113.164
67.614	7565.820
67.853	6775.982
67.869	6110.855
68.314	5944.573
68.317	5819.861
68.950	6942.263
68.965	6360.277
69.201	5695.150
69.825	7191.686
70.290	6193.995
70.290	6193.995
70.516	5986.143
70.931	7025.404
71.155	6859.122
71.391	6235.566
71.576	7648.961
71.806	7274.827
72.907	7274.827
74.234	7066.975
75.297	8605.081
76.407	8272.517
76.619	8605.081
76.652	7233.256
77.038	9478.060
77.461	10184.758
77.925	9228.637
77.934	8854.503
78.125	10060.046
78.157	8771.363
78.160	8646.651
79.672	9852.194
80.533	10683.603
80.574	9020.785
81.238	8854.503
81.610	11681.293
81.641	10392.610
81.647	10143.187
82.138	8106.236
82.287	11016.166
82.951	10891.455
83.157	11473.441
83.199	9727.483
83.803	12055.427
84.220	13011.547
84.255	11598.152
84.265	11182.448
84.267	11099.307
84.276	10725.173
84.286	10309.469
84.512	10101.617
84.633	14133.949
84.721	10558.891
85.131	11806.005
85.141	11390.300
85.620	9810.624
86.439	12346.420
86.891	11889.145
88.568	15381.062
88.852	12762.125
89.678	15006.928
92.269	17127.021]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = weights.ab * 0;
weights.Wwp = weights.Wwp * 0;
weights.Wwi = weights.Wwi * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G5NL'; % Cat of Life
metaData.links.id_ITIS = '167711'; % ITIS
metaData.links.id_EoL = '46579635'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_fuscoguttatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_fuscoguttatus'; % ADW
metaData.links.id_Taxo = '105887'; % Taxonomicon
metaData.links.id_WoRMS = '218218'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-fuscoguttatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Epinephelus_fuscoguttatus}}';  
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
bibkey = 'MaplCurr2009'; type = 'techreport'; bib = [ ... 
'howpublished = {https://rrrc.org.au/wp-content/uploads/2014/06/483-JCU-Mapleston-A-et-al-2009-Comparative-biology-of-GBR-serranid-species.pdf}, ' ...
'author = {Mapleston, A. and Currey, L.M.and Williams, A.J. and Pears, R. and Simpfendorfer, C.A. and Penny, A.L. and Tobin, A. and Welch, D}, ' ... 
'year = {2009}, ' ...
'title = {Comparative biology of key inter-reefal serranid species on the Great Barrier Reef.}, ' ...
'institution = {Reef and Rainforest Research Centre Limited, Cairns}, ' ...
'volume = {Project Milestone Report to the Marine and Tropical Sciences Research Facility}, ' ...
'pages = {55pp.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Epinephelus-fuscoguttatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

