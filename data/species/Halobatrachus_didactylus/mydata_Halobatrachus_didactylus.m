  function [data, auxData, metaData, txtData, weights] = mydata_Halobatrachus_didactylus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Batrachoidiformes'; 
metaData.family     = 'Batrachoididae';
metaData.species    = 'Halobatrachus_didactylus'; 
metaData.species_en = 'Lusitanian toadfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'; 'L-N'; 'Ww-N'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 05 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 24]; 

%% set data
% zero-variate data
data.ab = 80;     units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'Wiki'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'from Opsanus tau';
data.ap = 3*365;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'Wiki';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'from Opsanus tau; temp is guessed';
data.am = 20*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.638; units.L0 = 'cm';  label.L0 = 'egg diameter';           bibkey.L0 = 'PalaSara2001'; 
data.Lb = 1.55;   units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'Wiki'; 
  comment.Lb = 'from Opsanus tau';
data.Lp = 26.2;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'PalaSara2001'; 
data.Li = 50;     units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

%data.W0 = 0.10;  units.W0 = 'g';   label.Wb = 'wet weight of egg';      bibkey.Wb = 'Wiki';
     
% uni-variate data
% L-Ww data from PalaSara2001
data.LW = [ ... % total length (cm), wet weight (g)
13.734	47.713
14.062	35.714
14.251	50.653
15.097	50.568
15.710	65.465
15.804	65.455
16.039	71.415
16.040	80.389
15.991	47.488
16.227	65.413
16.886	71.330
16.933	74.317
17.357	86.241
17.498	80.244
17.639	86.212
17.874	89.180
18.204	101.113
18.297	83.155
18.533	101.080
18.581	110.050
18.958	115.995
19.099	115.981
19.051	107.012
19.003	98.042
19.428	112.957
19.615	97.981
19.803	106.937
19.804	115.911
19.758	124.890
19.758	133.864
19.665	148.831
19.807	154.800
20.180	118.865
20.134	121.861
20.135	136.818
20.323	145.774
20.370	136.795
20.557	124.810
20.934	130.756
20.934	142.721
20.935	151.696
20.983	172.631
20.513	166.695
21.073	109.802
21.357	136.696
21.405	154.640
21.641	163.591
21.642	178.548
21.781	142.637
22.158	151.574
22.158	163.540
22.018	169.536
22.349	196.427
22.394	175.482
22.629	166.484
22.818	178.431
22.819	199.371
22.773	208.350
22.868	235.264
22.353	268.221
23.194	181.385
23.193	166.428
22.768	139.547
23.618	190.317
23.524	196.309
23.243	217.277
23.243	214.286
23.620	220.231
23.573	229.210
23.245	238.217
24.041	196.258
24.042	202.241
23.996	217.202
23.996	220.194
24.607	214.150
24.608	229.107
24.468	247.070
24.375	256.054
24.046	265.061
24.377	285.968
24.517	276.980
24.941	294.886
24.939	253.006
24.937	235.057
25.266	223.059
25.408	246.976
25.597	246.957
25.785	246.939
25.739	264.892
25.598	264.906
25.363	276.895
25.128	276.919
25.506	297.821
25.788	291.810
26.071	306.739
26.117	288.786
26.209	270.828
26.492	273.791
26.868	273.754
26.728	291.716
26.541	303.701
26.354	318.677
26.307	318.681
26.684	339.584
26.450	345.590
26.874	357.514
26.872	327.599
27.060	333.564
27.248	336.536
27.529	309.585
27.152	297.657
27.010	285.705
27.059	312.624
27.433	279.680
27.904	291.599
27.812	324.514
27.625	342.482
27.484	348.479
27.297	363.454
27.439	372.415
27.300	399.352
27.305	486.103
28.010	477.059
29.283	524.795
29.944	560.626
30.129	515.736
30.129	515.736
29.742	363.211
29.460	363.239
29.556	384.169
29.697	387.147
29.322	399.150
29.132	384.212
28.989	351.320
28.848	345.351
28.424	339.410
28.235	318.489
28.516	312.478
28.095	336.452
28.096	360.383
27.861	363.398
28.238	372.335
28.520	369.315
28.755	372.283
28.710	393.228
28.099	402.263
27.958	399.286
27.817	396.309
27.723	408.284
28.383	429.158
28.243	447.121
28.901	432.098
28.853	423.128
28.758	411.172
28.993	405.166
29.181	408.138
29.323	417.099
29.324	429.064
29.137	447.032
29.231	455.997
29.326	461.970
29.515	476.909
29.608	470.916
29.936	440.969
29.888	432.000
29.935	426.012
30.453	443.909
30.642	452.865
30.783	452.850
30.970	443.857
31.112	452.818
31.066	473.762
30.784	473.790
30.738	485.761
30.503	485.784
30.314	473.837
30.220	470.855
30.221	485.812
30.646	518.676
30.648	539.616
30.929	527.622
30.930	551.554
31.025	551.544
31.214	578.448
31.588	536.531
31.683	554.470
31.684	563.444
31.351	518.606
31.116	509.655
30.974	497.703
31.537	473.715
31.538	494.655
31.820	500.610
31.868	509.580
32.151	515.535
32.291	509.538
32.665	476.594
33.088	467.578
33.138	509.453
30.968	410.952
32.670	554.372
32.810	536.409
31.966	566.408
32.109	593.317
32.109	593.317
32.297	599.281
32.581	617.201
32.816	623.161
33.006	653.056
32.867	677.002
32.915	697.937
33.524	655.996
33.664	649.999
33.003	599.210
33.002	587.245
32.437	578.327
33.943	602.108
34.556	617.004
34.841	661.848
34.747	670.831
35.455	712.641
35.550	715.623
34.468	709.748
34.799	733.647
34.423	739.667
34.565	751.619
34.000	751.675
34.192	808.493
35.365	763.505
35.226	793.433
36.123	844.198
35.889	871.145
36.591	811.246
36.732	814.223
36.967	811.208
36.871	784.295
36.212	778.377
36.117	763.430
36.537	718.516
37.333	661.599
37.817	861.978
37.207	885.971
37.490	900.900
37.962	921.793
38.058	954.689
38.341	972.610
38.624	987.539
38.533	1020.454
38.628	1038.393
37.493	939.788
37.541	957.732
37.023	954.792
38.622	951.641
39.041	894.762
40.031	924.578
40.080	963.462
36.791	999.687
36.793	1017.636
36.086	1002.749
36.655	1074.487
37.827	1014.541
38.584	1092.243
41.079	1130.884
40.330	1175.830
39.578	1181.888
38.833	1295.637
39.913	1265.615
40.194	1253.621
42.126	1310.266
41.886	1247.470
41.885	1232.513
43.447	1378.938
42.463	1432.882
43.465	1645.176
46.881	2102.527
43.694	1552.418
44.584	1510.449
45.664	1477.435];
units.LW = {'g', '#'}; label.LW = {'total length', 'wet weight'}; 
bibkey.LW = {'PalaSara2001'};

