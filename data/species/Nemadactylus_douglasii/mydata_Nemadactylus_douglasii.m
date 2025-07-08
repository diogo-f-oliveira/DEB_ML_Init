function [data, auxData, metaData, txtData, weights] = mydata_Nemadactylus_douglasii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Latridae';
metaData.species    = 'Nemadactylus_douglasii'; 
metaData.species_en = 'Porae'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 01];

%% set data

% zero-variate data

data.am = 23*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'StewHugh2009';   
  temp.am = C2K(16.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'am is likely to be larger';

data.Lp = 24;    units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'StewHugh2009'; 
data.Li = 81;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  1.3 mm: pi/6*0.13^3';
data.Wwi = 4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
    
data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'StewHugh2009';
  temp.GSI = C2K(22.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.721	11.393
1.614	18.641
1.701	17.417
1.792	19.488
1.886	24.856
2.241	25.514
2.740	22.781
3.094	22.497
3.128	26.452
3.155	24.097
3.244	24.945
3.422	25.227
3.655	21.929
3.803	22.306
3.837	26.920
3.865	25.696
3.890	20.893
4.015	27.579
4.022	33.983
4.100	24.659
4.187	22.963
4.205	39.350
4.312	29.367
4.367	25.505
4.573	24.939
4.749	23.809
4.838	24.091
4.897	23.902
5.134	25.314
5.145	35.579
5.284	27.291
5.399	24.465
5.548	25.689
5.755	25.877
5.813	25.500
5.842	24.935
5.844	27.006
5.908	30.867
5.989	23.992
5.992	27.383
6.350	30.772
6.403	25.121
6.586	30.111
6.595	38.305
6.613	27.945
6.762	28.981
6.879	27.756
6.908	27.756
6.910	29.639
6.939	29.262
6.996	27.002
7.177	30.392
7.234	28.696
7.410	27.942
7.441	29.072
7.479	36.889
7.561	31.144
7.614	25.775
7.676	28.318
7.765	28.694
7.791	25.115
7.822	26.622
7.852	27.375
7.883	28.317
7.885	30.483
7.998	25.491
8.086	24.926
8.094	32.837
8.473	28.409
8.476	30.481
8.504	29.633
8.535	31.140
8.536	32.270
8.653	30.763
8.655	32.740
8.679	27.749
8.680	28.690
8.710	29.067
9.125	30.572
9.183	29.254
9.242	29.818
9.420	30.477
9.541	32.643
9.833	29.910
10.596	25.858
10.689	30.378
10.746	28.023
10.867	30.377
10.869	32.637
10.895	29.718
11.223	31.977
11.250	29.999
11.369	30.658
11.525	38.851
11.546	31.128
11.606	31.787
11.721	28.773
11.784	32.634
11.991	32.727
12.079	31.973
12.081	34.516
12.404	32.349
12.526	35.927
12.694	28.110
12.698	31.218
12.754	28.863
12.817	32.159
13.027	35.172
13.069	47.509
13.175	35.830
13.259	31.969
13.294	36.489
13.319	32.722
13.409	33.475
13.590	37.147
13.614	32.156
13.674	33.380
13.851	33.379
14.177	34.131
14.233	31.400
14.238	35.920
14.356	35.732
14.509	41.382
14.652	36.484
14.674	29.326
14.721	46.184
15.005	35.446
15.064	36.011
15.238	32.809
15.648	29.605
15.712	34.031
16.099	37.232
16.688	36.287
19.852	40.984
20.291	37.027
21.293	36.175
22.247	44.742];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.9) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f = C2K(16.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StewHugh2009';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.809	11.298
1.320	19.584
1.405	16.099
1.408	19.584
1.527	20.148
1.554	17.794
1.704	20.053
1.733	19.488
1.762	19.111
1.852	20.241
1.941	20.806
1.943	22.219
1.944	23.443
1.944	23.537
1.970	19.864
1.971	20.900
1.971	21.465
2.034	24.855
2.087	19.487
2.097	28.905
2.177	20.428
2.275	29.469
2.388	24.666
2.416	23.441
2.417	24.195
2.477	25.419
2.534	22.876
2.622	22.593
2.797	20.897
2.828	21.744
2.862	26.453
2.918	22.874
2.918	23.439
2.949	24.852
2.952	27.300
2.985	31.161
3.016	31.821
3.067	24.569
3.102	29.277
3.129	27.676
3.155	24.380
3.162	30.784
3.187	26.640
3.189	28.618
3.224	32.950
3.303	24.662
3.367	29.465
3.394	26.263
3.424	27.298
3.484	28.523
3.513	27.769
3.540	25.603
3.574	29.181
3.628	24.661
3.691	28.616
3.749	27.862
3.802	21.552
3.810	29.651
3.839	28.427
3.901	31.158
3.989	30.969
4.011	23.812
4.014	26.543
4.018	30.310
4.021	32.947
4.046	28.709
4.079	32.381
4.172	36.619
4.173	37.373
4.284	31.156
4.310	27.389
4.344	31.910
4.399	27.860
4.400	28.613
4.437	35.394
4.484	24.940
4.546	27.671
4.572	24.563
4.579	31.061
4.604	26.352
4.608	30.213
4.610	32.379
4.633	25.881
4.636	28.706
4.641	33.227
4.696	29.648
4.724	27.953
4.752	26.822
4.786	31.343
4.789	33.791
4.809	24.939
4.810	25.786
4.814	29.082
4.845	30.777
4.932	29.835
4.990	28.517
4.997	35.109
5.110	30.400
5.113	33.037
5.123	42.737
5.143	33.790
5.146	36.239
5.168	29.081
5.209	40.005
5.288	30.964
5.344	27.856
5.374	28.892
5.403	28.138
5.405	30.022
5.409	33.883
5.430	26.066
5.437	31.999
5.438	33.130
5.439	34.448
5.473	38.498
5.582	30.304
5.584	31.434
5.589	36.708
5.667	27.101
5.674	33.505
5.702	31.339
5.702	32.093
5.703	32.846
5.755	26.348
5.788	28.984
5.889	40.850
5.941	34.164
6.028	32.656
6.033	37.271
6.058	33.221
6.091	36.517
6.178	35.387
6.210	37.365
6.236	33.880
6.267	35.857
6.293	32.467
6.322	31.431
6.322	31.902
6.440	32.184
6.526	29.829
6.533	35.668
6.561	34.632
6.587	31.524
6.601	44.521
6.616	30.300
6.642	27.663
6.645	29.829
6.673	28.416
6.678	33.407
6.681	36.609
6.705	30.770
6.764	31.147
6.765	32.183
6.767	33.501
6.819	27.379
6.884	32.747
6.886	34.537
6.941	30.958
7.004	34.819
7.032	33.406
7.037	37.455
7.093	34.630
7.097	39.245
7.151	33.782
7.210	33.970
7.218	41.693
7.270	35.194
7.325	30.768
7.350	27.189
7.560	29.919
7.653	33.874
7.658	38.583
7.710	32.744
7.711	33.215
7.794	27.846
7.886	31.048
7.946	32.555
7.979	35.003
8.129	37.640
8.135	42.914
8.184	33.496
8.271	32.365
8.374	45.644
8.421	34.719
8.454	38.203
8.520	44.513
8.538	33.494
8.692	39.709
8.716	34.247
8.770	29.820
8.831	31.515
9.245	32.738
9.435	44.698
9.507	28.876
9.633	36.127
9.714	29.157
9.778	33.678
9.960	38.197
9.994	42.624
10.280	34.052
10.282	35.842
10.463	39.420
10.491	37.819
10.635	34.334
10.780	31.884
10.840	33.579
11.228	36.686
11.254	33.483
11.259	38.852
11.295	44.314
11.472	44.031
11.608	33.670
11.612	37.438
11.638	34.330
11.788	36.213
11.845	34.329
11.998	39.790
12.122	45.064
12.157	50.055
12.199	34.422
12.264	39.507
12.291	36.870
12.584	35.173
12.696	29.240
12.710	42.425
12.714	46.568
13.143	33.759
13.263	35.548
13.302	44.212
13.439	34.699
14.038	42.702
14.154	40.441
14.178	35.261
14.269	37.239
14.271	38.934
14.274	41.759
14.460	50.140
15.269	33.939
15.513	41.566
16.275	35.912
17.916	52.481
22.628	41.632];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.9) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth','fork length','males'};  
temp.tL_m = C2K(16.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StewHugh2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01175*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4668K'; % Cat of Life
metaData.links.id_ITIS = '645482'; % ITIS
metaData.links.id_EoL = '46581350'; % Ency of Life
metaData.links.id_Wiki = 'Nemadactylus_douglasii'; % Wikipedia
metaData.links.id_ADW = 'Nemadactylus_douglasii'; % ADW
metaData.links.id_Taxo = '180919'; % Taxonomicon46581352
metaData.links.id_WoRMS = '281651'; % WoRMS
metaData.links.id_fishbase = 'Nemadactylus-douglasii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemadactylus_douglasii}}';  
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
bibkey = 'StewHugh2009'; type = 'article'; bib = [ ...  
'doi = {10.1016/j.fishres.2008.12.005}, ' ...
'author = {John Stewart and Julian M. Hughes}, ' ...
'year = {2009}, ' ...
'title = {Biological and fishery characteristics of rubberlip morwong \emph{Nemadactylus douglasii} ({H}ector, 1875) in eastern {A}ustralia}, ' ... 
 'journal = {Mar. Freshwater Res.}, ' ...
'volume = {96(2/3)}, '...
'pages = {267–274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemadactylus-douglasii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
