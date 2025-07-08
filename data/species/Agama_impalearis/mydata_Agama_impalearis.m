function [data, auxData, metaData, txtData, weights] = mydata_Agama_impalearis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Agamidae';
metaData.species    = 'Agama_impalearis'; 
metaData.species_en = 'North African rock agama'; 

metaData.ecoCode.climate = {'BWh', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 25];

%% set data
% zero-variate data

data.ab = 80;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Wiki';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '60 d, but eggs develop already before being laid, which should be added';
data.tp = 365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MoudZnar1999'; 
data.Li  = 13;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'MoudZnar1999';  
data.Lim  = 14;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = 'MoudZnar1999';  

data.Wwi = 71;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'MoudZnar1999';
data.Wwim = 102;   units.Wwim = 'g';  label.Wwim = 'ultimate wet '; bibkey.Wwim = 'MoudZnar1999';

data.Ri  = 2*14/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 till 23 eggs per clutch, 2 clutches per year';

% univariate data 
% time-temp for tL and tW data
tT = [ ... % mean temp (C) for jan-dec in 1993-1996
    11.7 10.7 12.5 13.0
    13.1 12.6 14.8 11.1
    16.9 15.7 17.9 13.2
    17.7 19.0 15.9 18.3
    19.6 21.2 21.8 20.9
    23.5 25.6 23.8 25.6
    28.5 30.4 28.3 28.3
    27.3 28.8 28.1 24.7
    24.7 23.7 23.4 22.8
    18.6 19.9 24.0 21.1
    13.6 18.2 18.8 15.9
    12.1 14.4 13.7 12.5];
