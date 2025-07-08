function [data, auxData, metaData, txtData, weights] = mydata_Glaucosoma_buergeri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Glaucosomatidae';
metaData.species    = 'Glaucosoma_buergeri'; 
metaData.species_en = 'Deepsea jewfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 16];

%% set data
% zero-variate data

data.am = 27*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Newm2002';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 32; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'CampJoin2023'; 
  comment.Lp = 'based on Glaucosoma scapulare';
data.Li  = 55;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.25 mm : pi/6*0.125^3'; 
data.Wwp = 537; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02399*Lp^2.89, see F1';
data.Wwi = 2.57e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02399*Li^2.89, see F1';

data.Ri = 1e6/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'CampJoin2023';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Glaucosoma scapulare: 1e6';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.798	6.996
0.962	13.651
0.971	10.042
0.995	12.749
1.030	10.831
1.056	12.298
1.059	11.395
1.950	17.264
1.953	16.136
1.967	22.452
1.984	15.685
1.985	15.234
2.030	21.437
2.036	18.956
2.064	20.084
2.078	14.445
2.908	20.651
3.023	23.020
3.061	19.862
3.062	19.411
3.074	26.742
3.106	25.840
3.116	21.893
3.988	23.363
4.015	24.603
4.050	22.799
4.071	26.634
4.863	23.705
5.091	29.232
5.899	32.055
6.013	34.875
6.077	33.409
6.954	32.961
6.962	29.804
7.925	43.116
7.973	36.236
8.912	34.774
8.967	36.917
8.976	33.647
9.933	37.485
10.000	34.553
10.101	42.561
10.832	52.151
10.927	38.392
10.938	33.880
10.939	33.429
10.970	45.384
10.972	44.369
10.989	37.602
11.935	33.884
11.957	37.155
11.974	42.230
11.976	41.554
12.014	38.622
12.025	46.065
12.924	36.708
12.953	37.272
12.957	35.693
13.050	34.791
13.872	56.336
13.947	38.517
13.949	37.615
14.903	54.423
15.014	58.371
15.920	58.488
15.991	42.360
18.966	48.237
19.001	46.433
19.984	39.670
20.009	41.926
20.060	45.535
20.086	47.340
24.966	52.210
25.858	57.852];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(27.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Newm2002';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.813	12.861
0.936	12.072
0.971	10.154
0.999	11.170
1.019	15.004
1.022	13.764
1.090	11.057
1.929	13.542
1.952	16.474
1.987	14.670
1.992	24.595
2.002	20.422
2.036	19.069
2.046	15.234
3.021	23.810
3.022	23.133
3.026	21.667
3.054	22.569
3.058	20.990
3.060	20.314
3.121	19.863
3.918	27.310
3.930	22.460
3.985	24.603
4.020	22.799
4.022	21.784
4.041	26.182
4.049	23.250
4.951	24.720
4.953	23.930
5.003	28.104
5.006	26.863
5.007	26.750
5.926	33.521
5.928	32.619
5.992	31.153
5.997	29.123
6.002	27.093
6.006	37.694
6.921	33.863
6.923	33.074
6.925	32.623
6.980	34.540
7.018	31.608
7.028	39.503
8.005	35.221
8.039	33.981
8.934	38.270
8.970	35.902
9.022	39.060
9.831	41.658
9.925	40.530
9.927	39.741
9.929	38.838
9.932	37.823
10.015	52.824
10.032	46.057
10.060	35.004
10.899	37.602
10.922	52.264
10.951	40.873
10.961	36.813
10.975	43.354
11.020	49.445
11.858	52.380
11.871	47.080
11.956	49.448
11.959	48.433
11.967	44.937
12.072	39.299
12.957	47.648
12.960	46.408
12.976	40.092
12.979	50.919
12.999	43.137
13.909	53.404
13.943	51.825
13.949	49.570
13.951	48.667
14.022	44.607
14.045	47.427
14.860	47.769
14.898	44.724
14.912	38.972
14.930	43.822
14.933	42.807
14.966	41.566
15.911	50.029
15.928	55.330
15.929	43.262
16.922	44.394
16.957	54.432
16.972	48.567
16.995	39.432
19.008	43.613
19.966	46.662
21.867	47.347];
data.tL_m(:,1) = 365 * (0+data.tL_m(:,1));  % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(27.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Newm2002';

% length-weight
data.LW = [ ... total length (cm), weight (g)
9.708	16.354
10.337	26.753
10.825	37.140
11.175	16.481
11.594	26.862
12.013	26.898
12.432	37.279
12.641	37.297
13.060	42.505
13.479	47.714
13.759	52.910
14.317	63.303
14.946	63.357
15.225	63.381
15.644	78.935
16.132	89.322
16.412	89.346
17.110	89.406
19.065	141.299
20.112	162.079
21.717	203.596
22.136	224.322
22.694	250.232
23.463	224.436
23.812	234.811
24.160	271.048
24.649	291.780
25.626	312.554
25.906	297.061
25.975	333.274
26.394	312.620
26.883	338.524
27.371	374.773
27.581	343.757
27.999	369.655
28.138	421.391
28.488	400.732
28.976	416.291
29.185	452.516
30.023	457.761
30.300	556.060
30.372	447.446
30.441	488.831
30.859	525.074
31.210	483.725
31.278	530.283
31.696	576.870
31.836	571.710
32.047	520.004
32.325	582.097
32.813	602.829
33.231	644.244
33.303	577.009
33.789	670.154
33.860	613.264
34.696	711.612
34.833	809.899
35.323	778.907
35.601	830.655
36.231	768.641
36.368	866.928
36.370	804.859
36.579	841.084
37.206	892.863
37.484	954.955
37.556	867.031
37.834	908.434
38.042	980.866
38.113	944.665
38.394	882.620
38.740	986.098
38.741	949.891
39.019	1006.812
39.366	1084.428
39.508	1022.371
39.650	934.453
39.856	1058.608
39.928	991.373
39.928	955.166
39.994	1110.344
40.205	1084.500
40.485	1043.145
40.762	1146.617
41.110	1167.337
41.458	1224.264
41.806	1276.018
42.018	1177.760
42.574	1307.118
42.576	1224.360
42.647	1188.159
42.924	1255.424
42.992	1333.017
43.344	1229.599
43.413	1265.811
43.547	1488.237
43.621	1322.726
43.969	1358.963
44.103	1581.388
44.248	1379.677
44.595	1483.155
44.665	1446.954
44.733	1529.718
44.736	1410.753
44.947	1364.220
45.081	1565.955
45.432	1509.089
45.497	1684.957
45.778	1633.257
45.853	1447.056
46.059	1571.212
46.201	1498.810
46.339	1560.891
46.546	1659.185
46.616	1648.846
46.822	1793.692
46.826	1612.657
46.894	1721.284
46.901	1426.457
47.174	1674.756
47.312	1757.527
47.526	1586.856
47.732	1700.667
47.944	1623.099
48.077	1866.214
48.289	1788.646
48.426	1876.588
48.568	1783.497
48.634	1923.158
48.640	1700.745
48.777	1814.550
49.127	1788.718
49.404	1881.845
49.682	1949.110
49.820	2000.847
50.236	2104.331
50.301	2300.888
50.723	2207.821
50.933	2161.287
51.078	1980.265
52.049	2238.970
53.025	2295.950
53.231	2451.141];
units.LW   = {'cm', 'd'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Newm2002';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length: Ww in g = 0.02399*(TL in cm)^2.89';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3G6MD'; % Cat of Life
metaData.links.id_ITIS = '645722'; % ITIS
metaData.links.id_EoL = '46581088'; % Ency of Life
metaData.links.id_Wiki = 'Glaucosoma'; % Wikipedia
metaData.links.id_ADW = 'Glaucosoma_buergeri'; % ADW
metaData.links.id_Taxo = '175015'; % Taxonomicon
metaData.links.id_WoRMS = '279189'; % WoRMS
metaData.links.id_fishbase = 'Glaucosoma-buergeri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glaucosoma}}';
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
bibkey = 'Newm2002'; type = 'Article'; bib = [ ... 
'doi = {10.1046/j.1439-0426.2002.00327.x}, ' ...
'author = {Newman, S.J.}, ' ... 
'year = {2002}, ' ...
'title = {Age, growth, mortality and population characteristics of the pearl perch, \emph{Glaucosoma buergeri} {R}ichardson 1845, from deeper continental shelf waters off the {P}ilbara coast of north-western {A}ustralia}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {18}, ' ...
'pages = {95-101}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CampJoin2023'; type = 'Article'; bib = [ ... 
'doi = {10.1155/2023/5529782}, ' ...
'author = {Matthew J. Campbell  and Jaimee E. Joiner and Mark F. McLennan and Ian R. Tibbetts}, ' ... 
'year = {2023}, ' ...
'title = {Sea Surface Temperature Affects the Reproductive Biology of Female Pearl Perch (\emph{Glaucosoma scapulare} {M}acleay, 1881) in {Q}ueensland, {A}ustralia}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'pages = {5529782}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Glaucosoma-buergeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
