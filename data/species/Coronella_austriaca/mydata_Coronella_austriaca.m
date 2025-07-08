function [data, auxData, metaData, txtData, weights] = mydata_Coronella_austriaca

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Coronella_austriaca'; 
metaData.species_en = 'Smooth snake'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ap = 4.5*365;     units.ap = 'd';      label.ap = 'age at puberty';       bibkey.ap = 'LuisCapu1996';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 12*365;    units.am = 'd';      label.am = 'life span';            bibkey.am = 'storm_crow';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 15;   units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';           bibkey.Lb  = 'Read2004';  
data.Li  = 55;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Read2004';
data.Lim = 55;   units.Lim  = 'cm'; label.Lim = 'ultimate SVL for males';    bibkey.Lim  = 'Read2004';

data.Wwb = 3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Read2004';
data.Wwp = 30;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'LuisCapu1996';
  
data.Ri  = 8/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'LuisCapu1996';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Litters each other year when fully grown';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
1.890	22.351
2.559	22.224
2.559	22.931
2.573	20.809
2.670	25.048
2.728	20.500
2.735	26.965
2.889	26.251
2.891	27.463
3.462	23.300
3.559	27.033
3.560	28.044
3.577	29.255
3.577	29.558
3.620	26.425
3.624	30.162
3.638	28.546
3.749	30.662
3.840	28.639
3.843	31.265
3.858	30.254
4.401	29.627
4.437	33.767
4.479	29.624
4.484	34.169
4.495	30.532
4.497	32.149
4.498	33.058
4.558	30.429
4.558	31.338
4.561	34.065
4.563	35.277
4.574	31.742
4.593	34.367
4.593	34.771
4.718	34.766
4.748	34.159
4.825	33.348
5.356	35.550
5.373	36.660
5.374	37.771
5.432	34.132
5.561	38.875
5.578	39.581
5.640	39.882
5.669	37.154
5.683	36.446
5.701	38.061
5.746	37.151
5.764	39.372
6.293	39.048
6.325	40.663
6.326	41.370
6.327	41.875
6.340	39.855
6.400	37.327
6.483	42.576
6.574	40.957
6.618	38.430
6.624	43.884
6.652	41.055
6.702	43.578
7.185	44.872
7.246	44.062
7.310	45.070
7.338	42.846
7.398	40.723
7.434	45.368
7.435	46.277
7.445	40.620
7.492	41.527
7.538	40.616
7.540	41.929
7.632	41.320
8.255	42.407
8.304	44.526
8.509	46.639
8.555	46.031
9.192	46.108
9.193	46.512
9.222	44.894
9.271	46.913
9.317	46.204
9.347	45.799
9.379	46.504
9.940	47.291
10.064	46.680
10.081	48.093
10.141	46.071
10.158	47.585
10.468	46.563
11.060	47.651
11.061	49.166
11.216	48.352
11.217	49.160
11.962	47.717
11.979	49.232
12.103	48.924
12.276	50.634
12.383	49.317
13.209	50.699];
data.tL_f(:,1) = (data.tL_f(:,1) - 0.7) * 365; % shift origin to hatching and convert to d
units.tL_f  = {'yr', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Read2004';
comment.tL_f = 'Data for females; Temp is guessed';
% males
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.765	15.366
0.892	15.972
1.163	20.725
1.291	22.040
1.865	23.451
2.167	24.056
2.231	31.644
2.247	25.168
2.853	24.354
2.853	25.062
2.948	30.424
2.964	25.567
2.964	26.478
3.108	34.470
3.139	27.286
3.139	33.255
3.155	26.172
3.219	32.040
3.315	32.242
3.841	32.035
3.841	28.393
3.904	30.011
3.904	31.124
3.968	30.415
4.032	31.629
4.032	32.843
4.096	33.551
4.223	33.448
4.223	34.055
4.813	36.074
4.972	34.859
5.068	35.667
5.068	36.376
5.195	37.791
5.307	35.665
5.849	38.089
5.880	37.482
5.960	39.100
6.008	37.784
6.008	39.707
6.183	38.997
6.215	40.514
6.279	39.401
6.327	39.805
6.327	39.198
6.773	40.510
6.773	41.319
6.869	39.598
6.884	41.318
6.948	40.710
7.155	40.709
7.155	41.822
7.187	42.934
7.203	42.125
7.283	42.832
7.809	42.828
7.857	41.917
7.857	43.738
7.920	42.625
7.952	45.154
7.984	43.231
8.048	42.522
8.064	43.736
8.096	43.230
8.159	44.545
8.207	42.420
8.239	44.747
8.271	42.925
8.303	44.139
8.303	43.532
8.813	43.022
8.813	44.135
8.845	44.640
8.892	46.158
8.908	43.830
8.924	44.437
8.972	45.752
9.036	45.954
9.179	46.459
9.179	45.245
9.179	43.727
9.227	43.322
9.259	46.155
9.307	44.434
9.849	45.340
9.896	46.554
9.960	44.530
9.960	47.262
9.992	45.744
10.040	46.654
10.088	46.148
10.183	44.528
10.199	44.933
10.231	47.259
10.279	44.932
10.295	45.842
10.295	46.551
10.853	46.546
11.044	46.544
11.171	46.543];
data.tL_m(:,1) = (data.tL_m(:,1) - 0.7) * 365; % shift origin to hatching and convert to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Read2004';
comment.tL_m = 'Data for males; Temp is guessed';
% males that deviate, according to Read2004 
data.tL_m1 = [ ... % time since birth (yr), SVL (cm)
1.116	27.808
1.147	28.719
1.275	29.325
2.135	33.668
2.183	33.466
2.837	33.662
2.916	32.852
2.948	34.471
2.948	33.459
3.076	33.458
3.809	34.565
3.904	33.856
3.968	35.373
4.000	34.563
4.175	34.663
4.239	35.674
4.892	35.466
4.972	36.073
5.163	36.071
5.227	35.868
5.785	36.066
5.960	37.177
5.976	35.963
6.056	36.570
6.120	36.873
6.120	37.682
6.821	37.474
6.884	37.878
6.884	37.473
7.044	38.382
7.187	38.280
7.283	38.482
7.873	38.173
7.920	39.083
8.048	38.475
8.112	39.689
8.319	38.979
8.892	38.873
8.908	39.480
8.940	40.087
9.004	39.479
9.116	40.490
9.211	40.287
9.323	38.060
10.231	40.986
10.247	39.772];
data.tL_m1(:,1) = (data.tL_m1(:,1) - 0.7) * 365; % shift origin to hatching and convert to d
n=size(data.tL_m1,1); for i=2:n; if data.tL_m1(i,1)<=data.tL_m1(i-1,1); data.tL_m1(i,1)=data.tL_m1(i-1,1)+1e-3; end; end
units.tL_m1  = {'d', 'cm'};  label.tL_m1 = {'time since birth', 'SVL', 'male'};  
temp.tL_m1   = C2K(18);  units.temp.tL_m1 = 'K'; label.temp.tL_m1 = 'temperature';
bibkey.tL_m1 = 'Read2004';
comment.tL_m1 = 'Two individual males that deviate, according to Read2004';