tT = [30.5*(0:47)', C2K(tT(:))]; % d, K time, temp

% time-length
data.tL_f = [ ... % time since birth (d), SVL (cm)
5.302	2.929
118.256	3.826
149.448	3.777
149.490	4.025
178.367	4.473
178.452	4.969
234.367	9.141
236.231	6.014
265.278	7.454
265.389	8.099
265.440	8.397
265.491	8.695
265.669	9.738
265.771	10.334
265.874	10.929
294.572	10.334
297.074	10.930
299.261	9.689
323.406	10.534
328.342	11.328
354.555	10.237
354.614	10.584
382.870	7.408
445.568	9.147
476.904	9.942
503.262	9.695
537.177	11.532
563.441	10.739
563.620	11.781
594.641	10.740
594.811	11.733
594.879	12.130
623.373	10.343
623.458	10.840
625.960	11.436
626.029	11.833
654.744	11.337
683.459	10.841
685.680	9.799
685.918	11.189
712.037	9.551
714.557	10.247
714.608	10.544
714.659	10.842
810.574	10.349
865.766	10.300
925.928	11.245
926.200	12.834
949.987	11.594
952.311	11.147
954.890	12.189
957.247	11.941
983.639	11.892
1314.823	11.802
1343.657	12.002
1406.100	12.251
1434.849	11.954];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = tT;  units.temp.tL_f = {'d','K'}; label.temp.tL_f = {'time','temperature'};
bibkey.tL_f = 'MoudZnar1999';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (f), SVL (cm)
3.192	4.617
5.353	3.227
5.396	3.475
5.472	3.922
27.345	5.511
29.447	3.774
31.813	3.575
31.915	4.171
31.949	4.370
55.873	3.923
56.026	4.817
56.094	5.214
56.128	5.413
60.588	3.427
60.996	5.810
61.056	6.158
89.396	3.478
89.430	3.676
89.456	3.825
89.541	4.322
92.009	4.719
92.043	4.917
113.703	5.265
115.950	4.372
142.588	5.763
144.962	5.614
147.320	5.366
149.516	4.174
149.584	4.571
178.614	5.913
200.392	6.956
202.656	6.162
202.861	7.353
202.929	7.750
236.367	6.808
236.520	7.701
236.631	8.347
236.725	8.893
265.703	9.936
265.746	10.185
294.750	11.377
294.793	11.625
294.870	12.072
294.912	12.320
297.031	10.682
299.108	8.795
318.631	10.682
321.227	11.824
323.244	9.590
323.661	12.023
328.325	11.229
351.687	7.506
357.244	11.925
472.309	11.134
472.470	12.077
501.253	11.978
505.951	11.383
505.985	11.581
534.811	11.731
561.415	12.923
563.713	12.328
587.577	11.534
590.275	13.272
590.309	13.470
592.496	12.229
630.973	12.677
652.497	12.231
655.016	12.926
657.424	12.976
681.288	12.182
688.412	11.735
717.161	11.438
717.314	12.332
793.978	11.540
863.749	12.534
897.315	12.337
921.443	13.082
923.579	11.543
950.141	12.487
952.600	12.835
986.158	12.587
1043.716	12.341
1310.245	13.093
1312.551	12.547
1581.548	13.696];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = tT;  units.temp.tL_m = {'d','K'}; label.temp.tL_m = {'time','temperature'};
bibkey.tL_m = 'MoudZnar1999';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... time since birth (d), weight (g)
33.060	4.292
35.392	1.435
117.018	2.523
148.192	1.458
150.584	1.101
184.218	2.536
184.278	5.036
234.858	12.546
242.161	16.833
264.481	46.838
267.018	52.553
271.090	22.196
271.210	27.196
271.338	32.553
273.301	14.340
300.276	38.274
302.830	44.703
329.042	36.851
329.179	42.565
357.807	35.428
357.945	41.142
388.836	28.291
446.436	28.303
477.705	31.166
509.188	42.958
509.351	49.744
540.620	52.607
569.274	46.541
569.626	61.184
598.391	59.761
598.520	65.118
601.066	71.190
631.374	34.053
633.929	40.483
634.040	45.125
660.140	32.631
688.983	34.422
689.112	39.779
689.352	49.779
691.272	29.780
691.915	56.566
717.758	33.356
717.835	36.571
718.306	56.214
720.621	52.643
722.883	46.929
809.198	43.374
873.956	41.602
931.942	57.685
955.933	57.332
956.113	64.832
960.682	55.190
960.973	67.333
962.799	43.405
992.028	61.268
1318.198	51.690
1318.378	59.190
1347.092	55.624
1407.161	58.493
1442.938	49.215];
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f   = tT;  units.temp.tW_f = {'d','K'}; label.temp.tW_f = {'time','temperature'};
bibkey.tW_f = 'MoudZnar1999';
%
data.tW_m = [ ... time since birth (d), weight (g)
0.574	2.857
0.600	1.785
25.817	2.505
37.954	8.221
59.529	7.154
59.589	9.654
61.852	3.940
61.886	5.369
88.235	3.231
88.252	3.946
117.043	3.594
126.626	2.882
150.695	5.744
150.789	9.672
179.521	6.821
201.232	11.468
206.212	18.969
208.518	15.041
208.527	15.398
237.653	28.975
240.173	33.976
242.093	13.976
242.273	21.476
242.358	25.048
261.858	37.552
266.496	30.767
266.590	34.695
271.613	43.982
271.647	45.411
271.716	48.268
273.841	36.840
296.119	65.058
298.656	70.773
300.113	31.488
300.224	36.131
300.336	40.774
300.533	48.988
300.593	51.488
300.644	53.631
300.713	56.488
329.222	44.351
329.402	51.851
329.522	56.851
329.599	60.065
329.984	76.137
353.445	53.641
357.310	14.713
358.493	63.999
478.314	56.523
480.791	59.738
480.851	62.238
507.354	66.529
512.094	64.030
541.100	72.607
570.097	80.827
570.174	84.041
598.460	62.618
599.009	85.476
599.403	101.904
630.234	86.553
663.586	76.203
663.646	78.703
692.069	62.994
692.163	66.923
692.352	74.780
694.606	68.709
718.503	64.428
718.623	69.428
720.586	51.214
723.518	73.357
809.558	58.375
874.487	63.745
896.370	75.535
937.282	80.186
958.762	75.190
958.873	79.833
959.216	94.119
989.825	69.482
990.073	79.839
1049.954	74.851
1318.772	75.618
1321.481	88.476
1590.316	89.958];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m   = tT;  units.temp.tW_m = {'d','K'}; label.temp.tW_m = {'time','temperature'};
bibkey.tW_m = 'MoudZnar1999';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;
weights.ab = 5 * weights.ab;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature is varying in tL and tW data, which hase been taken into account';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '65K33'; % Cat of Life
metaData.links.id_ITIS = '1055475'; % ITIS
metaData.links.id_EoL = '815857'; % Ency of Life
metaData.links.id_Wiki = 'Agama_impalearis'; % Wikipedia
metaData.links.id_ADW = 'Agama_impalearis'; % ADW
metaData.links.id_Taxo = '640732'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Agama&species=bibronii'; % ReptileDB
metaData.links.id_AnAge = 'Agama_impalearis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Agama_impalearis}}';
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
bibkey = 'MoudZnar1999'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1999.tb01215.x}, ' ...
'author = {El Hassan El Mouden and Mohammed Znari and Richard P. Brown}, ' ... 
'year = {1999}, ' ...
'title = {Skeletochronology and mark–recapture assessments of growth in the {N}orth {A}frican agamid lizard (\emph{Agama impalearis})}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {249(4)}, ' ...
'pages = {455–461}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Agama_impalearis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

