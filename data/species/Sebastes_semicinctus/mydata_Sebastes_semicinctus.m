function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_semicinctus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_semicinctus'; 
metaData.species_en = 'Halfbanded rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 21];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 21];

%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 9;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00676*Lp^3.00, see F1';
data.Wwi = 105.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.00, see F1';

data.Ri  = 31e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(9.2);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
0.058	6.879
0.971	10.790
1.893	13.101
2.960	14.596
3.889	15.458
4.989	15.912
5.886	17.406
6.959	17.488
7.890	17.867
8.936	17.763
9.897	17.659
10.884	18.075
11.875	17.488
12.860	18.239
13.880	17.689
14.893	18.477];
data.tL_f(:,1) = 365*(0.9+data.tL_f(:,1)); % convert yr 
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(9.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoveMorr1990';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.085	6.618
0.975	9.786
1.984	11.652
3.025	12.664
3.955	13.117
4.914	13.607
5.872	14.060
6.887	14.588
7.933	14.522
8.948	14.752
9.881	14.722
10.898	14.692
11.917	14.180
12.936	13.778
13.894	14.194];
data.tL_m(:,1) = 365*(0.9+data.tL_m(:,1)); % convert yr 
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(9.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoveMorr1990';
comment.tL_m = 'data for males';

% length-weight
data.LW_f = [ ... length (cm), weight (g)
6.633	2.589
6.751	5.071
6.863	3.514
7.380	5.362
7.496	6.912
7.608	5.355
7.610	6.598
8.012	7.828
8.418	11.545
8.469	7.814
8.530	9.987
8.583	7.500
8.875	11.220
9.275	11.207
9.788	10.881
10.311	16.457
10.425	15.833
10.595	15.206
10.658	18.622
10.768	15.822
10.769	17.065
10.830	19.238
10.998	17.058
11.229	18.604
11.236	22.954
11.346	20.154
11.404	20.774
11.461	20.772
11.464	22.947
11.806	22.004
11.981	24.485
12.097	25.724
12.105	31.006
12.208	23.235
12.264	22.611
12.323	24.163
12.439	25.092
12.503	29.440
12.620	31.301
12.787	28.499
12.848	30.983
13.075	30.044
13.143	36.878
13.424	33.762
13.594	32.824
13.599	35.932
13.601	37.485
13.653	34.066
13.660	38.416
13.663	40.591
13.722	41.832
13.999	35.919
14.008	41.823
14.060	38.403
14.065	41.510
14.110	34.051
14.125	43.373
14.235	40.884
14.298	44.610
14.403	38.703
14.415	46.471
14.455	35.594
14.462	39.634
14.477	49.266
14.517	38.389
14.524	43.050
14.647	48.639
14.756	44.907
14.828	54.848
14.870	45.214
14.929	45.834
14.993	50.804
15.054	52.666
15.096	43.343
15.153	43.341
15.159	47.070
15.267	42.716
15.278	50.173
15.288	56.698
15.292	58.873
15.511	52.652
15.516	56.070
15.526	62.595
15.560	47.679
15.633	57.931
15.637	60.106
15.678	49.850
15.850	50.155
15.856	54.195
15.900	46.114
15.911	52.639
16.047	66.929
16.306	49.831
16.313	54.491
16.319	57.909
16.326	62.259
16.364	50.450
16.480	51.379
16.495	61.011
16.506	68.158
16.509	69.711
16.542	54.484
16.566	69.709
16.617	65.979
16.691	76.542
16.715	55.722
16.727	62.868
16.743	73.122
16.774	56.652
16.786	64.420
16.916	74.670
17.021	68.452
17.067	61.304
17.083	71.869
17.148	76.838
17.201	74.040
17.243	64.095
17.302	65.647
17.374	74.967
17.466	60.981
17.584	62.842
17.711	70.917
17.725	80.238
17.742	91.114
17.761	66.876
17.841	81.478
17.885	73.087
17.938	70.288
17.960	84.581
18.005	76.501
18.080	87.685
18.161	66.863
18.242	81.776
18.285	72.763
18.309	88.299
18.333	66.858
18.345	74.626
18.351	78.665
18.386	101.037
18.446	102.900
18.454	71.515
18.469	80.837
18.634	76.792
18.638	79.589
18.704	85.180
18.802	74.612
18.856	72.435
18.869	81.135
18.920	77.094
18.930	83.308
18.938	88.591
18.939	89.212
19.017	102.571
19.044	83.305
19.223	87.960
19.262	76.151
19.303	102.562
19.336	87.335
19.340	89.821
19.432	112.191
19.522	96.341
19.562	85.775
19.688	92.918
19.854	89.805
20.153	98.186];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'weight', 'females'};  
bibkey.LW_f = 'LoveMorr1990';
%
data.LW_m = [ ... length (cm), weight (g)
6.185	2.984
6.486	4.075
6.885	4.799
7.185	5.525
7.283	3.876
7.284	5.340
7.634	5.881
7.734	6.428
7.983	6.240
7.984	7.704
8.084	7.336
8.233	6.601
8.982	8.598
8.983	9.513
9.383	10.968
9.432	9.686
9.484	12.063
9.683	11.328
9.784	13.338
9.835	14.434
10.032	11.869
10.184	14.793
10.185	15.342
10.436	17.532
10.483	14.055
10.485	16.616
10.533	14.420
10.585	17.529
10.734	16.794
10.735	18.074
10.736	19.355
10.833	16.060
11.234	17.699
11.234	18.064
11.235	18.979
11.236	20.259
11.236	20.991
11.238	23.186
11.436	21.536
11.437	21.902
11.785	20.614
11.838	25.186
11.934	20.428
11.989	26.647
12.035	21.890
12.036	23.353
12.038	25.548
12.189	27.191
12.190	29.021
12.236	24.081
12.385	22.980
12.387	25.358
12.437	26.089
12.441	30.479
12.488	27.551
12.592	31.939
12.637	25.902
12.692	32.852
12.739	28.826
12.888	28.458
12.950	42.725
12.989	29.370
12.991	32.297
13.036	26.442
13.040	31.015
13.142	33.757
13.142	33.757
13.144	35.952
13.190	32.293
13.194	36.500
13.344	36.680
13.389	30.825
13.489	32.104
13.499	43.445
13.589	31.553
13.596	39.785
13.596	40.150
13.637	30.089
13.640	33.381
13.642	35.576
13.745	39.233
13.791	35.025
13.835	28.438
13.842	35.938
13.843	37.767
13.847	41.792
13.847	41.975
13.948	44.168
14.038	32.093
14.043	37.763
14.043	38.312
14.140	34.652
14.145	40.688
14.197	43.980
14.248	45.259
14.296	42.697
14.345	41.233
14.388	33.915
14.393	39.037
14.440	35.926
14.446	42.877
14.447	44.889
14.450	47.816
14.498	45.803
14.544	40.863
14.641	37.385
14.800	48.724
14.844	41.589
14.891	39.027
14.896	44.148
14.898	47.075
14.901	50.551
14.940	38.111
15.047	45.975
15.090	37.742
15.093	41.949
15.152	52.192
15.195	43.959
15.204	55.301
15.248	48.349
15.249	49.080
15.249	49.995
15.293	42.494
15.348	47.981
15.401	52.004
15.445	45.052
15.452	53.832
15.492	42.307
15.546	46.330
15.551	52.733
15.603	55.110
15.640	39.926
15.643	43.584
15.699	51.449
15.848	50.166
15.851	53.275
15.949	51.993
16.144	45.952
16.303	58.022
16.347	50.156];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'weight', 'males'};  
bibkey.LW_m = 'LoveMorr1990';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
11.703	3544.668
12.973	6311.237
14.118	9510.087
14.313	12363.110
14.681	6829.971
14.763	15907.778
15.316	8386.167
15.517	13832.853
15.523	16426.511
15.585	15907.778
15.640	12017.288
16.094	17636.885
16.095	17896.254
16.415	19625.357
16.538	18328.530
16.548	22651.296
16.599	17118.156
16.658	15129.680
16.864	22737.749
16.922	20317.001
16.989	22046.109
17.045	18501.441
17.051	21440.922
17.169	17463.974
17.420	16772.334
17.423	18069.161
17.430	21527.375
17.438	25244.954
17.440	26282.421
17.553	19711.815
17.748	22132.562
17.812	22651.296
17.932	19711.815
17.949	27752.159
18.452	26368.874
18.512	25072.043
18.640	25417.865
18.827	24380.403
18.841	30778.098
19.020	25850.141
19.335	25417.865
20.156	25072.043];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(9.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'The length-weight relationship of fishbase is inaccurate, so data ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.00676*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7Q2'; % Cat of Life
metaData.links.id_ITIS = '166762'; % ITIS
metaData.links.id_EoL = '46568194'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_semicinctus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_semicinctus'; % ADW
metaData.links.id_Taxo = '187333'; % Taxonomicon
metaData.links.id_WoRMS = '274851'; % WoRMS
metaData.links.id_fishbase = 'Sebastes_semicinctus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_semicinctus}}';
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
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins},' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-semicinctus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
