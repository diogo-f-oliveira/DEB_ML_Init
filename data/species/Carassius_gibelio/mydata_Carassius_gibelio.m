  function [data, auxData, metaData, txtData, weights] = mydata_Carassius_gibelio

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Carassius_gibelio'; 
metaData.species_en = 'Prussian carp'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L_f'; 'L-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 01 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 18]; 

%% set data
% zero-variate data
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase'; 
  comment.Lp = 'converted from total length of 10.36 cm, based om SL = 0.82*TL from photo';
data.Li = 38;    units.Li = 'cm'; label.Li = 'ultimate standard length';          bibkey.Li = 'fishbase';
  comment.Li = 'converted from total length of 46.6 cm, based om SL = 0.82*TL from photo';

data.Wwb = 5.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm of Carassius carassius: 4/3*pi*0.05^3';

data.Ri = 18e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';              bibkey.Ri = 'fishbase';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
0.990	11.040
0.990	11.426
0.990	11.658
0.990	11.813
0.990	12.122
0.990	12.122
0.991	12.431
0.991	13.049
1.005	10.731
1.976	13.272
1.991	13.736
1.992	15.667
2.006	13.967
2.006	14.199
2.006	14.354
2.006	14.431
2.006	14.894
2.007	15.667
2.964	19.367
2.964	19.522
2.964	19.754
2.979	19.213
3.006	15.195
3.007	15.736
3.007	15.890
3.007	16.122
3.007	16.431
3.007	16.586
3.007	16.817
3.007	17.358
3.007	17.667
3.008	17.976
3.008	17.976
3.008	18.208
3.008	18.594
3.008	18.672
3.008	18.904
3.008	20.140
3.009	20.449
3.979	19.977
3.994	20.440
3.994	20.749
3.994	21.136
3.994	21.522
3.995	22.449
3.995	23.608
4.009	21.985
4.009	22.604
4.010	22.835
4.010	23.067
4.010	23.222
4.010	23.685
4.010	23.917
4.995	23.522
4.995	23.831
4.997	27.694
4.997	27.926
5.010	24.140
5.011	25.995
5.011	26.922
5.011	27.231
5.012	28.930
5.025	24.449
5.025	24.526
5.025	24.990
5.040	24.758
5.040	25.144
5.055	25.608
6.011	25.522
6.011	25.909
6.011	26.063
6.011	26.449
6.011	26.604
6.011	26.759
6.011	26.990
6.011	27.068
6.011	27.299
6.012	27.686
6.012	28.845
6.998	29.068
6.998	29.300
6.998	29.532
7.012	28.141
7.012	28.450
7.012	28.991
7.013	30.613
7.013	30.922
7.013	30.999
7.013	31.463
7.013	31.463
7.042	30.149
8.013	29.986
8.013	31.532
8.014	32.845
8.027	29.677];
data.tL(:,1) = 365 * (0.75+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length', 'Gruza Reservoir'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MariLuji2016';
comment.tL = 'Data from Gruza Reservoir';
%
data.tL1 = [ ... % time since birth (yr), standard length (cm)
0.958	9.380
0.958	9.892
0.969	10.404
1.984	11.711
1.984	12.296
1.984	12.516
1.984	12.735
1.984	12.882
1.984	13.174
1.984	13.467
1.984	15.735
1.995	13.979
1.995	14.052
1.995	14.125
1.995	14.345
1.995	14.418
1.995	14.638
2.987	18.432
2.987	18.725
2.987	19.017
2.987	20.042
2.998	14.993
2.998	15.286
2.998	15.725
2.998	16.310
2.998	17.042
2.998	17.408
2.998	17.627
2.998	17.920
2.998	17.993
2.998	18.139
2.998	18.286
2.998	19.530
2.998	19.822
3.979	17.836
3.990	17.909
3.990	18.495
3.990	19.300
3.990	19.300
3.990	19.665
3.990	19.739
3.990	19.885
3.990	20.178
3.990	20.251
3.990	20.470
3.990	20.470
3.990	21.056
3.990	21.495
4.971	19.582
4.982	19.289
4.982	20.240
4.982	20.680
4.982	21.045
4.982	21.045
4.982	21.338
4.982	21.484
4.982	21.631
4.982	21.923
4.982	22.143
4.993	18.777
5.951	23.084
5.974	24.840
5.974	26.303
5.974	26.596
5.974	27.108
5.985	23.669
5.985	23.962
5.985	24.181
5.985	24.401
5.985	24.547
5.985	25.132];
data.tL1(:,1) = 365 * (0.75+data.tL1(:,1)); % convert yr to d
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'standard length', 'Meduvrsje Reservoir'};  
temp.tL1 = C2K(20);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'MariLuji2016';
comment.tL1 = 'Data from Meduvrsje Reservoir';

