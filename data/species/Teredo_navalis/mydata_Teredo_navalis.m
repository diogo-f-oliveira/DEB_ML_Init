function [data, auxData, metaData, txtData, weights] = mydata_Teredo_navalis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Teredinidae';
metaData.species    = 'Teredo_navalis'; 
metaData.species_en = 'Naval shipworm'; 

metaData.ecoCode.climate = {'MC','MB','MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp', 'jiMcb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiAb', 'jiHw'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am_T'; 'Lh'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wdb'; 'Wdp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-L'; 'L-W'; 'Wd-JO'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2020 04 28];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Sylvie Gaudron'; 'Sebastien Lefebvre'; 'Goncalo Marques'};    
metaData.date_mod_1     = [2021 01 06];              
metaData.email_mod_1    = {'sylvie.gaudron@sorbonne-universite.fr';};            
metaData.address_mod_1  = {'UMR8187 LOG, Station Marine de Wimereux, 28 avenue Foch, B.P. 80, 62930 Wimereux France'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 01 10]; 


%% set data
% zero-variate data

data.ah = 1 ; units.ah = 'd' ; label.ah = 'age at hatching' ; bibkey.ah = 'Cull1975' ; 
  temp.ah = C2K(25) ; units.temp.ah = 'K' ; label.temp.ah = 'temperature';
  comment.ah = 'trochophora hatches when gastrulation is completed; S = 30 %%';
data.ab = 9 ; units.ab = 'd' ; label.ab = 'age at birth' ; bibkey.ab = 'Cull1975' ; 
  temp.ab =C2K(25); units.temp.ab = 'K' ; label.temp.ab = 'temperature' ; 
  comment.ab = 'feeding stats when trochophora becomes umboveliger';
data.tj = 51;   units.tj = 'd';    label.tj = 'time since birth at settlement'; bibkey.tj = 'Grave1928';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = ['Observation of first release mid-May while the veliger had spent 2 to 3 weeks (mean=17d) in the gill chamber of the females. ' ...
  'Then, veliger and umboveliger spent 14-30d (mean=21d) of Pelagic Larval Dispersal (PLD) at in situ temperature. ' ...
  'Then, it takes between 14-21d (mean=17d) to complete metamorphosis after settling (acquiring rasping ridges into its shell to bore the wood). ' ...
  'First observation of young metamorphosized juveniles at the beginning of July: 17+17+17=51 days.  ' ...
  '(May temperature 10 C, June temperature in Woods Hole 15 C, July = 19 C)'];
data.tp = 56;   units.tp = 'd';    label.tp = 'time since settlement at puberty'; bibkey.tp = 'Grave1942';   
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'from in situ Wood Holes July/August (19/20 C) it took 8 weeks after settlement to reach puberty'; 
data.am = 3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature';
data.am11 = 730;    units.am11 = 'd';    label.am11 = 'life span';         bibkey.am11 = 'Grave1928';  
temp.am11 = C2K(11.5);  units.temp.am11 = 'K'; label.temp.am11 = 'temperature'; 

data.Lh  = 0.005; units.Lh  = 'cm';   label.Lh  = 'length of trochophora';    bibkey.Lh  = 'Cull1975';  
data.Lb = 0.012; units.Lb = 'cm'; label.Lb = 'shell length of umboveliger'; bibkey.Lb  = 'Cull1975';
data.Lj = 0.1;   units.Lj  = 'cm';   label.Lj  = 'body length at the end of metamorphosis';    bibkey.Lj  = 'Grave1928';
data.Lp  = 4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Grave1928';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 1.3e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
  comment.Wwb = '75 to 88 mum long, 55 to 57 mum wide: pi/6*56^2*80e-12; MannGall1985a gives 0.5 mug dry';
data.Wdp = 0.01;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'MannGall1985';
data.Wwi = 47; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'computed from length of 60 cm, diameter of 1 cm: pi*0.5^2*60';

data.Ri  = 1e7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'spawns 3 to 4 times per season, spawning 1e6 to 5e6 eggs; Grave1928 gives yearly fecundity of 5e6 at 11.5 C at Woodshole';

% uni-variate data

