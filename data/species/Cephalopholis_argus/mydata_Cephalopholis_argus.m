  function [data, auxData, metaData, txtData, weights] = mydata_Cephalopholis_argus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Cephalopholis_argus'; 
metaData.species_en = 'Peacock hind'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 28];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'MaplCurr2009';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 22;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.49e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 148;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^3.04, see F1';
data.Wwi = 3130;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.04, see F1';

data.Ri  = 6.9e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Epinephelus_fuscoguttatus: 3287515*3557/17000';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
2.731	22.331
3.013	23.008
3.013	31.805
3.107	25.150
3.107	27.857
3.107	28.534
3.296	20.639
3.955	23.346
4.049	27.406
4.049	28.195
4.143	24.812
4.143	33.158
4.143	33.496
4.237	22.669
4.237	25.150
4.331	29.887
4.331	30.677
4.896	26.165
4.896	27.180
4.991	25.714
5.085	35.075
5.085	26.955
5.179	37.105
5.179	28.308
5.461	32.256
6.026	30.226
6.026	33.158
6.026	33.609
6.026	23.008
6.121	28.759
6.121	31.579
6.121	32.256
6.121	34.286
6.215	39.023
6.215	27.406
6.780	31.579
6.874	35.188
6.968	33.271
6.968	31.241
7.062	33.722
7.062	33.496
7.156	38.120
7.156	37.669
7.156	34.511
7.156	33.947
7.345	28.083
7.815	26.955
8.004	32.368
8.004	38.233
8.098	37.669
8.192	24.812
8.192	29.549
8.192	31.692
8.192	35.075
8.192	37.331
8.286	30.451
8.286	34.624
8.380	33.609
8.663	29.549
8.757	30.451
8.945	31.692
9.040	32.368
9.040	32.932
9.040	35.977
9.040	39.023
9.134	35.188
9.134	37.556
9.322	35.639
9.981	36.654
9.981	30.451
10.075	33.947
10.075	34.737
10.075	38.120
10.169	31.015
10.169	42.406
10.358	31.917
10.358	39.361
10.923	38.459
11.017	37.782
11.017	33.271
11.017	32.707
11.111	40.150
11.111	35.301
11.111	32.932
11.111	31.917
11.676	30.789
11.770	32.030
11.864	28.985
11.864	29.887
11.864	33.947
11.959	39.474
12.053	28.308
12.147	27.744
12.147	36.654
12.147	41.165
12.147	40.376
12.241	34.850
12.241	37.331
12.900	32.594
12.900	42.068
12.994	25.150
12.994	30.000
12.994	34.398
12.994	34.737
12.994	35.414
12.994	38.008
12.994	42.857
13.089	37.218
13.089	40.489
13.183	30.789
13.183	33.609
13.277	38.797
13.842	36.429
14.124	37.669
14.124	38.120
14.124	38.910
14.124	35.075
14.124	34.624
14.124	34.060
14.124	32.820
14.124	31.353
14.218	39.586
14.313	37.218
14.783	39.361
14.783	38.008
14.972	29.662
14.972	35.075
14.972	38.571
15.066	32.030
15.066	31.805
15.160	36.090
15.160	37.444
15.160	37.105
15.254	32.820
15.819	43.759
15.819	32.143
16.008	40.602
16.008	38.346
16.102	37.331
16.102	38.120
16.196	36.203
16.196	38.797
16.196	39.023
16.384	35.752
16.478	35.414
16.855	42.857
16.949	42.180
16.949	36.429
16.949	32.368
17.043	40.602
17.043	38.459
17.043	30.902
17.137	39.699
17.137	35.977
17.326	33.045
17.985	32.594
17.985	40.038
17.985	45.000
18.079	42.632
18.173	36.090
18.173	41.729
18.173	43.647
18.832	37.444
18.927	39.925
19.021	43.647
19.021	39.361
19.868	40.602
20.056	35.977
20.056	34.398
20.339	46.466
20.998	42.632
20.998	38.008
21.092	41.278
21.092	41.842
22.034	39.699
22.034	42.180
22.316	40.376
22.316	40.714
23.070	38.346
23.070	38.797
23.070	40.038
23.164	32.594
23.823	38.797
23.917	40.263
24.011	48.496
24.011	40.940
24.105	45.000
25.047	37.331
25.047	41.504
25.235	44.098
25.235	37.782
25.235	41.955
25.989	40.038
26.083	40.940
26.083	41.617
26.177	43.985
26.930	38.008
26.930	40.940
27.024	42.293
27.024	42.068
27.966	46.466
28.060	41.391
28.060	43.083
28.154	42.406
29.944	43.872
30.038	47.707
31.168	39.023
33.898	46.353
35.028	44.549
35.028	48.835
36.064	40.714
39.077	48.609
40.113	47.256];
data.tL(:,1) = 365 * (0.5+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MaplCurr2009'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
18.234	99.087
19.486	157.451
19.575	145.729
20.021	145.663
20.557	151.440
20.647	174.846
21.095	204.054
21.540	186.425
21.718	151.270
21.988	215.633
22.256	221.449
22.523	203.845
22.792	221.370
23.150	244.737
23.508	291.523
23.685	232.949
23.866	291.471
24.221	244.580
24.577	215.254
24.937	285.459
25.474	332.219
25.739	256.068
25.741	302.906
26.008	285.302
26.099	332.127
26.457	361.349
26.458	367.204
26.544	296.933
27.173	408.082
27.351	372.928
27.706	314.328
27.709	402.149
27.796	343.589
27.887	390.414
28.246	437.200
28.247	472.328
28.420	325.933
28.423	396.190
28.694	478.118
28.961	448.805
28.962	478.078
28.963	530.771
29.047	360.970
29.313	314.093
29.315	360.931
29.316	390.205
29.584	419.439
29.586	460.423
29.676	495.538
29.855	483.802
29.941	413.532
29.946	548.192
30.211	460.331
30.306	630.106
30.476	390.035
30.481	530.549
30.565	378.312
30.748	495.381
30.748	507.091
30.749	512.946
30.833	378.273
30.924	436.807
30.931	618.305
30.932	659.289
31.013	425.085
31.105	483.619
31.110	641.698
31.198	588.992
31.462	477.712
31.549	413.297
31.549	436.716
31.643	559.653
31.646	629.910
31.731	512.802
31.997	483.489
32.001	594.729
32.178	536.156
32.269	582.981
32.449	629.793
32.534	500.975
32.630	700.024
32.713	518.513
32.714	559.496
32.983	577.021
33.071	541.880
33.073	594.573
33.255	682.368
33.430	588.666
33.432	641.358
33.516	512.540
33.518	547.669
33.611	670.606
33.877	606.165
33.883	787.662
33.965	571.023
33.970	705.683
34.239	758.336
34.412	594.377
34.504	658.766
34.506	717.314
34.861	658.714
34.947	570.879
34.949	623.572
34.952	699.684
35.045	805.057
35.221	734.773
35.313	822.582
35.578	752.285
35.673	892.787
35.755	682.002
35.847	758.101
35.935	722.959
35.938	816.636
35.940	881.038
36.022	658.544
36.116	793.190
36.381	722.894
36.568	957.059
36.831	810.650
36.832	839.924
37.013	916.010
37.023	1191.184
37.105	986.254
37.110	1120.914
37.184	716.922
37.190	863.291
37.365	775.443
37.459	892.526
37.465	1074.023
37.544	792.981
37.642	1027.159
37.645	1114.981
37.729	956.889
37.998	991.978
38.257	763.603
38.269	1073.906
38.272	1161.727
38.438	810.415
38.442	921.656
38.444	974.349
38.621	933.339
38.623	991.887
38.717	1126.533
38.801	980.151
38.976	886.449
38.985	1120.639
39.078	1243.577
39.239	740.040
39.336	950.799
39.423	903.948
39.609	1114.693
39.612	1202.515
39.697	1073.697
39.968	1155.624
40.141	997.519
40.148	1184.872
40.328	1231.684
40.329	1278.522
40.675	950.603
40.682	1137.955
40.684	1196.503
40.768	1050.121
40.856	1020.834
40.859	1108.655
41.131	1231.566
41.230	1506.728
41.308	1178.847
41.580	1307.613
41.582	1336.887
41.585	1442.273
41.592	1635.480
41.597	1770.140
41.939	1354.399
42.026	1278.274
42.120	1418.775
42.203	1237.264
42.489	1752.445
42.566	1407.000
42.651	1295.747
43.097	1260.553
43.368	1360.045
43.818	1471.220
43.991	1301.405
44.088	1518.019
44.184	1717.068
44.272	1658.507
44.705	1289.591
44.990	1763.789
45.966	1593.856
46.514	1933.355
47.040	1669.812
48.477	1903.793]; 
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'MaplCurr2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = weights.ab * 0;

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
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'SDMD'; % Cat of Life
metaData.links.id_ITIS = '167752'; % ITIS
metaData.links.id_EoL = '46579769'; % Ency of Life
metaData.links.id_Wiki = 'Cephalopholis_argus'; % Wikipedia
metaData.links.id_ADW = 'Cephalopholis_argus'; % ADW
metaData.links.id_Taxo = '45067'; % Taxonomicon
metaData.links.id_WoRMS = '218174'; % WoRMS
metaData.links.id_fishbase = 'Cephalopholis_argus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cephalopholis_argus}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Cephalopholis-argus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

