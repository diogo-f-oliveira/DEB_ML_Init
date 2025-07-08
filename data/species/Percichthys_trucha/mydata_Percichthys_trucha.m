  function [data, auxData, metaData, txtData, weights] = mydata_Percichthys_trucha
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Percichthys_trucha'; 
metaData.species_en = 'Creole perch'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 26];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'CazoSido2011';   
  temp.am = C2K(24.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 24.1;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'CazoSido2011';
data.Lpm = 26.0;     units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'CazoSido2011';
data.Li = 76;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 146.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01047*Lp^3.00, see F1';
data.Wwi = 4.6e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.00, see F1';
 
data.Ri = 1.5e5/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate ';   bibkey.Ri = 'guess';
  temp.Ri = C2K(24.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Percichthys_colhuapiensis';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm), femles, males
    0 15.35 17.15
    1 20.12 24.11
    2 26.51 28.40
    3 31.64 31.26
    4 35.73 34.16
    5 38.70 34.77
    6 36.67 NaN
    7 39.40 NaN
    9 42.00 NaN
   13 43.20 NaN 
   15 43.10 NaN];
data.tL_fm(:,1) = (.8 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'CazoSido2011';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
11.051	15.635
15.082	46.906
15.432	50.814
16.306	74.267
16.572	54.723
16.748	54.723
16.921	66.449
17.270	82.085
17.270	82.085
17.447	70.358
17.710	74.267
18.233	93.811
18.496	97.720
18.500	66.449
19.109	101.629
19.638	85.993
20.161	109.446
20.163	89.902
20.336	109.446
20.771	136.808
20.951	105.537
21.299	121.173
21.472	136.808
21.991	187.622
22.001	121.173
22.171	156.352
22.525	136.808
22.874	148.534
23.308	179.805
23.402	140.717
23.488	148.534
23.574	160.260
23.923	175.896
24.007	203.257
24.364	160.260
24.534	195.440
24.801	168.078
24.881	222.801
25.055	234.528
25.060	199.349
25.060	199.349
25.408	214.984
25.667	246.254
26.024	203.257
26.189	277.524
26.281	246.254
26.283	230.619
26.364	281.433
26.368	250.163
26.620	328.339
26.809	234.528
27.245	254.072
27.324	308.795
27.589	300.977
27.681	269.707
27.942	285.342
28.122	250.163
28.197	340.065
28.383	269.707
28.466	300.977
28.637	332.248
28.819	285.342
28.989	320.521
29.172	269.707
29.507	379.153
29.512	343.974
29.855	402.606
29.865	328.339
29.947	371.335
30.133	297.068
30.219	308.795
30.377	426.059
30.382	394.788
30.478	340.065
30.540	515.961
30.743	328.339
30.823	375.244
30.994	406.515
31.595	500.326
31.693	429.967
31.784	406.515
31.862	472.964
32.045	418.241
32.130	441.694
32.567	449.511
32.663	390.879
32.823	500.326
32.983	601.954
33.009	426.059
33.011	414.332
33.171	519.870
33.344	535.505
33.450	410.423
33.714	402.606
33.770	621.498
33.875	504.235
34.124	601.954
34.499	433.876
34.573	531.596
34.579	484.691
34.656	558.958
35.098	535.505
35.285	461.238
35.508	730.945
35.793	586.319
35.867	680.130
35.884	558.958
36.300	715.309
36.316	609.772
36.484	656.678
36.497	570.684
36.668	598.046
36.837	644.951
37.279	617.589
37.430	785.668
37.435	750.489
37.447	668.404
37.714	641.042
37.808	601.954
37.893	621.498
37.939	902.932
38.052	730.945
38.234	684.039
38.421	609.772
38.474	844.300
38.477	824.756
38.661	766.124
38.929	730.945
39.285	699.674
39.539	758.306
39.891	750.489
39.965	848.208
40.573	891.205
41.025	797.394
41.184	910.749
41.691	1039.739
41.806	856.026
42.942	887.296
43.048	758.306
43.095	1039.739];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'CazoSido2011';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
15.095	49.714
18.759	83.581
19.027	86.407
19.206	92.101
19.475	103.499
20.994	117.611
21.529	111.836
21.621	137.539
21.978	137.498
22.966	191.671
23.319	157.345
23.681	200.161
23.768	180.151
24.306	202.947
24.662	191.477
24.755	225.753
25.380	225.681
25.555	191.375
25.649	234.222
25.824	202.773
25.825	211.345
26.545	274.119
26.638	308.395
26.810	236.946
26.811	251.232
27.258	254.038
27.352	305.456
27.439	282.589
28.066	299.660
28.152	265.364
28.431	379.618
28.778	279.579
28.960	316.701
29.048	299.548
29.323	376.659
29.404	285.221
29.407	322.364
29.410	345.221
29.679	356.619
29.765	328.037
30.029	288.007
30.215	362.271
30.480	336.527
30.660	350.792
30.663	379.363
30.663	385.077
30.845	416.485
31.207	462.158
31.284	336.435
31.555	370.690
31.558	404.975
31.650	427.822
31.823	373.516
32.185	422.046
32.268	359.180
32.453	419.159
32.636	470.566
32.824	559.116
32.901	441.965
32.902	447.679
32.909	519.107
33.442	493.331
33.794	436.148
33.886	464.709
34.514	498.923
34.516	521.780
34.701	587.473
34.787	553.178
34.868	467.454
34.967	561.728
35.318	501.688
35.499	530.239
35.675	501.648
35.692	675.931
35.862	584.483
36.848	627.228
37.117	641.483
37.472	618.585
37.575	755.716
37.667	781.420
38.377	735.624
38.635	641.309
38.732	718.441
39.547	826.919];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'CazoSido2011';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = weights.Wwb * 5;
weights.Wwi = weights.Wwi * 5;
weights.Li = weights.Li * 5;
weights.tL_fm = weights.tL_fm * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7744F'; % Cat of Life
metaData.links.id_ITIS = '641907'; % ITIS
metaData.links.id_EoL = '355826'; % Ency of Life
metaData.links.id_Wiki = 'Percichthys'; % Wikipedia
metaData.links.id_ADW = 'Percichthys_trucha'; % ADW
metaData.links.id_Taxo = '183459'; % Taxonomicon
metaData.links.id_WoRMS = '1026863'; % WoRMS
metaData.links.id_fishbase = 'Percichthys-trucha'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Percichthys}}';  
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
bibkey = 'CazoSido2011'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1439-0426.2010.01574.x}, ' ...
'author = {A. Lopez Cazorla and N. Sidorkewicj}, ' ...
'year = {2011}, ' ...
'title = {Age, growth and reproduction in creole perch (\emph{Percichthys trucha}) in the {N}egro {R}iver, {A}rgentinean {P}atagonia}, ' ... 
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {27(1)}, '...
'pages = {30–38}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Percichthys-trucha.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