% L-L data
data.LL = [ ... % body length (cm), shell length (cm)
0.646	0.239
0.839	0.197
0.939	0.249
0.942	0.304
0.942	0.314
1.139	0.349
1.141	0.399
1.182	0.237
1.278	0.210
1.330	0.274
1.384	0.382
1.572	0.222
1.624	0.304
1.673	0.289
1.769	0.274
1.776	0.412
1.922	0.397
2.162	0.322
2.171	0.501
2.264	0.409
2.264	0.424
2.408	0.367
2.553	0.344
2.556	0.392
2.563	0.551
2.655	0.422
2.749	0.364
2.855	0.539
2.994	0.384
3.044	0.399
3.293	0.511
3.337	0.414
3.536	0.494
3.579	0.379
3.580	0.402
3.641	0.641
3.683	0.511
3.779	0.482
3.826	0.432
3.929	0.556
3.979	0.581
4.124	0.554
4.125	0.569
4.168	0.447
4.265	0.442
4.409	0.397
4.413	0.477
4.557	0.429
4.608	0.467
4.710	0.556
4.801	0.422
4.803	0.467
4.805	0.504
4.995	0.402
5.048	0.494
5.295	0.559
5.347	0.624
5.386	0.422
5.397	0.639
5.443	0.579
5.490	0.546
5.586	0.522
5.734	0.559
5.833	0.576
5.840	0.719
5.841	0.746
5.878	0.504
6.025	0.519
6.030	0.611
6.124	0.554
6.168	0.444
6.320	0.561
6.368	0.544
6.565	0.586
6.658	0.499
6.811	0.629
6.908	0.609
7.003	0.569
7.151	0.591
7.193	0.464
7.299	0.629
7.436	0.444
7.443	0.589
7.489	0.519
7.594	0.681
7.638	0.589
7.642	0.666
7.689	0.636
7.743	0.736
7.783	0.564
7.831	0.542
7.885	0.641
7.929	0.544
8.132	0.704
8.174	0.564
8.229	0.704
8.373	0.654
8.419	0.584
8.762	0.631
8.805	0.497
8.905	0.547
9.048	0.477
9.056	0.651
9.057	0.661
9.101	0.564
9.102	0.592
9.246	0.542
9.248	0.579
9.444	0.602
9.539	0.559
9.734	0.539
9.742	0.721
9.785	0.602
9.791	0.709
9.833	0.579
9.843	0.779
10.076	0.554
10.176	0.602
10.178	0.652
10.179	0.679
10.319	0.542
10.329	0.756
10.372	0.627
10.424	0.704
10.468	0.592
10.472	0.671
10.568	0.642
10.758	0.544
10.812	0.649
10.864	0.709
10.864	0.719
11.000	0.507
11.053	0.584
11.103	0.622
11.251	0.649
11.351	0.704
11.352	0.721
11.353	0.741
11.392	0.544
11.395	0.604
11.396	0.629
11.442	0.562
11.448	0.684
11.599	0.781
11.639	0.604
11.642	0.672
11.644	0.704
11.685	0.542
12.033	0.682
12.035	0.726
12.039	0.796
12.080	0.642
12.128	0.619
12.172	0.529
12.178	0.649
12.178	0.662
12.229	0.706
12.321	0.587
12.323	0.632
12.330	0.759
12.517	0.604
12.522	0.694
12.617	0.654
12.621	0.724
12.685	1.041
12.715	0.664
12.859	0.607
12.957	0.627
12.960	0.687
13.061	0.751
13.207	0.739
13.299	0.624
13.307	0.794
13.396	0.612
13.399	0.687
13.490	0.549
13.496	0.667
13.543	0.637
13.549	0.749
13.553	0.831
13.596	0.724
13.600	0.809
13.687	0.577
13.688	0.599
13.790	0.702
13.933	0.622
14.033	0.669
14.036	0.744
14.129	0.657
14.136	0.796
14.176	0.607
14.328	0.732
14.372	0.622
14.422	0.657
14.423	0.672
14.517	0.607
14.576	0.814
14.810	0.604
14.812	0.657
14.813	0.659
14.857	0.567
14.915	0.759
15.112	0.806
15.157	0.727
15.204	0.682
15.397	0.644
15.404	0.791
15.547	0.724
15.597	0.747
15.641	0.634
15.688	0.607
15.696	0.762
15.697	0.791
15.740	0.664
15.742	0.704
15.838	0.679
15.846	0.841
15.989	0.787
16.180	0.689
16.197	1.041
16.276	0.652
16.279	0.729
16.280	0.749
16.284	0.821
16.437	0.966
16.481	0.866
16.484	0.924
16.568	0.639
16.715	0.652
16.816	0.734
16.822	0.844
16.826	0.939
16.917	0.792
16.960	0.689
16.962	0.722
17.012	0.757
17.205	0.709
17.211	0.819
17.211	0.829
17.305	0.749
17.349	0.664
17.550	0.777
17.551	0.792
17.592	0.635
17.687	0.587
17.695	0.759
17.740	0.669
17.746	0.802
17.949	0.954
18.132	0.709
18.185	0.792
18.230	0.717
18.237	0.859
18.280	0.747
18.284	0.819
18.284	0.832
18.419	0.597
18.423	0.672
18.479	0.819
18.523	0.724
18.525	0.757
18.911	0.679
18.970	0.881
19.014	0.784
19.015	0.812
19.217	0.954
19.252	0.660
19.256	0.749
19.257	0.769
19.258	0.799
19.552	0.822
19.603	0.854
19.642	0.657
19.655	0.934
19.697	0.799
19.844	0.814
20.036	0.739
20.084	0.719
20.129	0.657
20.131	0.685
20.333	0.832
20.377	0.737
20.380	0.802
20.421	0.640
20.435	0.916
20.476	0.752
20.528	0.817
20.673	0.802
20.725	0.864
20.815	0.702
21.009	0.677
21.108	0.715
21.164	0.857
21.403	0.762
22.039	0.799
22.084	0.732
22.290	0.956
22.479	0.827
22.485	0.937
22.521	0.677
22.524	0.740
22.873	0.889
23.109	0.747
23.255	0.725
23.303	0.707
23.406	0.829
23.503	0.812
23.548	0.745
23.742	0.712
23.843	0.777
23.845	0.832
23.896	0.879
24.035	0.712
24.085	0.755
24.429	0.805
24.526	0.780
24.767	0.730
24.961	0.712
25.011	0.730
25.109	0.747
25.114	0.834
25.452	0.760
25.552	0.815
25.601	0.827
26.487	0.977
26.957	0.620
28.040	0.825
28.234	0.790
28.774	0.865
28.869	0.807
29.162	0.830
37.126	1.090];
units.LL   = {'cm', 'cm'};  label.LL = {'body length', 'shell length'};  
bibkey.LL = 'PaalVeld2011';
comment.LL = 'A shell length of 11 mm corresponds with a tube diameter of 8.2 mm';

