function [data, auxData, metaData, txtData, weights] = mydata_Rhomboplites_aurorubens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Rhomboplites_aurorubens'; 
metaData.species_en = 'Vermilion snapper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};
metaData.date_subm   = [2019 01 04]; 
metaData.email       = {'bas.kooijman@vu.nl'}; 
metaData.address     = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 26/24;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Allm2007';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = '15 to 23 cm';
data.Li  = 60;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';
data.Lim  = 60;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'fishbase';

data.Wwb = 1.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'CuelSedb1996';
  comment.Wwb = 'based egg diameter of 0.65 mm: pi/6*0.065^3'; 
data.Wwp = 105; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'CuelSedb1996';
data.Wwi = 3.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of 0.01514*Li^2.97 give 2.9 kg';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.930	15.173
0.930	20.447
1.385	20.187
1.633	24.688
1.695	20.058
1.695	25.910
1.716	20.765
1.716	22.373
1.840	21.922
1.840	23.916
1.840	25.330
1.881	26.102
1.902	20.057
1.902	22.693
1.964	27.516
1.984	22.179
1.984	25.973
2.005	28.031
2.005	26.937
2.026	23.529
2.026	28.609
2.047	19.284
2.067	18.127
2.129	15.168
2.233	17.998
2.253	19.284
2.274	20.441
2.295	17.483
2.295	23.914
2.336	27.258
2.336	25.135
2.439	21.534
2.460	22.305
2.522	25.392
2.543	26.678
2.667	22.304
2.687	21.854
2.687	23.205
2.770	21.082
2.770	25.262
2.770	25.905
2.770	23.976
2.770	23.462
2.791	31.372
2.811	21.597
2.873	26.098
2.873	30.857
2.873	31.886
2.935	37.030
2.935	38.702
2.956	40.310
2.997	25.519
2.997	30.020
3.018	32.850
3.101	34.328
3.121	18.380
3.121	21.467
3.163	19.023
3.163	19.409
3.163	20.116
3.163	37.029
3.183	32.913
3.183	35.486
3.287	23.138
3.432	27.253
3.597	24.680
3.597	22.622
3.659	34.262
3.659	23.651
3.742	24.422
3.762	21.400
3.783	34.647
3.845	37.155
3.845	19.856
3.866	30.981
3.866	21.914
3.886	32.460
3.886	31.817
3.907	34.711
3.907	26.672
3.907	21.463
3.969	37.540
3.990	33.167
4.052	25.707
4.134	32.845
4.258	27.571
4.258	25.771
4.279	34.002
4.341	21.848
4.486	27.956
4.486	25.448
4.506	22.876
4.506	23.326
4.506	23.969
4.693	26.927
4.693	33.293
4.755	27.634
4.755	25.126
4.879	29.048
4.899	24.996
4.899	34.193
4.920	30.784
4.920	31.363
4.920	34.643
4.920	26.347
4.941	36.186
4.941	37.472
4.961	27.761
4.961	28.340
4.961	26.797
5.003	30.398
5.003	25.446
5.085	20.623
5.127	25.703
5.251	37.021
5.251	25.638
5.271	18.757
5.313	26.474
5.333	24.995
5.354	26.152
5.519	23.386
5.561	25.958
5.581	25.058
5.581	24.351
5.623	29.302
5.809	24.929
5.829	26.343
5.912	28.208
5.912	26.021
5.933	29.108
5.953	25.378
5.974	27.307
5.974	26.728
5.995	31.744
5.995	30.330
6.078	25.763
6.098	21.905
6.181	27.692
6.202	25.377
6.284	27.306
6.305	22.611
6.305	25.763
6.491	29.878
6.491	29.299
6.491	28.656
6.491	28.270
6.491	25.183
6.491	24.861
6.512	25.697
6.594	26.404
6.698	25.311
6.718	26.404
6.739	26.532
6.842	22.609
6.904	26.725
6.904	22.866
6.904	27.432
6.946	23.638
6.987	21.644
7.028	25.502
7.049	26.145
7.070	32.126
7.070	24.666
7.070	29.104
7.132	38.042
7.152	28.139
7.173	41.643
7.173	25.566
7.173	29.167
7.214	22.351
7.235	23.894
7.276	39.521
7.380	24.343
7.525	23.700
7.545	24.857
7.545	25.693
7.649	24.021
7.773	27.686
7.814	24.084
7.835	29.486
7.876	24.920
7.897	23.570
7.979	25.691
8.083	23.698
8.103	27.685
8.227	25.433
8.310	29.291
8.496	27.876
8.786	25.174
8.806	24.659
8.827	25.945
8.889	24.144
8.889	24.595
9.096	15.912
9.220	25.236
9.282	29.673
9.323	26.972
9.385	29.223
9.736	29.028
9.757	25.106
9.757	25.556
10.171	25.040
10.439	28.640
10.460	27.546
10.460	28.640
10.501	29.218
10.563	32.241
10.791	27.352
10.915	28.059
11.473	28.185
12.072	27.218
12.217	28.890
13.127	34.417
13.891	25.668];
data.tL_f(:,1) = 365 * data.tL_f(:,1);  % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Allm2007';
comment.tL_f = 'data for females';
% 
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.930	19.675
1.695	23.016
1.716	22.051
1.736	20.701
1.736	21.472
1.736	22.115
1.798	16.134
1.819	16.649
1.819	16.842
1.819	17.099
1.819	17.420
1.819	17.935
1.819	18.256
1.881	24.430
1.943	24.494
1.943	25.073
1.943	26.423
1.964	32.082
2.005	17.484
2.109	20.506
2.109	19.863
2.109	19.284
2.212	26.486
2.253	25.715
2.274	28.030
2.274	21.341
2.295	22.113
2.398	30.987
2.749	28.928
2.749	29.571
2.770	26.613
2.770	30.021
2.915	28.799
2.935	22.368
2.935	24.490
2.935	27.770
2.935	29.570
2.935	34.458
2.956	23.654
2.977	28.348
2.977	29.827
2.977	30.342
2.977	31.049
3.018	27.126
3.018	26.612
3.018	32.271
3.039	16.965
3.039	22.817
3.039	27.448
3.059	23.975
3.059	24.489
3.101	19.280
3.101	31.563
3.101	35.229
3.163	31.048
3.183	21.466
3.183	36.450
3.204	33.299
3.245	23.138
3.266	26.096
3.287	22.688
3.307	27.447
3.328	25.196
3.411	32.848
3.432	26.481
3.680	33.169
3.721	32.075
3.783	29.438
3.804	28.152
3.804	28.924
3.845	30.081
3.845	22.107
3.845	22.750
3.845	25.579
3.928	24.872
3.948	35.483
3.948	30.338
3.948	29.502
3.990	32.396
4.010	36.447
4.010	31.752
4.010	28.923
4.010	27.508
4.031	28.151
4.031	23.521
4.052	35.804
4.052	30.916
4.052	27.122
4.072	21.334
4.114	29.887
4.134	19.533
4.155	20.884
4.155	23.906
4.155	24.356
4.176	38.376
4.176	34.453
4.176	31.302
4.196	32.138
4.196	21.912
4.238	22.105
4.238	20.176
4.258	29.308
4.258	26.928
4.300	28.664
4.300	28.214
4.300	25.771
4.300	25.192
4.320	23.070
4.320	19.725
4.341	31.623
4.341	30.979
4.362	23.970
4.382	30.465
4.382	27.507
4.424	33.166
4.424	26.863
4.444	29.243
4.444	24.934
4.837	20.817
4.920	22.681
4.961	23.260
4.961	24.289
5.023	32.842
5.023	33.420
5.044	35.478
5.065	35.864
5.085	31.362
5.085	38.565
5.127	24.224
5.189	31.812
5.189	32.198
5.189	35.863
5.209	34.384
5.209	35.220
5.251	21.329
5.251	21.844
5.251	42.616
5.271	22.937
5.313	31.297
5.333	24.094
5.395	29.432
5.457	30.782
5.726	22.356
5.726	25.315
5.747	22.935
5.767	23.900
5.767	24.414
5.829	25.121
5.850	22.420
5.912	23.771
5.912	24.414
5.953	22.356
5.974	26.728
5.974	38.240
5.995	34.188
6.036	24.285
6.036	32.838
6.057	26.021
6.057	30.651
6.078	23.062
6.078	23.384
6.078	29.493
6.078	32.130
6.098	27.821
6.160	27.049
6.160	39.654
6.181	35.281
6.222	26.663
6.222	32.644
6.243	28.335
6.243	30.650
6.243	36.116
6.243	21.454
6.305	24.798
6.326	29.042
6.326	23.576
6.367	27.048
6.367	24.219
6.429	34.444
6.512	24.218
6.553	26.855
6.656	24.604
6.677	24.218
6.822	23.188
6.946	23.252
6.966	27.689
7.028	27.174
7.049	25.116
7.070	28.718
7.090	27.753
7.111	37.849
7.111	23.830
7.173	37.270
7.173	38.364
7.173	32.126
7.173	31.740
7.214	35.084
7.214	29.103
7.235	40.485
7.235	30.325
7.297	26.980
7.297	26.466
7.318	24.922
7.318	22.093
7.359	23.379
7.401	39.584
7.483	26.465
7.566	26.851
7.669	24.921
7.814	34.567
7.835	23.763
7.855	26.464
7.897	26.849
8.041	28.521
8.041	24.598
8.124	26.720
8.186	41.768
8.186	29.035
8.186	29.421
8.207	23.954
8.207	24.404
8.227	24.919
8.227	25.433
8.248	23.182
8.248	23.633
8.310	27.748
8.310	28.198
8.372	26.719
8.455	27.490
8.475	28.262
8.537	24.596
8.641	28.454
8.910	26.910
8.930	27.231
8.930	26.074
9.054	26.973
9.096	28.259
9.158	31.089
9.178	25.944
9.220	32.889
9.302	24.143
9.364	29.030
9.447	32.052
9.488	23.306
9.716	23.369
9.736	34.688
9.840	23.369
9.943	31.600
10.191	23.753
10.191	24.139
10.191	24.782
10.253	28.576
10.274	24.718
10.274	25.554
10.295	27.483
10.481	28.318
10.543	25.231
11.080	28.380
11.183	29.216
11.204	25.035
11.245	29.408
11.824	30.242
12.010	27.540
12.217	26.961
12.279	25.160
12.465	24.323];
data.tL_m(:,1) = 365 * data.tL_m(:,1);  % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Allm2007';
comment.tL_m = 'data for males';