% length-weight
data.LW = [ ... % standard length (cm), wet weight (g)
10.675	46.222
10.942	49.778
11.388	56.889
11.611	32.000
11.834	56.889
11.834	32.000
12.503	56.889
12.949	42.667
13.038	67.556
13.216	56.889
13.394	74.667
13.395	49.778
13.483	103.111
13.528	78.222
13.796	46.222
13.974	88.889
13.974	71.111
14.062	106.667
14.107	113.778
14.198	49.778
14.419	99.556
14.420	81.778
14.865	92.444
15.044	85.333
15.088	99.556
15.713	85.333
15.890	131.556
15.891	99.556
15.935	113.778
16.292	120.889
16.470	120.889
16.471	99.556
16.649	117.333
16.960	138.667
17.317	142.222
17.406	142.222
17.450	170.667
17.763	142.222
17.896	174.222
17.897	138.667
18.029	174.222
18.030	156.444
18.073	213.333
18.431	184.889
18.743	184.889
18.964	256.000
18.966	184.889
18.966	170.667
18.967	128.000
19.054	199.111
19.409	280.889
19.411	224.000
19.411	202.667
19.411	192.000
19.412	163.556
19.413	145.778
19.858	156.444
19.901	213.333
19.902	195.556
20.081	184.889
20.393	184.889
20.433	327.111
20.436	241.778
20.437	199.111
20.658	256.000
20.923	348.444
20.925	284.444
20.926	252.444
20.927	231.111
20.972	209.778
21.416	280.889
21.505	273.778
21.507	227.556
21.507	213.333
21.862	284.444
21.950	312.889
21.951	270.222
21.952	252.444
22.173	298.667
22.351	316.444
22.395	359.111
22.397	284.444
22.440	341.333
22.441	295.111
22.485	320.000
22.885	359.111
23.020	316.444
23.024	199.111
23.066	270.222
23.197	369.778
23.199	295.111
23.376	369.778
23.421	355.556
23.422	298.667
23.554	355.556
23.555	344.889
23.642	398.222
23.867	355.556
23.909	444.444
23.909	437.333
23.909	426.667
23.954	416.000
23.955	398.222
23.955	369.778
23.957	302.222
24.044	384.000
24.400	408.889
24.401	398.222
24.447	330.667
24.489	416.000
24.490	384.000
24.667	426.667
24.846	401.778
24.847	384.000
24.891	408.889
24.934	451.556
24.935	419.556
25.019	625.778
25.024	426.667
25.201	472.889
25.202	455.111
25.379	497.778
25.425	462.222
25.470	448.000
25.557	522.667
25.558	483.556
25.779	533.333
25.911	597.333
25.914	483.556
25.957	544.000
25.958	504.889
25.960	444.444
26.091	551.111
26.266	654.222
26.315	512.000
26.448	540.444
26.452	416.000
26.491	583.111
26.536	568.889
26.719	437.333
26.804	583.111
26.853	426.667
26.892	622.222
26.977	775.111
26.978	711.111
26.980	647.111
26.983	544.000
26.984	497.778
27.386	494.222
27.426	643.556
27.426	640.000
27.428	590.222
27.468	760.889
27.468	736.000
27.517	597.333
27.873	608.000
27.916	682.667
27.957	803.556
27.963	583.111
27.964	554.667
28.048	753.778
28.052	611.556
28.093	721.778
28.097	576.000
28.495	686.222
28.936	896.000
28.941	707.556
28.944	600.889
28.945	568.889
29.203	896.000
29.606	849.778
30.006	899.556
30.052	824.889
30.496	910.222
30.498	853.333
30.546	732.444
31.029	992.000
31.257	803.556
31.386	988.444
31.523	856.889
32.944	1095.111];
units.LW = {'cm', 'g'}; label.LW = {'standard length', 'wet weight', 'Gruza Reservoir'};  
bibkey.LW = 'MariLuji2016';
comment.LW = 'Data from Gruza Reservoir';
%
data.LW1 = [ ... % standard length (cm), wet weight (g)
9.508	48.105
9.977	41.846
10.412	68.257
10.513	30.916
11.484	40.173
11.484	49.507
12.020	68.132
12.087	51.015
12.456	49.431
12.657	74.304
12.824	78.958
12.824	64.958
13.226	55.594
13.260	80.480
13.394	69.580
13.595	78.898
13.930	92.872
14.030	66.420
14.164	91.298
14.198	80.407
14.566	80.378
14.901	114.574
15.270	119.212
15.672	97.403
15.672	144.070
15.806	111.393
16.509	150.227
16.543	133.113
17.012	125.299
17.045	164.185
17.112	209.291
17.179	142.397
17.246	151.725
17.246	199.948
17.447	162.599
17.514	136.149
17.514	178.149
17.581	162.588
17.648	167.250
17.782	179.684
17.816	198.348
17.950	175.004
17.950	157.893
18.084	154.771
18.117	140.769
18.184	140.763
18.218	164.094
18.285	192.089
18.318	140.753
18.352	164.084
18.352	179.639
18.419	170.301
18.486	201.407
18.519	139.182
18.553	160.957
18.620	179.618
18.720	170.277
18.720	179.611
18.787	258.939
18.854	178.045
18.854	185.822
18.888	265.153
18.988	148.479
19.122	167.135
19.156	185.799
19.156	202.910
19.156	213.799
19.189	283.796
19.256	165.569
19.323	162.453
19.323	221.564
19.323	227.786
19.424	157.778
19.424	185.778
19.491	224.662
19.524	173.326
19.558	224.657
19.692	209.091
19.792	252.638
19.792	190.416
19.826	233.969
19.893	246.408
19.960	216.848
19.960	177.959
19.993	244.845
19.993	176.401
20.060	191.951
20.060	187.284
20.161	229.276
20.161	223.054
20.228	191.938
20.295	272.822
20.295	204.377
20.328	218.374
20.328	213.708
20.462	223.031
20.529	297.692
20.596	215.242
20.630	210.573
20.663	249.460
20.764	224.563
20.898	230.775
20.998	205.878
20.998	221.433
20.998	247.878
20.998	255.656
21.233	238.526
21.333	255.630
21.467	280.508
21.501	213.617
21.534	221.392
21.534	300.725
21.568	296.056
21.601	277.387
21.668	235.381
21.769	280.485
21.869	247.810
22.037	336.464
22.137	250.900
22.908	331.729
23.042	313.052
23.712	336.334
23.812	558.770
24.114	379.858
24.382	409.393
24.482	351.829
24.985	396.901
25.152	382.888
26.191	418.585
26.593	420.109
26.995	527.411];
units.LW1 = {'cm', 'g'}; label.LW1 = {'standard length', 'wet weight', 'Meduvrsje Reservoir'};  
bibkey.LW1 = 'MariLuji2016';
comment.LW1 = 'Data from Meduvrsje Reservoir';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.LW = 3 * weights.LW;
weights.tL1 = 3 * weights.tL1;
weights.LW1 = 3 * weights.LW1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from Gruza, Meduvrsje Reservoir'};
set2 = {'LW','LW1'}; subtitle2 = {'Data from Gruza, Meduvrsje Reservoir'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Links
metaData.links.id_CoL = 'R32T'; % Cat of Life
metaData.links.id_ITIS = '688850'; % ITIS
metaData.links.id_EoL = '215509'; % Ency of Life
metaData.links.id_Wiki = 'Carassius_gibelio'; % Wikipedia
metaData.links.id_ADW = 'Carassius_gibelio'; % ADW
metaData.links.id_Taxo = '165448'; % Taxonomicon
metaData.links.id_WoRMS = '234033'; % WoRMS
metaData.links.id_fishbase = 'Carassius-gibelio'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carassius_gibelio}}';  
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
bibkey = 'MariLuji2016'; type = 'Article'; bib = [ ...  
'author = {Zoran Marinovi\''{c} and Jelena Luji\''{c}c and Violeta Boli\''{c}-Trivunovi\''{c} and Goran Markovi\''{c}}, ' ...
'year = {2016}, ' ...
'title = {Comparative study of growth in \emph{Carassius gibelio} ({B}loch, 1782) and \emph{Rutilus rutilus} ({L}., 1758) from two {S}erbian reservoirs: Multi-model analysis and inferences}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {173}, '...
'pages = {11-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Carassius-gibelio.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