% t-L data
data.tL = [ ... % time since birth (a), shell weight (g)
0.000   0.300
0.145	0.350
0.449	0.391
0.554	0.905
0.634	2.218
0.704	4.131
0.774	9.449
0.860	18.876
0.905	23.690
0.966	25.601
1.031	28.214
1.076	28.922
1.520	29.582
1.635	31.801
1.841	46.052
2.101	53.800
2.475	53.950
2.740	59.494
3.000	59.429];
data.tL(:,1) = 365 * data.tL(:,1); % convert a to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = [... % time (d), temp (C)
0.000	11.589
0.060	8.241
0.112	6.424
0.172	3.842
0.271	1.166
0.355	1.505
0.439	3.328
0.503	6.587
0.582	10.181
0.646	15.258
0.682	17.845
0.762	17.562
0.854	18.380
0.930	16.804
0.941	14.794
1.037	9.820
1.173	3.268
1.257	2.410
1.336	1.744
1.408	2.369
1.500	4.815
1.596	10.229
1.680	16.457
1.755	18.280
1.847	19.768
1.963	13.837
2.047	9.294
2.126	3.888
2.174	1.592
2.266	0.735
2.350	1.170
2.434	1.222
2.505	4.097
2.685	17.558
2.761	16.892
2.860	17.758
2.988	12.259
3.052	8.624];
temp.tL(:,1) = 365 * temp.tL(:,1); % convert a to d
units.temp.tL = {'d','C'}; label.temp.tL = {'time','temperature'};
bibkey.tL = 'Kris1979';

