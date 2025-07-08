function [data, auxData, metaData, txtData, weights] = mydata_Haemulon_sciurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Haemulon_sciurus'; 
metaData.species_en = 'Bluestriped grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 19];

%% set data
% zero-variate data

data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 49.4;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01349*Lp^3.03, see F1';
data.Wwi = 403; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^3.03, see F1; max. published weight: 300 g';

data.Ri  = 1.5e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Haemulon_album: 2.2e6*403/5926';
  
% uni-variate data
% time-length
data.tL = [ ... % time (yr), total length (cm)
1.995	19.248
2.084	23.591
2.984	23.017
3.041	24.591
3.043	26.353
3.072	27.297
3.094	23.583
3.095	24.150
3.097	25.660
3.121	23.709
3.124	25.283
3.125	26.730
3.126	26.982
3.128	28.052
3.150	24.401
3.153	26.856
3.156	28.304
3.180	26.100
3.201	22.638
3.973	27.416
3.976	29.368
3.998	25.968
4.005	30.249
4.021	23.261
4.023	24.583
4.030	28.675
4.032	30.501
4.048	22.946
4.049	23.576
4.054	26.535
4.083	27.982
4.085	28.926
4.104	23.890
4.105	24.079
4.106	25.212
4.110	27.541
4.111	28.171
4.132	24.897
4.133	24.960
4.134	25.338
4.135	25.841
4.136	26.723
4.163	26.848
5.009	26.338
5.038	27.975
5.044	31.752
5.062	25.394
5.064	27.219
5.067	28.541
5.068	29.674
5.088	24.701
5.090	26.023
5.095	29.045
5.098	31.059
5.117	25.834
5.119	26.967
5.121	28.415
5.124	30.429
5.145	26.589
5.149	28.918
5.150	29.296
5.151	30.240
5.202	27.722
5.287	30.050
5.992	27.023
5.994	28.094
5.995	28.849
5.996	29.479
5.997	30.045
6.018	26.331
6.025	30.611
6.054	31.555
6.072	25.764
6.078	29.793
6.102	27.463
6.128	26.582
6.135	30.925
6.156	26.896
6.157	27.715
6.158	28.659
6.999	25.316
7.032	28.841
7.034	29.848
7.053	24.749
7.056	26.764
7.059	28.400
7.062	30.415
7.063	31.296
7.085	27.519
7.113	27.959
7.115	29.470
7.116	29.974
7.117	30.540
7.118	31.170
7.142	29.029
7.146	31.736
7.164	26.007
7.168	28.274
7.194	27.392
7.201	31.987
7.254	31.106
7.987	28.393
7.993	32.170
8.018	31.100
8.039	26.693
8.067	27.260
8.068	27.386
8.069	28.707
8.071	29.778
8.095	27.763
8.097	29.400
8.099	30.218
8.100	30.973
8.101	31.666
8.127	30.596
8.152	29.147
9.051	28.259
9.056	31.407
9.077	27.693
9.080	29.203
9.081	29.959
9.104	27.252
9.109	30.336
9.110	30.777
9.137	31.154
9.138	32.036
9.139	32.413
9.141	33.546
9.162	29.706
9.163	30.462
9.220	31.846
9.950	27.623
10.035	29.196
10.038	31.211
10.039	31.777
10.062	29.448
10.063	30.203
10.064	30.707
10.066	31.462
10.067	32.406
10.068	32.658
10.086	27.307
10.119	30.392
10.965	30.763
10.993	31.392
11.012	25.538
11.017	28.874
11.018	29.629
11.048	31.077
11.071	28.433
11.072	29.440
11.073	29.881
11.074	30.447
11.076	31.832
11.079	33.595
11.099	29.251
11.106	33.280
11.918	28.993
11.946	29.811
11.949	31.700
11.998	28.300
12.002	30.566
12.004	32.014
12.005	32.706
12.023	26.789
12.024	26.915
12.030	30.692
12.033	33.147
12.055	29.496
12.056	30.314
12.057	31.069
12.083	29.684
12.163	28.865
12.959	31.377
12.984	30.496
13.036	28.481
13.066	30.495
13.088	26.907
13.092	29.488
13.094	30.873
13.096	31.817
13.118	28.795
13.120	29.991
14.045	28.096
14.105	31.306
14.106	32.250
14.107	32.250
15.009	33.943
15.034	32.558
15.035	32.810
15.036	33.313
15.057	29.662
15.058	30.040
15.169	31.046
15.982	27.452
16.011	28.773
16.013	30.095
16.046	33.557
16.070	31.732
16.096	30.850
16.999	32.417
17.030	34.305
17.052	31.221
17.056	33.550
17.074	27.884
17.078	30.591
17.105	30.213
17.111	34.116
17.135	31.912
17.191	32.919
17.952	30.962
18.008	31.654
18.028	26.933
18.033	29.954
18.037	32.598
18.088	30.394
19.097	30.135
19.102	33.345
19.976	33.402
20.055	31.638
20.978	28.484
21.065	31.631
21.967	32.442
22.017	29.924
23.057	31.616];
data.tL(:,1) = (data.tL(:,1) + 0.3)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoraGonz2010'; 

