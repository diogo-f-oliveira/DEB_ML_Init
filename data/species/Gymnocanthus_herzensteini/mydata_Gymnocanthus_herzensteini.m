function [data, auxData, metaData, txtData, weights] = mydata_Gymnocanthus_herzensteini
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Gymnocanthus_herzensteini'; 
metaData.species_en = 'Black edged sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 3 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 17 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(7.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 25;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Panc2010'; 
  comment.Lp = '23 to 27 cm';
data.Lpm  = 22.5;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Panc2010'; 
  comment.Lpm = '20 to 25 cm';
data.Li  = 42;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'baed on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
 
data.Ri = 1e4/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(2.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.94 as found for Cottis volki';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    1 9.2
    2 15.8
    3 20.8
    4 22.9
    5 25.6
    6 27.7
    7 29.6
    8 31.2
    9 32.7
   10 34.0
   11 35.1
   12 36.1
   13 36.8
   14 37.7
   15 38.6
   16 38.8];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Panc2010';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    1 8.9
    2 15.0
    3 19.1
    4 21.2
    5 23.1
    6 24.6
    7 26.2
    8 27.7
    9 29.0
   10 30.2
   11 31.2
   12 32.0];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Panc2010';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
6.700	2.907
8.684	8.665
9.074	8.681
9.499	8.698
10.349	8.733
13.360	13.114
13.467	25.894
13.715	35.841
13.715	15.967
13.750	24.486
14.069	24.499
14.281	28.766
14.742	25.946
14.884	35.888
15.061	34.476
15.309	37.325
15.982	47.289
16.265	37.364
16.265	48.720
16.584	45.894
16.761	26.028
16.938	54.426
17.080	37.397
17.328	37.407
17.647	48.776
17.753	23.229
17.753	30.326
18.001	70.084
18.001	77.182
18.107	47.376
18.320	36.028
18.320	71.517
18.639	48.817
18.780	54.501
18.780	48.822
18.851	70.119
18.957	63.025
19.028	64.448
19.028	82.902
19.028	90.000
19.028	97.097
19.453	98.534
19.524	81.502
19.560	47.434
19.772	99.967
19.843	61.642
19.879	80.097
19.914	70.162
20.020	84.362
20.091	98.560
20.268	95.728
20.268	68.757
20.304	91.471
20.587	101.419
20.587	118.454
20.729	107.103
20.764	117.042
20.870	97.172
20.977	128.407
21.154	129.833
21.154	144.029
21.189	122.737
21.296	111.385
21.473	129.846
21.650	138.371
21.791	65.979
21.898	136.961
22.146	118.517
22.429	171.052
22.500	118.532
22.571	156.863
22.677	118.539
22.783	139.836
22.819	156.873
22.819	112.866
22.996	141.265
22.996	124.230
23.138	156.886
23.279	146.954
23.279	172.506
23.315	122.823
23.563	159.742
23.669	100.125
23.811	149.815
23.882	137.042
23.952	168.275
23.952	179.632
24.271	188.162
24.519	210.885
24.590	156.945
24.626	182.498
24.732	202.376
24.767	191.021
24.909	191.027
24.909	179.670
24.980	233.616
24.980	199.547
25.051	155.544
25.192	199.556
25.192	191.038
25.299	227.951
25.334	216.596
25.440	216.600
25.547	230.800
25.830	240.749
25.865	199.583
25.972	209.524
26.007	281.923
26.007	232.239
26.007	218.043
26.043	252.114
26.220	225.149
26.361	188.247
26.397	280.519
26.397	253.548
26.716	276.274
26.751	226.590
26.822	240.789
27.034	247.895
27.034	233.700
27.034	216.665
27.105	276.289
27.212	267.776
27.212	242.224
27.353	257.845
27.460	279.143
27.495	257.851
27.601	242.240
27.672	259.278
27.778	333.099
27.778	289.093
27.778	300.449
27.778	236.569
27.920	350.139
27.955	237.996
28.062	289.104
28.097	333.112
28.097	280.588
28.239	299.048
28.310	310.408
28.381	293.376
28.451	362.937
28.522	314.675
28.522	297.640
28.664	344.491
28.770	259.322
28.841	328.883
28.877	291.976
28.877	270.683
28.947	370.055
28.983	338.826
29.054	401.290
29.089	353.026
29.231	370.066
29.231	299.089
29.231	291.991
29.337	326.064
29.372	371.492
29.620	378.600
29.798	327.503
29.798	340.279
29.798	299.112
29.939	327.508
29.939	340.284
30.046	353.065
30.152	330.356
30.223	361.589
30.364	328.945
30.400	323.268
30.471	321.852
30.506	404.188
30.506	381.475
30.577	328.954
30.719	327.540
30.789	482.275
31.073	401.371
31.073	346.009
31.215	419.831
31.250	317.625
31.463	401.387
31.781	451.085
31.852	419.857
32.065	398.573
32.277	429.811
32.277	401.420
32.313	449.687
32.454	489.440
32.454	502.216
32.525	429.822
32.525	360.263
32.667	472.414
32.702	503.646
32.773	488.033
32.809	419.896
33.057	478.108
33.305	463.923
33.659	530.656
33.730	513.624
33.801	560.473
33.836	551.957
33.836	478.140
34.013	520.734
34.013	478.147
34.013	471.049
34.084	540.610
34.190	634.305
34.190	590.299
34.509	571.858
34.615	550.569
34.722	571.866
34.757	662.720
34.863	571.872
34.934	523.610
35.005	662.730
35.005	642.856
35.040	593.173
35.040	577.558
35.253	571.888
35.288	649.965
35.359	560.536
35.678	682.631
35.784	772.067
35.997	691.161
35.997	651.413
36.068	634.382
36.316	638.650
36.528	719.574
36.564	611.689
36.741	738.037
37.024	721.013
37.060	750.826
37.131	738.053
37.308	638.691
37.414	843.111
37.485	760.780
37.804	803.379
37.804	762.212
38.052	750.866
38.548	634.482
38.831	854.525
39.008	792.072
39.008	782.135
39.008	742.387
39.291	865.900
39.433	867.326
39.539	884.365
39.575	671.432
40.000	782.175];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Panc2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Ri = weights.Ri * 0;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6KV72'; % Cat of Life
metaData.links.id_ITIS = '643997'; % ITIS
metaData.links.id_EoL = '46568959'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocanthus'; % Wikipedia
metaData.links.id_ADW = 'Gymnocanthus_herzensteini'; % ADW
metaData.links.id_Taxo = '175537'; % Taxonomicon
metaData.links.id_WoRMS = '274373'; % WoRMS
metaData.links.id_fishbase = 'Gymnocanthus-herzensteini'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnocanthus}}';
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
bibkey = 'Panc2010'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945210040028}, ' ...
'author = {V. V. Panchenko}, ' ... 
'year = {2010}, ' ...
'title = {Age and Growth of Far Eastern Staghorn Sculpin \emph{Gymnocanthus herzensteini} ({C}ottidae) in {P}eter the {G}reat {B}ay (the {S}ea of {J}apan)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {50}, ' ...
'pages = {295-300}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnocanthus-herzensteini.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