% time - length
data.tL_1 = [ ...
28  85	95	157;
1.7 5.0 5.7 8.5]';  % cm, Tube Length at f and T time since post-settlement
data.tL_1(:,1) = data.tL_1(:,1) - data.tL_1(1,1); % set time at start experiment
units.tL_1   = {'d', 'cm'};  label.tL_1 = {'time since beginning of experiment', 'tube length'};  
temp.tL_1    = C2K(21.5);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1 = 'MannGall1985';
comment.tL_1 = 'aok wood  in laboratory; 20 C to 23 C';
% 
data.tL_2 = [ ...
46 70 89 113 182;
1.7 5.8 8.4 10.3 11.8]';  % cm, Tube length at f and T time post-settlement
data.tL_2(:,1) = data.tL_2(:,1) - data.tL_2(1,1); % set time at start experiment
units.tL_2   = {'d', 'cm'};  label.tL_2 = {'time since beginning of experiment', 'tube length'};  
temp.tL_2    = C2K(21.5);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2 = 'MannGall1985';
comment.tL_2 = 'pine wood  in laboratory; 20 C to 23 C';
% time-length for larvae
data.tL_4 = [ ...
0 3 6 9 12 15 18 21 24 ;
0.009 0.010 0.011 0.012 0.014 0.016 0.018 0.020 0.021 ]';  % cm, shell length
units.tL_4   = {'d', 'cm'};  label.tL_4 = {'time since early veliger released in the water', 'shell length'};  
temp.tL_4    = C2K(23);  units.temp.tL_4 = 'K'; label.temp.tL_4 = 'temperature';
bibkey.tL_4 = 'MannGall1985';
comment.tL_4 = 'growth of larvae fed with phytoplankton ad libitum; birth at 12d, settlement at 24d';

% length-weight 
% data for juvenile, adult (shape vermiforme juvenile adult tube length)
data.LWd_1 = [...
   2 4 6 8 10; 
   0.0036 0.0134 0.0291 0.0505 0.0773]'; % tube length (cm), dry weight (g) 
units.LWd_1 = {'cm', 'g'};  label.LWd_1 = {'tube length', 'dry weight'};  
bibkey.LWd_1 = 'MannGall1985';
% data for larvae before the pediveliger stage (shape del_Me)
data.LWd_2 = [ ... 
 0.0089 0.0101 0.0105 0.0122 0.0141 0.0158 0.0180 0.0199 0.0209 0.0212 0.0216; 
 0.000000029 0.0000003 0.00000036 0.00000049 0.00000062 0.00000077 0.0000011 0.00000141 0.00000159 0.00000196 0.00000212]'; % Shell length (cm), dry weight (g) 
 units.LWd_2 = {'cm', 'g'}; label.LWd_2 = {'shell length', 'dry weight'}; 
bibkey.LWd_2 = 'MannGall1985';

