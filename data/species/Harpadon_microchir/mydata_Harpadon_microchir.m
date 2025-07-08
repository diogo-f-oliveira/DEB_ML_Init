function [data, auxData, metaData, txtData, weights] = mydata_Harpadon_microchir
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Aulopiformes'; 
metaData.family     = 'Synodontidae';
metaData.species    = 'Harpadon_microchir'; 
metaData.species_en = 'Bombay duck'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE', 'MPW'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 02];

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';    label.am = 'life span';  bibkey.am = 'LiaoLin2010';  
  temp.am = C2K(27.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 16;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females';    bibkey.Lp = 'guess';
  comment.Lp = 'based on WN data';
data.Li = 70;   units.Li = 'cm';   label.Li = 'ultimate total length for females';      bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                  bibkey.Wwb = 'LiaoLuo2014';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwi = 1000; units.Wwi = 'g';   label.Wwi = 'wet weight at 33 cm total length female'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on WN data';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.712	9.186
1.929	11.922
1.940	13.876
2.013	12.117
2.121	15.049
2.182	11.922
2.302	14.853
2.303	14.072
2.375	15.440
2.423	14.463
2.483	16.026
2.507	14.853
2.531	16.808
2.567	17.199
2.579	18.762
2.604	16.221
2.651	20.521
2.652	18.176
2.699	19.935
2.711	24.430
2.736	16.612
2.748	18.176
2.760	20.912
2.796	19.935
2.821	16.808
2.832	21.889
2.845	18.762
2.868	20.912
2.893	17.980
2.929	17.980
2.940	21.889
2.977	19.739
2.978	18.762
3.025	23.453
3.038	19.349
3.039	15.831
3.049	20.912
3.098	20.326
3.122	19.935
3.133	24.625
3.134	22.671
3.182	20.130
3.218	21.303
3.219	18.958
3.220	18.371
3.242	22.476
3.254	24.821
3.266	21.303
3.314	23.453
3.338	24.430
3.351	22.671
3.387	24.430
3.411	22.085
3.447	25.798
3.471	26.189
3.484	21.107
3.507	23.257
3.508	20.130
3.519	24.235
3.567	25.407
3.568	20.912
3.579	26.775
3.592	23.257
3.605	19.153
3.639	28.143
3.640	24.039
3.664	25.603
3.701	22.866
3.736	26.971
3.761	23.453
3.772	27.557
3.786	20.130
3.787	17.590
3.810	19.739
3.821	25.212
3.833	27.166
3.834	22.866
3.845	23.844
3.881	28.143
3.893	26.189
3.894	25.407
3.941	28.143
3.990	23.453
4.003	21.889
4.050	27.557
4.061	30.293
4.062	25.016
4.086	25.993
4.087	22.671
4.134	29.707
4.182	28.143
4.230	30.684
4.231	28.925
4.290	30.489
4.351	29.902
4.364	25.407
4.375	29.121
4.424	26.189
4.425	23.257
4.484	29.511
4.494	36.352
4.508	26.775
4.532	27.752
4.616	32.052
4.617	29.707
4.689	29.121
4.798	28.730
4.821	34.007
4.834	27.752
4.917	35.179
4.930	28.730
5.015	30.098
5.026	32.052
5.027	31.661
5.050	34.788
5.087	32.248
5.147	34.202
5.195	33.420
5.196	32.248
5.279	34.007
5.280	32.834
5.352	34.202
5.364	35.375
5.425	32.052
5.436	33.420
5.449	31.466
5.472	38.306
5.484	35.765
5.520	35.570
5.521	31.270
5.557	35.375
5.568	36.938
5.581	36.743
5.606	32.834
5.607	31.075
5.702	34.788
5.774	37.134
5.859	34.593
5.870	38.111
5.904	51.205
5.907	33.616
6.003	37.720
6.100	36.547
6.209	32.248
6.425	37.915
6.462	35.961
7.003	42.997];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth','fork length','female'};  
temp.tL_f = C2K(27.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LiaoLin2010'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.820	10.204
1.869	11.837
1.882	14.082
1.930	13.265
2.026	12.449
2.062	11.224
2.112	13.265
2.184	13.265
2.222	16.531
2.294	15.510
2.330	15.510
2.352	11.633
2.403	16.122
2.488	16.531
2.491	20.204
2.512	15.102
2.549	17.347
2.584	15.102
2.611	19.184
2.633	15.918
2.658	17.551
2.707	17.551
2.708	18.571
2.709	21.020
2.756	19.184
2.779	17.959
2.793	20.000
2.814	15.714
2.863	16.735
2.865	19.796
2.988	22.857
2.999	21.633
3.010	19.388
3.012	23.469
3.021	18.571
3.045	17.347
3.060	22.245
3.083	20.612
3.105	17.347
3.107	19.796
3.134	24.286
3.156	21.224
3.203	18.367
3.204	18.980
3.205	22.653
3.229	21.429
3.264	20.612
3.275	17.551
3.278	22.449
3.280	25.714
3.313	20.204
3.375	23.878
3.384	18.571
3.409	19.592
3.435	22.857
3.472	23.673
3.507	22.449
3.529	18.980
3.557	24.490
3.558	25.714
3.559	27.755
3.616	21.837
3.629	23.061
3.630	25.510
3.653	24.082
3.689	22.449
3.711	18.776
3.762	23.265
3.763	25.306
3.777	27.959
3.797	21.633
3.811	24.082
3.847	24.694
3.858	22.245
3.873	26.735
3.920	25.102
3.930	22.245
3.939	16.735
3.941	20.408
3.945	26.531
4.017	26.122
4.076	23.878
4.137	24.490
4.164	29.388
4.211	25.714
4.222	24.490
4.260	26.735
4.261	27.551
4.333	28.163
4.380	26.122
4.403	23.265
4.405	27.143
4.407	30.408
4.453	26.122
4.562	27.551
5.071	29.592
5.289	30.408
5.354	36.735
5.374	30.408
5.680	36.939
5.738	31.837];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','fork length','male'};  
temp.tL_m = C2K(27.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LiaoLin2010';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
4.837	1.375
5.717	1.375
6.094	1.375
6.220	0.000
6.785	4.126
7.162	1.375
7.727	2.750
8.104	1.375
8.544	2.750
8.733	2.751
9.047	4.126
9.172	1.375
9.424	2.750
9.738	1.126
10.115	4.126
10.366	8.251
10.617	6.876
11.309	0.000
11.371	8.251
11.873	11.002
12.063	0.000
12.439	5.501
12.816	11.002
12.817	6.126
13.318	9.627
13.759	0.000
13.821	9.627
14.197	16.503
14.387	2.750
14.952	8.251
15.391	17.878
15.518	2.750
15.894	16.503
16.083	11.002
16.523	6.876
16.647	19.253
17.088	6.876
17.340	4.126
17.527	19.253
17.967	17.878
17.968	4.126
18.029	26.130
18.407	8.251
18.720	26.130
18.972	13.752
19.285	30.255
19.600	15.128
20.101	39.882
20.102	26.130
20.605	20.629
21.106	46.758
21.421	31.631
22.048	49.509
22.176	20.629
22.363	31.631
22.488	46.758
23.242	37.132
23.303	57.760
23.809	26.130
23.993	71.513
24.058	48.134
24.749	55.010
24.936	70.138
25.313	66.012
25.567	33.006
25.629	50.884
25.751	85.265
26.320	53.635
26.443	74.263
26.572	39.882
26.945	88.016
26.947	64.637
27.258	103.143
27.448	75.639
27.824	92.141
28.262	111.395
28.326	101.768
28.517	75.639
28.830	85.265
29.204	112.770
29.457	99.018
29.895	114.145
30.212	90.766
30.336	105.894
30.395	145.776
30.711	127.898
31.024	141.650
31.341	108.644
31.778	140.275
32.027	158.153
32.031	123.772
32.532	137.525
32.784	126.523
33.030	185.658
33.220	166.405
33.222	148.527
33.532	196.660
33.661	162.279
34.035	187.033
34.476	177.407
34.791	163.654
35.103	195.285
35.170	149.902
35.608	166.405
35.793	202.161
36.300	159.528
36.360	189.784
36.481	240.668
36.672	211.788
37.555	170.530
37.736	257.171
37.865	217.289
42.624	397.446
50.838	580.354];
units.LW = {'cm', 'g'}; label.LW = {'fork length','weight'};  
bibkey.LW = 'LiaoLin2010';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
277.085	161383.574
296.132	316850.015
326.311	251990.011
334.263	284370.248
353.032	187137.473
355.128	247608.085
368.497	379328.703
372.259	290767.666
381.596	256190.295
382.860	223790.152
391.390	422475.793
393.806	390073.163
398.265	433260.066
402.393	238866.724
406.411	409484.384
409.726	450513.965
421.597	348976.399
425.676	502315.376
441.250	329495.506
446.030	279809.166
454.244	236594.942
463.926	435278.095
472.058	415822.084
481.971	547550.167
486.077	359636.308
492.280	564806.506
492.474	508650.588
498.675	381207.340
528.741	348744.991
532.819	502083.968
541.994	847636.495
545.709	439421.099
550.004	530124.578
550.835	622995.382
556.152	417800.302
557.013	502031.714
558.673	355159.827
567.942	340021.048
581.640	376708.514
586.713	575401.670
591.650	480358.614
603.432	404739.221
614.513	532145.096
617.994	858271.496
646.599	581751.811
688.659	745807.852
759.924	793170.132
762.631	676533.600
878.245	892266.639
906.925	594148.526];
units.WN = {'g', '#'}; label.WN = {'weight','fecundity'};  
temp.WN = C2K(27.8);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'LiaoLuo2014'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = .1;

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
F1 = 'length-weight: Ww in g = 0.00468*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'benthopelagic; very phosphorescent';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3JS7K'; % Cat of Life
metaData.links.id_ITIS = '644782'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Harpadon_microchir'; % Wikipedia
metaData.links.id_ADW = 'Harpadon_microchir'; % ADW
metaData.links.id_Taxo = '176125'; % Taxonomicon
metaData.links.id_WoRMS = '277384'; % WoRMS
metaData.links.id_fishbase = 'Harpadon-microchir'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Harpadon_microchir}}';
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
bibkey = 'LiaoLin2010'; type = 'article'; bib = [ ...
'author = {Liao, Y.-Y. and Y.-T. Lin}, ' ... 
'year   = {2010}, ' ...
'title  = {Age and growth of the bombay-duck (\emph{Harpadon microchir}) in the waters off southwestern {T}aiwan}, ' ...
'journal = {Journal of the Fisheries Society of Taiwan}, ' ...
'page = {121-134}, ' ...
'volume = {37(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiaoLuo2014'; type = 'article'; bib = [ ...
'doi = {10.6119/JMST-013-1211-1}, ' ...
'author = {Yih-Yia Liao and Shun-Ren Luo and Kwang-Ming Liu}, ' ... 
'year   = {2014}, ' ...
'title  = {REPRODUCTIVE BIOLOGY OF THE BOMBAY-DUCK \emph{Harpadon microchir} IN THE COASTAL WATERS OFF SOUTHWESTERN {T}AIWAN}, ' ...
'journal = {Journal of Marine Science and Technology}, ' ...
'page = {658-665}, ' ...
'volume = {22(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Harpadon-microchir}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

