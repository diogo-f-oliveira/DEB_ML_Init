function [data, auxData, metaData, txtData, weights] = mydata_Platycephalus_bassensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Platycephalidae';
metaData.species    = 'Platycephalus_bassensis'; 
metaData.species_en = 'Southern sand flathead'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 04];

%% set data
% zero-variate data

data.ab = 8.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(17.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Jord1998';   
  temp.am = C2K(17.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 23.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Jord1998'; 
data.Li  = 51;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Jord1998';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.5 mm: pi/6*0.05^3'; 
data.Wwi = 1552; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F1';

data.GSI  = 0.06;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(17.1);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on typical value for Platycephalus';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 0  8.84  8.84
 1 12.99 13.23
 2 19.38 18.68
 3 25.27 23.41
 4 28.96 25.52
 5 31.02 27.82
 6 32.54 28.12
 7 33.71 29.25
 8 35.11 31.40
 9 36.45 32.69
10 34.76 32.69
11 38.29 35.26
12 41.40 37.94
13 37.29 35.35
14 46.05 34.70
15 44.80 NaN
16 36.80 46.10
17 NaN   37.75];
data.tL_fm(:,1) = 365 * (0.6+data.tL_fm(:,1));  % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length', 'female'};  
temp.tL_fm    = C2K(17.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Jord1998'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
1.987	0.112
2.423	1.091
2.811	4.676
3.586	5.639
4.313	7.605
4.410	10.203
4.847	15.389
5.089	15.377
5.525	17.960
6.107	17.932
6.494	15.311
6.882	15.293
7.414	10.061
7.802	10.043
8.384	10.015
8.723	17.808
9.014	15.192
9.499	22.978
9.983	17.749
10.420	20.331
10.855	9.898
11.534	22.881
12.018	12.446
12.261	20.244
12.600	20.228
12.989	30.622
13.376	25.397
13.957	22.767
14.297	22.751
14.976	30.528
15.460	33.108
15.847	25.280
16.624	35.656
17.108	35.633
17.592	30.404
17.835	35.599
18.078	43.396
18.417	45.983
18.562	38.167
19.193	51.152
19.532	40.724
19.727	56.333
20.114	48.506
20.357	64.112
20.937	43.261
20.939	69.291
21.376	82.285
21.471	56.251
22.151	77.043
22.731	58.794
22.782	90.028
23.071	66.587
23.220	105.626
23.558	95.197
24.092	102.981
24.235	74.341
24.627	134.192
24.672	95.145
25.304	118.542
25.739	105.506
25.741	131.537
26.177	128.913
26.422	152.329
26.757	105.458
26.906	144.497
26.956	167.922
27.340	121.049
27.393	180.916
27.683	170.490
27.777	136.646
27.874	139.245
28.362	175.664
28.504	131.406
28.796	147.010
28.800	196.468
29.137	173.024
29.189	212.068
29.330	165.206
29.424	133.965
29.569	118.340
29.573	173.004
29.624	209.444
29.820	227.656
30.008	159.968
30.059	188.599
30.159	225.037
30.398	193.789
30.445	165.153
30.546	219.812
30.645	240.632
30.688	178.157
31.028	193.759
31.178	248.416
31.370	222.377
31.519	264.018
31.708	204.139
31.760	248.388
31.761	266.610
32.049	235.360
32.144	204.119
32.341	250.964
32.387	214.519
32.392	274.389
32.491	305.621
32.826	250.941
32.921	224.906
33.015	196.268
33.211	219.686
33.264	274.348
33.266	300.378
33.456	253.514
33.461	318.590
33.701	282.136
33.843	237.878
33.936	198.828
33.994	310.756
34.086	256.087
34.093	339.384
34.132	219.643
34.330	276.900
34.429	295.117
34.433	347.177
34.618	240.444
34.675	344.563
34.815	274.274
34.818	321.129
35.016	362.768
35.104	256.039
35.108	302.894
35.148	196.167
35.306	362.754
35.397	282.056
35.401	328.910
35.441	232.596
35.696	383.560
35.740	334.100
35.976	258.601
35.980	305.455
36.088	446.014
36.181	386.140
36.323	354.897
36.378	425.176
36.417	318.450
36.714	388.718
36.853	313.223
36.899	276.779
37.055	414.732
37.245	362.662
37.251	438.150
37.339	326.215
37.441	391.287
37.589	427.722
37.677	310.581
37.884	474.563
37.926	401.676
38.019	352.214
38.026	430.304
38.168	391.252
38.467	500.566
38.509	417.266
38.560	451.103
38.602	373.010
38.806	497.947
38.902	477.118
39.040	393.814
39.092	438.063
39.433	458.871
39.437	508.329
39.578	448.452
39.623	406.802
40.011	419.798
40.013	440.623
40.016	477.065
40.024	570.774
40.067	510.902
40.070	544.741
40.641	411.959
40.745	497.855
40.791	469.219
40.893	536.893
41.187	570.719
41.226	461.389
41.230	513.450
41.714	495.206
41.823	646.177
41.973	706.040
42.055	521.220
42.106	549.851
42.198	497.786
42.205	583.686
42.836	591.465
43.133	664.336
43.218	523.768
43.226	622.683
43.316	541.985
43.806	607.037
43.811	661.701
43.909	682.521
44.047	583.599
44.345	682.500
44.632	630.426
44.823	593.974
46.191	729.267
46.194	776.122
46.676	734.450
46.927	846.369
48.153	1023.318
49.512	1051.887
51.290	872.193];
units.LW   = {'cm', 'g'};  label.LW = {'fork length', 'weight'};  
bibkey.LW = 'Jord1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Endemic to southern Australia';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4JP37'; % Cat of Life
metaData.links.id_ITIS = '692099'; % ITIS
metaData.links.id_EoL = '46568549'; % Ency of Life
metaData.links.id_Wiki = 'Platycephalus'; % Wikipedia
metaData.links.id_ADW = 'Platycephalus_aurimaculatus'; % ADW
metaData.links.id_Taxo = '183984'; % Taxonomicon
metaData.links.id_WoRMS = '274651'; % WoRMS
metaData.links.id_fishbase = 'Platycephalus-aurimaculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'h274651owpublished = {\url{http://en.wikipedia.org/wiki/Platycephalus}}';
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
bibkey = 'Jord1998'; type = 'phdthesis'; bib = [ ... 
'author = {Jordan, A.R.}, ' ... 
'year = {1998}, ' ...
'title = {The life-history ecology of \emph{Platycephalus bassensis} and \emph{Nemadactylus macropterus}}, ' ...
'school = {University of Tasmania}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Platycephalus-aurimaculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