% length-weight
data.LW_f = [ ... % SVL (cm), wet weight (g)
15.323	2.068
15.488	3.477
16.805	2.056
18.122	5.397
18.177	3.104
20.098	3.970
20.152	5.734
20.317	5.380
20.756	5.729
20.756	8.198
21.634	5.722
22.293	7.304
22.622	8.713
22.841	7.300
24.872	11.517
25.146	9.045
25.530	10.277
26.134	9.038
26.902	8.679
26.902	10.266
27.506	9.909
28.055	12.197
28.220	9.198
28.659	10.605
29.098	11.307
29.482	11.657
30.030	11.653
30.085	9.007
30.195	13.062
30.470	11.826
32.884	17.274
32.994	22.564
33.049	15.156
33.488	22.208
33.927	15.326
33.982	18.324
35.409	22.016
36.561	20.773
36.616	22.183
37.494	37.344
37.988	27.463
40.512	32.205
40.512	35.380
40.951	26.206
41.280	60.242
41.884	32.547
42.433	44.360
42.488	38.186
43.970	31.297
44.518	43.285
44.902	40.813
45.012	41.341
45.122	42.222
45.561	57.210
46.823	40.445
47.537	39.205
48.579	44.312
48.689	60.184
48.909	55.244
50.445	92.798];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'wet weight', 'female'};  
bibkey.LW_f = 'Read2004';
comment.LW_f = 'Data for females';
% males
data.LW_m = [ ... % SVL (cm), wet weight (g)
15.049	3.305
16.530	3.293
21.415	6.782
21.579	10.132
22.732	10.299
23.335	7.649
23.555	7.471
24.049	7.467
24.598	8.168
24.707	8.696
24.707	9.578
25.091	13.279
25.421	11.336
25.970	12.390
26.848	14.147
27.780	15.021
27.945	15.725
29.043	13.248
29.317	10.071
29.317	18.713
29.427	15.185
29.591	14.125
29.646	16.065
29.976	13.946
30.030	18.355
30.085	9.889
30.195	16.590
30.963	17.289
31.073	15.525
31.073	16.230
31.238	12.172
31.293	17.287
31.402	18.697
31.402	22.400
31.457	14.992
31.512	13.405
32.061	17.457
32.665	20.627
32.720	22.390
32.774	25.564
32.939	21.506
32.994	16.568
33.049	27.502
33.323	21.503
33.488	20.268
34.091	23.437
34.585	24.492
35.518	22.015
35.518	30.481
36.287	24.478
36.341	32.767
36.561	30.296
37.439	30.642
37.549	36.814
37.659	35.579
37.768	26.054
37.768	34.696
37.933	38.398
37.988	33.989
38.591	48.270
38.756	30.279
38.756	35.570
38.976	45.445
39.524	36.270
39.963	49.141
40.238	43.142
40.402	37.321
40.512	50.371
40.512	46.138
40.732	42.257
40.896	51.250
41.994	44.187
42.433	35.012
42.927	45.414
43.037	55.290
45.012	45.398
46.988	58.962];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'wet weight', 'male'};  
bibkey.LW_m = 'Read2004';
comment.LW_m = 'Data for males';

