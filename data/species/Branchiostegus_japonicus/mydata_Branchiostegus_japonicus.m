function [data, auxData, metaData, txtData, weights] = mydata_Branchiostegus_japonicus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Latilidae';
metaData.species    = 'Branchiostegus_japonicus'; 
metaData.species_en = 'Horsehead tilefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 06];

%% set data
% zero-variate data
data.ab = 8; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(18.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18.8);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 21.4;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 46;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ChoiKim2004';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 138.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01072*Lp^3.09, see F1';
data.Wwi = 1473;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^3.09, see F1';
 
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'ChoiKim2004';
  temp.GSI = C2K(18.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'GSI is 0.02, but 2 spawnings per yr';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm)
    1 10.77  7.57
    2 17.69 16.22
    3 22.50 22.49
    4 25.46 27.08
    5 27.91 30.71
    6 31.37 34.03
    7 35.86 38.01
    8 NaN   40.69
    9 NaN   45.73];
data.tL_fm(:,1) = (0 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  treat.tL_fm = {1, {'female','male'}};
  temp.tL_fm = C2K(18.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'YooChoi2008';

% length-weight
data.LW_f = [ ... % time since hatch (yr), total length (cm)
19.199	85.364
20.442	103.347
20.925	98.492
21.340	134.607
21.478	111.705
21.616	123.743
21.892	118.904
22.169	124.908
22.307	144.175
22.721	165.832
22.721	126.073
22.721	134.507
22.790	116.430
22.928	153.769
23.135	150.140
23.273	183.865
23.273	168.202
23.343	135.667
23.550	162.158
23.619	127.213
23.895	176.591
24.033	168.147
24.033	146.460
24.378	191.014
24.378	150.050
24.586	157.264
24.655	181.355
24.724	198.218
25.000	186.149
25.138	166.862
25.207	228.303
25.345	207.811
25.552	260.808
25.552	193.338
25.691	248.750
25.691	176.461
25.760	221.034
26.036	194.508
26.105	234.262
26.105	213.780
26.381	204.122
26.519	277.606
26.588	247.480
26.588	235.432
26.657	212.536
26.727	261.928
26.865	224.569
27.003	240.222
27.210	320.930
27.486	298.018
27.486	287.175
27.486	269.102
27.486	226.934
27.555	253.435
28.039	335.327
28.177	264.233
28.246	307.602
28.246	283.505
28.384	248.555
28.522	347.341
28.591	275.046
28.660	294.319
28.798	328.044
28.867	338.882
28.936	308.757
29.006	348.511
29.144	366.573
29.144	283.440
29.834	333.993
29.903	368.928
30.041	309.881
30.318	358.054
30.387	435.158
30.387	319.495
30.525	426.714
30.594	347.191
30.801	402.598
31.146	366.428
31.285	433.888
31.561	415.796
31.630	460.369
31.630	391.694
31.768	439.877
31.906	472.397
32.320	406.102
32.320	379.596
33.218	483.146
33.218	455.435
34.392	505.952
36.464	626.285
37.086	587.685
37.293	628.634
37.362	568.388
37.569	698.494];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'YooChoi2008';
%
data.LW_m = [ ... % time since birth (yr), total length (cm)
20.280	110.268
21.341	147.946
21.346	124.382
22.199	131.431
22.411	142.030
22.764	160.872
23.123	144.369
23.404	163.214
23.904	153.776
24.186	173.799
24.473	158.476
24.894	196.168
24.962	216.196
25.250	199.695
25.462	207.937
25.537	186.728
26.104	203.209
26.314	223.234
26.523	250.327
26.813	220.865
27.236	243.241
27.518	259.729
27.597	217.312
27.728	278.576
27.737	230.269
27.945	264.432
28.009	303.311
28.019	246.757
28.165	227.903
28.304	247.929
28.371	269.135
28.374	251.462
29.007	298.575
29.011	276.189
29.214	333.916
29.218	312.709
29.511	269.108
29.650	289.134
29.711	346.865
29.789	305.626
29.923	356.285
29.928	323.296
30.004	296.195
30.140	336.251
30.364	279.692
30.423	346.848
30.500	315.035
30.562	363.340
30.773	379.829
30.853	329.165
30.908	421.063
30.993	343.300
31.054	402.209
31.063	353.902
31.080	256.111
31.353	320.906
31.428	302.053
31.487	370.387
31.833	424.576
31.840	385.695
31.918	349.169
32.107	488.193
32.126	383.332
32.130	359.768
32.256	452.843
32.328	445.772
32.359	273.754
32.609	471.686
32.622	395.103
32.831	424.553
32.905	409.234
32.974	419.837
33.101	503.486
33.250	471.671
33.309	538.827
33.395	456.351
33.397	444.569
33.465	463.418
33.746	484.620
34.023	525.850
34.090	552.947
34.241	502.281
34.293	613.031
34.442	574.147
34.453	515.236
34.521	530.551
34.938	591.808
35.011	577.668
35.156	564.704
35.310	501.078
35.359	623.609
35.366	585.907
35.438	578.836
35.516	545.844
35.780	662.480
35.911	722.566
35.941	558.795
36.148	596.492
36.233	516.372
36.508	571.741
36.996	630.640
37.272	683.653
37.336	723.710
37.630	668.328
37.829	753.154
37.910	700.133
38.331	735.469
38.836	697.754
39.749	770.781];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'YooChoi2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.LW_f = weights.LW_f * 5;
weights.LW_m = weights.LW_m * 5;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01072*(TL in cm)^3.09'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'N6R4'; % Cat of Life
metaData.links.id_ITIS = '645602'; % ITIS
metaData.links.id_EoL = '46580683'; % Ency of Life
metaData.links.id_Wiki = 'Branchiostegus_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Branchiostegus_japonicus'; % ADW
metaData.links.id_Taxo = '164600'; % Taxonomicon
metaData.links.id_WoRMS = '276739'; % WoRMS
metaData.links.id_fishbase = 'Branchiostegus-japonicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Branchiostegus_japonicus}}';  
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
bibkey = 'YooChoi2008'; type = 'Article'; bib = [ ...
'author = {Joon Taek Yoo and Young Min Choi and Yeong Hye Kim and Jung Hwa Choi}, ' ...
'year = {2008}, ' ...
'title = {Age and growth of the red tilefish, \emph{Branchiostegus japonicus} in the northern {E}ast {C}hina {S}ea}, ' ... 
'journal = {Journal of Environmental Biology}, ' ...
'volume = {29(4)}, '...
'pages = {437-441}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChoiKim2004'; type = 'Article'; bib = [ ...
'author = {Jeong-Kwueon Choi and Han-Jun Kim and Chang-Beom Park and Chi-Hoon Lee and Young-Bo Song and Kyeong-Jun Lee and In-Kyu Yeo Jung-Uie Lee and Dae-Soo Chang and Dong-Soo Ha and Young-Don Lee}, ' ...
'year = {2004}, ' ...
'title = {Annual Reproductive Cycle and Sexual Characteristics of Horsehead \emph{Branchiostegus japonicus}}, ' ... 
'journal = {Korean J. Ichthyol.}, ' ...
'volume = {16(4)}, '...
'pages = {282~294}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Branchiostegus-japonicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