% weight-fecundity
data.WN = [ ... % oocyte-free body weight (g), fecundity (1e3 eggs)
108.594	3.616
108.817	8.548
108.891	10.192
109.129	15.452
111.438	6.575
116.813	5.589
119.954	15.123
122.842	19.068
128.069	14.795
128.574	25.973
133.296	10.521
133.623	17.753
133.831	22.356
133.920	24.329
135.546	0.329
135.665	2.959
138.865	13.808
141.798	18.740
144.032	8.219
151.806	0.329
157.790	12.822
160.337	9.205
160.976	23.342
162.691	1.315
163.552	20.384
163.849	26.959
169.150	24.329
171.519	16.767
176.523	7.562
179.396	11.178
179.931	23.014
185.841	33.863
201.671	24.329
202.562	44.055
206.645	14.466
207.506	33.534
217.767	20.712
223.410	25.644
236.856	23.342
244.897	21.370
259.190	37.808
287.961	14.795
290.983	21.699
293.901	26.301
298.578	9.863
311.200	49.315
318.588	32.877
349.170	49.973
447.593	69.041
914.103	77.589];
data.WN(:,2) = data.WN(:,2) * 1e3; % convert 1e3 eggs to eggs
units.WN   = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN    = C2K(24);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'CuelSedb1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  