% weight-fecundity
data.WN = [ ... % wet weight after parturition (g), litter size (#)
37.7 3
38.3 4
51.3 8
45.6 8
43.4 6
42.3 6
39.6 4
44.7 4
42.7 5
42.7 5
38.5 5
41.3 5
42.9 6
48.8 8
44.7 5
49.4 5
43.3 7
45.8 6
37.3 2
35.3 4
37.4 3
53.1 8
43.9 7
43.8 4
41.3 4
43.2 2
44.9 3];
units.WN  = {'g', '#'};  label.WN = {'wet weight after parturition', 'clutch size'};  
temp.WN   = C2K(18);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Read2004';
comment.WN = 'Temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_m1 = 0 * weights.tL_m1;
weights.tL_m = 10 * weights.tL_m;
weights.tL_f = 10 * weights.tL_f;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Difference between females and  males are small';
metaData.bibkey.F1 = 'Read2004'; 
F2 = 'Ovoviviparous; sometimes eggs are laid; sperm can be stored for more than 475 d';
metaData.bibkey.F2 = 'herpetolife'; 
F3 = 'Kills prey by constriction';
metaData.bibkey.F3 = 'storm_crow'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '828T5'; % Cat of Life
metaData.links.id_ITIS = '1081704'; % ITIS
metaData.links.id_EoL = '47046468'; % Ency of Life
metaData.links.id_Wiki = 'Coronella_austriaca'; % Wikipedia
metaData.links.id_ADW = 'Coronella_austriaca'; % ADW
metaData.links.id_Taxo = '49966'; % Taxonomicon
metaData.links.id_WoRMS = '1048956'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Coronella&species=austriaca'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coronella_austriaca}}';
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
bibkey = 'Read2004'; type = 'Article'; bib = [ ... 
'title = {Age, growth and sex determination in a population of smooth snakes, \emph{Coronella austriaca} in southern {E}ngland}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'year = {2004}, ' ...
'author = {Reading, C. J.}, ' ....
'volume = {25}, ' ...
'pages = {137--150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LuisCapu1996'; type = 'Article'; bib = [ ... 
'title = {Reproductive output, costs of reproduction, and ecology of the smooth snake, \emph{Coronella austriaca}, in the eastern {I}talian {A}lps}, ' ...
'journal = {Oecologia}, ' ...
'year = {1996}, ' ...
'author = {Luiselli, L. and Capula, M. and Shine, R.}, ' ....
'volume = {106}, ' ...
'pages = {100--110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'herpetolife'; type = 'Misc'; bib = ...
'howpublished = {\url{http://herpetolife.ro/en/sarpele-de-alun-coronella-austriaca/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'storm_crow'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.storm-crow.co.uk/animals/smooth_snake.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

