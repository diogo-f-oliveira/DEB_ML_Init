function [data, auxData, metaData, txtData, weights] = mydata_Pentaceropsis_recurvirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Pentacerotidae';
metaData.species    = 'Pentaceropsis_recurvirostris'; 
metaData.species_en = 'Longsnout boarfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 07];

%% set data
% zero-variate data

data.ab = 4.9;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(15.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 55*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulHall2016';   
  temp.am = C2K(15.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 284.7;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01995*Lp^3.01, see F1';
data.Wwi = 2.6e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.01, see F1';

data.GSI = 0.098; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'CoulHall2016';
  temp.GSI = C2K(17.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [... %  yr class (yr), total length (cm)
2.173	39.746
2.561	39.747
3.476	37.018
3.702	45.847
3.968	43.956
4.138	32.816
4.249	37.861
4.337	49.003
4.452	52.787
4.588	51.106
4.622	41.857
4.864	46.272
4.874	43.749
5.292	35.553
5.370	49.427
5.784	42.281
5.903	45.225
6.048	40.811
6.062	37.027
6.925	48.591
7.057	47.751
7.071	43.967
7.094	37.871
7.177	50.274
7.338	41.866
7.583	45.441
7.732	40.186
7.829	48.805
8.129	37.665
8.224	46.914
8.631	41.660
9.294	37.459
9.417	39.141
9.643	47.970
9.651	45.658
9.892	50.494
10.789	52.599
10.801	49.446
10.820	44.401
11.039	54.912
11.065	47.975
11.211	43.351
11.344	42.511
11.560	54.073
11.595	44.614
11.702	50.500
11.718	46.296
12.249	42.514
12.261	39.361
12.478	50.503
12.621	46.720
12.888	44.618
12.914	37.471
13.163	39.995
13.260	48.824
13.401	45.671
13.900	50.718
14.036	48.827
14.052	44.412
14.151	52.611
14.319	42.101
14.558	47.567
14.704	42.943
14.824	45.466
15.326	49.672
15.338	46.309
15.441	53.456
15.475	44.417
15.980	47.572
16.271	38.955
16.354	51.357
16.381	44.210
16.386	42.739
16.772	43.160
17.007	49.678
17.518	51.361
17.946	40.432
18.026	53.886
18.046	48.420
18.446	45.268
18.819	49.264
19.168	59.775
19.187	54.731
19.232	42.328
19.324	52.419
19.722	49.687
19.937	61.670
19.975	51.370
19.991	46.956
19.999	44.853
20.086	56.205
20.355	53.473
20.400	41.281
20.501	49.059
20.727	57.679
20.906	44.436
21.126	54.737
21.154	47.170
21.271	50.534
21.303	41.915
21.510	55.790
21.780	52.848
21.820	41.917
22.193	46.122
22.278	57.894
22.458	44.231
22.559	52.010
22.570	49.067
22.808	54.533
22.941	53.482
22.980	42.972
23.118	40.660
23.361	44.865
23.467	51.172
23.479	47.809
23.578	56.217
24.027	39.612
24.074	61.895
24.103	53.907
24.264	45.499
24.402	43.187
24.647	46.762
24.766	49.495
24.885	52.438
24.927	41.087
25.017	51.598
25.044	44.451
25.149	50.968
25.308	42.980
25.648	55.804
25.915	53.493
26.083	42.983
26.148	60.431
26.197	47.188
26.319	49.290
26.459	46.348
26.663	61.063
26.987	43.406
27.065	57.281
27.218	50.975
27.257	40.464
27.488	47.823
27.621	46.772
27.886	45.091
28.073	64.431
28.106	55.603
28.117	52.449
28.145	44.882
28.285	42.150
28.522	47.826
29.432	46.568
29.648	58.131
30.221	43.208
30.308	54.559
30.693	55.401
30.734	44.260
30.968	50.988
31.246	45.734
31.259	42.160
32.011	48.469
32.130	51.412
32.234	58.140
32.276	46.999
32.501	56.038
33.153	54.569
33.167	50.575
33.272	57.302
33.954	47.635
34.052	56.254
34.292	61.300
34.608	45.745
35.119	47.429
35.200	60.462
35.212	57.099
35.266	42.595
35.761	48.692
35.879	51.636
36.271	50.586
36.417	45.962
36.893	57.315
37.039	52.691
37.045	51.009
37.189	47.016
38.053	58.160
38.092	47.650
38.475	48.912
38.711	55.009
39.369	52.068
39.379	49.336
40.025	49.548
40.036	46.605
41.038	55.227
41.197	47.240
41.724	44.719
42.750	46.825
42.883	45.774
43.626	54.816
44.397	56.080
45.967	51.251
46.725	56.088
47.275	47.051
47.390	51.046
47.399	48.523
48.171	49.577
53.168	61.997
53.370	42.448
53.748	45.182
55.032	47.499];
data.tL_f(:,1) = (data.tL_f(:,1)+0)*365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f   = C2K(15.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHall2016';
%
data.tL_m = [... %  yr class (yr), total length (cm)
2.974	36.402
3.362	35.339
3.621	40.659
3.750	36.617
4.267	41.938
4.268	38.108
4.526	35.769
4.655	39.812
4.784	37.259
5.819	38.327
6.207	40.456
6.336	39.818
6.724	36.415
6.983	38.118
6.984	42.799
7.500	40.886
7.629	43.014
7.759	37.270
8.147	39.399
8.276	44.931
8.405	40.251
8.534	45.783
8.535	37.698
8.664	41.528
9.181	38.551
9.569	44.936
9.828	39.405
10.733	49.834
10.734	43.451
11.250	46.857
11.638	51.964
12.155	47.924
12.156	49.626
12.157	43.030
12.284	40.690
12.414	41.542
13.319	45.800
13.448	51.120
13.836	41.334
14.224	47.293
14.353	43.038
14.612	44.315
14.741	46.869
14.871	38.784
14.872  46.018
15.129	40.275
15.517	40.702
16.034	47.937
16.164	43.257
16.165	38.789
16.940	40.494
17.198	41.771
17.328	43.687
18.233	40.286
18.491	48.797
18.879	41.565
19.009	43.905
19.267	50.928
19.268	50.928
19.269	39.226
19.655	39.865
19.914	46.249
19.915	42.207
20.302	51.995
20.431	45.400
20.690	43.273
20.691	41.358
20.819	42.423
20.948	46.891
21.207	47.956
21.336	51.148
21.853	41.362
22.112	43.916
22.113	46.257
22.241	46.896
22.888	42.643
23.147	49.027
23.276	44.772
23.277	46.687
23.534	41.156
23.922	44.561
24.052	51.157
24.440	54.563
24.441	47.116
24.569	43.074
24.828	43.075
24.957	46.693
25.086	40.948
25.087	48.608
25.216	52.225
25.345	45.205
25.603	54.142
25.991	41.803
26.121	50.314
27.026	52.657
27.155	49.253
27.284	42.020
27.414	39.893
27.543	44.148
28.319	43.513
29.353	45.857
29.483	40.751
30.259	42.882
30.388	46.712
31.034	39.906
32.457	50.974
32.974	46.083
33.103	47.998
33.233	43.530
34.267	41.619
34.655	47.365
34.656	50.344
35.172	42.899
35.173	49.282
35.431	52.474
36.078	45.455
36.207	40.988
37.629	44.610
38.017	41.420
39.181	41.211
39.440	47.808
40.216	48.662
45.647	56.128];
data.tL_m(:,1) = (data.tL_m(:,1)+0)*365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m   = C2K(15.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulHall2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.GSI = 3 * weights.GSI;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01995*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76MB4'; % Cat of Life
metaData.links.id_ITIS = '645479'; % ITIS
metaData.links.id_EoL = '46581239'; % Ency of Life
metaData.links.id_Wiki = 'Pentaceropsis_recurvirostris'; % Wikipedia
metaData.links.id_ADW = 'Pentaceropsis_recurvirostris'; % ADW
metaData.links.id_Taxo = '183427'; % Taxonomicon
metaData.links.id_WoRMS = '282200'; % WoRMS
metaData.links.id_fishbase = 'Pentaceropsis-recurvirostris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pentaceropsis_recurvirostris}}';
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
bibkey = 'CoulHall2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.13049}, ' ...
'author = {Coulson, P.G. and N.G. Hall and I.C. Potter}, ' ... 
'year = {2016}, ' ...
'title = {Biological characteristics of three co-occurring species of armorhead from different genera vary markedly from previous results for the {P}entacerotidae}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {89(4)}, ' ...
'pages = {1393-1418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pentaceropsis-recurvirostris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