% weight-respiration of larvae
WdJO = [ 
0.00000030311415	0.56603137
0.00000030792695	0.26643187
0.00000031140368	0.41473943
0.00000036414864	0.1709076
0.00000037497288	0.22033666
0.00000046389383	0.86989694
0.00000046599801	0.26304153
0.00000051541801	1.32783075
0.00000065995736	2.35371191
0.00000068144851	0.59498011
0.00000071441271	0.61758188
0.00000072914631	0.90847125
0.00000103205763	0.70914893
0.0000010551694	    1.59366493
0.00000205968775	1.67710705
0.00000208045758	1.94968663
0.00000210240836	2.53773901
0.00000227111294	3.98558218];
data.WdJO = [WdJO(:,1) WdJO(:,2)*41.19*24e-12];
temp.WdJO = C2K(23) ;units.WdJO = {'g', 'mol/d'};  label.WdJO = {'dry weight', 'O_2 consumption of larvae'}; 
units.temp.WdJO = 'K'; label.temp.WdJO = 'Temperature'; 
bibkey.WdJO = 'MannGall1985';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 5 * weights.Ri;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_1','tL_2'}; subtitle1 = {'Substrate: oak, pine'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body length (= tube length) L_w is assumed to be proportional to squared shell length L_s: L_w = L_s^2/ L_M';
D2 = 'shell length L_s is assumed to be proportional to body diameter L_d = L_s*del_M, with del_s = 8.2/11';
D3 = 'Cubed struct length L^3 = del_M*L_d^2*L_w, Wet weight Ww = L^3*(1+f*ome). So  L_w = (L^3/L_M/del_M/del_s^2)^(1/2)';   
D4 = 'mod_1: more larval data (hatch, birth, settlement, puberty), respiration and growth, length-dry weight';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'a special organ, called the gland of Deshayes, contains symbiotic nitrogen-fixing, cellulase producing bacteria (Teredinibacter turnerae)';
metaData.bibkey.F1 = {'Wiki'}; 
F2 = 'males start producing sperm when a few cm long; they change into females 8 till 10 weeks after settling';
metaData.bibkey.F2 = {'Wiki'}; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '55F29'; % Cat of Life
metaData.links.id_ITIS = '81862'; % ITIS
metaData.links.id_EoL = '46470786'; % Ency of Life
metaData.links.id_Wiki = 'Teredo_navalis'; % Wikipedia
metaData.links.id_ADW = 'Teredo_navalis'; % ADW
metaData.links.id_Taxo = '39953'; % Taxonomicon
metaData.links.id_WoRMS = '141607'; % WoRMS
metaData.links.id_molluscabase = '141607'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Teredo_navalis}}';
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
bibkey = 'Kris1979'; type = 'Article'; bib = [ ... 
'author = {Kristensen, E. Steenstrup}, ' ... 
'year = {1979}, ' ...
'title = {Observations on growth and life cycle of the shipworm \emph{Teredo navalis} {L}. ({B}ivalvia, mollusca) in the {I}sefjord, {D}enmark}, ' ...
'journal = {Ophelia}, ' ...
'doi = {10.1080/00785326.1979.10425501}, ' ...
'volume = {18}, ' ...
'pages = {235--242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaalVeld2011'; type = 'Article'; bib = [ ... 
'author = {Paalvast, P. and Velde, G. van der }, ' ... 
'year = {2011}, ' ...
'title = {Distribution, settlement, and growth of first-year individuals of the shipworm \emph{Teredo navalis} {L}. ({B}ivalvia: {T}eredinidae) in the {P}ort of {R}otterdam area, the {N}etherlands}, ' ...
'journal = {International Biodeterioration \& Biodegradation}, ' ...
'doi = {10.1016/j.ibiod.2010.11.016}, ' ...
'volume = {65}, ' ...
'pages = {379--388}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MannGall1985'; type = 'Article'; bib = [ ... 
'author = {Mann, R. and Gallager, S. M.}, ' ... 
'year = {1985}, ' ...
'title = {Growth, morphometry and biochemical composition of the woodboring molluscs \emph{Teredo navalis} {L}, \emph{Bankia gouldi} ({B}artsch), and \emph{Nototeredo knoxi} ({B}artsch)}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {85}, ' ...
'pages = {229--251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Teredo_navalis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grave1928'; type = 'Article'; bib = [ ... 
'author = {Grave, B. H.}, ' ... 
'year = {1928}, ' ...
'title = {Natural history of shipworm, \emph{Teredo navalis}, at {W}oods {H}ole, {M}assachussets}, ' ...
'journal = {Biological Bulletin}, ' ...
'volume = {55}, ' ...
'number = {4}, '...
'doi = {10.2307/1537080}, '...
'pages = {260-282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grave1942'; type = 'Article'; bib = [ ... 
'author = {Grave, B.H.}, ' ... 
'year = {1942}, ' ...
'title = {The sexual cycle of the shipworm, \emph{Teredo navalis}}, ' ...
'journal = {Biological Bulletin}, ' ...
'volume = {82}, ' ...
'number = {3}, '...
'doi = {10.2307/1537989}, '...
'pages = {438-445}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MannGall1985'; type = 'Article'; bib = [ ... 
'author = {Mann, R. and Gallager, S. M.}, ' ... 
'year = {1985}, ' ...
'title = {Growth, morphometry and biochemical composition of the wood boring molluscs \emph{Teredo navalis} {L}., \emph{Bankia gouldi} ({B}artsch), and \emph{Nototeredo knoxi} ({B}artsch) ({B}ivalvia: {T}eredinidae)}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {85}, ' ...
'number = {}, '...
'doi = {10.1016/0022-0981(85)90160-1}, '...
'pages = {229-251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MannGall1985a'; type = 'Article'; bib = [ ... 
'author = {Mann, R. and Gallager, S. M.}, ' ... 
'year = {1985}, ' ...
'title = {Physiological and biochemical energetics of larvae of \emph{Teredo navalis} {L}. and \emph{Bankia gouldi} ({B}artsch) ({B}ivalvia: {T}eredinidae)}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {85}, ' ...
'number = {}, '...
'doi = {10.1016/0022-0981(85)90159-5}, '...
'pages = {211-228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cull1975'; type = 'Article'; bib = [ ... 
'author = {Culliney, J.L.}, ' ... 
'year = {1975}, ' ...
'title = {Comparative Larval development of the Shipworms \emph{Bankia gouldi} and \emph{Teredo navalis}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {29}, ' ...
'number = {}, '...
'doi = {10.1007/BF00391850}, '...
'pages = {245-251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