% length-weight
data.LW = [ ... % fork length (cm), weight (g)
18.361	124.829
19.269	146.129
21.337	195.827
21.438	171.028
21.589	202.925
22.043	213.575
22.144	224.209
22.194	240.156
23.253	261.463
23.455	254.385
23.607	272.109
23.707	252.625
23.707	233.137
23.758	236.682
24.010	277.441
24.161	249.102
24.262	265.051
24.313	284.541
24.363	289.859
24.363	302.260
24.414	254.428
24.464	265.060
24.767	272.160
24.817	314.682
24.817	328.855
24.817	284.564
24.918	302.285
24.968	295.200
25.170	332.414
25.271	279.269
25.372	298.762
25.473	351.916
25.523	284.595
25.523	312.941
25.523	334.201
25.776	293.464
25.776	302.323
25.876	328.902
25.927	337.763
25.977	366.111
26.078	355.486
26.078	343.084
26.280	376.754
26.381	297.035
26.482	390.937
26.532	307.671
26.583	325.390
26.633	516.731
26.633	399.802
26.633	350.195
26.734	378.546
26.784	452.958
26.784	359.060
26.936	343.122
27.037	369.701
27.087	396.278
27.087	413.995
27.137	433.485
27.289	332.508
27.339	456.526
27.390	387.434
27.390	362.630
27.440	440.585
27.440	452.987
27.491	417.556
27.591	399.844
27.692	375.045
27.743	343.158
27.793	353.790
27.793	330.759
27.844	497.296
27.844	447.690
27.894	396.314
27.945	429.978
28.045	476.045
28.045	394.549
28.146	488.451
28.146	371.522
28.298	417.592
28.398	385.707
28.449	453.032
28.499	470.750
28.499	383.939
28.550	484.926
28.550	401.658
28.600	371.542
28.651	437.096
28.701	500.877
28.701	408.752
28.752	481.392
28.752	300.683
28.802	422.929
28.903	426.477
29.054	424.712
29.105	495.580
29.105	484.950
29.206	545.191
29.206	465.467
29.256	577.083
29.256	555.823
29.256	506.217
29.306	449.526
29.357	518.623
29.458	488.509
29.559	534.577
29.660	559.384
29.710	662.143
29.710	509.780
29.760	474.350
29.912	525.734
29.912	453.096
29.962	543.453
30.113	486.767
30.113	474.365
30.164	562.950
30.214	555.866
30.214	502.716
30.265	612.561
30.265	538.151
30.315	518.666
30.416	447.804
30.467	584.223
30.567	697.614
30.668	612.579
30.719	564.746
30.719	564.746
30.719	589.550
30.769	548.804
30.870	536.407
30.921	600.188
31.021	603.736
31.223	738.391
31.526	584.270
31.627	713.606
31.728	656.917
31.728	633.886
31.728	607.311
31.929	786.257
31.929	699.446
31.980	743.739
31.980	669.330
32.081	616.185
32.131	724.258
32.131	695.911
32.182	763.236
32.182	633.906
32.232	600.246
32.282	626.824
32.434	750.846
32.434	591.397
32.535	745.535
32.636	644.556
32.736	809.324
32.837	706.573
34.351	827.112
34.603	802.320];
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'MoraGonz2010'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Wwi = 2 * weights.Wwi;
weights.Li = 2 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01349*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3J97Q'; % Cat of Life
metaData.links.id_ITIS = '169069'; % ITIS
metaData.links.id_EoL = '46578482'; % Ency of Life
metaData.links.id_Wiki = 'Haemulon_sciurus'; % Wikipedia
metaData.links.id_ADW = 'Haemulon_sciurus'; % ADW
metaData.links.id_Taxo = '45290'; % Taxonomicon
metaData.links.id_WoRMS = '275733'; % WoRMS
metaData.links.id_fishbase = 'Haemulon-sciurus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haemulon_sciurus}}';
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
bibkey = 'PittTrot2009'; type = 'inproceedings'; bib = [ ... 
'author = {Joanna M. Pitt and Tammy M. Trott and Brian E. Luckhurst}, ' ... 
'year = {2009}, ' ...
'title = {Bluestriped Grunt (\emph{Haemulon sciurus}) in {B}ermuda: Age, {G}rowth, and Reproduction Studies}, ' ...
'journal = {Proceedings of the 62nd Gulf and Caribbean Fisheries Institute November 2-6, 2009 Cumana, Venezuela}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Haemulon-sciurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