% L-N and W-N data from PalaSara2001
data.LN = [ ... % total length (cm), fucundity (number of eggs)
22.476	276.367
23.307	355.586
23.418	435.302
23.594	348.134
23.699	268.268
24.008	345.430
23.812	401.178
24.011	410.713
24.013	471.161
24.210	442.009
24.318	446.770
24.373	473.330
24.517	463.559
24.875	434.295
24.928	400.407
24.387	359.676
24.711	361.870
24.800	340.047
24.403	318.559
24.276	277.542
24.993	223.851
25.229	267.212
25.503	385.502
25.398	458.114
25.399	479.875
25.509	535.412
25.793	438.497
26.207	435.793
26.497	483.952
26.713	476.550
26.841	534.492
26.715	541.833
26.374	551.741
26.501	595.176
26.709	387.087
26.401	324.433
25.879	317.540
25.788	307.931
27.287	442.301
27.431	454.291
27.430	427.694
27.521	446.975
27.393	389.033
27.788	379.088
28.094	361.951
28.382	364.170
28.507	337.486
27.776	514.502
28.208	521.458
27.258	623.668
27.403	650.166
27.420	621.139
27.888	620.815
28.198	734.245
27.965	761.004
29.171	762.589
29.168	692.470
29.420	682.624
28.768	588.774
28.641	564.682
28.856	533.100
29.164	583.664
29.466	469.812
29.464	438.379
30.796	432.623
31.470	649.774
30.556	737.452
31.169	785.388
31.080	809.629
32.610	825.498
34.587	1227.931];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'}; 
temp.LN = C2K(15); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'PalaSara2001'};
%
data.WN = [ ... % eviscerated weight (g), fucundity (number of eggs)
135.028	275.469
159.677	268.498
168.987	281.630
194.655	272.435
194.447	223.819
215.371	307.508
212.286	307.551
208.239	323.076
180.411	307.991
185.571	312.340
183.638	341.096
185.789	363.165
170.271	341.280
167.168	336.903
160.055	356.891
174.488	365.531
175.677	403.084
180.847	409.643
188.997	391.850
200.279	385.065
150.114	436.586
169.688	445.156
164.670	473.954
173.924	473.827
188.158	436.061
193.290	433.780
188.205	447.110
199.563	458.003
208.893	475.553
219.222	486.461
222.231	468.739
215.986	451.146
226.268	451.004
236.503	439.813
242.710	448.567
245.795	448.524
205.026	533.065
240.408	391.140
257.774	364.381
266.075	381.946
266.132	395.205
263.227	437.234
270.084	357.581
293.686	346.206
324.968	447.431
343.589	473.693
354.729	433.760
264.568	510.144
249.201	523.616
245.221	554.610
231.779	537.116
240.023	541.422
228.703	539.368
234.072	592.333
280.095	534.239
291.538	565.020
291.765	618.055
280.502	629.261
280.597	651.359
270.192	622.773
295.342	732.923
308.842	763.676
321.171	761.295
339.584	738.942
364.583	813.735
318.831	695.029
329.056	681.629
319.395	586.734
338.912	582.045
404.002	654.074
408.711	793.236
429.427	828.309
530.887	1229.117];
units.WN = {'g', '#'}; label.WN = {'eviscerated weight', 'fecundity'}; 
temp.WN = C2K(15); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = {'PalaSara2001'};
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                                 
%% Links
metaData.links.id_CoL = '6KZSW'; % Cat of Life
metaData.links.id_ITIS = '622969'; % ITIS
metaData.links.id_EoL = '46565796'; % Ency of Life
metaData.links.id_Wiki = 'Halobatrachus_didactylus'; % Wikipedia
metaData.links.id_ADW = 'Halobatrachus_didactylus'; % ADW
metaData.links.id_Taxo = '175875'; % Taxonomicon
metaData.links.id_WoRMS = '126374'; % WoRMS
metaData.links.id_fishbase = 'Halobatrachus-didactylus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Halobatrachus_didactylus}}';  
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
bibkey = 'PalaSara2001'; type = 'Article'; bib = [ ...  
'author = {J. L. Palaz\''{o}n-Ferna/''{a}ndez and A. M. Arias and C. Sarasqete}, ' ...
'year = {2001}, ' ...
'title = {Aspects of the reproductive biology of the toadfish, \emph{Halobatrachus didactylus} ({S}chneider, 1801) ({P}isces: {B}atrachoididae)}, ' ... 
'journal = {Sci. Mar.}, ' ...
'volume = {65(2)}, '...
'pages = {131--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Halobatrachus-didactylus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