%% Facts
F1 = 'weight-length relationship: W in g = 0.01514*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4SK6D'; % Cat of Life
metaData.links.id_ITIS = '168909'; % ITIS
metaData.links.id_EoL = '46580805'; % Ency of Life
metaData.links.id_Wiki = 'Rhomboplites_aurorubens'; % Wikipedia
metaData.links.id_ADW = 'Rhomboplites_aurorubens'; % ADW
metaData.links.id_Taxo = '186083'; % Taxonomicon
metaData.links.id_WoRMS = '159807'; % WoRMS
metaData.links.id_fishbase = 'Rhomboplites-aurorubens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhomboplites_aurorubens}}';
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
bibkey = 'Allm2007'; type = 'Article'; bib = [ ... 
'author = {Robert J. Allman}, ' ... 
'year = {2007}, ' ...
'title = {Small-scale spatial variation in the population structure of vermilion snapper (\emph{Rhomboplites aurorubens}) from the northeast {G}ulf of {M}exico}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {88}, ' ...
'pages = {88-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CuelSedb1996'; type = 'Article'; bib = [ ... 
'author = {Nicole Cuellar and George R. Sedberry and David M. Wyanski}, ' ... 
'year = {1996}, ' ...
'title = {Reproductive seasonality, maturation, fecundity, and spawning frequency of the vermilion snapper \emph{Rhomboplites aurorubens}, off the southeastern United States}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {94}, ' ...
'pages = {635-653}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Rhomboplites-aurorubens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
